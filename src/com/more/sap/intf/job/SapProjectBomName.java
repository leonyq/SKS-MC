package com.more.sap.intf.job;

import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;

public class SapProjectBomName implements IJobx{
    private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

    @Override
    public void exec(Args args) throws Exception {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(" UPDATE T_PM_PROJECT_BASE A ");
        stringBuilder.append(" SET A.PRODUCT_NAME = (SELECT B.CI_ITEM_NAME FROM T_CO_ITEM B WHERE A.PRODUCT_MATERIAL = B.CI_ITEM_CODE AND ROWNUM = 1) ");
        stringBuilder.append(" WHERE 1=1 ");
        stringBuilder.append(" AND (A.PRODUCT_NAME <> (SELECT B.CI_ITEM_NAME FROM T_CO_ITEM B WHERE A.PRODUCT_MATERIAL = B.CI_ITEM_CODE AND ROWNUM = 1) OR A.PRODUCT_NAME IS NULL ) ");
        stringBuilder.append(" AND A.PRODUCT_MATERIAL IN (SELECT B.CI_ITEM_CODE FROM T_CO_ITEM B WHERE 1=1)");
        String sql = stringBuilder.toString();
        modelService.execSql(sql);
    }
}
