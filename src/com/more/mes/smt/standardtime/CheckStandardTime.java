package com.more.mes.smt.standardtime;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

public class CheckStandardTime implements ValidateFuncService{

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
	public OperResult valJavaFun(String formId, Map paraMap, ModelService modelService,
			ModelAction modelAction, Object... objs) {
		String CST_MODEL_CODE = (String)paraMap.get("CST_MODEL_CODE");
		String CST_STEP_CODE = (String) paraMap.get("CST_STEP_CODE");
		String CST_PROCESS_FACE = (String) paraMap.get("CST_PROCESS_FACE");
		String dataid = modelAction.getDataId();
		String sql = "select * from T_CO_STANDARD_TIME where CST_MODEL_CODE=? " +
				"and CST_STEP_CODE=? and CST_PROCESS_FACE=? ";
		List subList = modelService.listDataSql(sql, new Object[] { CST_MODEL_CODE,CST_STEP_CODE,CST_PROCESS_FACE });
        if (subList!=null&&subList.size() > 0) {
            if(!StringUtils.isEmpty(dataid)&&subList.size()==1){
               String id1=(String) ((Map)subList.get(0)).get("ID");
               if(!dataid.equals(id1)){
                   return new OperResult(false, modelAction.getText("同个机种、生产阶别、加工面别只允许存在一条标准工时"));
               }
            }
            else{
                return new OperResult(false, modelAction.getText("同个机种、生产阶别、加工面别只允许存在一条标准工时"));
            }
        }
		return new OperResult(true);
	}

}
