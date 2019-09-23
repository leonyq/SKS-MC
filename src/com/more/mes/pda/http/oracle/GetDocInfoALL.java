package com.more.mes.pda.http.oracle;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.common.method.StringUtils;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.pda.service.PdaBaseServiceUtils;
import com.more.mes.pda.service.oracle.PdaServiceUtils;


public class GetDocInfoALL extends InterfaceLog implements IhttpServiceJosn{

	@Override
	public String exeFunc(HttpCoreService service) {
		Map map = new HashMap();
		  try
	      {
			  String TypeSn = StringUtils.toString(service.getParamTo().get("TypeSn"));//单据类型
			  String OCode = StringUtils.toString(service.getParamTo().get("OCode"));//组织机构
			  String DocSn = StringUtils.toString(service.getParamTo().get("DocSn"));//组织机构
			  String SaleSn = StringUtils.toString(service.getParamTo().get("SaleSn"));
			  String StartTime = StringUtils.toString(service.getParamTo().get("StartTime"));
			  String EndTime = StringUtils.toString(service.getParamTo().get("EndTime"));
			  String Flag = StringUtils.toString(service.getParamTo().get("Flag"));
			  String strOrgCode = StringUtils.toString(service.getParamTo().get("strOrgCode"));
			  String jsonStr="";
			  PdaServiceUtils serviceUtils=new PdaServiceUtils();
			  if ("1".equals(Flag)) {
				  List<Map> dataList =serviceUtils.getDocInfoALL_1(TypeSn, OCode, DocSn, SaleSn, StartTime, EndTime, strOrgCode);
				  
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
				  List<Map> dataList =serviceUtils.getDocInfoALL_2(TypeSn, OCode, DocSn, SaleSn, StartTime, EndTime, strOrgCode);
				 
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
					  List<Map> dataList =serviceUtils.getDocInfoALL_DJ07(TypeSn, OCode, DocSn, SaleSn, StartTime, EndTime, strOrgCode);
						 
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
					  List<Map> dataList =serviceUtils.getDocInfoALL_DJ17(TypeSn, OCode, DocSn, SaleSn, StartTime, EndTime, strOrgCode);
						 
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
					  List<Map> dataList =serviceUtils.getDocInfoALL_DJ18(TypeSn, OCode, DocSn, SaleSn, StartTime, EndTime, strOrgCode);
						 
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
					  List<Map> dataList =serviceUtils.getDocInfoALL_DJ19(TypeSn, OCode, DocSn, SaleSn, StartTime, EndTime, strOrgCode);
						 
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
					  List<Map> dataList =serviceUtils.getDocInfoALL_DJ20(TypeSn, OCode, DocSn, SaleSn, StartTime, EndTime, strOrgCode);
						 
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
