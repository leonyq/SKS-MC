package com.more.buss.eis.bd.basedos.service.oracle;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * @Description 获取物料组信息
 * @ClassName AjaxGetItemGroup
 * @author 
 */
public class AjaxGetItemGroup implements FuncService {
	
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
	    HttpServletRequest request = modelAction.getRequest();
	
		
		String cigName = modelAction.getParaMap().get("cigName");
	    String cigType = modelAction.getParaMap().get("cigType");
	    String dataAuth = modelAction.getRequest().getParameter("data_auth");//组织机构  
	   //String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    String userId = modelAction.getSessionUser().getId();//用户id
	    String sqlWhere = "";
		
	    String querySql = "select rownum,t.id,t.cig_sn,t.cig_name,t.cig_type,t.data_auth,t2.name as data_auth2 from T_CO_ITEM_GROUP t "
	    		+ " left join sy_dept t2 on t2.id = t.data_auth "
	    		+ " where 1=1  ";
        Map<String, String> map = new HashMap<String, String>();
        if(StringUtils.isNotBlank(dataAuth)){
			sqlWhere+=" and t.data_auth = :dataAuth ";
			map.put("dataAuth",dataAuth);
		}
	else {
			sqlWhere+=" and t.data_auth in (select DEPT_ID from sy_data_auth where user_id = :user_id) ";
			map.put("user_id",userId);
		}        
        if(StringUtils.isNotBlank(cigName)){
			sqlWhere+=" and t.cig_name LIKE '%' ||:cigName|| '%'";
			map.put("cigName",cigName);
		}
		if(StringUtils.isNotBlank(cigType)){
			sqlWhere+=" and t.cig_type = :cigType";
				map.put("cigType",cigType);
		}
        List itemList = modelService.listSql(querySql+sqlWhere, modelAction.getPage(), map, null,null);
        modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(itemList);
		//CommMethod.listMapToEscapeJs(itemList);
		return BaseActionSupport.AJAX;
		
	}

}
