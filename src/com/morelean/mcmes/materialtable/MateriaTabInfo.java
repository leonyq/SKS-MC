package com.morelean.mcmes.materialtable;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 获取关联线别或料表站明细
 * @author Administrator
 *
 */
public class MateriaTabInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String cmSn =  request.getParameter("cmSn");
		String flag = request.getParameter("flag");
		String dataId = request.getParameter("dataId");
		String dataAuth = "";
		String sql0 = "select DATA_AUTH from T_CO_MATERIAL_TABLE where id = ?";
		List<Map> dataList0 = modelService.listDataSql(sql0, new Object[] {dataId});
		dataAuth = dataList0.get(0).get("DATA_AUTH").toString();
		//String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String sqlLine = "SELECT T1.ID,T1.CML_AREA_SN,T2.CA_NAME as CML_AREA_NAME,T2.CA_PARENTAREAID,T3.CA_NAME AS CML_WORKSHOP_NAME  FROM T_CO_MATERIAL_LINE T1 " +
				"LEFT JOIN T_CO_AREA T2 ON T2.CA_ID = T1.CML_AREA_SN " +
				"LEFT JOIN T_CO_AREA T3 ON T2.CA_PARENTAREAID = T3.CA_ID " +
				"WHERE T1.CM_SN = ? AND T1.DATA_AUTH = ? AND T2.DATA_AUTH = ? AND T3.DATA_AUTH = ?  ";
		String sqlDelM = " SELECT T1.ID,T1.CMD_DEVICE_TYPE,T1.CMD_PROGRAM_NAME,T1.CMD_DEVICE_SEQ,T1.CMD_TRACK,T1.CMD_TABLE_NO,T1.CMD_LOADPOINT,T1.CMD_CHANEL_SN,T1.CMD_ITEM_CODE,T1.CMD_FEEDER_SPEC,T1.CMD_TRY_FLAG,T1.CMD_SHKIP_FLAG,T1.CMD_POINT_NUM,T1.CMD_POINT_LOCATION,T1.CMD_BOM_FLAG,T1.CMD_MEMO,T2.CI_ITEM_NAME,T2.CI_ITEM_SPEC " +
				"FROM T_CO_MATERIAL_DETAIL T1 " +
				"LEFT JOIN T_CO_ITEM T2 ON T2.CI_ITEM_CODE = T1.CMD_ITEM_CODE " +
				"WHERE T1.CM_SN " +
				"= ?  AND T1.DATA_AUTH = ? AND T2.DATA_AUTH = ? ";
		List<Map> resList = new ArrayList<Map>();
		if("Line".equals(flag)){
			resList = modelService.listDataSql(sqlLine,new Object[]{cmSn,dataAuth,dataAuth,dataAuth});
		}else if("DelM".equals(flag)){
			resList = modelService.listDataSql(sqlDelM,new Object[]{cmSn,dataAuth,dataAuth});
		}
		CommMethod.listToEscapeJs(resList);
		modelAction.setAjaxList(resList);
		return BaseActionSupport.AJAX;
	}

}
