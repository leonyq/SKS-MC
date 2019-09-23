package com.more.mes.smt.wmsOutStockManager;
import  java.util.ArrayList;
import  java.util.List;
import  java.util.Map;

import  javax.servlet.http.HttpServletRequest;

import  org.apache.commons.logging.Log;
import  org.apache.commons.logging.LogFactory;

import  com.more.fw.core.base.core.action.ModelAction;
import  com.more.fw.core.common.exception.BussException;
import  com.more.fw.core.common.method.CommMethod;
import  com.more.fw.core.dbo.model.dto.TableDataMapExt;
import  com.more.fw.core.dbo.model.service.ModelService;
import  com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
  *  保存勾选的用户配置信息
  *  @author  Administrator
  *
  */
public  class  saveUserInfo  implements  FuncService{

private  final  Log  log  =  LogFactory.getLog(this.getClass());

@SuppressWarnings("unchecked")
@Override
public  String  exeFunc(ModelAction  modelAction,  ModelService  modelService)  {
HttpServletRequest  request  =  modelAction.getRequest();
try  {
String[]  moudleId  =  request.getParameterValues("isSelect1");//功能模块ID
String[]  userSeq  =  request.getParameterValues("TAS_SEQ");//显示顺序
String  userId  =  CommMethod.getSessionUser().getId();//用户id
int  count  =  moudleId.length;
TableDataMapExt  appUser  =  new  TableDataMapExt();
appUser.setTableName("T_APP_USER");
String  sql  =  "select  id  from  T_APP_USER  where  TAU_MOUDLE_ID=?  and  TAU_USER_ID=?  ";
List<Map>  aList  =  null;
for(int  i=0;i<count;i++){
aList  =  modelService.listDataSql(sql,  new  Object[]{moudleId[i],userId});
if(aList!=null&&aList.size()>0){
appUser.getColMap().clear();
CommMethod.editSysDefCol(appUser.getColMap(),  modelAction.getUser());
appUser.setSqlWhere("  and  id=?  ");
List<Object>  wList  =  new  ArrayList<Object>();
                        wList.add(aList.get(0).get("ID"));
                        appUser.setSqlWhereArgs(wList);
appUser.getColMap().put("TAU_SEQ",  userSeq[i]);
modelService.edit(appUser);
}else{
appUser.getColMap().clear();
CommMethod.addSysDefCol(appUser.getColMap(),  modelAction.getUser());
appUser.getColMap().put("TAU_MOUDLE_ID",  moudleId[i]);
appUser.getColMap().put("TAU_SEQ",  userSeq[i]);
appUser.getColMap().put("TAU_USER_ID",  userId);
modelService.save(appUser);
}
}
}  catch  (Exception  e)  {
log.error(e);
throw  new  BussException(modelAction.getText("保存失败"),  e);
}
return  modelAction.reloadParent(modelAction.getText("保存成功"));
}

}
