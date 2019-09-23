package com.more.buss.eis.bd.basedos.service.pg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * @Description 根据物料组物料获取信息
 * @ClassName AjaxFindItemBySnAndCondition
 * @author 
 */
public class AjaxFindItemBySnAndCondition implements FuncService {
	
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		
	
		
		
		String cigName = modelAction.getParaMap().get("cigName");
	    String cigType = modelAction.getParaMap().get("cigType");
		String itemCode = modelAction.getParaMap().get("itemCode");
	    String itemName = modelAction.getParaMap().get("itemName");
	    String itemSpec = modelAction.getParaMap().get("itemSpec");
	    String itemType = modelAction.getParaMap().get("itemType");
	    String dataAuth = modelAction.getRequest().getParameter("data_auth");//组织机构
	    String userId = modelAction.getSessionUser().getId();//用户id	 
	    //根据物料、物料组查询条件得到所对应的物料组
        String querySql = "SELECT row_number() over() as ROWNUM,T1.ID,T1.CIG_SN,T1.CIG_NAME,T1.CIG_TYPE,T1.DATA_AUTH,SD.NAME AS DATA_AUTH2  " +
        		"FROM T_CO_ITEM_GROUP T1 " +
        		"LEFT JOIN SY_DEPT SD ON SD.ID = T1.DATA_AUTH " +
        		"WHERE T1.CIG_SN IN "+
        		"(SELECT CIG_SN FROM T_CO_ITEM_CONNECT T2 "+
        		"WHERE T1.CIG_SN = T2.CIG_SN "+
        		"AND T2.CIC_ITEM_CODE IN "+
        		"(SELECT CI_ITEM_CODE "+
        		"FROM T_CO_ITEM T3 "+
        		"WHERE T2.CIC_ITEM_CODE = T3.CI_ITEM_CODE ";
	Map<String, String> map = new HashMap<String, String>();
	if(StringUtils.isNotBlank(dataAuth)){
		querySql += " AND T1.DATA_AUTH = :DATA_AUTH1 AND T2.DATA_AUTH = :DATA_AUTH2 AND T3.DATA_AUTH = :DATA_AUTH3  ";	
		map.put("DATA_AUTH1", dataAuth);
		map.put("DATA_AUTH2", dataAuth);
		map.put("DATA_AUTH3", dataAuth);		
	}else {
		querySql+=" and T3.DATA_AUTH in (select DEPT_ID from sy_data_auth where user_id = :user_id) AA  ";
		map.put("user_id",userId);  		
	}  
     if(StringUtils.isNotBlank(itemCode)){
         
        	querySql += " AND T3.CI_ITEM_CODE LIKE '%' || :itemCode || '%'";
        	map.put("itemCode", itemCode);
		}
		if(StringUtils.isNotBlank(itemName)){
			querySql += " AND T3.CI_ITEM_NAME LIKE '%' || :itemName || '%'";
			map.put("itemName", itemName);
		}
		if(StringUtils.isNotBlank(itemSpec)){
			querySql += " AND T3.CI_ITEM_SPEC LIKE '%' || :itemSpec || '%'";
			map.put("itemSpec", itemSpec);
		}
		if(StringUtils.isNotBlank(itemType)){
			querySql += " AND T3.CI_ITEM_TYPE = :itemType ";
			map.put("itemType", itemType);
		}
		
		querySql += "))";
			if(StringUtils.isNotBlank(cigName)){
			querySql += " AND T1.CIG_NAME LIKE '%' || :cigName || '%'";
			map.put("cigName", cigName);
		}
		if(StringUtils.isNotBlank(cigType)){
			querySql += " AND T1.CIG_TYPE = :cigType ";
			map.put("cigType", cigType);
		}
		if(StringUtils.isBlank(dataAuth)){
			querySql+="  AND T1.DATA_AUTH in (select DEPT_ID from sy_data_auth where user_id = :user_id1)  ";
			map.put("user_id1",userId);       	
		}
		List itemList = modelService.listSql(querySql, modelAction.getPage(), map,null,null);
	    modelAction.setAjaxPage(modelAction.getPage());
	    modelAction.getAjaxPage().setDataList(itemList);
	    CommMethod.listMapToEscapeJs(itemList);
	    return BaseActionSupport.AJAX;
	}

}
