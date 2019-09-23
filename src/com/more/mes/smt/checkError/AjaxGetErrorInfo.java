package com.more.mes.smt.checkError;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 根据检验单对应的检验阶别及检验类型获取对应的不良品处理方式 以及 检测项目信息
 * 
 * @author development
 */
public class AjaxGetErrorInfo implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("dataAuth");
    String testStep = request.getParameter("testStep");// 检测阶别
    String sampleType = request.getParameter("sampleType");// 检测类型
    String qieSn = request.getParameter("qieSn");// 物料/产品SN
    String inspectSn = request.getParameter("inspectSn");// 检验单号
    Map<String, String> map = new HashMap<String, String>();
    String sql = "SELECT t.qsc_pricess_mode FROM T_QM_SAMPLE_CONFIG t "
                 + "WHERE t.qsc_test_step=? AND t.qsc_sample_type=? and t.data_auth =?";
    List<Map> sList = modelService.listDataSql(sql, new Object[] {testStep, sampleType,dataAuth});
    if (!sList.isEmpty() && sList != null)
    {

      if (sList.get(0).get("QSC_PRICESS_MODE") == null)
      { // 没有取到对应的处理方式则取默认的
        String sql1 = "SELECT t.qsc_pricess_mode FROM T_QM_SAMPLE_CONFIG t "
                      + "WHERE t.qsc_test_step=? AND t.qsc_default_flag='Y'   and t.data_auth =?";
        List<Map> sList1 = modelService.listDataSql(sql1, new Object[] {testStep,dataAuth});
        if ( sList1 != null&&!sList1.isEmpty() ) {
	        if (sList1.get(0).get("QSC_PRICESS_MODE") == null)
	        {// 没有取到默认的方式
	          map.put("handleRes", "getErr");
	        }
	        else
	        {
	          map.put("handleType", (String)sList1.get(0).get("QSC_PRICESS_MODE"));
	          map.put("handleRes", "getSucc");
	        }
        }
      }
      else
      {
        map.put("handleType", (String)sList.get(0).get("QSC_PRICESS_MODE"));
        map.put("handleRes", "getSucc");
      }
      if (map.get("handleRes").equals("getSucc"))
      { // 如果取到了处理方式则获取检测项目信息
        String sql2 = "SELECT t.qii_error_code,t.qii_item_type,t.qii_item_name,t.qii_test_result,t.qii_error_grade,"
                      + "a.cec_name error_name,b.value ITEM_TYPE,c.value TEST_RESULT,d.value ERROR_GRADE "
                      + "FROM T_QM_INSPECT_ITEM_INFO t "
                      + "LEFT JOIN t_co_error_code a ON a.cec_code=t.qii_error_code "
                      + "LEFT JOIN sy_dict_val b ON b.code=t.qii_item_type AND b.dict_code='QTI_ITEM_TYPE' "
                      + "LEFT JOIN sy_dict_val c ON c.code=t.qii_test_result AND c.dict_code='TEST_RESULT' "
                      + "LEFT JOIN sy_dict_val d ON d.code=t.qii_error_grade AND d.dict_code='QMS_ERROR_GRADE' "
                      + "WHERE t.qii_sn=? AND t.qii_inspect_sn=? and t.data_auth=? and a.data_auth=? ";
        List<Map> sList2 = modelService.listDataSql(sql2, new Object[] {qieSn, inspectSn,dataAuth,dataAuth});
        CommMethod.listToEscapeJs(sList2);
        modelAction.setAjaxList(sList2);
      }
    }
    CommMethod.mapToEscapeJs(map);
    modelAction.setAjaxMap(map);
    return BaseActionSupport.AJAX;
  }

}
