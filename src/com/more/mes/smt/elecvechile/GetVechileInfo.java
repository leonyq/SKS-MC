package com.more.mes.smt.elecvechile;

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

public class GetVechileInfo implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String id = CommMethod.escapeJs(request.getParameter("id"));
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    
    
    String sql = "select  WEC_SN,DATA_AUTH  from T_WMS_ELEC_VECHILE where id=?";
    Map<String, String> map = new HashMap<String, String>();

    List<Map> list = modService.listDataSql(sql, new Object[] {id});

    if (null!=list && list.size() > 0)
    {
      Map dataMapsMap = list.get(0);
      String sql1 = "select * from T_WMS_ELEC_VECHILE_DETAIL ";
      String sqlWhere = " where 1 = 1 and WEC_SN = :WEC_SN1 and DATA_AUTH = :DATA_AUTH ";
      map.put("WEC_SN1", (String)dataMapsMap.get("WEC_SN"));
      map.put("DATA_AUTH", (String)dataMapsMap.get("DATA_AUTH"));
      List itemList = modService.listSql(sql1+sqlWhere, null,map, null, null);
      CommMethod.listToEscapeJs(itemList);
      modelAction.setAjaxList(itemList);
      return BaseActionSupport.AJAX;

    }
    else
    {
      modelAction.setAjaxList(null);
      return BaseActionSupport.AJAX;
    }

  }

}
