
package com.more.mes.smt.exemption.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

public class  ValidateData implements ValidateFuncService{
  /**
   * @param formId
   *          表单ID
   * @param paraMap
   *          数据对象
   * @param modelService
   *          modelService
   * @return OperResult
   */

	@Override
	public OperResult valJavaFun(String formId, Map paraMap,
			ModelService modelService, ModelAction modelAction, Object... objs) {
		HttpServletRequest req = modelAction.getRequest();
		String file_type = req.getParameter("file_type").trim();//取视图类型，判断新增还是修改
		String dataId = modelAction.getDataId();//id
		//新增
		String itemCode = req.getParameter("paraMap1@0#QEI_ITEM_CODE");//物料料号
		String sup = req.getParameter("paraMap1@0#QEI_SUP_CODE");//供应商
		//修改
		String itemCodeEdit = req.getParameter("paraMapObj.QEI_ITEM_CODE");//物料料号
		String supEdit = req.getParameter("paraMapObj.QEI_SUP_CODE");//供应商		
		//唯一性验证
		if("add".equals(file_type)){//新增
		String sql = "select count(*) from T_QM_EXEMPTION_INFO where QEI_ITEM_CODE =? and QEI_SUP_CODE=?";	
		List dataList = modelService.listDataSql(sql, new Object[]{itemCode,sup}); 	
		if(dataList!=null && dataList.size()>0){//重复
			return new OperResult(false, CommMethod.getText("该条记录已存在"));
		}
		}else if("edit".equals(file_type)){//修改
		String sql = "select id from T_QM_EXEMPTION_INFO where QEI_ITEM_CODE =? and QEI_SUP_CODE=?";	
		List<Map> dataList = modelService.listDataSql(sql, new Object[]{itemCodeEdit,supEdit});
		String sqlId = "";
		if(dataList!=null && dataList.size()>0){
			if(dataList.size()>1){
				return new OperResult(false, CommMethod.getText("该条记录已存在"));
			}else{
				sqlId = String.valueOf(dataList.get(0).get("ID"));
			}
		}else{
			return new OperResult(true);
		}
		if(dataList!=null && !dataId.equals(sqlId)){//重复
			return new OperResult(false, CommMethod.getText("该条记录已存在"));
		}
		}
			
		return new OperResult(true);
	}

}
