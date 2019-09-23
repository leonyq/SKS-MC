package com.more.mes.smt.maintenance;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 产品维修---替换主件
 * @Description 产品维修---替换主件视图加载前类
 * @ClassName ProductKeyp
 * @author Administrator
 * @version 1.0 developer 2017-9-15 created
 * @see ProductKeyp
 * @since 2017-9-15
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class ProductKeyp implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest t = modelAction.getRequest();
		String weSn = t.getParameter("weSn");
		String sql = "select WKI_ID,WKI_KEYP_SN, WKI_ITEM_CODE,a.CI_ITEM_NAME,WKI_GROUP_CODE from T_WIP_KEYP_INFO t"
				+ " left join t_co_item a on a.ci_item_code=t.WKI_ITEM_CODE and t.data_auth=a.data_auth where t.wki_flag='Y' and t.WKI_SN = ? ";
		List sList = modelService.listDataSql(sql, new Object[] { weSn });
		CommMethod.listToEscapeJs(sList);
		modelAction.setDataList(sList);
		return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面

		// return
		// modelAction.ActionForward("/buss/viewCode/MC-MES/SCGK/wxgl/productKeyp.jsp");
	}
}