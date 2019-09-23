package com.morelean.mcmes.craftsetting;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取ESOP
 * @author Administrator
 *
 */
public class GetEsop implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modService)
  {
    // TODO Auto-generated method stub
    
    HttpServletRequest request = modelAction.getRequest();
    
    String ctId=request.getParameter("ctId");
    String step=request.getParameter("step");
    String face=request.getParameter("face");
    String dataAuth=request.getParameter("dataAuth");
    //String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    //String dataId=request.getParameter("dataId");
    
    
//    String sqlString = "select DATA_AUTH from T_CO_TECH_MODEL "
//                   + "where CTM_ID = ?  ";
//   Map<String, String> map1 =modService.queryForMap(sqlString, new Object[]{ctId});
    
    
    String  sqlString="select distinct t4.*,t5.VALUE as STEP,t6.VALUE as FACE,T7.NAME," +
    		" to_char(t4.CREATE_TIME,'yyyy-mm-dd hh:mm:ss') as CREATE_TIMES " +
    		" from T_CO_TECH_MODEL t1 " +
    		" left join T_CO_ITEM  t3 on" +
    		" t1.CTM_MODEL_CODE = t3.CI_ITEM_CODE   and t3.DATA_AUTH=T1.DATA_AUTH " +
    		" left join T_CO_ESOP_INFO t4 on " +
    		"  t1.CTM_MODEL_CODE =t4.CSI_MODEL_CODE  " +
    		"  and t1.CTM_PRODUCT_STEP=t4.CSI_PRODUCT_STEP" +
    		" and  t1.CTM_PROCESS_FACE=t4.CSI_PROCESS_FACE and t4.DATA_AUTH=T1.DATA_AUTH  " +
    		"   left join sy_dict_val t5 on " +
    		"  t4.CSI_PRODUCT_STEP =t5.CODE " +
    		"   left join sy_dict_val t6 on " +
        "  t4.CSI_PROCESS_FACE =t6.CODE " +
        "   left join sy_user t7 on " +
        "  t4.CREATE_USER =t7.ID  " +
    		" where  T1.DATA_AUTH=? AND  t1.CTM_ID=? and t1.CTM_PROCESS_FACE=?  " +
    		" and t1.CTM_PRODUCT_STEP = ? and t5.DICT_CODE=? and t6.DICT_CODE=?    ";
    
    List<Map> list = modService.listDataSql(sqlString, new Object[]{dataAuth,ctId,face,step,"PROJECT_STEP","CT_PROCESS_FACE" });//map1.get("DATA_AUTH")
    
    
    modelAction.setAjaxList(list);
    modelAction.setAjaxString(dataAuth);
    CommMethod.listToEscapeJs(list);
    
    return BaseActionSupport.AJAX;
  }

}
