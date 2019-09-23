package com.morelean.mcmes.feed;

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

			String sql = " SELECT B.ID, B.THRESHOLD_NUM, A.PRODUCT_COUNT " +
					"  FROM T_PM_PROJECT_BASE A " +
					"  LEFT JOIN T_CO_THRESHOLD_CONFIGURATION B " +
					"    ON 1 = 1 " +
					" WHERE 1 = 1 " +
					"   AND A.PROJECT_ID = ? " +
					"   AND B.THRESHOLD_TYPE = ? " +
					"   AND A.WORK_SPACE = B.FACTORY_CODE " +
					"   AND A.PRODUCT_LINE = B.WORK_STATION_CODE " +
					"   AND B.ITEM_CODE IS NULL  ";

			Map<String, Object> map = modelService.queryForMap(sql, new Object[] {PROJECT_ID, THRESHOLD_TYPE});
			if (map != null && map.size()>0) {
				thresholdNum = getQuantity(modelService, map.get("ID").toString(), Double.parseDouble(map.get("PRODUCT_COUNT").toString()));
				thresholdNum = thresholdNum !=null && !thresholdNum.isEmpty()? thresholdNum : map.get("THRESHOLD_NUM").toString();
			}

		} catch (Exception e) {
			log.error(e.getMessage());
			e.printStackTrace();
			throw new BussException(modelAction.getText(e.getMessage()),e);
		}
		modelAction.setAjaxString(thresholdNum);
		return BaseActionSupport.AJAX;
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

}
