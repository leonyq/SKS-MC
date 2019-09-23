package com.morelean.mcmes.feed;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 修改生产投料-视图前执行类
 * @author:phantomsaber
 * @version:2019/7/18 14:09
 * @email:phantomsaber@foxmail.com
 **/
public class ProjectToFeedEditPreImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();
        String dataId = modelAction.getDataId();

        /*-- version:2019/7/18 15:38 | desc:投料标准配方 --*/
        String feedDetailSql =
                "SELECT B.ITEM_CODE, " +
                        "B.STOCK_CODE    AS ITEM_STOCK, " +
                        "B.RAW_LOTNUMBER AS ITEM_LOT, " +
                        "B.ITEM_NUM,B.ITEM_NUM,B.FEED_NUM, " +
                        "B.PROCESS_ORDER AS ITEM_SEQ, " +
                        "NVL(E.THRESHOLD_NUM, 0) AS THRESHOLD_NUM, " +
                        "D.CI_ITEM_NAME AS ITEM_NAME " +
                        "FROM T_PM_PROJECT_FEED_BASE A " +
                        "LEFT JOIN T_PM_PROJECT_FEED_DETAIL B " +
                        "ON A.PROJECT_ID = B.PROJECT_ID " +
                        "LEFT JOIN T_PM_PROJECT_BASE C " +
                        "ON C.PROJECT_ID = A.PROJECT_ID " +
                        "LEFT JOIN T_CO_ITEM D ON B.ITEM_CODE=D.CI_ITEM_CODE " +
                        "LEFT JOIN T_CO_THRESHOLD_CONFIG E " +
                        "ON B.ITEM_CODE = E.RELATED_CODE " +
                        "AND E.FACTORY_ID = C.DEPT_ID " +
                        "AND E.WORK_STATION = C.PRODUCT_LINE " +
                        "WHERE 1 = 1" +
                "AND A.ID = ? ";
        List list = modelService.listDataSql(feedDetailSql, new Object[]{dataId});

        if (list.size() > 0) {
            CommMethod.listToEscapeJs(list);
            modelAction.setDataList(list);
            modelAction.setAjaxList(list);
        }

        return modelAction.ActionForwardExeid(modelAction.getExeid());
    }

}
