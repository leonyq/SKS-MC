package com.more.mes.smt.storeitemmanager;

import java.util.ArrayList;
import java.util.List;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * @Description 物料管控信息新增加载物料信息
 * @ClassName DelParameter
 * @author WZY
 * 
 */
public class AjaxAddSuppliesControl implements FuncService
{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) 
	{
		// TODO Auto-generated method stub
		String sql =" SELECT T.ID, T.CI_ITEM_CODE, T.CI_ITEM_NAME, T.CI_ITEM_SPEC, M.WRI_PACK_NUM, T.CI_ITEM_GENRE FROM T_CO_ITEM T LEFT JOIN T_WMS_RECEIVE_ITEM M ON M.WRI_ITEM_CODE = T.CI_ITEM_CODE AND M.DATA_AUTH = T.DATA_AUTH WHERE 1=1 AND T.DATA_AUTH = ?  ";
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		List sqlwList = new ArrayList<>();
		sqlwList.add(dataAuth);
		sqlwList.add(dataAuth);
		List itemList = modelService.listSql(sql, modelAction.getPage(), null, sqlwList, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		
		return BaseActionSupport.AJAX;
	}

}