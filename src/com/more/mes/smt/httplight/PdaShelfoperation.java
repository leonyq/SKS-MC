package com.more.mes.smt.httplight;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.led.executor.Shelfexecutor;
import com.more.mes.smt.labelhttp.service.LabelInfoService;

public class PdaShelfoperation extends InterfaceLog implements IhttpServiceJosn
{
  private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
 
  @Override
  public String exeFunc(HttpCoreService service)
  {
    // TODO Auto-generated method stub
    
    //BACKUP_TURN_OFF
    String docNum;
    String type;
    String dataAuth;
    docNum = StringUtils.toString(service.getParamTo().get("L_DOC_NUM"));
    type  = StringUtils.toString(service.getParamTo().get("LED_TYPE"));
    dataAuth  = StringUtils.toString(service.getParamTo().get("M_DATA_AUTH"));
    JSONArray json = new JSONArray();
    Map maps = null;
    if (type.equals("BACKUP_TURN_ON"))
    {
      //备料亮灯
      maps =getLightUp(docNum,dataAuth);
    }else if(type.equals("BACKUP_TURN_OFF")){
      maps =getLightOff(docNum,dataAuth);
    }
    
    if (maps != null && !maps.isEmpty())
    {
      json = JSONArray.fromObject(maps);
    }
    Map map = new HashMap();
    map.put("json", json);
    service.setResult(map);

    service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
    service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
    service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
    
    return null;
  }
    //备料亮灯
  @SuppressWarnings("unchecked")
  public Map<String, String> getLightUp(String docNum,String dataAuth){
    Map<String, String> map = new HashMap<String, String>();
    String sql = "select T.CMD from T_WMS_BACKUP_MAT_CMD t WHERE T.DOC_NUM=? AND T.DATA_AUTH=? ";
    List<Map> cmdList = modelService.listDataSql(sql,new Object[]{docNum,dataAuth});
    
    String cmd = null;
    if(cmdList!=null&&cmdList.size()>0){
      int num = cmdList.size();
      String offCmd = "";//灭灯
      String ligCmd = "";//亮灯
      String flaCmd = "";//闪灯
      String lack = "";//缺料信息
      for(int i=0;i<num;i++){
        cmd = (String) cmdList.get(i).get("CMD");
        if(cmd.indexOf("@@OFF")!=-1){ //有灭灯指令
          String[] cmdStr = cmd.split("@@OFF");
          offCmd += cmdStr[1].substring(cmdStr[1].indexOf("[")+1, cmdStr[1].indexOf("]"));
        }
        if(cmd.indexOf("@@LIGHT")!=-1){ //有亮灯指令
          String[] cmdStr = cmd.split("@@LIGHT");
          ligCmd += cmdStr[1].substring(cmdStr[1].indexOf("[")+1, cmdStr[1].indexOf("]"));
        }
        if(cmd.indexOf("@@FLASH")!=-1){ //有闪灯指令
          String[] cmdStr = cmd.split("@@FLASH");
          flaCmd += cmdStr[1].substring(cmdStr[1].indexOf("[")+1, cmdStr[1].indexOf("]"));
        }
        if(cmd.indexOf("@@LACK")!=-1){ //有缺料信息
          String[] cmdStr = cmd.split("@@LACK");
          lack += cmdStr[1].substring(cmdStr[1].indexOf("[")+1, cmdStr[1].indexOf("]"));
        }
      }
      String lightCmd = offCmd + ligCmd + flaCmd;
      if(!lack.equals("")){ //有缺料信息
        if(!lightCmd.equals("")){ //有命令
          Shelfexecutor shel = new Shelfexecutor();
          shel.Execute(lightCmd);
          map.put("RES", "OK");
        }else{
          map.put("RES", "NG");
        }
      }else{       
        Shelfexecutor shel = new Shelfexecutor();
        shel.Execute(lightCmd);
        map.put("RES", "OK"); 
      }
    }
    return map;    
  }
  @SuppressWarnings("unchecked")
  //备料灭灯
  public Map<String, String> getLightOff(String docNum,String dataAuth){
    Map<String, String> map = new HashMap<String, String>();
    String sql = "select T.CMD from T_WMS_BACKUP_MAT_CMD t WHERE T.DOC_NUM=? AND T.DATA_AUTH=? ";
    List<Map> cmdList = modelService.listDataSql(sql,new Object[]{docNum,dataAuth});
    
    String cmd = null;
    if(cmdList!=null&&cmdList.size()>0){
      int num = cmdList.size();
      String offCmd = "";//灭灯
      for(int i=0;i<num;i++){
        cmd = (String) cmdList.get(i).get("CMD");
        if(cmd.indexOf("@@OFF")!=-1){ //有灭灯指令
          String[] cmdStr = cmd.split("@@OFF");
          offCmd += cmdStr[1].substring(cmdStr[1].indexOf("[")+1, cmdStr[1].indexOf("]"));
        }
      }
      Shelfexecutor shel = new Shelfexecutor();
      shel.Execute(offCmd);
      map.put("RES", "OK");
    }
    
    
    return map;    
  }
}
