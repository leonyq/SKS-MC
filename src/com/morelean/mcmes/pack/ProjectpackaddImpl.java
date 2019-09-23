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
 * 新增生产投料-根据存货代码获取物料信息
 *
 * @author:phantomsaber
 * @version:2019/7/19 13:59
 * @email:phantomsaber@foxmail.com
 **/
public class ProjectpackaddImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();

        String iframeId = "iframe2";

        String projectId = request.getParameter("projectId");
        String receiveCount = request.getParameter("finishCount");

        String itemcodeArr = request.getParameter("itemcodeArr");
        String packnumArr = request.getParameter("packnumArr");

        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        if(StringUtils.isEmpty(dataAuth)){
            dataAuth = modelAction.getCurrUser().getData_auth();
        }

        if(StringUtils.isEmpty(projectId)){
            throw new BussException(modelAction.getText("工单号为空"),"");
        }else{
            String sql = "SELECT * FROM T_PROJECT_PACK_FEED A WHERE 1=1 AND A.PROJECT_ID = ? ";
            int count = modelService.countSql(sql, new Object[]{projectId});
            if(count > 0){
                throw new BussException(modelAction.getText("该工单已存在包装明细"),"");
            }
        }

        String userId = modelAction.getCurrUser().getId();

        List list = new ArrayList();
        list.add(projectId);

        String[] itemCodes = itemcodeArr.split(",",-1);

        String[] packNums = packnumArr.split(",",-1);

        MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
        try{
          
          String updateSql = "UPDATE T_PM_PROJECT_BASE A SET A.PROJECT_STATUS='5', A.FINISH_COUNT = ?,A.EDIT_USER=?,A.EDIT_TIME=? WHERE 1=1 AND A.PROJECT_ID = ? ";
          modelService.execSql(updateSql, new Object[]{receiveCount,userId, DateUtil.getCurDate(),projectId});
          
          TableDataMapExt baseTable = new TableDataMapExt();
          for(int i=0;i<itemCodes.length;i++){
             String itemCode = itemCodes[i];
             String packNum = packNums[i];
             baseTable.setTableName("T_PROJECT_PACK_FEED");
             baseTable.getColMap().put("ID", StringUtils.getUUID());
             baseTable.getColMap().put("DEPT_ID", modelAction.getCurrUser().getDeptId());
             baseTable.getColMap().put("CREATE_USER", modelAction.getCurrUser().getId());
             baseTable.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
             baseTable.getColMap().put("EDIT_USER", modelAction.getCurrUser().getId());
             baseTable.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
             baseTable.getColMap().put("DATA_AUTH",dataAuth);
             baseTable.getColMap().put("PROJECT_ID",projectId);
             baseTable.getColMap().put("ITEM_CODE", itemCode);
             baseTable.getColMap().put("PACK_NUM", packNum);
            
             CommMethod.addSysDefCol(baseTable, modelAction.getUser(), dataAuth);
             modelService.save(baseTable);
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
