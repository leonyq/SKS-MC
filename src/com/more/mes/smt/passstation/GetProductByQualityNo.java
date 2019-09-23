package com.more.mes.smt.passstation;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 照片采集---撤销，根据合格证号获取产品sn
 * @author Administrator
 *
 */
public class GetProductByQualityNo implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String qualityNo = request.getParameter("qualityNo");
		String sql = "select t.WSP_SN from T_WIP_SN_PHOTO_INFO t where t.WSP_QUALITY_NO=? ";
		List<Map> list = modelService.listDataSql(sql, new Object[]{qualityNo});
		modelAction.setAjaxList(list);
		return BaseActionSupport.AJAX;
	}

}
