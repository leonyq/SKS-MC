package com.more.mes.smt.storeitemmanager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * @Description 回填入库信息
 * @ClassName EditBackfillManager
 * 
 */
public class EditBackfillManager implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		String WIC_CTRL_EMP = request.getParameter("WIC_CTRL_EMP");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		Map<String, String> map = new HashMap<String, String>();
		//String sql1="select WIC_ITEM_CODE from T_WMS_ITEM_CONTRAL";
		
		String sql ="select t.ID, w.id as IDS, t.CI_ITEM_NAME,t.CI_ITEM_SPEC,t.CI_ITEM_GENRE,t.CI_MIN_PACK,t.CI_ITEM_CODE "+
				"from T_CO_ITEM t left join T_WMS_ITEM_CONTRAL w on t.CI_ITEM_CODE=w.WIC_ITEM_CODE";
				
		
		String sqlWhere = " where 1 = 1 and WIC_CTRL_EMP=:WIC_CTRL_EMP1 AND t.DATA_AUTH=:dataAuth1 AND w.DATA_AUTH=:dataAuth2 ";
		
		map.put("WIC_CTRL_EMP1", WIC_CTRL_EMP);
		map.put("dataAuth1", dataAuth);
		map.put("dataAuth2", dataAuth);
		
		List list = modelService.listSql(sql+sqlWhere, null,map, null, null);
		
		CommMethod.listToEscapeJs(list);
		modelAction.setAjaxList(list);
				
		return BaseActionSupport.AJAX;
	}

}
