package com.more.mes.smt.production.bommgr;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 修改页面加载bom明细信息
 * @author Administrator
 *
 */
public class AjaxGetBomDetail implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String dataId = modelAction.getRequest().getParameter("dataId");
		String sql1="SELECT DATA_AUTH FROM T_CO_BOM_DETAIL WHERE CB_BOMID = ?";
		HttpServletRequest request = modelAction.getRequest();
		Map<String, String> map = modelService.queryForMap(sql1, new Object[]{dataId});
        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        String type = request.getParameter("type");
        if(StringUtils.isNotEmpty(type)&&type.equals("showDetail")){
            dataAuth = request.getParameter("dataAuth");
        }
		String sql = "select distinct t.*,t1.ci_item_name,t1.ci_item_spec from T_CO_BOM_DETAIL t " +
				"left join t_co_item t1 on t1.ci_item_code = t.cbd_item_code and t1.DATA_AUTH=T.DATA_AUTH " +
				"where t.cb_bomid = ? and t.data_auth = ?  ";
				//"where t.cb_bomid = ? and t.data_auth = ? and t1.data_auth = ? ";
		//List sList = modelService.listDataSql(sql, new Object[] { dataId,map.get("DATA_AUTH"),map.get("DATA_AUTH")});
		List sList = modelService.listDataSql(sql, new Object[] { dataId,dataAuth});
		modelAction.setAjaxList(sList);
		return BaseActionSupport.AJAX;
	}

}

