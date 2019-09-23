package com.more.sap.intf.job;

import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import java.util.List;
import java.util.Map;

public class SyncProjectFeedPost implements IJobx {
    private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

    @Override
    public void exec(Args args) throws Exception {
        /**
         * 1.查询需要修改的记录
         */
        String getEditListSql = "SELECT A.PROJECT_ID,A.ITEM_CODE " +
                " FROM T_PROJECT_SAP_LOG_DETAIL A " +
                " WHERE 1 = 1 " +
                " AND A.SFLAG <> 'Y' " +
                " AND A.INTF_TYPE = '5' " +
                " AND A.MESSAGE LIKE '%库存不足%' " +
                " AND A.ITEM_CODE NOT IN " +
                " (SELECT B.ITEM_CODE " +
                " FROM T_PM_PROJECT_FEED_DETAIL B " +
                " WHERE 1 = 1 " +
                " AND B.PROJECT_ID = A.PROJECT_ID) " +
                " GROUP BY A.PROJECT_ID,A.ITEM_CODE ";

        /**
         * 2.查询目标数据
         */
        List<Map<String,String>> editList = modelService.listDataSql(getEditListSql, new Object[]{});

        for (Map<String, String> editMap : editList) {
            String oldProjectId = editMap.get("PROJECT_ID");
            String oldItemCode = editMap.get("ITEM_CODE");

            String getTargetListSql =
                    " SELECT A.PROJECT_ID,A.ITEM_CODE FROM T_PM_PROJECT_FEED_DETAIL A " +
                    " WHERE 1=1 " +
                    " AND A.PROJECT_ID = ? " +
                    " MINUS " +
                    " SELECT B.PROJECT_ID,B.ITEM_CODE FROM T_PROJECT_SAP_LOG_DETAIL B " +
                    " WHERE 1=1 " +
                    " AND B.INTF_TYPE = '5' " +
                    " AND B.PROJECT_ID = ? ";

            List<Map<String, String>> targetList = modelService.listDataSql(getTargetListSql, new Object[]{oldProjectId, oldProjectId});

            MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
            try {
                for (Map<String, String> map : targetList) {
                    String newProjectId = map.get("PROJECT_ID");
                    String newItemCode = map.get("ITEM_CODE");

                    String updateSql =
                            "UPDATE T_PROJECT_SAP_LOG_DETAIL A " +
                                    "   SET A.ITEM_CODE = ? " +
                                    " WHERE 1 = 1 " +
                                    "   AND A.PROJECT_ID = ? " +
                                    "   AND A.ITEM_CODE = ? " +
                                    "   AND A.SFLAG <> 'Y' " +
                                    "   AND A.INTF_TYPE = '5' " +
                                    "   AND A.MESSAGE LIKE '%库存不足%' ";
                    modelService.execSql(updateSql, new Object[]{newItemCode,newProjectId,oldItemCode});
                }
            }catch (Exception e){
                hbtran.rollback();
            }
            hbtran.commit();
        }
    }
}
