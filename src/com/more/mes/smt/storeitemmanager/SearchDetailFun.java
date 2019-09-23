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
 * @Description 物料管控信息修改加载物料明细
 * @ClassName DelParameter
 * @author WZY
 * 
 */
public class SearchDetailFun implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		String itemCode = request.getParameter("itemCode").trim();//料号
		String itemName = request.getParameter("itemName").trim();//名称
		String itemSpce = request.getParameter("itemSpce").trim();//规格
		String itemGenre = request.getParameter("itemGenre").trim();//类别
		String dataAuth = String.valueOf(request.getSession().getAttribute("mcDataAuth"));//组织机构
		String itemCodeStr = request.getParameter("itemCodes");
		Map<String, String> map = new HashMap<String, String>();
		String sql="SELECT distinct t.ID, t.CI_ITEM_CODE,t.CI_MIN_PACK,t.CI_ITEM_NAME,t.CI_ITEM_SPEC,R.SUPPLIER_NAME,B.VALUE AS CI_ITEM_GENRE "+
		        " FROM T_CO_ITEM t"+
				" LEFT JOIN T_CO_SUPPLIER R ON t.CI_SUPPLIER_CODE = R.SUPPLIER_CODE "+
				" LEFT JOIN SY_DICT_VAL B ON T.CI_ITEM_GENRE=B.CODE ";
		String sqlWhere=" where 1 = 1";
		if (StringUtils.isNotBlank(itemCode)) 
		{
			sqlWhere += " and t.ci_item_code like '%' || :itemCode1 || '%'";
			map.put("itemCode1", itemCode);
		}
		if (StringUtils.isNotBlank(itemName)) 
		{
			sqlWhere +=" and t.CI_ITEM_NAME like '%' ||　:itemName1 || '%'　";
			map.put("itemName1", itemName);
		}
		if (StringUtils.isNotBlank(itemSpce)) 
		{
			sqlWhere +=" and t.CI_ITEM_SPEC like '%' ||　:itemSpce1 || '%'";
			map.put("itemSpce1", itemSpce);
		}
		if (StringUtils.isNotBlank(itemGenre)) {
			sqlWhere +=" and t.CI_ITEM_GENRE=:itemGenre1";
			map.put("itemGenre1", itemGenre);
		}
		sqlWhere += " and t.DATA_AUTH = :DATA_AUTH AND B.DICT_CODE='CI_ITEM_GENRE' ";
		map.put("DATA_AUTH", dataAuth);
		//添加过滤条件
		String[] itemCodes = null;
		if(itemCodeStr != null && itemCodeStr.trim() != ""){
		    StringBuffer sb = new StringBuffer();
		    sb.append("  AND t.CI_ITEM_CODE NOT IN (");
		    itemCodes = itemCodeStr.split(",");
    		for(int i=0;i<itemCodes.length;i++){
    		    if(i == itemCodes.length-1){
    		        sb.append("'"+itemCodes[i]+"')");
    		        break;
    		    }
    		    sb.append("'"+itemCodes[i]+"',");
    		}
    		sqlWhere = sqlWhere + sb.toString();
		}
		
		List list = modelService.listSql(sql+sqlWhere, modelAction.getPage(),map, null, null);
		
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(list);
		modelAction.getAjaxPage().setDataList(list);
		
		return BaseActionSupport.AJAX;
	}
	

}
