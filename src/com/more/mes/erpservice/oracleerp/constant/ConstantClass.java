package com.more.mes.erpservice.oracleerp.constant;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.UsernamePasswordCredentials;
import org.apache.commons.httpclient.auth.AuthScope;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.poi.hssf.usermodel.HSSFBorderFormatting;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.xml.sax.InputSource;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

public abstract class  ConstantClass {

	//erp.szkexin.com.cn ---erp.szkexin.com.cn:8000正式库  erpdev.szkexin.com.cn:8080
	
	public	static final String url="http://erpdev.szkexin.com.cn:8060/webservices/rest/CUXPUBXML/soap_inbound/";
	
	//外协费用
	public static String CUX_MES_OSI="CUX_MES_OSI";
	
	//返写制令单存储过程类型
	public static String MODATA="MODATA";
	
	//返写制令单删除存储过程类型
	public static String MODELETE="MODELETE";
	
	//返写制令单
	public static String CUX_MES_PRODUCTION_INSTRUCTION_IFACE="CUX_MES_PRODUCTION_INSTRUCTION_IFACE";
	
	//取消发货存储过程类型
	public static String CANCELOUT="CANCELOUT";
	
	//取消发货
	public static String MES_TO_ERP_SO_CANCEL="MES_TO_ERP_SO_CANCEL";
	
	//销售出库
	public static String MES_TO_ERP_SO_SHIPPED="MES_TO_ERP_SO_SHIPPED";
	
	//销售退
	public static String MES_TO_ERP_SO_RETURN="MES_TO_ERP_SO_RETURN";
	
	//销售退存储过程类型
	public static String INSALE="INSALE";
	
	//销售出库存储过程类型
	public static String OUTSALE="OUTSALE";
	
	//生产领退料
	public static String CUX_MES_IPI="CUX_MES_IPI";
	
	//生产退料 存储过程类型
	public static String INPRODUCTION="INPRODUCTION";
	
	//生产领料存储过程类型
	public static String OUTPRODUCTION="OUTPRODUCTION";
	
	//其它出和入
	public static  String PUT_IN_OUT="CUX_MES_OTHER_INV_TRX";
	
	//其他出存储过程类型
	public static String OTHEREXITING = "OTHEREXITING";
	
	//采购入
	public static String PUT_IN_DOC="CUX_MES_PO_RCV"; 
	
	//其他入存储过程类型
	public static String OTHERSTORAGE="OTHERSTORAGE";
	
	//采购入存储过程类型
	public static String  PURCHASE="PURCHASE";
	
	//采购退
	public static String CUX_MES_PO_RETURN="CUX_MES_PO_RETURN";
	
	//采购退存储过程类型
	public static String PURCHASERETURN="PURCHASERETURN";
	
	//完工入存储过程类型
	public static String COMPLETED="COMPLETED";
	
	//完工入
	public static String CUX_WIP_COMPLT="CUX_WIP_COMPLT";
	
	//调拨存储过程
	public static String ALLOT="ALLOT";
	
	//调拨
	public static String CUX_MES_OTHER_INV_TRX="CUX_MES_OTHER_INV_TRX";
	
	//map集合转xml
 	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static String toHttpXml(List<Map> list,String type,String uuid){
		StringBuffer xml=new StringBuffer();
		
		xml.append("<Input xmlns:ns=\"http://xmlns.oracle.com/apps/cux/soaprovider/plsql/rest/cux_pub_xml_soap_pub/\">\n");
		xml.append(" <RESTHeader xmlns:ns1=\"http://xmlns.oracle.com/apps/cux/soaprovider/plsql/rest/header/\">\n");
		xml.append("  <Responsibility>CUX</Responsibility>\n");
		xml.append("  <RespApplication>CUX</RespApplication>\n");
		xml.append("  <SecurityGroup>STANDARD</SecurityGroup>\n");
		xml.append("  <NLSLanguage>SIMPLIFIED CHINESE</NLSLanguage>\n");
		xml.append("  <Org_Id/>\n");
		xml.append(" </RESTHeader>\n");
		xml.append("  <InputParameters>\n");
		xml.append("    <P_TRANSFER_DATA>\n");
		xml.append("   <![CDATA[<HEADER_TAB>\n");
		
		for (int i = 0; i < list.size(); i++) {
			xml.append("             <LINE_ITEM_TAB>\n");
			Iterator<Map.Entry<String, Object>> entries = list.get(i).entrySet().iterator();
			while (entries.hasNext()) { 
				  Map.Entry<String, Object> entry = entries.next(); 
				
				  if(entry.getKey().equals("SOURCE_BATCH")){
					  
					  if(entry.getValue()==null||entry.getValue().equals("")||entry.getValue().equals("null")){
							
						  entry.setValue(uuid);
						  
						}
					  
				  }
				if(entry.getValue()==null||entry.getValue().equals("")){
					xml.append("             <");
					xml.append(entry.getKey().toUpperCase()); 
					xml.append(">");
                    xml.append("</");
					xml.append(entry.getKey().toUpperCase());
					xml.append(">\n");
				}else{
					xml.append("             <");
					xml.append(entry.getKey().toUpperCase()); 
					xml.append(">");
					xml.append(entry.getValue());
					xml.append("</");
					xml.append(entry.getKey().toUpperCase());
					xml.append(">\n");
					}
				}
				xml.append("             </LINE_ITEM_TAB>\n");
			
		}
		
		xml.append("             </HEADER_TAB>\n");
		xml.append("             ]]>\n");
		xml.append("    </P_TRANSFER_DATA>\n");
		xml.append("    <P_SYSTEM_CODE>MES</P_SYSTEM_CODE>\n");
		xml.append("    <P_INTERFACE_CODE>");
		xml.append(String.valueOf(type));
		xml.append("</P_INTERFACE_CODE>\n");
		xml.append("    </InputParameters>\n");
		xml.append("    </Input>");
		return String.valueOf(xml);
	}
	
public static  String xmlPost(String url,String xml){
	 String res = null;
		try {
		HttpClient client = new HttpClient();
		client.getState().setCredentials(AuthScope.ANY,
				new UsernamePasswordCredentials("ASADMIN", "asadmin"));
		
		PostMethod method=new PostMethod(url);
		method.setRequestHeader("Content-Type",
				"application/xml;charset=utf-8;action=\"lookup_desc_query\"");
		method.setRequestHeader("Host", " erptest.szkexin.com.cn:8008");
		method.setRequestHeader("Accept-Encoding", "gzip,deflate");
		method.setRequestHeader("Connection", "Keep-Alive");
		method.setRequestHeader("User-Agent",
				"Apache-HttpClient/4.1.1 (java 1.5)");
		StringRequestEntity requestEntity=new StringRequestEntity(xml, "application/xml", "UTF-8");
		method.setRequestEntity(requestEntity);
		
//		int code = client.executeMethod(method);
//		String result = method.getResponseBodyAsString();
//		String str = result.substring(result.indexOf("<X_RETURN_STATUS>") + 17,
//		result.indexOf("</X_RETURN_STATUS>"));
		
		//InputStream body=this.getClass().getResourceAsStream("/"+xml);  
		//method.setRequestBody(body);  
//            myPost.setRequestEntity(new StringRequestEntity(xmlString,"text/xml","utf-8"));     
       int statusCode = client.executeMethod(method);    
        if(statusCode == HttpStatus.SC_OK){    
            BufferedInputStream bis = new BufferedInputStream(method.getResponseBodyAsStream());    
            byte[] bytes = new byte[1024];    
           ByteArrayOutputStream bos = new ByteArrayOutputStream();    
            int count = 0;    
            while((count = bis.read(bytes))!= -1){    
               bos.write(bytes, 0, count);    
           }    
           byte[] strByte = bos.toByteArray();    
         String  responseString = new String(strByte,0,strByte.length,"utf-8");  
          res=responseString.replace("&lt;", "<" + ""); 
            bos.close();    
            bis.close(); 
       }    
		
        return res;
		} catch (Exception e) {
			
			return "error";
			
		}
	}
	

@SuppressWarnings({ "unchecked", "rawtypes" })
	public static Map<String,Object> mesSyncFromErp(ModelService modelService
			 ,String wriDocNum,String userId,String objectType,String MesId,String xmlType,String whereIn){
		 
		 
		 String xml="";
		 
		 String returnStr="";
		 
		 Map<String,Object> returnMap = new HashMap<String,Object>();
		 
		 if(StringUtils.isEmpty(wriDocNum)){
			 
			 returnMap.put("isSuccess", "N");
			 
			 returnMap.put("errorMsg","无单号信息");
			 
			 return returnMap;
		 }
		 
		 
		 String pMesId=MesId;
			
			
			try {
			ProFuncDto pf = new ProFuncDto();
			
			int[] inPlace = {1, 2, 3, 4};
			
		    int[] outplace = {5, 6};
		    
		    List<Object> list = new ArrayList<Object>();
		    
		    List<Object> outType = new ArrayList<Object>();
		    
		    //对象名
		    list.add(objectType);
		    list.add(wriDocNum);
		    list.add(userId);
		    list.add(whereIn);
		    outType.add("String");
		    outType.add("String");
		    pf.setClassName("P_MESTOERP_DATA");//mes到erp得回写
		    pf.setInPlace(inPlace);//存储过程中in 
		    pf.setOutPlace(outplace); //存储过程中out
		    pf.setValArgs(list);//存储过程中输入的参数
		    pf.setTotalLen(list.size()+outType.size());//总个数
		    pf.setOutValType(outType);//输出的参数
		    List<Object> relist = modelService.procComm(pf);//接收返回值
		    String res = (String) relist.get(1);  //结果
		    
		    if(!res.equals("OK")){
		    	
		    	returnMap.put("isSuccess", "N");
				 
				returnMap.put("errorMsg",res);
				 
				return returnMap;
				
		    }else{
		    	
		    	List<Map> returnList=modelService.listDataSql(String.valueOf(relist.get(0)), new Object[]{});
		    	
		    	
		    	
		    	if(returnList.size()==0){
			    	
			    	returnMap.put("isSuccess", "N");
					 
					returnMap.put("errorMsg","无回传信息");
					 
					return returnMap;
			    	
		    	}else{
		    		
		    		
		    		//组合报文
		    		 xml=ConstantClass.toHttpXml(returnList,xmlType,pMesId);
		    		
		    		//回传报文信息
		    		 returnStr=ConstantClass.xmlPost(ConstantClass.url, xml);
		    	}
		    }
		    
		  } catch (Exception e) {
		    		
		    		returnMap.put("isSuccess", "N");
					 
					returnMap.put("errorMsg",e.toString());
					 
					return returnMap;
		        	
		   }
			
			returnMap.put("isSuccess", "Y");
			
			returnMap.put("xml",xml);
			
			returnMap.put("returnStr",returnStr);
			
			return returnMap;
	 }
	public static  boolean isXmlDocument(String rtnMsg){
	 
		boolean flag = true;
		
		try {
			DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = documentBuilderFactory.newDocumentBuilder();
			builder.parse( new InputSource( new StringReader( rtnMsg )));
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}
	@SuppressWarnings("rawtypes")
	public static Map<String,Object> parsingXml(String xml){

		Map<String,Object> returnMap=new HashMap<String, Object>();
		
		Map<String,Object> poBaseMap;

		List<Map> list=new ArrayList<Map>();

			try {
				//解析回传报文
				Document document = null;
	  
				document = DocumentHelper.parseText(xml);
	  
				Element bookStore = document.getRootElement();
	      
				Iterator it = bookStore.elementIterator();
	      
					while (it.hasNext()) {
	    	  
						Element book = (Element) it.next();
          
						Iterator itt = book.elementIterator();
   
						//节点名称
						String elDateName=book.getName();
          
						//DATE节点
						if(elDateName.equals("DATA")||elDateName.equals("LINE_ITEM_TAB")){
        	
							poBaseMap = new HashMap<String, Object>();
   	  
							while (itt.hasNext()) {
   		  
								Element bookChild = (Element) itt.next();
              
								//节点名称
								String elName=bookChild.getName();
              
								//节点值
								String dataStr=bookChild.getStringValue();
              
								poBaseMap.put(elName, dataStr);
							}  
   	  
							list.add(poBaseMap);
						}
					}		
					returnMap.put("list", list);
					} catch (Exception e) {
						returnMap.put("isSuccess", "N");
						returnMap.put("errprMsg", e.toString());
						return returnMap;
					}
	
				returnMap.put("isSuccess", "Y");
	
				return returnMap;
	
	}
	
	
	
	@SuppressWarnings("unchecked")
	public static List<Map> getDetailIdList(ModelService modelService ,String objectType,String wriDocNum,String userId){
		
		
		List<Map> returnList=null;
		
		try{
		ProFuncDto pf = new ProFuncDto();
		
		int[] inPlace = {1, 2, 3};
		
	    int[] outplace = {4, 5};
	    
	    List<Object> list = new ArrayList<Object>();
	    
	    List<Object> outType = new ArrayList<Object>();
		//对象名
	    list.add(objectType);
	    list.add(wriDocNum);
	    list.add(userId);
	    outType.add("String");
	    outType.add("String");
	    pf.setClassName("P_MESTOERP_DATA");//mes到erp得回写
	    pf.setInPlace(inPlace);//存储过程中in 
	    pf.setOutPlace(outplace); //存储过程中out
	    pf.setValArgs(list);//存储过程中输入的参数
	    pf.setTotalLen(list.size()+outType.size());//总个数
	    pf.setOutValType(outType);//输出的参数
	    List<Object> relist = modelService.procComm(pf);//接收返回值
	    String res = (String) relist.get(1);  //结果
	    
	    if(!res.equals("OK")){
	    	
	    	
			 
			return null;
			
	    }else{
	    	
	    	returnList=modelService.listDataSql(String.valueOf(relist.get(0)), new Object[]{});
	    	

	    }
	    
	  } catch (Exception e) {
		  
	    	
		  
		  return null;
		  
		  
	   }
		
		return returnList;
		
	}
	
	
	
	@SuppressWarnings("unchecked")
	public static Map<Object,Object> getDetailIdMap(TableDataMapExt update,ModelService modelService, String uuid, String type ,String wriDocNum){
		
		Map<Object,Object> map = new HashMap<Object,Object>(); 
		
		
		List<Map> returnList=null;
		
				if(type.equals("OTHEREXITING")||type.equals("PURCHASERETURN")||type.equals("OUTSALE")||type.equals("OUTPRODUCTION")){
					
					String sql="select * from (SELECT * FROM T_WMS_OUTSTOCK_DETAIL WHERE WOD_DOC_NUM=?  AND  (WOD_UPLOAD_FLAG='N' OR WOD_UPLOAD_FLAG IS NULL) AND WOD_HANDOVER_EMP IS NOT NULL order by WOD_ITEM_CODE asc) where  ROWNUM<=20 ";
					
					returnList=modelService.listDataSql(sql, new Object[]{wriDocNum});
					
					String whereIn="";
					
					for (int i = 0; i < returnList.size(); i++) {
						
						if(returnList.size()-1==i){
							
							whereIn+="'"+String.valueOf(returnList.get(i).get("ID"))+"'";
							
						}else{
							
							whereIn+="'"+String.valueOf(returnList.get(i).get("ID"))+"'"+",";
							
						}
						
						
						//如果不存在mesid 更新指定mesid
						if(returnList.get(i).get("P_MES_ID")==null||returnList.get(i).get("P_MES_ID").equals("null")||returnList.get(i).get("P_MES_ID").equals("")){
							
							update=new TableDataMapExt();
							
							update.setTableName("T_WMS_OUTSTOCK_DETAIL");
							
							update.setSqlWhere(" and ID = '"+returnList.get(i).get("ID")+"' ");
							
							update.getColMap().put("P_MES_ID", uuid);
							
							modelService.edit(update);
						}
						
						
					}
					
				
					map.put("list", returnList);
					
					map.put("whereIn", whereIn);
					
					return map;
					
						
						
					
					
						} else if(type.equals("ALLOT")){
							
							String sql="select * from (SELECT * FROM T_WMS_ALLOT_DETAIL WHERE WAD_DOC_NUM=? AND  (WAD_UPLOAD_FLAG='N' OR WAD_UPLOAD_FLAG IS NULL) AND WAD_HANDOVER_EMP IS NOT NULL order by WAD_ITEM_CODE asc) where ROWNUM<=30 ";
							
							returnList=modelService.listDataSql(sql, new Object[]{wriDocNum});
							
							String whereIn="";
							
							for (int i = 0; i < returnList.size(); i++) {
								
								if(returnList.size()-1==i){
									
									whereIn+="'"+String.valueOf(returnList.get(i).get("ID"))+"'";
									
								}else{
									
									whereIn+="'"+String.valueOf(returnList.get(i).get("ID"))+"'"+",";
									
								}
								
								
								//如果不存在mesid 更新指定mesid
								if(returnList.get(i).get("P_MES_ID")==null||returnList.get(i).get("P_MES_ID").equals("null")||returnList.get(i).get("P_MES_ID").equals("")){
									
									update=new TableDataMapExt();
									
									update.setTableName("T_WMS_ALLOT_DETAIL");
									
									update.setSqlWhere(" and ID = '"+returnList.get(i).get("ID")+"' ");
									
									update.getColMap().put("P_MES_ID", uuid);
									
									modelService.edit(update);
								}
								
								
							}
							
						
							map.put("list", returnList);
							
							map.put("whereIn", whereIn);
							
							return map;
							
							
							
						}else if(type.equals("CANCELOUT")){
							
							String sql="select * from (SELECT * FROM T_WMS_OUTSTOCK_DETAIL_CANCEL WHERE WOD_DOC_NUM=? AND  (WOD_UPLOAD_FLAG='N' OR WOD_UPLOAD_FLAG IS NULL) order by WOD_ITEM_CODE asc) where ROWNUM<=30 ";
							
							returnList=modelService.listDataSql(sql, new Object[]{wriDocNum});
							
							String whereIn="";
							
							for (int i = 0; i < returnList.size(); i++) {
								
								if(returnList.size()-1==i){
									
									whereIn+="'"+String.valueOf(returnList.get(i).get("ID"))+"'";
									
								}else{
									
									whereIn+="'"+String.valueOf(returnList.get(i).get("ID"))+"'"+",";
									
								}
								//如果不存在mesid 更新指定mesid
								if(returnList.get(i).get("P_MES_ID")==null||returnList.get(i).get("P_MES_ID").equals("null")||returnList.get(i).get("P_MES_ID").equals("")){
									
									update=new TableDataMapExt();
									
									update.setTableName("T_WMS_OUTSTOCK_DETAIL_CANCEL");
									
									update.setSqlWhere(" and ID = '"+returnList.get(i).get("ID")+"' ");
									
									update.getColMap().put("P_MES_ID", uuid);
									
									modelService.edit(update);
								}
								
								
							}
							
						
							map.put("list", returnList);
							
							map.put("whereIn", whereIn);
							
							return map;
							
							
							
						}else{
						
							
							
							String sql="select * from (SELECT * FROM T_WMS_RECEIVE_DETAIL WHERE WRD_DOC_NUM=? AND  (WRD_UPLOAD_FLAG='N' OR WRD_UPLOAD_FLAG IS NULL) AND WRD_KW_CODE IS NOT NULL order by WRD_ITEM_CODE asc) where  ROWNUM<=30 ";
							
							returnList=modelService.listDataSql(sql, new Object[]{wriDocNum});
							
							String whereIn="";
							
							for (int i = 0; i < returnList.size(); i++) {
								
								if(returnList.size()-1==i){
									
									whereIn+="'"+String.valueOf(returnList.get(i).get("ID"))+"'";
									
								}else{
									
									whereIn+="'"+String.valueOf(returnList.get(i).get("ID"))+"'"+",";
									
								}
								
								
								//如果不存在mesid 更新指定mesid
								if(returnList.get(i).get("P_MES_ID")==null||returnList.get(i).get("P_MES_ID").equals("null")||returnList.get(i).get("P_MES_ID").equals("")){
									
									update=new TableDataMapExt();
									
									update.setTableName("T_WMS_RECEIVE_DETAIL");
									
									update.setSqlWhere(" and ID = '"+returnList.get(i).get("ID")+"' ");
									
									update.getColMap().put("P_MES_ID", uuid);
									
									modelService.edit(update);
								}
								
								
							}
							
						
							map.put("list", returnList);
							
							map.put("whereIn", whereIn);
							
							return map;
							
						}
		
		
		
	}
	
	
	 public static String getSqlStr(){
		  
		  String sql = "SELECT DISTINCT C.*,B.WSI_ITEM_NUM,NVL(D.MEI_ITEM_COUNT, 0) MEI_ITEM_COUNT,NVL(E.WOI_OUT_NUM ,0) WOI_OUT_NUM,"+
	              "NVL(F.WRI_RECEIVE_NUM,0)WRI_RECEIVE_NUM ,(c.PRODUCT_COUNT*c.CMD_POINT_NUM) as plan_SUM_NUM,c.PRODUCT_COUNT,nvl(E.WOD_OUT_PCS,0) as WOD_OUT_PCS  FROM (SELECT A.* FROM ( SELECT T1.PROJECT_ID PROJECT_ID, " 
	              + " T1.CUST_CODE,  "
	              + " T.CBD_ITEM_CODE CMD_ITEM_CODE,  "
	              + " T4.CI_ITEM_NAME,  "
	              + " sum(T1.PRODUCT_COUNT) as PRODUCT_COUNT , "
	              + " T4.CI_ITEM_SPEC,  "
	              + " T.ITEM_VERSION,  "
	              + " T.CBD_UNITS,  "
	              + " SUM(T.CBD_ITEM_NUM) CMD_POINT_NUM  "
	              + " FROM T_PM_PROJECT_DETAIL T LEFT JOIN T_CO_ITEM T4  "
	              + " ON T.CBD_ITEM_CODE = T4.CI_ITEM_CODE and T.DATA_AUTH=T4.DATA_AUTH "
	              + " LEFT JOIN T_PM_PROJECT_BASE T1   ON T.PROJECT_ID = T1.PROJECT_ID ";
		  
		  return sql;
		  
	  }
	 
	 public static String getSqlWhere(){
		 
		 String sqlWhere="";
		 	sqlWhere += " GROUP BY T.ITEM_VERSION,T.CBD_UNITS, T1.PROJECT_ID ,T1.CUST_CODE,T.CBD_ITEM_CODE,T4.CI_ITEM_NAME,T4.CI_ITEM_SPEC) A ) C  ";
	        sqlWhere += " LEFT JOIN (SELECT T6.WSI_ITEM_CODE, SUM(T6.WSI_ITEM_NUM) WSI_ITEM_NUM FROM T_WMS_STOCK_INFO T6  GROUP BY T6.WSI_ITEM_CODE) B ";
	        sqlWhere += " ON C.CMD_ITEM_CODE = B.WSI_ITEM_CODE ";
	        sqlWhere += " LEFT JOIN T_MID_EXCEED_ITEM_INFO D  ON C.CMD_ITEM_CODE = D.MEI_ITEM_CODE " +
	        		" left join (select nvl(sum(T1.WOD_OUT_PCS),0) as WOD_OUT_PCS,  t.woi_connect_doc,t.woi_item_code,nvl(sum(t.WOI_PLAN_NUM),0) WOI_OUT_NUM from t_wms_outstock_item t left join t_wms_outstock_doc t1 on t1.wod_doc_num=t.woi_doc_num where t1.wod_doc_type='DJ10' group by t.woi_item_code,t.woi_connect_doc) E on E.woi_connect_doc=C.PROJECT_ID  and e.woi_item_code=C.CMD_ITEM_CODE " +
	                " left join (select t.wri_connect_doc,t.wri_item_code,nvl(sum(t.WRI_PLAN_NUM),0) Wri_Receive_Num from t_wms_receive_item t  left join t_wms_receive_doc T1 on t1.wrd_doc_num=t.wri_doc_num where t1.WRD_DOC_TYPE='DJ03' group by t.wri_connect_doc,t.wri_item_code) F on f.wri_connect_doc=C.PROJECT_ID and f.wri_item_code= C.CMD_ITEM_CODE ";
	        
	        return sqlWhere;
		 
	 }
	 
	 
	 
// 	 @SuppressWarnings({ "unchecked", "unused", "rawtypes" })
// 	public static String OutStockExc(ModelService modelService,ModelAction modelAction,String sql){
		 
		 
// 		    HttpServletResponse response = ServletActionContext.getResponse();
// 		    String dateStr =  DateUtil.getCurDateStr();//当前时间
		    
// 		    int sheetNum=50000;
		    
// 		    int sheetCalculate=0;
		    
// 		    int sheetPaging=0;
		    
		    
// 		    try
// 		    {
		    	
// 		            List<Map> list=modelService.listDataSql(sql, new Object[] {});
// 		            int totalSize = 0;
// 		            if(list!=null && list.size()>0){
// 		            	totalSize = list.size();
// 		            }
// 		  //图片
// 		    BufferedImage bufferImg = null;//图片一 
// 		//    String imgSrc = request.getParameter("imgsrc");
// 		    String path = modelAction.getRequest().getSession().getServletContext().getRealPath("/").replace("fywms", "");
// 		    //File picFile = new File(path+"fywms\\res\\updoc\\buss\\ei\\fywms\\image\\fywms_title.png");
// 		//    String fname = picFile.getName();
// 		//    // 先把读进来的图片放到一个ByteArrayOutputStream中，以便产生ByteArray  
// 		//    ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream(); 
// 		//    try
// 		//    {
// 		//      
// 		//      bufferImg = ImageIO.read(picFile);
// 		//      ImageIO.write(bufferImg, "png", byteArrayOut); 
// 		//    }
// 		//    catch (IOException e1)
// 		//    {
// 		//      throw new BussException(CommMethod.getText("图片转换出错"));
// 		//    }  
// 		    //导出模块
// 		    // 创建HSSFWorkbook对象(excel的文档对象)
// 		    HSSFWorkbook wkb = new HSSFWorkbook();
// 		    // 样式设置
// 		    // 设置字体
// 		    HSSFFont headfont = wkb.createFont();
// 		    headfont.setFontName("黑体");
// 		    headfont.setFontHeightInPoints((short)11);// 字体大小
// 		    headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);// 加粗
// 		    // 另一个样式
// 		    HSSFCellStyle headstyle = wkb.createCellStyle();
// 		    headstyle.setFont(headfont);
// 		    headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
// 		    headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
// 		    //headstyle.setLocked(true);
// 		   // headstyle.setWrapText(true);// 自动换行
// 		    // 另一个字体样式
// 		    HSSFFont columnHeadFont = wkb.createFont();
// 		    columnHeadFont.setFontName("宋体");
// 		    columnHeadFont.setFontHeightInPoints((short)10);
// 		    columnHeadFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
// 		    // 列头的样式
// 		    HSSFCellStyle columnHeadStyle = wkb.createCellStyle();
// 		    //设置背景色
// 		    columnHeadStyle.setFillBackgroundColor(HSSFColor.BLUE.index);
// 		    columnHeadStyle.setFont(columnHeadFont);
// 		    columnHeadStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
// 		    columnHeadStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
// 		  //  columnHeadStyle.setLocked(true);
// 		  //  columnHeadStyle.setWrapText(true);
// 		    columnHeadStyle.setLeftBorderColor(HSSFColor.BLACK.index);// 左边框的颜色
// 		    columnHeadStyle.setBorderLeft((short)1);// 边框的大小
// 		    columnHeadStyle.setRightBorderColor(HSSFColor.BLACK.index);// 右边框的颜色
// 		    columnHeadStyle.setBorderRight((short)1);// 边框的大小
// 		    columnHeadStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体
// 		    columnHeadStyle.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色
// 		    // 设置单元格的背景颜色（单元格的样式会覆盖列或行的样式）
// 		    columnHeadStyle.setFillForegroundColor(HSSFColor.WHITE.index);
		
// 		    HSSFFont font = wkb.createFont();
// 		    font.setFontName("宋体");
// 		    font.setFontHeightInPoints((short)10);
// 		    //数字单元格样式
// 		    HSSFCellStyle cellStyle = wkb.createCellStyle();  
// 		    cellStyle.setDataFormat( HSSFDataFormat.getBuiltinFormat("#.##0"));
// 		    // 普通单元格样式
// 		    HSSFCellStyle style = wkb.createCellStyle();
// 		    style.setFont(font);
// 		    style.setAlignment(HSSFCellStyle.ALIGN_LEFT);// 左右居中
// 		    style.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);// 上下居中
// 		    style.setWrapText(true);
// 		    style.setLeftBorderColor(HSSFColor.BLACK.index);
// 		    style.setBorderLeft((short)1);
// 		    style.setRightBorderColor(HSSFColor.BLACK.index);
// 		    style.setBorderRight((short)1);
// 		    style.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体
// 		    style.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色．
// 		    style.setFillForegroundColor(HSSFColor.WHITE.index);// 设置单元格的背景颜色．
// 		    // 另一个样式
// 		    HSSFCellStyle centerstyle = wkb.createCellStyle();
// 		    centerstyle.setFont(font);
// 		    centerstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
// 		    centerstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
// 		    centerstyle.setWrapText(true);
// 		    centerstyle.setLeftBorderColor(HSSFColor.BLACK.index);
// 		    centerstyle.setBorderLeft((short)1);
// 		    centerstyle.setRightBorderColor(HSSFColor.BLACK.index);
// 		    centerstyle.setBorderRight((short)1);
// 		    centerstyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体
// 		    centerstyle.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色．
// 		    centerstyle.setFillForegroundColor(HSSFColor.WHITE.index);// 设置单元格的背景颜色．
// 		    // 建立新的sheet对象（excel的表单）
// 		    HSSFSheet sheet=null;
		    
// 		    //写入内容
// 		      for(int i=0;i<list.size();i++){
		      	
		      	
		      	
// 		      	if(sheetCalculate==sheetNum||sheetCalculate==0){
		      		
// 		      		sheetPaging++;
		      		
// 		      		// 建立新的sheet对象（excel的表单）
// 		      	    sheet = wkb.createSheet("物料信息"+sheetPaging);
// 		      	    // 在sheet里创建第一行，参数为行索引(excel的行)，可以是0～65535之间的任何一个
// 		      	   // sheet.addMergedRegion(new CellRangeAddress(5, 5, 0, 12));  
// 		      	    //sheet.addMergedRegion(new CellRangeAddress(4, 4, 0, 12));
		      	    
// 		      	    //开始创建4行单元格
		      	    
		      	    
		      	    
// 		      	    HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
// 		      	    HSSFClientAnchor anchor = new HSSFClientAnchor(0,2 , 255, 255,(short) 2, 0, (short) 5, 3);
// 		      	    anchor.setAnchorType(3);     
// 		      	    //插入图片    
// 		      	   // patriarch.createPicture(anchor, wkb.addPicture(byteArrayOut.toByteArray(), HSSFWorkbook.PICTURE_TYPE_JPEG));
// 		      	    // 设置列宽    
// 		      	    sheet.setColumnWidth(0, 4000);    
// 		      	    sheet.setColumnWidth(1, 13500);    
// 		      	    sheet.setColumnWidth(2, 2500);    
// 		      	    sheet.setColumnWidth(3, 2500);    
// 		      	    sheet.setColumnWidth(4, 2500);    
// 		      	    sheet.setColumnWidth(5, 2500);    
// 		      	    sheet.setColumnWidth(6, 2500);    
// 		      	    sheet.setColumnWidth(7, 2500);   
// 		      	    sheet.setColumnWidth(8, 2500); 
// 		      	    sheet.setColumnWidth(9, 2500); 
// 		      	    sheet.setColumnWidth(10, 2500); 
// 		      	    sheet.setColumnWidth(11, 5000); 
// 		      	    sheet.setColumnWidth(12,5000); 
// 		      	    sheet.setColumnWidth(13,4000); 
// 		      	    sheet.setColumnWidth(14,3500); 
// 		      	    sheet.setColumnWidth(15,4000); 
// 		      	    sheet.setColumnWidth(16,12000); 
// 		      	    sheet.setColumnWidth(17,4000); 
// 		      	    sheet.setColumnWidth(18,4000); 
// 		      	    sheet.setColumnWidth(19,4000);
// 		      	    sheet.setColumnWidth(20,4000);
// 		      	    //列名创建
// 		      	    HSSFRow row2 = sheet.createRow(0);
// 		      	    HSSFRow row17 = sheet.createRow(1);
// //		      	    HSSFRow row4 = sheet.createRow(2);
// //		      	    HSSFRow row5 = sheet.createRow(3);;
// 		      	    HSSFCell cell20 = row2.createCell(0);//不单独建立cell,添加的样式会不生效
// 		      	    HSSFCell cell21 = row2.createCell(1);
// 		      	    HSSFCell cell22 = row2.createCell(2);
// 		      	    HSSFCell cell23 = row2.createCell(3);
// 		      	    HSSFCell cell24 = row2.createCell(4);
// 		      	    HSSFCell cell25 = row2.createCell(5);
// 		      	    HSSFCell cell26 = row2.createCell(6);
// 		      	    HSSFCell cell27 = row2.createCell(7);
// 		      	    HSSFCell cell28 = row2.createCell(8);
// 		      	    HSSFCell cell29 = row2.createCell(9);
// 		      	    HSSFCell cell210 = row2.createCell(10);
// 		      	    HSSFCell cell211 = row2.createCell(11);
// 		      	    HSSFCell cell212 = row2.createCell(12);
// 		      	    HSSFCell cell213 = row2.createCell(13);
// 		      	    cell20.setCellValue("出库单号");
// 		      	    cell20.setCellStyle(columnHeadStyle);
// 		      	    cell21.setCellValue("物料料号");
// 		      	    cell21.setCellStyle(columnHeadStyle);
// 		      	    cell22.setCellValue("版本号");
// 		      	    cell22.setCellStyle(columnHeadStyle);
// 		      	    cell23.setCellValue("物料名称");
// 		      	    cell23.setCellStyle(columnHeadStyle);
// 		      	    cell24.setCellValue("紧急标志");
// 		      	    cell24.setCellStyle(columnHeadStyle);
// 		      	    cell25.setCellValue("物料状态");
// 		      	    cell25.setCellStyle(columnHeadStyle);
// 		      	    cell26.setCellValue("计划数量");
// 		      	    cell26.setCellStyle(columnHeadStyle);
// 		      	    cell27.setCellValue("计量单位");
// 		      	    cell27.setCellStyle(columnHeadStyle);
// 		      	    cell28.setCellValue("出库数量");
// 		      	    cell28.setCellStyle(columnHeadStyle);
// 		      	    cell29.setCellValue("关联单号");
// 		      	    cell29.setCellStyle(columnHeadStyle);
// 		      	    cell210.setCellValue("仓库");
// 		      	    cell210.setCellStyle(columnHeadStyle);
// 		      	    cell211.setCellValue("开单人");
// 		      	    cell211.setCellStyle(columnHeadStyle);
// 		      	    cell212.setCellValue("开单时间");
// 		      	    cell212.setCellStyle(columnHeadStyle);
		      	    
		      	    
// 		      	    sheetCalculate=0;
// 		      	}
// 		      	sheetCalculate++;
		      
		      
// 		        HSSFRow row3 = sheet.createRow(sheetCalculate); 
// 		        HSSFCell cell30 = row3.createCell(0);//不单独建立cell,添加的样式会不生效
// 		        HSSFCell cell31 = row3.createCell(1);
// 		        HSSFCell cell32 = row3.createCell(2);
// 		        HSSFCell cell33 = row3.createCell(3);
// 		        HSSFCell cell34 = row3.createCell(4);
// 		        HSSFCell cell35 = row3.createCell(5);
// 		        HSSFCell cell36 = row3.createCell(6);
// 		        HSSFCell cell37 = row3.createCell(7);
// 		        HSSFCell cell38 = row3.createCell(8);
// 		        HSSFCell cell39 = row3.createCell(9);
// 		        HSSFCell cell310 = row3.createCell(10);
// 		        HSSFCell cell311 = row3.createCell(11);
// 		        HSSFCell cell312 = row3.createCell(12);
// 		        HSSFCell cell313 = row3.createCell(13);
// 		        cell30.setCellValue(String.valueOf(list.get(i).get("WOI_DOC_NUM")));
// 		        cell30.setCellStyle(cellStyle);
// 		        cell31.setCellValue(String.valueOf(list.get(i).get("WOI_ITEM_CODE")));
// 		        cell31.setCellStyle(cellStyle);
// 		        cell32.setCellValue(String.valueOf(list.get(i).get("ITEM_VERSION")));
// 		        cell32.setCellStyle(cellStyle);
// 		        cell33.setCellValue(String.valueOf(list.get(i).get("WOI_ITEM_NAME")));
// 		        cell33.setCellStyle(cellStyle);
// 		        cell34.setCellValue(String.valueOf(list.get(i).get("WOD_URGENT_FLAG")));
// 		        cell34.setCellStyle(cellStyle);
// 		        cell35.setCellValue(String.valueOf(list.get(i).get("WOI_STATUS")));
// 		        cell35.setCellStyle(cellStyle);
// 		        cell36.setCellValue(Double.parseDouble(String.valueOf(list.get(i).get("WOI_PLAN_NUM"))));
// 		        cell36.setCellStyle(cellStyle);
// 		        cell37.setCellValue(String.valueOf(list.get(i).get("WOD_PLAN_UNIT")));
// 		        cell37.setCellStyle(cellStyle);
// 		        cell38.setCellValue(Double.parseDouble(String.valueOf(list.get(i).get("WOI_OUT_NUM"))));
// 		        cell38.setCellStyle(cellStyle);
// 		        cell39.setCellValue(String.valueOf(list.get(i).get("WOI_CONNECT_DOC")));
// 		        cell39.setCellStyle(cellStyle);
// 		        cell310.setCellValue(String.valueOf(list.get(i).get("WOI_WH_CODE")));
// 		        cell310.setCellStyle(cellStyle);
// 		        cell311.setCellValue(String.valueOf(list.get(i).get("NAME")));
// 		        cell311.setCellStyle(cellStyle);
// 		        cell312.setCellValue(String.valueOf(list.get(i).get("CREATE_TIME")));
// 		        cell312.setCellStyle(cellStyle);
		        
// 		      }
		      
// 		        String fileName = new String("物料信息".getBytes(),"ISO-8859-1");
// 		        //
// 		        OutputStream output = response.getOutputStream();
// 		        response.reset();
// 		        response.setHeader("Content-disposition", "attachment; filename="+dateStr+fileName+".xls");
		        
// 		        response.setContentType("application/msexcel");
// 		        wkb.write(output);
// 		        output.close();
		
// 		    }
// 		    catch (Exception e)
// 		    {
// 		      throw new BussException(e.toString());
// 		    }
		    
// 		    return null;
		 
// 	 }
@SuppressWarnings({ "unchecked", "unused", "rawtypes" })
	public static String OutStockExc(ModelService modelService,ModelAction modelAction,String sql){
		 
		 
		    HttpServletResponse response = ServletActionContext.getResponse();
		    String dateStr =  DateUtil.getCurDateStr();//当前时间
		    
		    int sheetNum=50000;
		    
		    int sheetCalculate=0;
		    
		    int sheetPaging=0;
		    
		    
		    try
		    {
		    	
		            List<Map> list=modelService.listDataSql(sql, new Object[] {});
		            int totalSize = 0;
		            if(list!=null && list.size()>0){
		            	totalSize = list.size();
		            }
		  //图片
		    BufferedImage bufferImg = null;//图片一 
		//    String imgSrc = request.getParameter("imgsrc");
		    String path = modelAction.getRequest().getSession().getServletContext().getRealPath("/").replace("fywms", "");
		    //File picFile = new File(path+"fywms\\res\\updoc\\buss\\ei\\fywms\\image\\fywms_title.png");
		//    String fname = picFile.getName();
		//    // 先把读进来的图片放到一个ByteArrayOutputStream中，以便产生ByteArray  
		//    ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream(); 
		//    try
		//    {
		//      
		//      bufferImg = ImageIO.read(picFile);
		//      ImageIO.write(bufferImg, "png", byteArrayOut); 
		//    }
		//    catch (IOException e1)
		//    {
		//      throw new BussException(CommMethod.getText("图片转换出错"));
		//    }  
		    //导出模块
		    // 创建HSSFWorkbook对象(excel的文档对象)
		    HSSFWorkbook wkb = new HSSFWorkbook();
		    // 样式设置
		    // 设置字体
		    HSSFFont headfont = wkb.createFont();
		    headfont.setFontName("黑体");
		    headfont.setFontHeightInPoints((short)11);// 字体大小
		    headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);// 加粗
		    // 另一个样式
		    HSSFCellStyle headstyle = wkb.createCellStyle();
		    headstyle.setFont(headfont);
		    headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
		    headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
		    //headstyle.setLocked(true);
		   // headstyle.setWrapText(true);// 自动换行
		    // 另一个字体样式
		    HSSFFont columnHeadFont = wkb.createFont();
		    columnHeadFont.setFontName("宋体");
		    columnHeadFont.setFontHeightInPoints((short)10);
		    columnHeadFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		    // 列头的样式
		    HSSFCellStyle columnHeadStyle = wkb.createCellStyle();
		    //设置背景色
		    columnHeadStyle.setFillBackgroundColor(HSSFColor.BLUE.index);
		    columnHeadStyle.setFont(columnHeadFont);
		    columnHeadStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
		    columnHeadStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
		  //  columnHeadStyle.setLocked(true);
		  //  columnHeadStyle.setWrapText(true);
		    columnHeadStyle.setLeftBorderColor(HSSFColor.BLACK.index);// 左边框的颜色
		    columnHeadStyle.setBorderLeft((short)1);// 边框的大小
		    columnHeadStyle.setRightBorderColor(HSSFColor.BLACK.index);// 右边框的颜色
		    columnHeadStyle.setBorderRight((short)1);// 边框的大小
		    columnHeadStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体
		    columnHeadStyle.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色
		    // 设置单元格的背景颜色（单元格的样式会覆盖列或行的样式）
		    columnHeadStyle.setFillForegroundColor(HSSFColor.WHITE.index);
		
		    HSSFFont font = wkb.createFont();
		    font.setFontName("宋体");
		    font.setFontHeightInPoints((short)10);
		    //数字单元格样式
		    HSSFCellStyle cellStyle = wkb.createCellStyle();  
		    cellStyle.setDataFormat( HSSFDataFormat.getBuiltinFormat("#.##0"));
		    // 普通单元格样式
		    HSSFCellStyle style = wkb.createCellStyle();
		    style.setFont(font);
		    style.setAlignment(HSSFCellStyle.ALIGN_LEFT);// 左右居中
		    style.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);// 上下居中
		    style.setWrapText(true);
		    style.setLeftBorderColor(HSSFColor.BLACK.index);
		    style.setBorderLeft((short)1);
		    style.setRightBorderColor(HSSFColor.BLACK.index);
		    style.setBorderRight((short)1);
		    style.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体
		    style.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色．
		    style.setFillForegroundColor(HSSFColor.WHITE.index);// 设置单元格的背景颜色．
		    // 另一个样式
		    HSSFCellStyle centerstyle = wkb.createCellStyle();
		    centerstyle.setFont(font);
		    centerstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
		    centerstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
		    centerstyle.setWrapText(true);
		    centerstyle.setLeftBorderColor(HSSFColor.BLACK.index);
		    centerstyle.setBorderLeft((short)1);
		    centerstyle.setRightBorderColor(HSSFColor.BLACK.index);
		    centerstyle.setBorderRight((short)1);
		    centerstyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体
		    centerstyle.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色．
		    centerstyle.setFillForegroundColor(HSSFColor.WHITE.index);// 设置单元格的背景颜色．
		    // 建立新的sheet对象（excel的表单）
		    HSSFSheet sheet=null;
		    
		    //写入内容
		      for(int i=0;i<list.size();i++){
		      	
		      	
		      	
		      	if(sheetCalculate==sheetNum||sheetCalculate==0){
		      		
		      		sheetPaging++;
		      		
		      		// 建立新的sheet对象（excel的表单）
		      	    sheet = wkb.createSheet("物料信息"+sheetPaging);
		      	    // 在sheet里创建第一行，参数为行索引(excel的行)，可以是0～65535之间的任何一个
		      	   // sheet.addMergedRegion(new CellRangeAddress(5, 5, 0, 12));  
		      	    //sheet.addMergedRegion(new CellRangeAddress(4, 4, 0, 12));
		      	    
		      	    //开始创建4行单元格
		      	    
		      	    
		      	    
		      	    HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
		      	    HSSFClientAnchor anchor = new HSSFClientAnchor(0,2 , 255, 255,(short) 2, 0, (short) 5, 3);
		      	    anchor.setAnchorType(3);     
		      	    //插入图片    
		      	   // patriarch.createPicture(anchor, wkb.addPicture(byteArrayOut.toByteArray(), HSSFWorkbook.PICTURE_TYPE_JPEG));
		      	    // 设置列宽    
		      	    sheet.setColumnWidth(0, 4000);    
		      	    sheet.setColumnWidth(1, 13500);    
		      	    sheet.setColumnWidth(2, 2500);    
		      	    sheet.setColumnWidth(3, 2500);    
		      	    sheet.setColumnWidth(4, 2500);    
		      	    sheet.setColumnWidth(5, 2500);    
		      	    sheet.setColumnWidth(6, 2500);    
		      	    sheet.setColumnWidth(7, 2500);   
		      	    sheet.setColumnWidth(8, 2500); 
		      	    sheet.setColumnWidth(9, 2500); 
		      	    sheet.setColumnWidth(10, 2500); 
		      	    sheet.setColumnWidth(11, 5000); 
		      	    sheet.setColumnWidth(12,5000); 
		      	    sheet.setColumnWidth(13,4000); 
		      	    sheet.setColumnWidth(14,3500); 
		      	    sheet.setColumnWidth(15,4000); 
		      	    sheet.setColumnWidth(16,12000); 
		      	    sheet.setColumnWidth(17,4000); 
		      	    sheet.setColumnWidth(18,4000); 
		      	    sheet.setColumnWidth(19,4000);
		      	    sheet.setColumnWidth(20,4000);
		      	    sheet.setColumnWidth(21,4000);
		      	    sheet.setColumnWidth(22,10000);
		      	    sheet.setColumnWidth(23,10000);
		      	    //列名创建
		      	    HSSFRow row2 = sheet.createRow(0);
		      	    HSSFRow row17 = sheet.createRow(1);
//		      	    HSSFRow row4 = sheet.createRow(2);
//		      	    HSSFRow row5 = sheet.createRow(3);;
		      	    HSSFCell cell20 = row2.createCell(0);//不单独建立cell,添加的样式会不生效
		      	    HSSFCell cell21 = row2.createCell(1);
		      	    HSSFCell cell22 = row2.createCell(2);
		      	    HSSFCell cell23 = row2.createCell(3);
		      	    HSSFCell cell24 = row2.createCell(4);
		      	    HSSFCell cell25 = row2.createCell(5);
		      	    HSSFCell cell26 = row2.createCell(6);
		      	    HSSFCell cell27 = row2.createCell(7);
		      	    HSSFCell cell28 = row2.createCell(8);
		      	    HSSFCell cell29 = row2.createCell(9);
		      	    HSSFCell cell210 = row2.createCell(10);
		      	    HSSFCell cell211 = row2.createCell(11);
		      	    HSSFCell cell212 = row2.createCell(12);
		      	    HSSFCell cell213 = row2.createCell(13);
		      	    HSSFCell cell214 = row2.createCell(14);
		      	    HSSFCell cell215 = row2.createCell(15);
		      	    cell20.setCellValue("出库单号");
		      	    cell20.setCellStyle(columnHeadStyle);
		      	    cell21.setCellValue("物料料号");
		      	    cell21.setCellStyle(columnHeadStyle);
		      	    cell22.setCellValue("版本号");
		      	    cell22.setCellStyle(columnHeadStyle);
		      	    cell23.setCellValue("物料名称");
		      	    cell23.setCellStyle(columnHeadStyle);
		      	    cell24.setCellValue("紧急标志");
		      	    cell24.setCellStyle(columnHeadStyle);
		      	    cell25.setCellValue("物料状态");
		      	    cell25.setCellStyle(columnHeadStyle);
		      	    cell26.setCellValue("计划数量");
		      	    cell26.setCellStyle(columnHeadStyle);
		      	    cell27.setCellValue("计量单位");
		      	    cell27.setCellStyle(columnHeadStyle);
		      	    cell28.setCellValue("出库数量");
		      	    cell28.setCellStyle(columnHeadStyle);
		      	    cell29.setCellValue("关联单号");
		      	    cell29.setCellStyle(columnHeadStyle);
		      	    cell210.setCellValue("仓库");
		      	    cell210.setCellStyle(columnHeadStyle);
		      	    cell211.setCellValue("开单人");
		      	    cell211.setCellStyle(columnHeadStyle);
		      	    cell212.setCellValue("开单时间");
		      	    cell212.setCellStyle(columnHeadStyle);
		      	    cell213.setCellValue("事务类型");
		      	    cell213.setCellStyle(columnHeadStyle);
		      	    cell214.setCellValue("行备注");
		      	    cell214.setCellStyle(columnHeadStyle);
		      	    cell215.setCellValue("头备注");
		      	    cell215.setCellStyle(columnHeadStyle);
		      	    
		      	    sheetCalculate=0;
		      	}
		      	sheetCalculate++;
		      
		      
		        HSSFRow row3 = sheet.createRow(sheetCalculate); 
		        HSSFCell cell30 = row3.createCell(0);//不单独建立cell,添加的样式会不生效
		        HSSFCell cell31 = row3.createCell(1);
		        HSSFCell cell32 = row3.createCell(2);
		        HSSFCell cell33 = row3.createCell(3);
		        HSSFCell cell34 = row3.createCell(4);
		        HSSFCell cell35 = row3.createCell(5);
		        HSSFCell cell36 = row3.createCell(6);
		        HSSFCell cell37 = row3.createCell(7);
		        HSSFCell cell38 = row3.createCell(8);
		        HSSFCell cell39 = row3.createCell(9);
		        HSSFCell cell310 = row3.createCell(10);
		        HSSFCell cell311 = row3.createCell(11);
		        HSSFCell cell312 = row3.createCell(12);
		        HSSFCell cell313 = row3.createCell(13);
		        HSSFCell cell314 = row3.createCell(14);
		        HSSFCell cell315 = row3.createCell(15);
		        HSSFCell cell316 = row3.createCell(16);
		        cell30.setCellValue(String.valueOf(list.get(i).get("WOI_DOC_NUM")));
		        cell30.setCellStyle(cellStyle);
		        cell31.setCellValue(String.valueOf(list.get(i).get("WOI_ITEM_CODE")));
		        cell31.setCellStyle(cellStyle);
		        cell32.setCellValue(String.valueOf(list.get(i).get("ITEM_VERSION")));
		        cell32.setCellStyle(cellStyle);
		        cell33.setCellValue(String.valueOf(list.get(i).get("WOI_ITEM_NAME")));
		        cell33.setCellStyle(cellStyle);
		        cell34.setCellValue(String.valueOf(list.get(i).get("WOD_URGENT_FLAG")));
		        cell34.setCellStyle(cellStyle);
		        cell35.setCellValue(String.valueOf(list.get(i).get("WOI_STATUS")));
		        cell35.setCellStyle(cellStyle);
		        cell36.setCellValue(Double.parseDouble(String.valueOf(list.get(i).get("WOI_PLAN_NUM"))));
		        cell36.setCellStyle(cellStyle);
		        cell37.setCellValue(String.valueOf(list.get(i).get("WOD_PLAN_UNIT")));
		        cell37.setCellStyle(cellStyle);
		        cell38.setCellValue(Double.parseDouble(String.valueOf(list.get(i).get("WOI_OUT_NUM"))));
		        cell38.setCellStyle(cellStyle);
		        cell39.setCellValue(String.valueOf(list.get(i).get("WOI_CONNECT_DOC")));
		        cell39.setCellStyle(cellStyle);
		        cell310.setCellValue(String.valueOf(list.get(i).get("WOI_WH_CODE")));
		        cell310.setCellStyle(cellStyle);
		        cell311.setCellValue(String.valueOf(list.get(i).get("NAME")));
		        cell311.setCellStyle(cellStyle);
		        cell312.setCellValue(String.valueOf(list.get(i).get("CREATE_TIME")));
		        cell312.setCellStyle(cellStyle);
		        cell313.setCellValue(String.valueOf(list.get(i).get("WRD_TRANS_TYPE")));
		        cell313.setCellStyle(cellStyle);
		        cell314.setCellValue(String.valueOf(list.get(i).get("WOI_MEMO")));
		        cell314.setCellStyle(cellStyle);
		        cell315.setCellValue(String.valueOf(list.get(i).get("WOD_MEMO")));
		        cell315.setCellStyle(cellStyle);
		        
		      }
		      
		        String fileName = new String("物料信息".getBytes(),"ISO-8859-1");
		        //
		        OutputStream output = response.getOutputStream();
		        response.reset();
		        response.setHeader("Content-disposition", "attachment; filename="+dateStr+fileName+".xls");
		        
		        response.setContentType("application/msexcel");
		        wkb.write(output);
		        output.close();
		
		    }
		    catch (Exception e)
		    {
		      throw new BussException(e.toString());
		    }
		    
		    return null;
		 
	 }
		//插入异常信息
	 @SuppressWarnings("unchecked")
	public static int addErrorDate(TableDataMapExt save,Object erpJson,Object mesJson,ModelService modelService,String wriDocNum,String type){
			 save=new TableDataMapExt();
			 save.setTableName("T_CO_ERPLOG");
			 save.getColMap().put("ID", StringUtils.getUUID());
			 save.getColMap().put("ERPJASON", erpJson);
			 save.getColMap().put("MESJASON", mesJson);
			 save.getColMap().put("OPERATEDATE", DateUtil.getCurDate());
			 save.getColMap().put("OBJECTNAME", type);
			 save.getColMap().put("MESNO", wriDocNum);
			return modelService.save(save);
		 }
	 
	 @SuppressWarnings("unchecked")
	 public static	int editPutInDocStatus(ModelService modelService,TableDataMapExt update,String wriDocNum,String type,String whereIn,String flag,String flag2){
			
			if(type.equals("OTHEREXITING")||type.equals("PURCHASERETURN")||type.equals("OUTSALE")||type.equals("OUTPRODUCTION")){
				
				update=new TableDataMapExt();
		
				update.setTableName("T_WMS_OUTSTOCK_DETAIL");
		
				update.setSqlWhere(" and ID in ( "+whereIn+" ) ");
		
				update.getColMap().put("WOD_UPLOAD_FLAG", flag);
				
				update.getColMap().put("WOD_UPLOAD_TIME", DateUtil.getCurDate());
		
				modelService.edit(update);
				
				update=new TableDataMapExt();
				
				update.setTableName("T_WMS_OUTSTOCK_DOC");
		
				update.setSqlWhere(" and WOD_DOC_NUM='"+wriDocNum+"' ");
		
				update.getColMap().put("UPLOAD_FLAG", flag2);
				
				
				return modelService.edit(update);
				
				
				}else if(type.equals("CANCELOUT")){
				
					update=new TableDataMapExt();
					
					update.setTableName("T_WMS_OUTSTOCK_DETAIL_CANCEL");
					
					update.setSqlWhere(" and ID in ( "+whereIn+" ) ");
					
					update.getColMap().put("WOD_UPLOAD_FLAG", flag);
					
					update.getColMap().put("WOD_UPLOAD_TIME", DateUtil.getCurDate());
					
					return modelService.edit(update);
							
//					update=new TableDataMapExt();
//					
//					update.setTableName("T_WMS_ALLOT_DOC");
//			
//					update.setSqlWhere(" and WAD_DOC_NUM='"+wriDocNum+"' ");
//			
//					update.getColMap().put("UPLOAD_FLAG", flag2);
//					
//					return modelService.edit(update);
				
				
					}else if(type.equals("ALLOT")){
						
						update=new TableDataMapExt();
						
						update.setTableName("T_WMS_ALLOT_DETAIL");
						
						update.setSqlWhere(" and ID in ( "+whereIn+" ) ");
						
						update.getColMap().put("WAD_UPLOAD_FLAG", flag);
						
						update.getColMap().put("WAD_UPLOAD_TIME", DateUtil.getCurDate());
						
						modelService.edit(update);
								
						update=new TableDataMapExt();
						
						update.setTableName("T_WMS_ALLOT_DOC");
				
						update.setSqlWhere(" and WAD_DOC_NUM='"+wriDocNum+"' ");
				
						update.getColMap().put("UPLOAD_FLAG", flag2);
						
						return modelService.edit(update);
					
					
						}else{
						
						update=new TableDataMapExt();
						
						update.setTableName("T_WMS_RECEIVE_DETAIL");
						
						update.setSqlWhere(" and ID in ( "+whereIn+" ) ");
						
						update.getColMap().put("WRD_UPLOAD_FLAG", flag);
						
						update.getColMap().put("WRD_UPLOAD_TIME", DateUtil.getCurDate());
						
						modelService.edit(update);
								
						update=new TableDataMapExt();
						
						update.setTableName("T_WMS_RECEIVE_DOC");
				
						update.setSqlWhere(" and WRD_DOC_NUM='"+wriDocNum+"' ");
				
						update.getColMap().put("UPLOAD_FLAG", flag2);
				
						
						return modelService.edit(update);
					}
			
		}
		
		
		@SuppressWarnings("unchecked")
		public static int editPutInDocStatusLine(ModelService modelService,TableDataMapExt update,String wriDocNum
				,Object sourceBatch,Object sourceLineId,Object batch,String type,Object subinventoryCode){
			
			
			if(type.equals("OTHEREXITING")||type.equals("PURCHASERETURN")||type.equals("OUTSALE")||type.equals("OUTPRODUCTION")){
				
				
				if(type.equals("OUTPRODUCTION")||type.equals("PURCHASERETURN")||type.equals("OTHEREXITING")){
					
					
					update=new TableDataMapExt();
					
					update.setTableName("T_WMS_OUTSTOCK_DETAIL");
					
					update.setSqlWhere(" and WOD_DOC_NUM='"+wriDocNum+"' and P_MES_ID='"+sourceBatch+"' and "
							+ " WOD_LOT_NO='"+batch+"' and WOD_ITEM_ID='"+sourceLineId+"' and WOD_WH_CODE='"+subinventoryCode+"' ");
					
					update.getColMap().put("WOD_UPLOAD_FLAG", "N");
					
					modelService.edit(update);
					
					return modelService.edit(update);
					
					
					
				}else{
				
				
				update=new TableDataMapExt();
				
				update.setTableName("T_WMS_OUTSTOCK_DETAIL");
				
				update.setSqlWhere(" and WOD_DOC_NUM='"+wriDocNum+"' and P_MES_ID='"+sourceBatch+"' and "
						+ " WOD_LOT_NO='"+batch+"' and WOD_ITEM_ID='"+sourceLineId+"' ");
				
				update.getColMap().put("WOD_UPLOAD_FLAG", "N");
				
				modelService.edit(update);
				
				return modelService.edit(update);
				
				}
				
				}else if(type.equals("ALLOT")){
				
					update=new TableDataMapExt();
					
					update.setTableName("T_WMS_ALLOT_DETAIL");
					
					update.setSqlWhere(" and WAD_DOC_NUM='"+wriDocNum+"' and P_MES_ID='"+sourceBatch+"' and "
							+ " WAD_LOT_NO='"+batch+"' and WAD_ITEM_ID='"+sourceLineId+"' ");
					
					update.getColMap().put("WAD_UPLOAD_FLAG", "N");
					
					modelService.edit(update);
					
					return modelService.edit(update);
				
				
					}else if(type.equals("CANCELOUT")){
						
						update=new TableDataMapExt();
						
						update.setTableName("T_WMS_OUTSTOCK_DETAIL_CANCEL");
						
						update.setSqlWhere(" and WOD_DOC_NUM='"+wriDocNum+"' and P_MES_ID='"+sourceBatch+"' and "
								+ " WOD_LOT_NO='"+batch+"' and WOD_ITEM_ID='"+sourceLineId+"' ");
						
						update.getColMap().put("WOD_UPLOAD_FLAG", "N");
						
						modelService.edit(update);
						
						return modelService.edit(update);
					
					
						}else{
							
							
						update=new TableDataMapExt();
			
						update.setTableName("T_WMS_RECEIVE_DETAIL");
			
						update.setSqlWhere(" and WRD_DOC_NUM='"+wriDocNum+"' and P_MES_ID='"+sourceBatch+"' and "
								+ " WRD_LOT_NO='"+batch+"' and WRD_ITEM_ID='"+sourceLineId+"' ");
			
						update.getColMap().put("WRD_UPLOAD_FLAG", "N");
			
						modelService.edit(update);
			
						return modelService.edit(update);
					}
		}
		 @SuppressWarnings({ "unchecked", "rawtypes" })
	public static List<Map> getDocList(ModelService modelService ,String type ,String docTpe){
		 
		 String sql = "";
		 
		 List<Map> list = null;
		 
		 if(type.equals("IN")){
			 
			 sql = "select distinct T2.WRD_DOC_NUM as DOC_NUM from T_WMS_RECEIVE_DETAIL T1 LEFT JOIN T_WMS_RECEIVE_DOC T2 ON T1.WRD_DOC_NUM=T2.WRD_DOC_NUM  where T2.WRD_DOC_TYPE = ? AND (T1.WRD_UPLOAD_FLAG ='N' or T1.WRD_UPLOAD_FLAG is NULL) and T2.WRD_STATUS<>'1' ";
			 
			 list = modelService.listDataSql(sql,new Object[]{docTpe});
			 
		 }else if(type.equals("OUT")){
			 
			 sql = "select distinct T2.WOD_DOC_NUM as DOC_NUM from T_WMS_OUTSTOCK_DETAIL T1 LEFT JOIN T_WMS_OUTSTOCK_DOC T2 ON T1.WOD_DOC_NUM=T2.WOD_DOC_NUM  where T2.WOD_DOC_TYPE = ? AND (T1.WOD_UPLOAD_FLAG ='N' or T1.WOD_UPLOAD_FLAG is NULL) and T2.WOD_STATUS<>'1' ";
			 
			 list = modelService.listDataSql(sql,new Object[]{docTpe});
			 
		 }else{
			 
			 sql = "select distinct T2.WAD_DOC_NUM as DOC_NUM from T_WMS_ALLOT_DETAIL T1 LEFT JOIN T_WMS_ALLOT_DOC T2 ON T1.WAD_DOC_NUM=T2.WAD_DOC_NUM  where T2.WAD_DOC_TYPE = ? AND (T1.WAD_UPLOAD_FLAG ='N' or T1.WAD_UPLOAD_FLAG is NULL) and T2.WAD_STATUS<>'1' ";
			 
			 list = modelService.listDataSql(sql,new Object[]{docTpe});
		 }
		 
		 return list;
		 
	 }
		public static String OutStockExc2(ModelService modelService,ModelAction modelAction,String sql){
			 
			 
		    HttpServletResponse response = ServletActionContext.getResponse();
		    String dateStr =  DateUtil.getCurDateStr();//当前时间
		    
		    int sheetNum=50000;
		    
		    int sheetCalculate=0;
		    
		    int sheetPaging=0;
		    
		    int mapSize = 0;
		    
		    int mapValSizt = 0;
		    
		    try
		    {
		    	
		            List<Map> list=modelService.listDataSql(sql, new Object[] {});
		            int totalSize = 0;
		            if(list!=null && list.size()>0){
		            	totalSize = list.size();
		            }
		  //图片
		    BufferedImage bufferImg = null;//图片一 
		//    String imgSrc = request.getParameter("imgsrc");
		    String path = modelAction.getRequest().getSession().getServletContext().getRealPath("/").replace("fywms", "");
		    //File picFile = new File(path+"fywms\\res\\updoc\\buss\\ei\\fywms\\image\\fywms_title.png");
		//    String fname = picFile.getName();
		//    // 先把读进来的图片放到一个ByteArrayOutputStream中，以便产生ByteArray  
		//    ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream(); 
		//    try
		//    {
		//      
		//      bufferImg = ImageIO.read(picFile);
		//      ImageIO.write(bufferImg, "png", byteArrayOut); 
		//    }
		//    catch (IOException e1)
		//    {
		//      throw new BussException(CommMethod.getText("图片转换出错"));
		//    }  
		    //导出模块
		    // 创建HSSFWorkbook对象(excel的文档对象)
		    HSSFWorkbook wkb = new HSSFWorkbook();
		    // 样式设置
		    // 设置字体
		    HSSFFont headfont = wkb.createFont();
		    headfont.setFontName("黑体");
		    headfont.setFontHeightInPoints((short)11);// 字体大小
		    headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);// 加粗
		    // 另一个样式
		    HSSFCellStyle headstyle = wkb.createCellStyle();
		    headstyle.setFont(headfont);
		    headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
		    headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
		    //headstyle.setLocked(true);
		   // headstyle.setWrapText(true);// 自动换行
		    // 另一个字体样式
		    HSSFFont columnHeadFont = wkb.createFont();
		    columnHeadFont.setFontName("宋体");
		    columnHeadFont.setFontHeightInPoints((short)10);
		    columnHeadFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		    // 列头的样式
		    HSSFCellStyle columnHeadStyle = wkb.createCellStyle();
		    //设置背景色
		    columnHeadStyle.setFillBackgroundColor(HSSFColor.BLUE.index);
		    columnHeadStyle.setFont(columnHeadFont);
		    columnHeadStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
		    columnHeadStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
		  //  columnHeadStyle.setLocked(true);
		  //  columnHeadStyle.setWrapText(true);
		    columnHeadStyle.setLeftBorderColor(HSSFColor.BLACK.index);// 左边框的颜色
		    columnHeadStyle.setBorderLeft((short)1);// 边框的大小
		    columnHeadStyle.setRightBorderColor(HSSFColor.BLACK.index);// 右边框的颜色
		    columnHeadStyle.setBorderRight((short)1);// 边框的大小
		    columnHeadStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体
		    columnHeadStyle.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色
		    // 设置单元格的背景颜色（单元格的样式会覆盖列或行的样式）
		    columnHeadStyle.setFillForegroundColor(HSSFColor.WHITE.index);
		
		    HSSFFont font = wkb.createFont();
		    font.setFontName("宋体");
		    font.setFontHeightInPoints((short)10);
		    //数字单元格样式
		    HSSFCellStyle cellStyle = wkb.createCellStyle();  
		    cellStyle.setDataFormat( HSSFDataFormat.getBuiltinFormat("#.##0"));
		    // 普通单元格样式
		    HSSFCellStyle style = wkb.createCellStyle();
		    style.setFont(font);
		    style.setAlignment(HSSFCellStyle.ALIGN_LEFT);// 左右居中
		    style.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);// 上下居中
		    style.setWrapText(true);
		    style.setLeftBorderColor(HSSFColor.BLACK.index);
		    style.setBorderLeft((short)1);
		    style.setRightBorderColor(HSSFColor.BLACK.index);
		    style.setBorderRight((short)1);
		    style.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体
		    style.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色．
		    style.setFillForegroundColor(HSSFColor.WHITE.index);// 设置单元格的背景颜色．
		    // 另一个样式
		    HSSFCellStyle centerstyle = wkb.createCellStyle();
		    centerstyle.setFont(font);
		    centerstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
		    centerstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
		    centerstyle.setWrapText(true);
		    centerstyle.setLeftBorderColor(HSSFColor.BLACK.index);
		    centerstyle.setBorderLeft((short)1);
		    centerstyle.setRightBorderColor(HSSFColor.BLACK.index);
		    centerstyle.setBorderRight((short)1);
		    centerstyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体
		    centerstyle.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色．
		    centerstyle.setFillForegroundColor(HSSFColor.WHITE.index);// 设置单元格的背景颜色．
		    // 建立新的sheet对象（excel的表单）
		    HSSFSheet sheet=null;
		    
		    //写入内容
		      for(int i=0;i<list.size();i++){
		      	
		      	
		      	//新建sheet页
		    	  
		      	if(sheetCalculate==sheetNum||sheetCalculate==0){
		      		
		      		sheetPaging++;
		      		
		      		// 建立新的sheet对象（excel的表单）
		      	    sheet = wkb.createSheet("物料信息"+sheetPaging);
		      	    // 在sheet里创建第一行，参数为行索引(excel的行)，可以是0～65535之间的任何一个
		      	   // sheet.addMergedRegion(new CellRangeAddress(5, 5, 0, 12));  
		      	    //sheet.addMergedRegion(new CellRangeAddress(4, 4, 0, 12));
		      	    HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
		      	    HSSFClientAnchor anchor = new HSSFClientAnchor(0,2 , 255, 255,(short) 2, 0, (short) 5, 3);
		      	    anchor.setAnchorType(3);     
		      	    //插入图片    
		      	    // patriarch.createPicture(anchor, wkb.addPicture(byteArrayOut.toByteArray(), HSSFWorkbook.PICTURE_TYPE_JPEG));
		      	    // 设置列宽    
		      	    //根据map的长度建立sheet页列数
		      	    mapSize = 0;
		      	    HSSFRow row = sheet.createRow(0);
		      	    Iterator<Map.Entry<String, Object>> entries = list.get(i).entrySet().iterator();
					while (entries.hasNext()) { 
						  Map.Entry<String, Object> entry = entries.next(); 
						  if(entry.getKey().equals("物料名称")){
							  sheet.setColumnWidth(mapSize, 20000);
						  }else{
							  sheet.setColumnWidth(mapSize, 4000);
						  }
						   
						  HSSFCell cell = row.createCell(mapSize);//不单独建立cell,添加的样式会不生效
						  cell.setCellValue(entry.getKey());
				      	  cell.setCellStyle(columnHeadStyle);
			      	      mapSize++;
						}
		      	    
		      	    
		      	    sheetCalculate=0;
		      	}
		      	sheetCalculate++;
		      	
		      	String cellValStr = "";
		      	
		      	double cellValInt = 0;
		      	
		      	mapValSizt = 0;
		      	
		        HSSFRow row3 = sheet.createRow(sheetCalculate); 
		        
		        Iterator<Map.Entry<String, Object>> entries = list.get(i).entrySet().iterator();
		        
				while (entries.hasNext()) { 
					  Map.Entry<String, Object> entry = entries.next(); 
					  HSSFCell cell = row3.createCell(mapValSizt);//不单独建立cell,添加的样式会不生效
					  
					  cellValStr = String.valueOf(entry.getValue());
					 // cell.setCellValue(cellValStr);
					  try {
					      
						if(!entry.getKey().equals("物料料号")){
						    
					     cellValInt =  Double.parseDouble(cellValStr);
					    
					     
					     cell.setCellValue(cellValInt);
					     
						}else{
						    
						    cell.setCellValue(cellValStr);
						    
						}
						  
					} catch (Exception e) {
						
						cell.setCellValue(cellValStr);
						
					}
					  cell.setCellStyle(cellStyle); 
					 
					  mapValSizt++; 
					}
		      }
		      
		        String fileName = new String("物料信息".getBytes(),"ISO-8859-1");
		        //
		        OutputStream output = response.getOutputStream();
		        response.reset();
		        response.setHeader("Content-disposition", "attachment; filename="+dateStr+fileName+".xls");
		        
		        response.setContentType("application/msexcel");
		        wkb.write(output);
		        output.close();
		
		    }
		    catch (Exception e)
		    {
		      throw new BussException(e.toString());
		    }
		    
		    return null;
		 
	 }
	
	
	/**
	 * Excel中的图文报表
	 * @param modelService
	 * @param modelAction
	 * @param sql
	 * @return
	 */
	public static String  OutStockExcelToEachar(ModelService modelService,ModelAction modelAction,String sql){
		
	
		    HttpServletResponse response = ServletActionContext.getResponse();
		    
		    HttpServletRequest request = modelAction.getRequest();
		    String WOI_DOC_NUM = request.getParameter("WOI_DOC_NUM");
		    String WOI_CONNECT_DOC = request.getParameter("WOI_CONNECT_DOC");//工单号
		    String dateStr =  DateUtil.getCurDateStr();//当前时间
		    
		    int sheetNum=5;
		    
		    int sheetCalculate=0;
		    
		    int sheetPaging=0;
		    
		       
		    int mapSize = 0;
		    
		    int mapValSizt = 0;
		    
		    
		    try
		    {
		    	
		            List<Map> list=modelService.listDataSql(sql, new Object[] {});
		            //String WOI_CONNECT_DOC=  String.valueOf(list.get(0).get("工单号"));
		            int totalSize = 0;
		            if(list!=null && list.size()>0){
		            	totalSize = list.size();
		            }
		  //图片
		    BufferedImage bufferImg = null;//图片一 
		//    String imgSrc = request.getParameter("imgsrc");
		    String path = modelAction.getRequest().getSession().getServletContext().getRealPath("/").replace("N2", "");
		    File picFile = new File(path+"N2\\res\\updoc\\buss\\ei\\n2\\image\\kexinpic.png");
		    
		    
		    
		//    System.out.println(picFile+"------------------------------------------------");
		    String fname = picFile.getName();
		//    // 先把读进来的图片放到一个ByteArrayOutputStream中，以便产生ByteArray  
		    ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream(); 
		    try
		    {
		      
		      bufferImg = ImageIO.read(picFile);
		      ImageIO.write(bufferImg, "png", byteArrayOut); 
		    }
		    catch (IOException e1)
		    {
		      throw new BussException(CommMethod.getText("图片转换出错"));
		    }  
		    //导出模块
		    // 创建HSSFWorkbook对象(excel的文档对象)
		    HSSFWorkbook wkb = new HSSFWorkbook();
		    // 样式设置
		    // 设置字体
		    HSSFFont headfont = wkb.createFont();
		    headfont.setFontName("黑体");
		    headfont.setFontHeightInPoints((short)10);// 字体大小
		    headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);// 加粗
		    // 另一个样式
		    HSSFCellStyle headstyle = wkb.createCellStyle();
		    headstyle.setFont(headfont);
		    headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
		    headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
		    //headstyle.setLocked(true);
		    //headstyle.setWrapText(true);// 自动换行
		    // 另一个字体样式
		    HSSFFont columnHeadFont = wkb.createFont();
		    columnHeadFont.setFontName("宋体");
		    columnHeadFont.setFontHeightInPoints((short)10);
		    columnHeadFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		    // 列头的样式
		    HSSFCellStyle columnHeadStyle = wkb.createCellStyle();
		    //设置背景色
		    columnHeadStyle.setFillBackgroundColor(HSSFColor.BLUE.index);
		    columnHeadStyle.setFont(columnHeadFont);
		    columnHeadStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
		    columnHeadStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
		    columnHeadStyle.setLocked(true);
		    columnHeadStyle.setWrapText(true);
		    // columnHeadStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		    columnHeadStyle.setTopBorderColor(HSSFColor.BLACK.index);
		    columnHeadStyle.setBorderTop((short)1);
		    columnHeadStyle.setLeftBorderColor(HSSFColor.BLACK.index);// 左边框的颜色
		    columnHeadStyle.setBorderLeft((short)1);// 边框的大小
		    columnHeadStyle.setRightBorderColor(HSSFColor.BLACK.index);// 右边框的颜色
		    columnHeadStyle.setBorderRight((short)1);// 边框的大小
		    columnHeadStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体
		    columnHeadStyle.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色
		    // 设置单元格的背景颜色（单元格的样式会覆盖列或行的样式）
		    columnHeadStyle.setFillForegroundColor(HSSFColor.WHITE.index);
		
		    HSSFFont font = wkb.createFont();
		    font.setFontName("宋体");
		    font.setFontHeightInPoints((short)11);
		    //数字单元格样式
		    HSSFCellStyle cellStyle = wkb.createCellStyle();  
		    cellStyle.setDataFormat( HSSFDataFormat.getBuiltinFormat("#.##0"));
		    // 普通单元格样式
		    HSSFCellStyle style = wkb.createCellStyle();
		    style.setFont(font);
		    style.setAlignment(HSSFCellStyle.ALIGN_LEFT);// 左右居中
		    style.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);// 上下居中
		    style.setWrapText(true);
		    style.setLeftBorderColor(HSSFColor.BLACK.index);
		    style.setBorderLeft((short)1);
		    style.setRightBorderColor(HSSFColor.BLACK.index);
		    style.setBorderRight((short)1);
		    style.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体
		    style.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色．
		    style.setFillForegroundColor(HSSFColor.WHITE.index);// 设置单元格的背景颜色．
		    // 另一个样式
		    HSSFCellStyle centerstyle = wkb.createCellStyle();
		    centerstyle.setFont(font);
		    centerstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
		    centerstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
		    centerstyle.setWrapText(true);
		    centerstyle.setLeftBorderColor(HSSFColor.BLACK.index);
		    centerstyle.setBorderLeft((short)1);
		    centerstyle.setRightBorderColor(HSSFColor.BLACK.index);
		    centerstyle.setBorderRight((short)1);
		    centerstyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体
		    centerstyle.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色．
		    centerstyle.setFillForegroundColor(HSSFColor.WHITE.index);// 设置单元格的背景颜色．
		    
		      //设置数据样式
		    HSSFFont shujufont = wkb.createFont();
		    
		    HSSFCellStyle shujustyle = wkb.createCellStyle();
		    shujufont.setFontName("宋体");
		    shujufont.setFontHeightInPoints((short)9);
		    shujustyle.setFont(shujufont);
		    shujustyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
	        shujustyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
		    shujustyle.setTopBorderColor(HSSFColor.BLACK.index);
		    shujustyle.setBorderTop((short)1);
		    shujustyle.setLeftBorderColor(HSSFColor.BLACK.index);// 左边框的颜色
		    shujustyle.setBorderLeft((short)1);// 边框的大小
		    shujustyle.setRightBorderColor(HSSFColor.BLACK.index);// 右边框的颜色
		    shujustyle.setBorderRight((short)1);// 边框的大小
		    shujustyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体
		    shujustyle.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色
		    shujustyle.setDataFormat( HSSFDataFormat.getBuiltinFormat("#.##0"));
		    //设置第二行格式
		     HSSFFont rownumfont2 = wkb.createFont();
		    HSSFCellStyle rownumfontstyle = wkb.createCellStyle();
		    rownumfont2.setFontName("黑体");
		    rownumfont2.setFontHeightInPoints((short)20);
		    rownumfont2.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);// 加粗
		    rownumfontstyle.setFont(rownumfont2);
		    rownumfontstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
		    rownumfontstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
		    //设置单元格和字体大小
		    HSSFCellStyle fontstyle = wkb.createCellStyle();
		    HSSFFont font1 = wkb.createFont();
		    font1.setFontName("宋体");
		    font1.setFontHeightInPoints((short)9);
		    fontstyle.setFont(font1);
		
		    fontstyle.setWrapText(true);
		    fontstyle.setTopBorderColor(HSSFColor.BLACK.index);
		    fontstyle.setBorderTop((short)1);
		    fontstyle.setLeftBorderColor(HSSFColor.BLACK.index);// 左边框的颜色
		    fontstyle.setBorderLeft((short)1);// 边框的大小
		    fontstyle.setRightBorderColor(HSSFColor.BLACK.index);// 右边框的颜色
		    fontstyle.setBorderRight((short)1);// 边框的大小
		    fontstyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体
		    fontstyle.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色
		    fontstyle.setDataFormat( HSSFDataFormat.getBuiltinFormat("#.##0"));
		    
		    // 建立新的sheet对象（excel的表单）
		    HSSFSheet sheet=null;
		    
		    //写入内容
		      for(int i=0;i<list.size();i++){
		      	if(sheetCalculate==sheetNum||sheetCalculate==0){
		      		
		      		sheetPaging++;
		      		
		      		// 建立新的sheet对象（excel的表单）
		      	    sheet = wkb.createSheet("物料信息"+sheetPaging);
		      	    // 在sheet里创建第一行，参数为行索引(excel的行)，可以是0～65535之间的任何一个
		      	   //合并比0行
		      	//    sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 0));
		      	 // sheet.addMergedRegion(new CellRangeAddress(0,0, 0, 1));
		      	    HSSFRow rownum0=   sheet.createRow(0);
		      	    HSSFCell cell0 = rownum0.createCell(0);
		      	   // cell0.setCellValue("源科:");
		      	  
		      	    rownum0.setHeightInPoints((float)0);
		      
		      	   // cell0.setCellStyle(style);
		      	    //合并第一行
		      	    //sheet.addMergedRegion(new CellRangeAddress(1, 1, 0, 7));
		      	    
		      	    sheet.addMergedRegion(new CellRangeAddress(1, 1, 2, 5));
		      	    HSSFRow rownum1=   sheet.createRow(1);
                    HSSFCell cell1 = rownum1.createCell(2);
		      	  
		      	    cell1.setCellValue("生产领料");
		      	    cell1.setCellStyle(rownumfontstyle);
                    rownum1.setHeightInPoints((float)50);
		      	    
		      	    
		      	    //合并第三行
		      	 //   sheet.addMergedRegion(new CellRangeAddress(2, 2, 0, 7));
		      	    HSSFRow rownum2=   sheet.createRow(2);
		      	    rownum2.createCell(5).setCellValue("【QR-PC-010】【A0】");
		      	    rownum2.setHeightInPoints((float)15);
		      	    //合并第四行
		      	    sheet.addMergedRegion(new CellRangeAddress(3, 3, 0, 7));
		      	     HSSFRow rownum3=   sheet.createRow(3);
		      	    rownum3.setHeightInPoints((float)15);
		      	    rownum3.createCell(0).setCellValue("制单日期："+dateStr+"       领料部门称：装配组        领料单编号："+WOI_DOC_NUM+"");
		      	    //合并第五行
		      	    sheet.addMergedRegion(new CellRangeAddress(4, 4, 0, 7));
		      	     HSSFRow rownum4=   sheet.createRow(4);
		      	    rownum4.setHeightInPoints((float)15);
		      	  String ss=  String.valueOf(list.get(0).get("工单号"));
		      	  if(!ss.equals("")){
		      	       rownum4.createCell(0).setCellValue("领料类型:制令单领料/工单领料/超领                      工单号："+ss+"");
		      	  }
		      	   
		      	    
		      	    sheet.addMergedRegion(new CellRangeAddress(5, 5, 0, 2));
		      	     HSSFRow rownum5=   sheet.createRow(5);
		      	    rownum5.setHeightInPoints((float)20);
		      	    if(list.get(i).get("WOI_MEMO")!=null){
		      	         rownum5.createCell(0).setCellValue("备注:"+String.valueOf(list.get(i).get("WOI_MEMO")));
		      	    }else{
		      	         rownum5.createCell(0).setCellValue("备注:");
		      	    }
		      	     HSSFRow rownum20=   sheet.createRow(15);
		      	    sheet.addMergedRegion(new CellRangeAddress(15,15,0,7));
		      	    rownum20.setHeightInPoints((float)20);
		      	    rownum20.createCell(0).setCellValue("制单人：                    主管：                     计划:                       仓管员：");
		      	    HSSFPatriarch patriarch = sheet.createDrawingPatriarch();

		      	     HSSFClientAnchor anchor = new HSSFClientAnchor(0,0 , 0, 0,(short) 0, 1, (short) 2, 2);
		      	    anchor.setAnchorType(3);     
		      	    //插入图片    
		      	    patriarch.createPicture(anchor, wkb.addPicture(byteArrayOut.toByteArray(), HSSFWorkbook.PICTURE_TYPE_JPEG));
		      	    // 设置列宽    
		      	    sheet.setColumnWidth(0, 1200);    
		      	    sheet.setColumnWidth(1, 4000);    
		      	    sheet.setColumnWidth(2, 5000);    
		      	    sheet.setColumnWidth(3, 1250);    
		      	    sheet.setColumnWidth(4, 1250);    
		      	    sheet.setColumnWidth(5, 2500);    
		      	    sheet.setColumnWidth(6,2500);    
		      	    sheet.setColumnWidth(7, 2500);   
		      	    sheet.setColumnWidth(8, 2500); 
		      	    sheet.setColumnWidth(9, 2500); 
		      	    sheet.setColumnWidth(10,3500); 
		      	   
		      	    //列名创建
		      	    
		      	    HSSFRow row8 = sheet.createRow(6);//创建第6行
		      	    row8.setHeightInPoints((float)20);
		      	    HSSFCell cell20 = row8.createCell(0);//不单独建立cell,添加的样式会不生效
		      	    HSSFCell cell21 = row8.createCell(1);
		      	    HSSFCell cell22 = row8.createCell(2);
		      	    HSSFCell cell23 = row8.createCell(3);
		      	    HSSFCell cell24 = row8.createCell(4);
		      	    HSSFCell cell25 = row8.createCell(5);
		      	    HSSFCell cell26 = row8.createCell(6);
		      	    HSSFCell cell27 = row8.createCell(7);
		      	  
		      	    cell20.setCellValue("项次");
		      	    cell20.setCellStyle(columnHeadStyle);
		      	    cell21.setCellValue("品号");
		      	    cell21.setCellStyle(columnHeadStyle);
		      	    cell22.setCellValue("品名描述");
		      	    cell22.setCellStyle(columnHeadStyle);
		      	    cell23.setCellValue("版本");
		      	    cell23.setCellStyle(columnHeadStyle);
		      	    cell24.setCellValue("仓库");
		      	    cell24.setCellStyle(columnHeadStyle);
		      	    cell25.setCellValue("需领数量单位");
		      	    cell25.setCellStyle(columnHeadStyle);
		      	    cell26.setCellValue("实发数量");
		      	    cell26.setCellStyle(columnHeadStyle);
		      	    cell27.setCellValue("备注");
		      	    cell27.setCellStyle(columnHeadStyle);
		      	    sheetCalculate=0;
		      	}
		      	sheetCalculate++;
		      	

		      
		      //数据开始加载
		        HSSFRow row3 = sheet.createRow(sheetCalculate+6);
		        row3.setHeightInPoints((float)25);
		        HSSFCell cell30 = row3.createCell(0);//不单独建立cell,添加的样式会不生效
		        HSSFCell cell31 = row3.createCell(1);
		        HSSFCell cell32 = row3.createCell(2);
		        HSSFCell cell33 = row3.createCell(3);
		        HSSFCell cell34 = row3.createCell(4);
		        HSSFCell cell35 = row3.createCell(5);
		        HSSFCell cell36 = row3.createCell(6);
		        HSSFCell cell37 = row3.createCell(7);
		        HSSFCell cell38 = row3.createCell(8);
		        HSSFCell cell39 = row3.createCell(9);
		        HSSFCell cell310 = row3.createCell(10);
		        HSSFCell cell311 = row3.createCell(11);
		        HSSFCell cell312 = row3.createCell(12);
		        HSSFCell cell313 = row3.createCell(13);
		        cell30.setCellValue(String.valueOf(i+1));
		        cell30.setCellStyle(shujustyle);
		        cell31.setCellValue(String.valueOf(list.get(i).get("物料料号")));
		        cell31.setCellStyle(shujustyle);
		        
		        cell32.setCellValue(String.valueOf(list.get(i).get("物料名称")));
		        cell32.setCellStyle(shujustyle);
		        cell32.setCellStyle(fontstyle);
		        
		        cell33.setCellValue(String.valueOf(list.get(i).get("版本号")));
		        cell33.setCellStyle(shujustyle);
		        
		        cell34.setCellValue(String.valueOf(list.get(i).get("仓库")));
		        cell34.setCellStyle(shujustyle);
		        
		        cell35.setCellValue(String.valueOf(list.get(i).get("计划数量")+"/"+list.get(i).get("计量单位")));
		        cell35.setCellStyle(shujustyle);
		        
		        cell36.setCellValue(String.valueOf(list.get(i).get("出库数量")));
		        cell36.setCellStyle(shujustyle);
		        if(list.get(i).get("备注")!=null){
	      	         //rownum5.createCell(0).setCellValue("备注:"+String.valueOf(list.get(i).get("WOI_MEMO")));
		        	cell37.setCellValue(String.valueOf(list.get(i).get("备注")));
		        }else{
		        	cell37.setCellValue("");
	      	    }
		        //cell37.setCellValue(String.valueOf(list.get(i).get("备注")));
		        cell37.setCellStyle(shujustyle);
		        cell37.setCellStyle(fontstyle);
		        
		       
		   
		           
		        
		      }
		      
		        String fileName = new String("物料信息".getBytes(),"ISO-8859-1");
		        //
		        OutputStream output = response.getOutputStream();
		        response.reset();
		        response.setHeader("Content-disposition", "attachment; filename="+dateStr+fileName+".xls");
		        
		        response.setContentType("application/msexcel");
		        wkb.write(output);
		        output.close();
		
		    }
		    catch (Exception e)
		    {
		      throw new BussException(e.toString());
		    }
		    
		    return null;
	
	
	
	
	
	
	}
	
	
	
	
	
	
	
	
	
}
