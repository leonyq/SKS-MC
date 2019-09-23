package com.more.buss.eis.bd.basedos.service.pg;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 *     查询 加载物料信息
 * @author fs
 *
 */
public class SearchItem implements FuncService {

    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
          HttpServletRequest request = modelAction.getRequest();
        String groupSn =request.getParameter("groupSn") ;
        //String groupSn = request.getParameter("groupSn");
        String itemCode =request.getParameter("groupCode") ;
        String dataAuth =request.getParameter("dataAuth") ;
        //String itemCode = request.getParameter("groupCode");
        String querySql = "select row_number() over() as ROWNUM,t.ci_item_type,t.ci_item_code,t.ci_item_name,t.ci_item_spec from T_CO_ITEM t LEFT JOIN T_CO_ITEM_CONNECT a ON t.ci_item_code=a.cic_item_code ";
        //List itemList = modelService.listDataSql(querySql, new Object[] { groupSn });
        Map<String, String> map = new HashMap<String, String>();
        String sqlWhere=" where 1=1 ";
        sqlWhere+=" and t.data_auth = :data_auth ";
        map.put("data_auth", dataAuth);          
       sqlWhere+=" and a.cig_sn = :groupSn ";
        map.put("groupSn", groupSn);
        //List listParam = new ArrayList();
        //listParam.add(groupSn);
        if(null!=itemCode || ""!=itemCode){
              sqlWhere+=" and t.ci_item_code like '%' ||:itemCode|| '%'";
              map.put("itemCode", itemCode);
        }
        
        String orderSql=" order by t.ci_item_code";
        //List itemList = modelService.listSql(querySql, modelAction.getPage(), sqlWhere, listParam, orderSql,null);
        List itemList = modelService.listSql(querySql+sqlWhere+orderSql, modelAction.getPage(), map, null ,null);
        modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(itemList);

		return BaseActionSupport.AJAX;
    }

}