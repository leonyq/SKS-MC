package com.more.mcmes.moorder;

import java.util.List;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 制令单 流程
 * 
 * 
 */
public class MoOrderQueryRoute implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String ctId = modelAction.getRequest().getParameter("ctId");
		String dataAuth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		String sql = "select a.CR_MO_INPUT,a.CR_MO_OUTPUT,a.CR_BLOCKS_MSG,a.CR_CONN_MSG from T_CO_TECHNICS s "
				+ " join t_co_route a on a.cr_route_id=s.ct_route_code and s.data_auth=a.data_auth  "
				+ " where s.ct_id = ?  and s.data_auth=?  " ;
		
		List sList = modelService.listDataSql(sql, new Object[] { ctId,dataAuth });
		
		CommMethod.listMapToEscapeJs(sList);
		modelAction.setAjaxList(sList);
		return BaseActionSupport.AJAX;
	}
}
