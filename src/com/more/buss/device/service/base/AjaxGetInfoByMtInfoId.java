package com.more.buss.device.service.base;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 根据设备保养id获取信息
 * @author development
 *
 */
public class AjaxGetInfoByMtInfoId implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		//String dataAuth = request.getParameter("DATA_AUTH");
		String mtId = request.getParameter("mtId");
		//根据设备保养信息id获取保养明细信息以及设备备件更换信息
		
		String sql="SELECT A.DATA_AUTH FROM T_CO_DEVICE_MT_INFO A WHERE A.ID=? ";
		List<Map> itemList = null;
	  itemList = modelService.listDataSql(sql,new Object[] {mtId});
	   
	   if(itemList!=null&&itemList.size()>0) {
    	String dataAuth=itemList.get(0).get("DATA_AUTH").toString();
		
		/*
		String querySql = "select * from T_CO_DEVICE_MT_DETAIL T ";
		String querySql1 = "select t.*,a.CI_ITEM_NAME,a.CI_ITEM_SPEC from T_CO_DEVICE_FITTING t " +
				"left join t_co_item a on a.ci_item_code = t.CDF_ITEM_CODE";
		String sqlWhere = " AND T.CDMI_ID = ? "
		  + "AND T.DATA_AUTH=(SELECT A.DATA_AUTH FROM T_CO_DEVICE_MT_INFO A WHERE A.ID=? ) ";
		String sqlWhere1 = " AND t.CDF_ID = ? "
		  + "AND T.DATA_AUTH=(SELECT A.DATA_AUTH FROM T_CO_DEVICE_MT_INFO A WHERE A.ID=? ) "
		  + "AND A.DATA_AUTH=(SELECT A.DATA_AUTH FROM T_CO_DEVICE_MT_INFO A WHERE A.ID=? )";
		  */
		String querySql = "select * from T_CO_DEVICE_MT_DETAIL T ";
    String querySql1 = "select t.*,a.CI_ITEM_NAME,a.CI_ITEM_SPEC from T_CO_DEVICE_FITTING t " +
        "left join t_co_item a on a.ci_item_code = t.CDF_ITEM_CODE AND A.DATA_AUTH=? ";
    String sqlWhere = " AND T.CDMI_ID = ? "
      + "AND T.DATA_AUTH=? ";
    String sqlWhere1 = " AND t.CDF_ID = ? "
      + "AND T.DATA_AUTH=? ";
		List listParam = new ArrayList();
		List listParam1 = new ArrayList();
        listParam.add(mtId);
        listParam.add(dataAuth);
        listParam1.add(dataAuth);
        listParam1.add(mtId);
        listParam1.add(dataAuth);
        
        List<Map> mtList = modelService.listSql(querySql, null, sqlWhere, listParam, null,null);
        List<Map> fittingList = modelService.listSql(querySql1, null, sqlWhere1, listParam1, null,null);
        Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("mtList", mtList);
        map.put("fittingList", fittingList);
        CommMethod.mapToEscapeJs(map);
        modelAction.setAjaxMap(map);
	   }
		return BaseActionSupport.AJAX;
	}

}
