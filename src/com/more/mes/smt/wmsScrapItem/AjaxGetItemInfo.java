package com.more.mes.smt.wmsScrapItem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.http.auth.AUTH;
import org.directwebremoting.annotations.Auth;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取物料信息
 * 
 * @author development
 */
public class AjaxGetItemInfo implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String auth = request.getSession().getAttribute("mcDataAuth").toString();
    Map<String, String> map = new HashMap<String, String>();
    String sql = "SELECT T.ID,T.WSI_ITEM_SN   ITEM_SN, " + " T.WSI_ITEM_CODE ITEM_CODE, "
                 + " T.WSI_WH_CODE   WH_CODE, " + " T.WSI_ITEM_NUM  ITEM_NUM, "
                 + " T1.CI_ITEM_NAME ITEM_NAME, " + " T1.CI_ITEM_SPEC ITEM_SPEC, "
                 + " T2.WA_AREA_NAME WH_CODE_NAME " + " FROM T_WMS_STOCK_INFO T "
                 + " LEFT JOIN T_CO_ITEM T1 " + " ON T.WSI_ITEM_CODE = T1.CI_ITEM_CODE and t1.DATA_AUTH=:auth "
                 + " LEFT JOIN T_WMS_AREA T2 " + " ON T.WSI_WH_CODE = T2.WA_AREA_SN and t2.DATA_AUTH=:auth1" +
                 		" where t.DATA_AUTH=:auth2 ";
    map.put("auth", auth);
    map.put("auth1", auth);
    map.put("auth2", auth);
    List itemList = modelService.listSql(sql, modelAction.getPage(), map, null, null);
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(itemList);
    modelAction.getAjaxPage().setDataList(itemList);
    return BaseActionSupport.AJAX;
  }

}
