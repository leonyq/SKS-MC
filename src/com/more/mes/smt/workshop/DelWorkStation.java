package com.more.mes.smt.workshop;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import bsh.This;

/**
 * 车间建模----删除工作中心
 * 
 * @author Administrator
 *
 */
public class DelWorkStation implements FuncService {

	private final Log log = LogFactory.getLog(This.class);

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		HttpSession session = request.getSession();
		String iframeId = request.getParameter("iframeId");
		String paraId = CommMethod.escapeJs(request.getParameter("para_id"));// 工作中心的父类ID
		String[] arryIds = request.getParameter("arryid").split(",");// 工作中心的主键ID组
		String[] arryCaIds = null;
		List<Map> caIdList = new ArrayList<Map>();
		Map<String, String> caIdMap = new HashMap<String, String>();
		String sql = "select CA_ID from T_CO_AREA where ID = ?";

		String sql1 = "SELECT COUNT(b.CMO_AREA_SN) as COUNT FROM T_CO_MATERIAL_ONLINE b "
				+ " LEFT JOIN T_CO_AREA a ON b.CMO_AREA_SN=a.CA_PARENTAREAID AND a.DATA_AUTH=? "
				+ "WHERE 1=1 and a.CA_TYPE=? and CA_ID=? ";

		session.setAttribute("idd", paraId);
		try {
			int num = arryIds.length;
			for (int i = 0; i < num; i++) {
				String id = CommMethod.escapeJs(arryIds[i]);
				caIdList = modelService.listDataSql(sql, new Object[] { id });
				caIdMap = caIdList.get(0);
				String caId = caIdMap.get("CA_ID");
				if (i == 0) {
					for (int j = 0; j < arryIds.length; j++) {
						String ids = CommMethod.escapeJs(arryIds[j]);
						List<Map> caIdLists = modelService.listDataSql(sql, new Object[] { ids });
						Map<String, String> countMaps = caIdLists.get(0);
						String caIds = countMaps.get("CA_ID");
						List<Map> countList = modelService.listDataSql(sql1, new Object[] { dataAuth, "2", caIds });
						Map<Object, Object> countMap = countList.get(0);
						int count = Integer.parseInt(countMap.get("COUNT").toString());
						if (count > 0) {
							// throw new BussException(modelAction.getText("该工作中心已关联料表，不可删除"));
							return modelAction.alertParentInfo(modelAction.getText("工作中心已关联料表，不可删除"));
						}
					}
				}
				// 删除t_co_area表数据
				ArrayList delWkList = new ArrayList();
				TableDataMapExt wkTable = new TableDataMapExt();
				wkTable.setTableName("t_co_area");
				wkTable.setSqlWhere(" and ID=?");
				delWkList.add(id);
				wkTable.setSqlWhereArgs(delWkList);
				modelService.del(wkTable);
				// 删除t_workstation表数据
				ArrayList delWkList2 = new ArrayList();
				TableDataMapExt wkTable2 = new TableDataMapExt();
				wkTable2.setTableName("t_workstation");
				wkTable2.setSqlWhere(" and TW_STATIONSN=? and DATA_AUTH=? ");
				delWkList2.add(caId);
				delWkList2.add(dataAuth);
				wkTable2.setSqlWhereArgs(delWkList2);
				modelService.del(wkTable2);
				// 删除T_CO_AREA_DEVICE表数据
				ArrayList delWkList4 = new ArrayList();
				TableDataMapExt wkTable4 = new TableDataMapExt();
				wkTable4.setTableName("T_CO_AREA_DEVICE");
				wkTable4.setSqlWhere(" and CA_ID=? and DATA_AUTH=? ");
				delWkList4.add(caId);
				delWkList4.add(dataAuth);
				wkTable4.setSqlWhereArgs(delWkList4);
				modelService.del(wkTable4);
				// 删除t_workstation_cmd表数据
				ArrayList delWkList3 = new ArrayList();
				TableDataMapExt wkTable3 = new TableDataMapExt();
				wkTable3.setTableName("t_workstation_cmd");
				wkTable3.setSqlWhere(" and TW_STATIONSN=? and DATA_AUTH=? ");
				delWkList3.add(caId);
				delWkList3.add(dataAuth);
				wkTable3.setSqlWhereArgs(delWkList3);
				modelService.del(wkTable3);
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException("删除失败");
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("删除成功"), "0");
	}
}
