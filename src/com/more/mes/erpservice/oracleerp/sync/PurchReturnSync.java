
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
 * @Description: 用于采购退货 接收参数 msg 
 * @author:mmz
 * @version:1.0
 * @since 2018年3月29日下午8:10:01
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class PurchReturnSync implements IWebService {
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
	      
	      //WOD_SUP_CODE
	      Object wodsupcode;
	      
	      //WOD_OUTSTOCK_DATE
	      Object outdate;
	      
	      //CREATE_TIME
	      Object createtime;
	      
	      //WOD_MEMO
	      Object wodmemo;
	      
	      //ERP_STUATE
	      Object erpstuate;
	      
	      //DATA_AUTH
	      Object dataAuth;
	      
	      /**
	       * 定义采购入库单标准信息(detail)
	       */
	      
	    //WOD_ITEM_CODE
	      Object itemcode;
	      
	    //ERP_SOURCENO
	      Object sourceno;
	      
	    //ERP_SOURCELINENO
	      Object sourcelineno;
	      
	    //ERP_DOD_LINE_NUM
	      Object linenum;
	      
	    //WOD_OUTSTOCK_NUM
	      Object outnum;
	      
	    //WOD_PLAN_UNIT
	      Object unit;
	      
	    //WOD_LOT_NUMBER
	      Object lotnum;
	      
	      Object itemversion;
	     
	      String errorMsg=""; 
	      
	      
	      for (int i = 0; i < poBaseList.size(); i++) {
			
	    	  //ERP_DOC
	    	  erpDoc=poBaseList.get(i).get("ERP_DOC");
	    	  
	    	  //WPI_RECEIVE_TIME
	    	  wodsupcode=poBaseList.get(i).get("WOD_SUP_CODE");
		      
		      //WPI_SUP_CODE
	    	  outdate=poBaseList.get(i).get("WOD_OUTSTOCK_DATE");
		      
		      //CREATE_USER
	    	  wodmemo=poBaseList.get(i).get("WOD_MEMO");
		      
		      //CREATE_TIME
		       createtime=poBaseList.get(i).get("CREATE_TIME");
		      
		      //WPI_MEMO
		       erpstuate=poBaseList.get(i).get("ERP_STUATE");
		      
		      //DATA_AUTH
		       dataAuth=poBaseList.get(i).get("DATA_AUTH");
		      
	    	  
	    	  //如果存在一个节点异常(无已上任意一节点)
		      if(erpDoc==null||wodsupcode==null||outdate==null||wodmemo==null
		    		  ||createtime==null||erpstuate==null||dataAuth==null){
		    	  if("".equals(errorMsg)){
		    		  errorMsg="该PO无以下节点";
		    	  
		    	  } 	  
		    	  if(erpDoc==null){
		    		  errorMsg+="ERP_DOC,";
		    	  }
		    	  if(wodsupcode==null){
		    		  errorMsg+="WOD_SUP_CODE,";
		    	  }
		    	  if(outdate==null){
		    		  errorMsg+="WOD_OUTSTOCK_DATE,";
		    	  }
		    	  if(wodmemo==null){
		    		  errorMsg+="WOD_MEMO,";
		    	  }
		    	  if(createtime==null){
		    		  errorMsg+="CREATE_TIME,";
		    	  }
		    	  if(erpstuate==null){
		    		  errorMsg+="ERP_STUATE,";
		    	  }
		    	  if(dataAuth==null){
		    		  errorMsg+="DATA_AUTH,";
		    	  }
		    	  
		      }else{
		    	  
		    	  if(createtime.equals("")){
		    		  createtime=DateUtil.getCurDateStr();  
		    	  }else{
		    		  if(DateUtil.parseDate(String.valueOf(createtime),"yyyy-MM-dd")==null){
			    		  
			    		  errorMsg+="此poCREATE_TIME时间格式有误";
			    	  }
		    	  }
		    	  if(outdate.equals("")){
		    		  outdate=DateUtil.getCurDateStr();  
		    	  }else{
		    		  if(DateUtil.parseDate(String.valueOf(outdate),"yyyy-MM-dd")==null){
			    		  
			    		  errorMsg+="此poWOD_OUTSTOCK_DATE时间格式有误";
			    	  }
		    	  }
		      }
		      for (int j = 0; j < poItemDetailList.get(i).size(); j++) {
		    		//WOD_ITEM_CODE
		    	       itemcode=poItemDetailList.get(i).get(j).get("WOD_ITEM_CODE");
		    	    //ERP_SOURCENO
		    	       sourceno=poItemDetailList.get(i).get(j).get("ERP_SOURCENO");
		    	    //ERP_SOURCELINENO
		    	       sourcelineno=poItemDetailList.get(i).get(j).get("ERP_SOURCELINENO");
		    	    //ERP_DOD_LINE_NUM
		    	       linenum=poItemDetailList.get(i).get(j).get("ERP_DOD_LINE_NUM");
		    	    //WOD_OUTSTOCK_NUM
		    	       outnum=poItemDetailList.get(i).get(j).get("WOD_OUTSTOCK_NUM");
		    	    //WOD_PLAN_UNIT
		    	       unit=poItemDetailList.get(i).get(j).get("WOD_PLAN_UNIT");
		    	    //WOD_LOT_NUMBER
		    	       lotnum=poItemDetailList.get(i).get(j).get("WOD_LOT_NUMBER");
		    	    //WOD_LOT_NUMBER
		    	       itemversion=poItemDetailList.get(i).get(j).get("ITEM_VERSION");
		    		  
		    	       if(itemcode==null||sourceno==null||sourceno==null||sourceno==null||
		    	    		   outnum==null||unit==null||lotnum==null||itemversion==null){
		    	    	   if("".equals(errorMsg)){
		    			    		  errorMsg="该PO无以下节点";
		    	    	   }
		    	    	   if(itemcode==null){
	    			    		  errorMsg+=" WOD_ITEM_CODE,";
	    			    	  }
	    			    	  if(sourceno==null){
	    			    		  errorMsg+="ERP_SOURCENO,";
	    			    	  }
	    			    	  if(sourceno==null){
	    			    		  errorMsg+="ERP_SOURCELINENO,";
	    			    	  }
	    			    	  if(sourceno==null){
	    			    		  errorMsg+="ERP_DOD_LINE_NUM,";
	    			    	  }
	    			    	  if(outnum==null){
	    			    		  errorMsg+="WOD_OUTSTOCK_NUM,";
	    			    	  }
	    			    	  if(unit==null){
	    			    		  errorMsg+="WOD_PLAN_UNIT,";
	    			    	  }
	    			    	  if(lotnum==null){
	    			    		  errorMsg+="WOD_LOT_NUMBER,";
	    			    	  }
	    			    	  if(itemversion==null){
	    			    		  errorMsg+="ITEM_VERSION,";
	    			    	  }
	    			    	  break;
		    	       }else{
		    	    	   
		    	    	   if(!isInteger(String.valueOf(outnum))){
		    	    		   errorMsg+="此po所属ITEM信息WOD_OUTSTOCK_NUM不为数值";
		    	    	   }
		    	    	   
		    	       }
				}
		       
		      
		      //无任何异常
		      if("".equals(errorMsg)){
		    	  	
		    	  dataAuth=getDataId(dataAuth);
		    	  
		    	   //erpDoc是否存在
		    	  	sql = "SELECT * FROM T_WMS_OUTSTOCK_DOC  WHERE ERP_DOC  =?";
					list = modelService.listDataSql(sql, new Object[] {erpDoc});  	 
					if(list.size()>0){
						int LLSIZE=poItemDetailList.get(i).size();
						boolean ck=true; //标识是否变更
						for(int LL=0;LL<LLSIZE;LL++){
							String linenum1=poItemDetailList.get(i).get(LL).get("ERP_DOD_LINE_NUM").toString();
							String sql1="select WOI_STATUS from T_WMS_OUTSTOCK_ITEM where WOI_DOC_NUM='"+list.get(0).get("WOD_DOC_NUM")+"' and ERP_DOD_LINE_NUM='"+linenum1+"'";
			    	        List<Map> list2 = modelService.listDataSql(sql1);
			    	        if(list2!=null&&list2.size()>0){
			    	        	String itemsatus = list2.get(0).get("WOI_STATUS").toString();
			    	        	if(itemsatus!=null&&itemsatus.equals("1")){
			    	        		ck=true;
			    	        // 		
			    	        	}else{
			    	        		returnErrorMsg+= toErrorStr(erpDoc,null,"采购退货单物料状态为空或者已在操作中");
									addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),null);
									ck=false;
									break;
			    	        	}
			    	        }else{
			    	//         	returnErrorMsg+= toErrorStr(new Object[]{erpDoc,null,"该销售发货单的单号和采购退货申请单行ID不匹配"});
								// addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),null);
								ck=true;
			    	        }
						}
						if(ck){
						update=new TableDataMapExt();
						update.setTableName("T_WMS_OUTSTOCK_DOC");
						update.setSqlWhere(" and ERP_DOC = '"+list.get(0).get("ERP_DOC")+"' ");//
						update.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd"));
						update.getColMap().put("WOD_SUP_CODE",wodsupcode);// 供应商代码
						update.getColMap().put("WOD_OUTSTOCK_DATE", DateUtil.parseDate(String.valueOf(outdate), "yyyy-MM-dd") );// erp填交货时间，mes对应更改到货日期
						update.getColMap().put("WOD_MEMO", wodmemo);// 
						update.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
						update.getColMap().put("ERP_STUATE", erpstuate);// 备注
						modelService.edit(update);// 存储
						
						update=new TableDataMapExt();
						update.setTableName("T_WMS_DOC_INFO");
						update.setSqlWhere(" and WDI_DOC_NUM = '"+list.get(0).get("WOD_DOC_NUM")+"' ");
						update.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd"));
						update.getColMap().put("WDI_SUP_CODE",wodsupcode);// 供应商代码
						update.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
						update.getColMap().put("WDI_MEMO", wodmemo);// 备注
						update.getColMap().put("WDI_DOC_TYPE", "DJ13");// 单据类型
						update.getColMap().put("T_WMS_DOC_INFO", "Y");
						update.getColMap().put("WDI_STATUS", "1");
						modelService.edit(update);// 存储
							for (int j = 0; j < poItemDetailList.get(i).size(); j++) {
				    		//WOD_ITEM_CODE
								itemcode=poItemDetailList.get(i).get(j).get("WOD_ITEM_CODE");
				    	    //ERP_SOURCENO
								sourceno=poItemDetailList.get(i).get(j).get("ERP_SOURCENO");
				    	    //ERP_SOURCELINENO
								sourcelineno=poItemDetailList.get(i).get(j).get("ERP_SOURCELINENO");
				    	    //ERP_DOD_LINE_NUM
								linenum=poItemDetailList.get(i).get(j).get("ERP_DOD_LINE_NUM");
				    	    //WOD_OUTSTOCK_NUM
								outnum=poItemDetailList.get(i).get(j).get("WOD_OUTSTOCK_NUM");
				    	    //WOD_PLAN_UNIT
								unit=poItemDetailList.get(i).get(j).get("WOD_PLAN_UNIT");
				    	    //WOD_LOT_NUMBER
								lotnum=poItemDetailList.get(i).get(j).get("WOD_LOT_NUMBER");
				    	        itemversion = poItemDetailList.get(i).get(j).get("ITEM_VERSION");
								if(!isInteger(String.valueOf(linenum))){
				    	    		   errorMsg+="此po所属ITEM信息linenum不为数值";
				    	    	  }
								if(!isInteger(String.valueOf(outnum))){
				    	    		   errorMsg+="此po所属ITEM信息outnum不为数值";
				    	    	  }
				    	       
				    	       update=new TableDataMapExt();
				    	       update.setTableName("T_WMS_OUTSTOCK_ITEM");
				    	      
				    	    	   update.setSqlWhere("and WOI_DOC_NUM='"+list.get(0).get("WOD_DOC_NUM")+"' and ERP_DOD_LINE_NUM='"+linenum+"' ");//
					    	       update.getColMap().put("WOI_ITEM_CODE", itemcode);
					    	       update.getColMap().put("ERP_SOURCENO", sourceno);//toInteger(wpdPlanNum)
					    	       update.getColMap().put("ERP_SOURCELINENO", sourcelineno);//
//					    	       update.getColMap().put("WRI_IS_ADD", "N");
					    	       update.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
					    	       update.getColMap().put("WOI_PLAN_NUM", outnum);
					    	       update.getColMap().put("WOD_PLAN_UNIT", unit);
					    	       update.getColMap().put("WOD_LOT_NUMBER", lotnum);
					    	       update.getColMap().put("ITEM_VERSION", itemversion);
					    	       update.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()), "yyyy-MM-dd"));
								   int xxo =modelService.edit(update);
								   if(xxo==0){
									   save=new TableDataMapExt();
						    	       save.setTableName("T_WMS_OUTSTOCK_ITEM");
						    	       save.getColMap().put("WOI_ITEM_CODE", itemcode);
						    	       save.getColMap().put("WOI_DOC_NUM", list.get(0).get("WOD_DOC_NUM"));
						    	       save.getColMap().put("ERP_SOURCENO", sourceno);
						    	       save.getColMap().put("ERP_SOURCELINENO", sourcelineno);
						    	       save.getColMap().put("ERP_DOD_LINE_NUM", linenum);//数据库少了采购退货申请单行号字段  
						    	       save.getColMap().put("ID", StringUtils.getUUID());
						    	       save.getColMap().put("WOI_CONNECT_DOC", erpDoc);
						    	       save.getColMap().put("WOI_PLAN_NUM", toInteger(outnum));
						    	       save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
						    	       save.getColMap().put("WOD_PLAN_UNIT", unit);
						    	       save.getColMap().put("WOI_STATUS", "1");
						    	       save.getColMap().put("ITEM_VERSION", itemversion);
						    	       save.getColMap().put("WOD_LOT_NUMBER", lotnum);//少了批次这个字段
						    	       save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd"));
									   modelService.save(save);
								   }
								   addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),erpDoc);
				    	      
							}    
						}
						
					}else{
			            //保存base信息
						String WOD_DOC_NUM = getReceiveNo(String.valueOf(dataAuth),"DJ13",null,modelService);//入库单号
						save=new TableDataMapExt();
						save.setTableName("T_WMS_OUTSTOCK_DOC");
						save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd"));
						save.getColMap().put("WOD_DOC_NUM", WOD_DOC_NUM);
						save.getColMap().put("ERP_DOC", erpDoc);// 采购单号
						save.getColMap().put("WOD_SUP_CODE",wodsupcode);// 供应商代码
						save.getColMap().put("ID", StringUtils.getUUID());// 采购单表ID
						save.getColMap().put("WOD_OUTSTOCK_DATE",  DateUtil.parseDate(String.valueOf(outdate), "yyyy-MM-dd"));// erp填交货时间，mes对应更改到货日期DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd")
						save.getColMap().put("WOD_MEMO", wodmemo);// 
						save.getColMap().put("WOD_DOC_TYPE", "DJ13");
						save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
						save.getColMap().put("ERP_STUATE", erpstuate);// 
						save.getColMap().put("EDIT_TIME", DateUtil.parseDate(DateUtil.getCurDateStr(), "yyyy-MM-dd"));//
						modelService.save(save);// 存储
						
						save=new TableDataMapExt();
						save.setTableName("T_WMS_DOC_INFO");
						save.getColMap().put("WDI_DOC_NUM",WOD_DOC_NUM);// 供应商代码
						save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd"));
						save.getColMap().put("WDI_SUP_CODE",wodsupcode);// 供应商代码
						save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
						save.getColMap().put("ID", StringUtils.getUUID());// 采购单表ID
						save.getColMap().put("WDI_MEMO", wodmemo);// 备注
						save.getColMap().put("WDI_DOC_TYPE", "DJ13");// 单据类型
						save.getColMap().put("T_WMS_DOC_INFO", "Y");
						save.getColMap().put("WDI_STATUS", "1");
						modelService.save(save);// 存储
						
						for (int j = 0; j < poItemDetailList.get(i).size(); j++) {
				    		//WOD_ITEM_CODE
							itemcode=poItemDetailList.get(i).get(j).get("WOD_ITEM_CODE");
				    	    //ERP_SOURCENO
							sourceno=poItemDetailList.get(i).get(j).get("ERP_SOURCENO");
				    	    //ERP_SOURCELINENO
							sourcelineno=poItemDetailList.get(i).get(j).get("ERP_SOURCELINENO");
				    	    //ERP_DOD_LINE_NUM
							linenum=poItemDetailList.get(i).get(j).get("ERP_DOD_LINE_NUM");
				    	    //WOD_OUTSTOCK_NUM
							outnum=poItemDetailList.get(i).get(j).get("WOD_OUTSTOCK_NUM");
				    	    //WOD_PLAN_UNIT
							unit=poItemDetailList.get(i).get(j).get("WOD_PLAN_UNIT");
				    	    //WOD_LOT_NUMBER
							lotnum=poItemDetailList.get(i).get(j).get("WOD_LOT_NUMBER");
				    	    itemversion = poItemDetailList.get(i).get(j).get("ITEM_VERSION");
							if(!isInteger(String.valueOf(outnum))){
			    	    		   errorMsg+="此po所属ITEM信息WOD_OUTSTOCK_NUM不为数值";
			    	    	  }
							if(!isInteger(String.valueOf(linenum))){
			    	    		   errorMsg+="此po所属ITEM信息ERP_DOD_LINE_NUM不为数值";
			    	    	  }
				    	       
				    	       save=new TableDataMapExt();
				    	       save.setTableName("T_WMS_OUTSTOCK_ITEM");
				    	       save.getColMap().put("WOI_ITEM_CODE", itemcode);
				    	       save.getColMap().put("WOI_DOC_NUM", WOD_DOC_NUM);
				    	       save.getColMap().put("ERP_SOURCENO", sourceno);
				    	       save.getColMap().put("ERP_SOURCELINENO", sourcelineno);
				    	       save.getColMap().put("ERP_DOD_LINE_NUM", linenum);//数据库少了采购退货申请单行号字段  
				    	       save.getColMap().put("ID", StringUtils.getUUID());
				    	       save.getColMap().put("WOI_CONNECT_DOC", erpDoc);
				    	       save.getColMap().put("WOI_PLAN_NUM", toInteger(outnum));
				    	       save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
				    	       save.getColMap().put("WOD_PLAN_UNIT", unit);
				    	       save.getColMap().put("ITEM_VERSION", itemversion);//WRI_STATUS
				    	       save.getColMap().put("WOI_STATUS", "1");
				    	       save.getColMap().put("WOD_LOT_NUMBER", lotnum);//少了批次这个字段
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
		 save.getColMap().put("OBJECTNAME", "PURCHASERETURN");
		 save.getColMap().put("SYNCDIRECTION", "1");
		 save.getColMap().put("ERPNO", erpno);
		 return modelService.save(save);
	 }
	 
}
