package com.more.mes.smt.wmsmodel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 仓库建模树形
 * 
 * @author development
 *
 */
public class GetWmsAreaTree implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		// String dataAuth =
		// String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String dataAuth = request.getParameter("dataAuth");
		String userId = modelAction.getSessionUser().getId();
		String pid = request.getParameter("id");
		String imgPath = Constants.ZTREE_IMG_PATH;
		if (StringUtils.isBlank(pid)) {
			pid = Constants.DEPT_TREE_ROOT_ID;
		}
		String sql = null;
		List<Map> list = new ArrayList<>();
		if (StringUtils.isNotBlank(dataAuth)) {
			sql = "SELECT t.wa_area_sn AS \"id\",t.wa_area_name AS \"name\", t.wa_superior_sn \"upId\",t.WA_AREA_TYPE  FROM t_wms_area t where t.wa_superior_sn=? and t.data_auth=? order by t.WA_AREA_SN ";
			list = modelService.listDataSql(sql, new Object[] { pid, dataAuth });
		}
		// else {
		// sql = "SELECT t.wa_area_sn AS \"id\",t.wa_area_name AS \"name\",
		// t.wa_superior_sn \"upId\",t.WA_AREA_TYPE FROM t_wms_area t where
		// t.wa_superior_sn=? and t.data_auth in (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE
		// USER_ID = ?) order by t.WA_AREA_SN ";
		// list = modelService.listDataSql(sql,new Object[] { pid,userId });
		// }

		List<Map> listChild = null;
		List<Map> slist = new ArrayList<Map>();
		Map<String, Object> map = null;
		if (list != null && list.size() > 0) {
			int num = list.size();
			for (int i = 0; i < num; i++) {
				map = new HashMap<String, Object>();
				map.put("dataAuth", dataAuth);
				map.put("id", list.get(i).get("ID"));
				map.put("name", list.get(i).get("NAME"));
				map.put("upId", list.get(i).get("UPID"));
				map.put("AREA_TYPE", list.get(i).get("WA_AREA_TYPE"));
				if (list.get(i).get("WA_AREA_TYPE").equals("3")) { // 为库位
					map.put("isParent", "false");
				} else {
					if (StringUtils.isNotBlank(dataAuth)) {
						listChild = modelService.listDataSql(sql, new Object[] { list.get(i).get("ID"), dataAuth });
					}
					// else {
					// listChild = modelService.listDataSql(sql,new Object[] {
					// list.get(i).get("ID"),userId });
					// }

					if (listChild != null && listChild.size() > 0) {
						map.put("isParent", "true");
					} else {
						map.put("isParent", "false");
					}
				}
				map.put("icon", imgPath + "ico-right-last.png");
				map.put("iconClose", imgPath + "ico-right-close.png");
				map.put("iconOpen", imgPath + "ico-right-open.png");
				slist.add(map);
			}
		}
		CommMethod.listToEscapeJs(slist);
		modelAction.setAjaxList(slist);
		return BaseActionSupport.AJAX;
	}
}
