package com.more.sap.intf.job;

import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;

public class UpdateProjectWorkSpaceDef implements IJobx {
    private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

    @Override
    public void exec(Args args) throws Exception {
        /**
         * 1.查询需要修改的记录
         */
        String update1 = "UPDATE T_PM_PROJECT_BASE A " +
                "SET    A.WORK_SPACE = '1101' " +
                "WHERE 1=1 " +
                "AND A.PROJECT_SORT = 1 " +
                "AND A.WORK_SPACE IS NULL ";

        String update2 = "UPDATE T_PM_PROJECT_BASE A " +
                "SET    A.WORK_SPACE = '1100' " +
                "WHERE 1=1 " +
                "AND A.PROJECT_SORT = 2 " +
                "AND A.WORK_SPACE IS NULL ";

        MsHTranMan hbtran1 = BussService.getHbTran();// 定义事务对象

        try {
            modelService.execSql(update1, new Object[]{});
            hbtran1.commit();
        } catch (Exception e) {
            hbtran1.rollback();
        }

        MsHTranMan hbtran2 = BussService.getHbTran();// 定义事务对象

        try {
            modelService.execSql(update2, new Object[]{});
            hbtran2.commit();
        } catch (Exception e) {
            hbtran2.rollback();
        }
    }
}
