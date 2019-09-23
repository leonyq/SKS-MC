package com.morelean.mcmes.threshold;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 新增生产投料-获取校验
 *
 * @author:hly
 * @version:2019/7/31 10:59
 * @email:
 **/
public class checkThresholdInfo implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();

        String thresholeIsExist = "";

        try {
            String THRESHOLD_TYPE = request.getParameter("THRESHOLD_TYPE");
            String FACTORY_CODE = request.getParameter("FACTORY_CODE");
            String WORK_STATION_CODE = request.getParameter("WORK_STATION_CODE");
            String ITEM_CODE = request.getParameter("ITEM_CODE");
            String sql = "";
            sql = "SELECT COUNT(1) AS num " +
                    "  FROM T_CO_THRESHOLD_CONFIGURATION T " +
                    " WHERE 1=1 " +
                    "   AND T.THRESHOLD_TYPE = '"+THRESHOLD_TYPE+"' "+
                    "   AND T.FACTORY_CODE = '"+FACTORY_CODE+"' ";

            if("".equals(WORK_STATION_CODE)){
                sql +=" AND T.WORK_STATION_CODE IS NULL ";
            }else{
                sql +=" AND T.WORK_STATION_CODE = '"+WORK_STATION_CODE+"' ";
            }
            if("".equals(ITEM_CODE)){
                sql += " AND T.ITEM_CODE IS NULL ";
            }else{
                sql += " AND T.ITEM_CODE = '"+ITEM_CODE+"' ";
            }

            Map<String, Object> map = modelService.queryForMap(sql);
            thresholeIsExist = map.get("num")+"";

        } catch (Exception e) {
            log.error(e.getMessage());
            e.printStackTrace();
            throw new BussException(modelAction.getText(e.getMessage()),e);
        }
        modelAction.setAjaxString(thresholeIsExist);
        return BaseActionSupport.AJAX;
    }

}
