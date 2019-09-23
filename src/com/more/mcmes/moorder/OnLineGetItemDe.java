package com.more.mcmes.moorder;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.method.StringUtils;
/**
 * 制令单 -chakan -数据物料管控
 * 
 * 
 */
public class OnLineGetItemDe implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		List ajaxList = new ArrayList();
	  String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String modelcode = req.getParameter("modelcode");
		String maFace = req.getParameter("maFace");
	  String dataId = modelAction.getRequest().getParameter("dataId");
    Map<String, String> map1=new HashMap<String, String>();
    if(StringUtils.isNotBlank(dataId)) {
    String sqlString = "select DATA_AUTH,PM_AREA_SN,PM_PROCESS_FACE,PM_MODEL_CODE from t_pm_mo_base "
                    + "where ID = ?  ";
     map1 =modelService.queryForMap(sqlString, new Object[]{dataId});
     if(null!=map1 && map1.size()>0) {
    	  dataAuth=map1.get("DATA_AUTH");
    	     maFace=map1.get("PM_PROCESS_FACE");
     }
  
     
    }
		 
		 String sql="SELECT t2.VALUE as CTI_ITEM_TYPE, T.CTI_ITEM_CODE, B.ASSISTANTTOOLNAME  AS CI_ITEM_NAME,   "+ 
		   "B.ASSISTANTTOOLSPEC AS CI_ITEM_SPEC,  T.CTI_GROUP, T.CTI_ASSB_QTY, t3.VALUE as CTI_CONTROL_MODE, "+ 
		   "t4.VALUE as CTI_ITEM_SOURCE,   A.NAME, T.CREATE_USER, T.CREATE_TIME  "+ 
		   "FROM T_CO_TECH_ITEM T  " +
		 		"LEFT JOIN T_CO_ASSISTANTTOOL B    ON B.ASSISTANTTOOLNO = T.CTI_ITEM_CODE AND T.DATA_AUTH=B.DATA_AUTH " +
		 		"LEFT JOIN SY_USER A  ON A.ID = T.CREATE_USER " +
		 		"LEFT JOIN SY_DICT_VAL t2 on t2.CODE = T.CTI_ITEM_TYPE AND t2.dict_code = 'CTI_ITEM_TYPE' " +
		 		"LEFT JOIN SY_DICT_VAL t3 on t3.CODE = T.CTI_CONTROL_MODE AND t3.dict_code = 'CONTROL_MO' " +
		 		"LEFT JOIN SY_DICT_VAL t4 on t4.CODE = T.CTI_ITEM_SOURCE AND t4.dict_code = 'CTI_ITEM_SOURCE' "+
		 		"WHERE T.CTI_MODEL_CODE = ? AND T.CTI_PROCESS_FACE = ? "+ 
		 		"AND T.DATA_AUTH=?  ";
	        List list=modelService.listDataSql(sql, new Object[] {modelcode,maFace,dataAuth});
	        if(list == null || list.isEmpty()){
	        	modelAction.setAjaxList(ajaxList);
				return BaseActionSupport.AJAX;
	        }else{
	        	CommMethod.listToEscapeJs(list);
	        	modelAction.setAjaxList(list);
				return BaseActionSupport.AJAX;
	        }
		
	}

}
