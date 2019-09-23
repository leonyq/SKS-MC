package com.more.mes.smt.wmsoutstock.etstock;

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
 * 委外发料---获取出库信息
 * 
 * @author Administrator
 *
 */
public class GetOutInfo implements FuncService {

	@SuppressWarnings("unused")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		// String dataAuth = request.getParameter("dataAuth");
		// String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
		String dataAuth = request.getParameter("dataAuth");
		String docNum = request.getParameter("docNum");

		String connectDoc = request.getParameter("connectDoc");
		String itemStatus = request.getParameter("itemStatus");
		String itemCode = request.getParameter("itemCode");
		String beginTime = request.getParameter("beginTime");
		String endTime = request.getParameter("endTime");
		String userId = modelAction.getUser().getId();
		LinkedHashSet<String> gCodeMap = new LinkedHashSet<String>();

		Map<String, String> map = new HashMap<String, String>();

		String sql = " select distinct  t1.ID AS ID, t.Woi_DOC_NUM, G.NAME AS DATA_AUTH, t.DATA_AUTH AS DATA_AUTH2, t1.WOD_LIGHT_FLAG,t1.WOD_MEMO,T10.WDI_LIGHT_FLAG ,    "
				+ "   t1.WOD_STATUS,t1.WOD_URGENT_FLAG,t.WOI_WH_CODE, "
				+ " TO_CHAR(t1.WOD_OUTSTOCK_DATE,'yyyy-MM-dd') OUTSTOCK_DATE,   "
				+ " TO_CHAR(t1.WOD_CREATE_TIME,'yyyy-MM-dd hh24:mi:ss') CREATE_TIME, "
				+ " TO_CHAR(t1.WOD_CLOSE_TIME,'yyyy-MM-dd hh24:mi:ss') CLOSE_TIME, t6.WDT_TYPE_NAME,"
				+ " t2.SUPPLIER_NAME,t3.name as CREATE_MAN,t4.name as CLOSE_MAN," + "   t5.WA_AREA_NAME "
				+ " from T_WMS_OUTSTOCK_ITEM t";

		String sqlWhere = "where 1=1 ";
		if (StringUtils.isNotBlank(dataAuth)) {
			sqlWhere += " and t.DATA_AUTH = :dataAuth and t1.wod_doc_type =:wod_doc_type1 ";
			sql += " left join T_WMS_OUTSTOCK_DOC t1 on t1.wod_doc_num = t.woi_doc_num and t1.DATA_AUTH=T.DATA_AUTH " +

					" left join T_CO_SUPPLIER t2 on t2.SUPPLIER_CODE = t1.WOD_SUP_CODE and t2.DATA_AUTH=T.DATA_AUTH " +

					" left join sy_user t3 on t3.id = t1.WOD_CREATE_MAN  " +

					" left join sy_user t4 on t4.id = t1.WOD_CLOSE_MAN  " +

					" left join T_WMS_AREA t5 on t5.WA_AREA_SN = t.WOI_WH_CODE and t5.DATA_AUTH=T.DATA_AUTH " +

					" LEFT JOIN T_WMS_DOC_TYPE T6 ON T6.WDT_TYPE_SN =:WDT_TYPE_SN1 and t6.DATA_AUTH=T.DATA_AUTH " +

					" LEFT JOIN T_WMS_DOC_INFO T10 ON T10.WDI_DOC_NUM=T.Woi_DOC_NUM and t10.DATA_AUTH=T.DATA_AUTH " +

					" LEFT JOIN SY_DEPT G ON G.ID=T.DATA_AUTH ";
			map.put("WDT_TYPE_SN1", "DJ27");
			map.put("wod_doc_type1", "DJ27");
			map.put("dataAuth", dataAuth);

		} else {
			sqlWhere += " and t.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId1  and t1.wod_doc_type =:wod_doc_type1)";
			sql += " left join T_WMS_OUTSTOCK_DOC t1 on t1.wod_doc_num = t.woi_doc_num  and t1.DATA_AUTH = t.DATA_AUTH "
					+

					" left join T_CO_SUPPLIER t2 on t2.SUPPLIER_CODE = t1.WOD_SUP_CODE  and t2.DATA_AUTH = t.DATA_AUTH "
					+

					" left join sy_user t3 on t3.id = t1.WOD_CREATE_MAN  " +

					" left join sy_user t4 on t4.id = t1.WOD_CLOSE_MAN  " +

					"  left join T_WMS_AREA t5 on t5.WA_AREA_SN = t.WOI_WH_CODE  and t5.DATA_AUTH = t.DATA_AUTH " +

					" LEFT JOIN T_WMS_DOC_TYPE T6 ON T6.WDT_TYPE_SN =:WDT_TYPE_SN1  and t6.DATA_AUTH = t.DATA_AUTH " +

					" LEFT JOIN T_WMS_DOC_INFO T10 ON T10.WDI_DOC_NUM=T.Woi_DOC_NUM  and t10.DATA_AUTH = t.DATA_AUTH " +

					" LEFT JOIN SY_DEPT G ON G.ID=T.DATA_AUTH ";

			map.put("WDT_TYPE_SN1", "DJ27");
			map.put("wod_doc_type1", "DJ27");
			map.put("userId1", userId);

		}
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
			sqlWhere += " and t1.WOD_CREATE_TIME >=to_date(:beginTime,'yyyy-MM-dd hh24:mi:ss')";
			map.put("beginTime", beginTime);
		}
		if (StringUtils.isNotBlank(endTime)) {
			sqlWhere += " and t1.WOD_CREATE_TIME <=to_date(:endTime,'yyyy-MM-dd hh24:mi:ss')";
			map.put("endTime", endTime);
		}

		String order = " order by CREATE_TIME desc";

		String sql1 = "select * from(" + sql + sqlWhere + order + ") a ";

		List poList = modelService.listSql(sql1, modelAction.getPage(), map, null, null);

		modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(poList);
		CommMethod.listMapToEscapeJs(poList);
		return BaseActionSupport.AJAX;
	}

}
