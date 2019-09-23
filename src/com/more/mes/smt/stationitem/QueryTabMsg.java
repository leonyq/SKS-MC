package com.more.mes.smt.stationitem;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class QueryTabMsg implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		String proSn = req.getParameter("proSn");
		String tab = req.getParameter("tab");
		String orderArr = req.getParameter("orderArr");
		String timeArr = req.getParameter("timeArr");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String starTime = null;
		String endTime = null;
		String orderSqlWhere = "";
		LinkedHashSet<String> orderLink = new LinkedHashSet<String>();
		List<Map> resList = new ArrayList<Map>();
		switch (tab) {
		case "1":
			resList = this.processTab(proSn, modelAction, modelService,dataAuth);
			break;
		case "2":
			if (orderArr!=null && !"".equals(orderArr) && !"null".equals(orderArr)) {
				String[] orders = orderArr.split(",");
				for (String o : orders) {//去重
					if (o != null && !"".equals(o) && !"null".equals(o)) {
						orderLink.add(o);
					}
				}
				for (String s : orderLink) {
					if ("".equals(orderSqlWhere)) {
						orderSqlWhere = "'" + s + "'";
					} else {
						orderSqlWhere = orderSqlWhere + "," + "'" + s + "'";
					}

				}
				//取时间
				String[] times = timeArr.split(",");
				starTime = times[0];
				endTime = times[times.length - 1];
//				Date starTime2 =  DateUtil.parseDate(starTime);
//				Date endTime2 = DateUtil.parseDate(endTime);
//				starTime = DateUtil.formatDate(starTime2, "yyyy-MM-dd") + " 00:00:00 ";
//				endTime = DateUtil.formatDate(endTime2, "yyyy-MM-dd") + " 23:59:59 ";
				resList = this.empTab(starTime, endTime, orderSqlWhere,
						modelAction, modelService);
			}
			break;
		case "3":
			resList = this.itemTab(proSn, modelAction, modelService);
			break;	
		case "4":
			resList = this.qInfoTab(proSn, modelAction, modelService);
			break;	
		case "5":
			String[] times = timeArr.split(",");
			starTime = times[0];
			endTime = times[times.length - 1];
			if("".equals(starTime) || "".equals(endTime)){
				break;
			}
			Date starTime2 =  DateUtil.parseDate(starTime);
			Date endTime2 = DateUtil.parseDate(endTime);
			starTime = DateUtil.formatDate(starTime2, "yyyy-MM-dd") + " 00:00:00 ";
			endTime = DateUtil.formatDate(endTime2, "yyyy-MM-dd") + " 23:59:59 ";
			resList = this.envInfoTab(starTime,endTime,modelAction, modelService);
			break;	
		case "6":
			resList = this.qInfo2(proSn, modelAction, modelService);
			break;				
		default:
			break;
		}

		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(resList);
		modelAction.getAjaxPage().setDataList(resList);
		return BaseActionSupport.AJAX;
	}
	@SuppressWarnings("unchecked")
	public List<Map> processTab(String proSn,ModelAction modelAction,ModelService modelService,String dataAuth){
		List<Map> resList = new ArrayList<Map>();
		String sql = "select  t.WD_GROUP_CODE,t6.GROUP_NAME,t.WD_WORK_STATION,t.wd_area_sn ,t4.ca_name as WD_AREA_SN_NAME,t5.ca_name as WD_WORK_STATION_NAME,a.value as WD_ERROR_FLAG,t.WD_MO_NUMBER,t.WD_PROJECT_ID,WD_MODEL_CODE,t7.NAME as WD_EMP,to_char(t.WD_IN_TIME,'yyyy-MM-dd hh24:mi:ss') as WD_IN_TIME  " +
				"from t_wip_detail t " +
				"left join t_co_area t4 on t4.CA_ID = t.wd_area_sn and t4.DATA_AUTH=t.DATA_AUTH " +
				"left join t_co_area t5 on t5.CA_ID = t.WD_WORK_STATION and t5.DATA_AUTH=t.DATA_AUTH " +
				"left join T_CO_GROUP t6 on t6.GROUP_CODE = t.WD_GROUP_CODE and t6.DATA_AUTH=t.DATA_AUTH  "
				+ "left join sy_user t7 on t7.login_name=t.WD_EMP " +
				"left join sy_dict_val a on a.code = t.WD_ERROR_FLAG and a.dict_code='ERROR_FLAG' " +
				"where t.wd_sn =?  order by t.WD_IN_TIME asc";
		resList =  modelService.listDataSql(sql, new Object[]{proSn});
		return resList;
	}
    public List<Map> empTab(String starTime,String endTime,String order,ModelAction modelAction,ModelService modelService){
    	List<Map> resList = new ArrayList<Map>();
    	String sql = "select to_char(t1.OP_TIME,'yyyy-MM-dd hh24:mi:ss') as OP_TIME,t2.name as USER_NAME,a.value as ON_OFF_TYPE," +
    			"t1.CA_AREA_SN,t1.CA_WORKSTATION_SN,t4.ca_name as CA_AREA_SN_NAME,t5.ca_name as CA_WORKSTATION_SN_NAME " +
    			"from T_USER_STATION_ON_OFF_LOG t1 " +
    			"left join sy_user t2 on t2.id = t1.user_id " +
    			"left join t_co_area t4 on t4.CA_ID = t1.CA_AREA_SN " +
    			"left join t_co_area t5 on t5.CA_ID = t1.CA_WORKSTATION_SN " +
    			"left join sy_dict_val a on a.code = t1.ON_OFF_TYPE and a.dict_code='USER_ON_OFF_TYPE' " +
    			"where 1=1 ";
    	String sqlWhere = null;
    	sqlWhere = " and t1.MO_NUMBER in ("+order+") ";//and t1.OP_TIME>=to_date('"+starTime+"','yyyy/MM/dd hh24:mi:ss') and t1.OP_TIME<=to_date('"+endTime+"','yyyy/MM/dd hh24:mi:ss') and 
    	resList =  modelService.listSql(sql+sqlWhere,null,null," order by t1.OP_TIME asc ",null);
    	return resList;
    }
    public List<Map> itemTab(String proSn,ModelAction modelAction,ModelService modelService){
		List<Map> resList = new ArrayList<Map>();
		List<Map> snList = new ArrayList<Map>();
		snList = this.selectTreeC(proSn, modelService, snList);
		String sn = null;
		String sns ="'" + proSn + "'";
		for(Map snMap : snList){
			sn ="'" + String.valueOf(snMap.get("id")) + "'";
		    sns = sns +"," + sn;

		}
        String sql = "select  T1.WSI_ITEM_SN,a.value as WSI_ITEM_TYPE,T1.WSI_MO_NUMBER,T1.WSI_MODEL_CODE,b.value as WSI_PROCESS_FACE,T1.WSI_AREA_ID,T1.WSI_WORKSTATION_SN,T1.WSI_ITEM_CODE,T1.WSI_LOT_NO,T1.WSI_ITEM_COUNT,T1.WSI_POINT,T1.WSI_POINT_NUM,T1.WSI_SUPPLIERS,k.name WSI_EMP,to_char(T1.WSI_LOADTIME,'yyyy-MM-dd hh24:mi:ss') as WSI_LOADTIME ,t4.value as Pm_Product_Step from  t_wip_station_item T1 " +
        		"LEFT JOIN  t_wip_item_trace_info T2 ON T2.WIT_ITEM_ID = T1.ID " +
        				" left join t_pm_mo_base t3 on t3.PM_MO_NUMBER = t1.wsi_mo_number " +
        				" left join sy_dict_val t4 on t4.code = t3.Pm_Product_Step and t4.dict_code = 'PROJECT_STEP' " +
        				"left join sy_dict_val a on a.code = T1.WSI_ITEM_TYPE and a.dict_code='WSI_ITEM_TYPE' " +
        				"left join sy_dict_val b on b.code = T1.WSI_PROCESS_FACE and b.dict_code = 'CIG_PROCESS_FACE' " +
        				"LEFT JOIN SY_USER k on k.login_name=t1.WSI_EMP " +
        				" WHERE T2.WIT_SN in ("+sns+") ";
		resList =  modelService.listDataSql(sql);
		if(resList==null || resList.isEmpty()){
	         sql = "select  T1.WSI_ITEM_SN,a.value as WSI_ITEM_TYPE,T1.WSI_MO_NUMBER,T1.WSI_MODEL_CODE,b.value as WSI_PROCESS_FACE,T1.WSI_AREA_ID,T1.WSI_WORKSTATION_SN,T1.WSI_ITEM_CODE,T1.WSI_LOT_NO,T1.WSI_ITEM_COUNT,T1.WSI_POINT,T1.WSI_POINT_NUM,T1.WSI_SUPPLIERS,k.name WSI_EMP,to_char(T1.WSI_LOADTIME,'yyyy-MM-dd hh24:mi:ss') as WSI_LOADTIME ,t4.value as Pm_Product_Step from  t_wip_station_item_log T1 " +
	        		"LEFT JOIN  t_wip_item_trace_info T2 ON T2.WIT_ITEM_ID = T1.ID " +
	        				" left join t_pm_mo_base t3 on t3.PM_MO_NUMBER = t1.wsi_mo_number " +
	        				" left join sy_dict_val t4 on t4.code = t3.Pm_Product_Step and t4.dict_code = 'PROJECT_STEP' " +
	        				"left join sy_dict_val a on a.code = T1.WSI_ITEM_TYPE and a.dict_code='WSI_ITEM_TYPE' " +
	        				"left join sy_dict_val b on b.code = T1.WSI_PROCESS_FACE and b.dict_code = 'CIG_PROCESS_FACE' " +
	        				"LEFT JOIN SY_USER k on k.login_name=t1.WSI_EMP " +
	        				" WHERE T2.WIT_SN in ("+sns+") ";
			resList =  modelService.listDataSql(sql);	
		}
		return resList;    	
    }
	public List<Map> qInfoTab(String proSn,ModelAction modelAction,ModelService modelService){
		List<Map> resList = new ArrayList<Map>();
		List<Map> List = new ArrayList<Map>();
		List<Map> List1 = null;
		String sql = "SELECT QIP_INSPECT_SN  FROM   t_qm_insepct_parent_info where  QIP_SN = ? ";
		resList =  modelService.listDataSql(sql, new Object[]{proSn});
		if(resList!=null && !resList.isEmpty()){
			for(int i=0;i<resList.size();i++){
			String qipInspectSn = String.valueOf(resList.get(i).get("QIP_INSPECT_SN"));//单号
			List1 = new ArrayList<Map>();
			sql = "select t1.QII_INSPECT_SN,"+
       "t2.value as QII_TEST_STEP,"+
      "t3.value as QII_SAMPLE_TYPE,"+
       "t4.value as QII_LIST_FLAG,t8.value as QII_INSEPCT_RESULT,"+
       "t1.QII_CONNECT_DOC,"+
       "t5.Name as QII_SEND_DEP,"+
       "to_char(t1.QII_SEND_TIME,'yyyy-MM-dd hh24:mi:ss') as QII_SEND_TIME,"+
       "t6.name as QII_SEND_EMP,"+
       "to_char(t1.QII_INSEPCT_TIME,'yyyy-MM-dd hh24:mi:ss') as QII_INSEPCT_TIME,"+
       "t7.name as QII_INSEPCT_EMP "+
  "from t_qm_inspect_info t1 "+
  "left join sy_dict_val t2 on t1.QII_TEST_STEP = t2.code and t2.dict_code = 'QTI_TEST_STEP' "+ 
  "left join sy_dict_val t3 on t1.QII_SAMPLE_TYPE = t3.code and t3.dict_code = 'SAMPLE_TYPE' "+
  "left join sy_dict_val t4 on t1.QII_LIST_FLAG = t4.code and t4.dict_code = 'LIST_FLAG'  "+
  "left join sy_dept t5 on t5.id= t1.QII_SEND_DEP "+
  "left join sy_user t6 on t6.login_name = t1.QII_SEND_EMP "+ 
  "left join sy_user t7 on t7.id = t1.QII_INSEPCT_EMP " +
  "left join sy_dict_val t8 on t1.QII_INSEPCT_RESULT = t8.code and t8.dict_code = 'INSEPCT_RESULT' " +
  "where t1.QII_INSPECT_SN = ?";
			List1 = modelService.listDataSql(sql, new Object[]{qipInspectSn});
			List.addAll(List1);
			}
		}
		return List;
	}
	public List<Map> qInfo2(String proSn,ModelAction modelAction,ModelService modelService){
		List<Map> resList = new ArrayList<Map>();
		String sql = "select t1.WR_REPAIR_STATION, t1.WR_FINISH_FLAG, t1.WR_MO_NUMBER,t2.PM_MODEL_CODE,t3.CI_ITEM_NAME,t3.CI_ITEM_SPEC,b.value as PM_PROCESS_FACE,t1.WR_LOT,t1.WR_ERROR_CODE,t1.WR_POINT,t1.WR_ERROR_NUM,t4.WE_POINT_COUNT "+
  "from t_wip_repair t1 "+
  "left join t_pm_mo_base t2 on t2.pm_mo_number = t1.wr_mo_number "+ 
  "left join t_co_item t3 on t3.ci_item_code = t2.pm_model_code " +
  "left join t_wip_error t4 on t4.id = t1.WE_ID "+
  "left join sy_dict_val b on b.code = T2.PM_PROCESS_FACE and b.dict_code = 'CIG_PROCESS_FACE' " +
  "where t1.wr_sn = ?";
		resList =  modelService.listDataSql(sql, new Object[]{proSn});
		return resList;
	}
	public List<Map> envInfoTab(String starTime,String endTime,ModelAction modelAction,ModelService modelService){
		List<Map> resList = new ArrayList<Map>();
		String sql = "select t1.ID,t2.name as cei_record_emp,t3.value as CEI_TYPE,t1.cei_area_sn,to_char(t1.cei_record_time,'yyyy-MM-dd hh24:mi:ss') as cei_record_time,t1.cei_record_content from T_CO_ENV_INFO t1 " +
				"left join sy_user t2 on t2.LOGIN_NAME = t1.cei_record_emp " +
				"left join sy_dict_val t3 on t3.code = t1.CEI_TYPE and t3.dict_code = 'CEI_TYPE' " +
				"where t1.cei_record_time>=to_date(?,'yyyy-MM-dd hh24:mi:ss') and t1.cei_record_time<=to_date(?,'yyyy-MM-dd hh24:mi:ss') ";
		resList =  modelService.listDataSql(sql, new Object[]{starTime,endTime});
		return resList;
	}
    public List<Map> selectTreeC(String proSn,ModelService modelService,List<Map> resList){
    	List<Map> dataList = new ArrayList<Map>();
    	Map<String,Object> paramMap = new HashMap<String,Object>();
    	
    	String wkiKeypSn = null;
    	String wkiSn = null;
    	String sql = "select * from t_wip_keyp_info where WKI_SN = ?";
    	dataList = modelService.listDataSql(sql, new Object[]{proSn});
    	if(dataList!=null && !dataList.isEmpty()){ 
    		for(int i =0;i<dataList.size();i++){
    			Map<String,Object> resMap = new HashMap<String,Object>();
    			paramMap = dataList.get(i);
    			wkiKeypSn = String.valueOf(paramMap.get("WKI_KEYP_SN"));
    			wkiSn = String.valueOf(paramMap.get("WKI_SN"));
    			resMap.put("id", wkiKeypSn);
    			resMap.put("name", wkiKeypSn);
    			resMap.put("upId", wkiSn);
    			resList.add(resMap);
    			this.selectTreeC(wkiKeypSn, modelService, resList);
    		}
    	}
    	return resList;
    }
}

