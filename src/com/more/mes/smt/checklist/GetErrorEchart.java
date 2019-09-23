package com.more.mes.smt.checklist;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 品质检验单 获取不良排行
 * @author development
 *
 */
public class GetErrorEchart implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		List<Map> dataList = new ArrayList<Map>();
		Map<String,Object> dataMap = new HashMap<String, Object>();
		List<Map> resList = new ArrayList<Map>();
		Map<String,Object> resMap = new HashMap<String, Object>();		
		HttpServletRequest req = modelAction.getRequest();
		int oneCount = 0;
		int totalCount = 0;
		DecimalFormat df = new DecimalFormat("#.00");
		String per = null;
		String errorName = null;
		String itemCode = req.getParameter("itemCode");
		String sqlItem = "SELECT T1.QII_INSPECT_SN,T2.SUPPLIER_NAME,T3.CUSTOMER,T4.VALUE AS QII_INSEPCT_RESULT" +
				" FROM T_QM_INSPECT_INFO T1 " +
				"LEFT JOIN T_CO_SUPPLIER T2 ON T2.SUPPLIER_CODE = T1.QII_CUST_CODE " +
				"LEFT JOIN T_CO_CUSTOMER T3 ON T3.CUST_CODE = T1.QII_CUST_CODE " +
				"LEFT JOIN SY_DICT_VAL T4 ON T4.CODE = T1.QII_INSEPCT_RESULT AND T4.DICT_CODE = 'INSEPCT_RESULT' " +
				"WHERE T1.QII_ITEM_CODE = ?";	
		List<Map> itemList = modelService.listDataSql(sqlItem,new Object[]{itemCode});
		if(itemList==null || itemList.isEmpty()){
			CommMethod.listToEscapeJs(resList);
			modelAction.setAjaxList(resList);
			return BaseActionSupport.AJAX;
		}
		String docSn = "";
		String sqlWhere = null;
		Object[] obj = new Object[itemList.size()];
		for(int i=0;i<itemList.size();i++){
			if(sqlWhere==null){
				sqlWhere = "?";
			}else{
				sqlWhere =  sqlWhere + "," + "?";
			}
			obj[i] = String.valueOf(itemList.get(i).get("QII_INSPECT_SN"));
		}
		String sql = "SELECT CEC_NAME, QII_ERROR_NUM "+
  "FROM (SELECT T2.CEC_NAME, SUM(T1.QII_ERROR_NUM) AS QII_ERROR_NUM "+
          "FROM T_QM_INSPECT_ITEM_INFO T1 "+
          "LEFT JOIN T_CO_ERROR_CODE T2 "+
            "ON T1.QII_ERROR_CODE = T2.CEC_CODE "+
         "WHERE T1.QII_INSPECT_SN IN ("+sqlWhere+") "+
         "GROUP BY T2.CEC_NAME) aa "+
 "WHERE QII_ERROR_NUM IS NOT NULL "+
 "ORDER BY QII_ERROR_NUM DESC ";
		dataList = modelService.listDataSql(sql,obj);
		for(int i =0;i<dataList.size();i++){
			if(i==10){
				break;
			}
			dataMap = dataList.get(i);
			oneCount =  Integer.valueOf(String.valueOf(dataMap.get("QII_ERROR_NUM")));
			totalCount = totalCount + oneCount;
		}
		for(int i =0;i<dataList.size();i++){
			if(i==10){
				break;
			}
			dataMap = dataList.get(i);
			oneCount =  Integer.valueOf(String.valueOf(dataMap.get("QII_ERROR_NUM")));
			errorName = String.valueOf(dataMap.get("CEC_NAME"));
			if(totalCount==0){
				per ="0.00";
			}else{
				per =df.format(((double)oneCount/(double)totalCount)*100);
			}
			
			resMap = new HashMap<String, Object>();
			resMap.put("ENAME", errorName);
			resMap.put("ENUM", oneCount);
			resMap.put("EPER", per);
			resList.add(resMap);
		}
		CommMethod.listToEscapeJs(resList);
		modelAction.setAjaxList(resList);
		return BaseActionSupport.AJAX;
	}

}
