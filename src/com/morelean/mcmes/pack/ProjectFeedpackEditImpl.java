package com.morelean.mcmes.pack;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.*;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 包装修改保存
 *
 **/
public class ProjectFeedpackEditImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();

        String iframeId = "3ed22e0bef7744dcb3ea955b7bb638fb";

        String projectId = request.getParameter("projectId");
        String receiveCount = request.getParameter("finishCount");

        String itemcodeArr = request.getParameter("itemcodeArr");
      	log.error("12580:"+itemcodeArr);
        String packnumArr = request.getParameter("packnumArr");

        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        if(StringUtils.isEmpty(dataAuth)){
            dataAuth = modelAction.getCurrUser().getData_auth();
        }

        if(StringUtils.isEmpty(projectId)){
            throw new BussException(modelAction.getText("工单号为空"),"");
        }
      
        String userId = modelAction.getCurrUser().getId();

        List list = new ArrayList();
        list.add(projectId);

        String[] itemCodes = itemcodeArr.split(",",-1);

        String[] packNums = packnumArr.split(",",-1);
 
        MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
        try{
          
         String updateSql = "UPDATE T_PM_PROJECT_BASE A SET  A.FINISH_COUNT = ?,A.EDIT_USER=?,A.EDIT_TIME=? WHERE 1=1 AND A.PROJECT_ID = ? ";
          modelService.execSql(updateSql, new Object[]{receiveCount,userId,DateUtil.getCurDate(),projectId});
        
          
          for(int i=0;i<itemCodes.length;i++){
             String itemCode = itemCodes[i];
             String packNum = packNums[i];
             String updatefSql = "UPDATE T_PROJECT_PACK_FEED A SET  A.PACK_NUM = ?,A.EDIT_USER=?,A.EDIT_TIME=? WHERE 1=1 AND A.PROJECT_ID = ? AND ITEM_CODE=?";
             modelService.execSql(updatefSql, new Object[]{packNum,userId,DateUtil.getCurDate(),projectId,itemCode});
          }
          hbtran.commit();
         String reg = "ok";
		 modelAction.setAjaxString(reg);
		return BaseActionSupport.AJAX;
          //return modelAction.reloadIframeByIds(iframeId, modelAction.getText("包装成功"), "0");
        } catch (Exception e) {
            e.printStackTrace();
            hbtran.rollback();
            throw new BussException(modelAction.getText("包装提交失败,"+e.getMessage()),e.getMessage());
        }
      
        
    }

}
