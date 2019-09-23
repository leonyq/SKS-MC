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
 * @Title <修改获取员工列表>
 * @Description <修改获取员工列表> 
 * @ClassName UpdateGetStranUserList
 * @auther MaoZhongHao
 * @version 1.0 deverloper 2018-03-26 created
 * @see UpdateGetStranUserList
 * @since 2018-03-26
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class SelectGetStranUserList implements FuncService{

  @Override
  /**
   * 
   * @Description: 修改获取员工列表
   * @param request
   * @param modelAction
   * @param modelService
   * @return String
   * @throws
   */
  public String exeFunc(ModelAction modelAction, ModelService modelService){
  	// TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    Map<String, Object> map = new HashMap<String, Object>();
    String tranId = request.getParameter("tranId");
    //String dataAuth = request.getParameter("dataAuth");
    String sqlString = "select DATA_AUTH from T_USER_TRAN_USER "
                    + "where TRAN_ID = ?  ";
    Map<String, String> map1 =modelService.queryForMap(sqlString, new Object[]{tranId});
    if(null!=map1 && map1.size()>0){
        sqlString = "select usr.ID, usr.LOGIN_NAME, usr.NAME, dept.NAME DEPT_NAME from SY_USER usr "
                    + " left join T_USER_TRAN_USER rew on rew.USER_ID = usr.ID left join  SY_DEPT dept on usr.DEPT_ID = dept.ID  "
                    + "where rew.TRAN_ID = ?  and rew.DATA_AUTH=?  ";
            List zjList = modelService.listDataSql(sqlString, new Object[]{tranId,map1.get("DATA_AUTH")});
            map.put("zjList", zjList);
            modelAction.setAjaxMap(map);
            CommMethod.listMapToEscapeJs(zjList);
    }else {
    	 modelAction.setAjaxMap(map);
    }
     
    return BaseActionSupport.AJAX;
  }

}
