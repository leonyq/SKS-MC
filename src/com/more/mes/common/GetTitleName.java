package com.more.mes.common;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取标签名称
 * @author Administrator
 *
 */
public class GetTitleName implements FuncService {

	@Override
	public String exeFunc(ModelAction action, ModelService service) {
		// TODO Auto-generated method stub
		HttpServletRequest request = action.getRequest();
		String funcCode = request.getParameter("funcCode");
		List list = new ArrayList<>();
		if (funcCode!=null) {
			String sql = "SELECT NAME FROM SY_FUNC WHERE FUNC_CODE = ?";
			list = service.listDataSql(sql, new Object[]{funcCode});
		}
		action.setAjaxPage(action.getPage());
		CommMethod.listMapToEscapeJs(list);
		action.setAjaxList(list);
		return BaseActionSupport.AJAX;
	}

}
