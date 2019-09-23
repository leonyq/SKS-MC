package com.more.mes.smt.doa;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * DOA维修---操作类
 * 
 * @author Administrator
 *
 */
public class DoaInfo implements FuncService {

	public String exeFunc(ModelAction modelAction, ModelService modelService) {

		final Log log = LogFactory.getLog(this.getClass());

		HttpServletRequest request = modelAction.getRequest();
		String model = request.getParameter("model");
		String dataAuth = request.getParameter("_DATA_AUTH");// 数据权限
		Map<String, Object> map = new HashMap();
		modelAction.setAjaxPage(modelAction.getPage());
		modelAction.setAjaxMap(map);
		String completeRepairFlag = request.getParameter("Flag");
		List list = new ArrayList<>();
		try {
			if ("save".equals(model)) {
				insert(request, modelService, modelAction);
				map.put("returnMsg", "addSucc");
				String alertMsg = modelAction.getText("添加不良成功");
				return addParentData(modelAction, alertMsg);
			} else if ("del".equals(model)) {
				del(request, modelService, modelAction);
			} else if ("modify".equals(model)) {
				modify(request, modelService);
				map.put("modify", "modify");
			} else if ("queryErrorList".equals(model)) {
				list = queryErrorList(request, modelService, modelAction);
				modelAction.setAjaxList(list);
				// return modelAction.AJAX;
			} else if ("addRepair".equals(model)) {
				addRepair(request, modelService, modelAction);
			} else if ("check".equals(model)) {
				checkMsg(request, modelService, modelAction);
			} else if ("checkMoNumber".equals(model)) {
				if (checkMoNumber(request, modelService, modelAction)) {
					map.put("check", 1);
				} else
					map.put("check", 0);
			}
			map.put("key", "安全");
			CommMethod.listToEscapeJs(list);
			CommMethod.mapToEscapeJs(map);
			return BaseActionSupport.AJAX;
		} catch (Exception e) {
			map.put("error", e);
			log.error(e);
			CommMethod.listToEscapeJs(list);
			CommMethod.mapToEscapeJs(map);
			return BaseActionSupport.AJAX;
		}
	}

	// 自动加载信息
	@SuppressWarnings("unchecked")
	public void checkMsg(HttpServletRequest t, ModelService modelService, ModelAction modelAction) {
		String SN = t.getParameter("SN");
		Map<String, Object> map = new HashMap();
		String auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		String sql = "SELECT T.WT_SN SKEY,T.WT_SN SVAL,T.WT_MO_NUMBER, T.WT_MODEL_CODE,t2.CI_ITEM_NAME , t2.CI_ITEM_SPEC spec,"
				+ " T.WT_AREA_SN,T.WT_GROUP_CODE, " + " TO_CHAR(T.WT_IN_TIME,'YYYY-MM-DD') WT_IN_TIME "
				+ " FROM T_WIP_TRACKING T " + " left join T_CO_ITEM t2 on T.WT_MODEL_CODE "
				+ " = t2.CI_ITEM_CODE and t2.DATA_AUTH=t.DATA_AUTH " + " WHERE  T.WT_SN = ? and t.DATA_AUTH=? " + "  ";// t.WT_ERROR_FLAG='1'

		// 获得在制表信息，作为前置信息
		List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] { SN, auth });
		if (null != list && list.size() > 0) {
			map.put("DR_MO_NUMBER", list.get(0).get("WT_MO_NUMBER"));
			map.put("DR_MODEL_CODE", list.get(0).get("WT_MODEL_CODE"));
			map.put("DR_MODEL_NAME", list.get(0).get("CI_ITEM_NAME"));
			map.put("DR_MODEL_STANDARD", list.get(0).get("spec"));
		}

		// 用当前DOA的信息覆盖它 以后来信息为准，在无后来信息时候就显示前置信息
		modelAction.setAjaxMap(map);
		sql = "select a.dr_mo_number " + ", a.dr_repair_station" + ", a.DR_MODEL_CODE DR_MODEL_CODE"
				+ ", b.ci_item_name DR_MODEL_NAME" + ", b.ci_item_spec DR_MODEL_STANDARD "
				+ " from t_doa_repair a left join "
				+ "  t_co_item b on a.DR_MODEL_CODE =b.ci_item_code and b.DATA_AUTH=t.DATA_AUTH"
				+ " where DR_SN = ? and t.DATA_AUTH=? ";

		// 会取到多条用于回显的信息，以第一条为准----理论上所有一下这些信息在一个sn种应该一致的。由于不做流程控制而允许不一致。而这些回显信息只是做参考
		List<Map<String, Object>> curList = new ArrayList<Map<String, Object>>();
		curList = modelService.listDataSql(sql, new Object[] { SN, auth });
		if (null != curList && curList.size() > 0) {
			// Object i =curList.get(0).get("DR_MO_NUMBER");
			map.put("DR_MO_NUMBER", curList.get(0).get("DR_MO_NUMBER"));
			if (null == map.get("DR_MO_NUMBER") || "".equals(map.get("DR_MO_NUMBER")))
				map.put("listLength", 0);
			map.put("DR_MODEL_CODE", curList.get(0).get("DR_MODEL_CODE"));
			map.put("DR_MODEL_NAME", curList.get(0).get("DR_MODEL_NAME"));
			map.put("DR_MODEL_STANDARD", curList.get(0).get("DR_MODEL_STANDARD"));
		}
	}

	public void update(HttpServletRequest req, ModelService modelService) {
		TableDataMapExt ext = new TableDataMapExt();
		ext.setTableName("t_user_item");
		ext.setSqlWhere(" and id=?");
		ext.getSqlWhereArgs().add(req.getParameter("ID"));
		modelService.del(ext);
		// update(req, modelService);
	}

	@SuppressWarnings("unchecked")
	public void modify(HttpServletRequest req, ModelService modelService) {

		String itemlist = req.getParameter("list");
		System.out.println(itemlist);
		JSONArray json = JSONArray.fromObject(itemlist);
		// 更新信息
		TableDataMapExt ext = new TableDataMapExt();
		ext.setTableName("t_user_item");
		String grape_dept_id = req.getParameter("GRAPE_DEPT_ID");
		for (Object obj : json) {
			JSONObject jo = (JSONObject) obj;
			ext.getColMap().put("item_score", jo.getString("ITEM_SCORE"));
			ext.getColMap().put("item_name", jo.getString("ITEM_NAME"));
			ext.getColMap().put("grape_dept_id", grape_dept_id);
			ext.setSqlWhere("and id = ?");
			ext.getSqlWhereArgs().clear();
			ext.getSqlWhereArgs().add(jo.getString("ID"));
			modelService.edit(ext);
		}
	}

	@SuppressWarnings("unchecked")
	public void insert(HttpServletRequest req, ModelService modelService, ModelAction modelAction) {
		TableDataMapExt ext = new TableDataMapExt();
		String dataAuth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		String weSn = req.getParameter("paraMap1@0#WE_SN");
		String sql = "select * from T_WIP_TRACKING where WT_SN = ? and DATA_AUTH=? ";

		TableDataMapExt tdMap = new TableDataMapExt();
		tdMap.setTableName("T_DOA_REPAIR");
		Map<String, Object> map = tdMap.getColMap();
		CommMethod.addSysDefCol(map, modelAction.getUser());

		List<Map<String, Object>> sList = modelService.listDataSql(sql, new Object[] { weSn, dataAuth });
		if (null != sList && sList.size() > 0) {
			Map smap = sList.get(0);
			map.put("DR_MO_NUMBER", smap.get("WT_MO_NUMBER"));// 制令号
			map.put("DR_MODEL_CODE", smap.get("WT_MODEL_CODE"));// 机种
			map.put("DR_LOT", smap.get("WT_LOT"));// 批号
		}
		// map.put("WE_RECORD_TYPE", 1);// 记录类别 (,0表示测试站记录,1:维修站添加)
		// map.put("WE_AREA_SN", smap.get("WT_AREA_SN"));//线别
		// map.put("WE_PROCESS_FACE", smap.get("WT_PROCESS_FACE"));//生产面别
		map.put("DR_SN", weSn);
		map.put("DR_ERROR_CODE", req.getParameter("paraMap1@0#DR_ERROR_CODE"));// 不良代码
		map.put("DR_POINT", req.getParameter("paraMap1@0#DR_POINT"));

		map.put("DR_EMP", CommMethod.getSessionUser().getName());
		map.put("DR_REPAIR_STATION", req.getParameter("DR_REPAIR_STATION"));
		map.put("DR_REPAIR_TIME", DateUtil.getCurDate());
		map.put("DR_FINISH_FLAG", "0");
		map.put("EDIT_TIME", DateUtil.getCurDate());

		if (null != req.getParameter("DR_MO_NUMBER") && "" != req.getParameter("DR_MO_NUMBER")) {
			map.put("DR_MO_NUMBER", req.getParameter("DR_MO_NUMBER"));// 制令单号
		}
        if (null != req.getParameter("DR_MODEL_CODE") && "" != req.getParameter("DR_MODEL_CODE")) {
			map.put("DR_MODEL_CODE", req.getParameter("DR_MODEL_CODE"));// 机种
		}

        if (dataAuth != null && !dataAuth.equals("")) {
			map.put("DATA_AUTH", dataAuth);
		}

		modelService.save(tdMap);

	}

	@SuppressWarnings("unchecked")
	private Map msgPopData(ModelAction modelAction, String alertMsg) {
		Map map = new HashMap<String, Object>();
		String title = ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
		title = modelAction.getText(title);
		String width = ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
		String height = ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
		String time = ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
		map.put("title", title);
		map.put("width", width);
		map.put("height", height);
		map.put("time", time);
		map.put("alertMsg", alertMsg);
		return map;
	}

	@SuppressWarnings("unchecked")
	public void change_status(HttpServletRequest req, ModelService modelService) {
		String itemlist = req.getParameter("list");
		String[] list = itemlist.split(",");

		// 更新信息
		TableDataMapExt ext = new TableDataMapExt();
		ext.setTableName("t_user_item");
		for (Object obj : list) {
			ext.getColMap().put("DATA_STATUS", -1);
			ext.setSqlWhere("and id = ?");
			ext.getSqlWhereArgs().clear();
			ext.getSqlWhereArgs().add(obj);
			modelService.edit(ext);
		}
	}

	public List<Map<String, Object>> queryErrorList(HttpServletRequest request, ModelService modelService,
			ModelAction modelAction) {
		HttpServletRequest t = modelAction.getRequest();
		String SN = t.getParameter("SN");
		String work_station = t.getParameter("work_station");
		String auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();// 数据权限
		String sql = " SELECT T.ID , T.DR_SN , T.DR_ERROR_CODE , T2.CEC_DESC , T.DR_POINT , "
				+ " T.DR_REPAIR_STATION , T3.CA_NAME , T.DR_FINISH_FLAG , DR_EMP ,"
				+ " to_char(T.DR_REPAIR_TIME,'YYYY-MM-DD HH24:mi:ss') as DR_REPAIR_TIME" + " FROM T_DOA_REPAIR T"
				+ " LEFT JOIN T_CO_ERROR_CODE T2 ON T2.CEC_CODE = T.DR_ERROR_CODE and t2.DATA_AUTH=t.DATA_AUTH "
				+ " LEFT JOIN T_CO_AREA T3 ON T3.CA_ID = T.DR_REPAIR_STATION and t3.DATA_AUTH=t.DATA_AUTH "
				+ " WHERE T.DR_SN = ? and t.DATA_AUTH=? ";
		List sList = modelService.listDataSql(sql, new Object[] { SN, auth });
		return sList;

	}

	private String addParentData(ModelAction modelAction, String alertMsg)// 传参回去并执行指定方法
	{
		String title = ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
		title = modelAction.getText(title);
		String width = ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
		String height = ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
		String time = ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
		StringBuffer content = new StringBuffer();
		content.append("<script>");
		content.append("try{");
		content.append("window.parent.addParentData('");
		content.append(alertMsg + "','" + title + "','" + width + "','" + height + "','" + time);
		content.append("');");
		content.append("}catch(e){alert(\"");
        content.append("\");}");
		content.append("</script>");
		modelAction.outHtml(content.toString(), Constants.CHARACTER_ENCODING_UTF_8);
		return null;
	}

	@SuppressWarnings("unchecked")
	public String addRepair(HttpServletRequest t, ModelService modelService, ModelAction modelAction) {

		String DR_MODEL_CODE = t.getParameter("paraMap1@0#DR_MODEL_CODE");// 机种sn
		String DR_MO_NUMBER = t.getParameter("paraMap1@0#DR_MO_NUMBER");// 制令单号
		String DR_REPAIR_STATION = t.getParameter("paraMap1@0#DR_REPAIR_STATION");// 工作中心
		String DR_SN = t.getParameter("paraMap1@0#DR_SN");// 产品SN
		// String WT_PROJECT_ID = t.getParameter("paraMap1@0#WT_PROJECT_ID");//工单号
		// 未获取
		String DR_ERROR_ITEM = t.getParameter("paraMap2@0#DR_ERROR_ITEM");// 问题物料
		String DR_MEMO = t.getParameter("paraMap2@0#DR_MEMO");// 备注
		String DR_REASON_CODE = t.getParameter("paraMap2@0#DR_REASON_CODE");// 不良原因
																			// 1.人为
		// 2.材料不良
		String DR_REPAIR_DESC = t.getParameter("paraMap2@0#DR_REPAIR_DESC");// 原因描述
		// 维修自填
		String DR_REPAIR_METHOD = t.getParameter("paraMap2@0#DR_REPAIR_METHOD");// 问题归因
																				// 1.维修
																				// ，2.替换
		String error = t.getParameter("errorArr");// DOA单_ID
		JSONArray errorArr = JSONArray.fromObject(error);
		TableDataMapExt tdMap = new TableDataMapExt();
		tdMap.setTableName("t_doa_repair");
		Map<String, Object> map = tdMap.getColMap();
		/*
		 * String sql = "select t.CA_GROUP from T_CO_AREA t where t.ca_id= ? "; String
		 * station = t.getParameter("paraMap1@0#WT_WORK_STATION");//查询工序
		 * List<Map<String, Object>> sList = modelService.listDataSql(sql, new Object[]
		 * { station }); if (sList != null && !sList.isEmpty()) {
		 * map.put("WR_REPAIR_GROUP", sList.get(0).get("CA_GROUP")); }
		 */
		if (StringUtils.isNotBlank(DR_MODEL_CODE))
			map.put("DR_MODEL_CODE", DR_MODEL_CODE);
		if (StringUtils.isNotBlank(DR_MO_NUMBER))
			map.put("DR_MO_NUMBER", DR_MO_NUMBER);
		if (!"".equals(DR_REPAIR_STATION))
			map.put("DR_REPAIR_STATION", DR_REPAIR_STATION);
		// map.put("DR_SN", DR_SN);//SN不可修改
		map.put("DR_ERROR_ITEM", DR_ERROR_ITEM);
		map.put("DR_MEMO", DR_MEMO);
		map.put("DR_REASON_CODE", DR_REASON_CODE);
		map.put("DR_REPAIR_DESC", DR_REPAIR_DESC);
		map.put("DR_REPAIR_METHOD", DR_REPAIR_METHOD);
		map.put("DR_EMP", CommMethod.getSessionUser().getName());// 当前操作员
		map.put("DR_REPAIR_TIME", DateUtil.getCurDate());// 当前时间
		map.put("DR_FINISH_FLAG", 1);
		map.put("EDIT_TIME", DateUtil.getCurDate());
		// CommMethod.addSysDefCol(map, modelAction.getUser());//
		// 该语句在当前情境下引发违法违法唯一约束，调试花费30分钟。
		String completeRepairFlag = t.getParameter("Flag");
		// System.out.println(completeRepairFlag);
		Map<String, String> map1 = new HashMap<String, String>();
		int num = errorArr.size();
		String dataAuth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		for (int i = 0; i < num; i++) {// 遍历两次 每次进行依次保存操作，每次改变的只有ID

			map1 = (Map<String, String>) errorArr.get(i);
			int reflag = Integer.parseInt(map1.get("flag"));
			if (StringUtils.isNotBlank(completeRepairFlag)) {
				if (reflag == 1) {// 是否更新原有完成维修记录
					continue;
				}
			}
			// map.putAll(map1);
			if (dataAuth != null && !dataAuth.equals("")) {
				map.put("DATA_AUTH", dataAuth);
			}
			tdMap.getSqlWhereArgs().clear();
			tdMap.setSqlWhere(" and id = ?");
			Object id = map1.get("DR_ID");
			tdMap.getSqlWhereArgs().add(id);
			// 保存维修信息
			modelService.edit(tdMap);
		}
		String msg = modelAction.getDefinedMsg();
		if (StringUtils.isBlank(msg)) {
			msg = "不良维修成功";
		}
		String alertMsg = modelAction.getText(msg);
		return addParentData(modelAction, alertMsg);
	}

	public void del(HttpServletRequest t, ModelService modelService, ModelAction modelAction) {
		String ids = t.getParameter("ids");

		String alertMsg1 = null;
		String sql = "delete from T_DOA_REPAIR t where t.id in ('" + ids.replace(";", "','") + "')";// 删除指定ID的数据
		int index = modelService.execSql(sql);
		if (index < 1)
			alertMsg1 = modelAction.getText("未找到关联ID");
		else
			alertMsg1 = modelAction.getText("删除成功");
		modelAction.setAjaxMap(msgPopData(modelAction, alertMsg1));

	}

	public boolean checkMoNumber(HttpServletRequest t, ModelService modelService, ModelAction modelAction) {
		String sql = "select * from T_PM_MO_BASE where pm_mo_number = ? and DATA_AUTH=? ";
		String auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		Object DR_MO_NUMBER = t.getParameter("DR_MO_NUMBER");
		if (null == DR_MO_NUMBER || "".equals(DR_MO_NUMBER))
			return false;
		List sList = modelService.listDataSql(sql, new Object[] { DR_MO_NUMBER, auth });
        return null != sList && !"".equals(sList) && sList.size() != 0;
    }

}
