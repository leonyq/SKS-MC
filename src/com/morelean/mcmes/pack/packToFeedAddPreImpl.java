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
import java.util.*;

/**
 * 新增包装-视图前执行类
 * @author:phantomsaber
 * @version:2019/7/18 14:09
 * @email:phantomsaber@foxmail.com
 **/
public class packToFeedAddPreImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();
        String dataId = modelAction.getDataId();
        String sqlColCheck = "SELECT T1.CBD_ITEM_CODE, T3.STOCK_CODE,T3.SAP_COLOR_CODE , T1.WORK_SPACE "
                + "FROM T_PM_PROJECT_DETAIL T1 "
                + "LEFT JOIN T_PM_PROJECT_BASE T2 ON T1.PROJECT_ID = T2.PROJECT_ID  "
                + "LEFT JOIN T_CO_ITEM T3 ON T3.CI_ITEM_CODE = T1.CBD_ITEM_CODE  "
                + "WHERE 1=1 AND T2.id = ?   ";
        List<Map> colList = modelService.listDataSql(sqlColCheck, new Object[]{dataId});
        String sql="";
        List<Map> list = new ArrayList();;
        Map map1 = null;
        for(Map m :colList) {
            Object itemCode =   m.get("CBD_ITEM_CODE");
            Object stockCode =   m.get("STOCK_CODE");
            Object colCode =   m.get("SAP_COLOR_CODE");
            Object workSpace =   m.get("WORK_SPACE");
            String sqlWhConfig = "SELECT * FROM T_SAP_WH_CONFIG T1 WHERE 1=1 AND  T1.WORK_SPACE=? ";
            List<Map> configList = modelService.listDataSql(sqlWhConfig, new Object[]{workSpace});
            if(configList.size() <= 0) {
                sql = "SELECT distinct T1.*,T3.CI_ITEM_NAME,T3.CI_ITEM_SPEC,T1.WORK_SPACE," +
                        " CASE " +
                        "  WHEN T2.DATA_AUTH = '9e33fa093ca74f229a997f0cf3734a9c' THEN " +
                        "   '3109' " +
                        "  WHEN T2.DATA_AUTH = '7f60fed22c004015a9a4f1ab2fc59194' THEN " +
                        "   '3107' " +
                        "  WHEN T2.DATA_AUTH = 'FA174AFF136D496A87B65443D22357E3' THEN " +
                        "    '3107' " +
                        "  ELSE " +
                        "   T4.WARE_HOUSE " +
                        " END AS ITEM_WARE_HOUSE "
                        + "FROM T_PM_PROJECT_DETAIL T1 "
                        + "LEFT JOIN T_PM_PROJECT_BASE T2 ON T1.PROJECT_ID = T2.PROJECT_ID  "
                        + "LEFT JOIN T_CO_ITEM T3 ON T3.CI_ITEM_CODE = T1.CBD_ITEM_CODE  "
                        + "WHERE 1=1 AND T2.id = ?  AND T1.CBD_ITEM_CODE=?  ";
                map1 = modelService.queryForMap(sql, new Object[]{dataId,itemCode});
                map1.put("WARE_HOUSE","0000" );
                list.add(map1);
            }else {
                if(colCode !=null) {
                    if(stockCode.equals(colCode)) {
                        sql = "SELECT distinct T1.*,T3.CI_ITEM_NAME,T3.CI_ITEM_SPEC,T4.WARE_HOUSE,T1.WORK_SPACE, " +
                                " CASE " +
                                "  WHEN T2.DATA_AUTH = '9e33fa093ca74f229a997f0cf3734a9c' THEN " +
                                "   '3109' " +
                                "  WHEN T2.DATA_AUTH = '7f60fed22c004015a9a4f1ab2fc59194' THEN " +
                                "   '3107' " +
                                "  WHEN T2.DATA_AUTH = 'FA174AFF136D496A87B65443D22357E3' THEN " +
                                "    '3107' " +
                                "  ELSE " +
                                "   T4.WARE_HOUSE " +
                                " END AS ITEM_WARE_HOUSE "
                                + "FROM T_PM_PROJECT_DETAIL T1 "
                                + "LEFT JOIN T_PM_PROJECT_BASE T2 ON T1.PROJECT_ID = T2.PROJECT_ID  "
                                + "LEFT JOIN T_CO_ITEM T3 ON T3.CI_ITEM_CODE = T1.CBD_ITEM_CODE  "
                                + "LEFT JOIN T_SAP_WH_CONFIG T4 ON T4.WORK_SPACE = T1.WORK_SPACE  "
                                + "WHERE 1=1 AND T4.IS_COLOR = '1' AND T1.WORK_SPACE=? AND T1.CBD_ITEM_CODE=? AND T2.id = ?   ";
                        map1 = modelService.queryForMap(sql, new Object[]{workSpace,itemCode,dataId});
                        list.add(map1);
                    }else {
                        sql = "SELECT distinct T1.*,T3.CI_ITEM_NAME,T3.CI_ITEM_SPEC,T4.WARE_HOUSE,T1.WORK_SPACE, " +
                                " CASE " +
                                "  WHEN T2.DATA_AUTH = '9e33fa093ca74f229a997f0cf3734a9c' THEN " +
                                "   '3109' " +
                                "  WHEN T2.DATA_AUTH = '7f60fed22c004015a9a4f1ab2fc59194' THEN " +
                                "   '3107' " +
                                "  WHEN T2.DATA_AUTH = 'FA174AFF136D496A87B65443D22357E3' THEN " +
                                "    '3107' " +
                                "  ELSE " +
                                "   T4.WARE_HOUSE " +
                                " END AS ITEM_WARE_HOUSE "
                                + "FROM T_PM_PROJECT_DETAIL T1 "
                                + "LEFT JOIN T_PM_PROJECT_BASE T2 ON T1.PROJECT_ID = T2.PROJECT_ID  "
                                + "LEFT JOIN T_CO_ITEM T3 ON T3.CI_ITEM_CODE = T1.CBD_ITEM_CODE  "
                                + "LEFT JOIN T_SAP_WH_CONFIG T4 ON T4.WORK_SPACE = T1.WORK_SPACE   "
                                + "WHERE 1=1 AND T4.IS_COLOR = '0' AND T1.WORK_SPACE=? AND T1.CBD_ITEM_CODE=? AND T2.id = ?   ";
                        map1 = modelService.queryForMap(sql, new Object[]{workSpace,itemCode,dataId});
                        list.add(map1);
                    }
                }else {
                    sql = "SELECT distinct T1.*,T3.CI_ITEM_NAME,T3.CI_ITEM_SPEC,T4.WARE_HOUSE,T1.WORK_SPACE," +
                            " CASE " +
                            "  WHEN T2.DATA_AUTH = '9e33fa093ca74f229a997f0cf3734a9c' THEN " +
                            "   '3109' " +
                            "  WHEN T2.DATA_AUTH = '7f60fed22c004015a9a4f1ab2fc59194' THEN " +
                            "   '3107' " +
                            "  WHEN T2.DATA_AUTH = 'FA174AFF136D496A87B65443D22357E3' THEN " +
                            "    '3107' " +
                            "  ELSE " +
                            "   T4.WARE_HOUSE " +
                            " END AS ITEM_WARE_HOUSE "
                            + "FROM T_PM_PROJECT_DETAIL T1 "
                            + "LEFT JOIN T_PM_PROJECT_BASE T2 ON T1.PROJECT_ID = T2.PROJECT_ID  "
                            + "LEFT JOIN T_CO_ITEM T3 ON T3.CI_ITEM_CODE = T1.CBD_ITEM_CODE  "
                            + "LEFT JOIN T_SAP_WH_CONFIG T4 ON T4.WORK_SPACE = T1.WORK_SPACE   "
                            + "WHERE 1=1 AND T4.IS_COLOR = '1' AND T1.WORK_SPACE=? AND T1.CBD_ITEM_CODE=? AND T2.id = ? ";
                    map1 = modelService.queryForMap(sql, new Object[]{workSpace,itemCode,dataId});
                    list.add(map1);
                }

            }


        }
       /* String sql = "SELECT distinct T1.*,T3.CI_ITEM_NAME,T3.CI_ITEM_SPEC,T1.WARE_HOUSE,T1.WORK_SPACE "
		  + " FROM T_PM_PROJECT_DETAIL T1 "
		  + " LEFT JOIN T_PM_PROJECT_BASE T2 ON T1.PROJECT_ID = T2.PROJECT_ID  "
		  + " LEFT JOIN T_CO_ITEM T3 ON T3.CI_ITEM_CODE = T1.CBD_ITEM_CODE  "
		  + " WHERE 1=1 AND T2.id = ?  ";
        List list = modelService.listDataSql(sql, new Object[]{dataId});*/
        if (list.size() > 0) {
            CommMethod.listToEscapeJs(list);
            modelAction.setDataList(list);
            modelAction.setAjaxList(list);
        }

        return modelAction.ActionForwardExeid(modelAction.getExeid());
    }

}
