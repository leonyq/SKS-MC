package com.more.mes.smt.parameter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 修改获取参数设置信息
 * @ClassName GetParameterInfo
 * @author WZY
 * 
 */
public class GetParameterInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub

		HttpServletRequest request = modelAction.getRequest();
		String dataId = request.getParameter("CLAS");// 项目编码

		String sql = "SELECT t.* FROM T_SYS_PARAMETER_INI t";
		Map<String, String> map = new HashMap<String, String>();
		String sqlWhere = " where 1=1 ";
		if (StringUtils.isNotBlank(dataId)) {
			sqlWhere += "and t.VR_FUNC = :dataId";
			map.put("dataId", dataId);
		}

		// String sql1 = "select * from("+sql + sqlWhere+ ")";

		List list = modelService.listSql(sql + sqlWhere, null, map, null, null);// 获取参数配置信息

		modelAction.setAjaxList(list);
		CommMethod.listMapToEscapeJs(list);

		return BaseActionSupport.AJAX;

	}

}
