package com.more.mes.smt.wmsStockInfo.pg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 存明细信息查询及分页
 * @author development
 *
 */
public class AjaxPageStockDetail implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String dataAuth = modelAction.getParaMap().get("dataAuth");
		String itemCode = modelAction.getParaMap().get("itemCode");
		String itemName = modelAction.getParaMap().get("itemName");
		String supCode = modelAction.getParaMap().get("supCode");//供应商
		String itemSn = modelAction.getParaMap().get("itemSn");//物料SN
		String containerSn = modelAction.getParaMap().get("containerSn");//容器SN
		String custCode = modelAction.getParaMap().get("custCode");//客户
		String docNum = modelAction.getParaMap().get("docNum");//仓库单据号
		String connectDoc = modelAction.getParaMap().get("connectDoc");//关联单号
		String whCode = modelAction.getParaMap().get("whCode");//仓库
		String districtCode = modelAction.getParaMap().get("districtCode");//库区
		String storageCode = modelAction.getParaMap().get("storageCode");//库位
		String itemState = modelAction.getParaMap().get("itemState");//物料状态
		String inspectFlag = modelAction.getParaMap().get("inspectFlag");//检验标志
		String freezeFlag = modelAction.getParaMap().get("freezeFlag");//冻结标志
		String receiveBegin = modelAction.getParaMap().get("receiveBegin");//入库时间
		String receiveEnd = modelAction.getParaMap().get("receiveEnd");
		String invalidBegin = modelAction.getParaMap().get("invalidBegin");//保质期
		String invalidEnd = modelAction.getParaMap().get("invalidEnd");
		String searchSql = " where 1=1 "; //查询条件
		Map<String, String> sqlParaMap = new HashMap<String, String>();
		if(StringUtils.isNotBlank(dataAuth)){
			searchSql+=" and t.DATA_AUTH =:dataAuth";
			sqlParaMap.put("dataAuth", dataAuth);
		}
		if(StringUtils.isNotBlank(itemCode)){
			searchSql+=" and t.wsi_item_code =:itemCode";
			sqlParaMap.put("itemCode", itemCode);
		}
		if(StringUtils.isNotBlank(itemName)){
			searchSql+=" and t2.ci_item_name like '%' || :itemName || '%'";
			sqlParaMap.put("itemName", itemName);
		}
		if(StringUtils.isNotBlank(supCode)){
			searchSql+=" and t.WSI_SUP_CODE =:supCode";
			sqlParaMap.put("supCode", supCode);
		}
		if(StringUtils.isNotBlank(itemSn)){
			searchSql+=" and t.WSI_ITEM_SN like '%' || :itemSn || '%'";
			sqlParaMap.put("itemSn", itemSn);
		}
		if(StringUtils.isNotBlank(containerSn)){
			searchSql+=" and (t.WSI_FIRST_SN like '%' || :containerSn || '%' " +
					" or t.WSI_SECOND_SN like '%' || :containerSn1 || '%' " +
					" or t.WSI_THIRD_SN like '%' || :containerSn2 || '%' " +
					" or t.WSI_FOURTH_SN like '%' || :containerSn3 || '%' ) ";
			sqlParaMap.put("containerSn", containerSn);
			sqlParaMap.put("containerSn1", containerSn);
			sqlParaMap.put("containerSn2", containerSn);
			sqlParaMap.put("containerSn3", containerSn);
		}
		if(StringUtils.isNotBlank(custCode)){
			searchSql+=" and t.WSI_CUST_CODE =:custCode";
			sqlParaMap.put("custCode", custCode);
		}
		if(StringUtils.isNotBlank(docNum)){
			searchSql+=" and t.WSI_DOC_NUM like '%' || :docNum || '%'";
			sqlParaMap.put("docNum", docNum);
		}
		if(StringUtils.isNotBlank(connectDoc)){
			searchSql+=" and t.WSI_CONNECT_DOC like '%' || :connectDoc || '%'";
			sqlParaMap.put("connectDoc", connectDoc);
		}
		if(StringUtils.isNotBlank(whCode)){
			searchSql+=" and t.WSI_WH_CODE =:whCode";
			sqlParaMap.put("whCode", whCode);
		}
		if(StringUtils.isNotBlank(districtCode)){
			searchSql+=" and t.WSI_DISTRICT_CODE =:districtCode";
			sqlParaMap.put("districtCode", districtCode);
		}
		if(StringUtils.isNotBlank(storageCode)){
			searchSql+=" and t.WSI_STORAGE_CODE =:storageCode";
			sqlParaMap.put("storageCode", storageCode);
		}
		if(StringUtils.isNotBlank(itemState)){
			searchSql+=" and t.WSI_STOCK_FLAG =:itemState";
			sqlParaMap.put("itemState", itemState);
		}
		if(StringUtils.isNotBlank(inspectFlag)){
			searchSql+=" and t.WSI_INSPECT_FLAG =:inspectFlag";
			sqlParaMap.put("inspectFlag", inspectFlag);
		}
		if(StringUtils.isNotBlank(freezeFlag)){
			searchSql+=" and t.WSI_FREEZE_FLAG =:freezeFlag";
			sqlParaMap.put("freezeFlag", freezeFlag);
		}
		if(StringUtils.isNotBlank(receiveBegin)){
			searchSql+=" and t.WSI_RECEIVE_TIME > to_date(:receiveBegin,'yyyy-mm-dd hh24:mi:ss')";
			sqlParaMap.put("receiveBegin", receiveBegin);
		}
		if(StringUtils.isNotBlank(receiveEnd)){
			searchSql+=" and t.WSI_RECEIVE_TIME < to_date(:receiveEnd,'yyyy-mm-dd hh24:mi:ss')";
			sqlParaMap.put("receiveEnd", receiveEnd);
		}
		if(StringUtils.isNotBlank(invalidBegin)){
			searchSql+=" and t.WSI_INVALID_DATE > to_date(:invalidBegin,'yyyy-mm-dd')";
			sqlParaMap.put("invalidBegin", invalidBegin);
		}
		if(StringUtils.isNotBlank(invalidEnd)){
			searchSql+=" and t.WSI_INVALID_DATE < to_date(:invalidEnd,'yyyy-mm-dd')";
			sqlParaMap.put("invalidEnd", invalidEnd);
		}
		
		String sql = "SELECT t.*,t1.name dept_name,t2.ci_item_name,t2.ci_item_spec,t3.supplier_name," +
		        "t4.customer,to_char(t.wsi_invalid_date,'yyyy-mm-dd') invalid_date," +
		        "t5.wa_area_name wh_name,t6.wa_area_name district_name,t7.wa_area_name storage_name," +
		        "to_char(t.wsi_receive_time,'yyyy-mm-dd hh24:mi:ss') RECEIVE_TIME," +
		        "to_char(t.wsi_produce_date,'yyyy-mm-dd') produce_date," +
		        "round((extract(epoch from now()-t.wsi_invalid_date)/86400)::numeric,2) EXTEND_TIME,round((extract(epoch from now()-t.wsi_receive_time)/86400)::numeric,2) DULL_TIME, " +
		        " to_char((t.wsi_test_time + (t2.ci_recheck_days || 'day')::interval),'yyyy-mm-dd hh24:mi:ss') RECHECKOUT, "+
		         " to_char(t.wsi_test_time,'yyyy-mm-dd hh24:mi:ss') TEST_TIME,t2.CI_RECHECK_DAYS, "+
		        "CASE WHEN t.WSI_ITEM_FLAG='1' THEN '良品'"
		        + " WHEN t.WSI_ITEM_FLAG='2'   THEN '不良品' "
		        + "ELSE ' ' END OUTTIME "+
		        "FROM T_WMS_STOCK_INFO t " +
		        "LEFT JOIN sy_dept t1 ON t1.id=t.data_auth " +
		        "LEFT JOIN t_co_item t2 ON t2.ci_item_code=t.wsi_item_code " +
		        "LEFT JOIN t_co_supplier t3 ON t3.supplier_code=t.wsi_sup_code " +
		        "LEFT JOIN t_co_customer t4 ON t4.cust_code=t.wsi_cust_code " +
		        "LEFT JOIN t_wms_area t5 ON t5.wa_area_sn=t.wsi_wh_code " +
		        "LEFT JOIN t_wms_area t6 ON t6.wa_area_sn=t.wsi_district_code " +
		        "LEFT JOIN t_wms_area t7 ON t7.wa_area_sn=t.wsi_storage_code ";
		String sql1 = sql + searchSql + " order by t.WSI_STORAGE_CODE";
		List itemList = modelService.listSql(sql1, modelAction.getPage(), sqlParaMap, null,null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listMapToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}

}
