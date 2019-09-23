package com.more.mes.smt.wmsoutstock;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 生产领料----获取id信息
 * 
 * @author Administrator
 *
 */
public class GetProduceNumId implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String docNum = request.getParameter("docNum");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		// String auth = request.getSession().getAttribute("mcDataAuth").toString();
		// TODO Auto-generated method stub
		String sql = " select ID,DATA_AUTH from  T_WMS_OUTSTOCK_ITEM  where WOI_DOC_NUM =?    ";

		List<Map> list = modelService.listDataSql(sql, new Object[] { docNum });

		modelAction.setAjaxList(list);

		return BaseActionSupport.AJAX;
	}

}
