package com.more.mes.smt.usernickname;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;
/**
 * 
* @Title 账户别名唯一性校验
* @Description 不同组织可以有相同的账户别名，相同的组织，不可以有相同的账户别名。
* @ClassName UserAliasManager 
* @author LSP 
* @version 1.0 developer 2018-3-12 created 
* @see UserAliasManager 
* @since 2018-3-12 
* @Copyright: Copyright (c) 2018 
* @Company: morelean
 */
public class UserAliasManager implements ValidateFuncService
{
  private final Log log = LogFactory.getLog(this.getClass());
  
  @SuppressWarnings("unchecked")
  @Override
  public OperResult valJavaFun(String formId, Map pareMap, ModelService modelService, ModelAction modelAction, Object... arg4)
  {
    try
    {
      HttpServletRequest request = modelAction.getRequest();

      //当前页面状态
      String status = request.getParameter("pagStatus");
      //账户别名
      String userName=StringUtils.toString(pareMap.get("ACCOUNT_ALIAS"));
      
      //组织机构
      String authStr = null;
      //查询结果集
      List<Map> onlyByAll = null;
      if (status.equals("add"))
      {
        //组织机构
        authStr =request.getParameter("_DATA_AUTH");
        onlyByAll = getOnlyByAllAdd(modelService,authStr,userName);
      }
      else if (status.equals("edit"))
      {
        //本条数据ID
        String userId =request.getParameter("dataId");
        //组织机构
        authStr =request.getParameter("paraMapObj._DATA_AUTH");
        onlyByAll=getOnlyByAllAddUpdate(modelService,authStr,userName,userId);
      }
      else
      {
        return new OperResult(false, modelAction.getText("页面状态异常"));
      }
      
      if(!onlyByAll.isEmpty()){
        return new OperResult(false, modelAction.getText("账户别名已存在"));
      }
    }
    catch (Exception e)
    {
      log.debug(e);
      return new OperResult(false, modelAction.getText("账户别名校验异常"));
    }
    
     return new OperResult(true);
  }
  
  /**
   * <b>新增：查询:T_CO_ACCOUNT_ALIAS 条件：组织机构,账户别名.</b>
   * @param authStr  组织机构
   * @param userName 账户别名
   * @return
   */
  public List<Map> getOnlyByAllAdd(ModelService modelService,String authStr,String userName){
    List<Map> sList=new ArrayList<Map>();

    String sql=
      "SELECT ID FROM T_CO_ACCOUNT_ALIAS WHERE DATA_AUTH=? AND ACCOUNT_ALIAS=?";
        
    sList = modelService.listDataSql(sql,new Object[] {authStr,userName});
    
    return sList;
  }
  
  /**
   * <b>修改：查询:T_CO_ACCOUNT_ALIAS 条件：组织机构,账户别名.</b>
   * @param authStr  组织机构
   * @param userName 账户别名
   * @param userId   本条数据ID
   * @return
   */
  public List<Map> getOnlyByAllAddUpdate(ModelService modelService,String authStr,String userName,String userId){
    List<Map> sList=new ArrayList<Map>();

    String sql=
      "SELECT ID FROM T_CO_ACCOUNT_ALIAS WHERE DATA_AUTH=? AND ACCOUNT_ALIAS=? AND ID <> ? ";
        
    sList = modelService.listDataSql(sql,new Object[] {authStr,userName,userId});
    
    return sList;
  }
  

}
