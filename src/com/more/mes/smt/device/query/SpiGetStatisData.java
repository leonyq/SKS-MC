package com.more.mes.smt.device.query;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取SPI测试统计数据
 * 
 * @author development
 *
 */
public class SpiGetStatisData implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {

		HttpServletRequest request = modelAction.getRequest();
		String resultId = request.getParameter("result_id");
		String sql = "SELECT * FROM V_DEVICE_SPI_STATIS_INFO WHERE 1 = 1  ";
		String where = "";
		Map<String, Object> paraMap = new HashMap<String, Object>();
		if (!"".equals(resultId)) {
			where += " AND RESULT_ID = :RESULT_ID ";
			paraMap.put("RESULT_ID", resultId);
		}
		//List<Map<String, Object>> mList = modelService.listDataSql(sql + where);
		List<Map> mList = modelService.listSql(sql+where, modelAction.getPage(), paraMap,
      	      "", null);
		modelAction.setAjaxList(mList);
		return BaseActionSupport.AJAX;
	}

}
