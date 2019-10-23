package com.morelean.mcmes.feed;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 新增生产投料-获取阈值
 *
 * @author:hly
 * @version:2019/7/31 10:59
 * @email:
 **/
public class getThreshold implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {

		HttpServletRequest request = modelAction.getRequest();

		String thresholdNum = "";

		try {
			String PROJECT_ID = request.getParameter("PROJECT_ID");
			String THRESHOLD_TYPE = request.getParameter("TYPE");

			String sql = "SELECT T.WORK_SPACE, T.PRODUCT_LINE, T.PRODUCT_COUNT " +
					"  FROM T_PM_PROJECT_BASE T " +
					" WHERE T.PROJECT_ID = ? ";

			Map<String, Object> map1 = modelService.queryForMap(sql, new Object[] {PROJECT_ID});
			Object factoryCodeObj = map1.get("WORK_SPACE");
			String factoryCode = getString(factoryCodeObj);
			Object workStationObj = map1.get("PRODUCT_LINE");
			String workStation = getString(workStationObj);

			String getThresholdSQL1 = " SELECT T.ID, T.THRESHOLD_NUM " +
					"  FROM T_CO_THRESHOLD_CONFIGURATION T " +
					" WHERE 1=1 " +
					"   AND T.Threshold_Type='"+THRESHOLD_TYPE+"' " +
					"   AND T.FACTORY_CODE " + factoryCode +
					"   AND T.WORK_STATION_CODE "+workStation +
					"   AND T.ITEM_CODE IS NULL ";
			Map<String, Object> map = modelService.queryForMap(getThresholdSQL1);
			if (map == null || map.size()==0) {
				String getThresholdSQL2 = " SELECT T.ID, T.THRESHOLD_NUM " +
						"  FROM T_CO_THRESHOLD_CONFIGURATION T " +
						" WHERE 1=1 " +
						"   AND T.Threshold_Type='"+THRESHOLD_TYPE+"' " +
						"   AND T.FACTORY_CODE " + factoryCode +
						"   AND T.WORK_STATION_CODE IS NULL " +
						"   AND T.ITEM_CODE IS NULL ";
				map = modelService.queryForMap(getThresholdSQL2);
			}

			if (map != null && map.size()>0) {
				thresholdNum = getQuantity(modelService, map.get("ID").toString(), Double.parseDouble(map1.get("PRODUCT_COUNT").toString()));
				thresholdNum = thresholdNum !=null && !thresholdNum.isEmpty()? thresholdNum : map.get("THRESHOLD_NUM").toString();
			}

		} catch (Exception e) {
			log.error(e.getMessage());
			e.printStackTrace();
			throw new BussException(modelAction.getText(e.getMessage()),e);
		}
		modelAction.setAjaxString(thresholdNum);
		return modelAction.AJAX;
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
		if(map0!=null && !map0.isEmpty()){
			thresholdNum = map0.get("THRESHOLD_NUM").toString();
		}
		return thresholdNum;
	}

	private String getString(Object object) {
		return object != null && !object.toString().isEmpty() ?
				"= '" + object.toString() + "'" : "IS NULL";
	}

}
