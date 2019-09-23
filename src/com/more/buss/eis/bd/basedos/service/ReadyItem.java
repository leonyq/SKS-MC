package com.more.buss.eis.bd.basedos.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class ReadyItem implements FuncService {

    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest();
        String groupSn = request.getParameter("groupSn");
        PaginationImpl page = modelAction.getPage();
        String sql = "select t.cig_sn from T_CO_ITEM_GROUP t WHERE rownum=1";
        List dataList = modelService.listDataSql(sql);
        String cig_sn = null;
        if(dataList.size()>0){
            HashMap map= (HashMap) dataList.get(0);
            cig_sn = map.get("cig_sn").toString();
        }
        
        //根据物料组编码sn取出物料信息
        String querySql = "select t.ci_item_type,t.ci_item_code,t.ci_item_name,t.ci_item_spec from T_CO_ITEM t LEFT JOIN T_CO_ITEM_CONNECT a ON t.ci_item_code=a.cic_item_code ";
        String sqlWhere=" and a.cig_sn = ? ";
        List listParam = new ArrayList();
        listParam.add(cig_sn);
        List itemList = modelService.listSql(querySql, page, sqlWhere, listParam, null, null);
        //modelAction.setPage(page);
        modelAction.setPage(page);
        //modelAction.getRequest().setAttribute("pageItem", page);
        //return modelAction.ActionForward("/buss/msbg/basicData/item/Wul.jsp");// 该ID为功能对应的视图ID
        return modelAction.ActionForwardExeid("01677bc4274a4193837e94e1e07f8f9a");// 该ID为功能对应的视图ID
    }

}
