/*
 * @File BackFillInfo.java
 * @Package com.more.mes.smt.snconfigure
 * @Copyinght Copyright (c) 2018
 * @Company morelean
 * @author csj
 * @date 2018-11-19 下午3:22:46
 * @version V1.0
 */
package com.more.mes.smt.snconfigure;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 编码生成配置----修改页面获取信息
 * 
 * @author development
 */
public class BackFillInfo implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataId = request.getParameter("dataId");// 入库单号
    String dataAuth = request.getParameter("dataAuth");//String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    Map<String, String> map = new HashMap<String, String>();
    String sql = "SELECT T.CCD_CODE_SEGMENT   CODE_SEGENT, "
                 + " T.CCD_ITEM_VALUE     ITEM_VALUE, " + " T.CCD_ITEM_LEN       ITEM_LEN, "
                 + " T.CCD_FILL_TYPE      FILL_TYPE, " + " T.CCD_FILL_CHAR      FILL_CHAR, "
                 + " T.CCD_START_NUM      START_SEQ, " + " T.CCD_START_RESET    START_RESET, "
                 + " T.CCD_CONFIGURE_TYPE CONFIGURE_TYPE, "
                 + " T.CCD_CONFIGURE_VAL  CONFIGURE_VAL, " + " T1.VALUE "
                 + " FROM T_CO_SN_CONFIGURE_DETAIL T " + " LEFT JOIN SY_DICT_VAL T1 "
                 + " ON T.CCD_CONFIGURE_TYPE = T1.CODE "
                 + " AND T1.DICT_CODE = 'CCD_CONFIGURE_TYPE' ";
    String sqlWhere = " WHERE T.CCD_CONFIGURE_ID =:CONFIGURE_ID AND T.DATA_AUTH = :DATA_AUTH "
                      + " ORDER BY T.CCD_CONFIGURE_SEQ ";
    map.put("CONFIGURE_ID", dataId);
    map.put("DATA_AUTH", dataAuth);
    List itemList = modelService.listSql(sql + sqlWhere, null, map, null, null);
    // CommMethod.listToEscapeJs(itemList);
    modelAction.setAjaxList(itemList);
    return BaseActionSupport.AJAX;
  }
}
