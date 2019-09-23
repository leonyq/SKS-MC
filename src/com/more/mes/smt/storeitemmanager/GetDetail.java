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
 * @Description 物料管控信息新增物料明细信息
 * @ClassName DelParameter
 * @author WZY
 * 
 */
public class GetDetail implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		//String WIC_CTRL_EMP = CommMethod.escapeJs(request.getParameter("paraMap1@0#WIC_CTRL_EMP"));
		String sql="SELECT t.ID, t.CI_ITEM_CODE,t.CI_MIN_PACK,t.CI_ITEM_NAME,t.CI_ITEM_SPEC,R.SUPPLIER_NAME,b.VALUE as CI_ITEM_GENRE"
				+" FROM T_CO_ITEM t"+
				" LEFT JOIN T_CO_SUPPLIER R ON t.CI_SUPPLIER_CODE = R.SUPPLIER_CODE AND R.DATA_AUTH = T.DATA_AUTH "
				+ "LEFT JOIN SY_DICT_VAL B ON T.CI_ITEM_GENRE=B.CODE  WHERE 1=1 AND T.DATA_AUTH =? AND B.DICT_CODE='CI_ITEM_GENRE' ";
				
		/*String sql = " SELECT t.ID, t.CI_ITEM_CODE,t.CI_MIN_PACK,t.CI_ITEM_NAME,t.CI_ITEM_SPEC,R.SUPPLIER_NAME,t.CI_ITEM_GENRE "
		            +" FROM T_CO_ITEM t "
		            +" LEFT JOIN T_CO_SUPPLIER R ON t.CI_SUPPLIER_CODE = R.SUPPLIER_CODE AND R.DATA_AUTH = T.DATA_AUTH  "
		            +" LEFT JOIN T_WMS_ITEM_CONTRAL T1 ON  T.CI_ITEM_CODE = T1.WIC_ITEM_CODE "
		            +" WHERE 1 = 1 AND t.CI_ITEM_CODE not in (SELECT T1.WIC_ITEM_CODE FROM T_WMS_ITEM_CONTRAL T1 WHERE DATA_AUTH=? AND WIC_CTRL_EMP=? )AND T.DATA_AUTH =? ";
		*/
		List sqlwList = new ArrayList<>();
		sqlwList.add(dataAuth);
		//sqlwList.add(WIC_CTRL_EMP);
		//sqlwList.add(dataAuth);
	//	sqlwList.add(dataAuth);
		List list = modelService.listSql(sql, modelAction.getPage(), null, sqlwList, null, null);
		
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(list);
		modelAction.getAjaxPage().setDataList(list);
		
		return BaseActionSupport.AJAX;
	}
	
}
