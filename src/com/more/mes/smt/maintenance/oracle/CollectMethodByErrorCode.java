package com.more.mes.smt.maintenance.oracle;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 产品维修----根据不良代码统计维修方法及次数
 * 
 * @author development
 *
 */
public class CollectMethodByErrorCode implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String type = request.getParameter("type");
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		if (type.equals("errorMethod")) {
			String errorCode = request.getParameter("errorCode");
			String sql = "select t.wr_repair_method,COUNT(t.wr_repair_method) METHODNUM,"
					+ "(SELECT t1.value FROM sy_dict_val t1 WHERE t1.code=t.wr_repair_method AND t1.dict_code='WR_REPAIR_METHOD') method_name "
					+ " from T_WIP_REPAIR t " + "WHERE T.WR_ERROR_CODE=? and t.DATA_AUTH=? GROUP BY t.wr_repair_method";
			List<Map<String, Object>> mList = modelService.listDataSql(sql, new Object[] { errorCode, auth });
			CommMethod.listToEscapeJs(mList);
			modelAction.setAjaxList(mList);
		} else if (type.equals("modelEchart")) {
			String modelCode = request.getParameter("modelCode");
			String sql = "SELECT * from(select t.WE_ERROR_CODE,"
					+ "(SELECT A.CEC_NAME FROM T_CO_ERROR_CODE A WHERE A.CEC_CODE = T.WE_ERROR_CODE"
					+ " and a.data_auth=?) ERROR_NAME," + "COUNT(t.we_error_code) ERRORNUM "
					+ "from T_WIP_ERROR t WHERE t.we_model_code=? and  t.DATA_AUTH=? "
					+ "GROUP BY t.we_error_code  ORDER BY ERRORNUM DESC) WHERE ROWNUM<=10";
			List<Map<String, Object>> mList = modelService.listDataSql(sql, new Object[] { auth, modelCode, auth });
			CommMethod.listToEscapeJs(mList);
			modelAction.setAjaxList(mList);
		}
		return BaseActionSupport.AJAX;
	}

}
