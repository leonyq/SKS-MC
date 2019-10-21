package com.morelean.mcmes.feed;

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
public class FeedWorkOrderAddSaveImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();

        String iframeId = request.getParameter("iframeId");

        String projectId = request.getParameter("PROJECT_ID");
        String receiveCount = request.getParameter("RECEIVE_COUNT");
        String vatNo = request.getParameter("VAT_NO");
        String rawLicense = request.getParameter("RAW_LICENSE");

        String itemCodeStr = request.getParameter("ITEM_CODE");
        String stockCodeStr = request.getParameter("STOCK_CODE");
        String itemNumStr = request.getParameter("ITEM_NUM");
        String feedNumStr = request.getParameter("FEED_NUM");
        String rawLotStr = request.getParameter("RAW_LOTNUMBER");
        String processOrderStr = request.getParameter("PROCESS_ORDER");
        String workSpaceStr = request.getParameter("WORK_SPACE");
        String wareHouseStr = request.getParameter("WARE_HOUSE");

        String itemUnitStr = request.getParameter("ITEM_UNIT");

        String dataAuth = modelAction.getRequest().getParameter("_mcDataAuth");
//        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        if (StringUtils.isEmpty(dataAuth)) {
            dataAuth = modelAction.getCurrUser().getData_auth();
        }

        if(StringUtils.isEmpty(projectId)){
            throw new BussException(modelAction.getText("工单号为空"),"");
        }else{
            String sql = "SELECT * FROM T_PM_PROJECT_FEED_DETAIL A WHERE 1=1 AND A.PROJECT_ID = ? ";
            int count = modelService.countSql(sql, new Object[]{projectId});
            if(count > 0){
                throw new BussException(modelAction.getText("该工单已存在投料明细"),"");
            }
        }

        String userId = modelAction.getCurrUser().getId();

        List list = new ArrayList();
        list.add(projectId);

        String[] itemCodes = itemCodeStr.split(",",-1);
        String[] stockCodes = stockCodeStr.split(",",-1);

        String[] itemNums = itemNumStr.split(",",-1);
        String[] feedNums = feedNumStr.split(",",-1);
        String[] rawLots = rawLotStr.split(",",-1);
        String[] processOrders = processOrderStr.split(",",-1);
        String[] workSpaces = workSpaceStr.split(",", -1);
        String[] wareHouses = wareHouseStr.split(",", -1);

        String[] itemUnits = itemUnitStr.split(",", -1);


        MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
        try {
            TableDataMapExt baseTable = new TableDataMapExt();
            for (int i=0;i<itemCodes.length;i++) {
                baseTable.setTableName("T_PM_PROJECT_FEED_BASE");

                baseTable.getColMap().put("ID", StringUtils.getUUID());
                baseTable.getColMap().put("DEPT_ID", modelAction.getCurrUser().getDeptId());

                baseTable.getColMap().put("CREATE_USER", modelAction.getCurrUser().getId());
                baseTable.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
                baseTable.getColMap().put("EDIT_TIME", DateUtil.getCurDate());

                baseTable.getColMap().put("DATA_AUTH",dataAuth);
                baseTable.getColMap().put("PROJECT_ID",projectId);

                baseTable.getColMap().put("MODEL_CODE", "");
                baseTable.getColMap().put("WEIGHT_EMP", "");
                baseTable.getColMap().put("WEIGHT_MONITOR", "");
                baseTable.getColMap().put("CRAFTS_EMP", "");
                baseTable.getColMap().put("ADMIN_EMP", modelAction.getCurrUser().getId());
                baseTable.getColMap().put("RECEIVE_COUNT", receiveCount);
                baseTable.getColMap().put("RAW_LICENSE", rawLicense);
                baseTable.getColMap().put("VAT_NO", vatNo);
                CommMethod.addSysDefCol(baseTable, modelAction.getUser(), dataAuth);
            }
            modelService.save(baseTable);

            TableDataMapExt detailTable = new TableDataMapExt();
            for (int i=0;i<itemCodes.length;i++) {
                detailTable.setTableName("T_PM_PROJECT_FEED_DETAIL");

                detailTable.getColMap().put("ID", StringUtils.getUUID());
                detailTable.getColMap().put("DEPT_ID", modelAction.getCurrUser().getDeptId());

                detailTable.getColMap().put("CREATE_USER", userId);
                detailTable.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
                detailTable.getColMap().put("EDIT_USER", userId);
                detailTable.getColMap().put("EDIT_TIME", DateUtil.getCurDate());

                detailTable.getColMap().put("DATA_AUTH", dataAuth);
                detailTable.getColMap().put("PROJECT_ID", projectId);

                detailTable.getColMap().put("ITEM_CODE", StringUtils.toString(itemCodes[i]));
                detailTable.getColMap().put("STOCK_CODE", (stockCodes[i]));
                detailTable.getColMap().put("ITEM_NUM", (itemNums[i]));
                detailTable.getColMap().put("FEED_NUM", (feedNums[i]));
                detailTable.getColMap().put("RAW_LOTNUMBER", (rawLots[i]));
                detailTable.getColMap().put("PROCESS_ORDER", (processOrders[i]));
                detailTable.getColMap().put("ITEM_UNIT", (itemUnits[i]));

                detailTable.getColMap().put("WORK_SPACE", (workSpaces[i]));
                detailTable.getColMap().put("WAREHOUSE", (wareHouses[i]));

                CommMethod.addSysDefCol(detailTable, modelAction.getUser(), dataAuth);
                modelService.save(detailTable);
            }

            String updateSql = "UPDATE T_PM_PROJECT_BASE A SET A.PROJECT_STATUS = '4' WHERE 1=1 AND A.PROJECT_ID = ? ";

            String updateRelSql = "UPDATE T_PM_PROJECT_BASE A " +
                    "SET A.EDIT_TIME = SYSDATE, A.PROJECT_STATUS = '4' " +
                    "WHERE 1 = 1 " +
                    "AND A.PROJECT_ID IN (SELECT B.PROJECT_ID FROM T_PM_PROJECT_REL B INNER JOIN T_PM_PROJECT_BASE C ON B.PROJECT_ID = C.PROJECT_ID " +
                    "WHERE 1 = 1 AND B.REL_PROJECT_ID = ? )";
            modelService.execSql(updateSql, new Object[]{projectId});
            modelService.execSql(updateRelSql, new Object[]{projectId});
            hbtran.commit();
        } catch (Exception e) {
            e.printStackTrace();
            hbtran.rollback();
            throw new BussException(modelAction.getText("投料失败,"+e.getMessage()),e.getMessage());
        }

        return modelAction.reloadIframeByIds(iframeId, modelAction.getText("投料成功"), "0");
    }

}
