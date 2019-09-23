package com.more.buss.xgglue.service.base;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 辅料信息 获取修改的数据
 * @author development
 *
 */
public class EditXGInfo implements FuncService
{

  @SuppressWarnings({"rawtypes", "static-access"})
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String  ctiTinSn = request.getParameter("CTI_TIN_SN");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    
    String sql ="select T2.WA_AREA_NAME,T.CTI_MIX_TIME,T.CTI_DECIDE,T.CTI_STOCK_SN,T.CTI_WH_CODE,to_char(T.CTI_PRODUCT_DATE,'yyyy-mm-dd') CTI_PRODUCT_DATE,T.CTI_THAWING_MAX_CYCLE,T.CTI_MIX_MAX_TIME "  
        + " from T_CO_TIN_INFO T "
        + " LEFT JOIN T_WMS_AREA T2 ON T.CTI_STOCK_SN=T2.WA_AREA_SN and T2.DATA_AUTH=T.DATA_AUTH WHERE 1=1 ";//
    
    String sqlWhere = " ";
    Map<String, Object> paraMap = new HashMap<String, Object>();
    if (StringUtils.isNotBlank(ctiTinSn))
    {
      sqlWhere +=" and CTI_TIN_SN = :CTI_TIN_SN ";
      paraMap.put("CTI_TIN_SN", ctiTinSn);
    }
    
    
    //List list = modService.listSql(sql, null, sqlWhere, null, sqlWhere, null);
    List<Map> list = modService.listSql(sql+sqlWhere, null, paraMap,
    	      "", null);
    CommMethod.listToEscapeJs(list);
    modelAction.setAjaxList(list);
    
    return modelAction.AJAX;
  }

}
