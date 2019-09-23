package com.more.mes.smt.sampletype.service;

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

/**
 * @Description 检测项目类型新增
 * @ClassName SaveSampleTypeService
 * @author csj
 * @Company: morelean
 */
public class SaveSampleTypeService implements FuncService
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

    String testStep = request.getParameter("paraMap1@0#QST_TEST_STEP"); // 检测阶别
    String itemType = request.getParameter("paraMap1@0#QST_ITEM_TYPE"); // 项目类型
    String samplePlan = request.getParameter("paraMap1@0#QST_SAMPLE_PLAN"); // 抽样方案ID
    String aqlVal = request.getParameter("paraMap1@0#QST_ALQ_VALUE"); // AQL值
    String errorGrade = request.getParameter("paraMap1@0#QST_ERROR_GRADE"); // 缺陷等级
    String defFlag = request.getParameter("paraMap1@0#QST_DEFAULT_FLAG"); // 默认标志
    String testLevel = request.getParameter("paraMap1@0#QST_TEST_LEVEL"); // 检验水平
    String testGrade = request.getParameter("paraMap1@0#QST_TEST_GRADE"); // 水平等级
    String fullFlag = request.getParameter("paraMap1@0#QST_FULL_FLAG"); // 全检标志
    String threshold = request.getParameter("paraMap1@0#QST_THRESHOLD"); // 全检阈值
    String sampleType = request.getParameter("paraMap1@0#QST_SAMPLE_TYPE"); // 检验类型
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");// 是否关闭窗口

    // 缺陷等级下机种抽样方案唯一
    String sql = "select id from T_QM_SAMPLE_TYPE where QST_ERROR_GRADE=? "
                 + "and QST_TEST_STEP=? and QST_SAMPLE_TYPE=? and QST_ITEM_TYPE=? and QST_SAMPLE_PLAN=? and DATA_AUTH=? ";
    List list1 = modelService.listDataSql(sql, new Object[] {errorGrade, testStep, sampleType,
      itemType, samplePlan,dataAuth});
    if (list1 != null && !list1.isEmpty())
    {
      return modelAction.alertParentInfo((modelAction.getText("该组织机构、检测阶别、项目类型、抽样方案、检测类型、缺陷等级下已存在记录，请更换")));
    }

    // 阶别下默认方案唯一
    if ("Y".equals(defFlag))
    {

      String sql2 = "SELECT ID FROM T_QM_SAMPLE_TYPE WHERE QST_DEFAULT_FLAG='Y' AND QST_TEST_STEP =? and QST_SAMPLE_TYPE=? and QST_ITEM_TYPE=? and DATA_AUTH=? ";
      List list2 = modelService.listDataSql(sql2, new Object[] {testStep, sampleType, itemType,dataAuth});
      if (list2 != null && !list2.isEmpty())
      {
        return modelAction.alertParentInfo((modelAction.getText("该组织机构、检测阶别、项目类型、检测类型存在默认的记录,请更换")));
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
    td.setTableName("T_QM_SAMPLE_TYPE");
    CommMethod.addSysDefCol(td.getColMap(), modelAction.getUser());
    Map<String, Object> qmsMap = td.getColMap();
    qmsMap.put("QST_TEST_STEP", testStep);
    qmsMap.put("QST_ITEM_TYPE", itemType);
    qmsMap.put("QST_SAMPLE_PLAN", samplePlan);
    qmsMap.put("QST_ALQ_VALUE", Double.parseDouble(aqlVal));
    qmsMap.put("QST_ERROR_GRADE", errorGrade);
    qmsMap.put("QST_DEFAULT_FLAG", defFlag);
    qmsMap.put("QST_TEST_LEVEL", testLevel);
    qmsMap.put("QST_TEST_GRADE", testGrade);
    qmsMap.put("QST_FULL_FLAG", fullFlag);
    if(StringUtils.isNotBlank(threshold)){
        qmsMap.put("QST_THRESHOLD", Double.parseDouble(threshold));
    }
    qmsMap.put("QST_SAMPLE_TYPE", sampleType);


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
