package com.more.mes.smt.workshop.oracle;

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
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		HttpSession session = request.getSession();
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
		// 获取工作中心
		String sql = "select * from(       "
				+ " select distinct t3.GROUP_NAME,t2.JOB_NAME,t4.ca_name as pname,a.value track, "
				+ " t.CA_ID,t.CA_NAME,t.CA_PARENTAREAID,t.CA_TYPE,t.CA_EMP_ROLE ,t.CA_GROUP,t.CA_STATUS, "
				+ " t.ID,t.DEPT_ID,t.CREATE_USER,t.CREATE_TIME,t.EDIT_TIME,t.EDIT_USER ,t.CA_FEEDER_FLAG, "
				+ " t.DATA_AUTH,t.CA_STOP_FLAG,t.CA_PROJECT_STEP,t.CA_STOP_TIME,t.CA_TRACK ,t.CA_TRACK_FLAG "
				+ " from T_CO_AREA t " + " left join SY_JOB t2 on t2.ID = t.CA_EMP_ROLE  "
				+ " left join sy_dict_val a on a.code = t.ca_track and a.dict_code =:TRACK_TYPE1 "
				+ " left join t_co_group t3 on t3.GROUP_CODE = t.CA_GROUP and t3.DATA_AUTH=:auth "
				+ " left join t_co_area t4 on t4.DATA_AUTH=:auth and  t4.ca_id = t.CA_PARENTAREAID "
				+ " where t.data_auth = :auth " + "  start with t.ca_id=:id1 and t.data_auth =:auth     "
				+ " connect by prior t.ca_id=t.ca_parentareaid ) a" + " where a.ca_type=:ca_type1";
		map.put("TRACK_TYPE1", "TRACK_TYPE");
		map.put("id1", id);
		map.put("ca_type1", "2");
		map.put("auth", auth);
		dataList = modelService.listSql(sql, modelAction.getPage(), map, null, null);

		if (dataList != null && !dataList.isEmpty()) {
			parentId = id.trim();

		}
		map.clear();
		String sqlPname = "select t.CA_NAME from T_CO_AREA t where t.CA_ID = :parentId1 and data_auth=:auth ";
		map.put("parentId1", parentId);
		map.put("auth", auth);
		// String sqlWorkShop = "select * from T_CO_AREA t where t.CA_PARENTAREAID
		// ='"+id+"' and t.ca_type = '2'";
		// List pageList = modelService.listSql(sqlWorkShop, modelAction.getPage(),
		// null, "ORDER BY t.CA_NAME ", null);
		// List<Map> pnameList= modelService.listDataSql(sqlPname,new Object[]
		// {parentId});
		pnameList = modelService.listSql(sqlPname, null, map, " ORDER BY t.CA_NAME ", null);
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
