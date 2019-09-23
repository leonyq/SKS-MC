package com.more.morelabel.labelmanage.barcodevariables.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.morelabel.labelmanage.barcodevariables.service.BarcodeVariablesDataService;

/**
 * @Title 获取系统及企业的标签变量信息
 * @Description 获取系统及企业的标签变量信息
 * @ClassName GetBarcodeVariablesAction
 * @author csh
 * @version 1.0 developer 2017-11-2 created
 * @see GetBarcodeVariablesAction
 * @since 2017-11-2
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class GetBarcodeVariablesAction implements FuncService
{
  /**
   * @param modelAction
   *          modelAction
   * @param modelService
   *          modelService
   * @return String
   * @see com.more.fw.core.dbo.model.service.impl.base.FuncService#exeFunc(com.more.fw.core.base.core.action.ModelAction,
   *      com.more.fw.core.dbo.model.service.ModelService)
   */

  @SuppressWarnings("unchecked")
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest hsr = modelAction.getRequest();
    String flag = StringUtils.toString(hsr.getParameter("flag"));
    String dataAuth =  StringUtils.toString(CommMethod.getSessionUser().getDeptId());//CommMethodMc.getDataAuthBySession(hsr);

    BarcodeVariablesDataService bvDataService = new BarcodeVariablesDataService();
    int count = bvDataService.chackUpId(dataAuth);
    String sign = "N";
    if (count > 0)
    {
      sign = "Y";
    }
    if (flag.equals("barcodeVal"))
    {
      String bvId = StringUtils.toString(hsr.getParameter("bvId"));
      List bVValLs = bvDataService.getBVVal(bvId);
      modelAction.setAjaxList(bVValLs);
    }
    else
    {
      // 查询系统级数据
      List serialLs = bvDataService.getSysBVListInType("1");
      CommMethod.listToEscapeJs(serialLs);
      List yearLs = bvDataService.getSysBVListInType("2");
      CommMethod.listToEscapeJs(yearLs);
      List monthLs = bvDataService.getSysBVListInType("3");
      CommMethod.listToEscapeJs(monthLs);
      List dayLs = bvDataService.getSysBVListInType("4");
      CommMethod.listToEscapeJs(dayLs);
      // 查询企业级数据
      List serialEnLs = bvDataService.getBVListInType("1", sign);
      CommMethod.listToEscapeJs(serialEnLs);
      List yearEnLs = bvDataService.getBVListInType("2", sign);
      CommMethod.listToEscapeJs(yearEnLs);
      List monthEnLs = bvDataService.getBVListInType("3", sign);
      CommMethod.listToEscapeJs(monthEnLs);
      List dayEnLs = bvDataService.getBVListInType("4", sign);
      CommMethod.listToEscapeJs(dayEnLs);

      List bVValLs = bvDataService.getBVAllVal();
      CommMethod.listToEscapeJs(bVValLs);
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("serialLs", serialLs);
      map.put("yearLs", yearLs);
      map.put("monthLs", monthLs);
      map.put("dayLs", dayLs);
      map.put("serialEnLs", serialEnLs);
      map.put("yearEnLs", yearEnLs);
      map.put("monthLs", monthLs);
      map.put("monthEnLs", monthEnLs);
      map.put("dayEnLs", dayEnLs);
      map.put("bVValLs", bVValLs);

      modelAction.setAjaxMap(map);
    }
    CommMethod.escapeJs(sign);
    modelAction.setAjaxString(sign);
    return BaseActionSupport.AJAX;
  }
}
