package com.more.buss.eis.bd.basedos.service.oracle;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 加载物料信息
 * @author fs
 *
 */
public class QueryItemByItemGroupSn1 implements FuncService {

    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest();
        
        String groupSn = request.getParameter("groupSn");
        //String dataAuth = request.getParameter("dataAuth");
        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        //根据物料组编码sn取出物料信息
        String querySql = "select rownum,t.ci_item_type,t.ci_item_code,t.ci_item_name,t.ci_item_spec from T_CO_ITEM t LEFT JOIN T_CO_ITEM_CONNECT a ON t.ci_item_code=a.cic_item_code ";
        //List itemList = modelService.listDataSql(querySql, new Object[] { groupSn });
        
         String sqlWhere=" and a.cig_sn = ? and t.data_auth = ? and a.data_auth=? ";
        List listParam = new ArrayList();
        listParam.add(groupSn);
        listParam.add(dataAuth);
        listParam.add(dataAuth);
        String orderSql=" order by t.ci_item_code";
        List itemList = modelService.listSql(querySql, modelAction.getPage(), sqlWhere, listParam, orderSql,null);
        modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(itemList);
		CommMethod.listMapToEscapeJs(itemList);
		return BaseActionSupport.AJAX;
    }

}