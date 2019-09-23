package com.more.mes.smt.appmanage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.sql.Delete;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存勾选的用户配置信息
 * 
 * @author Administrator
 */
public class AddAppUserManages implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    Map<String, String> map = new HashMap<String, String>();
    try
    {
      String moudle = request.getParameter("id");// 功能模块ID
      String tasMoudle= request.getParameter("tasMoudleId");// 功能模块ID
      String tasSeqs = request.getParameter("tasSeq");// 显示顺序     
      String[] moudleId=moudle.split(",");
      String[] tasSeq=tasSeqs.split(",");  
      String[] tasMoudleId=tasMoudle.split(","); 
      String userId = CommMethod.getSessionUser().getId();// 用户id
      int count = moudleId.length;
      TableDataMapExt appUser = new TableDataMapExt();
      appUser.setTableName("T_APP_USER");
      
      String delSql=" Delete from  T_APP_USER  where  TAU_USER_ID=?";      
      modelService.execSql(delSql, new Object[]{ userId});
      List<Map> aList = null;
      for (int i = 0; i < count; i++ )
      {

          appUser.getColMap().clear();
          CommMethod.addSysDefCol(appUser.getColMap(), modelAction.getUser());
          appUser.getColMap().put("TAU_MOUDLE_ID",tasMoudleId[i]);
          
          if (!"null".equals(tasSeq[i]))
          {
            appUser.getColMap().put("TAU_SEQ", Integer.parseInt(tasSeq[i]));
          }
          
          
          
          
          appUser.getColMap().put("TAU_USER_ID", userId);
          appUser.getColMap().put("TAU_FUN_ID",  moudleId[i]);
          modelService.save(appUser);       
      }
      String alertMsg1 = modelAction.getText("保存成功");
      map.put("alertMsg", (String) msgPopData(modelAction, alertMsg1).get("alertMsg"));
      map.put("title", (String) msgPopData(modelAction, alertMsg1).get("title"));
      map.put("width", (String) msgPopData(modelAction, alertMsg1).get("width"));
      map.put("height", (String) msgPopData(modelAction, alertMsg1).get("height"));
      map.put("time", (String) msgPopData(modelAction, alertMsg1).get("time"));
      map.put("returnMsg", "addSucc");
    }
    catch (Exception e)
    {
      log.error(e);
      map.put("returnMsg", "addError");
      //throw new BussException(modelAction.getText("保存失败"), e);
    }
    
     modelAction.setAjaxMap(map);
    return BaseActionSupport.AJAX;
  }
  private Map msgPopData(ModelAction modelAction, String alertMsg)
  {
    Map map = new HashMap<String, Object>();
    String title = ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
    title = modelAction.getText(title);
    String width = ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
    String height = ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
    String time = ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
    map.put("title", title);
    map.put("width", width);
    map.put("height", height);
    map.put("time", time);
    map.put("alertMsg", alertMsg);
    return map;
  }
}