package com.more.mes.smt.modelchecked;

import java.text.DecimalFormat;
import java.util.List;

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
 * 保存机种检测类型信息
 * 
 * @author development
 */
public class SaveCheckTypeInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("_DATA_AUTH");
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      String modelCode = request.getParameter("modelCode");// 机种
      String step = request.getParameter("paraMap1@0#QMT_TEST_STEP");// 检测阶别
      String qmtSampleType = request.getParameter("paraMap1@0#QMT_SAMPLE_TYPE");// 检测类型
      String itemGenre = request.getParameter("itemGenre");
      String[] itemTypes = request.getParameterValues("itemType");// 项目类型
      String[] samplePlans = request.getParameterValues("samplSelect");// 抽样方案
      String[] errorGrades = request.getParameterValues("errorSelect");// 缺陷等级
      String[] testLevels = request.getParameterValues("testLevelSelect");// 检查水平
      String[] testGrades = request.getParameterValues("testGradeSelect");// 水平等级
      String[] AQLValues = request.getParameterValues("AQLValue");// AQL值
      String[] fullSelects = request.getParameterValues("fullSelect");// 全检标志
      String[] thresholds = request.getParameterValues("threshold");// 全检阈值

      int len = itemTypes.length;
      // 检测阶别+机种+项目类型+缺陷等级 进行唯一性校验
      for (int i = 0; i < len; i++ )
      {
        for (int j = i + 1; j < len; j++ )
        {
          if (Integer.parseInt(itemTypes[i]) == Integer.parseInt(itemTypes[j])
              && Integer.parseInt(errorGrades[i]) == Integer.parseInt(errorGrades[j])
              && samplePlans[i].equals(samplePlans[j]))
          {
            return modelAction.alertParentInfo(modelAction.getText("同一机种、检测阶别下的项目类型、缺陷等级、抽样方案不能相同"));
          }
        }
      }
      // 数据库中再次校验
      String sql = "select id from T_QM_MODEL_TYPE where QMT_MODEL_CODE=? and QMT_TEST_STEP=? and "
                   + "QMT_ITEM_TYPE=? and QMT_ERROR_GRADE=? and QMT_SAMPLE_PLAN=? and DATA_AUTH=?";
      List tempList = null;
      for (int i = 0; i < len; i++ )
      {
        tempList = modelService.listDataSql(sql, new Object[] {modelCode, step, itemTypes[i],
          errorGrades[i], samplePlans[i] , dataAuth});
        if (tempList != null && !tempList.isEmpty())
        {
          return modelAction.alertParentInfo(modelAction.getText("同一机种、检测阶别下的项目类型、缺陷等级、抽样方案不能相同"));
        }
      }
      TableDataMapExt modTable = new TableDataMapExt();
      modTable.setTableName("T_QM_MODEL_TYPE");
      for (int i = 0; i < len; i++ )
      {
        double aqlValNum = 0;
        int thresholdNum = 0;
        DecimalFormat dnf = new DecimalFormat("##0.0000");
        if (!StringUtils.isBlank(AQLValues[i]))
        {
          aqlValNum = Double.parseDouble((AQLValues[i]));// Float.parseFloat(AQLValues[i]);
        }
        if (!StringUtils.isBlank(thresholds[i]))
        {
          thresholdNum = Integer.parseInt(thresholds[i]);
        }
        CommMethod.addSysDefCol(modTable.getColMap(), modelAction.getUser());
        modTable.getColMap().put("ID", StringUtils.getUUID());
        modTable.getColMap().put("QMT_MODEL_CODE", modelCode);
        modTable.getColMap().put("QMT_TEST_STEP", step);
        modTable.getColMap().put("QMT_ITEM_GENRE", itemGenre);
        modTable.getColMap().put("QMT_SAMPLE_TYPE", qmtSampleType);
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
      throw new BussException(modelAction.getText("新增失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
  }
}