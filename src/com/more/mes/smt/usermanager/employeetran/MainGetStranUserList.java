package com.more.mes.smt.usermanager.employeetran;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import javax.servlet.http.HttpServletRequest;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;

/**
 * 
 * @Title <主页获取员工列表>
 * @Description <主页获取员工列表> 
 * @ClassName MainGetStranUserList
 * @auther MaoZhongHao
 * @version 1.0 deverloper 2018-03-26 created
 * @see MainGetStranUserList
 * @since 2018-03-26
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class MainGetStranUserList implements FuncService
{

  @Override
  /**
   * 
   * @Description: 主页获取员工列表 
   * @param request
   * @param modelAction
   * @param modelService
   * @return String
   * @throws
   */
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    Map<String, Object> map = new HashMap<String, Object>();
    //String zjSn = request.getParameter("tranCode");
    String sqlString = "select TRAN_ID, count(1) " + " from T_USER_TRAN_USER group by TRAN_ID ";
    //String sqlString = "select t.tran_code " + " from T_USER_TRAN ";
    List zjList = modelService.listSql(sqlString, null, null, null, null, null);
    map.put("zjList", zjList);
    CommMethod.listMapToEscapeJs(zjList);
    // modelAction.setAjaxPage(modelAction.getPage());
    modelAction.setDataList(zjList);
    return BaseActionSupport.AJAX;
  }

}
