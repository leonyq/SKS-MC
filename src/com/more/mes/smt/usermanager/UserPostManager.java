package com.more.mes.smt.usermanager;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 
* @Title 员工强制下岗
* @Description 员工上下岗管理页面=》强制下岗功能
* @ClassName UserPostManager 
* @author LSP 
* @version 1.0 developer 2018-3-2 created 
* @see UserPostManager 
* @since 2018-3-2 
* @Copyright: Copyright (c) 2018 
* @Company: morelean
 */
public class UserPostManager implements FuncService
{
  //日志
  private final Log log = LogFactory.getLog(this.getClass());

  
  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {

   
    HttpServletRequest request = modelAction.getRequest();
    try
    {
      //需要下岗的ID
      String delId =request.getParameter("manageId") ;// 优先级
     // String delId = request.getParameter("manageId");
      //分割
      String[] strArray = delId.split(",");

      //数据库操作对象
      TableDataMapExt station = new TableDataMapExt();
      //表信息
      station.setTableName("T_USER_STATION_ON_OFF");
      //修改信息添加
      for (String mId : strArray)//批量修改
      {
          List<Object> sqlwList = new ArrayList<>();
          sqlwList.add(mId);
    	station.getColMap().clear();
    	CommMethod.editSysDefCol(station.getColMap(), modelAction.getUser());
    	//station.setSqlWhere(" AND ID = :mId ");
    	station.setSqlWhere(" AND ID =? ");
    	station.setSqlWhereArgs(sqlwList);
        station.getColMap().put("ON_OFF_TYPE", "2");//修改状态
        station.getColMap().put("OP_TIME", DateUtil.getCurDate());//操作时间
        modelService.edit(station);
      }
      String querySql = "select * from T_USER_STATION_ON_OFF WHERE ID = ?";
      
      TableDataMapExt LogSave = new TableDataMapExt();
      //表信息
      LogSave.setTableName("T_USER_STATION_ON_OFF_LOG"); 
      //结果集
      List<Map> lSql = null;
      for (String mId : strArray)//数据查询
      {
        //结果集
        lSql = modelService.listDataSql(querySql,new Object[]{mId});
        LogSave.getColMap().clear();
    	CommMethod.addSysDefCol(LogSave.getColMap(), modelAction.getUser());
    //	LogSave.getColMap().put("USER_ID", mId);
        LogSave.getColMap().put("USER_ID", lSql.get(0).get("USER_ID"));
    	LogSave.getColMap().put("ON_OFF_TYPE", "2");
    	LogSave.getColMap().put("CA_WORKSTATION_SN", lSql.get(0).get("CA_WORKSTATION_SN"));
    	LogSave.getColMap().put("CA_AREA_SN", lSql.get(0).get("CA_AREA_SN"));
    	LogSave.getColMap().put("OP_TIME", DateUtil.getCurDate());
        modelService.save(LogSave);
      }
      

    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("强制下岗失败"), e);
 
    }
    
    return modelAction.reloadParent(modelAction.getText("强制下岗成功"));
  }
  
  

}
