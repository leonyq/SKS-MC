package com.more.buss.eis.bd.basedos.service;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;



public class ValidateSu implements ValidateFuncService{
    String sql = null;
	@Override
	public OperResult valJavaFun(String formId, Map paraMap,
			 ModelService modelService,ModelAction modelAction,Object... objs) {
		String edit_type = modelAction.getRequest().getParameter("edit_type").trim();//取类型，判断新增还是修改
		String supplier_code = StringUtils.toString(paraMap.get("SUPPLIER_CODE"));
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String sql = "select count(1) as count from T_CO_SUPPLIER where SUPPLIER_CODE=? and DATA_AUTH=? ";
		Map resultMap = modelService.queryForMap(sql, new Object[] {supplier_code,dataAuth});
		int count = Integer.parseInt(resultMap.get("count").toString());
		if (count > 0) {
			if(("update").equals(edit_type)){
				sql = "select ID  from T_CO_SUPPLIER where SUPPLIER_CODE =?";
				resultMap = modelService.queryForMap(sql,new Object[] {supplier_code});
				String idd = StringUtils.toString(resultMap.get("ID"));
				if((idd).equals(modelAction.getDataId())){
					return new OperResult(true);
				}else{
					return new OperResult(false, CommMethod.getText("供应商编码")+supplier_code+CommMethod.getText("已存在"));
				}
			}else{
				return new OperResult(false, CommMethod.getText("供应商编码")+supplier_code+CommMethod.getText("已存在"));
			}
		} else {
			return new OperResult(true);
		}
	}
	
		
	

}
