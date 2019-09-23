package com.more.mes.smt.wmssparekmanager;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**获取物料信息
 * @author development
 */
public class AjaxGetItemInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String itemSn = request.getParameter("itemSn");
    Map<String, Object> map = new HashMap<String, Object>();
    List<Map<String, Object>> resultList = null;
    try
    {
        String sql="SELECT T.WSI_ITEM_CODE ITEM_CODE, "
           +" T1.CI_ITEM_NAME ITEM_NAME, "
           +" T1.CI_ITEM_SPEC ITEM_SPEC, "
           +" T.WSI_ITEM_NUM  STOCK_NUM "
           +" FROM T_WMS_SPARE_INFO T "
           +" LEFT JOIN T_CO_ITEM T1 "
           +" ON T.WSI_ITEM_CODE = T1.CI_ITEM_CODE AND T1.DATA_AUTH=? "
           +" WHERE T.WSI_ITEM_SN = ? AND T.DATA_AUTH=? ";
        resultList = modelService.listDataSql(sql, new Object[] {dataAuth,itemSn,dataAuth});
        if (resultList == null || resultList.isEmpty())
        {
          map.put("FLAG", "FALSE");
        }else{
          map.put("FLAG", "TRUE");
          map.put("ITEM_CODE", resultList.get(0).get("ITEM_CODE"));
          map.put("ITEM_NAME", resultList.get(0).get("ITEM_NAME"));
          map.put("ITEM_SPEC", resultList.get(0).get("ITEM_SPEC"));
          map.put("STOCK_NUM", resultList.get(0).get("STOCK_NUM"));
        }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("未知错误"), e);
    }
    CommMethod.mapToEscapeJs(map);
    modelAction.setAjaxMap(map);
    return BaseActionSupport.AJAX;
  }

}
