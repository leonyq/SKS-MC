package com.more.mes.smt.workshop.pg;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 车间建模---根据车间/线别获取工作中心 ---分页
 * 
 * @author Administrator
 *
 */
public class GetWorkInfoPage implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		String id = CommMethod.escapeJs(request.getParameter("caId"));
		HttpSession session = request.getSession();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		session.setAttribute("idd", 22);
		if ("".equals(id) || id == null) {
			id = "22";
		}
		Map map1 = new HashMap();
		Map<String, String> listMap = new HashMap<String, String>();
		List<Map> pnameList = new ArrayList<Map>();
		List<Map> dataList = new ArrayList<Map>();
		List<Map> pdataList = new ArrayList<Map>();
		Map<String, String> map = new HashMap<String, String>();
		String parentId = "";
		/*
		 * String sql="select * from(       "+
		 * " select t3.GROUP_NAME,t2.JOB_NAME,t.*,t4.ca_name as pname,a.value track from T_CO_AREA t "
		 * + " left join SY_JOB t2 on t2.ID = t.CA_EMP_ROLE " +
		 * " left join sy_dict_val a on a.code = t.ca_track and a.dict_code =:TRACK_TYPE1 "
		 * + " left join t_co_group t3 on t3.GROUP_CODE = t.CA_GROUP " +
		 * " left join t_co_area t4 on t4.ca_id = t.CA_PARENTAREAID  start with t.ca_id=:id1 "
		 * + " connect by prior t.ca_id=t.ca_parentareaid ) a"+
		 * " where a.ca_type=:ca_type1";
		 */
		// 获取工作中心
		String sql = "select * from(       "
				+ " select t3.GROUP_NAME,t2.JOB_NAME,t.*,t4.ca_name as pname,a.value track from T_CO_AREA t "
				+ " left join SY_JOB t2 on t2.ID = t.CA_EMP_ROLE "
				+ " left join sy_dict_val a on a.code = t.ca_track and a.dict_code =:TRACK_TYPE1"
				+ " left join t_co_group t3 on t3.GROUP_CODE = t.CA_GROUP and t3.DATA_AUTH=:auth "
				+ " left join t_co_area t4 on t4.ca_id = t.CA_PARENTAREAID "
				+ " where t.ca_id in (WITH RECURSIVE Ta  AS ( " + " SELECT * " + " FROM t_co_area "
				+ " WHERE ca_id =:id1 and DATA_AUTH=:auth " + " UNION ALL " + " SELECT  d.* " + "  FROM t_co_area D "
				+ " JOIN Ta ON D.CA_PARENTAREAID=Ta.ca_id and D.DATA_AUTH=:auth " + "  ) " + " SELECT ca_id FROM Ta )"
				+ " ) a " + " where a.ca_type=:type1 ";
		map.put("TRACK_TYPE1", "TRACK_TYPE");
		map.put("id1", id);
		map.put("type1", "2");
		map.put("auth", auth);
		dataList = modelService.listSql(sql, modelAction.getPage(), map, null, null);

		if (dataList != null && !dataList.isEmpty()) {
			parentId = id.trim();

		}
		map.clear();
		String sqlPname = "select t.CA_NAME from T_CO_AREA t where t.CA_ID = :parentId1 AND T.DATA_AUTH=:auth ";
		map.put("parentId1", parentId);
		map.put("auth", auth);
		// String sqlWorkShop = "select * from T_CO_AREA t where t.CA_PARENTAREAID
		// ='"+id+"' and t.ca_type = '2'";
		// List pageList = modelService.listSql(sqlWorkShop, modelAction.getPage(),
		// null, "ORDER BY t.CA_NAME ", null);
		// List<Map> pnameList= modelService.listDataSql(sqlPname,new Object[]
		// {parentId});
		pnameList = modelService.listSql(sqlPname + " ORDER BY t.CA_NAME ", null, map, null, null);
		if (pnameList != null && !pnameList.isEmpty()) {
			listMap = pnameList.get(0);
			String parantName = listMap.get("CA_NAME");
			map1.put("parantname", parantName);// 父类区域名称
		}

		request.setAttribute("iframeid", request.getParameter("iframeid"));
		// modelAction.setDataList(pageList);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(dataList);
		modelAction.getAjaxPage().setDataList(dataList);
		CommMethod.mapToEscapeJs(map1);
		modelAction.setAjaxMap(map1);
		return BaseActionSupport.AJAX;
	}

}
