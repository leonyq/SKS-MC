
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
 * @Description: 销售退货 接收参数 msg 
 * @author:zw
 * @version:1.0
 * @since 2018年3月29日下午8:10:01
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class SaleOutStockReturnSync implements IWebService {
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
		
//        String Only = StringUtils.getUUID();
        
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
	       * 定义销售退货信息(base)
	       */
	     
	      Object erpdoc;
	      Object custcode;
	      Object createman;
	      Object createtime;
	      Object dataauth;
	      
	      /**
	       * 定义销售退货详细信息(detail)
	       */
	      
	      Object itemcode;
	      Object itemseq;
	      Object sourcelineid;
	      Object receivenum;
	      Object wrdunit;
	      Object itemversion;
	      Object wrimemo;
	      
	      String errorMsg=""; 
	      
	      
	      for (int i = 0; i < poBaseList.size(); i++) {
			
	    	  erpdoc=poBaseList.get(i).get("ERP_DOC");
	    	  custcode=poBaseList.get(i).get("WRD_CUST_CODE");
	    	  createman=poBaseList.get(i).get("WRD_CREATE_MAN");
	    	  createtime=poBaseList.get(i).get("WRD_CREATE_TIME");
	    	  dataauth=poBaseList.get(i).get("DATA_AUTH");
		      
	    	  
	    	  //如果存在一个节点异常(无已上任意一节点)
		      if(erpdoc==null||custcode==null||createman==null||createtime==null
		    		  ||dataauth==null){
		    	  if("".equals(errorMsg)){
		    		  errorMsg="该PO表头出无以下节点";
		    	  
		    	  } 	  
		    	  if(erpdoc==null){
		    		  errorMsg+="ERP_DOC,";
		    	  }
		    	  if(custcode==null){
		    		  errorMsg+="WRD_CUST_CODE,";
		    	  }
		    	  if(createman==null){
		    		  errorMsg+="WRD_CREATE_MAN,";
		    	  }
		    	  if(createtime==null){
		    		  errorMsg+="WRD_CREATE_TIME,";
		    	  }
		    	  if(dataauth==null){
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
		    	 
		      }
		      for (int j = 0; j < poItemDetailList.get(i).size(); j++) {
		    	  itemcode=poItemDetailList.get(i).get(j).get("WRD_ITEM_CODE");
		    	  itemseq=poItemDetailList.get(i).get(j).get("WOD_ITEM_SEQ");
		    	  sourcelineid=poItemDetailList.get(i).get(j).get("ERP_SOURCELINEID");
		    	  receivenum=poItemDetailList.get(i).get(j).get("WRD_RECEIVE_NUM");
		    	  wrdunit=poItemDetailList.get(i).get(j).get("WRD_UNIT");
		    	  itemversion = poItemDetailList.get(i).get(j).get("ITEM_VERSION"); 
		    	  wrimemo = poItemDetailList.get(i).get(j).get("WRI_MEMO");
		    	       if(itemcode==null||itemseq==null||sourcelineid==null||receivenum==null||
		    	    		   wrdunit==null){
		    	    	  if("".equals(errorMsg)){
		    			    		  errorMsg="该PO表身无以下节点";
		    	    	   }
		    	    	  if(itemcode==null){
	    			    		  errorMsg+=" WRD_ITEM_CODE,";
	    			    	  }
		    	    	  if(wrimemo==null){
    			    		  errorMsg+=" WRI_MEMO,";
    			    	  }
    			    	  if(itemseq==null){
    			    		  errorMsg+="WOD_ITEM_SEQ,";
    			    	  }
    			    	  if(sourcelineid==null){
    			    		  errorMsg+="ERP_SOURCELINEID,";
    			    	  }
    			    	  if(receivenum==null){
    			    		  errorMsg+="WRD_RECEIVE_NUM,";
    			    	  }
    			    	  if(wrdunit==null){
    			    		  errorMsg+="WRD_UNIT,";
    			    	  }
    			    	  if(itemversion==null){
    			    		  errorMsg+="ITEM_VERSION,";
    			    	  }  
	    			      break;
		    	       }
		    		  
		    		  
		    		  
		    		  
				}
		       
		      
		      //无任何异常
		      if("".equals(errorMsg)){
		    	  	
		    	  dataauth=getDataId(dataauth);
		    	  
		    	   //erpDoc是否存在
		    	  	sql = "SELECT * FROM T_WMS_RECEIVE_DOC  WHERE ERP_DOC  =?";
		    	  	
					list = modelService.listDataSql(sql, new Object[] {erpdoc});
					
					if(list.size()>0){
						int LLSIZE=poItemDetailList.get(i).size();
						boolean ck=true; //标识是否变更
						for(int LL=0;LL<LLSIZE;LL++){
							String woitem=poItemDetailList.get(i).get(LL).get("WRD_ITEM_CODE").toString();
							
							//获取项次
				    	       String sql01 = "select * from T_WMS_RECEIVE_ITEM where WRI_DOC_NUM=? and WRI_ITEM_CODE=?";
							   List<Map> list1 = modelService.listDataSql(sql01, new Object[] {list.get(0).get("WRD_DOC_NUM"),woitem});
							   if(list1.size()==0){
								   ck=true;
							   }else{
							
							   String wpdseq = list1.get(0).get("WPD_SEQ").toString();//  
				    	       //物料信息状态
				               String  sql1 = "SELECT WRI_STATUS FROM T_WMS_RECEIVE_ITEM where WRI_DOC_NUM='"+list.get(0).get("WRD_DOC_NUM")+"' " +
				                		" and WPD_SEQ='"+wpdseq+"'";
				               List<Map<String, Object>> list2 = modelService.listDataSql(sql1);//
				               if(list2!=null&&list2.size()>0&&list2.get(0).containsKey("WRI_STATUS")){
				            	   String itemsatus = list2.get(0).get("WRI_STATUS").toString();
								   if((itemsatus!=null)&&itemsatus.equals("1")){
									   ck=true;
									   //break;
				               }else{
				            	    returnErrorMsg+= toErrorStr(erpdoc,null,"销售退货单物料状态为空或者已在操作中");
									addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),null);
									ck=false;
									break;
				               }
				               
				             }else{
				    //         	    returnErrorMsg+= toErrorStr(new Object[]{erpdoc,null,"该销售发货单的单号和行ID不匹配"});
								// 	addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),null);
									ck=true;
				             }
							   }
				         }    
					if(ck){
						update=new TableDataMapExt();
						update.setTableName("T_WMS_RECEIVE_DOC");
						update.setSqlWhere(" and ERP_DOC = '"+erpdoc+"' ");
						update.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()), "yyyy-MM-dd"));
						update.getColMap().put("WRD_CUST_CODE",custcode);// 
						update.getColMap().put("WRD_CREATE_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd") );// erp填交货时间，mes对应更改到货日期
						update.getColMap().put("WRD_CREATE_MAN", createman);// 开单人
						update.getColMap().put("DATA_AUTH", dataauth);// 组织机构
						modelService.edit(update);// 
						update=new TableDataMapExt();
						update.setTableName("T_WMS_DOC_INFO");
						update.setSqlWhere(" and WDI_DOC_NUM = '"+list.get(0).get("WRD_DOC_NUM")+"' ");
						update.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd"));
						update.getColMap().put("WDI_CUST_CODE",custcode);// 供应商代码
						update.getColMap().put("DATA_AUTH", dataauth);// 组织机构
						update.getColMap().put("CREATE_USER", createman);// 开单人
						update.getColMap().put("WDI_DOC_TYPE", "DJ04");// 单据类型
						update.getColMap().put("T_WMS_DOC_INFO", "Y");
						update.getColMap().put("WDI_STATUS", "1");
						modelService.edit(update);// 存储
							for (int j = 0; j < poItemDetailList.get(i).size(); j++) {
								itemcode=poItemDetailList.get(i).get(j).get("WRD_ITEM_CODE");
								itemseq=poItemDetailList.get(i).get(j).get("WOD_ITEM_SEQ");
								sourcelineid=poItemDetailList.get(i).get(j).get("ERP_SOURCELINEID");
								receivenum=poItemDetailList.get(i).get(j).get("WRD_RECEIVE_NUM");
								wrdunit=poItemDetailList.get(i).get(j).get("WRD_UNIT");
								itemversion = poItemDetailList.get(i).get(j).get("ITEM_VERSION");
								wrimemo = poItemDetailList.get(i).get(j).get("WRI_MEMO");
							    update=new TableDataMapExt();
				    	        update.setTableName("T_WMS_RECEIVE_ITEM");
							   update.setSqlWhere("and WRI_DOC_NUM='"+list.get(0).get("WRD_DOC_NUM")+"' and WPD_SEQ='"+itemseq+"'");
				    	       update.getColMap().put("WRI_ITEM_CODE", itemcode);
				    	       update.getColMap().put("ERP_SOURCELINENO", sourcelineid);
				    	       update.getColMap().put("WRI_PLAN_NUM", receivenum);//DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd")
				    	       update.getColMap().put("DATA_AUTH", dataauth);// 组织机构
				    	       update.getColMap().put("WPD_PLAN_UNIT", wrdunit);
				    	       update.getColMap().put("WRI_MEMO", wrimemo);
				    	       update.getColMap().put("ITEM_VERSION", itemversion);
				    	       update.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()), "yyyy-MM-dd"));
							   int xxo = modelService.edit(update);
							   if(xxo==0){
								   save=new TableDataMapExt();
					    	       save.setTableName("T_WMS_RECEIVE_ITEM");
					    	       save.getColMap().put("WRI_DOC_NUM", list.get(0).get("WRD_DOC_NUM"));
					    	       save.getColMap().put("ID", StringUtils.getUUID());
					    	       save.getColMap().put("WRI_ITEM_CODE", itemcode);
					    	       save.getColMap().put("WPD_SEQ", itemseq);//toInteger(wodoutstocknum)
					    	       save.getColMap().put("ERP_SOURCELINENO", sourcelineid);
					    	       save.getColMap().put("WRI_PLAN_NUM", receivenum);//DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd")
					    	       save.getColMap().put("DATA_AUTH", dataauth);// 组织机构  
					    	       save.getColMap().put("WPD_PLAN_UNIT", wrdunit);
					    	       save.getColMap().put("WRI_STATUS", "1");
					    	       save.getColMap().put("WRI_MEMO", wrimemo);
					    	       save.getColMap().put("ITEM_VERSION", itemversion);
					    	       save.getColMap().put("WRI_CONNECT_DOC", erpdoc);
					    	       save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()), "yyyy-MM-dd"));
								   modelService.save(save);
							   }
							   addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),erpdoc);
										
				           }
					  }
					}else{
			            //保存base信息
						//String WOD_DOC_NUM = getReceiveNo(String.valueOf(dataauth),"DJ04",null,modelService);//入库单号
						save=new TableDataMapExt();
						save.setTableName("T_WMS_RECEIVE_DOC");
						save.getColMap().put("ID", StringUtils.getUUID());// 采购单表ID
						save.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()), "yyyy-MM-dd"));
						save.getColMap().put("ERP_DOC", erpdoc);// 采购单号
						save.getColMap().put("WRD_DOC_NUM", erpdoc);// 采购单号
						save.getColMap().put("WRD_CUST_CODE",custcode);// 
						save.getColMap().put("WRD_DOC_TYPE","DJ04");
						save.getColMap().put("WRD_CREATE_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd") );// erp填交货时间，mes对应更改到货日期
						save.getColMap().put("WRD_CREATE_MAN", createman);// 开单人
						save.getColMap().put("WRD_STATUS", "1");// 
						save.getColMap().put("DATA_AUTH", dataauth);// 组织机构
						modelService.save(save);// 存储
						save=new TableDataMapExt();
						save.setTableName("T_WMS_DOC_INFO");
						save.getColMap().put("WDI_DOC_NUM",erpdoc);// 供应商代码
						save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd"));
						save.getColMap().put("WDI_CUST_CODE",custcode);// 供应商代码
						save.getColMap().put("DATA_AUTH", dataauth);// 组织机构
						save.getColMap().put("ID", StringUtils.getUUID());// 采购单表ID
						save.getColMap().put("CREATE_USER", createman);// 开单人
						save.getColMap().put("WDI_DOC_TYPE", "DJ04");// 单据类型
						save.getColMap().put("T_WMS_DOC_INFO", "Y");
						save.getColMap().put("WDI_STATUS", "1");
						modelService.save(save);// 存储
						for (int j = 0; j < poItemDetailList.get(i).size(); j++) {
							itemcode=poItemDetailList.get(i).get(j).get("WRD_ITEM_CODE");
							itemseq=poItemDetailList.get(i).get(j).get("WOD_ITEM_SEQ");
							sourcelineid=poItemDetailList.get(i).get(j).get("ERP_SOURCELINEID");
							receivenum=poItemDetailList.get(i).get(j).get("WRD_RECEIVE_NUM");
							wrdunit=poItemDetailList.get(i).get(j).get("WRD_UNIT");
			    	        itemversion = poItemDetailList.get(i).get(j).get("ITEM_VERSION");
			    	        wrimemo = poItemDetailList.get(i).get(j).get("WRI_MEMO");
			    	       save=new TableDataMapExt();
			    	       save.setTableName("T_WMS_RECEIVE_ITEM");
			    	       save.getColMap().put("WRI_DOC_NUM", erpdoc);
			    	       save.getColMap().put("ID", StringUtils.getUUID());
			    	       save.getColMap().put("WRI_ITEM_CODE", itemcode);
			    	       save.getColMap().put("WPD_SEQ", itemseq);//toInteger(wodoutstocknum)
			    	       save.getColMap().put("ERP_SOURCELINENO", sourcelineid);
			    	       save.getColMap().put("WRI_PLAN_NUM", receivenum);//DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd")
			    	       save.getColMap().put("DATA_AUTH", dataauth);// 组织机构  
			    	       save.getColMap().put("WPD_PLAN_UNIT", wrdunit);
			    	       save.getColMap().put("WRI_STATUS", "1");
			    	       save.getColMap().put("WRI_MEMO", wrimemo);
			    	       save.getColMap().put("ITEM_VERSION", itemversion);
			    	       save.getColMap().put("WRI_CONNECT_DOC", erpdoc);
			    	       save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()), "yyyy-MM-dd"));
						   modelService.save(save);
						   addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),erpdoc);
						}
					}
		      }else{
		    	  returnErrorMsg+= toErrorStr(erpdoc,null,errorMsg);
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
		 save.getColMap().put("OBJECTNAME", "RETURNSALESTOCK");
		 save.getColMap().put("SYNCDIRECTION", "1");
		 save.getColMap().put("ERPNO", erpno);
		 return modelService.save(save);
	 }
	 
}
