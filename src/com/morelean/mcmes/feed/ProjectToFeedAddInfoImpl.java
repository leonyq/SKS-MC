package com.morelean.mcmes.feed;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 新增生产投料-视图前执行类
 *
 * @author:phantomsaber
 * @version:2019/7/18 14:09
 * @email:phantomsaber@foxmail.com
 **/
public class ProjectToFeedAddInfoImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();
        String projectId = request.getParameter("projectId");
        String reg = "ok";
        //验证工单是否到达投料流程
        String checkSql = "SELECT * FROM  T_PM_PROJECT_BASE T  WHERE 1=1 AND T.PROJECT_STATUS='3' AND T.PROJECT_SORT='1' AND  T.PROJECT_ID=? ";
        List clist = modelService.listDataSql(checkSql, new Object[]{projectId});
//        if(clist.size() <= 0){
//            reg = "ng";
//            modelAction.setAjaxString(reg);
//            return modelAction.AJAX;
//        }
        //验证工单是否到达投料流程
        if (clist.size() <= 0) {
            // 校验是否存在工单号
            String countProjectSql = "SELECT * FROM T_PM_PROJECT_BASE A WHERE 1=1 AND A.PROJECT_ID = ? ";
            int count = modelService.countSql(countProjectSql, new Object[]{projectId});
            if (count > 0) {
                String dataAuth = modelAction.getCurrUser().getData_auth();

                String mesUserIdSql = "SELECT A.ID FROM SY_USER A WHERE 1=1 AND A.LOGIN_NAME = 'SMES' ";
                Map map = modelService.queryForMap(mesUserIdSql, new Object[]{});
                String mesUserId = map.get("ID").toString();
                String userId = "";
                if (StringUtils.isEmpty(mesUserId)) {
                    userId = modelAction.getUser().getId();
                }else{
                    userId = mesUserId;
                }

                // 判断是否存在关联关系
                String checkRelSql = "SELECT * FROM T_PM_PROJECT_REL A WHERE 1=1 AND (A.PROJECT_ID = ? OR A.REL_PROJECT_ID = ? )";
                int countRel = modelService.countSql(checkRelSql, new Object[]{projectId, projectId});

                String prepareRes = "";
                String relRes = "";

                if (countRel < 1) {
                    relRes = doRel(modelService, dataAuth, projectId, userId);
                    if (!"OK".equals(relRes)) {
                        modelAction.setAjaxString(projectId + "工单关联失败," + relRes);
                        return BaseActionSupport.AJAX;
                    }
                }

                String getPackSql = "SELECT A.PROJECT_ID FROM T_PM_PROJECT_REL A WHERE 1=1 AND A.REL_PROJECT_ID = ? ";
                Map packMap = modelService.queryForMap(getPackSql, new Object[]{projectId});
                String packId = packMap.get("PROJECT_ID").toString();

                prepareRes = doPrepare(modelService, dataAuth, packId, userId);
                if (!"OK".equals(prepareRes)) {
                    modelAction.setAjaxString(projectId + "生产备料失败," + prepareRes);
                    return BaseActionSupport.AJAX;
                }
            } else {
                reg = "ng";
                modelAction.setAjaxString(reg);
                return BaseActionSupport.AJAX;
            }
        }
        //判断工单是否已包装
        String checksql1 = "SELECT * FROM  T_PROJECT_PACK_FEED T  WHERE 1=1 AND  T.PROJECT_ID=?";
        clist = modelService.listDataSql(checksql1, new Object[]{projectId});

        if (clist.size() > 0) {
            reg = "ng1";
            modelAction.setAjaxString(reg);
            return BaseActionSupport.AJAX;
        }
        modelAction.setAjaxString(reg);
        /*-- version:2019/7/18 15:38 | desc:投料标准配方 --*/

        String feedDetailSql =
                " SELECT D.CI_ITEM_CODE  AS ITEM_CODE, " +
                "       D.STOCK_CODE    AS ITEM_STOCK, " +
                "       D.RAW_LOTNUMBER AS ITEM_LOT, " +
                "       C.CBD_ITEM_NUM  AS ITEM_NUM, " +
                "       C.CBD_UNITS    AS ITEM_UNIT," +
                "       D.CI_ITEM_NAME AS ITEM_NAME ," +
                "       F.FEED_NUM," +
                "       C.WORKCENTER_NO   AS ITEM_ORDER, " +
                "       C.WORK_SPACE,C.WARE_HOUSE, " +
                "       A.WORK_SPACE    AS FACTORY_CODE, " +
                "       A.PRODUCT_LINE  AS WORK_STATION " +
                "  FROM T_PM_PROJECT_BASE A " +
                " LEFT JOIN T_PM_PROJECT_DETAIL C ON C.PROJECT_ID = A.PROJECT_ID " +
                " LEFT JOIN T_PM_PROJECT_FEED_DETAIL F ON F.PROJECT_ID = A.PROJECT_ID AND F.ITEM_CODE = C.CBD_ITEM_CODE" +
                "  LEFT JOIN T_CO_ITEM D " +
                "    ON C.CBD_ITEM_CODE = D.CI_ITEM_CODE " +
                " WHERE 1 = 1 " +
                "   AND A.project_id  = ? order by TO_NUMBER(C.WORKCENTER_NO) ASC ";
        List<Map<String, Object>> list = modelService.listDataSql(feedDetailSql, new Object[]{projectId});

        /*-- version:2019/7/18 15:39 | desc:基础信息 --*/
        String sql = "SELECT A.PROJECT_ID,A.LOT_NUMBER,A.PM_MEMO,A.PRODUCT_COUNT,B.FEED_NUM,C.RECEIVE_COUNT,A.PRODUCT_NAME,A.PRODUCT_MATERIAL,C.VAT_NO,C.RAW_LICENSE, D.FEED_NUM FROM T_PM_PROJECT_BASE A " +
                " LEFT JOIN T_PM_PROJECT_FEED_DETAIL B ON B.PROJECT_ID=A.PROJECT_ID " +
                " LEFT JOIN T_PM_PROJECT_FEED_BASE C ON C.PROJECT_ID=A.PROJECT_ID " +
                " LEFT JOIN (SELECT A.PROJECT_ID,COUNT(1) AS FEED_NUM FROM T_PM_PROJECT_FEED_DETAIL A WHERE 1=1 GROUP BY A.PROJECT_ID) D ON D.PROJECT_ID = A.PROJECT_ID WHERE 1=1 AND A.project_id = ? ";
        Map<String, String> map11 = modelService.queryForMap(sql, new Object[]{projectId});

        String curUserName = modelAction.getCurrUser().getName();
        map11.put("CUR_USER", curUserName);
        //  map.put("COUNT", StringUtils.toString(countSql));

        if (map11.size() > 0) {
            CommMethod.mapToEscapeJs(map11);
            // modelAction.setDataMap(map);
            modelAction.setAjaxMap(map11);
        }

        if (list.size() > 0) {
            CommMethod.listToEscapeJs(list);
            // modelAction.setDataList(list);
            modelAction.setAjaxList(list);
        }

        /*
         * 阀值信息
         * */
        Object factoryCodeObj = list.get(0).get("FACTORY_CODE");
        String factoryCode = getString(factoryCodeObj);
        Object workStationObj = list.get(0).get("WORK_STATION");
        String workStation = getString(workStationObj);

        String getThresholdSQL = " SELECT T.ID, T.THRESHOLD_NUM " +
                "  FROM T_CO_THRESHOLD_CONFIGURATION T " +
                " WHERE 1=1 " +
                "   AND T.Threshold_Type='1' " +
                "   AND T.FACTORY_CODE " + factoryCode +
                "   AND T.WORK_STATION_CODE " + workStation +
                "   AND T.ITEM_CODE IS NULL ";
        Map<String, String> map = modelService.queryForMap(getThresholdSQL);

        if (map == null || map.size() == 0) {
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
        if (map != null && !map.isEmpty()) {
            //得到量级表里的阀值ID
            thresholdID = map.get("ID");
        }

        //如果物料有设置阀值,则使用物料的,无则使用上级的;
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> map1 = list.get(i);
            Object itemCodeObj = map1.get("ITEM_CODE");
            if (itemCodeObj != null && !itemCodeObj.toString().isEmpty()) {
                String itemCode = itemCodeObj.toString();
                Object itemFactoryCodeObj = map1.get("WORK_SPACE");
                String itemFactoryCode = getString(itemFactoryCodeObj);
                double planNum = Double.parseDouble(map1.get("ITEM_NUM").toString());
                getThresholdSQL = " SELECT T.ID, T.THRESHOLD_NUM " +
                        "  FROM T_CO_THRESHOLD_CONFIGURATION T " +
                        " WHERE 1=1 " +
                        "   AND T.Threshold_Type='1' " +
                        "   AND T.FACTORY_CODE " + itemFactoryCode +
                        "   AND T.WORK_STATION_CODE " + workStation +
                        "   AND T.ITEM_CODE = '" + itemCode + "' ";
                Map<String, String> map2 = modelService.queryForMap(getThresholdSQL);
                if (map2 != null && !map2.isEmpty()) {
                    String itemThresholdNum = getQuantity(modelService, map2.get("ID"), planNum);
                    if (itemThresholdNum != null && !itemThresholdNum.isEmpty()) {
                        list.get(i).put("THRESHOLD_NUM", itemThresholdNum);
                    } else {
                        list.get(i).put("THRESHOLD_NUM", map2.get("THRESHOLD_NUM"));
                    }
                } else {
                    String thresholdNum = getQuantity(modelService, thresholdID, planNum);
                    if (thresholdNum.isEmpty()) {
                        list.get(i).put("THRESHOLD_NUM", map.get("THRESHOLD_NUM"));
                    } else {
                        list.get(i).put("THRESHOLD_NUM", thresholdNum);
                    }
                }
            } else {
                list.remove(i);
            }
        }
        // return modelAction.ActionForwardExeid(modelAction.getExeid());
        return BaseActionSupport.AJAX;
    }

    private String getString(Object object) {
        return object != null && !object.toString().isEmpty() ?
                "= '" + object.toString() + "'" : "IS NULL";
    }

    private String getQuantity(ModelService modelService, String thresholdId, double planInNum) {
        String thresholdNum = "";
        String quantityLevelThresholdSQL = " SELECT T.THRESHOLD_NUM  " +
                "  FROM T_CO_QUANTITY_LEVEL T  " +
                " WHERE 1 = 1  " +
                "   AND T.THRESHOLD_ID = ? " +
                "   AND T.LEVEL_LOW <= ?  " +
                "   AND T.LEVEL_HIGHT > ? ";
        Map<String, Object> map0 = modelService.queryForMap(quantityLevelThresholdSQL,
                new Object[]{thresholdId, planInNum, planInNum});
        if (map0 != null && !map0.isEmpty()) {
            thresholdNum = map0.get("THRESHOLD_NUM").toString();
        }
        return thresholdNum;
    }

    /**
     * 调用工单关联存储过程
     *
     * @param modelService
     * @param dataAuth
     * @param workOrder
     * @param relWorkerOrder
     * @return
     */
    public String callProjectRel(ModelService modelService, String dataAuth, String workOrder, String relWorkerOrder, String userId) {
        ProFuncDto pf = new ProFuncDto();
        int[] inPlace = {1, 2, 3, 4};
        int[] outplace = {5};
        List<Object> list = new ArrayList<>();
        List<Object> outType = new ArrayList<Object>();
        list.add(dataAuth);
        list.add(workOrder);
        list.add(relWorkerOrder);
        list.add(userId);
        outType.add("String");
        pf.setClassName("P_LEO_REL_PROJECT_SN");
        pf.setInPlace(inPlace);
        pf.setOutPlace(outplace);
        pf.setTotalLen(list.size() + outType.size());
        pf.setValArgs(list);
        pf.setOutValType(outType);
        List<Object> relist = modelService.procComm(pf);
        String res = (String) relist.get(0);
        return res;
    }

    /**
     * 工单备料存储过程调用
     *
     * @param modelService
     * @param dataAuth
     * @param relWorkerOrder
     * @param userId
     * @return
     */
    public String callProjectPrepare(ModelService modelService, String dataAuth, String relWorkerOrder, String userId) {
        ProFuncDto pf = new ProFuncDto();
        int[] inPlace = {1, 2, 3};
        int[] outplace = {4};
        List<Object> list = new ArrayList<Object>();
        List<Object> outType = new ArrayList<Object>();
        list.add(dataAuth);
        list.add(relWorkerOrder);
        list.add(userId);
        outType.add("String");
        pf.setClassName("P_C_VOID_PREPARE_PROJECT_SN");
        pf.setInPlace(inPlace);
        pf.setOutPlace(outplace);
        pf.setTotalLen(list.size() + outType.size());
        pf.setValArgs(list);
        pf.setOutValType(outType);
        List<Object> relist = modelService.procComm(pf);
        String res = (String) relist.get(0);
        return res;
    }

    public String doRel(ModelService modelService, String dataAuth, String projectId, String userId) {
        String res = "";
        try {
            res = callProjectRel(modelService, dataAuth, projectId, projectId, userId);
            if (!"OK".equals(res)) {
                res = StringUtils.toString(res.split(":")[1]);
            }
        } catch (Exception e) {
            res = e.getMessage();
        }
        return res;
    }

    public String doPrepare(ModelService modelService, String dataAuth, String projectId, String userId) {
        String res = "";
        try {
            res = callProjectPrepare(modelService, dataAuth, projectId, userId);
            if (!"OK".equals(res)) {
                res = StringUtils.toString(res.split(":")[1]);
            }
        } catch (Exception e) {
            res = e.getMessage();
        }
        return res;
    }
}
