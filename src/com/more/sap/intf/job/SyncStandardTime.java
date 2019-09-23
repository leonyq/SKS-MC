package com.more.sap.intf.job;

import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;

public class SyncStandardTime implements IJobx {
    private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

    @Override
    public void exec(Args args) throws Exception {
        String sql =
                " UPDATE T_PM_PROJECT_REPORT A SET " +
                " A.PREPARE_TIME = ROUND(A.PREPARE_TIME*(A.REP_NUM/A.BASE_NUM),3), " +
                " A.MACHINE_TIME = ROUND(A.MACHINE_TIME*(A.REP_NUM/A.BASE_NUM),3), " +
                " A.PEOPLE_TIME = ROUND(A.PEOPLE_TIME*(A.REP_NUM/A.BASE_NUM),3), " +
                " A.EDIT_TIME = SYSDATE, " +
                " A.EDIT_USER = NULL " +
                " WHERE  1=1 " +
                " AND A.REP_NUM IS NOT NULL " +
                " AND A.EDIT_TIME IS NULL " +
                " AND A.SFLAG <> 'N' " +
                " AND (A.SFLAG IS NULL OR A.SFLAG <> 'Y') ";
            modelService.execSql(sql);
    }
}
