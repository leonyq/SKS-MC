package com.more.mes.smt.performance.xray;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
//import org.json.JSONObject;

import com.google.common.collect.ImmutableMap;
//import com.mongodb.util.JSON;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * DML操作
 * @author development
 *
 */
public class XrayDml implements FuncService {

	public String exeFunc(ModelAction modelAction, ModelService modelService) {

		final Log log = LogFactory.getLog(this.getClass());

		HttpServletRequest request = modelAction.getRequest();
		String model = request.getParameter("model");
		String dataAuth = request.getParameter("_DATA_AUTH");// 数据权限
		 String auth = request.getSession().getAttribute("mcDataAuth").toString();
		Map<String, Object> map = new HashMap();
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.mapToEscapeJs(map);
		modelAction.setAjaxMap(map);
		String completeRepairFlag = request.getParameter("Flag");
		try {
			if ("save".equals(model)) {
				insert(request, modelService, modelAction);
				String alertMsg = modelAction.getText("success");
				map.put("returnMsg", alertMsg );
			} else if ("del".equals(model)) {
				del(request, modelService, modelAction);
			} else if ("modify".equals(model)) {
				modify(request, modelService);
				map.put("modify", "modify");
			} else if ("queryErrorList".equals(model)) {
				List list = queryErrorList(request, modelService, modelAction);
				CommMethod.listToEscapeJs(list);
				modelAction.setAjaxList(list);
				// return modelAction.AJAX;
			} else if ("overStation".equals(model)) {
				overStation(request, modelService, modelAction);
			} else if ("check".equals(model)) {
				checkMsg(request, modelService, modelAction);
			} else if ("checkMoNumber".equals(model)) {
				if (checkMoNumber(request, modelService, modelAction)) {
					map.put("check", 1);
				} else
					map.put("check", 0);
			}
			map.put("key", "安全");
			return BaseActionSupport.AJAX;
		} catch (Exception e) {
			map.put("error", e);
			log.error(e);
			return BaseActionSupport.AJAX;
		}
	}

	// 自动加载信息
	public void checkMsg(HttpServletRequest t, ModelService modelService, ModelAction modelAction) {
		String SN = t.getParameter("SN");
		 String auth = t.getSession().getAttribute("mcDataAuth").toString();
		Map<String, Object> map = new HashMap();
		String sql = "SELECT T.WT_SN KEY,T.WT_SN VAL,T.WT_MO_NUMBER, T.WT_MODEL_CODE,t2.CI_ITEM_NAME , t2.CI_ITEM_SPEC spec,"
				+ " T.WT_AREA_SN,T.WT_GROUP_CODE, " + " TO_CHAR(T.WT_IN_TIME,'YYYY-MM-DD') WT_IN_TIME "
				+ " FROM T_WIP_TRACKING T left join T_CO_ITEM t2 on T.WT_MODEL_CODE " 
				+ " = t2.CI_ITEM_CODE " + " WHERE  T.WT_SN = ? and T.DATA_AUTH=? AND T2.DATA_AUTH=? ";// t.WT_ERROR_FLAG='1'

		// 获得在制表信息，作为前置信息
		List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] { SN,auth,auth });
		if (null != list && list.size() > 0) {
			map.put("DR_MO_NUMBER", list.get(0).get("WT_MO_NUMBER"));
			map.put("DR_MODEL_CODE", list.get(0).get("WT_MODEL_CODE"));
			map.put("DR_MODEL_NAME", list.get(0).get("CI_ITEM_NAME"));
			map.put("DR_MODEL_STANDARD", list.get(0).get("spec"));
		}

		// 用当前DOA的信息覆盖它 以后来信息为准，在无后来信息时候就显示前置信息
		CommMethod.mapToEscapeJs(map);
		modelAction.setAjaxMap(map);
		sql = "select a.dr_mo_number " + ", a.dr_repair_station" + ", a.DR_MODEL_CODE DR_MODEL_CODE"
				+ ", b.ci_item_name DR_MODEL_NAME" + ", b.ci_item_spec DR_MODEL_STANDARD "
		    + " from t_doa_repair a left join "
				+ "  t_co_item b on a.DR_MODEL_CODE =b.ci_item_code " +
				" where DR_SN = ? and a.DATA_AUTH=? and b.DATA_AUTH=? ";

		// 会取到多条用于回显的信息，以第一条为准----理论上所有一下这些信息在一个sn种应该一致的。由于不做流程控制而允许不一致。而这些回显信息只是做参考
		List<Map<String, Object>> curList = new ArrayList<Map<String, Object>>();
		curList = modelService.listDataSql(sql, new Object[] { SN,auth,auth });
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

	public void modify(HttpServletRequest req, ModelService modelService) {

		String itemlist = req.getParameter("list");
		
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

	public void insert(HttpServletRequest req, ModelService modelService, ModelAction modelAction) {
	  String auth = req.getSession().getAttribute("mcDataAuth").toString();
		// 删除
		String sn = req.getParameter("SN");
		TableDataMapExt dExt = new TableDataMapExt();
		dExt.setTableName("T_WIP_XRAY_CEC");
		dExt.setSqlWhere(" and XRAY_MO_NUMBER=? DATA_AUTH=?");
		dExt.getSqlWhereArgs().add(sn);
	  dExt.getSqlWhereArgs().add(auth);
		modelService.del(dExt);
		// 添加
		TableDataMapExt tdMap = new TableDataMapExt();
		tdMap.setTableName("T_WIP_XRAY_CEC");
		Map<String, Object> map = tdMap.getColMap();
		String itemlist = req.getParameter("list");

		map.put("XRAY_MO_NUMBER", sn);
		map.put("XRAY_WORK_STATION", req.getParameter("XRAY_WORK_STATION"));
		JSONArray json = JSONArray.fromObject(itemlist);
		for (Object obj : json) {
			JSONObject jo = (JSONObject) obj;
			map.put("XRAY_CEC_CODE", jo.getString("code"));// 不良代码
			map.put("XRAY_CEC_SPEC", jo.getString("desc"));
			map.put("CREATE_USER", CommMethod.getSessionUser().getName());
			map.put("XRAY_CEC_NAME", jo.getString("name"));
			map.put("EDIT_TIME", DateUtil.getCurDate());
			map.put("XRAY_TRID", jo.getString("id"));
			map.put("ID", StringUtils.getUUID());
			modelService.save(tdMap);
		}

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

	public List<Map<String, Object>> queryErrorList(HttpServletRequest request, ModelService modelService, ModelAction modelAction) {
		HttpServletRequest t = modelAction.getRequest();
		String SN = t.getParameter("SN");
		 String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String work_station = t.getParameter("work_station");
		String sql = "SELECT ID ,XRAY_TRID,XRAY_CEC_NAME,XRAY_WORK_STATION,XRAY_CEC_SPEC,XRAY_CEC_POINTNUM,XRAY_CEC_POINT,XRAY_CEC_CODE " +
				" ,CREATE_USER,EDIT_TIME from T_WIP_XRAY_CEC WHERE XRAY_MO_NUMBER = ? and DATA_AUTH=? ";
		List sList = modelService.listDataSql(sql, new Object[] { SN,auth });
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

	public String overStation(HttpServletRequest t, ModelService modelService, ModelAction modelAction) {

		String drModelCode = t.getParameter("paraMap1@0#DR_MODEL_CODE");// 机种sn
		String drMoNumber = t.getParameter("paraMap1@0#DR_MO_NUMBER");// 制令单号
		String drRepatrStation = t.getParameter("paraMap1@0#DR_REPAIR_STATION");// 工作中心
		String drSn = t.getParameter("paraMap1@0#DR_SN");// 产品SN
		// String WT_PROJECT_ID = t.getParameter("paraMap1@0#WT_PROJECT_ID");//工单号
		// 未获取
		String drErrorItem = t.getParameter("paraMap2@0#DR_ERROR_ITEM");// 问题物料
		String drMemo = t.getParameter("paraMap2@0#DR_MEMO");// 备注
		String drReasonCode = t.getParameter("paraMap2@0#DR_REASON_CODE");// 不良原因
																																				// 1.人为
		// 2.材料不良
		String drRepairDesc = t.getParameter("paraMap2@0#DR_REPAIR_DESC");// 原因描述
		// 维修自填
		String drRepairMethod = t.getParameter("paraMap2@0#DR_REPAIR_METHOD");// 问题归因
																																						// 1.维修
																																						// ，2.替换
		String error = t.getParameter("errorArr");// DOA单_ID
		JSONArray errorArr = JSONArray.fromObject(error);
		TableDataMapExt tdMap = new TableDataMapExt();
		tdMap.setTableName("t_doa_repair");
		Map<String, Object> map = tdMap.getColMap();
		if (StringUtils.isNotBlank(drModelCode))
			map.put("DR_MODEL_CODE", drModelCode);
		if (StringUtils.isNotBlank(drMoNumber))
			map.put("DR_MO_NUMBER", drMoNumber);
		if (!"".equals(drRepatrStation))
			map.put("DR_REPAIR_STATION", drRepatrStation);
		// map.put("DR_SN", DR_SN);//SN不可修改
		map.put("DR_ERROR_ITEM", drErrorItem);
		map.put("DR_MEMO", drMemo);
		map.put("DR_REASON_CODE", drReasonCode);
		map.put("DR_REPAIR_DESC", drRepairDesc);
		map.put("DR_REPAIR_METHOD", drRepairMethod);
		map.put("DR_EMP", CommMethod.getSessionUser().getName());// 当前操作员
		map.put("DR_REPAIR_TIME", DateUtil.getCurDate());// 当前时间
		map.put("DR_FINISH_FLAG", 1);
		map.put("EDIT_TIME", DateUtil.getCurDate());
		String completeRepairFlag = t.getParameter("Flag");
		// System.out.println(completeRepairFlag);
		Map<String, String> map1 = new HashMap<String, String>();
		for (int i = 0; i < errorArr.size(); i++) {// 遍历两次 每次进行依次保存操作，每次改变的只有ID

			map1 = (Map<String, String>) errorArr.get(i);
			int reflag = Integer.parseInt(map1.get("flag"));
			if (StringUtils.isNotBlank(completeRepairFlag)) {
				if (reflag == 1) {// 是否更新原有完成维修记录
					continue;
				}
			}
			// map.putAll(map1);
			String dataAuth = t.getParameter("dataAuth");
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
		String Sn = t.getParameter("SN");
		 String auth = t.getSession().getAttribute("mcDataAuth").toString();
		String alertMsg1 = null;
		if(ids!=null&&!ids.equals("")) {
			Object[] obj1 = new Object[ids.split(";").length+2];
			obj1[0] = Sn;
			obj1[1] = auth;
			String inSql = "";
			String[] ss = ids.split(";");
			for(int i=0;i<ss.length;i++){
				obj1[i+2] = ss[i];
				if(i==0){
					inSql = "?";
				}else{
					inSql = inSql + "," + "?";
				}
			}
			String sql = "delete from T_WIP_XRAY_CEC t where t.XRAY_MO_NUMBER = ? and DATA_AUTH=?  and t.XRAY_TRID in (" + inSql + ") ";// 删除指定ID的数据
			int index = modelService.execSql(sql,obj1);
			if (index < 1)
				alertMsg1 = modelAction.getText("未找到关联ID");
			else
				alertMsg1 = modelAction.getText("删除成功");
		}else {
			alertMsg1 = modelAction.getText("需删除的id为空");
		}
		
		CommMethod.mapToEscapeJs(msgPopData(modelAction, alertMsg1));
		modelAction.setAjaxMap(msgPopData(modelAction, alertMsg1));

	}

	public boolean checkMoNumber(HttpServletRequest t, ModelService modelService, ModelAction modelAction) {
	  String auth = t.getSession().getAttribute("mcDataAuth").toString();
		String sql = "select * from T_PM_MO_BASE where pm_mo_number = ? and DATA_AUTH=? ";
		Object drMoNumber = t.getParameter("DR_MO_NUMBER");
		if (null == drMoNumber || "".equals(drMoNumber))
			return false;
		List sList = modelService.listDataSql(sql, new Object[] { drMoNumber,auth });
        return null != sList && !"".equals(sList) && sList.size() != 0;
    }

}
