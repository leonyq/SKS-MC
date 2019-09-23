package com.more.buss.eis.bd.basedos.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

public class ItemGroupSnCheck implements ValidateFuncService {

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

		String type=modelAction.getRequest().getParameter("type");
		String groupSn = StringUtils.toString(paraMap.get("CIG_SN"));
		String id = modelAction.getDataId();
		String id2 = null;
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		
		String sql = "select count(1) as count from T_CO_ITEM_GROUP where CIG_SN=? and DATA_AUTH=? ";
		Map resultMap = modelService.queryForMap(sql, new Object[] {groupSn,dataAuth});
		int count = Integer.parseInt(resultMap.get("count").toString());
		if (count > 0) {
			if(("edit").equals(type)){
				String sql2 = "select id from T_CO_ITEM_GROUP where CIG_SN=? and DATA_AUTH=? ";
				List<Map> list2 = modelService.listDataSql(sql2, new Object[] {groupSn,dataAuth});
				id2 = list2.get(0).get("ID").toString();
				if(!id2.equals(id)) {
					return new OperResult(false, CommMethod.getText("物料组编码")+groupSn+CommMethod.getText("已存在"));
				}else {
					return new OperResult(true);
				}                
			}else{

				return new OperResult(false, CommMethod.getText("物料组编码")+groupSn+CommMethod.getText("已存在"));
			}
		} else {
			return new OperResult(true);
		}
	}
}
