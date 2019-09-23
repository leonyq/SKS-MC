package com.more.mes.smt.wmsreceivemanager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取机种信息
 * @author development
 *
 */
public class AjaxGetBomInfo implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
	String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	/*	String sql = "SELECT t.id,t.cb_item_code,a.ci_item_name,a.ci_item_spec,b.customer," +
				"a.CI_MIN_PACK FROM t_co_bom t " +
				"LEFT JOIN t_co_item a ON a.ci_item_code=t.cb_item_code " +
				"LEFT JOIN t_co_customer b ON b.cust_code=a.ci_cust_code " +
				"where t.CB_DEFAULT='Y' ";*/
				 Map<String, String> map = new HashMap<String, String>();
		String sql="SELECT T.PROJECT_ID,T.PRODUCT_MATERIAL,T.PRODUCT_NAME,T.PRODUCT_STANDARD,A.CUSTOMER,b.CI_MIN_PACK,c.PM_MO_NUMBER "+
                    " FROM T_PM_PROJECT_BASE T "+
                    " LEFT JOIN t_co_customer A ON T.CUST_CODE=A.CUST_CODE and a.data_auth=t.data_auth "+
                    " left join t_co_item b on b.CI_ITEM_CODE=t.PRODUCT_MATERIAL and b.data_auth=t.data_auth "+
                    " left join T_PM_MO_BASE c on c.PM_PROJECT_ID=t.PROJECT_ID and c.data_auth=t.data_auth" ;
                    //" where T.data_auth=? AND A.DATA_AUTH=? AND B.DATA_AUTH=? AND C.DATA_AUTH=? ";
         String sqlWhere = "  where T.data_auth=:dataAuth1  ";   // AND A.DATA_AUTH=:dataAuth2 AND B.DATA_AUTH=:dataAuth3 AND C.DATA_AUTH=:dataAuth4
         map.put("dataAuth1", dataAuth);
         //map.put("dataAuth2", dataAuth);
         //map.put("dataAuth3", dataAuth);
        // map.put("dataAuth4", dataAuth);
            
        //List<Map> list = modelService.listDataSql(sql, new Object[] {dataAuth,dataAuth,dataAuth,dataAuth});
		//List itemList = modelService.listSql(sql+sqlWhere, modelAction.getPage(), map, null,null);
		List itemList = modelService.listSql(sql+sqlWhere, modelAction.getPage(), map, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}
   

}
