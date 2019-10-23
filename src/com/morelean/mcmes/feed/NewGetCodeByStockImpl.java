package com.morelean.mcmes.feed;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 新增生产投料-根据存货代码获取物料信息
 * @author:phantomsaber
 * @version:2019/7/19 13:59
 * @email:phantomsaber@foxmail.com
 **/
public class NewGetCodeByStockImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();
        String stockCode = request.getParameter("STOCK_CODE");
        String projectId = request.getParameter("PROJECT_ID");

        /*-- version:2019/7/18 15:38 | desc:投料标准配方 --*/
       /* String feedDetailSql =
                "SELECT A.CI_ITEM_CODE AS ITEM_CODE,B.CBD_ITEM_NUM AS ITEM_NUM,A.CI_ITEM_NAME AS ITEM_NAME,C.WORK_SPACE,C.WARE_HOUSE FROM T_CO_ITEM A " +
                        " LEFT JOIN T_CO_BOM_DETAIL B ON A.CI_ITEM_CODE = B.CBD_ITEM_CODE " +
                        " LEFT JOIN T_PM_PROJECT_DETAIL C ON c.cbd_item_code = A.CI_ITEM_CODE " +
                        "WHERE 1=1 " +
                        "AND A.STOCK_CODE = ? " +
                        "AND ROWNUM = 1";*/
        String feedDetailSql =
                "SELECT A.CI_ITEM_CODE AS ITEM_CODE, " +
                "       B.CBD_ITEM_NUM AS ITEM_NUM, " +
                "       A.CI_ITEM_NAME AS ITEM_NAME, " +
                "       A.SAP_BASE_UNIT AS ITEM_UNIT, " +
                "       CASE " +
                "         WHEN C.WORK_SPACE IS NOT NULL THEN " +
                "          C.WORK_SPACE " +
                "         ELSE " +
                "          D.WORK_SPACE " +
                "       END AS WORK_SPACE, " +
                "       CASE " +
                "         WHEN D.DATA_AUTH = '9e33fa093ca74f229a997f0cf3734a9c' THEN " +
                "          '3109' " +
                "         WHEN D.DATA_AUTH = '7f60fed22c004015a9a4f1ab2fc59194' THEN " +
                "          '3107' " +
                "         ELSE " +
                "          D.WARE_HOUSE " +
                "       END AS WARE_HOUSE " +
                "  FROM T_CO_ITEM A " +
                "  LEFT JOIN T_CO_BOM_DETAIL B " +
                "    ON A.CI_ITEM_CODE = B.CBD_ITEM_CODE " +
                "  LEFT JOIN T_PM_PROJECT_DETAIL C " +
                "    ON C.CBD_ITEM_CODE = A.CI_ITEM_CODE " +
                "  LEFT JOIN T_PM_PROJECT_BASE D " +
                "    ON 1 = 1 " +
                " WHERE 1 = 1 " +
                " AND A.STOCK_CODE = ? " +
                " AND D.PROJECT_ID = ? " +
                " AND ROWNUM = 1 ";
        List list = modelService.listDataSql(feedDetailSql, new Object[]{stockCode,projectId});
        if (list.size() > 0) {
            CommMethod.listToEscapeJs(list);
            modelAction.setAjaxList(list);
        }
        return BaseActionSupport.AJAX;
    }

}
