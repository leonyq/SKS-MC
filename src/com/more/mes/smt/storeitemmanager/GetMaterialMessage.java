package com.more.mes.smt.storeitemmanager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * @Description 物料管控信息通过人员看物料
 * @ClassName GetMaterialMessage
 * @author WZY
 * 
 */
public class GetMaterialMessage implements FuncService
{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService)
	{
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		String itemId = request.getParameter("itemId");
		//String dataAuth = request.getParameter("dataAuth");
	 // String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		Map<String, String> map = new HashMap<String, String>();
		String sql ="SELECT w.ID, t.CI_ITEM_NAME,t.CI_ITEM_SPEC,t1.VALUE CI_ITEM_GENRE,t.CI_MIN_PACK,t.CI_ITEM_CODE "+
				"FROM T_CO_ITEM t LEFT JOIN T_WMS_ITEM_CONTRAL w ON t.CI_ITEM_CODE=w.WIC_ITEM_CODE AND w.DATA_AUTH=T.DATA_AUTH " +
				"LEFT JOIN SY_DICT_VAL T1 ON T1.CODE = t.CI_ITEM_GENRE AND T1.DICT_CODE=:CI_ITEM_GENRE1  where 1 = 1 ";
	
		map.put("CI_ITEM_GENRE1", "CI_ITEM_GENRE");
		//map.put("DATA_AUTH", dataAuth);
		
		//String sql1="select *　from T_WMS_ITEM_CONTRAL where id=?";
		
		//String sqlWhere =" where 1 = 1";
		String sqlWhere ="";
		if (StringUtils.isNotBlank(itemId)) 
		{
			sqlWhere+=" and w.WIC_CTRL_EMP = :itemId1";
			map.put("itemId1", itemId);
		}
		
	/*	if (StringUtils.isNotBlank(dataAuth)) 
		{
			sqlWhere+=" and T.DATA_AUTH = :DATA_AUTH2 ";
			map.put("DATA_AUTH2", dataAuth);
		}*/
			
		
		List list = modelService.listSql(sql+sqlWhere, modelAction.getPage(),map, null, null);
		
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(list);
		modelAction.getAjaxPage().setDataList(list);
		
		return BaseActionSupport.AJAX;
	}

}
