package com.morelean.mcmes.moOrder;

import java.sql.Types;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class GetGroupMItem implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		List<Map> dataList = new ArrayList<Map>();
		List<Map> resList = new ArrayList<Map>();
		LinkedHashSet<String> gCodeMap = new LinkedHashSet<String>();
		String caId = req.getParameter("caId").trim();
		String modelCode = req.getParameter("modelCode");//机种
		String routeCode = null;
		String gCode = null;
		String gCodeArr = null;
		String sqlRount = "SELECT CT_ROUTE_CODE FROM T_CO_TECHNICS  WHERE CT_ID = ?";
		dataList = modelService.listDataSql(sqlRount, new Object[]{caId});
		routeCode = String.valueOf(dataList.get(0).get("CT_ROUTE_CODE"));
		String sqlGrount = "SELECT CRC_GROUP_CODE FROM T_CO_ROUTE_CONTROL  WHERE CR_ROUTE_ID = ? ";
		dataList = modelService.listDataSql(sqlGrount, new Object[]{routeCode});
		for(int i = 0;i<dataList.size();i++){
			gCodeMap.add(String.valueOf(dataList.get(i).get("CRC_GROUP_CODE")));
		}
        String sqlWhere = "";
        Object[] obj = null;
        int[] obj2 = null;
        if(StringUtils.isNotBlank(modelCode)){
        	sqlWhere = " AND T.CTI_MODEL_CODE = ?  ";
    		obj = new Object[gCodeMap.size()+1];
    		obj2 = new int[gCodeMap.size()+1]; 
    		obj[gCodeMap.size()+1] = modelCode;
    		obj2[gCodeMap.size()+1] = Types.VARCHAR;
        }else{
    		obj = new Object[gCodeMap.size()];
    		obj2 = new int[gCodeMap.size()];        	
        }

		int i = 0;
        for(String s:gCodeMap){
        	obj[i] = s;
        	obj2[i] = Types.VARCHAR;
        	gCode ="?";
        	if(gCodeArr==null){
        		gCodeArr = gCode;
        	}else{
        		gCodeArr =gCodeArr +","+gCode;
        	}
        	i++;
        }

		String sql = "SELECT T.CTI_MODEL_CODE,T2.CI_ITEM_NAME AS CTI_MODEL_NAME,T2.CI_ITEM_SPEC AS CTI_MODEL_SPET,T3.VALUE AS CTI_ITEM_TYPE,T.CTI_ITEM_CODE,T4.VALUE AS CTI_PRODUCT_STEP," +
				"T5.VALUE AS CTI_PROCESS_FACE,T6.GROUP_NAME AS CTI_GROUP,CTI_ASSB_QTY,T7.VALUE AS CTI_CONTROL_MODE,T8.VALUE AS CTI_ITEM_SOURCE," +
				"T9.NAME AS CREATE_USER,TO_CHAR(T.CREATE_TIME,'YYYY-MM-DD HH24:MI:SS') AS CREATE_TIME," +
				"T10.ASSISTANTTOOLNAME,T10.ASSISTANTTOOLSPEC,T11.CI_ITEM_NAME,T11.CI_ITEM_SPEC" +
				" FROM T_CO_TECH_ITEM T " +
				"LEFT JOIN T_CO_ITEM T2 ON T2.CI_ITEM_CODE = T.CTI_MODEL_CODE " +
				"LEFT JOIN SY_DICT_VAL T3 ON T3.CODE = T.CTI_ITEM_TYPE AND T3.DICT_CODE = 'CTI_ITEM_TYPE' " +
				"LEFT JOIN SY_DICT_VAL T4 ON T4.CODE = T.CTI_PRODUCT_STEP AND T4.DICT_CODE = 'PROJECT_STEP' " +
				"LEFT JOIN SY_DICT_VAL T5 ON T5.CODE = T.CTI_PROCESS_FACE AND T5.DICT_CODE = 'CT_PROCESS_FACE' " +
				"LEFT JOIN T_CO_GROUP T6 ON T6.GROUP_CODE = T.CTI_GROUP " +
				"LEFT JOIN SY_DICT_VAL T7 ON T7.CODE = T.CTI_CONTROL_MODE AND T7.DICT_CODE = 'CONTROL_MO' " +
				"LEFT JOIN SY_DICT_VAL T8 ON T8.CODE = T.CTI_ITEM_SOURCE AND T8.DICT_CODE = 'CTI_ITEM_SOURCE' " +
				"LEFT JOIN SY_USER T9 ON T9.ID = T.CREATE_USER " +
				"LEFT JOIN T_CO_ASSISTANTTOOL T10 ON T10.ASSISTANTTOOLNO = T.CTI_ITEM_CODE AND T.CTI_ITEM_TYPE = '1' " +
				"LEFT JOIN T_CO_ITEM T11 ON T11.CI_ITEM_CODE = T.CTI_ITEM_CODE AND T.CTI_ITEM_TYPE = '0' " +
				"WHERE T.CTI_GROUP IN ("+gCodeArr+") ";
		resList = modelService.listSql(
		          sql+sqlWhere,
		          modelAction.getPage(), null, obj, obj2,
		          null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(resList);
		return BaseActionSupport.AJAX;
	}

	
}
