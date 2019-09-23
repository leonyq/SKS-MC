package com.more.buss.eis.bd.basedos.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class QueryItemByItemGroupSn implements FuncService {

    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest();
        String groupSn = request.getParameter("groupSn");
        String pageRecord = request.getParameter("pageRecord");
        PaginationImpl page = modelAction.getPage();

        if(StringUtils.isNotBlank(pageRecord)){
            page.setPageRecord(Integer.valueOf(pageRecord));
        }
        //根据物料组编码sn取出物料信息
        String querySql = "select t.ci_item_type,t.ci_item_code,t.ci_item_name,t.ci_item_spec from T_CO_ITEM t LEFT JOIN T_CO_ITEM_CONNECT a ON t.ci_item_code=a.cic_item_code ";
    
        String sqlWhere=" and a.cig_sn = ? ";
        List listParam = new ArrayList();
        listParam.add(groupSn);
        List itemList = modelService.listSql(querySql, page, sqlWhere, listParam, null, null);
        
        modelAction.setPage(page);
        modelAction.setAjaxString(groupSn);
        //modelAction.setAjaxPage(page);
        //modelAction.getAjaxPage() = modelAction.getPage();
        //modelAction.getAjaxPage().setDataList(itemList);
        //modelAction.getRequest().setAttribute("pageItem", page);
        return modelAction.ActionForwardExeid("34d8cbacf63a4578993f1e78185be0b5");
    }

}
