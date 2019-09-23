package com.more.mes.smt.samplingplan.service;

import java.util.List;
import java.util.Map;

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

public class SaveSamplingPlanService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");

    String testStep = request.getParameter("paraMap1@0#QMS_TEST_STEP"); // 检测阶别
    String modelCode = request.getParameter("paraMap1@0#QMS_MODEL_CODE"); // 机种
    String samplePlan = request.getParameter("paraMap1@0#QMS_SAMPLE_PLAN"); // 抽样方案ID
    String aqlVal = request.getParameter("paraMap1@0#QMS_ALQ_VALUE"); // AQL值
    String errorGrade = request.getParameter("paraMap1@0#QMS_ERROR_GRADE"); // 缺陷等级
    String defFlag = request.getParameter("paraMap1@0#QMS_DEFAULT_FLAG"); // 默认标志
    String testLevel = request.getParameter("paraMap1@0#QMS_TEST_LEVEL"); // 检验水平
    String testGrade = request.getParameter("paraMap1@0#QMS_TEST_GRADE"); // 水平等级
    String fullFlag = request.getParameter("paraMap1@0#QMS_FULL_FLAG"); // 全检标志
    String threshold = request.getParameter("paraMap1@0#QMS_THRESHOLD"); // 全检阈值
    String sampleType = request.getParameter("paraMap1@0#QMS_SAMPLE_TYPE"); // 检验类型

    String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");// 是否关闭窗口

    // 缺陷等级下机种抽样方案唯一
    String sql = "select id from T_QM_MODEL_SCHEME where rownum=1 and QMS_ERROR_GRADE=? and QMS_MODEL_CODE=? "
                 + "and QMS_TEST_STEP=? and QMS_SAMPLE_TYPE=?";
    List list1 = modelService.listDataSql(sql, new Object[] {errorGrade, modelCode, testStep,
      sampleType});
    if (list1 != null && !list1.isEmpty())
    {
      return modelAction.alertParentInfo((modelAction.getText("该检测阶别、检测类型、缺陷等级下机种" + modelCode
                                                              + "已存在记录，请更换")));
    }

    // 阶别下默认方案唯一
    if ("Y".equals(defFlag))
    {

      String sql2 = "SELECT ID FROM T_QM_MODEL_SCHEME WHERE ROWNUM=1 AND QMS_DEFAULT_FLAG='Y' AND QMS_TEST_STEP =? and QMS_SAMPLE_TYPE=?";
      List list2 = modelService.listDataSql(sql2, new Object[] {testStep, sampleType});
      if (list2 != null && !list2.isEmpty())
      {
        return modelAction.alertParentInfo((modelAction.getText("该检测阶别、检测类型存在默认的记录,请更换")));
      }
    }
    else
    {
      defFlag = "N";
    }

    if (!"Y".equals(fullFlag))
    {
      fullFlag = "N";
    }

    TableDataMapExt td = new TableDataMapExt();
    td.setTableName("T_QM_MODEL_SCHEME");
    CommMethod.addSysDefCol(td.getColMap(), modelAction.getUser());
    Map<String, String> qmsMap = td.getColMap();
    qmsMap.put("QMS_TEST_STEP", testStep);
    qmsMap.put("QMS_MODEL_CODE", modelCode);
    qmsMap.put("QMS_SAMPLE_PLAN", samplePlan);
    qmsMap.put("QMS_ALQ_VALUE", aqlVal);
    qmsMap.put("QMS_ERROR_GRADE", errorGrade);
    qmsMap.put("QMS_DEFAULT_FLAG", defFlag);
    qmsMap.put("QMS_TEST_LEVEL", testLevel);
    qmsMap.put("QMS_TEST_GRADE", testGrade);
    qmsMap.put("QMS_FULL_FLAG", fullFlag);
    qmsMap.put("QMS_THRESHOLD", threshold);
    qmsMap.put("QMS_SAMPLE_TYPE", sampleType);
    String dataAuth = request.getParameter("_DATA_AUTH");

    if (dataAuth != null)
    {
      qmsMap.put("DATA_AUTH", dataAuth);// 组织结构
    }
    try
    {
      modelService.save(td);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);

  }
}
