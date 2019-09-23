package com.more.mes.parameterconfig;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 参数配置-系统功能-修改-获取数据
 * @ClassName AddFuncInfo
 * @author WZY
 */
public class EditGetFuncInfo implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		String dataId = modelAction.getRequest().getParameter("dataId");
		Map<Object, Object> map = null;
		List<Object> loadPointList = null;
		List<Map> deviceList = null;
		String deviceSql = "select CFI_PATH,CFI_FUNC_MODEL,CFI_FUNC_NAME,CFI_FUNC_SN,CFI_PHOTO,"
				+ " CFI_FUNC_MEMO from T_CO_FUNC_INFO where id = ?";
		deviceList = modelService.listDataSql(deviceSql, new Object[] { dataId });
		map = modelService.queryForMap(deviceSql, new Object[] { dataId });
		map.put("DATAID", dataId);
		modelAction.setAjaxMap(map);
		return BaseActionSupport.AJAX;
	}

}
