package com.more.buss.eis.pt.itemmgr.bommgr.service;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

public class ItemCodeCheck implements ValidateFuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	/**
	 * @param formId
	 *            表单ID
	 * @param paraMap
	 *            数据对象
	 * @param modelService
	 *            modelService
	 * @return
	 */
	@Override
	public OperResult valJavaFun(String formId, Map paraMap,
			 ModelService modelService,ModelAction modelAction,Object... objs) {
		String type=modelAction.getParaMap2().get("type");
		String coItmeCode = StringUtils.toString(paraMap.get("CO_ITEM_CODE"));
		String sql = "select count(1) as count from T_CO_ITEM where CO_ITEM_CODE=?";
		Map resultMap = modelService.queryForMap(sql, new Object[] {coItmeCode});
		int count = Integer.parseInt(resultMap.get("count").toString());
		if (count > 0) {
			if(("edit").equals(type)){
				sql = "select CO_ITEM_CODE from T_CO_ITEM where ID=?";
				resultMap = modelService.queryForMap(sql,new Object[] {modelAction.getDataId()});
				String coItmeCodeTemp = StringUtils.toString(resultMap.get("CO_ITEM_CODE"));
				if((coItmeCodeTemp).equals(coItmeCode)){
					return new OperResult(true);
				}else{
					return new OperResult(false, "物料代码"+coItmeCode+"已存在！");
				}
			}else{
				return new OperResult(false, "物料代码"+coItmeCode+"已存在！");
			}
		} else {
			return new OperResult(true);
		}
	}
}
