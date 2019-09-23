package com.more.mes.smt.qualityTest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取物料/产品信息
 * 
 * @author development
 */
public class AjaxGetItemEditInfo implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String type = request.getParameter("type");
    String dataAuth = CommMethodMc.getDataAuthBySession(request);
    Map<String, Object> paraMap = new HashMap<String, Object>();
    String checkNo = request.getParameter("checkNo");// 检验单号
    if(type != null && !type.trim().equals("") && type.equals("showDetail")){
        dataAuth = request.getParameter("dataAuth");
    }
    String sql = "select A.* "
                 + " from (select t.id, "
                 + " t.qip_sn,t.qip_doc_num, "
                 + " t.qip_test_result,t.qip_inspect_flag,t.qip_sample_num, "
                 + " t.qip_inspect_sn, "
                 + " t.qip_item_num, "
                 + " t.qip_test_num, "
                 + " t.qip_error_num, "
                 + " t.qip_scarp_num,t.qip_item_code,t.qip_sample_flag, "
                 + " t.qip_test_flag,t1.name qip_test_emp, "
                 + " to_char(t.qip_test_time, 'yyyy-mm-dd hh24:mi:ss') TEST_TIME "
                 + " from t_qm_insepct_parent_info t "
                 + " left join sy_user t1 "
                 + " on t.qip_test_emp = t1.id where 1=1  and t.qip_inspect_sn = :qip_inspect_sn and t.data_auth = :data_auth order by t.QIP_TEST_TIME desc) A "
                 + " where 1 = 1 ";
    paraMap.put("qip_inspect_sn", checkNo);
    paraMap.put("data_auth", dataAuth);
    List trackingList = modelService.listSql(sql, modelAction.getPage(), paraMap, null, null);
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listToEscapeJs(trackingList);
    modelAction.getAjaxPage().setDataList(trackingList);
    return BaseActionSupport.AJAX;
  }

}
