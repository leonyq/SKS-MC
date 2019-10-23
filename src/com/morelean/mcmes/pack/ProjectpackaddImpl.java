package com.morelean.mcmes.pack;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.*;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

        MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象

        String packUserId = "0334111959ba4518969a53067a26a836";

        HttpServletResponse response = modelAction.getResponse();
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Cache-Control", "no-cache");

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

        //工单是否存在
        String checksql = "SELECT * FROM  T_PM_PROJECT_BASE T  WHERE 1=1 AND (T.PROJECT_STATUS='4' or T.PROJECT_STATUS='3')  AND T.PROJECT_SORT = '2' AND T.PROJECT_ID=?  ";

        List list1 = modelService.listDataSql(checksql, new Object[]{projectId});

        String reg = "ok";
        if (list1.size() <= 0) {
            String checksql2 = "SELECT * FROM T_PM_PROJECT_BASE T WHERE 1=1 AND T.PROJECT_SORT = '2' AND T.PROJECT_ID= ? ";
            List checksql2List = modelService.listDataSql(checksql2, new Object[]{projectId});
            if(checksql2List.size() <= 0){
                reg = "ng";
                modelAction.setAjaxString(reg);
                return modelAction.AJAX;
            }else{
                String prepareRes = "";
                String relRes = "";
                relRes = doRel(modelService, dataAuth, projectId, packUserId);
                if (!"OK".equals(relRes)) {
                    modelAction.setAjaxString(projectId + "工单关联失败," + relRes);
                    return BaseActionSupport.AJAX;
                }

                prepareRes = doPrepare(modelService, dataAuth, projectId, packUserId);
                if (!"OK".equals(prepareRes)) {
                    modelAction.setAjaxString(projectId + "生产备料失败," + prepareRes);
                    return BaseActionSupport.AJAX;
                }
            }
        }

        String userId = modelAction.getCurrUser().getId();

        List list = new ArrayList();
        list.add(projectId);

        String[] itemCodes = itemcodeArr.split(",",-1);
        String[] packNums = packnumArr.split(",",-1);
        String[] itemspecs = itemspecArr.split(",",-1);
        String[] itemnums = itemnumArr.split(",",-1);
        String[] itemnames = itemnameArr.split(",",-1);
        String[] workspaces = workspaceArr.split(",",-1);
        String[] warehouses = warehouseArr.split(",",-1);


        try{

            String updateSql = "UPDATE T_PM_PROJECT_BASE A SET A.PROJECT_STATUS='5', A.FINISH_COUNT = ?,A.EDIT_USER=?,A.EDIT_TIME=? WHERE 1=1 AND A.PROJECT_ID = ? ";
            modelService.execSql(updateSql, new Object[]{receiveCount,packUserId, DateUtil.getCurDate(),projectId});

            TableDataMapExt baseTable = new TableDataMapExt();
            for(int i=0;i<itemCodes.length;i++){
                String itemCode = itemCodes[i];
                String packNum = packNums[i];
                String itemnum = itemnums[i];
                String itemspec = itemspecs[i];
                String itemname = itemnames[i];
                String workspace = workspaces[i];
                String warehouse = warehouses[i];
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
                baseTable.getColMap().put("ITEM_NUM", itemnum);
                baseTable.getColMap().put("ITEM_SPEC", itemspec);
                baseTable.getColMap().put("ITEM_MANE", itemname);
                baseTable.getColMap().put("WORK_SPACE", workspace);
                baseTable.getColMap().put("WARE_HOUSE", warehouse);
                CommMethod.addSysDefCol(baseTable, modelAction.getUser(), dataAuth);
                modelService.save(baseTable);
            }
            hbtran.commit();
            reg = "ok";
            modelAction.setAjaxString(reg);
            return BaseActionSupport.AJAX;
        } catch (Exception e) {
            e.printStackTrace();
            hbtran.rollback();
            throw new BussException(modelAction.getText("包装提交失败,"+e.getMessage()),e.getMessage());
        }
    }

    /**
     * 调用工单关联存储过程
     *
     * @param modelService
     * @param dataAuth
     * @param workOrder
     * @param relWorkerOrder
     * @return
     */
    public String callProjectRel(ModelService modelService, String dataAuth, String workOrder, String relWorkerOrder, String userId) {
        ProFuncDto pf = new ProFuncDto();
        int[] inPlace = {1, 2, 3, 4};
        int[] outplace = {5};
        List<Object> list = new ArrayList<>();
        List<Object> outType = new ArrayList<Object>();
        list.add(dataAuth);
        list.add(workOrder);
        list.add(relWorkerOrder);
        list.add(userId);
        outType.add("String");
        pf.setClassName("P_LEO_REL_PROJECT_SN");
        pf.setInPlace(inPlace);
        pf.setOutPlace(outplace);
        pf.setTotalLen(list.size() + outType.size());
        pf.setValArgs(list);
        pf.setOutValType(outType);
        List<Object> relist = modelService.procComm(pf);
        String res = (String) relist.get(0);
        return res;
    }

    /**
     * 工单备料存储过程调用
     *
     * @param modelService
     * @param dataAuth
     * @param relWorkerOrder
     * @param userId
     * @return
     */
    public String callProjectPrepare(ModelService modelService, String dataAuth, String relWorkerOrder, String userId) {
        ProFuncDto pf = new ProFuncDto();
        int[] inPlace = {1, 2, 3};
        int[] outplace = {4};
        List<Object> list = new ArrayList<Object>();
        List<Object> outType = new ArrayList<Object>();
        list.add(dataAuth);
        list.add(relWorkerOrder);
        list.add(userId);
        outType.add("String");
        pf.setClassName("P_C_VOID_PREPARE_PROJECT_SN");
        pf.setInPlace(inPlace);
        pf.setOutPlace(outplace);
        pf.setTotalLen(list.size() + outType.size());
        pf.setValArgs(list);
        pf.setOutValType(outType);
        List<Object> relist = modelService.procComm(pf);
        String res = (String) relist.get(0);
        return res;
    }

    public String doRel(ModelService modelService, String dataAuth, String projectId, String userId) {
        String res = "";
        try {
            res = callProjectRel(modelService, dataAuth, projectId, projectId, userId);
            if (!"OK".equals(res)) {
                res = StringUtils.toString(res.split(":")[1]);
            }
        } catch (Exception e) {
            res = e.getMessage();
        }
        return res;
    }

    public String doPrepare(ModelService modelService, String dataAuth, String projectId, String userId) {
        String res = "";
        try {
            res = callProjectPrepare(modelService, dataAuth, projectId, userId);
            if (!"OK".equals(res)) {
                res = StringUtils.toString(res.split(":")[1]);
            }
        } catch (Exception e) {
            res = e.getMessage();
        }
        return res;
    }

}
