package com.more.mes.smt.wmsStockInfo;

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
 * 库存汇总 查询及分页
 * @author development
 *
 */
public class AjaxPageCollectStockInfo implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String dataAuth = modelAction.getParaMap().get("dataAuth");
		//String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
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
		String collectWay1 = modelAction.getParaMap().get("collectWay");//汇总方式
		String userId = modelAction.getSessionUser().getId();
		String[] collectWay = collectWay1.split(",");
		String searchSql = ""; //查询条件
		Map<String, String> sqlParaMap = new HashMap<String, String>();
		if(StringUtils.isNotBlank(dataAuth)){
			searchSql+=" and t.DATA_AUTH =:dataAuth";
			sqlParaMap.put("dataAuth", dataAuth);
		}else {
	        	searchSql += " and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :userId ) ";
				sqlParaMap.put("userId", userId);       	
	        }
		if(StringUtils.isNotBlank(itemCode)){
			searchSql+=" and t.wsi_item_code like '%' || :itemCode || '%'";
			sqlParaMap.put("itemCode", itemCode);
		}
		if(StringUtils.isNotBlank(itemName)){
			searchSql+=" and tt.ci_item_name like '%' || :itemName || '%'";
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
		//默认的汇总方式
		String sql1 = "select t.wsi_item_code,SUM(t.wsi_item_num) item_num,t1.name data_auth,a.ci_item_name ci_item_name,b.ci_item_spec ci_item_spec " ;
		String sql  = "from T_WMS_STOCK_INFO t LEFT JOIN t_co_item tt ON tt.ci_item_code=t.wsi_item_code and tt.data_auth=t.data_auth " +
				"left join sy_dept t1 on t1.id=t.data_auth left join t_co_item a on a.ci_item_code=t.wsi_item_code and a.data_auth=t.data_auth " +
				"left join t_co_item b on b.ci_item_code=t.wsi_item_code and b.data_auth=t.data_auth ";
		String groupSql = " GROUP BY t.wsi_item_code,t1.name,a.ci_item_name,b.ci_item_spec ";
		if(collectWay!=null&&collectWay.length>0){
			for(int i=0;i<collectWay.length;i++){
				if(collectWay[i].equals("1")){ //仓库汇总
					sql += "left join t_wms_area t2 on t2.wa_area_sn=t.wsi_wh_code and t2.data_auth=t.data_auth ";
					sql1+= ",t2.wa_area_name  wh_name  ";
					groupSql += ",t2.wa_area_name ";
				}
				if(collectWay[i].equals("2")){ //批次汇总
					sql1 += ",t.wsi_lot_no ";
					groupSql += ",t.wsi_lot_no ";
				}
				if(collectWay[i].equals("3")){ //客户汇总
					sql += "left join t_co_customer t3 on t3.cust_code=t.wsi_cust_code ";
					sql1+= ",t3.customer customer  ";
					groupSql += ",t3.customer ";
				}
				if(collectWay[i].equals("4")){ //供应商汇总
					sql += "left join t_co_supplier t4 on t4.supplier_code=t.wsi_sup_code ";
					sql1+= ",t4.supplier_name supplier_name ";
					groupSql += ",t4.supplier_name ";
				}
			}
		}
		sql += "  where 1=1 ";
		String querySql = " select * from("+sql1+sql +searchSql+groupSql+")aa ";
		List itemList = modelService.listSql(querySql, modelAction.getPage(), sqlParaMap, null,null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listMapToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}

}
