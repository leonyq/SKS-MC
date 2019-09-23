package com.more.mes.smt.wmsoutstock;

import java.util.HashMap;
import java.util.LinkedHashSet;
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
 * 返工出库----获取出库信息
 * 
 * @author Administrator
 *
 */
public class ReworkOut implements FuncService {

	@SuppressWarnings("unused")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = request.getParameter("dataAuth");
		// String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
		String docNum = request.getParameter("docNum");
		String connectDoc = request.getParameter("connectDoc");
		String itemStatus = request.getParameter("itemStatus");
		String itemCode = request.getParameter("itemCode");
		String beginTime = request.getParameter("beginTime");
		String endTime = request.getParameter("endTime");
		String userId = modelAction.getUser().getId();
		LinkedHashSet<String> gCodeMap = new LinkedHashSet<String>();

		Map<String, String> map = new HashMap<String, String>();

		String sql = " select DISTINCT  t1.ID AS ID, G.NAME AS DATA_AUTH,t.DATA_AUTH as DATA_AUTH2,t.Woi_DOC_NUM,t1.WOD_LIGHT_FLAG,t1.WOD_MEMO,   "
				+ " t1.WOD_STATUS,t1.WOD_URGENT_FLAG,t.WOI_WH_CODE, "
				+ " TO_CHAR(t1.WOD_OUTSTOCK_DATE,'yyyy-MM-dd hh24:mi:ss') OUTSTOCK_DATE,   "
				+ " TO_CHAR(t1.WOD_CREATE_TIME,'yyyy-MM-dd hh24:mi:ss') CREATE_TIME, "
				+ " TO_CHAR(t1.WOD_CLOSE_TIME,'yyyy-MM-dd hh24:mi:ss') CLOSE_TIME, t6.WDT_TYPE_NAME,"
				+ " t2.SUPPLIER_NAME,t3.name as CREATE_MAN,t4.name as CLOSE_MAN," + " t5.WA_AREA_NAME "
				+ " from T_WMS_OUTSTOCK_ITEM t";

		String sqlWhere = "  ";
		if (StringUtils.isNotBlank(dataAuth)) {
			sqlWhere += " and t.DATA_AUTH = :dataAuth  ";
			sql += " left join T_WMS_OUTSTOCK_DOC t1 on t1.wod_doc_num = t.woi_doc_num"
					+ " and t1.DATA_AUTH = :dataAuth1 "
					+ " left join T_CO_SUPPLIER t2 on t2.SUPPLIER_CODE = t1.WOD_SUP_CODE"
					+ " and t2.DATA_AUTH = :dataAuth2 " + " left join sy_user t3 on t3.id = t1.WOD_CREATE_MAN" +

					" left join sy_user t4 on t4.id = t1.WOD_CLOSE_MAN" +

					"  left join T_WMS_AREA t5 on t5.WA_AREA_SN = t.WOI_WH_CODE" + " and t5.DATA_AUTH = :dataAuth5 "
					+ " LEFT JOIN T_WMS_DOC_TYPE T6 ON T6.WDT_TYPE_SN = 'DJ12'" + " and t6.DATA_AUTH = :dataAuth6 "
					+ " LEFT JOIN SY_DEPT G ON G.ID=T.DATA_AUTH " + "  where t1.wod_doc_type = 'DJ12'  ";
			map.put("dataAuth", dataAuth);
			map.put("dataAuth1", dataAuth);
			map.put("dataAuth2", dataAuth);

			map.put("dataAuth5", dataAuth);
			map.put("dataAuth6", dataAuth);
		} else {
			sqlWhere += " and t.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId1 )";
			sql += " left join T_WMS_OUTSTOCK_DOC t1 on t1.wod_doc_num = t.woi_doc_num  and t1.DATA_AUTH = t.DATA_AUTH "
					+

					" left join T_CO_SUPPLIER t2 on t2.SUPPLIER_CODE = t1.WOD_SUP_CODE  and t2.DATA_AUTH = t.DATA_AUTH "
					+

					" left join sy_user t3 on t3.id = t1.WOD_CREATE_MAN"

					+ " left join sy_user t4 on t4.id = t1.WOD_CLOSE_MAN"

					+ "  left join T_WMS_AREA t5 on t5.WA_AREA_SN = t.WOI_WH_CODE  and t5.DATA_AUTH = t.DATA_AUTH " +

					" LEFT JOIN T_WMS_DOC_TYPE T6 ON T6.WDT_TYPE_SN = 'DJ12' and t6.DATA_AUTH = t.DATA_AUTH " +

					" LEFT JOIN SY_DEPT G ON G.ID=T.DATA_AUTH " + "  where t1.wod_doc_type = 'DJ12'  ";

			map.put("userId1", userId);

		}
		int nums = 0;

		if (StringUtils.isNotBlank(itemCode)) {

			sqlWhere += " and t.WOI_ITEM_CODE like '%'||:itemCode||'%'";
			map.put("itemCode", itemCode);
		}
		if (StringUtils.isNotBlank(connectDoc)) {
			sqlWhere += " and t.WOI_CONNECT_DOC like  '%'||:connectDoc||'%'";
			map.put("connectDoc", connectDoc);
		}
		if (StringUtils.isNotBlank(itemStatus)) {
			sqlWhere += "  and t.WOI_STATUS =:itemStatus";
			map.put("itemStatus", itemStatus);
		}

		if (StringUtils.isNotBlank(docNum)) {
			sqlWhere += " and t1.WOD_DOC_NUM like '%'||:docNum||'%' ";
			map.put("docNum", docNum);
		}

		if (StringUtils.isNotBlank(beginTime)) {
			sqlWhere += " and t1.WOD_CREATE_TIME >=to_timestamp(:beginTime,'yyyy-mm-dd hh24:mi:ss')";
			map.put("beginTime", beginTime);
		}
		if (StringUtils.isNotBlank(endTime)) {
			sqlWhere += " and t1.WOD_CREATE_TIME <=to_timestamp(:endTime,'yyyy-mm-dd hh24:mi:ss')";
			map.put("endTime", endTime);
		}

		String order = " order by CREATE_TIME desc";

		String sql1 = "select * from(" + sql + sqlWhere + order + ")";

		List poList = modelService.listSql(sql1, modelAction.getPage(), map, null, null);

		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(poList);
		modelAction.getAjaxPage().setDataList(poList);
		return BaseActionSupport.AJAX;
	}

}
