package com.more.mes.smt.wmsStockInfo.oracle;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取库存明细信息
 * @author development
 *
 */
public class AjaxStockDetail implements FuncService{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("dataAuth");
    //String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	String itemCode = request.getParameter("itemCode");
	String itemName = request.getParameter("itemName");
	String supCode = request.getParameter("supCode");//供应商
	String itemSn = request.getParameter("itemSn");//物料SN
	String containerSn = request.getParameter("containerSn");//容器SN
	String custCode = request.getParameter("custCode");//客户
	String docNum = request.getParameter("docNum");//仓库单据号
	String connectDoc = request.getParameter("connectDoc");//关联单号
	String whCode = request.getParameter("whCode");//仓库
	String districtCode = request.getParameter("districtCode");//库区
	String storageCode = request.getParameter("storageCode");//库位
	String itemState = request.getParameter("itemState");//物料状态
	String inspectFlag = request.getParameter("inspectFlag");//检验标志
	String freezeFlag = request.getParameter("freezeFlag");//冻结标志
	String receiveBegin = request.getParameter("receiveBegin");//入库时间
	String receiveEnd = request.getParameter("receiveEnd");
	String invalidBegin = request.getParameter("invalidBegin");//保质期
	String invalidEnd = request.getParameter("invalidEnd");
	String userId = modelAction.getSessionUser().getId();
    String searchSql = " where 1=1 "; //查询条件
    Map<String, String> sqlParaMap = new HashMap<String, String>();
	if(StringUtils.isNotBlank(dataAuth)){
		searchSql+=" and t.DATA_AUTH =:dataAuth  ";
		sqlParaMap.put("dataAuth", dataAuth);
	
	}else {
	        	searchSql += " and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :userId ) ";
				sqlParaMap.put("userId", userId);      	
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
    String sql = "SELECT t.WSI_ITEM_NUM,t.ID,T.WSI_ITEM_CODE,t.WSI_ITEM_SN,t.WSI_DOC_NUM,t.WSI_STOCK_FLAG,t.WSI_INSPECT_FLAG,t.WSI_FREEZE_FLAG,t.WSI_LOT_NO,t.WSI_CONNECT_DOC,t.WSI_FIRST_SN,t.WSI_SECOND_SN,t.WSI_THIRD_SN,t.WSI_FOURTH_SN,t.WSI_SUP_TRACE,t1.name dept_name,t2.ci_item_name,t2.ci_item_spec,t3.supplier_name," +
        "t4.customer,to_char(t.wsi_invalid_date,'yyyy-mm-dd') invalid_date," +
        "t5.wa_area_name wh_name,t6.wa_area_name district_name,t7.wa_area_name storage_name," +
        "to_char(t.wsi_receive_time,'yyyy-mm-dd hh24:mi:ss') RECEIVE_TIME," +
        "to_char(t.wsi_produce_date,'yyyy-mm-dd') produce_date," +
        "round(SYSDATE-t.wsi_invalid_date,2) EXTEND_TIME,round(SYSDATE-t.wsi_receive_time,2) DULL_TIME, " +
        //" to_char((t.wsi_test_time + t2.ci_recheck_days),'yyyy-mm-dd hh24:mi:ss') RECHECKOUT, "+
         " case when t2.ci_recheck_days=0  then '' "+
        " else to_char((t.wsi_test_time+t2.ci_recheck_days),'yyyy-mm-dd hh24:mi:ss') end  RECHECKOUT,"+
         " to_char(t.wsi_test_time,'yyyy-mm-dd hh24:mi:ss') TEST_TIME,t2.CI_RECHECK_DAYS, "+
        "CASE WHEN t.WSI_ITEM_FLAG=1 THEN '良品'"
        + " WHEN t.WSI_ITEM_FLAG=2   THEN '不良品' "
        + "ELSE ' ' END OUTTIME "+
        "FROM T_WMS_STOCK_INFO t " +
        "LEFT JOIN sy_dept t1 ON t1.id=t.data_auth  " + //
        "LEFT JOIN t_co_item t2 ON t2.ci_item_code=t.wsi_item_code and t2.DATA_AUTH=t.DATA_AUTH " + 
        "LEFT JOIN t_co_supplier t3 ON t3.supplier_code=t.wsi_sup_code and t3.DATA_AUTH=t.DATA_AUTH   " +
        "LEFT JOIN t_co_customer t4 ON t4.cust_code=t.wsi_cust_code and t4.DATA_AUTH=t.DATA_AUTH    " +
        "LEFT JOIN t_wms_area t5 ON t5.wa_area_sn=t.wsi_wh_code  and t5.DATA_AUTH=t.DATA_AUTH  " +
        "LEFT JOIN t_wms_area t6 ON t6.wa_area_sn=t.wsi_district_code and t6.DATA_AUTH=t.DATA_AUTH  " +
        "LEFT JOIN t_wms_area t7 ON t7.wa_area_sn=t.wsi_storage_code  and t7.DATA_AUTH=t.DATA_AUTH ";
    String sql1 = sql + searchSql + " order by t.WSI_RECEIVE_TIME desc ";
    List itemList = modelService.listSql(sql1, modelAction.getPage(), sqlParaMap, null, null);
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(itemList);
    modelAction.getAjaxPage().setDataList(itemList);
    return BaseActionSupport.AJAX;
  }

}
