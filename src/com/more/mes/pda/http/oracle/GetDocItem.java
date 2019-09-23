package com.more.mes.pda.http.oracle;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.pda.service.PdaBaseServiceUtils;
import com.more.mes.pda.service.oracle.PdaServiceUtils;

public class GetDocItem extends InterfaceLog implements IhttpServiceJosn {
	public ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");
	@Override
	public String exeFunc(HttpCoreService service) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		  try
	      {
			  String TypeSn = StringUtils.toString(service.getParamTo().get("TypeSn"));//单据类型
			  String DocSn = StringUtils.toString(service.getParamTo().get("DocSn"));//组织机构
			  String Flag = StringUtils.toString(service.getParamTo().get("Flag"));
			  String strOrgCode = StringUtils.toString(service.getParamTo().get("strOrgCode"));
			  String jsonStr="";
			  PdaServiceUtils serviceUtils=new PdaServiceUtils();
			  if ("1".equals(Flag)) {
				  List<Map> dataList =serviceUtils.getDocItem_1(TypeSn, DocSn, strOrgCode);
				  
				  if(null==dataList || dataList.size()<=0){
					  jsonStr=PdaBaseServiceUtils.foundNoDocData;
					  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), jsonStr));
				  }
				  else {
					  jsonStr=serviceUtils.MapListToJson(dataList);
					  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
				  }
				  service.setResult(map);
				  
		      }
			  else  if ("2".equals(Flag)) {
				  String sqlStr = "select a.woi_doc_num  单号, b.ci_item_code  品号,\r\n" + 
	            			"b.ci_item_name 品名, b.ci_item_spec   规格,\r\n" + 
	            			"a.woi_plan_num 计划量,  a.woi_out_num 实际量\r\n" + 
	            			"from t_Wms_Outstock_Item a  \r\n" + 
	            			"left join T_CO_ITEM  b on a.woi_item_code = b.ci_item_code and a.data_auth=b.data_auth\r\n" + 
	            			"where a.woi_doc_num=? and a.data_auth=? order by 品号 asc";
	                Object[] params=new Object[] {
	                		DocSn,
	                		strOrgCode
	                };
				  List<Map> dataList = modelService.listDataSql(sqlStr, params);
				 
				  if(null==dataList || dataList.size()<=0){
					  jsonStr=PdaBaseServiceUtils.foundNoDocData;
					  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), jsonStr));
				  }
				  else {
					  jsonStr=serviceUtils.MapListToJson(dataList);
					  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
				  }
				  service.setResult(map);
				  
		      }
			  else  if ("3".equals(Flag)) {
				  
				  if ("DJ07".equals(TypeSn) || "DJ08".equals(TypeSn) || "DJ09".equals(TypeSn)){
					  List<Map> dataList =serviceUtils.getDocItem_DJ07(TypeSn, DocSn, strOrgCode);
						 
					  if(null==dataList || dataList.size()<=0){
						  jsonStr=PdaBaseServiceUtils.foundNoDocData;
						  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), jsonStr));
					  }
					  else {
						  jsonStr=serviceUtils.MapListToJson(dataList);
						  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
					  }
					  service.setResult(map);
				  }else if ("DJ16".equals(TypeSn)){
					  List<Map> dataList =serviceUtils.getDocItem_DJ16(TypeSn, DocSn, strOrgCode);
						 
					  if(null==dataList || dataList.size()<=0){
						  jsonStr=PdaBaseServiceUtils.foundNoDocData;
						  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), jsonStr));
					  }
					  else {
						  jsonStr=serviceUtils.MapListToJson(dataList);
						  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
					  }
					  service.setResult(map);
				  }else if ("DJ17".equals(TypeSn)){
					  
					  String sqlStr = "SELECT T.WII_DOC_NUM 单号,T.WII_ITEM_CODE 品号,A.CI_ITEM_NAME 品名,\r\n" + 
	                			"T.WII_STOCK_NUM 库存数量,T.WII_INVENTORY_NUM 盘点数量,T.WII_PROFIT_NUM 盈亏数量\r\n" + 
	                			"FROM T_WMS_INVENTORY_ITEM T \r\n" + 
	                			"LEFT JOIN T_CO_ITEM A ON T.WII_ITEM_CODE=A.CI_ITEM_CODE and t.data_auth=a.data_auth\r\n" + 
	                			"WHERE T.WII_DOC_NUM=? and t.data_auth=?";
	                    Object[] params=new Object[] {
	                    		DocSn,
	                    		strOrgCode
	                    };
					  List<Map> dataList = modelService.listDataSql(sqlStr,params);
						 
					  if(null==dataList || dataList.size()<=0){
						  jsonStr=PdaBaseServiceUtils.foundNoDocData;
						  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), jsonStr));
					  }
					  else {
						  jsonStr=serviceUtils.MapListToJson(dataList);
						  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
					  }
					  service.setResult(map);
				  }else if ("DJ18".equals(TypeSn)){
					  
					  String sqlStr = "SELECT T.WSD_DOC_NUM 单号,T.WSD_ITEM_CODE 品号,A.CI_ITEM_NAME 品名,\r\n" + 
	                			"T.WSD_SCARP_NUM 报废数量\r\n" + 
	                			"FROM T_WMS_SCARP_DETAIL T \r\n" + 
	                			"LEFT JOIN T_CO_ITEM A ON T.WSD_ITEM_CODE=A.CI_ITEM_CODE and t.data_auth=a.data_auth\r\n" + 
	                			"WHERE T.WSD_DOC_NUM=? and t.data_auth=?";
	                    Object[] params=new Object[] {
	                    		DocSn,
	                    		strOrgCode
	                    };
	                    
					  List<Map> dataList =modelService.listDataSql(sqlStr, params);
						 
					  if(null==dataList || dataList.size()<=0){
						  jsonStr=PdaBaseServiceUtils.foundNoDocData;
						  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), jsonStr));
					  }
					  else {
						  jsonStr=serviceUtils.MapListToJson(dataList);
						  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
					  }
					  service.setResult(map);
				  }else if("DJ19".equals(TypeSn)) {
					  
					  String sqlStr = "SELECT T.WRD_DOC_NUM 复检单号,T.WRD_ITEM_SN 物料SN,T.WRD_DOC_NUM 品号,A.CI_ITEM_NAME 品名,\r\n" + 
	                			"T.WRD_ITEM_NUM 物料数量\r\n" + 
	                			"FROM T_WMS_RECHECK_DETAIL T \r\n" + 
	                			"LEFT JOIN T_CO_ITEM A ON T.WRD_ITEM_CODE=A.CI_ITEM_CODE and t.data_auth=a.data_auth\r\n" + 
	                			"WHERE T.WRD_DOC_NUM =? and t.data_auth=?";
	                    Object[] params=new Object[] {
	                    		DocSn,
	                    		strOrgCode
	                    };
	                    
	                    List<Map> dataList =modelService.listDataSql(sqlStr, params);
						 
					  if(null==dataList || dataList.size()<=0){
						  jsonStr=PdaBaseServiceUtils.foundNoDocData;
						  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), jsonStr));
					  }
					  else {
						  jsonStr=serviceUtils.MapListToJson(dataList);
						  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
					  }
					  service.setResult(map);
				  }
				  else if("DJ20".equals(TypeSn)) {
					  List<Map> dataList =serviceUtils.getDocItem_DJ20(TypeSn,  DocSn, strOrgCode);
						 
					  if(null==dataList || dataList.size()<=0){
						  jsonStr=PdaBaseServiceUtils.foundNoDocData;
						  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), jsonStr));
					  }
					  else {
						  jsonStr=serviceUtils.MapListToJson(dataList);
						  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
					  }
					  service.setResult(map);
				  }
		      }
			  else {
				  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), jsonStr));
			}
			  return null;
			}
			  
	      catch(Exception e)
	      {
	    	  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), e.toString()));
	    	  service.setResult(map);
	          return null;
	      }
	}

}
