package com.more.buss.eis.bd.basedos.service;

import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

public class ValidateForbiddenItem implements ValidateFuncService{

	String sql1 = null;
	@Override
	public OperResult valJavaFun(String formId, Map paraMap,
			 ModelService modelService,ModelAction modelAction,Object... objs) {
		String file_type = modelAction.getRequest().getParameter("file_type").trim();//取类型，判断新增还是修改
		String cf_item_code = StringUtils.toString(paraMap.get("CF_ITEM_CODE"));//
		String cfType = StringUtils.toString(paraMap.get("CF_TYPE"));//0:全局;1:工单;2:机种
		String cfPro = StringUtils.toString(paraMap.get("CF_PROJECT_ID"));
		String cfModel = StringUtils.toString(paraMap.get("CF_MODEL_CODE"));
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String sql = "select count(1) as count from T_CO_ITEM_FORBIDDEN where CF_ITEM_CODE=? and DATA_AUTH=? ";
		String sql2 = "select ID from T_CO_ITEM_FORBIDDEN where CF_ITEM_CODE=? and DATA_AUTH=? ";
		String sqlWhere1 = "and CF_PROJECT_ID =? ";//工单
		String sqlWhere2 = "and CF_MODEL_CODE =? ";//物料
		Object[] whereObj = null;
        if("1".equals(cfType)){
		sql = sql + sqlWhere1;
		sql2 = sql2 + sqlWhere1;
		whereObj = new Object[]{cf_item_code,dataAuth,cfPro};
		}else if("2".equals(cfType)){
		sql = sql + sqlWhere2;
		sql2 = sql2 + sqlWhere2;
		whereObj = new Object[]{cf_item_code,dataAuth,cfModel};
		}else{
		    ////////////////////////////////////////////
		    String tempId = modelAction.getDataId();
		    if(("edit_file").equals(file_type)){
		        sql = sql + " and ID !='"+tempId+"'";
		    }
		    sql = sql + " and CF_TYPE='0'";
			whereObj = new Object[]{cf_item_code,dataAuth};	
		}
		Map resultMap = modelService.queryForMap(sql, whereObj);
		int count = Integer.parseInt(resultMap.get("count").toString());
		if (count == 1) {
			if(("edit_file").equals(file_type)){
				//sql = "select CF_ITEM_CODE from T_CO_ITEM_FORBIDDEN where ID=?";
				//resultMap = modelService.queryForMap(sql,new Object[] {modelAction.getDataId()});//
				//String cf_item_code_t = StringUtils.toString(resultMap.get("CF_ITEM_CODE"));
				Map resultMap2 = modelService.queryForMap(sql2,whereObj);
				String id = modelAction.getDataId();
				String id2 = (String)resultMap2.get("ID");				
				if((id).equals(id2)){
					return new OperResult(true);
				}else{
					return new OperResult(false, CommMethod.getText("禁用料编码已存在")+cf_item_code);
				}
			}else{
				return new OperResult(false, CommMethod.getText("禁用料编码已存在")+cf_item_code);
			}
		}else if(count>1){
			return new OperResult(false, CommMethod.getText("该记录在数据库中大于等于2条，旧有数据问题")+cf_item_code);
		} else {
			return new OperResult(true);
		}
	}
	

}
