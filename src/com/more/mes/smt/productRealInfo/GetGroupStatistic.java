package com.more.mes.smt.productRealInfo;


import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class GetGroupStatistic implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String moNumber = CommMethod.escapeJs(request.getParameter("moNumber"));
		//根据制令单获取序生产统计数据
        String querySql = "SELECT Distinct T.MGS_MO_NUMBER,A.GROUP_NAME,T.MGS_GROUP_CODE," +
        		//"T.MGS_OK_PCS+T.MGS_T_OK_PCS AS PASSNUM,T.MGS_T_OK_PCS,T.MGS_NG_PCS,T.MGS_T_NG_PCS," +
        		"T.MGS_SCRAP_QTY,T.MGS_GROUP_SEQ " +
        		"FROM T_MID_GROUP_STATISTIC T " +
        		"LEFT JOIN T_CO_GROUP A ON A.GROUP_CODE = T.MGS_GROUP_CODE ";
		String sqlWhere=" and T.MGS_MO_NUMBER = ? ";
        List listParam = new ArrayList();
        listParam.add(moNumber);
        List<Map> itemList = modelService.listSql(querySql, null, sqlWhere, listParam, " ORDER BY T.MGS_GROUP_SEQ ",null);
        String MGS_MO_NUMBER = null;
        String MGS_GROUP_CODE = null;
        String MGS_GROUP_SEQ = null;
        Map<Object, Object> map = null;
        List<Map> countList = new ArrayList<Map>();
        countList.addAll(itemList);
        int listSize = itemList.size();
        //汇总生产统计数据
        String sql = "SELECT SUM(T.MGS_OK_PCS+T.MGS_T_OK_PCS) AS PASSNUM,SUM(T.MGS_T_OK_PCS) MGS_T_OK_PCS," +
        		"SUM(T.MGS_NG_PCS) MGS_NG_PCS,SUM(T.MGS_T_NG_PCS) MGS_T_NG_PCS " +
        		"FROM T_MID_GROUP_STATISTIC T " +
        		"WHERE T.MGS_MO_NUMBER = ? AND T.MGS_GROUP_CODE = ? AND T.MGS_GROUP_SEQ = ? ";
        //根据制令单、工序、工序顺序获取产品在制数量
        String countSql = "SELECT nvl(SUM(WT_NUM),0) WIP_NUM FROM T_WIP_TRACKING B " +
        		"WHERE B.WT_MO_NUMBER = ? AND B.WT_GROUP_CODE = ? "+
        		"AND B.WT_GROUP_SEQ = ?";
        if(itemList!=null&&listSize>0){
        	List<Map> sunList = null;
	        for(int i=0;i<listSize;i++){
	        	MGS_MO_NUMBER = (String) itemList.get(i).get("MGS_MO_NUMBER");
	        	MGS_GROUP_CODE = (String) itemList.get(i).get("MGS_GROUP_CODE");
	        	MGS_GROUP_SEQ = (String) itemList.get(i).get("MGS_GROUP_SEQ");
	        	map = modelService.queryForMap(countSql, new Object[] { MGS_MO_NUMBER,MGS_GROUP_CODE,MGS_GROUP_SEQ });
	        	sunList = modelService.listDataSql(sql, new Object[] { MGS_MO_NUMBER,MGS_GROUP_CODE,MGS_GROUP_SEQ });
	        	countList.get(i).put("WIP_NUM", map.get("WIP_NUM"));
	        	countList.get(i).put("PASSNUM", sunList.get(0).get("PASSNUM"));
	        	countList.get(i).put("MGS_T_OK_PCS", sunList.get(0).get("MGS_T_OK_PCS"));
	        	countList.get(i).put("MGS_NG_PCS", sunList.get(0).get("MGS_NG_PCS"));
	        	countList.get(i).put("MGS_T_NG_PCS", sunList.get(0).get("MGS_T_NG_PCS"));
	        }
        }
        CommMethod.listToEscapeJs(countList);
        modelAction.setAjaxList(countList);

		return BaseActionSupport.AJAX;
	}

}
