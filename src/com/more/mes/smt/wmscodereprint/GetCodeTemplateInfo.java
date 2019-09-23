package com.more.mes.smt.wmscodereprint;

import java.util.HashMap;
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
 * 条码打印---条码重打---获取条码模板信息
 * 
 * @author Administrator
 *
 */
public class GetCodeTemplateInfo implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {//
		HttpServletRequest request = modelAction.getRequest();
		String itemSn = request.getParameter("itemSn");
		Map<String, Object> map = new HashMap<String, Object>();
		List itemList = null;
		String resStr = "";
		try {
			String sql = "SELECT T.ID LABEL_ID,T.LABEL_NAME LABEL_NAME,T.LABELCSS FROM ML_TEMPLATE T";
			itemList = modelService.listSql(sql, null, null, null, null, null);
		} catch (Exception e) {
			log.error(e);
			resStr = "ERROR";
		}
		modelAction.setAjaxList(itemList);
		modelAction.setAjaxString(resStr);
		return BaseActionSupport.AJAX;
	}
}
