package com.more.mes.smt.workshop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 
 * 车间建模-----新增--视图加载前
 * 
 * @author hys
 *
 */
public class AddWork implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		Map paraMap = new HashMap();
		Map<String, String> listMap = new HashMap<String, String>();
		HttpServletRequest request = modelAction.getRequest();
		// String paraId = request.getParameter("para_id");
		String paraId = modelAction.getDataId();
		String sql = "select t.CA_NAME,t.CA_ID,t.CA_TYPE,t.CA_TRACK_FLAG from T_CO_AREA t where t.CA_ID = ?";
		List<Map> addList = modelService.listDataSql(sql, new Object[] { paraId });
		if (addList != null && !addList.isEmpty()) {
			listMap = addList.get(0);
			String parentName = listMap.get("CA_NAME");
			String parentId = listMap.get("CA_ID");
			String type = listMap.get("CA_TYPE");
			paraMap.put("trackFlag", listMap.get("CA_TRACK_FLAG"));
			paraMap.put("parentname", parentName);
			paraMap.put("parentid", parentId);
			paraMap.put("parentType", type);
			if ("2".equals(type)) {
				paraMap.put("add_type", "2");
				paraMap.put("ca_type", "2");
				paraMap.put("flag_disable", "1");
			} else if ("1".equals(type)) {
				paraMap.put("add_type", "1");
				paraMap.put("ca_type", "1");// 线别新增子区域时
				paraMap.put("flag_disable", "1");
			} else {
				paraMap.put("add_type", "0");
				paraMap.put("ca_type", "0");// 车间新增子区域时
				paraMap.put("flag_disable", "0");
			}
			paraMap.put("para_id", paraId);
			CommMethod.mapToEscapeJs(paraMap);
			modelAction.setDataMap(paraMap);
		} else {
			paraMap.put("add_type", "3");
			paraMap.put("ca_type", "3");// 新增工厂时
			paraMap.put("parentid", "-1");
			paraMap.put("parentname", modelAction.getText("无"));
			paraMap.put("para_id", paraId);
			CommMethod.mapToEscapeJs(paraMap);
			modelAction.setDataMap(paraMap);
		}

		// modelAction.listDataLs(modelAction.getDapt());
		request.setAttribute("iframeid", CommMethod.escapeJs(request.getParameter("iframeid")));
		return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面
		// return modelAction.ActionForward("/plf/workShop/addWorkShop.jsp")
		// ;//转向本工程车间信息新增页面
	}

}
