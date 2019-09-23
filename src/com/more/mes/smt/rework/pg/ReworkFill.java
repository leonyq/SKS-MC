package com.more.mes.smt.rework.pg;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 返工单信息---返工填报视图加载前
 * 
 * @author Administrator
 *
 */
public class ReworkFill implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {

		String sql = "select (extract(epoch from now()-CRI_START_TIME)/86400)::numeric as CRI_PROCESS_TIME   from t_co_rework_info t where t.id= ? ";
		List<Map> sList = modelService.listDataSql(sql, new Object[] { modelAction.getDataId() });
		Map dataMap = new HashMap();

		String f = StringUtils.toString(sList.get(0).get("CRI_PROCESS_TIME"));
		if (StringUtils.isNotBlank(f)) {
			BigDecimal bg = new BigDecimal(f);
			double f1 = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			dataMap.put("CRI_PROCESS_TIME", f1);
		}
		CommMethod.mapToEscapeJs(dataMap);
		modelAction.setDataMap(dataMap);
		return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面

		// return
		// modelAction.ActionForward("/buss/viewCode/MC-MES/SCGK/fggl/reworkFill.jsp");
	}
}