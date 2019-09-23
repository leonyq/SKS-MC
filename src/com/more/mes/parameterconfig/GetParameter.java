package com.more.mes.parameterconfig;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 修改获取参数配置信息
 * @ClassName DelParameter
 * @author WZY
 * 
 */
public class GetParameter implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		String vrClass = request.getParameter("CLAS");// 项目编码
		String dataId = request.getParameter("dataId");
		String dataAuth = String.valueOf(request.getSession().getAttribute("mcDataAuth"));
		String sql = "SELECT * FROM T_SYS_PARAMETER_INI";
		// Map<String, String> map = new HashMap<String, String>();
		String sqlWhere = "";
		// sqlWhere+= " and DATA_AUTH =? ";
		List<Object> sqlwList = new ArrayList<Object>();
		// sqlwList.add(dataAuth);
		// if (StringUtils.isNotBlank(vrClass))
		// {
		// sqlWhere+="and VR_CLASS = :vrClass";
		// map.put("vrClass", vrClass);

		sqlWhere += " and id = ? ";
		sqlwList.add(dataId);
		// }

		List list = modelService.listSql(sql, null, sqlWhere, sqlwList, null, null);// 获取参数配置信息

		modelAction.setAjaxList(list);
		CommMethod.listMapToEscapeJs(list);

		return BaseActionSupport.AJAX;
	}

}
