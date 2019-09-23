package com.more.mcmes.productcontrol;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 制令单位信息查询
 * 
 * @author tpdg
 */
public class WorkOrderQueryBom implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
	  String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	  String dataId = modelAction.getDataId();//item_code 机种
    	String sql = "select distinct bd.*,ci.ci_item_name,ci.ci_item_spec  from t_co_bom b  "
		  + "LEFT JOIN t_co_bom_detail bd ON b.ID = bd.CB_BOMID AND BD.DATA_AUTH=B.DATA_AUTH  "
		  + "LEFT JOIN T_CO_ITEM ci ON ci.ci_item_code=bd.cbd_item_code AND CI.DATA_AUTH=B.DATA_AUTH " +
				" where b.cb_item_code=? and b.CB_DEFAULT = 'Y' "+ 
				" AND B.DATA_AUTH=?  " ;
		
		List sList = modelService.listDataSql(sql, new Object[] { dataId,dataAuth});
		
		CommMethod.listToEscapeJs(sList);
		modelAction.setAjaxList(sList);
		return BaseActionSupport.AJAX;
	}
}
