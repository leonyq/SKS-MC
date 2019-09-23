package com.more.mcmes.moorder;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * tab获取管控物料
 * @author Administrator
 *
 */
public class OnLineGetItem implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		List ajaxList = new ArrayList();
	  String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String modelcode = req.getParameter("modelcode");
		String maFace = req.getParameter("maFace");
          String areaStep = req.getParameter("areaStep");
		 String dataAuthId = modelAction.getRequest().getParameter("dataAuthId");
		  	if (dataAuthId != null && !dataAuthId.equals("") && !dataAuthId.equals("undefined"))
      {
        dataAuth=dataAuthId;
      }
		 
		 String sql="SELECT t2.VALUE as CTI_ITEM_TYPE, T.CTI_ITEM_CODE, B.ASSISTANTTOOLNAME  AS CI_ITEM_NAME,   "+ 
		   "B.ASSISTANTTOOLSPEC AS CI_ITEM_SPEC,  T.CTI_GROUP, T.CTI_ASSB_QTY, t3.VALUE as CTI_CONTROL_MODE, "+ 
		   "t4.VALUE as CTI_ITEM_SOURCE,   A.NAME, T.CREATE_USER, T.CREATE_TIME  "+ 
		   "FROM T_CO_TECH_ITEM T  " +
		 		"LEFT JOIN T_CO_ASSISTANTTOOL B    ON B.ASSISTANTTOOLNO = T.CTI_ITEM_CODE AND T.DATA_AUTH=B.DATA_AUTH " +
		 		"LEFT JOIN SY_USER A  ON A.ID = T.CREATE_USER " +
		 		"LEFT JOIN SY_DICT_VAL t2 on t2.CODE = T.CTI_ITEM_TYPE AND t2.dict_code = 'CTI_ITEM_TYPE' " +
		 		"LEFT JOIN SY_DICT_VAL t3 on t3.CODE = T.CTI_CONTROL_MODE AND t3.dict_code = 'CONTROL_MO' " +
		 		"LEFT JOIN SY_DICT_VAL t4 on t4.CODE = T.CTI_ITEM_SOURCE AND t4.dict_code = 'CTI_ITEM_SOURCE' "+
		 		"WHERE T.CTI_MODEL_CODE = ? AND T.CTI_PROCESS_FACE = ? "+ 
		 		"AND T.DATA_AUTH=? AND T.CTI_PRODUCT_STEP=? ";
	        List list=modelService.listDataSql(sql, new Object[] {modelcode,maFace,dataAuth,areaStep});
	        if(list == null || list.isEmpty()){
	        	modelAction.setAjaxList(ajaxList);
				return BaseActionSupport.AJAX;
	        }else{
	        	CommMethod.listToEscapeJs(list);
	        	modelAction.setAjaxList(list);
				return BaseActionSupport.AJAX;
	        }
		
	}

}
