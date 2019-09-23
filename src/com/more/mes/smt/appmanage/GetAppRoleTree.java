package com.more.mes.smt.appmanage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class GetAppRoleTree implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService){
  HttpServletRequest request = modelAction.getRequest();
  String pid = request.getParameter("id");

  //String id = modelAction.getRequest().getParameter("ids");
  String id = request.getParameter("ids");
  String menuId = request.getParameter("menuId");

  String imgPath = Constants.ZTREE_IMG_PATH;
  if (StringUtils.isBlank(pid))
      {
        pid = Constants.DEPT_TREE_ROOT_ID;
      }
      String proSn = null;
      //String proSn2 = request.getParameter("proSn");//查询条件    
      if("-1".equals(pid)){
        proSn = "1";
      }else{
       proSn = pid;
      }
      List<Map> list = new ArrayList<Map>();
      List<Map> list2 = new ArrayList<Map>();
      Map<String,String> nullMap = new HashMap<String,String>();
      if("-1".equals(pid)){
        list2 = this.selectTreeP(proSn, modelService, list2,id,menuId);
        list.addAll(list2);
        } 
      modelAction.setAjaxList(list);
      return BaseActionSupport.AJAX;
}
  /**
   * 树形数据
   * @param modelService
   * @return
   */
  

    public List<Map> selectTreeC(String proSn,ModelService modelService,List<Map> resList,String id){
      List<Map> dataList = new ArrayList<Map>();
      Map<String,Object> paramMap = new HashMap<String,Object>();
      String imgPath = Constants.ZTREE_IMG_PATH;
      String wkiKeypSn = null;
      String wkiSn = null;
      String name = null;
      String sql = " select distinct t1.ID,t1.TAM_MENU_ID,t1.TAM_MOUDLE_NAME from  T_APP_SHOWMANAGE t " +
      		         " left join  T_APP_MOUDLE t1 on t1.id = t.TAS_MOUDLE_ID" +
      		         " WHERE t.TAS_MENU_ID=? and T.ID not in (select TAS_FUN_ID from T_APP_ROLE where  TAR_ROLE_ID=? )";
                 
      dataList = modelService.listDataSql(sql, new Object[]{proSn,id});
      if(dataList!=null && !dataList.isEmpty()){ 
        for(int i =0;i<dataList.size();i++){
          Map<String,Object> resMap = new HashMap<String,Object>();
          paramMap = dataList.get(i);
          wkiKeypSn = String.valueOf(paramMap.get("ID"));
          wkiSn = String.valueOf(paramMap.get("TAM_MENU_ID"));
          name = String.valueOf(paramMap.get("TAM_MOUDLE_NAME"));
            resMap.put("id", wkiKeypSn);
          resMap.put("name", name);
          resMap.put("upId", wkiSn);
          resMap.put("type", "2");
          resMap.put("icon", imgPath + "ico-right-last.png");
		  resMap.put("iconClose", imgPath + "ico-right-close.png");
		  resMap.put("iconOpen", imgPath + "ico-right-open.png");
          resList.add(resMap);
          this.selectTreeB(wkiKeypSn, modelService, resList, id);
        }
      }
      return resList;
    }
    public List<Map> selectTreeP(String proSn,ModelService modelService,List<Map> resList,String id,
      String menuId){
      List<Map> dataList = new ArrayList<Map>();
      Map<String,Object> paramMap = new HashMap<String,Object>();
      String imgPath = Constants.ZTREE_IMG_PATH;
      String wkiKeypSn = null;
      String wkiSn = null;
      
      String sql = "  select distinct T.TAS_MENU_ID ,T1.VALUE  from T_APP_SHOWMANAGE T  "+
                   "  LEFT JOIN SY_DICT_VAL  T1 ON T.TAS_MENU_ID=T1.CODE "+
                   " WHERE T1.DICT_CODE=? and T.ID not in (select TAS_FUN_ID from T_APP_ROLE where  TAR_ROLE_ID=? )";
      //+ "  ";
      if (StringUtils.isNotBlank(menuId))
      {
        sql+= " and T.TAS_MENU_ID=?";
        dataList = modelService.listDataSql(sql,new Object[]{"MAIN_MENU",id,menuId});
      }else {
        dataList = modelService.listDataSql(sql,new Object[]{"MAIN_MENU",id});
      }
     
      if(dataList!=null && !dataList.isEmpty()){ 
        for(int i =0;i<dataList.size();i++){
          Map<String,Object> resMap = new HashMap<String,Object>();
          paramMap = dataList.get(i);
          wkiKeypSn = String.valueOf(paramMap.get("TAS_MENU_ID"));
          //wkiSn = String.valueOf(paramMap.get("TAS_MENU_ID"));
          resMap.put("id", wkiKeypSn);
          resMap.put("name", String.valueOf(paramMap.get("VALUE")));
          resMap.put("upId", "-1");
          resMap.put("type", "1");
          resMap.put("icon", imgPath + "ico-right-last.png");
		  resMap.put("iconClose", imgPath + "ico-right-close.png");
		  resMap.put("iconOpen", imgPath + "ico-right-open.png");
          resList.add(resMap);
          this.selectTreeC(wkiKeypSn, modelService, resList,id);
        }
      }
      return resList;
    }
    @SuppressWarnings("rawtypes")
    public List<Map> selectTreeB(String proSn,ModelService modelService,List<Map> resList,String id){
      List<Map> dataList = new ArrayList<Map>();
      Map<String,Object> paramMap = new HashMap<String,Object>();
      String imgPath = Constants.ZTREE_IMG_PATH;
      String wkiKeypSn = null;
      String wkiSn = null;
      String name = null;
      String sql = " select distinct T.TAS_FUN_NAME ,T.ID,T.TAS_MOUDLE_ID  from T_APP_SHOWMANAGE T " +
      		         " WHERE T.TAS_MOUDLE_ID=?" +
      		         " and T.ID not in (select TAS_FUN_ID from T_APP_ROLE where  TAR_ROLE_ID=? ) ";
      
      dataList = modelService.listDataSql(sql,new Object[]{proSn,id});
      if(dataList!=null && !dataList.isEmpty()){ 
        for(int i =0;i<dataList.size();i++){
          Map<String,Object> resMap = new HashMap<String,Object>();
          paramMap = dataList.get(i);
          wkiKeypSn = String.valueOf(paramMap.get("ID"));
          wkiSn = String.valueOf(paramMap.get("TAS_MOUDLE_ID"));
          name = String.valueOf(paramMap.get("TAS_FUN_NAME"));
            resMap.put("id", wkiKeypSn);
          resMap.put("name", name);
          resMap.put("upId", wkiSn);
          resMap.put("type", "3");
          resMap.put("icon", imgPath + "ico-right-last.png");
		  resMap.put("iconClose", imgPath + "ico-right-close.png");
		  resMap.put("iconOpen", imgPath + "ico-right-open.png");
          resList.add(resMap);
        }
      }
      return resList;
    }
   
}
