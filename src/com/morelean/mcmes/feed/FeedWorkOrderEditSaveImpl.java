package com.morelean.mcmes.feed;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 新增生产投料-根据存货代码获取物料信息
 *
 * @author:phantomsaber
 * @version:2019/8/06 13:59
 * @email:phantomsaber@foxmail.com
 **/
public class FeedWorkOrderEditSaveImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();

        String iframeId = request.getParameter("iframeId");

        String projectId = request.getParameter("PROJECT_ID");
        String receiveCount = request.getParameter("paraMapObj.RECEIVE_COUNT");

        String itemCodeStr = request.getParameter("ITEM_CODE");
        String stockCodeStr = request.getParameter("STOCK_CODE");
        String itemNumStr = request.getParameter("ITEM_NUM");
        String feedNumStr = request.getParameter("FEED_NUM");
        String itemUnitStr = request.getParameter("ITEM_UNIT");
        String rawLotStr = request.getParameter("RAW_LOTNUMBER");
        String processOrderStr = request.getParameter("PROCESS_ORDER");
        String workSpaceStr = request.getParameter("WORK_SPACE");
        String wareHouseStr = request.getParameter("WARE_HOUSE");

        String oldItemCodeStr = request.getParameter("OLD_ITEM_CODE");
        String oldStockCodeStr = request.getParameter("OLD_STOCK_CODE");
        String oldItemNumStr = request.getParameter("OLD_ITEM_NUM");
        String oldFeedNumStr = request.getParameter("OLD_FEED_NUM");
        String oldItemUnitStr = request.getParameter("OLD_ITEM_UNIT");
        String oldRawLotStr = request.getParameter("OLD_RAW_LOTNUMBER");
        String oldProcessOrderStr = request.getParameter("OLD_PROCESS_ORDER");
        String oldWorkSpaceStr = request.getParameter("OLD_WORK_SPACE");
        String oldWareHouseStr = request.getParameter("OLD_WARE_HOUSE");

        String newItemCodeStr = request.getParameter("NEW_ITEM_CODE");
        String newStockCodeStr = request.getParameter("NEW_STOCK_CODE");
        String newItemNumStr = request.getParameter("NEW_ITEM_NUM");
        String newFeedNumStr = request.getParameter("NEW_FEED_NUM");
        String newItemUnitStr = request.getParameter("NEW_ITEM_UNIT");
        String newRawLotStr = request.getParameter("NEW_RAW_LOTNUMBER");
        String newProcessOrderStr = request.getParameter("NEW_PROCESS_ORDER");
        String newWorkSpaceStr = request.getParameter("NEW_WORK_SPACE");
        String newWareHouseStr = request.getParameter("NEW_WARE_HOUSE");

        MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        if (StringUtils.isEmpty(dataAuth)) {
            dataAuth = modelAction.getCurrUser().getData_auth();
        }

        if (StringUtils.isEmpty(dataAuth)) {
            dataAuth = modelAction.getCurrUser().getData_auth();
        }

        String checkAuthSql = "SELECT * FROM T_PM_PROJECT_BASE T WHERE 1=1 AND T.PROJECT_ID= ? AND T.DATA_AUTH = ? ";

        List checkAuthList = modelService.listDataSql(checkAuthSql, new Object[]{projectId, dataAuth});
        if (checkAuthList.size() <= 0) {
            throw new BussException(modelAction.getText("当前组织机构无法操作该单据,请切换后重试"), "");
        }

        if (StringUtils.isEmpty(projectId)) {
            throw new BussException(modelAction.getText("工单号为空"), "");
        }

        String userId = modelAction.getCurrUser().getId();

        List list = new ArrayList();
        list.add(projectId);

        String[] itemCodes = itemCodeStr.split(",", -1);
        String[] stockCodes = stockCodeStr.split(",", -1);

        String[] itemNums = itemNumStr.split(",", -1);
        String[] feedNums = feedNumStr.split(",", -1);
        String[] itemUnits = itemUnitStr.split(",", -1);
        String[] rawLots = rawLotStr.split(",", -1);
        String[] processOrders = processOrderStr.split(",", -1);
        String[] workSpaces = workSpaceStr.split(",", -1);
        String[] wareHouses = wareHouseStr.split(",", -1);


        String[] oldItemCodes = oldItemCodeStr.split(",", -1);
        String[] oldStockCodes = oldStockCodeStr.split(",", -1);
        String[] oldItemNums = oldItemNumStr.split(",", -1);
        String[] oldFeedNums = oldFeedNumStr.split(",", -1);
        String[] oldItemUnits = oldItemUnitStr.split(",", -1);
        String[] oldRawLots = oldRawLotStr.split(",", -1);
        String[] oldProcessOrders = oldProcessOrderStr.split(",", -1);
        String[] oldWorkSpaces = oldWorkSpaceStr.split(",", -1);
        String[] oldWareHouses = oldWareHouseStr.split(",", -1);

        String[] newItemCodes = newItemCodeStr.split(",", -1);
        String[] newStockCodes = newStockCodeStr.split(",", -1);
        String[] newItemNums = newItemNumStr.split(",", -1);
        String[] newFeedNums = newFeedNumStr.split(",", -1);
        String[] newItemUnits = newItemUnitStr.split(",", -1);
        String[] newRawLots = newRawLotStr.split(",", -1);
        String[] newProcessOrders = newProcessOrderStr.split(",", -1);
        String[] newWorkSpaces = newWorkSpaceStr.split(",", -1);
        String[] newWareHouses = newWareHouseStr.split(",", -1);

        try {
            TableDataMapExt baseTable = new TableDataMapExt();

            String updateSql = " UPDATE T_PM_PROJECT_feed_BASE A " +
                    " SET A.RECEIVE_COUNT= ?, A.EDIT_USER= ?,A.EDIT_TIME=SYSDATE " +
                    " WHERE 1 = 1 AND A.PROJECT_ID = ? ";

            modelService.execSql(updateSql, new Object[]{receiveCount, userId, projectId});

            String baseupdateSql = " UPDATE T_PM_PROJECT_BASE A SET A.FINISH_COUNT= ? WHERE 1 = 1 AND A.PROJECT_ID = ? ";

            modelService.execSql(baseupdateSql, new Object[]{receiveCount, projectId});

            String deleteDataUserSql = "DELETE FROM T_PM_PROJECT_FEED_DETAIL A " +
                    "WHERE 1=1 " +
                    "AND A.PROJECT_ID = ? " +
                    "AND A.CREATE_USER = ? ";

            modelService.execSql(deleteDataUserSql, new Object[]{projectId, userId});

            TableDataMapExt detailTable = new TableDataMapExt();

            if (newItemCodes.length > 0 & newItemCodes[0].length() > 1) {
                for (int i = 0; i < newItemCodes.length; i++) {
                    if (newItemCodes[i].length() > 0 & (!StringUtils.isEmpty(newItemCodes[i]))) {
                        detailTable.setTableName("T_PM_PROJECT_FEED_DETAIL");

                        detailTable.getColMap().put("ID", StringUtils.getUUID());
                        detailTable.getColMap().put("DEPT_ID", modelAction.getCurrUser().getDeptId());

                        detailTable.getColMap().put("CREATE_USER", userId);
                        detailTable.getColMap().put("CREATE_TIME", DateUtil.getCurDate());

                        detailTable.getColMap().put("EDIT_USER", userId);
                        detailTable.getColMap().put("EDIT_TIME", DateUtil.getCurDate());

                        detailTable.getColMap().put("DATA_AUTH", dataAuth);
                        detailTable.getColMap().put("PROJECT_ID", projectId);

                        detailTable.getColMap().put("ITEM_CODE", StringUtils.toString(newItemCodes[i]));
                        detailTable.getColMap().put("STOCK_CODE", (newStockCodes[i]));
                        detailTable.getColMap().put("ITEM_NUM", (newItemNums[i]));
                        detailTable.getColMap().put("ITEM_UNIT", (newItemUnits[i]));
                        detailTable.getColMap().put("FEED_NUM", (newFeedNums[i]));
                        detailTable.getColMap().put("RAW_LOTNUMBER", (newRawLots[i]));
                        detailTable.getColMap().put("PROCESS_ORDER", (newProcessOrders[i]));

                        detailTable.getColMap().put("WORK_SPACE", (newWorkSpaces[i]));
                        detailTable.getColMap().put("WAREHOUSE", (newWareHouses[i]));

                        CommMethod.addSysDefCol(detailTable, modelAction.getUser(), dataAuth);
                        modelService.save(detailTable);
                    }
                }
            } else {

                String checkUserData = "SELECT * FROM T_PM_PROJECT_FEED_DETAIL A WHERE 1=1 AND A.PROJECT_ID = ? AND A.CREATE_USER = ? ";
                List list1 = modelService.listDataSql(checkUserData, new Object[]{projectId, userId});
                if(list1.size() > 0){
                    for (int i = 0; i < oldItemCodes.length; i++) {
                        if (oldItemCodes[i].length() > 0 & (!StringUtils.isEmpty(oldItemCodes[i]))) {
                            detailTable.setTableName("T_PM_PROJECT_FEED_DETAIL");

                            detailTable.getColMap().put("ID", StringUtils.getUUID());
                            detailTable.getColMap().put("DEPT_ID", modelAction.getCurrUser().getDeptId());

                            detailTable.getColMap().put("CREATE_USER", userId);
                            detailTable.getColMap().put("CREATE_TIME", DateUtil.getCurDate());

                            detailTable.getColMap().put("EDIT_USER", userId);
                            detailTable.getColMap().put("EDIT_TIME", DateUtil.getCurDate());

                            detailTable.getColMap().put("DATA_AUTH", dataAuth);
                            detailTable.getColMap().put("PROJECT_ID", projectId);

                            detailTable.getColMap().put("ITEM_CODE", StringUtils.toString(oldItemCodes[i]));
                            detailTable.getColMap().put("STOCK_CODE", (oldStockCodes[i]));
                            detailTable.getColMap().put("ITEM_NUM", (oldItemNums[i]));
                            detailTable.getColMap().put("ITEM_UNIT", (oldItemUnits[i]));
                            detailTable.getColMap().put("FEED_NUM", (oldFeedNums[i]));
                            detailTable.getColMap().put("RAW_LOTNUMBER", (oldRawLots[i]));
                            detailTable.getColMap().put("PROCESS_ORDER", (oldProcessOrders[i]));

                            detailTable.getColMap().put("WORK_SPACE", (oldWorkSpaces[i]));
                            detailTable.getColMap().put("WAREHOUSE", (oldWareHouses[i]));

                            CommMethod.addSysDefCol(detailTable, modelAction.getUser(), dataAuth);
                            modelService.save(detailTable);
                        }
                    }
                }
            }


            hbtran.commit();
        } catch (Exception e) {
            e.printStackTrace();
            hbtran.rollback();
            throw new BussException(modelAction.getText("投料修改失败," + e.getMessage()), e.getMessage());
        }

        return modelAction.reloadIframeByIds(iframeId, modelAction.getText("投料修改成功"), "0");
    }

}
