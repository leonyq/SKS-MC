package com.more.sap.intf.job;

import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;

public class SyncProjectPost implements IJobx {
    private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

    @Override
    public void exec(Args args) throws Exception {
        String update = " UPDATE T_PM_PROJECT_POST A " +
                " SET A.ITEM_NUM = " +
                " (SELECT B.RECEIVE_COUNT " +
                "FROM T_PM_PROJECT_FEED_BASE B " +
                " WHERE 1 = 1 " +
                " AND A.PROJECT_ID = B.PROJECT_ID " +
                " AND (A.ITEM_NUM <> B.RECEIVE_COUNT OR A.ITEM_NUM IS NULL)) " +
                " WHERE 1 = 1 " +
                " AND A.PROJECT_SORT = '1' " +
                " AND (A.ITEM_NUM IS NULL OR A.ITEM_NUM <> (SELECT B.RECEIVE_COUNT FROM T_PM_PROJECT_FEED_BASE B WHERE 1 = 1 AND A.PROJECT_ID = B.PROJECT_ID)) ";
        modelService.execSql(update);

        String updatePack = "UPDATE T_PM_PROJECT_POST A " +
                " SET A.ITEM_NUM = (SELECT B.FINISH_COUNT FROM T_PM_PROJECT_BASE B WHERE 1=1 AND A.PROJECT_ID = B.PROJECT_ID AND (A.ITEM_NUM IS NULL OR A.ITEM_NUM <> B.FINISH_COUNT)) " +
                " WHERE 1=1 " +
                " AND A.PROJECT_SORT = '2' " +
                " AND (A.ITEM_NUM IS NULL OR A.ITEM_NUM <> (SELECT B.FINISH_COUNT FROM T_PM_PROJECT_BASE B WHERE 1=1 AND A.PROJECT_ID = B.PROJECT_ID)) ";
        modelService.execSql(updatePack);
    }
}
