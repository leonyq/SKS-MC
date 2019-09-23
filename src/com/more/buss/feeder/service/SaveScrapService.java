package com.more.buss.feeder.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
 * Feeder报废信息添加
 * @author development
 *
 */
public class SaveScrapService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());
  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request=modelAction.getRequest();
    String id= request.getParameter("ID");
    
    TableDataMapExt tdMap=new TableDataMapExt();
    TableDataMapExt feederMap=new TableDataMapExt();
    List list = new ArrayList();
    tdMap.setTableName("T_CO_FEEDER_SCRAP_INFO");
    feederMap.setTableName("T_CO_FEEDER_INFOR");
    feederMap.setSqlWhere("and ID=?");
    list.add(id);
    feederMap.setSqlWhereArgs(list);
    Map<String, Object> map=tdMap.getColMap();
    Map<String, Object> scrapMap=null;
    
    //String feeder_sn=request.getParameter("paraMap1@0#FS_FEEDER_SN");
    String sql="select id from T_CO_FEEDER_SCRAP_INFO where id=?";
    List<String> result=modelService.listDataSql(sql,new Object[]{id});
    if(result.isEmpty()){
      //新增
      scrapMap=SaveScrapService.getParameters("1", modelAction);
      map.put("ID", id);
      map.put("FS_FEEDER_SN", scrapMap.get("FS_FEEDER_SN"));
      map.put("FS_FEEDER_SPEC", scrapMap.get("FS_FEEDER_SPEC"));
      map.put("FS_FEEDER_TYPE", scrapMap.get("FS_FEEDER_TYPE"));
      map.put("FS_SCR_APPLAYER", scrapMap.get("FS_SCR_APPLAYER"));
      map.put("FS_SCR_CHECK", scrapMap.get("FS_SCR_CHECK"));
      map.put("FS_SCR_CONFIRM", scrapMap.get("FS_SCR_CONFIRM"));
      map.put("FS_SCR_REASON", scrapMap.get("FS_SCR_REASON"));
      map.put("FS_SCR_DATE", scrapMap.get("FS_SCR_DATE"));
      
      feederMap.getColMap().put("TCF_STATUS", "3");
      try{
        modelService.save(tdMap);
        modelService.edit(feederMap);
      }catch(Exception e){
        log.error(e);
        throw new BussException(modelAction.getText("保存失败"),e);
      }
    }else{
      //修改  ??????
      tdMap.setSqlWhere("and ID=?");
      list.clear();
      list.add(id);
      tdMap.setSqlWhereArgs(list);
      scrapMap=SaveScrapService.getParameters("2", modelAction);
      map.put("FS_SCR_CHECK", scrapMap.get("FS_SCR_CHECK"));
      map.put("FS_SCR_CONFIRM", scrapMap.get("FS_SCR_CONFIRM"));
      map.put("FS_SCR_REASON", scrapMap.get("FS_SCR_REASON"));
      feederMap.getColMap().put("TCF_STATUS", "3");
      
      
      try{
        modelService.edit(tdMap);
        modelService.edit(feederMap);
      }catch(Exception e){
        log.error(e);
        throw new BussException(modelAction.getText("保存失败"),e);
      }
    }
    return modelAction.reloadParent(modelAction.getText("保存成功")); 
  }
  public static Map<String, Object> getParameters(String type,ModelAction modelAction){
    Map<String, Object> scrapMap=new HashMap<String, Object>();
    HttpServletRequest requert=modelAction.getRequest();
    if(("1").equals(type)){
      String feederSN=requert.getParameter("paraMap1@0#FS_FEEDER_SN");
      String feederType=requert.getParameter("paraMap1@0#FS_FEEDER_TYPE");
      String feederSpec=requert.getParameter("paraMap1@0#FS_FEEDER_SPEC");
      String scrApplayer=requert.getParameter("paraMap1@0#FS_SCR_APPLAYER");
      String scrConfirm=requert.getParameter("paraMap1@0#FS_SCR_CONFIRM");
      String scrCheck=requert.getParameter("paraMap1@0#FS_SCR_CHECK");
      String scrReason=requert.getParameter("paraMap1@0#FS_SCR_REASON");
      Date scrDate=DateUtil.parseDate(DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd HH:mm:ss"));

      scrapMap.put("FS_FEEDER_SN", feederSN);
      scrapMap.put("FS_FEEDER_SPEC", feederSpec);
      scrapMap.put("FS_FEEDER_TYPE",feederType );
      scrapMap.put("FS_SCR_APPLAYER", scrApplayer);
      scrapMap.put("FS_SCR_CHECK", scrCheck);
      scrapMap.put("FS_SCR_CONFIRM", scrConfirm);
      scrapMap.put("FS_SCR_REASON", scrReason);
      scrapMap.put("FS_SCR_DATE", scrDate);
    }else if(("2").equals(type)){
      String scrConfirm=requert.getParameter("paraMap1@0#FS_SCR_CONFIRM");
      String scrCheck=requert.getParameter("paraMap1@0#FS_SCR_CHECK");
      String scrReason=requert.getParameter("paraMap1@0#FS_SCR_REASON");
      Date scrDate=DateUtil.parseDate(DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd HH:mm:ss"));
      
      scrapMap.put("FS_SCR_CHECK", scrCheck);
      scrapMap.put("FS_SCR_CONFIRM", scrConfirm);
      scrapMap.put("FS_SCR_REASON", scrReason);
      scrapMap.put("FS_SCR_DATE", scrDate);
    }
    
    return scrapMap;
  }
}
