package com.morelean.mcmes.feed;

import com.more.fw.core.base.core.action.BaseActionSupport;
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
 * 新增生产投料-视图前执行类
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
        String dataId = modelAction.getDataId();
        String projectId = request.getParameter("projectId");
        String reg = "ok";
        //验证工单是否到达投料流程
        String checkSql = "SELECT * FROM  T_PM_PROJECT_BASE T  WHERE 1=1 AND T.PROJECT_STATUS='4' AND  T.PROJECT_ID=? ";
        List clist = modelService.listDataSql(checkSql, new Object[]{projectId});
        if(clist.size() <= 0){
          reg = "ng";
          modelAction.setAjaxString(reg);
    	  return BaseActionSupport.AJAX;
        }
        //判断工单是否已包装
        String checksql1 = "SELECT * FROM  T_PROJECT_PACK_FEED T  WHERE 1=1 AND  T.PROJECT_ID=?";
        clist = modelService.listDataSql(checksql1, new Object[]{projectId});
      
        if(clist.size() > 0) {
          reg = "ng1";
    	  modelAction.setAjaxString(reg);
    	  return BaseActionSupport.AJAX;
        }
        String projctSql = "SELECT * FROM T_PM_PROJECT_FEED_BASE";
        /*-- version:2019/7/18 15:38 | desc:投料标准配方 --*/
        
        String feedDetailSql = " SELECT D.CI_ITEM_CODE  AS ITEM_CODE, " + 
        		"       D.STOCK_CODE    AS ITEM_STOCK, " + 
        		"       D.RAW_LOTNUMBER AS ITEM_LOT, " + 
        		"       C.CBD_ITEM_NUM  AS ITEM_NUM, " + 
        		"       NVL(E.THRESHOLD_NUM, 0) AS THRESHOLD_NUM, " + 
          		"       D.CI_ITEM_NAME AS ITEM_NAME " + 
        		"  FROM T_PM_PROJECT_BASE A " + 
        		//"  LEFT JOIN T_CO_BOM B ON A.PRODUCT_MATERIAL = B.CB_ITEM_CODE " + 
        		//"  LEFT JOIN T_CO_BOM_DETAIL C ON B.ID = C.CB_BOMID " + 
        		" LEFT JOIN T_PM_PROJECT_DETAIL C ON C.PROJECT_ID = A.PROJECT_ID " +
          		"  LEFT JOIN T_CO_ITEM D " + 
        		"    ON C.CBD_ITEM_CODE = D.CI_ITEM_CODE " + 
        		"  LEFT JOIN T_CO_THRESHOLD_CONFIG E " + 
        		"    ON D.CI_ITEM_CODE = E.RELATED_CODE " + 
        		"   AND E.FACTORY_ID = A.DEPT_ID " + 
        		"   AND E.WORK_STATION = A.PRODUCT_LINE " + 
        		" WHERE 1 = 1 " + 
        		"   AND A.ID = ? ";
        List list = modelService.listDataSql(feedDetailSql, new Object[]{dataId});

        int countSql = modelService.countSql(feedDetailSql, new Object[]{dataId});

        /*-- version:2019/7/18 15:39 | desc:基础信息 --*/
        String sql = "SELECT A.PROJECT_ID,A.LOT_NUMBER,A.PM_MEMO,A.PRODUCT_COUNT FROM T_PM_PROJECT_BASE A WHERE 1=1 AND A.ID = ? ";
        Map<String, String> map = modelService.queryForMap(sql, new Object[]{dataId});

        String curUserName = modelAction.getCurrUser().getName();
        map.put("CUR_USER", curUserName);
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
