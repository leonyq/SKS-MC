package com.morelean.mcmes.check;

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
 * 提审质检-视图前执行类
 * @author:
 * @version:2019/7/20 00:09
 **/
public class ProjectToCheckedNewPreImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();
        String dataId = modelAction.getDataId();

        /*-- version:2019/7/18 15:38 | desc:投料标准配方 --*/
        String feedDetailSql =
            " SELECT  T5.LOT_NUMBER AS LOT_NUMBER,T5.PRODUCT_COUNT  AS PRODUCT_COUNT,T3.FEED_COUNT   AS FEED_COUNT,T4.FEED_NUM   AS FEED_NUM ,b.product_name   AS RAW_LICENSE ,T5.PM_MEMO  AS PM_MEMO FROM T_PM_PROJECT_BASE b LEFT JOIN (SELECT A.PROJECT_ID,SUM(A.FEED_NUM) AS FEED_COUNT FROM T_PM_PROJECT_FEED_DETAIL A WHERE 1=1 GROUP BY A.PROJECT_ID) T3 ON T3.PROJECT_ID = b.PROJECT_ID LEFT JOIN (SELECT A.PROJECT_ID,COUNT(1) AS FEED_NUM FROM T_PM_PROJECT_FEED_DETAIL A WHERE 1=1 GROUP BY A.PROJECT_ID) T4 ON T4.PROJECT_ID =b.PROJECT_ID LEFT JOIN T_PM_PROJECT_BASE T5 ON T5.PROJECT_ID = b.PROJECT_ID WHERE 1=1 AND b.ID = ?";
     
       List list = modelService.listDataSql(feedDetailSql, new Object[]{dataId});
       int countSql = modelService.countSql(feedDetailSql, new Object[]{dataId});
        /*-- version:2019/7/18 15:39 | desc:基础信息 --*/
        String sql = "SELECT A.PROJECT_ID,A.LOT_NUMBER,A.PROJECT_SORT,A.CHECK_MON FROM T_PM_PROJECT_BASE A WHERE 1=1 AND A.ID = ? ";
        Map<String, String> map = modelService.queryForMap(sql, new Object[]{dataId});

        String curUserName = modelAction.getCurrUser().getName();
        map.put("CHECK_USER", curUserName);
        map.put("COUNT", StringUtils.toString(countSql));

        if(map.size() > 0){
            CommMethod.mapToEscapeJs(map);
            modelAction.setDataMap(map);
        }

        if (list.size() > 0) {
            CommMethod.listToEscapeJs(list);
            modelAction.setDataList(list);
            modelAction.setAjaxList(list);
        }

        return modelAction.ActionForwardExeid(modelAction.getExeid()); 
    }

}
