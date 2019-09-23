package com.more.mes.smt.wmssparekmanager;

import java.util.List;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 查询库位
 * @author Administrator
 *
 */
public class GetSpareStock implements FuncService
{

  @SuppressWarnings({"rawtypes", "static-access"})
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String  WSI_ITEM_SN = request.getParameter("WSI_ITEM_SN");
    List listParam=new ArrayList();
    String sql ="select T2.WA_AREA_NAME"  
        + " from T_WMS_SPARE_INFO T "
        + " LEFT JOIN T_WMS_AREA T2 ON T.WSI_STOCK_SN=T2.WA_AREA_SN AND T2.DATA_AUTH=? ";
    String sqlWhere=" AND T.DATA_AUTH=? ";
    listParam.add(dataAuth);
    listParam.add(dataAuth);
    if (StringUtils.isNotBlank(WSI_ITEM_SN))
    {
      sqlWhere +=" and WSI_ITEM_SN = ? ";
      listParam.add(WSI_ITEM_SN);
    }
    List list=modService.listSql(sql, null, sqlWhere, listParam, null,null);
    CommMethod.listMapToEscapeJs(list);
    modelAction.setAjaxList(list);
    
    return modelAction.AJAX;
  }

}
