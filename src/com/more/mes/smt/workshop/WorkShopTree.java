package com.more.mes.smt.workshop;

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
 * 车间建模ztree
 * 
 * @author development
 *
 */
public class WorkShopTree implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String pid = CommMethod.escapeJs(request.getParameter("id"));
		String imgPath = Constants.ZTREE_IMG_PATH;
		if (StringUtils.isBlank(pid)) {
			pid = Constants.DEPT_TREE_ROOT_ID;
		}
		String sql = "SELECT t.* from T_CO_AREA t where t.ca_parentareaid = ? and t.CA_TYPE in (?,?)"
				+ "  order by CA_NAME";
		// String type = " 0,1 ";
		List<Map> list = modelService.listDataSql(sql, new Object[] { pid, "0", "1" });
		List<Map> listChild = null;
		List<Map> slist = new ArrayList<Map>();
		Map<String, Object> map = null;
		if (list != null && list.size() > 0) {
			int num = list.size();
			for (int i = 0; i < num; i++) {
				map = new HashMap<String, Object>();
				map.put("id", list.get(i).get("CA_ID"));
				map.put("name", list.get(i).get("CA_NAME"));
				map.put("upId", list.get(i).get("CA_PARENTAREAID"));
				map.put("dataAuth", list.get(i).get("DATA_AUTH"));
				if (list.get(i).get("CA_TYPE").equals("2")) { // 为线别
					map.put("isParent", "false");
				} else {
					listChild = modelService.listDataSql(sql, new Object[] { list.get(i).get("CA_ID"), "0", "1" });
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
