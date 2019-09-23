package com.more.mcmes.feed;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.htmlparser.parserapplications.filterbuilder.layouts.NullLayoutManager;

import org.springframework.orm.hibernate3.HibernateTemplate;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.sql.SQLException;
import java.util.*;

/**
 * 修改数据
 *
 * @author:leon
 * @version:2019/7/16
 * 
 **/
public class FeedWorkOrderEditImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        // 获取封装的数据
        HttpServletRequest request = modelAction.getRequest();
        // 是否关闭窗口
        String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");
        String formId = request.getParameter("formId");
        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        if (StringUtils.isBlank(formId)) {
            formId = request.getParameter("formIds");
        }
        String iframeId = request.getParameter("iframeId");
        String projectId = request.getParameter("projectId");

/*
        String[] itemCodeArr = request.getParameterValues("paraMap1@ITEM_CODE");
        String[] itemNumArr = request.getParameterValues("paraMap1@ITEM_NUM");
        String[] feedNumArr = request.getParameterValues("paraMap1@FEED_NUM");
        String[] processOrderArr = request.getParameterValues("paraMap1@PROCESS_ORDER");
*/
        String cidArrs = request.getParameter("cidArr");
        String itemCodes = request.getParameter("itemCodeArr");
        String itemNums = request.getParameter("itemNumArr");
        String feedNums = request.getParameter("feedCountArr");
        String processOrders = request.getParameter("processOrderArr");

        String[] itemCodeArr = itemCodes.split(",");
        String[] itemNumArr = itemNums.split(",");
        String[] feedNumArr = feedNums.split(",");
        String[] processOrderArr = processOrders.split(",");
      	String[] cidArr = cidArrs.split(",");

        String weightEmp = request.getParameter("weightEmpShow");
        String weightMonitor = request.getParameter("weightMonitorShow");
        String craftsEmp = request.getParameter("crafisEmpShow");
        String adminEmp = request.getParameter("adminEmpShow");
		String modelCode = request.getParameter("modelCode");
        
        
        String order = null;
        String tempCode = null;
        String tempCode1 = null;
        int flags = 0;
       

        String sql = "select id from T_PM_PROJECT_FEED_BASE where PROJECT_ID =? AND DATA_AUTH=? ";
        List list = modelService.listDataSql(sql, new Object[]{projectId, dataAuth});
        if (list == null && list.size() == 0) {
            return modelAction.alertParentInfo((modelAction.getText("该工单不存在")));
        }

        if (null == itemCodeArr || itemCodeArr.length == 0) {
            return modelAction.alertParentInfo((modelAction.getText("请新增投料明细物料编码！")));
        }
        
         

        boolean flag = false;

        String userId = modelAction.getCurrUser().getId();
        String deptId = modelAction.getCurrUser().getDeptId();
        
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date sysDate = DateUtil.parseDate(sdf1.format(new Date()), "yyyy-MM-dd HH:mm:ss");

        TableDataMapExt tdmap = new TableDataMapExt();
        tdmap.setTableName("T_PM_PROJECT_FEED_BASE");
        CommMethod.addSysDefCol(tdmap.getColMap(), modelAction.getUser());
        Map map2 = tdmap.getColMap();
        map2.put("ID", StringUtils.getUUID());
        map2.put("DEPT_ID", deptId);
        map2.put("CREATE_USER", userId);
        map2.put("CREATE_TIME", sysDate);
        map2.put("EDIT_USER", "");
        map2.put("EDIT_TIME", "");
       
       if (StringUtils.isNotBlank(dataAuth)) {
            map2.put("DATA_AUTH", dataAuth);
        }
        map2.put("PROJECT_ID", projectId);
        map2.put("MODEL_CODE", modelCode);
        map2.put("WEIGHT_EMP", weightEmp);
        map2.put("WEIGHT_MONITOR", weightMonitor);
        if (StringUtils.isNotBlank(craftsEmp)) {
            map2.put("CRAFTS_EMP", craftsEmp);
        }
        if (StringUtils.isNotBlank(adminEmp)) {
            map2.put("ADMIN_EMP", adminEmp);
        }
         List<Object> sqlWlist = new ArrayList<Object>();
         sqlWlist.add(projectId);
         tdmap.setSqlWhere(" and PROJECT_ID= ? ");
         tdmap.setSqlWhereArgs(sqlWlist);
	   // String sql1 = "update T_PM_PROJECT_FEED_BASE set WEIGHT_EMP=?, MODEL_CODE=?,WEIGHT_MONITOR=?,CRAFTS_EMP=?, ADMIN_EMP=?,CREATE_TIME=?,CREATE_USER=?,DEPT_ID=? where PROJECT_ID =? AND DATA_AUTH=?";
       // int res = modelService.execSql(sql1, new Object[] { weightEmp,modelCode,weightMonitor,craftsEmp,adminEmp,sysDate,userId,deptId,projectId,dataAuth });
        int res = modelService.edit(tdmap);
        if (res < 0) {
            flag = false;
            return modelAction.alertParentInfo("修改失败");
        }
    
        TableDataMapExt maps = new TableDataMapExt();
        maps.setTableName("T_PM_PROJECT_FEED_DETAIL");
     
       

        for (int i = 0; i < itemCodeArr.length; i++) {
            
            String curItemCode = StringUtils.toString(itemCodeArr[i]);
            String curItemNum = StringUtils.toString(itemNumArr[i]);
            String curFeedNum = StringUtils.toString(feedNumArr[i]);
            String curProcessOrder = StringUtils.toString(processOrderArr[i]);
            String cid = StringUtils.toString(cidArr[i]);
    
            maps.getColMap().clear();
            CommMethod.addSysDefCol(maps.getColMap(), modelAction.getUser());
            maps.getColMap().put("CREATE_USER", userId);
            maps.getColMap().put("CREATE_TIME", sysDate);
            maps.getColMap().put("DATA_AUTH", dataAuth);
            maps.getColMap().put("PROJECT_ID", projectId);
            maps.getColMap().put("MODEL_CODE", modelCode);
            

            maps.getColMap().put("ITEM_CODE", formatStr(curItemCode));
            maps.getColMap().put("ITEM_NUM", formatInt(curItemNum));
            maps.getColMap().put("FEED_NUM", formatInt(curFeedNum));
            maps.getColMap().put("PROCESS_ORDER", formatStr(curProcessOrder));
            int res1;
          	String sqlc = "select ITEM_NUM from T_PM_PROJECT_FEED_DETAIL where ITEM_CODE=? and PROJECT_ID=? ";
            List list1 = modelService.listDataSql(sqlc, new Object[]{formatStr(curItemCode), projectId});
           
            if (list1 == null ||  list1.size() == 0 || "".equals(list1)) {
               res1 = modelService.save(maps);
            }else{
              
               
               String dsql = "select id as  from T_PM_PROJECT_FEED_DETAIL where   PROJECT_ID=?";
               List list2 = modelService.listDataSql(dsql,new Object[]{projectId});
               list2.toString().replaceAll("{ID=","");
               list2.toString().replaceAll("}","");
               return modelAction.alertParentInfo(list2.toString()+"");
              }
              
            
            /**  if(arrList.size()>0){
                String dsql1 = "delete from  T_PM_PROJECT_FEED_DETAIL where id not in(?)  and PROJECT_ID=?";
                modelService.execSql(dsql1, new Object[] {list3.get(0),projectId});
                
               }
                
           		
              List<Object> sqlWlist1 = new ArrayList<Object>();
              sqlWlist1.add(projectId);
              sqlWlist1.add(formatStr(curItemCode));
              //sqlWlist1.add(cid);
              maps.setSqlWhere(" and PROJECT_ID= ? and ITEM_CODE=?");
              maps.setSqlWhereArgs(sqlWlist1);
            
              res1 = modelService.edit(maps);
              
            }
            
             
          //   if(1==1){
            //   return modelAction.alertParentInfo(itemCodeArr[0]+","+itemCodeArr[1]+","+itemCodeArr[2]);
            // }
          //  String sql2 = "update T_PM_PROJECT_FEED_DETAIL set CREATE_USER=?, CREATE_TIME=?,MODEL_CODE=?,ITEM_CODE=?, ITEM_NUM=?,FEED_NUM=?,PROCESS_ORDER=? where PROJECT_ID =? AND DATA_AUTH=?";

          //  int res1 = modelService.execSql(sql2, new Object[] { userId,sysDate,modelCode,formatStr(curItemCode),formatInt(curItemNum),formatInt(curFeedNum),formatStr(curProcessOrder),projectId,dataAuth });
			
            if (res1 < 0) {
                flag = false;
                return modelAction.alertParentInfo("修改失败");
            }else{
                flag = true;
            }**/
             
           
        }
      
      

       if (flag == true) {
          isCloseWin = "0";
          return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), isCloseWin);
        } else {
            return modelAction.alertParentInfo("修改失败");
        } 
    } 

    /**
     * 参数类型转换校验处理 int
     *
     * @param inStr
     * @return
     */
    public int formatInt(String inStr) {
        int ret = 0;

        try {
            if (!StringUtils.isEmpty(inStr)) {
                if (StringUtils.isNotBlank(inStr)) {
                    ret = Integer.parseInt(inStr);
                }
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            throw new BussException("整型参数异常");
        }
        return ret;
    }

    /**
     * 参数类型转换校验处理 String
     *
     * @param inObj
     * @return
     */
    public String formatStr(Object inObj) {
        String ret = "";
        try {
            if (!StringUtils.isEmpty(inObj)) {
                ret = StringUtils.toString(inObj);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new BussException("对象参数异常");
        }
        return ret;
    }
}
