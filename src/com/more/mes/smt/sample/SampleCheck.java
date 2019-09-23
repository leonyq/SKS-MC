package com.more.mes.smt.sample;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

public class SampleCheck implements ValidateFuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  /**
   * @param formId
   * @param paraMap
   * @param modelService
   * @param modelAction
   * @param objs
   * @return
   * @see com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService#valJavaFun(java.lang.String,
   *      java.util.Map, com.more.fw.core.dbo.model.service.ModelService,
   *      com.more.fw.core.base.core.action.ModelAction, java.lang.Object[])
   */
  @Override
  public OperResult valJavaFun(String formId, Map paraMap, ModelService modelService,
                               ModelAction modelAction, Object... objs)
  {
    String testStep = (String)paraMap.get("QSP_TEST_STEP");
    String planName = (String)paraMap.get("QSP_PLAN_NAME");

    String QSP_DEFAULT_FLAG = (String)paraMap.get("QSP_DEFAULT_FLAG");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String dataid = modelAction.getDataId();
    String sql = "select ID from t_qm_sampling_plan where QSP_TEST_STEP=? and QSP_PLAN_NAME=? and DATA_AUTH=? ";
    List subList = modelService.listDataSql(sql, new Object[] {testStep, planName,dataAuth});
    if (subList != null && subList.size() > 0)
    {
      if (!StringUtils.isEmpty(dataid) && subList.size() == 1)
      {
        String id1 = (String)((Map)subList.get(0)).get("ID");
        if (!dataid.equals(id1))
        {
          return new OperResult(false, modelAction.getText("同个检测阶别下抽样方案不能重复"));
        }
      }
      else
      {
        return new OperResult(false, modelAction.getText("同个检测阶别下抽样方案不能重复"));
      }
    }
    if (!"Y".equals(QSP_DEFAULT_FLAG)) return new OperResult(true);
    sql = "SELECT T.ID FROM t_qm_sampling_plan T WHERE QSP_TEST_STEP=? AND T.QSP_DEFAULT_FLAG='Y' AND T.DATA_AUTH=? ";
    subList = modelService.listDataSql(sql, new Object[] {testStep,dataAuth});
    if (subList != null && subList.size() > 0)
    {
      if (!StringUtils.isEmpty(dataid) && subList.size() == 1)
      {
        String id1 = (String)((Map)subList.get(0)).get("ID");
        if (!dataid.equals(id1))
        {
          return new OperResult(false, modelAction.getText("同个检测阶别下只能存在一个默认抽样方案"));
        }
      }
      else
      {
        return new OperResult(false, modelAction.getText("同个检测阶别下只能存在一个默认抽样方案"));
      }
    }

    return new OperResult(true);
  }
}
