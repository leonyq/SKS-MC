
package com.more.mes.erpservice.oracleerp.sync;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.fw.webservice.service.IWebService;

/**
 * ORACLE ERP
 * @ClassName:SyncPurchaseOrderInfo
 * @Description: 用于采购入库单信息存储 接收参数 msg 
 * @author:mmz
 * @version:1.0
 * @since 2018年3月29日下午8:10:01
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */

public class PurchaseOrderSync implements IWebService {
	final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");
    private MsHTranMan hbtran = BussService.getHbTran();
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Map<String, Object> excute(Object... objs) {
		//定义表单修改的的对象
		TableDataMapExt update;
		//定义表单存储的的对象
		TableDataMapExt save = null ;
		
		String sql=null;
		
		List<Map> list;
		
		List<Map> checkList = null;
		
		List<Map> checkPoLine;
		
        String Only = StringUtils.getUUID();
        
        String returnErrorMsg = "";
        
        String errorMsgLine="";
        
		Map<String, Object> resmap = new HashMap<String, Object>();// 存返回数据
		
		Map<String,Object> poBaseMap;
		
		Map<String,Object> poDetailMap;
		
		//校验数据集Map
		Map<String,Object> checkMap = new HashMap<String, Object>();
		
		//校验数据集Map(po)
		Map<String,Object> checkMapPo;
		
		//校验数据集Map(poLine)
		Map<String,Object> checkMapPoLine;
		
		//表头数据集合
		List<Map> poBaseList=new ArrayList<Map>();
		//表身数据集合数据集合
		List<Map> poDetailList=new ArrayList<Map>();
		//表身所有Item集合
		List<List<Map>> poItemDetailList=new ArrayList<List<Map>>();
		// 定义一个文档
		Document document = null;
		// 将字符串转换为
		String xmlMsg = objs[0].toString();
		
	    try {
			  document = DocumentHelper.parseText(xmlMsg);
		      Element bookStore = document.getRootElement();
		      Iterator it = bookStore.elementIterator();
		      while (it.hasNext()) {
		    	  
	          Element book = (Element) it.next();
	          Iterator itt = book.elementIterator();
	          
	        //节点名称
	          String elDateName=book.getName();
	          //DATE节点，为采购入库单的当头数据
	          if(elDateName.equals("DATA")){
	        	  
	        	  poBaseMap = new HashMap<String, Object>();
	        	  
	        	  while (itt.hasNext()) {
		              Element bookChild = (Element) itt.next();
		              
		              Iterator ittes = bookChild.elementIterator();
		              
		            //节点名称
		             String elName=bookChild.getName();
		              
		            //节点值
		              String dataStr=bookChild.getStringValue();
		              
		            //ITEM_LIST节点，为采购入库单的明细
		              if(elName.equals("ITEM_LIST")){
		            	  poDetailList=new ArrayList<Map>();
		            	  while (ittes.hasNext()) {
		            		  
		            		  Element book2 = (Element) ittes.next();
			            	  
			            	  Iterator ittes2=book2.elementIterator();
			            	//节点名称
				              String elItemName=book2.getName();
				              //ITEM节点，明细数据
			            	  if(elItemName.equals("ITEM")){
			            		  poDetailMap=new HashMap<String, Object>();
			            		  
			            		  boolean flag;
			            		  while (true) {
			            			  flag=ittes2.hasNext();
			            			  if(flag){
			            				  flag=ittes2.hasNext();
					            			int a=  ittes2.hashCode();
					            			  
					            			  Element  book3=(Element) ittes2.next();
						            		  
						            		  Iterator ittes3=book3.elementIterator();
											
						            		//节点名称
						            		  String elItemDetailName=book3.getName();
						            		  
						            		//节点值
						            		  String itemDataStr=book3.getStringValue();
						            		  
						            		  poDetailMap.put(elItemDetailName, itemDataStr);
			            			  }else{
			            				  poDetailList.add(poDetailMap);
			            				  break;
			            			  }   
								}  
			            	  }
						}
		              }else{
		            	  poBaseMap.put(elName, dataStr);
		              }	 	
		              //到达ITEM_LIST节点，保存数据
		              if(elName.equals("ITEM_LIST")){
		            	  poBaseList.add(poBaseMap);
		            	  poItemDetailList.add(poDetailList);
		              }  
		  }
	 }          
}
	      
	      /**
	       * 定义采购入库单标准信息(base)
	       */
	     
	      //ERP_DOC
	      Object erpDoc;
	      
	      //WPI_RECEIVE_TIME
	      Object wpiReceiveTime;
	      
	      //WPI_SUP_CODE
	      Object wpiSupCode;
	      
	      //CREATE_USER
	      Object createUser;
	      
	      //CREATE_TIME
	      Object createTime;
	      
	      //WPI_MEMO
	      Object wpiMemo;
	      
	      //DATA_AUTH
	      Object dataAuth;
	      
	      //DOC_TYPE
	      Object docType;
	      
	      //ERP_REVICETYPE;
	      Object erpReviceType;
	      
	      //ERP_STUATE
	      Object erpStuate;
	      
	      
	      /**
	       * 定义采购入库单标准信息(detail)
	       */
	      
	    //WPD_SEQ
	      Object wpdSeq;
	      
	    //WPD_ITEM_CODE
	      Object wpdItemCode;
	      
	    //ITEM_VERSION
	      Object itemVersion;
	      
	    //WPD_PLAN_NUM
	      Object wpdPlanNum;
	      
	    //WPD_PLAN_UNIT
	      Object wpdPlanUnit;
	      
	    //ERP_SOURCENO
	      Object erpSourceno;
	      
	    //ERP_SOURCELINENO
	      Object erpSourcelineno;
	      
	    //WPD_DELIVERY_DATE
	      Object wpdDeliveryDate;
	      
	    //FLAG
	      Object flag;
	      
	    //PURCHASE_TYPE
	      Object PURCHASETYPE;
	      
	      //WRI_MEMO
	      Object WRIMEMO;
	      
	      //WIPNAME
	      Object WIPNAME;
	      
	      String errorMsg=""; 
	      
	     boolean  returnFlag;
	      
	      for (int i = 0; i < poBaseList.size(); i++) {
			
	    	  //ERP_DOC
	    	  erpDoc=poBaseList.get(i).get("ERP_DOC");
	    	  
	    	  //WPI_RECEIVE_TIME
		       wpiReceiveTime=poBaseList.get(i).get("WPI_RECEIVE_TIME");
		      
		      //WPI_SUP_CODE
		       wpiSupCode=poBaseList.get(i).get("WPI_SUP_CODE");
		      
		      //CREATE_USER
		       createUser=poBaseList.get(i).get("CREATE_USER");
		      
		      //CREATE_TIME
		       createTime=poBaseList.get(i).get("CREATE_TIME");
		      
		      //WPI_MEMO
		       wpiMemo=poBaseList.get(i).get("WPI_MEMO");
		      
		      //DATA_AUTH
		       dataAuth=poBaseList.get(i).get("DATA_AUTH");
		      
		      //DOC_TYPE
		       docType=poBaseList.get(i).get("DOC_TYPE");
		      
		      //ERP_REVICETYPE;
		       erpReviceType=poBaseList.get(i).get("ERP_REVICETYPE");
		      
		      //ERP_STUATE
		       erpStuate=poBaseList.get(i).get("ERP_STUATE");
	    	  
		       
		       checkMapPo=new HashMap<String,Object>();
		       
		       
		       
		       if(erpDoc==null){
		    		  errorMsg+="ERP_DOC,";
		    	  }else{
		       
		       //校验采购入库单号是否存在
		       checkList = checkPo(modelService, erpDoc);
		       
		       if(checkList.size()>0){
		    	   
		    	   checkMapPo.put("checkPo", "Y");
		    	   
		       }else{
		    	   
		    	   checkMapPo.put("checkPo", "N");
		       }
		       
		       
		    }
		       
	    	  //如果存在一个节点异常(无已上任意一节点)
		      if(erpDoc==null||wpiReceiveTime==null||wpiSupCode==null||createUser==null
		    		  ||createTime==null||wpiMemo==null||dataAuth==null||docType==null||erpReviceType==null
		    		  ||erpStuate==null){
		    	  if("".equals(errorMsg)){
		    		  errorMsg="该PO无以下节点";
		    	  
		    	  } 	  
		    	  if(erpDoc==null){
		    		  errorMsg+="ERP_DOC,";
		    	  }
		    	  if(wpiReceiveTime==null){
		    		  errorMsg+="WPI_RECEIVE_TIME,";
		    	  }
		    	  if(wpiSupCode==null){
		    		  errorMsg+="WPI_SUP_CODE,";
		    	  }
		    	  if(createUser==null){
		    		  errorMsg+="CREATE_USER,";
		    	  }
		    	  if(createTime==null){
		    		  errorMsg+="CREATE_TIME,";
		    	  }
		    	  if(wpiMemo==null){
		    		  errorMsg+="WPI_MEMO,";
		    	  }
		    	  if(dataAuth==null){
		    		  errorMsg+="DATA_AUTH,";
		    	  }
		    	  if(docType==null){
		    		  errorMsg+="DOC_TYPE,";
		    	  }
		    	  if(erpReviceType==null){
		    		  errorMsg+="ERP_REVICETYPE,";
		    	  }
		    	  if(erpStuate==null){
		    		  errorMsg+="ERP_STUATE";
		    	  }  
		    	  
		      }else{
		    	  
		    	  if(createTime.equals("")){
		    		  createTime=DateUtil.getCurDateStr();  
		    	  }else{
		    		  if(DateUtil.parseDate(String.valueOf(createTime),"yyyy-MM-dd")==null){
			    		  
			    		  errorMsg+="此poCREATE_TIME时间格式有误";
			    	  }
		    	  }
		    	  
		    	  
		    	  
		    	  
		      }
		      
		      
		      
		      for (int j = 0; j < poItemDetailList.get(i).size(); j++) {
					
		    	  	  
		    	  checkMapPoLine=new HashMap<String,Object>();
		    	  
		    	  	  
		    	  
		    		//WPD_SEQ
		    	       wpdSeq=poItemDetailList.get(i).get(j).get("WPD_SEQ");
		    	      
		    	    //WPD_ITEM_CODE
		    	       wpdItemCode=poItemDetailList.get(i).get(j).get("WPD_ITEM_CODE");
		    	      
		    	    //ITEM_VERSION
		    	       itemVersion=poItemDetailList.get(i).get(j).get("ITEM_VERSION");
		    	      
		    	    //WPD_PLAN_NUM
		    	       wpdPlanNum=poItemDetailList.get(i).get(j).get("WPD_PLAN_NUM");
		    	      
		    	    //WPD_PLAN_UNIT
		    	       wpdPlanUnit=poItemDetailList.get(i).get(j).get("WPD_PLAN_UNIT");
		    	      
		    	    //ERP_SOURCENO
		    	       erpSourceno=poItemDetailList.get(i).get(j).get("ERP_SOURCENO");
		    	      
		    	    //ERP_SOURCELINENO
		    	       erpSourcelineno=poItemDetailList.get(i).get(j).get("ERP_SOURCELINENO");
		    	      
		    	    //WPD_DELIVERY_DATE
		    	       wpdDeliveryDate=poItemDetailList.get(i).get(j).get("WPD_DELIVERY_DATE");
		    	      
		    	    //flag
		    	       flag=poItemDetailList.get(i).get(j).get("FLAG");
		    	       
		    	     //PURCHASETYPE
		    	       PURCHASETYPE=poItemDetailList.get(i).get(j).get("PURCHASE_TYPE");//WRI_MEMO
		    	     //WRIMEMO
		    	       WRIMEMO=poItemDetailList.get(i).get(j).get("WRI_MEMO");
		    	      //WIPNAME
		    	       WIPNAME=poItemDetailList.get(i).get(j).get("WIPNAME");
		    		  
		    	       if(wpdSeq==null){
		    	    	   errorMsgLine+=" WPD_SEQ,";
 			    	  }else{
 			    		  //该记录po存在
 			    		  if(checkList.size()>0){
 			    			  
 			    			 checkPoLine = checkPoLine(modelService, checkList.get(0).get("WRD_DOC_NUM"), wpdSeq);
 			    			  
 			    			 //存在明细行
 			    			 if(checkPoLine.size()>0){
 			    				 
 			    				checkMapPoLine.put("poLine", "Y");
 			    				 
 			    				//校验明细行是否收料
 			    				double recNum=checkPoLineReceiving(modelService, checkPoLine.get(0).get("ID"));
 			    				
 			    				//无入库数量
 			    				if(recNum==0){
 			    					
 			    					checkMapPoLine.put("poLineReceiving", "N");
 			    					
 			    				}else{
 			    					
 			    					checkMapPoLine.put("poLineReceiving", "Y");
 			    					
 			    					if(recNum>Double.parseDouble(String.valueOf(wpdPlanNum))){
 			    					
 			    						errorMsgLine+="该PO行"+wpdSeq+"MES中已收料，收料数量为"+recNum+",大于同步数量:"+wpdPlanNum;
 			    						
 			    						checkMapPoLine.put("poLineReceivingNumType", "N");
 			    						
 			    					}else{
 			    						
 			    						checkMapPoLine.put("poLineReceivingNumType", "Y");
 			    						
 			    						checkMapPoLine.put("poLineReceivingNum", wpdPlanNum);
 			    						
 			    					}
 			    					
 			    					
 			    				}
 			    				
 			    				
 			    			 }else{
 			    				 
 			    				checkMapPoLine.put("poLine", "N");
 			    				 
 			    			 }
 			    			 
 			    		  }
 			    		  
 			    		
 			    	  }
		    	       
		    	       if(wpdSeq==null||wpdItemCode==null||itemVersion==null||wpdPlanNum==null||
		    	    		   wpdPlanUnit==null||erpSourceno==null||erpSourcelineno==null||
		    	    		   wpdDeliveryDate==null||flag==null||PURCHASETYPE==null){
		    	    	   
		    	    	   
		    	    	   if("".equals(errorMsgLine)){
		    	    		   errorMsgLine="该PO无以下节点";
		    			    	  
		    	    	   }
		    	    	   if(wpdSeq==null){
		    	    		   errorMsgLine+=" WPD_SEQ,";
	    			    	  }
	    			    	  if(wpdItemCode==null){
	    			    		  errorMsgLine+="WPD_ITEM_CODE,";
	    			    	  }
	    			    	  if(WRIMEMO==null){
	    			    		  errorMsgLine+="WRI_MEMO,";
	    			    	  }
	    			    	  if(PURCHASETYPE==null){
	    			    		  errorMsgLine+="PURCHASE_TYPE,";
	    			    	  }
	    			    	  if(WIPNAME==null){
	    			    		  errorMsgLine+="WIPNAME,";
	    			    	  }
	    			    	  if(itemVersion==null){
	    			    		  errorMsgLine+="ITEM_VERSION,";
	    			    	  }
	    			    	  if(wpdPlanNum==null){
	    			    		  errorMsgLine+="WPD_PLAN_NUM,";
	    			    	  }
	    			    	  if(wpdPlanUnit==null){
	    			    		  errorMsgLine+="WPD_PLAN_UNIT,";
	    			    	  }
	    			    	  if(erpSourceno==null){
	    			    		  errorMsgLine+="ERP_SOURCENO,";
	    			    	  }
	    			    	  if(erpSourcelineno==null){
	    			    		  errorMsgLine+="ERP_SOURCELINENO,";
	    			    	  }
	    			    	  if(wpdDeliveryDate==null){
	    			    		  errorMsgLine+="WPD_	DELIVERY_DATE,";
	    			    	  }
	    			    	  if(flag==null){
	    			    		  errorMsgLine+="FLAG";
	    			    	  }
	    			    	  break;
		    	       }else{
		    	    	   
		    	    	   if(wpdDeliveryDate.equals("")){
		    	    		   wpdDeliveryDate=DateUtil.getCurDateStr(); 
		    	    	   }else{
		    	    		   if(DateUtil.parseDate(String.valueOf(wpdDeliveryDate),"yyyy-MM-dd")==null){
				 		    		  
		    	    			   errorMsgLine+="此po所属ITEM信息WPD_DELIVERY_DATE时间格式有误";
				 		    	  } 
		    	    	   }
//		    	    	   if(!isInteger(String.valueOf(wpdSeq))){
//		    	    		   errorMsg+="此po所属ITEM信息WPD_SEQ不为数值";
//		    	    	   }
//		    	    	   if(!isInteger(String.valueOf(wpdPlanNum))){
//		    	    		   errorMsg+="此po所属ITEM信息WPD_PLAN_NUM不为数值";
//		    	    	   }

		    	       }
		    		  
		    	       checkMapPoLine.put("error", errorMsgLine);
		    		  
		    	       checkMapPo.put(String.valueOf(j), checkMapPoLine);
		    		  
				}
		       
		      
		      //无任何异常
		      if("".equals(errorMsg)){
		    	  	
		    	  dataAuth=getDataId(dataAuth);
		    	  
		    	  
		    	   //erpDoc是否存在
		    	  	sql = "SELECT * FROM T_WMS_RECEIVE_DOC  WHERE ERP_DOC  =?";
		    	  	
					list = modelService.listDataSql(sql, new Object[] {erpDoc});  	 
					
					if(list.size()>0){
						
						
						
						update=new TableDataMapExt();
						update.setTableName("T_WMS_RECEIVE_DOC");
						update.setSqlWhere(" and ID = '"+list.get(0).get("ID")+"' ");
						update.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd"));
						update.getColMap().put("ERP_DOC", erpDoc);// 采购单号
						update.getColMap().put("WRD_SUP_CODE",wpiSupCode);// 供应商代码
						update.getColMap().put("WRD_RECEIVE_TIME", DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd") );// erp填交货时间，mes对应更改到货日期
						update.getColMap().put("CREATE_USER", createUser);// 开单人
						update.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
						update.getColMap().put("WRD_MEMO", wpiMemo);// 备注
						update.getColMap().put("ERP_STUATE", erpStuate);// ERP状态
						update.getColMap().put("WRD_DOC_TYPE", "DJ02");// 单据类型
						update.getColMap().put("ERP_REVICETYPE", docType);// 收料类型
						
						modelService.edit(update);// 存储
						
						update=new TableDataMapExt();
						update.setTableName("T_WMS_DOC_INFO");
						update.setSqlWhere(" and WDI_DOC_NUM = '"+list.get(0).get("WRD_DOC_NUM")+"' ");
						update.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd"));
						update.getColMap().put("WDI_SUP_CODE",wpiSupCode);// 供应商代码
						update.getColMap().put("CREATE_USER", createUser);// 开单人
						update.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
						update.getColMap().put("WDI_MEMO", wpiMemo);// 备注
						update.getColMap().put("WDI_DOC_TYPE", "DJ02");// 单据类型
						update.getColMap().put("T_WMS_DOC_INFO", "Y");
						update.getColMap().put("WDI_STATUS", "1");
						modelService.edit(update);// 存储
						
						
						
						
						
						
						
							for (int j = 0; j < poItemDetailList.get(i).size(); j++) {
							
				    		//WPD_SEQ
				    	       wpdSeq=poItemDetailList.get(i).get(j).get("WPD_SEQ");
				    	      
				    	    //WPD_ITEM_CODE
				    	       wpdItemCode=poItemDetailList.get(i).get(j).get("WPD_ITEM_CODE");
				    	      
				    	    //ITEM_VERSION
				    	       itemVersion=poItemDetailList.get(i).get(j).get("ITEM_VERSION");
				    	      
				    	    //WPD_PLAN_NUM
				    	       wpdPlanNum=poItemDetailList.get(i).get(j).get("WPD_PLAN_NUM");
				    	      
				    	    //WPD_PLAN_UNIT
				    	       wpdPlanUnit=poItemDetailList.get(i).get(j).get("WPD_PLAN_UNIT");
				    	      
				    	    //ERP_SOURCENO
				    	       erpSourceno=poItemDetailList.get(i).get(j).get("ERP_SOURCENO");
				    	      
				    	    //ERP_SOURCELINENO
				    	       erpSourcelineno=poItemDetailList.get(i).get(j).get("ERP_SOURCELINENO");
				    	      
				    	    //WPD_DELIVERY_DATE
				    	       wpdDeliveryDate=poItemDetailList.get(i).get(j).get("WPD_DELIVERY_DATE");
				    	      
				    	    //flag
				    	       flag=poItemDetailList.get(i).get(j).get("FLAG");
				    	       
				    	     //PURCHASETYPE
				    	       PURCHASETYPE=poItemDetailList.get(i).get(j).get("PURCHASE_TYPE");//WRIMEMO
				    	     
				    	     //WRIMEMO
				    	       WRIMEMO=poItemDetailList.get(i).get(j).get("WRI_MEMO");
				    	       
				    	     //WIPNAME
				    	       WIPNAME=poItemDetailList.get(i).get(j).get("WIPNAME");
				    	       if(wpdDeliveryDate.equals("")){
				    	    		wpdDeliveryDate=DateUtil.getCurDateStr(); 
				    	    }  
				    	       
				    	       Map<String,Object> map = (Map<String, Object>) checkMapPo.get(String.valueOf(j));
				    	       
				    	       
				    	       if(map.get("poLine").equals("N")){
				    	    	   
				    	    	   save=new TableDataMapExt();
					    	       save.setTableName("T_WMS_RECEIVE_ITEM");
					    	       save.getColMap().put("WPD_SEQ", wpdSeq);
					    	       save.getColMap().put("WRI_DOC_NUM", list.get(0).get("WRD_DOC_NUM"));
					    	       save.getColMap().put("WRI_ITEM_CODE", wpdItemCode);
					    	       save.getColMap().put("WRI_PLAN_NUM", Double.parseDouble(String.valueOf(wpdPlanNum)));
					    	       save.getColMap().put("WPD_PLAN_UNIT", wpdPlanUnit);
					    	       save.getColMap().put("ID", StringUtils.getUUID());
					    	       save.getColMap().put("WRI_DELIVERY_DATE", DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd"));
					    	       save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
					    	       save.getColMap().put("ITEM_VERSION", itemVersion);
					    	       save.getColMap().put("ERP_SOURCENO", erpSourceno);
					    	       save.getColMap().put("ERP_SOURCELINENO", erpSourcelineno);
					    	       save.getColMap().put("FLAG", flag);
					    	       save.getColMap().put("PURCHASE_TYPE", PURCHASETYPE);
					    	       save.getColMap().put("WIPNAME", WIPNAME);
					    	       save.getColMap().put("WRI_CONNECT_DOC", erpDoc);
					    	       save.getColMap().put("WRI_MEMO", WRIMEMO);
					    	       save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd"));
					    	       
					    	       save.getColMap().put("WRI_STATUS", "1");
								   modelService.save(save);
				    	    	   
				    	       }else{
				    	    	   
				    	    	   if(map.get("poLineReceiving").equals("N")){
				    	    		   
				    	    		   update=new TableDataMapExt();
						    	       update.setTableName("T_WMS_RECEIVE_ITEM");
						    	       update.setSqlWhere("and WRI_DOC_NUM='"+list.get(0).get("WRD_DOC_NUM")+"' and WPD_SEQ="+wpdSeq+" ");
						    	       update.getColMap().put("WRI_ITEM_CODE", wpdItemCode);
						    	       update.getColMap().put("WRI_PLAN_NUM", Double.parseDouble(String.valueOf(wpdPlanNum)));
						    	       update.getColMap().put("WPD_PLAN_UNIT", wpdPlanUnit);
						    	       update.getColMap().put("WRI_IS_ADD", "U");
						    	       update.getColMap().put("WRI_DELIVERY_DATE", DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd"));
						    	       update.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
						    	       update.getColMap().put("ITEM_VERSION", itemVersion);
						    	       update.getColMap().put("ERP_SOURCENO", erpSourceno);
						    	       update.getColMap().put("ERP_SOURCELINENO", erpSourcelineno);
						    	       update.getColMap().put("FLAG", flag);
						    	       update.getColMap().put("WRI_MEMO", WRIMEMO);
						    	       update.getColMap().put("PURCHASE_TYPE", PURCHASETYPE);
						    	       update.getColMap().put("WIPNAME", WIPNAME);
						    	       update.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd"));
									   modelService.edit(update);
				    	    		   
				    	    	   }else{
				    	    		   
				    	    		   if(map.get("poLineReceivingNumType").equals("Y")){
				    	    			   update=new TableDataMapExt();
							    	       update.setTableName("T_WMS_RECEIVE_ITEM");
							    	       update.setSqlWhere("and WRI_DOC_NUM='"+list.get(0).get("WRD_DOC_NUM")+"' and WPD_SEQ="+wpdSeq+" ");
							    	       update.getColMap().put("WRI_PLAN_NUM", Double.parseDouble(String.valueOf(wpdPlanNum)));
							    	       update.getColMap().put("WRI_IS_ADD", "U");
							    	       modelService.edit(update);
				    	    			   
				    	    		   }else{
				    	    			   
				    	    			   returnErrorMsg+= toErrorStr(erpDoc,docType,errorMsgLine);
				    	    			   
				    	    		   }
				    	    		   
				    	    		   
				    	    	   }
				    	       }
							   addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),erpDoc);
						}
					}else{
			            //保存base信息
						//String WRD_DOC_NUM = getReceiveNo(String.valueOf(dataAuth),"DJ02",null,modelService);//入库单号
						save=new TableDataMapExt();
						save.setTableName("T_WMS_RECEIVE_DOC");
						save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd"));
						save.getColMap().put("WRD_DOC_NUM", erpDoc);
						save.getColMap().put("ERP_DOC", erpDoc);// 采购单号   PM_IS_ADD
						save.getColMap().put("WRD_STATUS", "1");
						save.getColMap().put("WRD_SUP_CODE",wpiSupCode);// 供应商代码
						save.getColMap().put("ID", StringUtils.getUUID());// 采购单表ID
						save.getColMap().put("WRD_RECEIVE_TIME", DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd") );// erp填交货时间，mes对应更改到货日期
						save.getColMap().put("CREATE_USER", createUser);// 开单人
						save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
						save.getColMap().put("WRD_MEMO", wpiMemo);// 备注
						save.getColMap().put("ERP_STUATE", erpStuate);// ERP状态
						save.getColMap().put("WRD_DOC_TYPE", "DJ02");// 单据类型
						save.getColMap().put("ERP_REVICETYPE", docType);// 收料类型
						modelService.save(save);// 存储
						
						
						
						save=new TableDataMapExt();
						save.setTableName("T_WMS_DOC_INFO");
						save.getColMap().put("WDI_DOC_NUM",erpDoc);// 供应商代码
						save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd"));
						save.getColMap().put("WDI_SUP_CODE",wpiSupCode);// 供应商代码
						save.getColMap().put("CREATE_USER", createUser);// 开单人
						save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
						save.getColMap().put("ID", StringUtils.getUUID());// 采购单表ID
						save.getColMap().put("WDI_MEMO", wpiMemo);// 备注
						save.getColMap().put("WDI_DOC_TYPE", "DJ02");// 单据类型
						save.getColMap().put("T_WMS_DOC_INFO", "Y");
						save.getColMap().put("WDI_STATUS", "1");
						modelService.save(save);// 存储
						
						
						for (int j = 0; j < poItemDetailList.get(i).size(); j++) {
							
				    		//WPD_SEQ
				    	       wpdSeq=poItemDetailList.get(i).get(j).get("WPD_SEQ");
				    	      
				    	    //WPD_ITEM_CODE
				    	       wpdItemCode=poItemDetailList.get(i).get(j).get("WPD_ITEM_CODE");
				    	      
				    	    //ITEM_VERSION
				    	       itemVersion=poItemDetailList.get(i).get(j).get("ITEM_VERSION");
				    	      
				    	    //WPD_PLAN_NUM
				    	       wpdPlanNum=poItemDetailList.get(i).get(j).get("WPD_PLAN_NUM");
				    	      
				    	    //WPD_PLAN_UNIT
				    	       wpdPlanUnit=poItemDetailList.get(i).get(j).get("WPD_PLAN_UNIT");
				    	      
				    	    //ERP_SOURCENO
				    	       erpSourceno=poItemDetailList.get(i).get(j).get("ERP_SOURCENO");
				    	      
				    	    //ERP_SOURCELINENO
				    	       erpSourcelineno=poItemDetailList.get(i).get(j).get("ERP_SOURCELINENO");
				    	      
				    	    //WPD_DELIVERY_DATE
				    	       wpdDeliveryDate=poItemDetailList.get(i).get(j).get("WPD_DELIVERY_DATE");
				    	      
				    	    //flag
				    	       flag=poItemDetailList.get(i).get(j).get("FLAG");
				    	       
				    	     //PURCHASETYPE
				    	       PURCHASETYPE=poItemDetailList.get(i).get(j).get("PURCHASE_TYPE");//WRIMEMO
				    	     
				    	     //WRIMEMO
				    	       WRIMEMO=poItemDetailList.get(i).get(j).get("WRI_MEMO");
				    	       
				    	       //WIPNAME
				    	       WIPNAME=poItemDetailList.get(i).get(j).get("WIPNAME");

				    	       if(wpdDeliveryDate.equals("")){
				    	    		wpdDeliveryDate=DateUtil.getCurDateStr(); 
				    	    }  
				    	       
				    	       save=new TableDataMapExt();
				    	       save.setTableName("T_WMS_RECEIVE_ITEM");
				    	       save.getColMap().put("WPD_SEQ", wpdSeq);
				    	       save.getColMap().put("WRI_DOC_NUM", erpDoc);
				    	       save.getColMap().put("WRI_ITEM_CODE", wpdItemCode);
				    	       save.getColMap().put("WRI_PLAN_NUM", Double.parseDouble(String.valueOf(wpdPlanNum)));
				    	       save.getColMap().put("WPD_PLAN_UNIT", wpdPlanUnit);
				    	       save.getColMap().put("ID", StringUtils.getUUID());
				    	       save.getColMap().put("WRI_DELIVERY_DATE", DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd"));
				    	       save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
				    	       save.getColMap().put("ITEM_VERSION", itemVersion);
				    	       save.getColMap().put("ERP_SOURCENO", erpSourceno);
				    	       save.getColMap().put("ERP_SOURCELINENO", erpSourcelineno);
				    	       save.getColMap().put("FLAG", flag);
				    	       save.getColMap().put("WRI_MEMO", WRIMEMO);
				    	       save.getColMap().put("PURCHASE_TYPE", PURCHASETYPE);
				    	       save.getColMap().put("WIPNAME", WIPNAME);
				    	       save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd"));
				    	       save.getColMap().put("WRI_CONNECT_DOC", erpDoc);
				    	       save.getColMap().put("WRI_STATUS", "1");
							   modelService.save(save);
							   addErrorDate(save,  String.valueOf(poItemDetailList.get(i)), toErrorXml(returnErrorMsg),erpDoc);
						}
					}
		      }else{
		    	  returnErrorMsg+= toErrorStr(erpDoc,docType,errorMsg);
		      }
		      
		      errorMsg="";
		       
		}
	      
	      addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),"DOCNUM"); 
	    if(returnErrorMsg.equals("")){
	    	
	    	resmap.put("isSuccess", "Y");
	    	resmap.put("errorMsg", null);
	    	
	    	
	    }else{
	    	hbtran.commit();
	    	resmap.put("isSuccess", "N");
	    	resmap.put("errorMsg", toErrorXml(returnErrorMsg));
	    	return resmap;
	    }
	      
	      
		} catch (Exception e) {
			log.error(e);
			hbtran.rollback();
			resmap.put("isSuccess", "N");
	    	resmap.put("errorMsg", toErrorXml(toErrorStr("","",e.toString())));
	    	addErrorDate(save, xmlMsg, toErrorXml(toErrorStr("","",e.toString())),null);
			return resmap;
		
		}
		  
		  hbtran.commit();
		return resmap;

	}

   
	public boolean isInteger(String str) {
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		return pattern.matcher(str).matches();
	}
	@SuppressWarnings("unchecked")
	public String getReceiveNo(String ids,String prefix,String dispatchSn,ModelService modelService){
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = {1, 2, 3};
	    int[] outplace = {4, 5};
	    List<Object> list = new ArrayList<Object>();
	    List<Object> outType = new ArrayList<Object>();
	    list.add(ids);
	    list.add(prefix);
	    list.add(dispatchSn);
	    outType.add("String");
	    outType.add("String");
	    pf.setClassName("P_C_GET_DOC_NO");//生成检验单号
	    pf.setInPlace(inPlace);//存储过程中in 
	    pf.setOutPlace(outplace); //存储过程中out
	    pf.setValArgs(list);//存储过程中输入的参数
	    pf.setTotalLen(list.size()+outType.size());//总个数
	    pf.setOutValType(outType);//输出的参数
	    List<Object> relist = modelService.procComm(pf);//接收返回值
	    String res = (String) relist.get(0);  //结果
		return res;
	}


	
	String toErrorStr(Object...objects){
		
		String xmlStr=
				"<DATA>\n"
				+ "<ERP_DOC>"+String.valueOf(objects[0])+"</ERP_DOC>\n"
				+ "<DOC_TYPE>"+String.valueOf(objects[1])+"</DOC_TYPE>\n"
				+ "<ERROR_MSG>"+String.valueOf(objects[2])+"</ERROR_MSG>\n"
				+ "</DATA>\n";
		
		return xmlStr;
	}
	
	
	String toErrorXml(String string){
		
		String xml="<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
				+ "<MESDATAS>\n"
				+string
				+ "</MESDATAS>";
		return xml;
	}
	
	
	
	//数值装换
	 Integer toInteger(Object object){
		if(object!=null&&!"".equals(object)&&!"null".equals(object)){
			return Integer.parseInt(String.valueOf(object));
		}else{
			return 0;
		}
		
	}

	 @SuppressWarnings({ "unchecked", "rawtypes" })
	Object getDataId(Object object){
		 String data = "select ID from sy_dept t where T.dep_sn = ?";
		 
         List<Map> list = modelService.listDataSql(data, new Object[] { object });
		 
		 if(list.size()>0){
			 
			 return String.valueOf(list.get(0).get("ID"));
			 
		 }else{
			 
			 return "";
		 }
		 
	 }
	 
	 @SuppressWarnings("unchecked")
	int addErrorDate(TableDataMapExt save,Object erpJson,Object mesJson,Object erpno){
		 save=new TableDataMapExt();
		 save.setTableName("T_CO_ERPLOG");
		 save.getColMap().put("ID", StringUtils.getUUID());
		 save.getColMap().put("ERPJASON", erpJson);
		 save.getColMap().put("MESJASON", mesJson);
		 save.getColMap().put("OPERATEDATE", DateUtil.getCurDate());
		 save.getColMap().put("OBJECTNAME", "PURCHASE");
		 save.getColMap().put("SYNCDIRECTION", "1");
		 save.getColMap().put("ERPNO", erpno);
		 return modelService.save(save);
	 }
	 @SuppressWarnings("unchecked")
		boolean statusCheck(ModelService modelService, String erpNum){
			 
			 String sql = "select * from T_WMS_RECEIVE_ITEM where WRI_CONNECT_DOC = ? and WRI_STATUS <>'1' ";
			 
			 List<Map> list=modelService.listDataSql(sql, new Object[]{erpNum});

         return list.size() == 0;
			 
		 }
	 
	 @SuppressWarnings("unchecked")
	//判断指定入库单是否存在
	 
	 List<Map> checkPo(ModelService modelService ,Object erpDoc){
		 
		 String sql="SELECT * FROM T_WMS_RECEIVE_DOC  WHERE ERP_DOC  =? ";
		    	  	
		return modelService.listDataSql(sql, new Object[] {erpDoc});    
		 
		 
	 }
	 
	 @SuppressWarnings("unchecked")
	//校验指定po行是否存在
	 List<Map> checkPoLine(ModelService modelService ,Object wriDocNum ,Object wpdSeq){
		 
		 String sql = "SELECT * FROM T_WMS_RECEIVE_ITEM WHERE WRI_DOC_NUM=? AND WPD_SEQ=? ";
		 
		 return modelService.listDataSql(sql, new Object[] {wriDocNum,wpdSeq});
		 
	 }
	 
	 //校验po行是否有收料记录存在
	 @SuppressWarnings("unchecked")
	double checkPoLineReceiving(ModelService modelService,Object itemId){
		 
		 String sql="select nvl(sum(WRD_RECEIVE_NUM),0) as WRD_RECEIVE_NUM from T_WMS_RECEIVE_DETAIL where WRD_ITEM_ID=? ";
		 
		 List<Map> list = modelService.listDataSql(sql, new Object[] {itemId});
		 
		 if(String.valueOf(list.get(0).get("WRD_RECEIVE_NUM")).equals("0")){
			 
			 return 0;
			 
		 }else{
			 
			 return Double.parseDouble(String.valueOf(list.get(0).get("WRD_RECEIVE_NUM")));
		 }
	 }
}
