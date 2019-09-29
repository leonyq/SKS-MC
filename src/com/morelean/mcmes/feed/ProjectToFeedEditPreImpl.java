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
        String feedDetailSql = " SELECT B.ITEM_CODE,  " +
                "       B.STOCK_CODE    AS ITEM_STOCK,  " +
                "       B.RAW_LOTNUMBER AS ITEM_LOT,  " +
                "       B.ITEM_NUM,  " +
                "       B.ITEM_UNIT,  " +
                "       B.FEED_NUM,  " +
                "       B.PROCESS_ORDER AS ITEM_SEQ,  " +
                "       D.CI_ITEM_NAME  AS ITEM_NAME,  " +
                "       B.WORK_SPACE,  " +
                "       B.WAREHOUSE AS WARE_HOUSE,  " +
                "       C.WORK_SPACE    AS FACTORY_CODE,  " +
                "       C.PRODUCT_LINE  AS WORK_STATION  " +
                "  FROM T_PM_PROJECT_FEED_BASE A  " +
                "  LEFT JOIN T_PM_PROJECT_FEED_DETAIL B  " +
                "    ON A.PROJECT_ID = B.PROJECT_ID  " +
                "  LEFT JOIN T_CO_ITEM D  " +
                "    ON B.ITEM_CODE = D.CI_ITEM_CODE  " +
                "  LEFT JOIN T_PM_PROJECT_DETAIL P  " +
                "    ON P.CBD_ITEM_CODE = B.ITEM_CODE  " +
                "   AND P.PROJECT_ID = A.PROJECT_ID  " +
                "  LEFT JOIN T_PM_PROJECT_BASE C  " +
                "    ON C.PROJECT_ID = A.PROJECT_ID  " +
                " WHERE 1 = 1  " +
                "   AND A.ID = ?   " +
                " ORDER BY TO_NUMBER(B.PROCESS_ORDER) ASC ";
        List<Map<String, Object>> list = modelService.listDataSql(feedDetailSql, new Object[]{dataId});

        Object factoryCodeObj = list.get(0).get("FACTORY_CODE");
        String factoryCode = getString(factoryCodeObj);
        Object workStationObj = list.get(0).get("WORK_STATION");
        String workStation = getString(workStationObj);

        String getThresholdSQL = " SELECT T.ID, T.THRESHOLD_NUM " +
                "  FROM T_CO_THRESHOLD_CONFIGURATION T " +
                " WHERE 1=1 " +
                "   AND T.Threshold_Type='1' " +
                "   AND T.FACTORY_CODE " + factoryCode +
                "   AND T.WORK_STATION_CODE "+workStation +
                "   AND T.ITEM_CODE IS NULL ";
        Map<String, String> map = modelService.queryForMap(getThresholdSQL);

        if (map == null || map.size()==0) {
            String getThresholdSQL2 = " SELECT T.ID, T.THRESHOLD_NUM " +
                    "  FROM T_CO_THRESHOLD_CONFIGURATION T " +
                    " WHERE 1=1 " +
                    "   AND T.Threshold_Type='1' " +
                    "   AND T.FACTORY_CODE " + factoryCode +
                    "   AND T.WORK_STATION_CODE IS NULL " +
                    "   AND T.ITEM_CODE IS NULL ";
            map = modelService.queryForMap(getThresholdSQL2);
        }

        //得到量级里的阀值
        String thresholdID = "";
        if(map!=null && !map.isEmpty()){
            //得到量级表里的阀值ID
            thresholdID = map.get("ID");
        }

        //如果物料有设置阀值,则使用物料的,无则使用上级的;
        for (int i=0; i<list.size(); i++) {
            Map<String, Object> map1 = list.get(i);
            Object itemCodeObj = map1.get("ITEM_CODE");
            if(itemCodeObj!=null && !itemCodeObj.toString().isEmpty()){
                String itemCode = itemCodeObj.toString();
                Object itemFactoryCodeObj = map1.get("WORK_SPACE");
                String itemFactoryCode = getString(itemFactoryCodeObj);
                Object itemNumObj = map1.get("ITEM_NUM");
                Double planNum = null;
                if(itemNumObj!=null && !itemNumObj.toString().isEmpty()){
                    planNum = Double.parseDouble(itemNumObj.toString());
                }
                getThresholdSQL = " SELECT T.ID, T.THRESHOLD_NUM " +
                        "  FROM T_CO_THRESHOLD_CONFIGURATION T " +
                        " WHERE 1=1 " +
                        "   AND T.Threshold_Type='1' " +
                        "   AND T.FACTORY_CODE " + itemFactoryCode +
                        "   AND T.WORK_STATION_CODE "+workStation +
                        "   AND T.ITEM_CODE = '"+itemCode+"' ";
                Map<String, String> map2 = modelService.queryForMap(getThresholdSQL);
                if(map2!=null && !map2.isEmpty()){
                    String itemThresholdNum = getQuantity(modelService, map2.get("ID"), planNum);
                    if(itemThresholdNum!=null && !itemThresholdNum.isEmpty()){
                        list.get(i).put("THRESHOLD_NUM", itemThresholdNum);
                    }else{
                        list.get(i).put("THRESHOLD_NUM", map2.get("THRESHOLD_NUM"));
                    }
                }else{
                    String thresholdNum = getQuantity(modelService, thresholdID, planNum);
                    if(thresholdNum.isEmpty()){
                        list.get(i).put("THRESHOLD_NUM", map.get("THRESHOLD_NUM"));
                    }else{
                        list.get(i).put("THRESHOLD_NUM", thresholdNum);
                    }
                }
            }else{
                list.remove(i);
            }
        }

        if (list.size() > 0) {
            CommMethod.listToEscapeJs(list);
            modelAction.setDataList(list);
            modelAction.setAjaxList(list);
        }

        return modelAction.ActionForwardExeid(modelAction.getExeid());
    }

    private String getString(Object object) {
        return object != null && !object.toString().isEmpty() ?
                "= '" + object.toString() + "'" : "IS NULL";
    }

    private String getQuantity(ModelService modelService, String thresholdId, Double planInNum) {
        String thresholdNum = "";
        String quantityLevelThresholdSQL = " SELECT T.THRESHOLD_NUM  " +
                "  FROM T_CO_QUANTITY_LEVEL T  " +
                " WHERE 1 = 1  " +
                "   AND T.THRESHOLD_ID = ? " +
                "   AND T.LEVEL_LOW <= ?  " +
                "   AND T.LEVEL_HIGHT > ? ";
        Map<String, Object> map0 = modelService.queryForMap(quantityLevelThresholdSQL,
                new Object[]{thresholdId, planInNum, planInNum});
        if(map0!=null && !map0.isEmpty()){
            thresholdNum = map0.get("THRESHOLD_NUM").toString();
        }
        return thresholdNum;
    }
}
