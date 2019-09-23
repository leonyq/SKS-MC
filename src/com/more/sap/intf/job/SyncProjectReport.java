package com.more.sap.intf.job;

import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;

public class SyncProjectReport implements IJobx {
    private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

    @Override
    public void exec(Args args) throws Exception {
        String update = " UPDATE T_PM_PROJECT_REPORT A " +
                " SET A.SFLAG = '0' " +
                " WHERE 1=1 " +
                " AND A.SFLAG = 'DIS'";
        modelService.execSql(update);

        String sql = "UPDATE T_PM_PROJECT_REPORT A\n" +
                "   SET A.SFLAG   = '0',\n" +
                "       A.REP_NUM =\n" +
                "       (SELECT B.ITEM_NUM\n" +
                "          FROM T_PM_PROJECT_POST B\n" +
                "         WHERE 1 = 1\n" +
                "           AND A.PROJECT_ID = B.PROJECT_ID\n" +
                "           AND B.ITEM_NUM IS NOT NULL\n" +
                "           AND B.ITEM_NUM > 0)\n" +
                " WHERE 1 = 1\n" +
                "   AND (A.SFLAG <> 'Y' OR A.SFLAG IS NULL)\n" +
                "   AND (A.REP_NUM <> (SELECT B.ITEM_NUM\n" +
                "                        FROM T_PM_PROJECT_POST B\n" +
                "                       WHERE 1 = 1\n" +
                "                         AND A.PROJECT_ID = B.PROJECT_ID\n" +
                "                         AND B.ITEM_NUM IS NOT NULL\n" +
                "                         AND B.ITEM_NUM > 0) OR A.REP_NUM IS NULL)";
        modelService.execSql(sql);

        String packSql = "UPDATE T_PM_PROJECT_REPORT A\n" +
                "   SET A.SFLAG = 'DIS'\n" +
                " WHERE 1 = 1\n" +
                "   AND (A.SFLAG <> 'Y' OR A.SFLAG IS NULL)\n" +
                "   AND (A.PROJECT_ID NOT IN\n" +
                "       (SELECT B.PROJECT_ID FROM T_PM_PROJECT_POST B WHERE 1 = 1) OR\n" +
                "       A.PROJECT_ID IN\n" +
                "       (SELECT B.PROJECT_ID\n" +
                "           FROM T_PM_PROJECT_POST B\n" +
                "          WHERE 1 = 1\n" +
                "            AND A.PROJECT_ID = B.PROJECT_ID\n" +
                "            AND (B.ITEM_NUM IS NULL OR B.ITEM_NUM = 0)))\n" +
                "AND A.SFLAG <> 'DIS'";
        modelService.execSql(packSql);
    }
}
