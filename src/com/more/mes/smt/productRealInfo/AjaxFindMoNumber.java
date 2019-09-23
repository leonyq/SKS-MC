package com.more.mes.smt.productRealInfo;

import java.util.ArrayList;
import java.util.List;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class AjaxFindMoNumber implements FuncService {

	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String moNumber = modelAction.getParaMap().get("moNumber");
	    String projectId = modelAction.getParaMap().get("projectId");
	    String modelCode = modelAction.getParaMap().get("modelCode");
	    String status = modelAction.getParaMap().get("status");
	    String beginTime = modelAction.getParaMap().get("beginTime");
	    String endTime = modelAction.getParaMap().get("endTime");
	    String destroyNo = modelAction.getParaMap().get("destroyNo");
	    String dataAuth = modelAction.getRequest().getParameter("dataAuth");
	    String userId = modelAction.getSessionUser().getId();
	    String sqlWhere = "";
	    List<Object> sqlwList = new ArrayList<>();
	    String querySql ="SELECT ROWNUM,t.ID AS DATA_ID,c.ID,c.NAME AS DATA_AUTH,t.PM_SCRAP_QTY,t.PM_MO_NUMBER,t.PM_PROJECT_ID,t.PM_MODEL_CODE,t.PM_AREA_SN,t.PM_TARGET_QTY,t.PM_FINISH_COUNT,t.PM_INPUT_COUNT,b.value face_name,a.product_name,a.product_standard,a.product_count,to_char(a.CREATE_TIME,'yyyy-MM-dd HH:mi:ss') PRODUCT_OPENTIME, " +
	    		" a.DESTROY_NO,to_char(t.PM_START_DATE,'yyyy-MM-dd HH:mi:ss') START_DATE FROM t_pm_mo_base t "+
	    		"LEFT JOIN t_pm_project_base a ON a.project_id = t.pm_project_id AND a.data_auth=t.data_auth "+
	    		"LEFT JOIN sy_dict_val b ON b.code = t.pm_process_face AND b.dict_code = 'CIG_PROCESS_FACE' "
	    		+ "LEFT JOIN sy_dept c on c.id = t.data_auth ";
	      if(StringUtils.isNotBlank(dataAuth)) {
	    	  sqlWhere+=" and t.data_auth = ?    ";
	  		sqlwList.add(dataAuth);	    
	        }else {
	        	sqlWhere += " and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = ? ) ";
				sqlwList.add(userId);       	
	        }
	    
	    
		

	    if(StringUtils.isNotBlank(moNumber)){
			sqlWhere+=" and t.PM_MO_NUMBER like '%'|| ? || '%' ";
			sqlwList.add(moNumber);
		}
		if(StringUtils.isNotBlank(projectId)){
			sqlWhere+=" and t.PM_PROJECT_ID like '%' || ? || '%' ";
			sqlwList.add(projectId);
		}
		if(StringUtils.isNotBlank(modelCode)){
			sqlWhere+=" and t.PM_MODEL_CODE like '%' || ? || '%' ";
			sqlwList.add(modelCode);
		}
		if(StringUtils.isNotBlank(status)){
			sqlWhere+=" and t.PM_STATUS = ? ";
			sqlwList.add(status);
		}
		if(StringUtils.isNotBlank(beginTime)){
			sqlWhere+=" and a.CREATE_TIME > to_date(?,'yyyy-mm-dd hh24:mi:ss')";
			sqlwList.add(beginTime);
		}
		if(StringUtils.isNotBlank(endTime)){
			sqlWhere+=" and a.CREATE_TIME < to_date(?,'yyyy-mm-dd hh24:mi:ss')";
			sqlwList.add(endTime);
		}
		if(StringUtils.isNotBlank(destroyNo)){
			sqlWhere+=" and a.DESTROY_NO like  ? || '%' ";
			sqlwList.add(destroyNo);
		}
		List itemList = modelService.listSql(querySql, modelAction.getPage(), sqlWhere, sqlwList, null,null);
        modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(itemList);

		return BaseActionSupport.AJAX;
	}

}
