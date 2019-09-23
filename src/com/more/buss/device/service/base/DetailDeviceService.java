package com.more.buss.device.service.base;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class DetailDeviceService implements FuncService {
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String dataId = modelAction.getRequest().getParameter("dataId");
		Map<Object, Object> map = null;
	    List<Object> loadPointList = null;
	    List<Map> deviceList = null;
	    String deviceSql = "select picture_path from T_CO_DEVICE where id = ?";
	    deviceList = modelService.listDataSql(deviceSql, new Object[] { dataId });
	    String pictureName = (String) deviceList.get(0).get("picture_path");
	    
	    String sql = "select row_number() over() as rownum,A.cdl_table,A.cdl_loadpoint,A.cdl_memo, T.value AS dict from T_CO_DEVICE_LOADPOINT A LEFT JOIN SY_DICT_VAL T  ON T.CODE= A.CDL_TRACK  AND  T.DICT_CODE=? where A.cd_device_id = ? order by A.cdl_table, A.CDL_LOADPOINT";
	    String countSql = "SELECT COUNT(1) NUM from T_CO_DEVICE_LOADPOINT t WHERE cd_device_id = ?";
	    loadPointList = modelService.listDataSql(sql, new Object[] { "TRACK_TYPE",dataId });
	    map = modelService.queryForMap(countSql, new Object[] { dataId });
	    modelAction.setDataList(loadPointList);
	    map.put("dataId", dataId);
	    map.put("pictureName", pictureName);
	    modelAction.setDataMap(map);
	    //return modelAction.dynamicForwardExeid(modelAction.getJSP_VIEW_ID());// 该ID为功能对应的视图ID
	    	return modelAction.ActionForwardExeid(modelAction.getExeid());
	}

}