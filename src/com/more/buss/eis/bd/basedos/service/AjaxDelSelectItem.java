package com.more.buss.eis.bd.basedos.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * ajax删除所选择的物料
 * @author fs
 *
 */
public class AjaxDelSelectItem implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());
	
	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		try {
			//String dataAuth =  request.getParameter("dataAuth");
			String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
			String groupSn = request.getParameter("groupSn");
			String itemCode=request.getParameter("ITEM_CODE");//物料代码
			List<Object> sqlwList = new ArrayList<>();
			sqlwList.add(dataAuth);
			sqlwList.add(groupSn);
			sqlwList.add(itemCode);
			TableDataMapExt itemTable = new TableDataMapExt();
			if(!itemCode.equals("")){
				itemTable.setTableName("T_CO_ITEM_CONNECT");
				itemTable.setSqlWhere(" and data_auth = ? and cig_sn=? and cic_item_code=? ");
				itemTable.setSqlWhereArgs(sqlwList);
				modelService.del(itemTable);
				Map<String, String> map = new HashMap<String, String>();
				map.put("suc_msg", "删除成功");
				modelAction.setAjaxMap(map);
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("删除失败"), e);
		}
		
		return BaseActionSupport.AJAX;
	}

}
