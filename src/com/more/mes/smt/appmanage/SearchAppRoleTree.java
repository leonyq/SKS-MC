package com.more.mes.smt.appmanage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * APP----角色功能----配置权限查询树形数据
 * 
 * @author Administrator
 *
 */
public class SearchAppRoleTree implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	public String exeFunc(ModelAction modelaction, ModelService modelService) {
		HttpServletRequest request = modelaction.getRequest();
		String id = request.getParameter("ID");
		String menuId = request.getParameter("menuId");

		List<Map> list = new ArrayList<Map>();
		List<Map> list2 = new ArrayList<Map>();
		Map<String, String> nullMap = new HashMap<String, String>();

		list2 = this.selectTreeP(id, modelService, list2, menuId);
		list.addAll(list2);

		modelaction.setAjaxList(list);
		return BaseActionSupport.AJAX;

	}

	@SuppressWarnings("unchecked")
	public List<Map> selectTreeP(String proSn, ModelService modelService, List<Map> resList, String menuId
			) {
		List<Map> dataList = new ArrayList<Map>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String imgPath = Constants.ZTREE_IMG_PATH;
		String wkiKeypSn = null;
		String wkiSn = null;

		String sql = " select distinct T.TAR_MENU_ID ,T1.VALUE  from T_APP_ROLE T "
				+ " LEFT JOIN SY_DICT_VAL  T1 ON T.TAR_MENU_ID=T1.CODE "
				+ " WHERE T1.DICT_CODE=? and t.TAR_ROLE_ID=? ";

		if (StringUtils.isNotBlank(menuId)) {
			sql += " and t.TAR_MENU_ID = ? ";
			dataList = modelService.listDataSql(sql, new Object[] { "MAIN_MENU", proSn, menuId});
		} else {
			dataList = modelService.listDataSql(sql, new Object[] { "MAIN_MENU", proSn });
		}

		if (dataList != null && !dataList.isEmpty()) {
			int count = dataList.size();
			for (int i = 0; i < count; i++) {
				Map<String, Object> resMap = new HashMap<String, Object>();
				paramMap = dataList.get(i);
				wkiKeypSn = String.valueOf(paramMap.get("TAR_MENU_ID"));
				// wkiSn = String.valueOf(paramMap.get("TAS_MENU_ID"));
				resMap.put("id", wkiKeypSn);
				resMap.put("name", String.valueOf(paramMap.get("VALUE")));
				resMap.put("upId", "-1");
				resMap.put("type", "1");
				resMap.put("icon", imgPath + "ico-right-last.png");
				resMap.put("iconClose", imgPath + "ico-right-close.png");
				resMap.put("iconOpen", imgPath + "ico-right-open.png");
				resList.add(resMap);
				this.selectTreeC(wkiKeypSn, modelService, resList, proSn);
			}
		}
		return resList;
	}

	public List<Map> selectTreeC(String proSn, ModelService modelService, List<Map> resList, String id) {
		List<Map> dataList = new ArrayList<Map>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String imgPath = Constants.ZTREE_IMG_PATH;
		String wkiKeypSn = null;
		String wkiSn = null;
		String name = null;
		String sql = "select distinct t.TAR_MOUDLE_ID,t1.TAM_MOUDLE_NAME,TAR_MENU_ID from T_APP_ROLE t"
				+ " left join T_APP_MOUDLE t1 on t.TAR_MOUDLE_ID=t1.id"
				+ " WHERE t.TAR_MENU_ID=? and t.TAR_ROLE_ID=? ";

		dataList = modelService.listDataSql(sql, new Object[] { proSn, id});
		if (dataList != null && !dataList.isEmpty()) {
			int count = dataList.size();
			for (int i = 0; i < count; i++) {
				Map<String, Object> resMap = new HashMap<String, Object>();
				paramMap = dataList.get(i);
				wkiKeypSn = String.valueOf(paramMap.get("TAR_MOUDLE_ID"));
				wkiSn = String.valueOf(paramMap.get("TAR_MENU_ID"));
				name = String.valueOf(paramMap.get("TAM_MOUDLE_NAME"));
                resMap.put("id", wkiKeypSn);
				resMap.put("name", name);
				resMap.put("upId", wkiSn);
				resMap.put("type", "2");
				resMap.put("icon", imgPath + "ico-right-last.png");
				resMap.put("iconClose", imgPath + "ico-right-close.png");
				resMap.put("iconOpen", imgPath + "ico-right-open.png");
				resList.add(resMap);
				this.selectTreeB(wkiKeypSn, modelService, resList, id);
			}
		}
		return resList;
	}

	@SuppressWarnings("rawtypes")
	public List<Map> selectTreeB(String proSn, ModelService modelService, List<Map> resList, String id) {
		List<Map> dataList = new ArrayList<Map>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String imgPath = Constants.ZTREE_IMG_PATH;
		String wkiKeypSn = null;
		String wkiSn = null;
		String name = null;
		String sql = " select distinct T1.TAS_FUN_ID ,T.TAS_FUN_NAME,T1.TAR_MOUDLE_ID  from T_APP_ROLE t1 "
				+ " left join T_APP_SHOWMANAGE T on t1.TAS_FUN_ID=t.id"
				+ " WHERE T1.TAR_MOUDLE_ID=? and t1.TAR_ROLE_ID=? ";

		dataList = modelService.listDataSql(sql, new Object[] { proSn, id});
		if (dataList != null && !dataList.isEmpty()) {
			int count = dataList.size();
			for (int i = 0; i < count; i++) {
				Map<String, Object> resMap = new HashMap<String, Object>();
				paramMap = dataList.get(i);
				wkiKeypSn = String.valueOf(paramMap.get("TAS_FUN_ID"));
				wkiSn = String.valueOf(paramMap.get("TAR_MOUDLE_ID"));
				name = String.valueOf(paramMap.get("TAS_FUN_NAME"));
                resMap.put("id", wkiKeypSn);
				resMap.put("name", name);
				resMap.put("upId", wkiSn);
				resMap.put("type", "3");
				resMap.put("icon", imgPath + "ico-right-last.png");
				resMap.put("iconClose", imgPath + "ico-right-close.png");
				resMap.put("iconOpen", imgPath + "ico-right-open.png");
				resList.add(resMap);
				// this.selectTreeC(wkiKeypSn, modelService, resList);
			}
		}
		return resList;
	}
}
