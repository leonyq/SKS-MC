package com.more.mes.smt.logistics;

import java.util.ArrayList;
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
* @Title 物流信息维护 
* @Description 新增物流信息数据=>校验物流公司,联系人,联系电话,车牌号 组合唯一性.
* @ClassName LogisticsInfoMaintain 
* @author LSP 
* @version 1.0 developer 2018-2-28 created 
* @see LogisticsInfoMaintain 
* @since 2018-2-28 
* @Copyright: Copyright (c) 2018 
* @Company: morelean
 */
public class LogisticsInfoMaintain implements ValidateFuncService
{
  //日志
  private final Log log = LogFactory.getLog(this.getClass());
  
  @SuppressWarnings("unchecked")
  @Override
  public OperResult valJavaFun(String formId, Map paraMap, ModelService modelService, ModelAction modelAction, Object... objs)
  {
    
    try
    {
      HttpServletRequest request = modelAction.getRequest();
      String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
      //物流公司
      String logisticsCompany = StringUtils.toString(paraMap.get("LOGISTICS_COMPANY"));
      //车牌号
      String plateNumber = StringUtils.toString(paraMap.get("PLATE_NUMBER"));
      //联系人
      String contacts = StringUtils.toString(paraMap.get("CONTACTS"));
      //联系电话
      String phoneNumber = StringUtils.toString(paraMap.get("PHONE_NUMBER"));
      //页面状态
      String pageStatuc = request.getParameter("pagStatus");
      
      //SQL语句查询是否唯一
      List<Map> onlyByAll = null;
      
      if(pageStatuc.equals("add")){
        onlyByAll=getOnlyByAllAdd(modelService,logisticsCompany,plateNumber,contacts,phoneNumber,dataAuth);
        
      }else if(pageStatuc.equals("edit")){
        
        //本条数据ID
        String id = request.getParameter("dataId");
        
        onlyByAll=getOnlyByAllUpdate(modelService,logisticsCompany,plateNumber,contacts,phoneNumber,id,dataAuth);
    
      }else{
        
        return new OperResult(false, modelAction.getText("页面状态信息异常"));
      }

     
      if(!onlyByAll.isEmpty()){
        return new OperResult(false, modelAction.getText("物流信息已存在"));
      }
    }
    catch (Exception e)
    {
      log.debug(e);
      return new OperResult(false, modelAction.getText("物流信息校验异常"));
    }
    
    
    return new OperResult(true);
  }
  
  /**
   * <b>新增：查询:T_CO_LOGISTICS_INFO 条件：物流公司,车牌号,联系人,联系电话.</b>
   * @param modelService
   * @param logisticsCompany 物流公司
   * @param plateNumber 车牌号
   * @param contacts 联系人
   * @param lphoneNumber 联系电话
   * @return
   */
  public List<Map> getOnlyByAllAdd(ModelService modelService,String logisticsCompany,String plateNumber,
    String contacts,String phoneNumber,String dataAuth){
    List<Map> sList=new ArrayList<Map>();

    String sql=
      "SELECT ID FROM T_CO_LOGISTICS_INFO  WHERE " +
      "LOGISTICS_COMPANY = ? " +
      "AND PLATE_NUMBER = ? " +
      "AND CONTACTS = ?  " +
      "AND PHONE_NUMBER = ? "
      + "AND DATA_AUTH = ? ";
        
    sList = modelService.listDataSql(sql,new Object[] {logisticsCompany,plateNumber,contacts,phoneNumber,dataAuth});
    
    return sList;
  }
  
  /**
   * <b>修改查询:T_CO_LOGISTICS_INFO 条件：物流公司,车牌号,联系人,联系电话.</b>
   * @param modelService
   * @param logisticsCompany 物流公司
   * @param plateNumber 车牌号
   * @param contacts 联系人
   * @param lphoneNumber 联系电话
   * @param id 本条数据id
   * @return
   */
  public List<Map> getOnlyByAllUpdate(ModelService modelService,String logisticsCompany,String plateNumber,
    String contacts,String phoneNumber,String id,String dataAuth){
    List<Map> sList=new ArrayList<Map>();

    String sql=
      "SELECT ID FROM T_CO_LOGISTICS_INFO  WHERE " +
      "LOGISTICS_COMPANY = ? " +
      "AND PLATE_NUMBER = ? " +
      "AND CONTACTS = ?  " +
      "AND PHONE_NUMBER = ? " +
      "AND ID <> ? "
      + "AND DATA_AUTH = ? ";
        
    sList = modelService.listDataSql(sql,new Object[] {logisticsCompany,plateNumber,contacts,phoneNumber,id,dataAuth});
    
    return sList;
  }

}
