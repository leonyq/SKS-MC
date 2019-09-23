package com.morelean.mcmes.feed;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 新增生产投料-获取阈值
 *
 * @author:hly
 * @version:2019/7/31 10:59
 * @email:
 **/
public class getProjecctThreshold implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();
        
        Double thresholdNum = 0.0;
        
        try {
        	String PROJECT_ID = request.getParameter("PROJECT_ID");
        	String FACTORY_ID = "0001";
        	
        	String sql = "SELECT T.THRESHOLD_NUM " + 
        			//"  FROM T_CO_THRESHOLD_CONFIG T " + 
                    " FROM T_CO_THRESHOLD_CONFIGURATION T " + 
        			"  LEFT JOIN T_PM_PROJECT_BASE T1 " + 
        			//"    ON T.FACTORY_ID = T1.DEPT_ID " + 
                    "    ON T.DEPT_ID = T1.DEPT_ID " + 
        			//"   AND T.WORK_STATION = T1.PRODUCT_LINE " + 
                    "   AND T.WORK_STATION_CODE = T1.PRODUCT_LINE " + 
        			"   AND T1.PROJECT_ID = ? " + 
        			" WHERE T1.PROJECT_ID = ? " + 
        			"   AND T.THRESHOLD_TYPE = '2' "; 

        	Map<String, Double> map = modelService.queryForMap(sql, new Object[] {PROJECT_ID, FACTORY_ID});
        	if (map != null && map.size()>0) {
        		thresholdNum = map.get("THRESHOLD_NUM");
			}
           
        } catch (Exception e) {
        	log.error(e.getMessage());
            e.printStackTrace();
            throw new BussException(modelAction.getText(e.getMessage()),e.getMessage());
        }
        modelAction.setAjaxString(thresholdNum+"");
        return BaseActionSupport.AJAX;
    }

}
