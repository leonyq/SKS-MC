package com.more.mes.smt.stationitem;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.LinkedHashSet;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.morelean.aisino.basedata.ExcelOperator;

public class ExportOutput implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
        String proSn = request.getParameter("proSn");
        String orderArr = request.getParameter("orderArr");
		String timeArr = request.getParameter("timeArr");
		
        List<String> tableNameList = new ArrayList<String>();
        tableNameList.add("制程");
        tableNameList.add("人员");
        tableNameList.add("物料");
        tableNameList.add("质量");
        tableNameList.add("质量2");
        tableNameList.add("环境");
        
        Map<String, Map<String, String>> mHeadMap = GetTitleMap(tableNameList);
        Map<String, List<Map>> mTableMap = GetTableMap(tableNameList, proSn,orderArr,timeArr, modelAction, modelService);
        ExcelOperator eo = new ExcelOperator();
        try {
            eo.mHeadMap = mHeadMap;
            eo.downLoadExcel(modelAction.getResponse(), mTableMap,proSn);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return BaseActionSupport.AJAX;
	}
	
	//设置表头中文描述
    @SuppressWarnings("unchecked")
	public Map<String, Map<String, String>> GetTitleMap(List<String> tableNameList) {
    	Map<String, Map<String, String>> dataList = new HashMap<String, Map<String, String>>();
        for (String tableName : tableNameList) {
        	if(tableName.equals("制程")) {
                HashMap mMap = new HashMap();
                mMap.put("WD_GROUP_CODE", "工序");
                mMap.put("GROUP_NAME", "工序名称");
                mMap.put("WD_WORK_STATION", "工作中心");
                mMap.put("WD_WORK_STATION_NAME", "工作中心名称");
                mMap.put("WD_AREA_SN", "线别");
                mMap.put("WD_AREA_SN_NAME", "线别名称");
                mMap.put("WD_ERROR_FLAG", "标志");
                mMap.put("WD_MO_NUMBER", "制令单号");
                mMap.put("WD_PROJECT_ID", "工单号");
                mMap.put("WD_MODEL_CODE", "机种");
                mMap.put("WD_EMP", "作业员");
                mMap.put("WD_IN_TIME", "过站时间");
                dataList.put(tableName, mMap);
        	}
        	if(tableName.equals("人员")) {
                HashMap mMap = new HashMap();
                mMap.put("USER_NAME", "操作员");
                mMap.put("ON_OFF_TYPE", "状态");
                mMap.put("CA_WORKSTATION_SN", "工作中心");
                mMap.put("CA_WORKSTATION_SN_NAME", "工作中心名称");
                mMap.put("CA_AREA_SN", "线别");
                mMap.put("CA_AREA_SN_NAME", "线别名称");
                mMap.put("OP_TIME", "操作时间");
                dataList.put(tableName, mMap);
        	}
        	if(tableName.equals("物料")) {
                HashMap mMap = new HashMap();
                mMap.put("WSI_ITEM_SN", "物料SN");
                mMap.put("WSI_ITEM_TYPE", "物料类型");
                mMap.put("WSI_MO_NUMBER", "制令单");
                mMap.put("PM_PRODUCT_STEP", "生产阶别");
                mMap.put("WSI_MODEL_CODE", "机种代码");
                mMap.put("WSI_PROCESS_FACE", "加工面");
                mMap.put("WSI_AREA_ID", "线别");
                mMap.put("WSI_WORKSTATION_SN", "工作中心");
                mMap.put("WSI_ITEM_CODE", "料号");
                mMap.put("WSI_LOT_NO", "批次");
                mMap.put("WSI_ITEM_COUNT", "数量");
                mMap.put("WSI_POINT", "点位");
                mMap.put("WSI_POINT_NUM", "点数");
                mMap.put("WSI_SUPPLIERS", "供应商");
                mMap.put("WSI_EMP", "作业员");
                mMap.put("WSI_LOADTIME", "作业时间");
                dataList.put(tableName, mMap);
        	}
        	if(tableName.equals("质量")) {
                HashMap mMap = new HashMap();
                mMap.put("QII_INSPECT_SN", "检验单号");
                mMap.put("QII_TEST_STEP", "检验阶别");
                mMap.put("QII_SAMPLE_TYPE", "检验类型");
                mMap.put("QII_INSEPCT_RESULT", "判定结果");
                mMap.put("QII_LIST_FLAG", "状态");
                mMap.put("QII_CONNECT_DOC", "关联单号");
                mMap.put("QII_SEND_DEP", "送检部门");
                mMap.put("QII_SEND_TIME", "送检时间");
                mMap.put("QII_SEND_EMP", "送检人");
                mMap.put("QII_INSEPCT_TIME", "检验时间");
                mMap.put("QII_INSEPCT_EMP", "检验人");
                dataList.put(tableName, mMap);
        	}
        	if(tableName.equals("质量2")) {
                HashMap mMap = new HashMap();
                mMap.put("WR_REPAIR_STATION", "工作中心");
                mMap.put("WR_FINISH_FLAG", "维修状态");
                mMap.put("WR_MO_NUMBER", "制令单");
                mMap.put("PM_MODEL_CODE", "机种");
                mMap.put("CI_ITEM_NAME", "机种名称");
                mMap.put("CI_ITEM_SPEC", "规格");
                mMap.put("PM_PROCESS_FACE", "加工面");
                mMap.put("WR_ERROR_CODE", "不良代码");
                mMap.put("WR_POINT", "不良点位");
                mMap.put("WE_POINT_COUNT", "不良点数");
                dataList.put(tableName, mMap);
        	}
        	if(tableName.equals("环境")) {
                HashMap mMap = new HashMap();
                mMap.put("CEI_TYPE", "类别");
                mMap.put("CEI_AREA_SN", "区域");
                mMap.put("CEI_RECORD_EMP", "记录人");
                mMap.put("CEI_RECORD_TIME", "记录时间");
                mMap.put("CEI_RECORD_CONTENT", "记录内容");
                dataList.put(tableName, mMap);
        	}
        }
		return dataList;
    }
    
    //获取table数据
    public Map<String, List<Map>> GetTableMap(List<String> tableNameList, String proSn,String orderArr,String timeArr, ModelAction modelAction, ModelService modelService) {
    	Map<String, List<Map>> mMap = new HashMap<String, List<Map>>();
        for (String tableName : tableNameList) {
        	if(tableName.equals("制程")) {
                mMap.put(tableName, new QueryTabMsg().processTab(proSn, modelAction, modelService,""));
            }
        	if(tableName.equals("人员")) {
        		String starTime = null;
        		String endTime = null;
        		String orderSqlWhere = "";
        		LinkedHashSet<String> orderLink = new LinkedHashSet<String>();
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
    				mMap.put(tableName, new QueryTabMsg().empTab(starTime, endTime, orderSqlWhere,
    						modelAction, modelService));
    			}
            }
        	if(tableName.equals("物料")) {
                mMap.put(tableName, new QueryTabMsg().itemTab(proSn, modelAction, modelService));
            }
        	if(tableName.equals("质量")) {
                mMap.put(tableName, new QueryTabMsg().qInfoTab(proSn, modelAction, modelService));
            }
        	if(tableName.equals("质量2")) {
                mMap.put(tableName, new QueryTabMsg().qInfo2(proSn, modelAction, modelService));
            }
        	if(tableName.equals("环境")) {
        		String[] times = timeArr.split(",");
        		String starTime = null;
        		String endTime = null;
    			starTime = times[0];
    			endTime = times[times.length - 1];
    			if("".equals(starTime) || "".equals(endTime)){
    				break;
    			}
    			Date starTime2 =  DateUtil.parseDate(starTime);
    			Date endTime2 = DateUtil.parseDate(endTime);
    			starTime = DateUtil.formatDate(starTime2, "yyyy-MM-dd") + " 00:00:00 ";
    			endTime = DateUtil.formatDate(endTime2, "yyyy-MM-dd") + " 23:59:59 ";
                mMap.put(tableName, new QueryTabMsg().envInfoTab(starTime,endTime,modelAction, modelService));
            }
        }
    	return mMap;
    }

}
