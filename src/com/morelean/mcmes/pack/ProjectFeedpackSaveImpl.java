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
import java.text.SimpleDateFormat;
import java.text.*;

/**
 * 新增生产投料-根据存货代码获取物料信息
 *
 * @author:phantomsaber
 * @version:2019/7/19 13:59
 * @email:phantomsaber@foxmail.com
 **/
public class ProjectFeedpackSaveImpl implements FuncService {
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
        String itemnumArr = request.getParameter("itemnumArr");
        String itemspecArr = request.getParameter("itemspecArr");
        String itemnameArr = request.getParameter("itemnameArr");
        String workspaceArr = request.getParameter("workspaceArr");
        String warehouseArr = request.getParameter("warehouseArr");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        String reg = "ok";
        if (StringUtils.isEmpty(dataAuth)) {
            dataAuth = modelAction.getCurrUser().getData_auth();
        }

        if (StringUtils.isEmpty(projectId)) {
            reg = "ng1";
            modelAction.setAjaxString(reg);
            return BaseActionSupport.AJAX;
            //   throw new BussException(modelAction.getText("工单号为空"),"");
        } else {
            String sql = "SELECT * FROM T_PROJECT_PACK_FEED A WHERE 1=1 AND A.PROJECT_ID = ? ";
            int count = modelService.countSql(sql, new Object[]{projectId});
            if (count > 0) {
                reg = "ng2";
                modelAction.setAjaxString(reg);
                return BaseActionSupport.AJAX;
                //  throw new BussException("该工单已存在包装明细");
            }
        }


      /*  List list = new ArrayList();
        list.add(projectId);*/

        String[] itemCodes = itemcodeArr.split(",", -1);

        String[] packNums = packnumArr.split(",", -1);
        String[] itemspecs = itemspecArr.split(",", -1);
        String[] itemnums = itemnumArr.split(",", -1);
        String[] itemnames = itemnameArr.split(",", -1);
        String[] workspaces = workspaceArr.split(",", -1);
        String[] warehouses = warehouseArr.split(",", -1);


        MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
        try {
            Date time = sdf1.parse(sdf1.format(new Date()));
            String userId = modelAction.getCurrUser().getId();
            String deptId = modelAction.getCurrUser().getDeptId();
            String updateSql = "UPDATE T_PM_PROJECT_BASE A SET A.PROJECT_STATUS='5', A.FINISH_COUNT = ?,A.EDIT_USER=?,A.EDIT_TIME=? WHERE 1=1 AND A.PROJECT_ID = ? ";
            modelService.execSql(updateSql, new Object[]{receiveCount, userId, DateUtil.getCurDate(), projectId});


            for (int i = 0; i < itemCodes.length; i++) {
                String itemCode = itemCodes[i];
                String packNum = packNums[i];
                String itemnum = itemnums[i];
                String itemspec = itemspecs[i];
                String itemname = itemnames[i];
                String workspace = workspaces[i];
                String warehouse = warehouses[i];

             /*String id = StringUtils.getUUID();
             String did = modelAction.getCurrUser().getDeptId();
             String uid = modelAction.getCurrUser().getId();
             Date d = sdf1.parse(sdf1.format(new Date()));

             String sql12 = "INSERT INTO  T_PROJECT_PACK_FEED (ID,DEPT_ID,CREATE_USER,CREATE_TIME,EDIT_USER,EDIT_TIME,DATA_AUTH,PROJECT_ID,ITEM_CODE,PACK_NUM,ITEM_NUM,ITEM_SPEC,ITEM_MANE,WORK_SPACE,WARE_HOUSE) VALUES"+
                         " (id,did,uid,d,did,d,dataAuth,projectId,itemCode,packNum,itemnum,itemspec,itemname,workspace,warehouse)";
             modelService.execSql(sql12);*/
                TableDataMapExt baseTable = new TableDataMapExt();
                baseTable.setTableName("T_PROJECT_PACK_FEED");

                baseTable.getColMap().put("ID", StringUtils.getUUID());
                baseTable.getColMap().put("DEPT_ID", deptId);
                baseTable.getColMap().put("CREATE_USER", userId);
                baseTable.getColMap().put("CREATE_TIME", time);
                baseTable.getColMap().put("EDIT_USER", userId);
                baseTable.getColMap().put("EDIT_TIME", time);
                baseTable.getColMap().put("DATA_AUTH", dataAuth);
                baseTable.getColMap().put("PROJECT_ID", projectId);
                baseTable.getColMap().put("ITEM_CODE", itemCode);
                baseTable.getColMap().put("PACK_NUM", packNum);

                baseTable.getColMap().put("ITEM_NUM", itemnum);
                baseTable.getColMap().put("ITEM_SPEC", itemspec);
                baseTable.getColMap().put("ITEM_MANE", itemname);
                baseTable.getColMap().put("WORK_SPACE", workspace);
                baseTable.getColMap().put("WARE_HOUSE", warehouse);
                // CommMethod.addSysDefCol(baseTable, modelAction.getUser(), dataAuth);

                modelService.save(baseTable);

            }

            //return modelAction.reloadIframeByIds(iframeId, modelAction.getText("包装成功"), "0");
        } catch (Exception e) {
            e.printStackTrace();
            hbtran.rollback();
            reg = "ng3";
            modelAction.setAjaxString(reg);
            return BaseActionSupport.AJAX;
            // throw new BussException(modelAction.getText("包装提交失败,"+e.getMessage()),e.getMessage());
        }
        hbtran.commit();
        modelAction.setAjaxString(reg);
        return BaseActionSupport.AJAX;


    }

}
