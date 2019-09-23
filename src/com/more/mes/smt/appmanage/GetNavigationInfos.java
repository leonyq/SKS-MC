package com.more.mes.smt.appmanage;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description APP-APP模块---导航配置---修改获取数据
 * @ClassName AddFuncInfo
 * @author WZY
 */
public class GetNavigationInfos implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		String dataId = modelAction.getRequest().getParameter("dataId");
		//String auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		Map<Object, Object> map = null;
		List<Object> loadPointList = null;
		List<Map> deviceList = null;
		String deviceSql = "select  TAM_MENU_NAME, TAM_PHOTO_PATH,TAM_PHOTO_PATH2,TAM_MENU_PHOTO,TAM_MENU_PHOTO2 from t_app_menu "
				+ "  where id = ? ";
		map = modelService.queryForMap(deviceSql, new Object[] { dataId});
		map.put("DATAID", dataId);
		CommMethod.mapToEscapeJs(map);
		modelAction.setAjaxMap(map);
		return BaseActionSupport.AJAX;
	}

}
