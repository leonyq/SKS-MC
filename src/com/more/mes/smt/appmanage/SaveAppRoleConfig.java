package com.more.mes.smt.appmanage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * APP----角色功能----配置权限新增保存
 * 
 * @author Administrator
 *
 */
public class SaveAppRoleConfig implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String exeFunc(ModelAction modelaction, ModelService modelService) {
		String list = modelaction.getRequest().getParameter("list");
		String cg_name = modelaction.getRequest().getParameter("cg_name");
		String userId = CommMethod.getSessionUser().getId();
		String type = modelaction.getRequest().getParameter("type");
		String list1 = modelaction.getRequest().getParameter("list1");
		List<Map> selList = new ArrayList<>();
		Map<String, String> map = new HashMap<String, String>();
		if (type.equals("1")) { // 对应四个移动按钮
			JSONArray json = JSONArray.fromObject(list);
			for (Object obj : json) {
				JSONObject jo = (JSONObject) obj;
				String TYPE = jo.getString("TYPE");
				if (TYPE.equals("1")) {
					// 在类型为菜单时
					String delSql = "delete  from T_APP_ROLE where TAR_MENU_ID=? and TAR_ROLE_ID=?";
					modelService.execSql(delSql, new Object[] { jo.getString("ID"), cg_name });
					String selectSql = "select * from T_APP_SHOWMANAGE  where TAS_MENU_ID=?";
					List<Map> list2 = modelService.listDataSql(selectSql, new Object[] { jo.getString("ID") });
					addSave(modelaction, modelService, list2, cg_name);

				} else if (TYPE.equals("2")) {

					String delSql = "delete  from T_APP_ROLE where TAR_MENU_ID=? and TAR_ROLE_ID=? and TAR_MOUDLE_ID=?";
					modelService.execSql(delSql, new Object[] { jo.getString("UPID"), cg_name, jo.getString("ID") });

					String selectSql = "select * from T_APP_SHOWMANAGE  where TAS_MENU_ID=? AND TAS_MOUDLE_ID=?";
					List<Map> list2 = modelService.listDataSql(selectSql,
							new Object[] { jo.getString("UPID"), jo.getString("ID") });
					addSave(modelaction, modelService, list2, cg_name);
				} else if (TYPE.equals("3")) {
					String delSql = "delete from T_APP_ROLE where TAR_MENU_ID=? "
							+ " and TAR_ROLE_ID=? and TAR_MOUDLE_ID=? and TAS_FUN_ID=?";

					modelService.execSql(delSql,
							new Object[] { jo.getString("UPID2"), cg_name, jo.getString("UPID"), jo.getString("ID") });

					String selectSql = "select * from T_APP_SHOWMANAGE  where TAS_MENU_ID=? AND TAS_MOUDLE_ID=? AND ID=?";
					List<Map> list2 = modelService.listDataSql(selectSql,
							new Object[] { jo.getString("UPID2"), jo.getString("UPID"), jo.getString("ID") });
					addSave(modelaction, modelService, list2, cg_name);
				}
			}
			map.put("returnMsg", "addSucc");
		} else if (type.equals("2")) {
			// 全部配置

			String delSql = "delete  from T_APP_ROLE where  TAR_ROLE_ID=?";
			modelService.execSql(delSql, new Object[] { cg_name });

			String selectSql = "select * from T_APP_SHOWMANAGE";
			List<Map> list2 = modelService.listDataSql(selectSql);
			addSave(modelaction, modelService, list2, cg_name);
			map.put("returnMsg", "addSucc");
		} else if (type.equals("3")) {
			// 勾选删除

			selList = getRoleUser(modelService, cg_name);
			String name = null;
			// 判断用户功能下是否有用户有功能，没有才能删除（用户拥有角色）
			if (null != selList && selList.size() > 0) {
				int count = selList.size();
				for (int i = 0; i < count; i++) {
					if (i == 0) {
						name = String.valueOf(selList.get(i).get("name"));
					} else {
						name = name + "," + String.valueOf(selList.get(i).get("name"));
					}
				}
				map.put("name", name);
				map.put("returnMsg", "error");

			} else {
				JSONArray json1 = JSONArray.fromObject(list1);
				for (Object obj : json1) {
					JSONObject jo = (JSONObject) obj;
					if (jo.getString("TYPE").equals("1")) {
						// 在类型为菜单时
						String delSql = "delete  from T_APP_ROLE where TAR_MENU_ID=? and TAR_ROLE_ID=?";
						modelService.execSql(delSql, new Object[] { jo.getString("ID"), cg_name });

					} else if (jo.getString("TYPE").equals("2")) {

						String delSql = "delete  from T_APP_ROLE where TAR_MENU_ID=? and TAR_ROLE_ID=? and TAR_MOUDLE_ID=?";
						modelService.execSql(delSql,
								new Object[] { jo.getString("UPID"), cg_name, jo.getString("ID") });

					} else if (jo.getString("TYPE").equals("3")) {
						String delSql = "delete from T_APP_ROLE where TAR_MENU_ID=? "
								+ " and TAR_ROLE_ID=? and TAR_MOUDLE_ID=? and TAS_FUN_ID=? ";

						modelService.execSql(delSql, new Object[] { jo.getString("UPID2"), cg_name,
								jo.getString("UPID"), jo.getString("ID") });

					}
				}
				map.put("returnMsg", "addSucc");
			}

		} else if (type.equals("4")) {
			selList = getRoleUser(modelService, cg_name);
			String name = null;
			// 判断用户功能下是否有用户有功能，没有才能删除（用户拥有角色）
			if (null != selList && selList.size() > 0) {
				int count = selList.size();
				for (int i = 0; i < count; i++) {
					if (i == 0) {
						name = String.valueOf(selList.get(i).get("name"));
					} else {
						name = name + "," + String.valueOf(selList.get(i).get("name"));
					}
				}
				map.put("name", name);
				map.put("returnMsg", "error");
			} else {
				String delSql = "delete from T_APP_ROLE where TAR_ROLE_ID=?";
				modelService.execSql(delSql, new Object[] { cg_name });
				map.put("returnMsg", "addSucc");
			}
		}
		modelaction.setAjaxMap(map);
		return BaseActionSupport.AJAX;

	}

	@SuppressWarnings("unchecked")
	public void addSave(ModelAction modelaction, ModelService modelService, List<Map> list2, String cg_name) {

		try {
			TableDataMapExt addtExt = new TableDataMapExt();
			addtExt.setTableName("T_APP_ROLE");

			if (null != list2 && list2.size() > 0) {
				int num = list2.size();
				for (int i = 0; i < num; i++) {
					addtExt.getColMap().clear();
					CommMethod.addSysDefCol(addtExt.getColMap(), modelaction.getUser());
					addtExt.getColMap().put("TAR_MOUDLE_ID", list2.get(i).get("TAS_MOUDLE_ID"));
					addtExt.getColMap().put("TAR_ROLE_ID", cg_name);
					if (StringUtils.isNotBlank(list2.get(i).get("TAS_SEQ"))) {
						addtExt.getColMap().put("TAR_SEQ", Integer.valueOf(list2.get(i).get("TAS_SEQ").toString()));
					}
					addtExt.getColMap().put("TAR_MENU_ID", list2.get(i).get("TAS_MENU_ID"));
					addtExt.getColMap().put("TAS_FUN_ID", list2.get(i).get("ID"));

					modelService.save(addtExt);
				}

			}
		} catch (Exception e) {
			// TODO: handle exception
			log.error("保存失败", e);
			throw new BussException(modelaction.getText("保存失败"));
		}

	}

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

	private List<Map> getRoleUser(ModelService modelService, String cgName) {
		String selSql = " select t.role_id,t1.name from  sy_user_role t " + " left join sy_user t1 on t1.id=t.user_id "
				+ " where t.USER_ID in (select TAU_USER_ID from T_APP_USER) " + " and t.ROLE_ID=? ";

		return modelService.listDataSql(selSql, new Object[] { cgName });
	}

}
