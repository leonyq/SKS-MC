package com.more.mes.smt.itemTraceability;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 根据物料sn获取--履历--产品--质量信息
 * @author development
 *
 */
public class AjaxGetItemSnConnInfo implements FuncService{

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String itemSn = request.getParameter("itemSn");
		String type = request.getParameter("type");//类型
		String userId = modelAction.getSessionUser().getId();
		//String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		if(type.equals("logType")){ //履历
			String sql = "select distinct * from (SELECT  t.wti_operate_type,t.wti_doc_num,t1.wdt_type_name,"
					+"to_char(t.wti_operate_time,'yyyy-mm-dd hh24:mi:ss') operate_time,t2.name " 
					+"from T_WMS_TASK_LOG t "
					+"LEFT JOIN T_WMS_DOC_TYPE t1 ON t1.wdt_type_sn = t.wti_doc_type and t1.DATA_AUTH=t.DATA_AUTH "
					+"LEFT JOIN sy_user t2 ON t2.login_name = t.wti_operate_emp "
					+"WHERE t.wti_item_sn = ? and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = ? ) order by t.wti_operate_time asc)aa ";
			List listParam = new ArrayList();
	        listParam.add(itemSn);
	        listParam.add(userId);
			List<Map> itemList =modelService.listSql(sql, modelAction.getPage(), null, listParam, null,null);
			modelAction.setAjaxPage(modelAction.getPage());
			CommMethod.listToEscapeJs(itemList);
			modelAction.getAjaxPage().setDataList(itemList);
		}else if(type.equals("product")){ //产品
			String sql = "SELECT DISTINCT T.WIT_SN,T.WIT_MO_NUMBER,T2.PM_PROJECT_ID,T.WIT_MODEL_CODE," +
					"T3.CI_ITEM_NAME,T3.CI_ITEM_SPEC "
					+"FROM T_WIP_ITEM_TRACE_INFO T "
					+"LEFT JOIN T_WIP_STATION_ITEM T1 ON T1.ID = T.WIT_ITEM_ID and t1.DATA_AUTH=t.DATA_AUTH "
					+"LEFT JOIN T_PM_MO_BASE T2 ON T2.PM_MO_NUMBER = T.WIT_MO_NUMBER and t2.DATA_AUTH=t.DATA_AUTH "
					+"LEFT JOIN T_CO_ITEM T3 ON T3.CI_ITEM_CODE = T.WIT_MODEL_CODE and t3.DATA_AUTH=t.DATA_AUTH "
					+"WHERE T1.WSI_ITEM_SN = ?  and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = ? ) " +
					"UNION ALL "+
					"SELECT DISTINCT T.WIT_SN,T.WIT_MO_NUMBER,T2.PM_PROJECT_ID,T.WIT_MODEL_CODE," +
					"T3.CI_ITEM_NAME,T3.CI_ITEM_SPEC "
					+"FROM T_WIP_ITEM_TRACE_INFO T "
					+"LEFT JOIN T_WIP_STATION_ITEM_LOG T1 ON T1.ID = T.WIT_ITEM_ID and t1.DATA_AUTH=t.DATA_AUTH "
					+"LEFT JOIN T_PM_MO_BASE T2 ON T2.PM_MO_NUMBER = T.WIT_MO_NUMBER and t2.DATA_AUTH=t.DATA_AUTH "
					+"LEFT JOIN T_CO_ITEM T3 ON T3.CI_ITEM_CODE = T.WIT_MODEL_CODE and t3.DATA_AUTH=t.DATA_AUTH "
					+"WHERE T1.WSI_ITEM_SN = ?  and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = ? ) ORDER BY WIT_SN";
			List listParam = new ArrayList();
	        listParam.add(itemSn);
	        listParam.add(userId);
	        //listParam.add(dataAuth);
	        listParam.add(itemSn);
	        listParam.add(userId);
	       //listParam.add(dataAuth);
	        String sql1 = "select * from("+sql+")aa ";
	        List<Map> itemList =modelService.listSql(sql1, modelAction.getPage(), null, listParam, null,null);
	        modelAction.setAjaxPage(modelAction.getPage());
	        CommMethod.listToEscapeJs(itemList);
			modelAction.getAjaxPage().setDataList(itemList);
		}else{ //质量
			String sql ="SELECT T.QII_INSPECT_SN,T2.VALUE TEST_STEP,T3.VALUE SAMPLE_TYPE," +
					"T4.VALUE LIST_FLAG,T5.VALUE INSEPCT_RESULT,T6.CUSTOMER,T7.SUPPLIER_NAME,T8.NAME,"
					+"TO_CHAR(T.QII_SEND_TIME,'YYYY-MM-DD HH24:MI:SS') SEND_TIME "
					+"FROM T_QM_INSPECT_INFO T "
					+"LEFT JOIN T_QM_INSEPCT_PARENT_INFO T1 ON T1.QIP_INSPECT_SN = T.QII_INSPECT_SN and t1.DATA_AUTH=t.DATA_AUTH "
					+"LEFT JOIN SY_DICT_VAL T2 ON T2.CODE = T.QII_TEST_STEP AND T2.DICT_CODE = 'QTI_TEST_STEP' "
					+"LEFT JOIN SY_DICT_VAL T3 ON T3.CODE = T.QII_SAMPLE_TYPE AND T3.DICT_CODE = 'SAMPLE_TYPE' "
					+"LEFT JOIN SY_DICT_VAL T4 ON T4.CODE = T.QII_LIST_FLAG AND T4.DICT_CODE = 'LIST_FLAG' "
					+"LEFT JOIN SY_DICT_VAL T5 ON T5.CODE = T.QII_INSEPCT_RESULT AND T5.DICT_CODE = 'INSEPCT_RESULT' "
					+"LEFT JOIN T_CO_CUSTOMER T6 ON T.QII_CUST_CODE = T6.CUST_CODE and t6.DATA_AUTH=t.DATA_AUTH "
					+"LEFT JOIN T_CO_SUPPLIER T7 ON T.QII_CUST_CODE = T7.SUPPLIER_CODE and t7.DATA_AUTH=t.DATA_AUTH "
					+"LEFT JOIN SY_USER T8 ON T8.LOGIN_NAME = T.QII_SEND_EMP "
					+"WHERE T1.QIP_SN = ?  ";
			List<Map> itemList = modelService.listDataSql(sql, new Object[]{itemSn});
			CommMethod.listToEscapeJs(itemList);
			modelAction.setAjaxList(itemList);
		}
		return BaseActionSupport.AJAX;
	}

}
