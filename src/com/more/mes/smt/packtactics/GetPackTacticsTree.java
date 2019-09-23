package com.more.mes.smt.packtactics;

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
 * 包装策略配置--新增获取车间下拉树
 * 
 * @author Administrator
 *
 */
public class GetPackTacticsTree implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub

		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		HttpServletRequest request = modelAction.getRequest();
		String pid = request.getParameter("id");
		String imgPath = Constants.ZTREE_IMG_PATH;
		List<Map> list = null;
		String sql = null;
		if (StringUtils.isBlank(pid)) {
			pid = Constants.DEPT_TREE_ROOT_ID;
		}

		sql = "SELECT t.CA_ID AS \"id\",t.CA_NAME AS \"name\",t.CA_PARENTAREAID \"upId\",t.CA_TYPE AREA_TYPE  FROM T_CO_AREA t where t.CA_PARENTAREAID=? and t.data_auth=? and t.CA_TYPE in (?,?) order by t.CA_ID  ";
		list = modelService.listDataSql(sql, new Object[] { pid, dataAuth, "0", "1" });
		List<Map> slist = new ArrayList<Map>();
		Map<String, Object> map = null;
		if (list != null && list.size() > 0) {
			int num = list.size();
			for (int i = 0; i < num; i++) {
				map = new HashMap<String, Object>();
				map.put("id", list.get(i).get("ID"));
				map.put("name", list.get(i).get("NAME"));
				map.put("upId", list.get(i).get("UPID"));
				map.put("AREA_TYPE", list.get(i).get("AREA_TYPE"));
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
