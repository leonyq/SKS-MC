package com.more.mes.smt.workshop;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 车间建模-------查询
 * 
 * @author Administrator
 *
 */
public class WorkShopTreeQuery implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		List<Map> dataList = new ArrayList<Map>();
		String pid = request.getParameter("id");
		String cid = null;
		String userId = modelAction.getUser().getId();
		String typeArea = request.getParameter("typeArea");
		String auth = request.getParameter("dataAuth");
		if (StringUtils.isBlank(auth)) {
			return BaseActionSupport.AJAX;
		}
		String areaName = request.getParameter("areaName");
		Map<String, Object> paraMap = new HashMap<String, Object>();
		LinkedHashSet<String> wkSet = new LinkedHashSet<String>();
		String sqlWhere = "";
		if (StringUtils.isBlank(pid) && ((!"".equals(typeArea) && !"2".equals(typeArea)) || !"".equals(areaName))) {

			String nodeSql = "select * from T_CO_AREA where 1=1 ";

			if (StringUtils.isNotBlank(auth)) {
				nodeSql += " and data_auth=:auth  ";
				paraMap.put("auth", auth);
			} else {
				nodeSql += " and t.DATA_AUTH " + " in( select DEPT_ID from sy_data_auth where USER_ID=:userId1 )  ";
				paraMap.put("userId1", userId);
			}

			// paraMap.put("auth", auth);
			if (!"".equals(typeArea)) {
				sqlWhere = sqlWhere + " and  CA_TYPE = :CA_TYPE ";
				paraMap.put("CA_TYPE", typeArea);
			}
			if (!"".equals(areaName)) {
				sqlWhere = sqlWhere + " and CA_NAME like '%' || :CA_NAME || '%' ";
				paraMap.put("CA_NAME", areaName);
			}
			List<Map> nodelist = modelService.listSql(nodeSql + sqlWhere, null, paraMap, null, null);
			Map<String, Object> nodeMap = null;
			if (nodelist != null && nodelist.size() > 0) {
				int num = nodelist.size();
				for (int i = 0; i < num; i++) {
					nodeMap = new HashMap<String, Object>();
					nodeMap = nodelist.get(i);
					pid = String.valueOf(nodeMap.get("CA_PARENTAREAID"));
					cid = String.valueOf(nodeMap.get("CA_ID"));
					if ("-1".equals(pid)) {
						wkSet.add(cid);
					} else {
						wkSet.add(pid);
					}

				}
			}
			for (String str : wkSet) {
				dataList.addAll(findTreeNode(areaName, auth, userId, str, modelAction, modelService));
			}

		} else {
			String imgPath = Constants.ZTREE_IMG_PATH;
			List<Map> list;
			if (StringUtils.isBlank(pid)) {
				pid = Constants.DEPT_TREE_ROOT_ID;
			}
			String sql = "SELECT t.* from T_CO_AREA t where t.ca_parentareaid = ? and t.CA_TYPE in (?,?)";
			if (StringUtils.isNotBlank(auth)) {
				sql += " and data_auth=? order by CA_NAME ";

				list = modelService.listDataSql(sql, new Object[] { pid, "0", "1", auth });
			} else {
				sql += " and t.DATA_AUTH "
						+ " in( select DEPT_ID from sy_data_auth where USER_ID=? ) order by CA_NAME ";
				list = modelService.listDataSql(sql, new Object[] { pid, "0", "1", userId });
			}

			// String type = " 0,1 ";

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
						if (StringUtils.isNotBlank(auth)) {
							listChild = modelService.listDataSql(sql,
									new Object[] { list.get(i).get("CA_ID"), "0", "1", auth });
						} else {

							listChild = modelService.listDataSql(sql,
									new Object[] { list.get(i).get("CA_ID"), "0", "1", userId });
						}

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
			// CommMethod.listToEscapeJs(slist);
			modelAction.setAjaxList(slist);
			return BaseActionSupport.AJAX;

		}

		modelAction.setAjaxList(dataList);
		return BaseActionSupport.AJAX;
	}

	public List findTreeNode(String areaName, String auth, String userId, String cid, ModelAction modelAction,
			ModelService modelService) {
		String imgPath = Constants.ZTREE_IMG_PATH;
		String sql1 = "";
		List<Map> list = new ArrayList<Map>();

		sql1 = "SELECT t.* from T_CO_AREA t where t.ca_id = ? and t.CA_TYPE in (0,1) ";

		if (StringUtils.isNotBlank(auth)) {
			sql1 += "and t.data_auth=? order by CA_NAME ";
			list = modelService.listDataSql(sql1, new Object[] { cid, auth });
		} else {
			sql1 += " and t.DATA_AUTH "
					+ " in( select DEPT_ID from sy_data_auth where USER_ID=:userId1 ) order by CA_NAME ";
			list = modelService.listDataSql(sql1, new Object[] { cid, userId });

		}

		List<Map> listChild = null;
		List<Map> slist = new ArrayList<Map>();
		Map<String, Object> map = null;
		if (list != null && list.size() > 0) {
			int num = list.size();
			for (int i = 0; i < num; i++) {
				map = new HashMap<String, Object>();
				String upId = String.valueOf(list.get(i).get("CA_PARENTAREAID"));
				map.put("id", list.get(i).get("CA_ID"));
				map.put("name", list.get(i).get("CA_NAME"));
				map.put("upId", list.get(i).get("CA_PARENTAREAID"));
				map.put("dataAuth", list.get(i).get("DATA_AUTH"));
				if (list.get(i).get("CA_TYPE").equals("2")) { // 为线别
					map.put("isParent", "false");
				} else {
					String sql3 = "SELECT t.* from T_CO_AREA t where t.ca_parentareaid = ?  and  t.CA_TYPE in (0,1) ";
					if (StringUtils.isNotBlank(auth)) {
						sql3 += "and t.data_auth=? order by CA_NAME ";
						listChild = modelService.listDataSql(sql3, new Object[] { list.get(i).get("CA_ID"), auth });
					} else {
						sql3 += " and t.DATA_AUTH "
								+ " in( select DEPT_ID from sy_data_auth where USER_ID=:userId1 ) order by CA_NAME ";
						listChild = modelService.listDataSql(sql3, new Object[] { list.get(i).get("CA_ID"), userId });

					}
					// listChild = modelService.listDataSql(sql3,new Object[] {
					// list.get(i).get("CA_ID"),auth });
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
		return slist;
	}

}
