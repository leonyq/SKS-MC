package com.more.mes.smt.usermanager.employeereward;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.more.fw.core.base.core.action.BaseActionSupport;

import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;

  /**
 * @Description 获得奖惩对应的奖惩员工数
 * @ClassName ShowEmployeeList
 * @author qm
 * @Company: morelean
 */
public class GetRewardCount implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    Map<String, Object> map = new HashMap<String, Object>();
    
    String sqlList = "select REWARD_ID, count(1) REWARD_COUNT "
                     + " from T_USER_REWARD_USER group by REWARD_ID ";


    List zjList = modelService.listDataSql(sqlList,new Object[]{});
    map.put("zjList", zjList);

    modelAction.setDataList(zjList);
    CommMethod.listMapToEscapeJs(zjList);
    return BaseActionSupport.AJAX;
  }

}
