package com.more.mecs.project;


import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.*;

public class QueryProjectMsg implements FuncService {

	@SuppressWarnings("unchecked")
    @Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		String id = req.getParameter("id");
        String tag = req.getParameter("tag");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String starTime = null;
		String endTime = null;
     
        if(id == null){
          return modelAction.alertParentInfo(modelAction.getText("请选择一条数据"));
        }
		Map map = new HashMap();
          //工单关联节点
          String sql = "select t.PROJECT_ID,s.name as CREATE_USER,t.CREATE_TIME, t.PROJECT_SORT from T_PM_PROJECT_BASE t left join SY_USER S on s.id=t.create_user where 1=1 and t.id=?";
          List relList = modelService.listDataSql(sql,new Object[]{id});
          if (relList.size() > 0) {
            map.put("relList",relList);
          }else{
            return modelAction.alertParentInfo(modelAction.getText("工单关联未处理"));
          }
          if ("1".equals(tag)){
           if (map.size() > 0) {
            modelAction.setAjaxMap(map);
           }
        
		    return BaseActionSupport.AJAX; 
         }
          //备料节点
          String sql1 = "select t.REL_PROJECT_ID,s.name as EDIT_USER,t.EDIT_TIME, b.LOT_NUMBER from T_PM_PROJECT_REL t left join  T_PM_PROJECT_BASE b on b.project_id = t.project_id left join sy_user s on s.id=t.edit_user where 1=1  and b.id=? ";
          List readyList = modelService.listDataSql(sql1,new Object[]{id});
          if (readyList.size() > 0) {
            map.put("readyList",readyList);
          }else{
            String reg = "备料还未处理";
            modelAction.setAjaxString(reg);
          //  return modelAction.alertParentInfo(modelAction.getText("备料还未处理"));
          }
            
          if ("2".equals(tag)){
           if (map.size() > 0) {
            modelAction.setAjaxMap(map);
           }
        
		    return BaseActionSupport.AJAX; 
         }
      
        
      
          //投料节点
          String sql2 = "select t.PROJECT_ID,s.name as EDIT_USER,d.EDIT_TIME,d.FEED_NUM from T_PM_PROJECT_BASE t  left join T_PM_PROJECT_FEED_DETAIL d on d.project_id = t.project_id left join sy_user s on s.id=d.EDIT_USER where 1=1 and t.id=?";
          List feedList = modelService.listDataSql(sql2,new Object[]{id});
          if (feedList.size() > 0) {
            map.put("feedList",feedList);
          }else{
            String reg = "投料还未处理";
            modelAction.setAjaxString(reg);
        //    return modelAction.alertParentInfo(modelAction.getText("投料还未处理"));
          }
          if("3".equals(tag)){
          if (map.size() > 0) {
            modelAction.setAjaxMap(map);
           }
        
		    return BaseActionSupport.AJAX;
        }
      
          //包装节点
          String sql3 = "select t.PROJECT_ID,t.FINISH_COUNT,s.name as EDIT_USER,p.EDIT_TIME from T_PM_PROJECT_BASE t left join T_PROJECT_PACK_FEED p on p.project_id=t.project_id left join sy_user s on s.id= p.EDIT_USER  where 1=1 and t.id=?";
          List packList = modelService.listDataSql(sql3,new Object[]{id});
          if (packList.size() > 0) {
            map.put("packList",packList);
          }else{
            String reg = "包装未还未处理";
            modelAction.setAjaxString(reg);
           // return modelAction.alertParentInfo(modelAction.getText("包装未还未处理"));
          }
          //物料信息
          String sql4 = "select t.PROJECT_ID,d.ITEM_CODE,d.STOCK_CODE,d.FEED_NUM,d.RAW_LOTNUMBER,d.PROCESS_ORDER from T_PM_PROJECT_BASE t  left join T_PM_PROJECT_FEED_DETAIL d on d.project_id = t.project_id where 1=1 and t.id=?";
          List packFeedList = modelService.listDataSql(sql4,new Object[]{id});
          if (packFeedList.size() > 0) {
            map.put("packFeedList",packFeedList);
          }else{
            String reg = "物料信息错误";
            modelAction.setAjaxString(reg);
            //return modelAction.alertParentInfo(modelAction.getText("物料信息错误"));
          }
          
        
          //质检节点
          String sql5 = "select t.PROJECT_ID, c.CHECK_STATUS,c.QT_MON,s.name as CHECK_USER,c.EDIT_TIME from T_PM_PROJECT_BASE t  left join T_QM_PROJECT_CHECK c on c.project_id = t.project_id left join sy_user s on s.id=c.CHECK_USER where 1=1 and t.id=?";
          List checkdList = modelService.listDataSql(sql5,new Object[]{id});
          if (checkdList.size() > 0) {
            map.put("checkdList",checkdList);
          }else{
           // return modelAction.alertParentInfo((modelAction.getText("还未处理质检")));
          }
        
      
        if (map.size() > 0) {
          
          modelAction.setAjaxMap(map);
        }
        
        
		return BaseActionSupport.AJAX;
	}
	
}

