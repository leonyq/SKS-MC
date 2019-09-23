package com.more.mes.smt.modelchecked.pg;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存修改的机种检测类型信息
 * 
 * @author development
 */
public class SaveEditCheckTypeInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      String modelCode = request.getParameter("myModelCode");// 机种
      String step = request.getParameter("myTestStep");// 检测阶别
      String QMT_SAMPLE_TYPE = request.getParameter("mySampleType");// 检测类型
      String[] itemTypes = request.getParameterValues("itemType");// 项目类型
      String[] samplePlans = request.getParameterValues("samplSelect");// 抽样方案
      String[] errorGrades = request.getParameterValues("errorSelect");// 缺陷等级
      String[] testLevels = request.getParameterValues("testLevelSelect");// 检查水平
      String[] testGrades = request.getParameterValues("testGradeSelect");// 水平等级
      String[] AQLValues = request.getParameterValues("AQLValue");// AQL值
      String[] fullSelects = request.getParameterValues("fullSelect");// 全检标志
      String[] thresholds = request.getParameterValues("threshold");// 全检阈值

      int len = samplePlans.length;
      // 检测阶别+机种+项目类型+缺陷等级 进行唯一性校验
      for (int i = 0; i < len; i++ )
      {
        for (int j = i + 1; j < len; j++ )
        {
          if (Integer.parseInt(itemTypes[i]) == Integer.parseInt(itemTypes[j])
              && Integer.parseInt(errorGrades[i]) == Integer.parseInt(errorGrades[j]))
          {
            return modelAction.alertParentInfo(modelAction.getText("同一机种、检测阶别下的项目类型与缺陷等级不能相同"));
          }
        }
      }

      // 先删除当前机种下的信息
      ArrayList<Object> paraList = new ArrayList<Object>();
      TableDataMapExt modTable1 = new TableDataMapExt();
      CommMethod.editSysDefCol(modTable1.getColMap(), modelAction.getUser());
      modTable1.setTableName("T_QM_MODEL_TYPE");
      // modTable1.setSqlWhere(" and QMT_MODEL_CODE='" + modelCode + "'");
      modTable1.setSqlWhere(" and QMT_MODEL_CODE= ? ");
      paraList.add(modelCode);
      modTable1.setSqlWhereArgs(paraList);
      modelService.del(modTable1);

      TableDataMapExt modTable = new TableDataMapExt();
      modTable.setTableName("T_QM_MODEL_TYPE");
      for (int i = 0; i < len; i++ )
      {
        float aqlValNum = 0;
        int thresholdNum = 0;
        if (!StringUtils.isBlank(AQLValues[i]))
        {
          aqlValNum = Float.parseFloat(AQLValues[i]);
        }
        if (!StringUtils.isBlank(thresholds[i]))
        {
          thresholdNum = Integer.parseInt(thresholds[i]);
        }
        CommMethod.addSysDefCol(modTable.getColMap(), modelAction.getUser());
        modTable.getColMap().put("ID", StringUtils.getUUID());
        modTable.getColMap().put("QMT_MODEL_CODE", modelCode);
        modTable.getColMap().put("QMT_TEST_STEP", step);
        modTable.getColMap().put("QMT_SAMPLE_TYPE", QMT_SAMPLE_TYPE);
        modTable.getColMap().put("QMT_ITEM_TYPE", itemTypes[i]);
        modTable.getColMap().put("QMT_SAMPLE_PLAN", samplePlans[i]);
        modTable.getColMap().put("QMT_ALQ_VALUE", aqlValNum);
        modTable.getColMap().put("QMT_ERROR_GRADE", errorGrades[i]);
        modTable.getColMap().put("QMT_TEST_LEVEL", testLevels[i]);
        modTable.getColMap().put("QMT_TEST_GRADE", testGrades[i]);
        modTable.getColMap().put("QMT_FULL_FLAG", fullSelects[i]);
        modTable.getColMap().put("QMT_THRESHOLD", thresholdNum);
        if (dataAuth != null)
        {
          modTable.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.save(modTable);
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
  }

}
