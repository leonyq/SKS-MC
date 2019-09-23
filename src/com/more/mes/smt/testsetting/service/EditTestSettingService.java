package com.more.mes.smt.testsetting.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 检验配置修改
 * @author Administrator
 *
 */
public class EditTestSettingService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings({ "unchecked", "rawtypes" })
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

    String sampleType = request.getParameter("paraMapObj.QSC_SAMPLE_TYPE"); // 检验类型
    String testStep = request.getParameter("paraMapObj.QSC_TEST_STEP"); // 检测阶别
    String pricessMode = request.getParameter("paraMapObj.QSC_PRICESS_MODE"); // 不良品处理
    String createMode = request.getParameter("paraMapObj.QSC_CREATE_MODE"); // 生成方式
    String judgeMode = request.getParameter("paraMapObj.QSC_JUDGE_MODE"); // 判定方式
    String divideMode = request.getParameter("paraMapObj.QSC_DIVIDE_MODE"); // 批次划分方式
    String divideVal = request.getParameter("paraMapObj.QSC_DIVIDE_VALUE"); // 对应值
    String normalRelax = request.getParameter("paraMapObj.QSC_NORMAL_RELAX"); // 正常-放宽
    String relaxNormal = request.getParameter("paraMapObj.QSC_RELAX_NORMAL"); // 放宽-正常
    String strictNum = request.getParameter("paraMapObj.QSC_STRICT_NUM"); // 加严不合格批次
    String strictTotal = request.getParameter("paraMapObj.QSC_STRICT_TOTAL"); // 加严计算批次
    String strictNormal = request.getParameter("paraMapObj.QSC_STRICT_NORMAL"); // 加严-正常
    String autoExamine = request.getParameter("paraMapObj.QSC_AUTO_EXAMINE"); // 自动审核
    String defFlag = request.getParameter("paraMapObj.QSC_DEFAULT_FLAG"); // 默认标志
    String ctrlFlag = request.getParameter("paraMapObj.QSC_CTRL_FLAG"); // 加严放宽标志
    String createRule = request.getParameter("paraMapObj.QSC_CREATE_RULE");//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String infoId = modelAction.getDataId();

    // 缺陷等级下机种抽样方案唯一
    String sql = "SELECT ID FROM T_QM_SAMPLE_CONFIG WHERE QSC_TEST_STEP=? AND QSC_SAMPLE_TYPE=? AND ID!=? AND DATA_AUTH=?  ";
    List list1 = modelService.listDataSql(sql, new Object[] {testStep, sampleType, infoId,dataAuth});
    if (list1 != null && !list1.isEmpty())
    {
      return modelAction.alertParentInfo((modelAction.getText("该检测阶别、检测类型已存在记录，请更换")));
    }

    // 阶别下默认方案唯一
    if ("Y".equals(defFlag))
    {
      String sql2 = "SELECT ID FROM T_QM_SAMPLE_CONFIG WHERE QSC_DEFAULT_FLAG='Y' AND QSC_TEST_STEP =? AND DATA_AUTH =? AND ID!=? ";
      List list2 = modelService.listDataSql(sql2, new Object[] {testStep,dataAuth,infoId});
      if (list2 != null && !list2.isEmpty())
      {
        return modelAction.alertParentInfo((modelAction.getText("该检测阶别存在默认的记录,请更换")));
      }
    }
    else
    {
      defFlag = "N";
    }

    if (!"Y".equals(autoExamine))
    {
      autoExamine = "N";
    }

    if (!"Y".equals(ctrlFlag))
    {
      ctrlFlag = "N";
    }

    TableDataMapExt td = new TableDataMapExt();
    td.setTableName("T_QM_SAMPLE_CONFIG");
    td.setSqlWhere("and ID=? ");
    ArrayList delList = new ArrayList();
    delList.add(infoId);
    td.setSqlWhereArgs(delList);
    Map<String, Object> qscMap = td.getColMap();
    qscMap.put("QSC_SAMPLE_TYPE", sampleType);
    qscMap.put("QSC_TEST_STEP", testStep);
    qscMap.put("QSC_PRICESS_MODE", pricessMode);
    qscMap.put("QSC_CREATE_MODE", createMode);
    qscMap.put("QSC_JUDGE_MODE", judgeMode);
    qscMap.put("QSC_DIVIDE_MODE", divideMode);
    qscMap.put("QSC_CREATE_RULE", createRule);
    
    if(!divideVal.equals("")){
    	qscMap.put("QSC_DIVIDE_VALUE", Double.parseDouble(divideVal));
    }else{
        qscMap.put("QSC_DIVIDE_VALUE", null);
    }
    qscMap.put("QSC_NORMAL_RELAX", Integer.parseInt(normalRelax));
    qscMap.put("QSC_RELAX_NORMAL", Integer.parseInt(relaxNormal));
    qscMap.put("QSC_STRICT_NUM", Integer.parseInt(strictNum));
    qscMap.put("QSC_STRICT_TOTAL", Integer.parseInt(strictTotal));
    qscMap.put("QSC_STRICT_NORMAL", Integer.parseInt(strictNormal));
    qscMap.put("QSC_AUTO_EXAMINE", autoExamine);
    qscMap.put("QSC_DEFAULT_FLAG", defFlag);
    qscMap.put("QSC_CTRL_FLAG", ctrlFlag);
   // String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    if (dataAuth != null)
    {
      qscMap.put("DATA_AUTH", dataAuth);// 组织结构
    }
    try
    {
      modelService.edit(td);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
  }
}
