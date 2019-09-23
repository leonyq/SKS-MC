package com.more.buss.eis.bd.basedos.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 *   物料组--  ajax保存选择的物料
 * @author fs
 *
 */
public class AjaxSaveSelectItem implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());
	
	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String groupSn = request.getParameter("groupSn");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String itemCode=request.getParameter("ITEM_CODE");//物料代码
	
		TableDataMapExt itemTable = new TableDataMapExt();
		String tempId = StringUtils.getUUID();
		itemTable.setTableName("T_CO_ITEM_CONNECT");
		itemTable.getColMap().put("data_auth", dataAuth);
		itemTable.getColMap().put("id", tempId);
		itemTable.getColMap().put("cig_sn", groupSn);
		itemTable.getColMap().put("cic_item_code", itemCode);
		modelService.save(itemTable);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("suc_msg", "保存成功");
		modelAction.setAjaxMap(map);
		return BaseActionSupport.AJAX;
	}

}
