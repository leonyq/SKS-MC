package com.morelean.mcmes.pack;

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
 * 修改包装-视图前执行类
 * @author:phantomsaber
 * @version:2019/7/18 14:09
 * @email:phantomsaber@foxmail.com
 **/
public class packToFeedEditPreImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();
        String dataId = modelAction.getDataId();

        /*-- version:2019/7/18 15:38 | desc:投料标准配方 --*/
       /* String feedDetailSql =
                "SELECT B.ITEM_CODE, " +
                        "B.STOCK_CODE    AS ITEM_STOCK, " +
                        "B.RAW_LOTNUMBER AS ITEM_LOT, " +
                        "B.ITEM_NUM,B.ITEM_NUM,B.FEED_NUM, " +
                        "B.PROCESS_ORDER AS ITEM_SEQ, " +
                        "THRESHOLD_NUM, " +
                        "D.CI_ITEM_NAME AS ITEM_NAME ,P.WORK_SPACE,C.WARE_HOUSE " +
                        "FROM T_PM_PROJECT_FEED_BASE A " +
                        "LEFT JOIN T_PM_PROJECT_FEED_DETAIL B " +
                        "ON A.PROJECT_ID = B.PROJECT_ID " +
                        "LEFT JOIN T_PM_PROJECT_BASE C " +
                        "ON C.PROJECT_ID = A.PROJECT_ID " +
                        "LEFT JOIN T_CO_ITEM D ON B.ITEM_CODE=D.CI_ITEM_CODE " +
                        "LEFT JOIN T_CO_THRESHOLD_CONFIG E " +
                        "ON B.ITEM_CODE = E.RELATED_CODE " +
                        "LEFT JOIN T_PM_PROJECT_DETAIL P " +
                        "ON P.CBD_ITEM_CODE = D.CI_ITEM_CODE " +
                        "AND E.FACTORY_ID = C.DEPT_ID " +
                        "AND E.WORK_STATION = C.PRODUCT_LINE " +
                        "WHERE 1 = 1" +
                "AND A.ID = ? order by B.PROCESS_ORDER";*/
      String sql = "SELECT T.ITEM_CODE,T.ITEM_NUM,T.ITEM_MANE,T.ITEM_SPEC ,T.PACK_NUM,T.WORK_SPACE,T.WARE_HOUSE from T_PROJECT_PACK_FEED T  WHERE 1=1 AND T.PROJECT_ID = (select b.project_Id from t_pm_project_base b where 1=1 and b.id=?)";
        List list = modelService.listDataSql(sql, new Object[]{dataId});

        if (list.size() > 0) {
            CommMethod.listToEscapeJs(list);
            modelAction.setDataList(list);
            modelAction.setAjaxList(list);
        }

        return modelAction.ActionForwardExeid(modelAction.getExeid());
    }

}
