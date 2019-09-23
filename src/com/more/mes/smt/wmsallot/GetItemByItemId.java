package com.more.mes.smt.wmsallot;

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
 * 调拨单通过物料id获取物料详细信息
 * 
 * @author development
 *
 */
public class GetItemByItemId implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String itemId = request.getParameter("itemId");// 物料id
		String itemCode = request.getParameter("itemCode");
		String dataAuth = request.getParameter("dataAuth");
		String docNum = request.getParameter("docNum");// 调拨单号
		String inWh = request.getParameter("inWh");// 调入仓库
		String outWh = request.getParameter("outWh");// 调出仓库
		String beginTime = request.getParameter("beginTime");
		String endTime = request.getParameter("endTime");

		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String userId = modelAction.getUser().getId();
		String sql = "SELECT distinct t.*,a.ci_item_name,a.ci_item_spec,b.wa_area_name in_wh_name,"
				+ "c.wa_area_name out_wh_name,d.name,"
				+ "to_char(t.wad_allot_time,'yyyy-mm-dd hh24:mi:ss') allot_time,E.NAME AS AUTHNAME "
				+ "FROM T_WMS_ALLOT_DETAIL t ";
		String sqlWhere = " where 1=1  ";
		Map<String, String> sqlParaMap = new HashMap<String, String>();
		if (StringUtils.isNotBlank(itemId)) {
			sqlWhere += " and t.WAD_ITEM_ID = :itemId ";
			sqlParaMap.put("itemId", itemId);
		}
		if (StringUtils.isNotBlank(itemCode)) {
			sqlWhere += " and t.wad_item_code like '%' || :itemCode || '%' ";
			sqlParaMap.put("itemCode", itemCode);
		}
		if (StringUtils.isNotBlank(dataAuth)) {
			sql += "LEFT JOIN t_co_item a ON a.ci_item_code=t.wad_item_code " + " and a.DATA_AUTH= :dataAuth1 "
					+ "LEFT JOIN T_WMS_AREA b ON b.WA_AREA_SN=t.wad_in_wh " + " and b.DATA_AUTH = :dataAuth2 "
					+ "LEFT JOIN T_WMS_AREA c ON c.WA_AREA_SN=t.wad_out_wh " + " and c.DATA_AUTH = :dataAuth3 "
					+ "LEFT JOIN SY_USER d ON d.LOGIN_NAME=t.wad_allot_emp "
					+ "LEFT JOIN SY_DEPT E ON E.ID =t.DATA_AUTH  ";

			sqlWhere += " and t.DATA_AUTH = :dataAuth ";
			sqlParaMap.put("dataAuth", dataAuth);
			sqlParaMap.put("dataAuth1", dataAuth);
			sqlParaMap.put("dataAuth2", dataAuth);
			sqlParaMap.put("dataAuth3", dataAuth);
		} else {
			sql += "LEFT JOIN t_co_item a ON a.ci_item_code=t.wad_item_code "
					+ " and a.DATA_AUTH  in( select DEPT_ID from sy_data_auth where USER_ID=:userId2 ) "
					+ "LEFT JOIN T_WMS_AREA b ON b.WA_AREA_SN=t.wad_in_wh "
					+ " and b.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId3 ) "
					+ "LEFT JOIN T_WMS_AREA c ON c.WA_AREA_SN=t.wad_out_wh "
					+ " and c.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId4 ) "
					+ "LEFT JOIN SY_USER d ON d.LOGIN_NAME=t.wad_allot_emp "
					+ "LEFT JOIN SY_DEPT E ON E.ID =t.DATA_AUTH  ";

			sqlWhere += " and t.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId1 )";
			sqlParaMap.put("userId1", userId);
			sqlParaMap.put("userId2", userId);
			sqlParaMap.put("userId3", userId);
			sqlParaMap.put("userId4", userId);
		}
		if (StringUtils.isNotBlank(docNum)) {
			sqlWhere += " and t.WAD_DOC_NUM like '%' || :docNum || '%' ";
			sqlParaMap.put("docNum", docNum);
		}
		if (StringUtils.isNotBlank(inWh)) {
			sqlWhere += " and t.wad_in_wh = :inWh ";
			sqlParaMap.put("inWh", inWh);
		}
		if (StringUtils.isNotBlank(outWh)) {
			sqlWhere += " and t.wad_out_wh like '%' || :outWh || '%' ";
			sqlParaMap.put("outWh", outWh);
		}
		if (StringUtils.isNotBlank(beginTime)) {
			sqlWhere += " and T.WAD_ALLOT_TIME >=to_timestamp(:beginTime,'yyyy-mm-dd hh24:mi:ss')";
			sqlParaMap.put("beginTime", beginTime);
		}
		if (StringUtils.isNotBlank(endTime)) {
			sqlWhere += " and T.WAD_ALLOT_TIME <=to_timestamp(:endTime,'yyyy-mm-dd hh24:mi:ss')";
			sqlParaMap.put("endTime", endTime);
		}
		String sql1 = "select distinct * from(" + sql + sqlWhere + " order by t.wad_allot_time desc ) aa";
		List poList = modelService.listSql(sql1, modelAction.getPage(), sqlParaMap, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listMapToEscapeJs(poList);
		modelAction.getAjaxPage().setDataList(poList);
		return BaseActionSupport.AJAX;
	}

}
