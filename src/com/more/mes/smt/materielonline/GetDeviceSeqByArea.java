package com.more.mes.smt.materielonline;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 在线料表 首页加载设备序号
 * @author development
 *
 */
public class GetDeviceSeqByArea implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth=request.getSession().getAttribute("mcDataAuth").toString();
		String areaId = request.getParameter("areaId");  //线别
		String sql = "SELECT DISTINCT t.CMO_DEVICE_SEQ FROM T_CO_MATERIAL_ONLINE t " +
					 "WHERE t.cmo_area_sn = ? AND T.DATA_AUTH=? ";
		List sList = modelService.listDataSql(sql, new Object[] { areaId,dataAuth });
		CommMethod.listToEscapeJs(sList);
		modelAction.setAjaxList(sList);
		return BaseActionSupport.AJAX;
	}

}
