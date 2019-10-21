package com.more.sap.intf.job;

import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;

public class AddProjectPost implements IJobx {
    private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

    @Override
    public void exec(Args args) throws Exception {
        String sql = "INSERT INTO T_PM_PROJECT_POST " +
                "SELECT F_C_GETNEWID_VOID, " +
                " A.DEPT_ID, " +
                " A.CREATE_USER, " +
                " A.CREATE_TIME, " +
                " A.EDIT_USER, " +
                " A.EDIT_TIME, " +
                " A.DATA_AUTH, " +
                " A.PRODUCT_MATERIAL, " +
                " A.PROJECT_ID, " +
                " A.WORK_SPACE, " +
                " A.PRODUCT_MATERIAL AS ITEM_CODE, " +
                " B.RECEIVE_COUNT AS ITEM_NUM, " +
                " A.BASE_UNIT, " +
                " A.LOT_NUMBER, " +
                " A.WARE_HOUSE, " +
                " '1' AS REVERSE, " +
                " '0' AS SFLAG, " +
                " '' AS MESSAGE, " +
                " A.PROJECT_SORT " +
                " FROM T_PM_PROJECT_BASE A " +
                " INNER JOIN T_PM_PROJECT_FEED_BASE B ON B.PROJECT_ID = A.PROJECT_ID " +
                " WHERE 1=1 " +
                " AND A.PROJECT_SORT = '1' " +
                " AND A.PROJECT_ID NOT IN (SELECT C.PROJECT_ID FROM T_PM_PROJECT_POST C WHERE 1=1) ";
        modelService.execSql(sql);

        String packSql = "INSERT INTO T_PM_PROJECT_POST " +
                " SELECT F_C_GETNEWID_VOID, " +
                " A.DEPT_ID, " +
                " A.CREATE_USER, " +
                " A.CREATE_TIME, " +
                " A.EDIT_USER, " +
                " A.EDIT_TIME, " +
                " A.DATA_AUTH, " +
                " A.PRODUCT_MATERIAL, " +
                " A.PROJECT_ID, " +
                " A.WORK_SPACE, " +
                " A.PRODUCT_MATERIAL AS ITEM_CODE, " +
                " A.FINISH_COUNT AS ITEM_NUM, " +
                " A.BASE_UNIT, " +
                " A.LOT_NUMBER, " +
                " A.WARE_HOUSE, " +
                " '1' AS REVERSE, " +
                " '0' AS SFLAG, " +
                " '' AS MESSAGE, " +
                " A.PROJECT_SORT " +
                "FROM T_PM_PROJECT_BASE A " +
                " WHERE 1 = 1 " +
                " AND A.PROJECT_SORT = '2' " +
                " AND A.PROJECT_ID NOT IN (SELECT C.PROJECT_ID FROM T_PM_PROJECT_POST C WHERE 1 = 1) " +
                " AND A.PROJECT_ID IN (SELECT B.PROJECT_ID FROM T_PROJECT_PACK_FEED B WHERE 1=1 ) ";
        modelService.execSql(packSql);

        String update = " UPDATE T_PM_PROJECT_POST A " +
                " SET A.ITEM_NUM = " +
                " (SELECT B.RECEIVE_COUNT " +
                "FROM T_PM_PROJECT_FEED_BASE B " +
                " WHERE 1 = 1 " +
                " AND A.PROJECT_ID = B.PROJECT_ID " +
                " AND (A.ITEM_NUM <> B.RECEIVE_COUNT OR A.ITEM_NUM IS NULL)) " +
                " WHERE 1 = 1 " +
                " AND A.PROJECT_SORT = '1' " +
                " AND (A.ITEM_NUM IS NULL OR A.ITEM_NUM <> (SELECT B.RECEIVE_COUNT FROM T_PM_PROJECT_FEED_BASE B WHERE 1 = 1 AND A.PROJECT_ID = B.PROJECT_ID AND ROWNUM = 1 )) ";
        modelService.execSql(update);

        String updatePack = "UPDATE T_PM_PROJECT_POST A " +
                " SET A.ITEM_NUM = (SELECT B.FINISH_COUNT FROM T_PM_PROJECT_BASE B WHERE 1=1 AND A.PROJECT_ID = B.PROJECT_ID AND (A.ITEM_NUM IS NULL OR A.ITEM_NUM <> B.FINISH_COUNT)) " +
                " WHERE 1=1 " +
                " AND A.PROJECT_SORT = '2' " +
                " AND (A.ITEM_NUM IS NULL OR A.ITEM_NUM <> (SELECT B.FINISH_COUNT FROM T_PM_PROJECT_BASE B WHERE 1=1 AND A.PROJECT_ID = B.PROJECT_ID)) ";
        modelService.execSql(updatePack);

        String updateSflagNull = " UPDATE T_PM_PROJECT_POST A SET A.SFLAG = '0' WHERE 1=1 AND A.SFLAG IS NULL ";
        modelService.execSql(updateSflagNull);

    }
}
