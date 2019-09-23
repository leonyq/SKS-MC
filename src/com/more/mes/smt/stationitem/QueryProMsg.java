package com.more.mes.smt.stationitem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class QueryProMsg implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		String proSn = req.getParameter("proSn");//产品SN
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String sql = "select T1.WT_SN,"+
       "T1.WT_PROJECT_ID,"+
       "T1.WT_MO_NUMBER,"+
       "T1.WT_MODEL_CODE,"+
       "T3.CA_NAME as WT_AREA_SN,"+
       "a.value as WT_PROCESS_FACE,"+
       "T1.WT_NUM,"+
       "T1.WT_LOT,"+
       "b.value as WT_SN_TYPE,"+
       "t5.CUSTOMER as WT_CUST_CODE,"+
       "T1.WT_GROUP_CODE,"+
       "T2.NAME as WT_EMP,"+
       "to_char(T1.WT_IN_TIME,'yyyy-MM-dd hh24:mi:ss') as WT_IN_TIME,"+
       "T1.WT_NG_NUM,"+
       "T1.WT_SCRAP_NUM,"+
       "T1.WT_BACK_GROUP,"+
       "T1.WT_NEXT_GROUP,"+
       "case when T1.WT_FINISH_FLAG='N'then '未结束' else '结束' end WT_FINISH_FLAG,"+
       "c.value as WT_SC_FINISH_FLAG,"+
       "T4.CA_NAME as WT_WORK_STATION,"+
       "T1.WT_TECH_SN,"+
       "d.value as WT_SCRAP_FLAG,"+
       "e.value as WT_REWORK_FLAG, "+
       "t6.ID "+
  "from t_wip_tracking t1 " +
  "left join sy_user t2 on t2.LOGIN_NAME = t1.WT_EMP " +
  "left join t_co_area t3 on t3.CA_ID = T1.WT_AREA_SN and t1.DATA_AUTH=t3.DATA_AUTH " +
  "left join t_co_area t4 on t4.CA_ID = T1.WT_WORK_STATION  and t1.DATA_AUTH=t4.DATA_AUTH " +
  "left join T_CO_CUSTOMER t5 on t5.CUST_CODE = T1.WT_CUST_CODE " +
  "left join T_CO_TECHNICS t6 on t6.CT_ID =T1.WT_TECH_SN and t1.DATA_AUTH=t6.DATA_AUTH "+
  "left join sy_dict_val a on a.code = T1.WT_PROCESS_FACE and a.dict_code = 'CIG_PROCESS_FACE' "+
  "left join sy_dict_val b on b.code = T1.WT_SN_TYPE and b.dict_code = 'SN_TYPE' "+
  "left join sy_dict_val c on c.code = T1.WT_SC_FINISH_FLAG and c.dict_code = 'YOrN' "+
  "left join sy_dict_val d on d.code = T1.WT_SCRAP_FLAG and d.dict_code = 'YOrN' "+
  "left join sy_dict_val e on e.code = T1.WT_REWORK_FLAG and e.dict_code = 'YOrN' "+
 "WHERE t1.WT_SN = ?  ";//and t1.DATA_AUTH=?
		Map<String,String> resMap = new HashMap<String,String>();
		String isSuccess = "Y";
		String errorMsg = "";
		List<Map> resList = modelService.listDataSql(sql, new Object[]{proSn});//,dataAuth
		if(resList.size()==0){
			isSuccess = "N";
			errorMsg = CommMethod.getText("该产品Sn没有信息");
			resMap.put("isSuccess", isSuccess);
			resMap.put("errorMsg", errorMsg);
			CommMethod.mapToEscapeJs(resMap);
			modelAction.setAjaxMap(resMap);
			return BaseActionSupport.AJAX;
		}else if(resList.size()>1){
			isSuccess = "N";
			errorMsg = CommMethod.getText("该产品Sn信息大于1,信息有误");
			resMap.put("isSuccess", isSuccess);
			resMap.put("errorMsg", errorMsg);
			CommMethod.mapToEscapeJs(resMap);
			modelAction.setAjaxMap(resMap);
			return BaseActionSupport.AJAX;
		}else{
			resMap.put("isSuccess", isSuccess);
			resMap.put("errorMsg", errorMsg);
			CommMethod.mapToEscapeJs(resMap);
			modelAction.setAjaxMap(resMap);
			CommMethod.listToEscapeJs(resList);
			modelAction.setAjaxList(resList);
			return BaseActionSupport.AJAX;
		}
	}

}

