package com.more.buss.zhiju.service.base;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 查询制具库位
 * @author development
 *
 */
public class ZJGetStock implements FuncService
{

  @SuppressWarnings({"rawtypes", "static-access"})
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String  cfiFixSn = request.getParameter("CFI_FIX_SN");
    //String dataAuth = request.getParameter("DATA_AUTH");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String sql ="select T2.WA_AREA_NAME"  
        + " from T_CO_FIXTURE_INFO T "
        + " LEFT JOIN T_WMS_AREA T2 ON T.CFI_STOCK_SN=T2.WA_AREA_SN where 1=1   ";
    List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
    
    if (StringUtils.isNotBlank(dataAuth))
    {
      sql +=" and t.data_auth =? ";
     list = modService.listDataSql(sql,new Object[]{dataAuth});
    }else{
    	list = modService.listDataSql(sql);
    }
    
    
    
    if (StringUtils.isNotBlank(cfiFixSn))
    {
      sql +=" and CFI_FIX_SN =? ";
     list = modService.listDataSql(sql,new Object[]{cfiFixSn});
    }else{
    	list = modService.listDataSql(sql);
    }
    CommMethod.listMapToEscapeJs(list);
    
    
    modelAction.setAjaxList(list);
    
    return modelAction.AJAX;
  }

}
