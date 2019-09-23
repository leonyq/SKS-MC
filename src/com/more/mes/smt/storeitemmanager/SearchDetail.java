package com.more.mes.smt.storeitemmanager;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * @Description 物料管控信息修改加载物料明细
 * @ClassName DelParameter
 * @author WZY
 * 
 */
public class SearchDetail implements FuncService
{

	
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) 
	{
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String wicCtrlEmp = request.getParameter("WIC_CTRL_EMP");
		//String userId=modelAction.getUser().getId();
		String sql="SELECT distinct t.ID, t.CI_ITEM_CODE,t.CI_MIN_PACK,t.CI_ITEM_NAME,t.CI_ITEM_SPEC,R.SUPPLIER_NAME,B.VALUE AS CI_ITEM_GENRE "
				+" FROM T_CO_ITEM t"+
				" LEFT JOIN T_WMS_ITEM_CONTRAL F ON F.WIC_ITEM_CODE = T.CI_ITEM_CODE  AND F.DATA_AUTH = T.DATA_AUTH "+
				" LEFT JOIN T_CO_SUPPLIER R ON t.CI_SUPPLIER_CODE = R.SUPPLIER_CODE "
				+ "LEFT JOIN SY_DICT_VAL B ON T.CI_ITEM_GENRE=B.CODE  WHERE 1=1 AND T.DATA_AUTH =? AND B.DICT_CODE='CI_ITEM_GENRE'   ";
			//	" AND  t.CI_ITEM_CODE not in(select  E.WIC_ITEM_CODE  FROM T_WMS_ITEM_CONTRAL E WHERE E.DATA_AUTH = ? AND E.wic_ctrl_emp=? ) "; //AND T.DATA_AUTH = ?  AND AND R.DATA_AUTH = ?
		List sqlwList = new ArrayList<>();
		
		sqlwList.add(dataAuth);
	//	sqlwList.add("07f8400ec1284157922f11e6ec5d0a43");
	//	sqlwList.add("736739ca20de401c8f1af63fb7f77826");
		//sqlwList.add(dataAuth);
		List list = modelService.listSql(sql, modelAction.getPage(), null, sqlwList, null, null);
		
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(list);
		modelAction.getAjaxPage().setDataList(list);
		
		return BaseActionSupport.AJAX;
	}

}