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
public class GetStockByCodeImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();
        String itemCode = request.getParameter("ITEM_CODE");
        String projectId = request.getParameter("PROJECT_ID");

        /*-- version:2019/7/18 15:38 | desc:投料标准配方 --*/
        String feedDetailSql =
                "SELECT A.CI_ITEM_CODE AS ITEM_CODE, " +
                "       B.CBD_ITEM_NUM AS ITEM_NUM, " +
                "       A.CI_ITEM_NAME AS ITEM_NAME, " +
                "       CASE WHEN C.WORK_SPACE IS NOT NULL THEN C.WORK_SPACE " +
                "       ELSE D.WORK_SPACE END AS WORK_SPACE, " +
                "       CASE WHEN C.WARE_HOUSE IS NOT NULL THEN C.WARE_HOUSE " +
                "       ELSE D.WARE_HOUSE END AS WARE_HOUSE " +
                "  FROM T_CO_ITEM A " +
                "  LEFT JOIN T_CO_BOM_DETAIL B " +
                "    ON A.CI_ITEM_CODE = B.CBD_ITEM_CODE " +
                "  LEFT JOIN T_PM_PROJECT_DETAIL C " +
                "    ON C.CBD_ITEM_CODE = A.CI_ITEM_CODE " +
                "  LEFT JOIN T_PM_PROJECT_BASE D ON 1=1 " +
                " WHERE 1 = 1 " +
                "   AND D.PROJECT_ID = ? " +
                "   AND A.ITEM_CODE = ? " +
                "   AND ROWNUM = 1";
        List list = modelService.listDataSql(feedDetailSql, new Object[]{itemCode,projectId});
        if (list.size() > 0) {
            CommMethod.listToEscapeJs(list);
            modelAction.setAjaxList(list);
        }
        return BaseActionSupport.AJAX;
    }

}
