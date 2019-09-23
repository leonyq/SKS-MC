
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
 * @Description: 销售发货 接收参数 msg 
 * @author:zw
 * @version:1.0
 * @since 2018年3月29日下午8:10:01
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */

public class SaleOutStockSync implements IWebService {
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
		
        String Only = StringUtils.getUUID();
        
        String returnErrorMsg = "";
        
		Map<String, Object> resmap = new HashMap<String, Object>();// 存返回数据
		
		Map<String,Object> poBaseMap;
		
		Map<String,Object> poDetailMap;
		
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
	      
	      //WOD_CUST_CODE
	      Object wodcustcode;
	      
	      //CUST_ADDRESS
	      Object custaddress;
	      
	      //WRD_CREATE_MAN
	      Object createUser;
	      
	      //WRD_CREATE_TIME
	      Object createTime;
	      
	      //DATA_AUTH
	      Object dataAuth;
	      
	      
	      /**
	       * 定义采购入库单标准信息(detail)
	       */
	      
	    //WOI_ITEM_CODE
	      Object woditemcode;
	      
	    //WOI_UNITS
	      Object wodunits;
	      
	    //WOI_PLAN_NUM
	      Object wodoutstocknum;
	      
	    //WOI_ITEM_SEQ
	      Object woditemseq;
	      
	    //ERP_SOURCENO
	      Object erpsourceno;
	      
	    //ERP_SOURCELINENO
	      Object erpsourcelineno;
	      
	    //ERP_LINESTUATE
	      Object erplinestuate;
	      
	    //WOI_DELIVERY_DATE
	      Object wodoutstockdate;
	      
	    //WOD_URGENT_FLAG
	      Object wodurgentflag;

		  //WOI_MEMO
	      Object wodmemo;

		  //CREATE_USER
	      Object createuser;

		  //CREATE_TIME
	      Object createtime;
	      Object itemversion;
	     
	      String errorMsg=""; 
	      
	      
	      for (int i = 0; i < poBaseList.size(); i++) {
			
	    	  //ERP_DOC
	    	  erpDoc=poBaseList.get(i).get("ERP_DOC");
	    	  
	    	  //WOD_CUST_CODE
		       wodcustcode=poBaseList.get(i).get("WOD_CUST_CODE");
		      
		      //CUST_ADDRESS
		       custaddress=poBaseList.get(i).get("CUST_ADDRESS");
		      
		      //CREATE_USER
		       createUser=poBaseList.get(i).get("WRD_CREATE_MAN");
		      
		      //CREATE_TIME
		       createTime=poBaseList.get(i).get("WRD_CREATE_TIME");
		      
		      //DATA_AUTH
		       dataAuth=poBaseList.get(i).get("DATA_AUTH");
		      
	    	  
	    	  //如果存在一个节点异常(无已上任意一节点)
		      if(erpDoc==null||wodcustcode==null||custaddress==null||createUser==null
		    		  ||createTime==null||dataAuth==null ){
		    	  if("".equals(errorMsg)){
		    		  errorMsg="该PO表头出无以下节点";
		    	  
		    	  } 	  
		    	  if(erpDoc==null){
		    		  errorMsg+="ERP_DOC,";
		    	  }
		    	  if(wodcustcode==null){
		    		  errorMsg+="WOD_CUST_CODE,";
		    	  }
		    	  if(custaddress==null){
		    		  errorMsg+="CUST_ADDRESS,";
		    	  }
		    	  if(createUser==null){
		    		  errorMsg+="WRD_CREATE_MAN,";
		    	  }
		    	  if(createTime==null){
		    		  errorMsg+="WRD_CREATE_TIME,";
		    	  }
		    	  if(dataAuth==null){
		    		  errorMsg+="DATA_AUTH,";
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
					
		    		//WOI_ITEM_CODE
		    	       woditemcode=poItemDetailList.get(i).get(j).get("WOI_ITEM_CODE");
		    	      
		    	    //WOI_UNITS
		    	       wodunits=poItemDetailList.get(i).get(j).get("WOI_UNITS");
		    	      
		    	    //WOI_PLAN_NUM
		    	       wodoutstocknum=poItemDetailList.get(i).get(j).get("WOI_PLAN_NUM");
		    	      
		    	    //WOI_ITEM_SEQ
		    	       woditemseq=poItemDetailList.get(i).get(j).get("WOI_ITEM_SEQ");
		    	      
		    	    //ERP_SOURCENO
		    	       erpsourceno=poItemDetailList.get(i).get(j).get("ERP_SOURCENO");
		    	      
		    	    //ERP_SOURCELINENO
		    	       erpsourcelineno=poItemDetailList.get(i).get(j).get("ERP_SOURCELINENO");
		    	      
		    	    //ERP_LINESTUATE
		    	       erplinestuate=poItemDetailList.get(i).get(j).get("ERP_LINESTUATE");

                    //WOI_DELIVERY_DATE
					   wodoutstockdate=poItemDetailList.get(i).get(j).get("WOI_DELIVERY_DATE");

                    //WOD_URGENT_FLAG
					   wodurgentflag=poItemDetailList.get(i).get(j).get("WOD_URGENT_FLAG");

					 //WOI_MEMO
					   wodmemo=poItemDetailList.get(i).get(j).get("WOI_MEMO");

					 //CREATE_USER
					   createuser=poItemDetailList.get(i).get(j).get("CREATE_USER");

					 //CREATE_TIME
					   createtime=poItemDetailList.get(i).get(j).get("CREATE_TIME");
					   itemversion = poItemDetailList.get(i).get(j).get("ITEM_VERSION");
		    	    
		    		  
		    		  
		    	       if(woditemcode==null||wodunits==null||wodoutstocknum==null||woditemseq==null||
		    	    		   erpsourceno==null||erpsourcelineno==null||erplinestuate==null||
		    	    		   wodoutstockdate==null||wodurgentflag==null||wodmemo==null||createuser==null||createtime==null||itemversion==null){
		    	    	   
		    	    	   
		    	    	   if("".equals(errorMsg)){
		    			    		  errorMsg="该PO表身无以下节点";
		    			    	  
		    	    	   }
		    	    	   if(woditemcode==null){
	    			    		  errorMsg+=" WOI_ITEM_CODE,";
	    			    	  }
	    			    	  if(wodunits==null){
	    			    		  errorMsg+="WOI_UNITS,";
	    			    	  }
	    			    	  if(wodoutstocknum==null){
	    			    		  errorMsg+="WOI_PLAN_NUM,";
	    			    	  }
	    			    	  if(woditemseq==null){
	    			    		  errorMsg+="WOI_ITEM_SEQ,";
	    			    	  }
	    			    	  if(erpsourceno==null){
	    			    		  errorMsg+="ERP_SOURCENO,";
	    			    	  }
	    			    	  if(erpsourcelineno==null){
	    			    		  errorMsg+="ERP_SOURCELINENO,";
	    			    	  }
	    			    	  if(erplinestuate==null){
	    			    		  errorMsg+="ERP_LINESTUATE,";
	    			    	  }
	    			    	  if(wodoutstockdate==null){
	    			    		  errorMsg+="WOI_DELIVERY_DATE,";
	    			    	  }
	    			    	  if(wodurgentflag==null){
	    			    		  errorMsg+="WOD_URGENT_FLAG";
	    			    	  }
							   if(wodmemo==null){
	    			    		  errorMsg+="WOI_MEMO";
	    			    	  }
							   if(createuser==null){
	    			    		  errorMsg+="CREATE_USER";
	    			    	  }
							   if(createtime==null){
	    			    		  errorMsg+="CREATE_TIME";
	    			    	  }
							   if(itemversion==null){
		    			    		  errorMsg+="ITEM_VERSION";
		    			    	  }
	    			    	  break;
		    	       }else{
		    	    	   
		    	    	   if(wodoutstockdate.equals("")){
		    	    		   wodoutstockdate=DateUtil.getCurDateStr(); 
		    	    	   }else{
		    	    		   if(DateUtil.parseDate(String.valueOf(wodoutstockdate),"yyyy-MM-dd")==null){
				 		    		  
				 		    		  errorMsg+="此po所属ITEM信息WOD_OUTSTOCK_DATE时间格式有误";
				 		    	  } 
		    	    	   }

						   if(createtime.equals("")){
		    	    		   createtime=DateUtil.getCurDateStr(); 
		    	    	   }else{
		    	    		   if(DateUtil.parseDate(String.valueOf(createtime),"yyyy-MM-dd")==null){
				 		    		  
				 		    		  errorMsg+="此po所属ITEM信息CREATE_TIME时间格式有误";
				 		    	  } 
		    	    	   }
//		    	    	   if(!isInteger(String.valueOf(wodoutstocknum))){
//		    	    		   errorMsg+="此po所属ITEM信息WOI_PLAN_NUM不为数值";
//		    	    	   }
		    	    	   if(!isInteger(String.valueOf(woditemseq))){
		    	    		   errorMsg+="此po所属ITEM信息WOI_ITEM_SEQ不为数值";
		    	    	   }
		    	       }
		    		  
		    		  
		    		  
		    		  
				}
		       
		      
		      //无任何异常
		      if("".equals(errorMsg)){
		    	  	
		    	  dataAuth=getDataId(dataAuth);
		    	  
		    	  
		    	  if(erpDoc.equals("")||erpDoc==null){
			    	  int LLSIZE1=poItemDetailList.get(i).size();
			    	  for(int LL=0;LL<LLSIZE1;LL++){
			    		  String woditemseq1=poItemDetailList.get(i).get(LL).get("WOI_ITEM_SEQ").toString();
			    		  String SQL1027 = "select nvl(t.woi_out_num,0) woi_out_num from t_wms_outstock_item t where t.woi_item_seq='"+woditemseq1+"'";
			    		  List<Map> list1027 = modelService.listDataSql(SQL1027);
//			    		  String woi_doc_num=list1027.get(0).get("woi_out_num").toString();//库存中出库单号
			    		  double WOI_OUT_NUM=Double.parseDouble(list1027.get(0).get("woi_out_num").toString());//出库数量
			    		  double WOI_PLAN_NUM=Double.parseDouble(poItemDetailList.get(i).get(LL).get("WOI_PLAN_NUM").toString());//报文中的计划数量
			    		  String erpnoline=poItemDetailList.get(i).get(LL).get("ERP_LINESTUATE").toString();
			    		  double erpnoline1 = Double.parseDouble(erpnoline);
			    		  if(erpnoline1<40){
				    		  if((list1027!=null&&list1027.size()<=1)&&WOI_OUT_NUM<=WOI_PLAN_NUM){
				    			  continue;
				    		  }else{
				    			  returnErrorMsg+= toErrorStr(erpDoc,null,"一个订单行号只有一条销售订单或者销售发货数量<出库数量");
								  addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),null);
								  break;
				    		  }
			    		  }else{
			    			  returnErrorMsg+= toErrorStr(erpDoc,null,"发货状态大于39");
							  addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),null);
							  break;
			    		  }
			    	  }
		    	  
		    	  }
		    	   //erpDoc是否存在
		    	  	sql = "SELECT * FROM T_WMS_OUTSTOCK_DOC  WHERE ERP_DOC  =?";
		    	  	boolean ck=true; //标识是否变更
		    	  	list = modelService.listDataSql(sql, new Object[] {erpDoc});
		    	  	
					if(list.size()>0){
						int LLSIZE=poItemDetailList.get(i).size();
							for(int LL=0;LL<LLSIZE;LL++){
								String outnum =" select nvl(WOI_OUT_NUM,0) num1 from t_wms_outstock_item t where t.WOI_DOC_NUM=? and t.WOI_ITEM_SEQ=?";
								String woditemseq1=poItemDetailList.get(i).get(LL).get("WOI_ITEM_SEQ").toString();
								String woiItemSeq=poItemDetailList.get(i).get(LL).get("ERP_LINESTUATE").toString();
								String sql023 = "select * from t_wms_outstock_item t where t.WOI_ITEM_SEQ='"+woditemseq1+"' " +
										" and ERP_LINESTUATE ='"+woiItemSeq+"'"+
										" and WOI_DOC_NUM <> '"+erpDoc+"'";
								List<Map> list023 = modelService.listDataSql(sql023);
								//String WOI_DOC_NUM =list023.get(0).get("WOI_DOC_NUM").toString();
								String erpnoline=poItemDetailList.get(i).get(LL).get("ERP_LINESTUATE").toString();
								double erpnoline1 = Double.parseDouble(erpnoline);
								if(erpnoline1<40){
									if(list023.size()>0&&list023.size()<=1){
										ck=true;
									}else{
										returnErrorMsg+= toErrorStr(erpDoc,null,"一个订单行号只有一条销售订单");
										addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),null);
										ck=false;
										break;
									}
									
								}else if(list023.isEmpty()){
									ck=true;
								}else{
									returnErrorMsg+= toErrorStr(erpDoc,null,"一个订单行号只有一条销售订单或者销售状态>40");
									addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),null);
									ck=false;
									break;
								}
								double plannum=Double.parseDouble(poItemDetailList.get(i).get(LL).get("WOI_PLAN_NUM").toString());//erp变更数量
								List<Map> list0001 = modelService.listDataSql(outnum, new Object[] {erpDoc,woditemseq1});
								if(list0001!=null&&list0001.size()>0){
									double outnum1=Double.parseDouble(list0001.get(0).get("num1").toString());//销售单出库数量
									if(plannum>=outnum1){
										ck=true;
									  }else{
										  returnErrorMsg+= toErrorStr(erpDoc,null,"erp销售单变更数量小于出库数量");
										  addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),null);
										  ck=false;
										  break;
									  }
									}else{
										ck=true;
									}
								}
			    	     if(ck){
			    	    	    update=new TableDataMapExt();
								update.setTableName("T_WMS_OUTSTOCK_DOC");
								update.setSqlWhere(" and ERP_DOC = '"+list.get(0).get("ERP_DOC")+"' ");
								update.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd"));
								update.getColMap().put("ERP_DOC", erpDoc);// 采购单号
								update.getColMap().put("WOD_CUST_CODE",wodcustcode);// 
								update.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd") );// erp填交货时间，mes对应更改到货日期
								update.getColMap().put("CREATE_USER", createUser);// 开单人
								update.getColMap().put("WOD_CREATE_MAN", createUser);
								update.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
								update.getColMap().put("CUST_ADDRESS", custaddress);// 
								modelService.edit(update);// 存储-----------------------------------0912 12:07
								update=new TableDataMapExt();
								update.setTableName("T_WMS_DOC_INFO");
								update.setSqlWhere(" and WDI_DOC_NUM = '"+list.get(0).get("WOD_DOC_NUM")+"' ");
								update.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd"));
								update.getColMap().put("WDI_CUST_CODE",wodcustcode);// 供应商代码
								update.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
								update.getColMap().put("WDI_DOC_TYPE", "DJ11");// 单据类型
								update.getColMap().put("T_WMS_DOC_INFO", "Y");
								update.getColMap().put("WDI_STATUS", "1");
								modelService.edit(update);// 存储
									for (int j = 0; j < poItemDetailList.get(i).size(); j++) {
						    		//WOD_ITEM_CODE
										woditemcode=poItemDetailList.get(i).get(j).get("WOI_ITEM_CODE");
						    	      
						    	    //WOD_UNITS
										wodunits=poItemDetailList.get(i).get(j).get("WOI_UNITS");
						    	      
						    	    //WOD_OUTSTOCK_NUM
										wodoutstocknum=poItemDetailList.get(i).get(j).get("WOI_PLAN_NUM");
						    	      
						    	    //WOD_ITEM_SEQ
										woditemseq=poItemDetailList.get(i).get(j).get("WOI_ITEM_SEQ");
						    	      
						    	    //ERP_SOURCENO
										erpsourceno=poItemDetailList.get(i).get(j).get("ERP_SOURCENO");
						    	      
						    	    //ERP_SOURCELINENO
										erpsourcelineno=poItemDetailList.get(i).get(j).get("ERP_SOURCELINENO");
						    	      
						    	    //ERP_LINESTUATE
										erplinestuate=poItemDetailList.get(i).get(j).get("ERP_LINESTUATE");
						    	      
						    	    //WOD_OUTSTOCK_DATE
										wodoutstockdate=poItemDetailList.get(i).get(j).get("WOI_DELIVERY_DATE");
						    	      
						    	    //WOD_URGENT_FLAG
										wodurgentflag=poItemDetailList.get(i).get(j).get("WOD_URGENT_FLAG");
										
										 //WOD_MEMO
										wodmemo=poItemDetailList.get(i).get(j).get("WOI_MEMO");
										 //CREATE_USER
										createuser=poItemDetailList.get(i).get(j).get("CREATE_USER");
										 //CREATE_TIME
										createtime=poItemDetailList.get(i).get(j).get("CREATE_TIME");
										itemversion = poItemDetailList.get(i).get(j).get("ITEM_VERSION");
						    	       if(wodoutstockdate.equals("")){
						    	    	   wodoutstockdate=DateUtil.getCurDateStr(); 
						    	       }  
						    	       if(createtime.equals("")){
						    	    	   createtime=DateUtil.getCurDateStr(); 
						    	       } 
						    	       update=new TableDataMapExt();
						    	       update.setTableName("T_WMS_OUTSTOCK_ITEM");
						    	    	   update.setSqlWhere("and WOI_DOC_NUM='"+list.get(0).get("WOD_DOC_NUM")+"' and WOI_ITEM_SEQ='"+woditemseq+"'");
							    	       update.getColMap().put("WOI_ITEM_CODE", woditemcode);
							    	       update.getColMap().put("WOD_PLAN_UNIT", wodunits);//toInteger(wodoutstocknum)
							    	       String sql001 ="select OUTSTOCK_NUM from T_WMS_UNPRODOUTSTOCK where WOD_ITEM_SEQ=?";
							    	       List<Map> list1 = modelService.listDataSql(sql001, new Object[] {woditemseq});
							    	       if(list1.size()>0){
							    	    	   double qwe =Double.parseDouble(list1.get(0).get("OUTSTOCK_NUM").toString());
											   double wodoutstocknum1 = Double.parseDouble(wodoutstocknum.toString());
											   double num = wodoutstocknum1-qwe;
											   update.getColMap().put("WOI_PLAN_NUM", num);
							    	       }else{
							    	    	   update.getColMap().put("WOI_PLAN_NUM", Double.parseDouble(wodoutstocknum.toString()));
							    	       }
//							    	       update.getColMap().put("WOI_ITEM_SEQ", toInteger(woditemseq));//DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd")
							    	       update.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
							    	       update.getColMap().put("ERP_SOURCENO", erpsourceno);
							    	       update.getColMap().put("ERP_SOURCELINENO", erpsourcelineno);
							    	       update.getColMap().put("ERP_LINESTUATE", erplinestuate);
							    	       update.getColMap().put("WOI_DELIVERY_DATE", DateUtil.parseDate(String.valueOf(wodoutstockdate), "yyyy-MM-dd"));
							    	       update.getColMap().put("WOD_URGENT_FLAG", wodurgentflag);
							    	       update.getColMap().put("WOI_MEMO", wodmemo);
							    	       update.getColMap().put("CREATE_USER", createuser);//createtime
							    	       update.getColMap().put("ITEM_VERSION", itemversion);//createtime
							    	       update.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd"));
										   int num = modelService.edit(update);
										   if(num==0){
											   save=new TableDataMapExt();
								    	       save.setTableName("T_WMS_OUTSTOCK_ITEM");
								    	       save.getColMap().put("WOI_DOC_NUM", erpDoc);
								    	       save.getColMap().put("ID", StringUtils.getUUID());
								    	       save.getColMap().put("WOI_ITEM_CODE", woditemcode);
								    	       save.getColMap().put("WOD_PLAN_UNIT", wodunits);//toInteger(wodoutstocknum)
								    	       String sql002 ="select nvl(OUTSTOCK_NUM,0) from T_WMS_UNPRODOUTSTOCK where WOD_ITEM_SEQ=?";
								    	       List<Map> list2 = modelService.listDataSql(sql002, new Object[] {woditemseq});
								    	       if(list1.size()>0){
								    	    	   double qwe =Double.parseDouble(list2.get(0).get("OUTSTOCK_NUM").toString());
												   double wodoutstocknum1 = Double.parseDouble(wodoutstocknum.toString());
												   double num001 = wodoutstocknum1-qwe;
												   save.getColMap().put("WOI_PLAN_NUM", num001);
								    	       }else{
								    	    	   save.getColMap().put("WOI_PLAN_NUM", Double.parseDouble(wodoutstocknum.toString()));
								    	       }
								    	       save.getColMap().put("WOI_ITEM_SEQ", woditemseq);//DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd")
								    	       save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
								    	       save.getColMap().put("ERP_SOURCENO", erpsourceno);
								    	       save.getColMap().put("ERP_SOURCELINENO", erpsourcelineno);
								    	       save.getColMap().put("ERP_LINESTUATE", erplinestuate);
								    	       save.getColMap().put("WOI_DELIVERY_DATE", DateUtil.parseDate(String.valueOf(wodoutstockdate), "yyyy-MM-dd"));
								    	       save.getColMap().put("WOD_URGENT_FLAG", wodurgentflag);
								    	       save.getColMap().put("WOI_MEMO", wodmemo);
								    	       save.getColMap().put("WOI_CONNECT_DOC", erpDoc);//WOI_STATUS
								    	       save.getColMap().put("WOI_STATUS", "1");
								    	       save.getColMap().put("CREATE_USER", createuser);//createtime
								    	       save.getColMap().put("ITEM_VERSION", itemversion);//createtime
								    	       save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd"));
											   modelService.save(save);
										   }
										   addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),erpDoc);
						    	       }
								}
						
					}else if(erpDoc.equals("")||erpDoc==null){
						for (int j = 0; j < poItemDetailList.get(i).size(); j++) {
								woditemcode=poItemDetailList.get(i).get(j).get("WOI_ITEM_CODE");
								wodunits=poItemDetailList.get(i).get(j).get("WOI_UNITS");
								wodoutstocknum=poItemDetailList.get(i).get(j).get("WOI_PLAN_NUM");
								woditemseq=poItemDetailList.get(i).get(j).get("WOI_ITEM_SEQ");
								erpsourceno=poItemDetailList.get(i).get(j).get("ERP_SOURCENO");
								erpsourcelineno=poItemDetailList.get(i).get(j).get("ERP_SOURCELINENO");
								erplinestuate=poItemDetailList.get(i).get(j).get("ERP_LINESTUATE");
								wodoutstockdate=poItemDetailList.get(i).get(j).get("WOI_DELIVERY_DATE");
								wodurgentflag=poItemDetailList.get(i).get(j).get("WOD_URGENT_FLAG");
								wodmemo=poItemDetailList.get(i).get(j).get("WOI_MEMO");
								createuser=poItemDetailList.get(i).get(j).get("CREATE_USER");
								createtime=poItemDetailList.get(i).get(j).get("CREATE_TIME");
								itemversion = poItemDetailList.get(i).get(j).get("ITEM_VERSION");
				    	       if(wodoutstockdate.equals("")){
				    	    	   wodoutstockdate=DateUtil.getCurDateStr(); 
				    	       }  
				    	       if(createtime.equals("")){
				    	    	   createtime=DateUtil.getCurDateStr(); 
				    	       } 
				    	       update=new TableDataMapExt();
				    	       update.setTableName("T_WMS_OUTSTOCK_ITEM");
				    	    	   update.setSqlWhere("and WOI_ITEM_SEQ='"+woditemseq+"'");
					    	       update.getColMap().put("WOI_ITEM_CODE", woditemcode);
					    	       update.getColMap().put("WOD_PLAN_UNIT", wodunits);//toInteger(wodoutstocknum)
					    	       String sql001 ="select OUTSTOCK_NUM from T_WMS_UNPRODOUTSTOCK where WOD_ITEM_SEQ=?";
					    	       List<Map> list1 = modelService.listDataSql(sql001, new Object[] {woditemseq});
					    	       if(list1.size()>0){
					    	    	   double qwe =Double.parseDouble(list1.get(0).get("OUTSTOCK_NUM").toString());
									   double wodoutstocknum1 = Double.parseDouble(wodoutstocknum.toString());
									   double num = wodoutstocknum1-qwe;
									   update.getColMap().put("WOI_PLAN_NUM", num);
					    	       }else{
					    	    	   update.getColMap().put("WOI_PLAN_NUM", Double.parseDouble(wodoutstocknum.toString()));
					    	       }
//					    	       update.getColMap().put("WOI_ITEM_SEQ", toInteger(woditemseq));//DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd")
					    	       update.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
					    	       update.getColMap().put("ERP_SOURCENO", erpsourceno);
					    	       double erpsourcelineno1 = Double.parseDouble(erpsourcelineno.toString());
					    	       if(erpsourcelineno1<40){
					    	    	   update.getColMap().put("ERP_SOURCELINENO", erpsourcelineno);
					    	       }else{
					    	    	   returnErrorMsg+= toErrorStr(erpDoc,null,"erp行状态大于40");
									   addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),null);
					    	       }
					    	       update.getColMap().put("ERP_LINESTUATE", erplinestuate);
					    	       update.getColMap().put("WOI_DELIVERY_DATE", DateUtil.parseDate(String.valueOf(wodoutstockdate), "yyyy-MM-dd"));
					    	       update.getColMap().put("WOD_URGENT_FLAG", wodurgentflag);
					    	       update.getColMap().put("WOI_MEMO", wodmemo);
					    	       update.getColMap().put("CREATE_USER", createuser);//createtime
					    	       update.getColMap().put("ITEM_VERSION", itemversion);//createtime
					    	       update.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd"));
								   modelService.edit(update);
								   addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),erpDoc);
				    	       }
					}else{
			            //保存base信息
						//String WOD_DOC_NUM = getReceiveNo(String.valueOf(dataAuth),"DJ11",null,modelService);//入库单号
						save=new TableDataMapExt();
						save.setTableName("T_WMS_OUTSTOCK_DOC");
						save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd"));
						save.getColMap().put("WOD_DOC_NUM", erpDoc);
						save.getColMap().put("ERP_DOC", erpDoc);// 采购单号
						save.getColMap().put("WOD_CUST_CODE",wodcustcode);// 供应商代码
						save.getColMap().put("ID", StringUtils.getUUID());// 采购单表ID
						save.getColMap().put("CREATE_USER", createUser);// 开单人
						save.getColMap().put("WOD_CREATE_MAN", createUser);
						save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
						save.getColMap().put("WOD_STATUS", "1");
						save.getColMap().put("CUST_ADDRESS", custaddress);// 收货地址
						save.getColMap().put("WOD_DOC_TYPE", "DJ11");
						save.getColMap().put("EDIT_TIME", DateUtil.parseDate(DateUtil.getCurDateStr(), "yyyy-MM-dd"));
						modelService.save(save);// 存储
						
						save=new TableDataMapExt();
						save.setTableName("T_WMS_DOC_INFO");
						save.getColMap().put("WDI_DOC_NUM",erpDoc);// 供应商代码
						save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd"));
						save.getColMap().put("WDI_CUST_CODE",wodcustcode);// 供应商代码
						save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构WDI_MEMO
						save.getColMap().put("ID", StringUtils.getUUID());// 采购单表ID
						save.getColMap().put("WDI_DOC_TYPE", "DJ11");// 单据类型
						save.getColMap().put("T_WMS_DOC_INFO", "Y");
						save.getColMap().put("WDI_STATUS", "1");
						modelService.save(save);// 存储
						
						
						for (int j = 0; j < poItemDetailList.get(i).size(); j++) {
							
						//WOD_ITEM_CODE
							woditemcode=poItemDetailList.get(i).get(j).get("WOI_ITEM_CODE");
			    	      
			    	    //WOD_UNITS
							wodunits=poItemDetailList.get(i).get(j).get("WOI_UNITS");
			    	      
			    	    //WOD_OUTSTOCK_NUM
							wodoutstocknum=poItemDetailList.get(i).get(j).get("WOI_PLAN_NUM");
			    	      
			    	    //WOD_ITEM_SEQ
							woditemseq=poItemDetailList.get(i).get(j).get("WOI_ITEM_SEQ");
			    	      
			    	    //ERP_SOURCENO
							erpsourceno=poItemDetailList.get(i).get(j).get("ERP_SOURCENO");
			    	      
			    	    //ERP_SOURCELINENO
							erpsourcelineno=poItemDetailList.get(i).get(j).get("ERP_SOURCELINENO");
			    	      
			    	    //ERP_LINESTUATE
							erplinestuate=poItemDetailList.get(i).get(j).get("ERP_LINESTUATE");
			    	      
			    	    //WOD_OUTSTOCK_DATE
							wodoutstockdate=poItemDetailList.get(i).get(j).get("WOI_DELIVERY_DATE");
			    	      
			    	    //WOD_URGENT_FLAG
							wodurgentflag=poItemDetailList.get(i).get(j).get("WOD_URGENT_FLAG");
							
						//WOD_MEMO
							wodmemo=poItemDetailList.get(i).get(j).get("WOI_MEMO");
							
						//CREATE_USER
							createuser=poItemDetailList.get(i).get(j).get("CREATE_USER");
							
						//CREATE_TIME
							createtime=poItemDetailList.get(i).get(j).get("CREATE_TIME");
							itemversion = poItemDetailList.get(i).get(j).get("ITEM_VERSION");
							
							if(wodoutstockdate.equals("")){
				    	    	   wodoutstockdate=DateUtil.getCurDateStr(); 
				    	       }  
				    	    if(createtime.equals("")){
				    	    	   createtime=DateUtil.getCurDateStr(); 
				    	       } 
				    	       
				    	       save=new TableDataMapExt();
				    	       save.setTableName("T_WMS_OUTSTOCK_ITEM");
				    	       save.getColMap().put("WOI_DOC_NUM", erpDoc);
				    	       save.getColMap().put("ID", StringUtils.getUUID());
				    	       save.getColMap().put("WOI_ITEM_CODE", woditemcode);
				    	       save.getColMap().put("WOD_PLAN_UNIT", wodunits);//toInteger(wodoutstocknum)
				    	       String sql001 ="select nvl(OUTSTOCK_NUM,0)OUTSTOCK_NUM from T_WMS_UNPRODOUTSTOCK where WOD_ITEM_SEQ=?";
				    	       List<Map> list1 = modelService.listDataSql(sql001, new Object[] {woditemseq});
				    	       if(list1.size()>0){
				    	    	   double qwe =Double.parseDouble(list1.get(0).get("OUTSTOCK_NUM").toString());
								   double wodoutstocknum1 = Double.parseDouble(wodoutstocknum.toString());
								   double num = wodoutstocknum1-qwe;
								   save.getColMap().put("WOI_PLAN_NUM", num);
				    	       }else{
				    	    	   save.getColMap().put("WOI_PLAN_NUM", Double.parseDouble(wodoutstocknum.toString()));
				    	       }
				    	       save.getColMap().put("WOI_ITEM_SEQ", woditemseq);//DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd")
				    	       save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
				    	       save.getColMap().put("ERP_SOURCENO", erpsourceno);
				    	       save.getColMap().put("ERP_SOURCELINENO", erpsourcelineno);
				    	       save.getColMap().put("ERP_LINESTUATE", erplinestuate);
				    	       save.getColMap().put("WOI_DELIVERY_DATE", DateUtil.parseDate(String.valueOf(wodoutstockdate), "yyyy-MM-dd"));
				    	       save.getColMap().put("WOD_URGENT_FLAG", wodurgentflag);
				    	       save.getColMap().put("WOI_MEMO", wodmemo);
				    	       save.getColMap().put("WOI_CONNECT_DOC", erpDoc);//WOI_STATUS
				    	       save.getColMap().put("WOI_STATUS", "1");
				    	       save.getColMap().put("CREATE_USER", createuser);//createtime
				    	       save.getColMap().put("ITEM_VERSION", itemversion);//createtime
				    	       save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd"));
							   modelService.save(save);
							   addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),erpDoc);
						}
						
					}
		      }else{
		    	  returnErrorMsg+= toErrorStr(erpDoc,null,errorMsg);
		      }
		      
		      errorMsg="";
		       
		}
	      
	      
	    if(returnErrorMsg.equals("")){
	    	
	    	resmap.put("isSuccess", "Y");
	    	resmap.put("errorMsg", null);
	    	
	    	
	    }else{
	    	resmap.put("isSuccess", "N");
	    	resmap.put("errorMsg", toErrorXml(returnErrorMsg));
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
				+ ""
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
		 save.getColMap().put("OBJECTNAME", "PRODOUTSTOCK");
		 save.getColMap().put("SYNCDIRECTION", "1");
		 save.getColMap().put("ERPNO", erpno);
		 return modelService.save(save);
	 }
	 
}
