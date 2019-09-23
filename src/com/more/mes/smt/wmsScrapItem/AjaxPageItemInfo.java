package com.more.mes.smt.wmsScrapItem;

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

/**
 * 物料信息分页及查询
 * 
 * @author development
 */
public class AjaxPageItemInfo implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String auth = request.getSession().getAttribute("mcDataAuth").toString();
    Map<String, String> map = new HashMap<String, String>();
    String itemSN = modelAction.getParaMap().get("itemSN");
    String itemCode = modelAction.getParaMap().get("itemCode");
    String itemWhCode = modelAction.getParaMap().get("itemWhCode");
    String conCode = modelAction.getParaMap().get("conCode");
    String sql = "SELECT T.ID,T.WSI_ITEM_SN   ITEM_SN, " + " T.WSI_ITEM_CODE ITEM_CODE, "
                 + " T.WSI_WH_CODE   WH_CODE, " + " T.WSI_ITEM_NUM  ITEM_NUM, "
                 + " T1.CI_ITEM_NAME ITEM_NAME, " + " T1.CI_ITEM_SPEC ITEM_SPEC, "
                 + " T2.WA_AREA_NAME WH_CODE_NAME " + " FROM T_WMS_STOCK_INFO T "
                 + " LEFT JOIN T_CO_ITEM T1 " + " ON T.WSI_ITEM_CODE = T1.CI_ITEM_CODE and t1.DATA_AUTH=:auth "
                 + " LEFT JOIN T_WMS_AREA T2 " + " ON T.WSI_WH_CODE = T2.WA_AREA_SN and t2.DATA_AUTH=:auth1 " +
                 		" where 1=1 and t.DATA_AUTH=:auth2 ";
    
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    sqlParaMap.put("auth", auth);
    sqlParaMap.put("auth1", auth);
    sqlParaMap.put("auth2", auth);
    if (StringUtils.isNotBlank(itemSN))
    {
    	sql += " AND (T.WSI_ITEM_SN like '%' || :itemSN || '%' ";
    	sql += " or T.WSI_FIRST_SN like '%' || :itemSN1 || '%' ";
    	sql += " or T.WSI_SECOND_SN like '%' || :itemSN2 || '%' ";
    	sql += " or T.WSI_THIRD_SN like '%' || :itemSN3 || '%' ";
    	sql += " or T.WSI_FOURTH_SN like '%' || :itemSN4 || '%')";
    	sqlParaMap.put("itemSN", itemSN);
    	sqlParaMap.put("itemSN1", itemSN);
    	sqlParaMap.put("itemSN2", itemSN);
    	sqlParaMap.put("itemSN3", itemSN);
    	sqlParaMap.put("itemSN4", itemSN);
    }
    if (StringUtils.isNotBlank(itemCode))
    {
    	sql += " AND T.WSI_ITEM_CODE like '%' || :itemCode || '%' ";
    	sqlParaMap.put("itemCode", itemCode);
    }
    if (StringUtils.isNotBlank(itemWhCode))
    {
    	sql += " AND T.WSI_WH_CODE =:itemWhCode ";
    	sqlParaMap.put("itemWhCode", itemWhCode);
    }
    if (StringUtils.isNotBlank(conCode))
    {
    	sql += " AND T.WSI_CONNECT_DOC like '%' || :conCode || '%' ";
    	sqlParaMap.put("conCode", conCode);
    }
    List itemList = modelService.listSql(sql, modelAction.getPage(), sqlParaMap, null, null);
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(itemList);
    modelAction.getAjaxPage().setDataList(itemList);
    return BaseActionSupport.AJAX;

  }

}
