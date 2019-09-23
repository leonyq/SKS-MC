package com.more.mes.smt.storeitemmanager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.buss.eis.comm.file.ExcelOpt;
import com.more.buss.eis.comm.file.UserManage;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.auth.model.absc.DataAutoParamDto;
/**
 * 
* @Title 物料管控Excel导入
* @Description 物料管控Excel导入 
* @ClassName GetUserItemImport 
* @author LSP 
* @version 1.0 developer 2018-4-18 created 
* @see GetUserItemImport 
* @since 2018-4-18 
* @Copyright: Copyright (c) 2018 
* @Company: morelean
 */
public class GetUserItemImport implements FuncService
{
  //日志
  private final Log log = LogFactory.getLog(this.getClass());
  //员工号
  private String userNo="员工号";
  //物料料号
  private String ItemNo="物料料号";
  //数据库操作对象
  TableDataMapExt ep=  new TableDataMapExt();
  //参数MAP
  Map colMap = ep.getColMap();
  
  //单行数据MAP
  Map<String, String> excelmap = new HashMap<String, String>();
  
  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    Map<String,String> keyMap = new HashMap<String, String>();
    keyMap.put(userNo, "userName");
    keyMap.put(ItemNo, "itemNo");
    //Excel读取工具
    UserManage excelopt = new UserManage(1,keyMap,true,".xlsx");
    ep.setTableName("T_WMS_ITEM_CONTRAL");
    DataAutoParamDto dapt = modelAction.getDapt();
    //部门
   // String dep = modelAction.getRequest().getParameter("dep");
   
    List<Map<String, String>> excelData = null;
    try
    {
      excelData=excelopt.readExcel(modelAction, modelService);
      String str;
      if(excelData.isEmpty()){
        
        modelAction.setAjaxString("empty");
        return BaseActionSupport.AJAX;
      }else{
    	  str = excelData.get(0).get("res");
    	  if(str!=null&&str.equalsIgnoreCase("fail")){
    		  modelAction.setAjaxString("fail");
    	        return BaseActionSupport.AJAX;
    	  }else if(str!=null&&str.equalsIgnoreCase("out")){
    		  modelAction.setAjaxString("out");
  	        return BaseActionSupport.AJAX;
  	  }
      }
      int excelDataSize = excelData.size();
   
      //循环结果集
      for (int i = 0; i < excelDataSize; i++ )
      {
         
         excelmap = excelData.get(i);
        //员工号
        String userStr = excelmap.get("userName");
        //员工空值
        if(StringUtils.isBlank(userStr)){
          //失败标识
          excelmap.put("status", "fail");
          //失败描述
          excelmap.put("des", modelAction.getText("员工号不允许为空"));
          continue;
        }
        //查找员工是否存在
         boolean userEmpty = getUserEmpty(modelService, userStr);
         if(userEmpty){
           //失败标识
           excelmap.put("status", "fail");
           //失败描述
           excelmap.put("des", modelAction.getText("员工号不存在"));
           continue;
         }
         
        //物料料号
        String itemStr = excelmap.get("itemNo");
        //物料空值
        if(StringUtils.isBlank(itemStr)){
          //失败标识
          excelmap.put("status", "fail");
          //失败描述
          excelmap.put("des", modelAction.getText("物料号不允许为空"));
          continue;
        }
        //查找物料是否存在
        boolean itemEmpty = getItemEmpty(modelService, itemStr);
        if(itemEmpty){
          //失败标识
          excelmap.put("status", "fail");
          //失败描述
          excelmap.put("des", modelAction.getText("物料号不存在"));
          continue;
        }
        
        //在物料管控表是否存在关系
        boolean contralEmpty = getContralEmpty(modelService, userStr,itemStr);
        if(contralEmpty){
          continue;
        }
        ep.getColMap().clear();
        CommMethod.addSysDefCol(ep.getColMap(),modelAction.getUser());
        colMap.put("WIC_ITEM_CODE", itemStr);
        colMap.put("WIC_CTRL_EMP", userStr);
        //colMap.put("DATA_AUTH", dep);
        modelService.save(ep);
        
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("导入失败"), e);
    }
    modelAction.setAjaxPage(modelAction.getPage());
    modelAction.getAjaxPage().setDataList(excelData);
    
    //modelAction.setAjaxList(excelData);
   
    return BaseActionSupport.AJAX;
  }
  


  /**
   * <b>员工是否存在</b>
   * @param userStr  员工号
   * @return
   */
  public boolean getUserEmpty(ModelService modelService,String userStr){
    boolean siUser  = false;
    List<Map> sList=new ArrayList<Map>();
    String sql=
      "SELECT COUNT(ID) COUNT FROM SY_USER WHERE LOGIN_NAME = ?  ";
     Map dataMap = modelService.queryForMap(sql,new Object[] {userStr});
     int userNum= Integer.valueOf(StringUtils.toString(dataMap.get("COUNT")));
     if(userNum==0){
       siUser = true;
     }
    return siUser;
  }
  
  
  /**
   * <b>物料是否存在</b>
   * @param itemSre  员工号
   * @return
   */
  public boolean getItemEmpty(ModelService modelService,String itemStr){
    boolean siItem  = false;
    List<Map> sList=new ArrayList<Map>();
    
    String sql=
      "SELECT COUNT(ID) COUNT FROM T_CO_ITEM WHERE CI_ITEM_CODE = ?  ";
     Map dataMap = modelService.queryForMap(sql,new Object[] {itemStr});
     
     int ItemNum= Integer.valueOf(StringUtils.toString(dataMap.get("COUNT")));
     if(ItemNum==0){
       siItem = true;
     }
    return siItem;
  }
  
  
  /**
   * <b>在物料管控表是否存在关系</b>
   * @param itemSre  员工号
   * @return
   */
  public boolean getContralEmpty(ModelService modelService,String userStr,String itemStr){
    boolean siItem  = true;
    List<Map> sList=new ArrayList<Map>();
    
    String sql=
      "SELECT COUNT(ID) COUNT FROM T_WMS_ITEM_CONTRAL WHERE WIC_CTRL_EMP = ?  AND WIC_ITEM_CODE = ?";
     Map dataMap = modelService.queryForMap(sql,new Object[] {userStr,itemStr});
     
     int contralNum= Integer.valueOf(StringUtils.toString(dataMap.get("COUNT")));
     if(contralNum==0){
       siItem = false;
     }
    return siItem;
  }
  
  
  

}
