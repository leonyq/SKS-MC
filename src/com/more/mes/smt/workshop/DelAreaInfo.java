package com.more.mes.smt.workshop;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 车间建模----删除车间/线别
 * @author Administrator
 *
 */
public class DelAreaInfo implements FuncService{
	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		// HttpSession session = request.getSession();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String caId = request.getParameter("para_id").trim();
		// session.setAttribute("idd", caId);
		String findAreaSql = "select count(*) as count from T_CO_MATERIAL_LINE where CML_AREA_SN = ? and DATA_AUTH =?  ";
		List<Map> countList = modelService.listDataSql(findAreaSql, new Object[] { caId, dataAuth });
		Map<Object, Object> countMap = countList.get(0);
		int count = Integer.parseInt(countMap.get("COUNT").toString());
		if (count > 0) {
			throw new BussException(modelAction.getText("该线别已关联料表，不可删除"));
		}
		String sqlId = "select CA_ID from T_CO_AREA where CA_PARENTAREAID = ? AND DATA_AUTH = ? ";
		List<Object> sqlList = modelService.listDataSql(sqlId, new String[] { caId, dataAuth });
		if (sqlList != null && !sqlList.isEmpty()) {
			return modelAction.alertParentInfo(modelAction.getText("请先删除相关子节点"));
		} else {
			try {
				// 删除车间或线别
				List<Integer> list = new ArrayList<Integer>();
				ArrayList<Object> wtRep = new ArrayList<Object>();
				TableDataMapExt wttd = new TableDataMapExt();
				wttd.setTableName("T_CO_AREA");
				wttd.setSqlWhere(" and CA_ID=? and DATA_AUTH=? ");
				wtRep.add(caId);
				wtRep.add(dataAuth);
				wttd.setSqlWhereArgs(wtRep);
				modelAction.setAjaxList(list);
				modelService.del(wttd);
				// 删除设备关联
				ArrayList<Object> wtRep2 = new ArrayList<Object>();
				TableDataMapExt wttd2 = new TableDataMapExt();
				wttd2.setTableName("T_CO_AREA_DEVICE");
				wttd2.setSqlWhere(" and CA_ID=? and DATA_AUTH=? ");
				wtRep2.add(caId);
				wtRep2.add(dataAuth);
				wttd2.setSqlWhereArgs(wtRep2);
				modelService.del(wttd2);
				// 删除负责人关联
				ArrayList<Object> wtRep3 = new ArrayList<Object>();
				TableDataMapExt wttd3 = new TableDataMapExt();
				wttd3.setTableName("T_CO_AREA_CHARGE");
				wttd3.setSqlWhere(" and CA_ID=? and DATA_AUTH=? ");
				wtRep3.add(caId);
				wtRep3.add(dataAuth);
				wttd3.setSqlWhereArgs(wtRep3);
				modelService.del(wttd3);
			} catch (Exception e) {

				throw new BussException("删除失败");
			}
		}
		String iframeId = request.getParameter("iframeId");
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("删除成功"), "0");
	}
}
