
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
 * 同步Bom
 * @Description: bom 接收参数 msg 
 * @author:zw
 * @version:1.0
 * @since 2018年3月29日下午8:10:01
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class BomSync implements IWebService {
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
	       * 定义bom标准信息(base)
	       */
	     
	      Object itemcode;
	      Object cbver;
	      Object createuser;
	      Object createtime;
	      Object edituser;
	      Object edittime;
	      Object dataauth;
	      
	      
	      /**
	       * 定义bom标准信息(detail)
	       */
	      
	      Object cbditemcode;
	      Object unit;
	      Object itemnum;
	      Object stardate;
	      Object enddate;
	      Object vertion;
	      
	      String errorMsg=""; 
	      
	      
	      for (int i = 0; i < poBaseList.size(); i++) {
			
	    	  itemcode=poBaseList.get(i).get("CB_ITEM_CODE");
	    	  cbver=poBaseList.get(i).get("CB_VER");
	    	  createuser=poBaseList.get(i).get("CREATE_USER");
	    	  createtime=poBaseList.get(i).get("CREATE_TIME");
	    	  edituser=poBaseList.get(i).get("EDIT_USER");
	    	  edittime=poBaseList.get(i).get("EDIT_TIME");
	    	  dataauth=poBaseList.get(i).get("DATA_AUTH");
	    	  
	    	  //如果存在一个节点异常(无已上任意一节点)
		      if(itemcode==null||cbver==null||createuser==null||createtime==null
		    		  ||edituser==null||edittime==null||dataauth==null ){
		    	  if("".equals(errorMsg)){
		    		  errorMsg="该PO表头出无以下节点";
		    	  } 	  
		    	  if(itemcode==null){
		    		  errorMsg+="CB_ITEM_CODE,";
		    	  }
		    	  if(cbver==null){
		    		  errorMsg+="CB_VER,";
		    	  }
		    	  if(createuser==null){
		    		  errorMsg+="CREATE_USER,";
		    	  }
		    	  if(createtime==null){
		    		  errorMsg+="CREATE_TIME,";
		    	  }
		    	  if(edituser==null){
		    		  errorMsg+="EDIT_USER,";
		    	  }
		    	  if(edittime==null){
		    		  errorMsg+="EDIT_TIME,";
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
		    	  if(edittime.equals("")){
		    		  edittime=DateUtil.getCurDateStr();  
		    	  }else{
		    		  if(DateUtil.parseDate(String.valueOf(edittime),"yyyy-MM-dd")==null){
			    		  
			    		  errorMsg+="此EDIT_TIME时间格式有误";
			    	  }
		    	  }
		    	 
		      }
		      for (int j = 0; j < poItemDetailList.get(i).size(); j++) {
					
		    	  cbditemcode=poItemDetailList.get(i).get(j).get("CBD_ITEM_CODE");
		    	  unit=poItemDetailList.get(i).get(j).get("CBD_UNITS");
		    	  itemnum=poItemDetailList.get(i).get(j).get("CBD_ITEM_NUM");
		    	  stardate=poItemDetailList.get(i).get(j).get("CBD_StartDate");
		    	  enddate=poItemDetailList.get(i).get(j).get("CBD_EndDate");
		    	  vertion=poItemDetailList.get(i).get(j).get("ITEM_VERSION");
		    		  
		    	       if(cbditemcode==null||unit==null||itemnum==null||stardate==null||
		    	    		   enddate==null||vertion==null){
		    	    	   
		    	    	   
		    	    	   if("".equals(errorMsg)){
		    			    		  errorMsg="该表身无以下节点";
		    			    	  
		    	    	   }
		    	    	   if(cbditemcode==null){
	    			    		  errorMsg+=" CBD_ITEM_CODE,";
	    			    	  }
	    			    	  if(unit==null){
	    			    		  errorMsg+="CBD_UNITS,";
	    			    	  }
	    			    	  if(itemnum==null){
	    			    		  errorMsg+="CBD_ITEM_NUM,";
	    			    	  }
	    			    	  if(stardate==null){
	    			    		  errorMsg+="CBD_StartDate,";
	    			    	  }
	    			    	  if(enddate==null){
	    			    		  errorMsg+="CBD_EndDate,";
	    			    	  }
	    			    	  if(vertion==null){
	    			    		  errorMsg+="ITEM_VERSION,";
	    			    	  }
	    			    	  break;
		    	       }else{
		    	    	   
		    	    	   if(stardate.equals("")){
		    	    		   stardate=DateUtil.getCurDateStr(); 
		    	    	   }else{
		    	    		   if(DateUtil.parseDate(String.valueOf(stardate),"yyyy-MM-dd")==null){
				 		    		  
				 		    		  errorMsg+="此po所属ITEM信息CBD_StartDate时间格式有误";
				 		    	  } 
		    	    	   }

						   if(enddate.equals("")){
							   enddate=DateUtil.getCurDateStr(); 
		    	    	   }else{
		    	    		   if(DateUtil.parseDate(String.valueOf(enddate),"yyyy-MM-dd")==null){
				 		    		  
				 		    		  errorMsg+="此po所属ITEM信息CBD_EndDate时间格式有误";
				 		    	  } 
		    	    	   }
//		    	    	   if(!isInteger(String.valueOf(itemnum))){
//		    	    		   errorMsg+="此po所属ITEM信息CBD_ITEM_NUM不为数值";
//		    	    	   }
		    	       }
		    		  
		    		  
		    		  
		    		  
				}
		       
		      
		      //无任何异常
		      if("".equals(errorMsg)){
		    	  	
		    	  dataauth=getDataId(dataauth);
		    	  
		    	   //erpDoc是否存在
		    	  	sql = "SELECT ID FROM T_CO_BOM WHERE CB_ITEM_CODE =? and data_auth=? ";
		    	  	
					list = modelService.listDataSql(sql, new Object[] {itemcode,dataauth});//待解决  	 
					
					if(list.size()>0){
						
						update=new TableDataMapExt();
						update.setTableName("T_CO_BOM");
						update.setSqlWhere(" and DATA_AUTH = '"+dataauth+"'and CB_ITEM_CODE='"+itemcode+"' ");
						update.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(edittime), "yyyy-MM-dd"));
//						update.getColMap().put("CB_ITEM_CODE", itemcode);// 
						update.getColMap().put("CB_VER",cbver);// 
						update.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd") );// erp填交货时间，mes对应更改到货日期
						update.getColMap().put("CREATE_USER", createuser);// 开单人
//						update.getColMap().put("DATA_AUTH", dataauth);// 组织机构
						update.getColMap().put("EDIT_USER", edituser);// 
						
						modelService.edit(update);
						
						
							for (int j = 0; j < poItemDetailList.get(i).size(); j++) {
								cbditemcode=poItemDetailList.get(i).get(j).get("CBD_ITEM_CODE");
								unit=poItemDetailList.get(i).get(j).get("CBD_UNITS");
								itemnum=poItemDetailList.get(i).get(j).get("CBD_ITEM_NUM");
								stardate=poItemDetailList.get(i).get(j).get("CBD_StartDate");
								enddate=poItemDetailList.get(i).get(j).get("CBD_EndDate");
								vertion=poItemDetailList.get(i).get(j).get("ITEM_VERSION");
				    	       
								if(stardate.equals("")){
									stardate=DateUtil.getCurDateStr(); 
				    	       }else{
			    	    		   if(DateUtil.parseDate(String.valueOf(stardate),"yyyy-MM-dd")==null){
					 		    		  
					 		    		  errorMsg+="此po所属ITEM信息stardate时间格式有误";
					 		    	  } 
			    	    	   }  
				    	       if(enddate.equals("")){
				    	    	   enddate=DateUtil.getCurDateStr(); 
				    	       }else{
			    	    		   if(DateUtil.parseDate(String.valueOf(enddate),"yyyy-MM-dd")==null){
					 		    		  
					 		    		  errorMsg+="此po所属ITEM信息CBD_EndDate时间格式有误";
					 		    	  } 
			    	    	   } 
				    	       
				    	     //erp同步新物料
					    	     String  sql2 =" select id from T_CO_BOM_DETAIL where CB_BOMID=? and CBD_ITEM_CODE=? ";
							     List list1 = modelService.listDataSql(sql2, new Object[] {list.get(0).get("ID"),cbditemcode}); 
							     if(list1.size()==0 || list==null){
							    	   save=new TableDataMapExt();
						    	       save.setTableName("T_CO_BOM_DETAIL");
						    	       save.getColMap().put("ID", StringUtils.getUUID());
						    	       save.getColMap().put("CBD_ITEM_CODE", cbditemcode);
						    	       save.getColMap().put("CBD_UNITS", unit);//toInteger(wodoutstocknum)
						    	       save.getColMap().put("CBD_ITEM_NUM", itemnum);
						    	       save.getColMap().put("CB_BOMID", list.get(0).get("ID"));
						    	       save.getColMap().put("EFFECTIVE_TIME", DateUtil.parseDate(String.valueOf(stardate), "yyyy-MM-dd"));//有效日期
						    	       save.getColMap().put("CBD_StartDate", DateUtil.parseDate(String.valueOf(stardate), "yyyy-MM-dd"));//DateUtil.parseDate(String.valueOf(stardate), "yyyy-MM-dd")
						    	       save.getColMap().put("DATA_AUTH", dataauth);// 组织机构
						    	       save.getColMap().put("CBD_EndDate", DateUtil.parseDate(String.valueOf(enddate), "yyyy-MM-dd"));
						    	       save.getColMap().put("ITEM_VERSION", vertion);
						    	       save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()), "yyyy-MM-dd"));
									   modelService.save(save);
									   addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),itemcode);
							     }else{
				    	       update=new TableDataMapExt();
				    	       update.setTableName("T_CO_BOM_DETAIL");
				    	       update.setSqlWhere("and CBD_ITEM_CODE='"+cbditemcode+"' and CB_BOMID='"+list.get(0).get("ID")+"'");
//				    	       update.getColMap().put("CBD_ITEM_CODE", cbditemcode);
				    	       update.getColMap().put("CBD_UNITS", unit);//toInteger(wodoutstocknum)
				    	       update.getColMap().put("CBD_ITEM_NUM", itemnum);
				    	       update.getColMap().put("EFFECTIVE_TIME", DateUtil.parseDate(String.valueOf(stardate), "yyyy-MM-dd"));//有效日期
				    	       update.getColMap().put("CBD_StartDate", DateUtil.parseDate(String.valueOf(stardate), "yyyy-MM-dd"));
				    	       update.getColMap().put("CBD_EndDate", DateUtil.parseDate(String.valueOf(enddate), "yyyy-MM-dd"));
				    	       update.getColMap().put("ITEM_VERSION", vertion);
//				    	       update.getColMap().put("DATA_AUTH", dataauth);// 组织机构
				    	       update.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()), "yyyy-MM-dd"));
				    	                                            // DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()), "yyyy-MM-dd")
							   modelService.edit(update);
							   addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),itemcode);
							   
						}
							}
					}else{
			            //保存base信息
						save=new TableDataMapExt();
						save.setTableName("T_CO_BOM");
						String ID = StringUtils.getUUID();
						save.getColMap().put("CB_ITEM_CODE", itemcode);// 
						save.getColMap().put("CB_VER",cbver);// 
						save.getColMap().put("ID", ID);
						save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd") );// erp填交货时间，mes对应更改到货日期
						save.getColMap().put("CREATE_USER", createuser);// 开单人
						save.getColMap().put("DATA_AUTH", dataauth);// 组织机构
						save.getColMap().put("EDIT_USER", edituser);//
						save.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(edittime), "yyyy-MM-dd"));
						modelService.save(save);// 存储
						
						
						for (int j = 0; j < poItemDetailList.get(i).size(); j++) {
							cbditemcode=poItemDetailList.get(i).get(j).get("CBD_ITEM_CODE");
							unit=poItemDetailList.get(i).get(j).get("CBD_UNITS");
							itemnum=poItemDetailList.get(i).get(j).get("CBD_ITEM_NUM");
							stardate=poItemDetailList.get(i).get(j).get("CBD_StartDate");
							enddate=poItemDetailList.get(i).get(j).get("CBD_EndDate");
							vertion=poItemDetailList.get(i).get(j).get("ITEM_VERSION");
			    	      
							
							if(stardate.equals("")){
								stardate=DateUtil.getCurDateStr(); 
				    	       }
							else{
			    	    		   if(DateUtil.parseDate(String.valueOf(stardate),"yyyy-MM-dd")==null){
					 		    		  
					 		    		  errorMsg+="此po所属ITEM信息CBD_StartDate时间格式有误";
					 		    	  } 
			    	    	   }   
				    	    if(enddate.equals("")){
				    	    	enddate=DateUtil.getCurDateStr(); 
				    	       }
				    	    else{
			    	    		   if(DateUtil.parseDate(String.valueOf(enddate),"yyyy-MM-dd")==null){
					 		    		  
					 		    		  errorMsg+="此po所属ITEM信息CBD_EndDate时间格式有误";
					 		    	  } 
			    	    	   } 
				    	       
				    	       save=new TableDataMapExt();
				    	       save.setTableName("T_CO_BOM_DETAIL");
				    	       save.getColMap().put("ID", StringUtils.getUUID());
				    	       save.getColMap().put("CBD_ITEM_CODE", cbditemcode);
				    	       save.getColMap().put("CBD_UNITS", unit);//toInteger(wodoutstocknum)
				    	       save.getColMap().put("CBD_ITEM_NUM", itemnum);
				    	       save.getColMap().put("CB_BOMID", ID);
				    	       save.getColMap().put("EFFECTIVE_TIME", DateUtil.parseDate(String.valueOf(stardate), "yyyy-MM-dd"));//有效日期
				    	       save.getColMap().put("CBD_StartDate", DateUtil.parseDate(String.valueOf(stardate), "yyyy-MM-dd"));//DateUtil.parseDate(String.valueOf(stardate), "yyyy-MM-dd")
				    	       save.getColMap().put("DATA_AUTH", dataauth);// 组织机构
				    	       save.getColMap().put("CBD_EndDate", DateUtil.parseDate(String.valueOf(enddate), "yyyy-MM-dd"));
				    	       save.getColMap().put("ITEM_VERSION", vertion);
				    	       save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()), "yyyy-MM-dd"));
							   modelService.save(save);
							   addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),itemcode);
						}
					}
		      }else{
		    	  returnErrorMsg+= toErrorStr(itemcode,dataauth,errorMsg);
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
				+ "<CB_ITEM_CODE>"+String.valueOf(objects[0])+"</CB_ITEM_CODE>\n"
				+ "<DATA_AUTH>"+String.valueOf(objects[1])+"</DATA_AUTH>\n"
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
		 save.getColMap().put("OBJECTNAME", "BOM");
		 save.getColMap().put("SYNCDIRECTION", "1");
		 save.getColMap().put("ERPNO", erpno);
		 return modelService.save(save);
	 }
	 
}
