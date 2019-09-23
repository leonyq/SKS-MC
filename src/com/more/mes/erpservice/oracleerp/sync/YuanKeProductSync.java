
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
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.fw.webservice.service.IWebService;

/**
ORACE ERP
 * @ClassName:SyncPurchaseOrderInfo
 * @Description: 源科半成品自制 接收参数 msg 
 * @author:mmz
 * @version:1.0
 * @since 2018年3月29日下午8:10:01
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class YuanKeProductSync implements IWebService {
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
        String returnErrorMsg = "";
		Map<String, Object> resmap = new HashMap<String, Object>();// 存返回数据
		Map<String,Object> poBaseMap;
		Map<String,Object> poDetailMap;
		//表头数据集合
		List<Map> poBaseList=new ArrayList<Map>();
		//表身数据集合数据集合
		//表身所有Item集合
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
		            //节点名称
		              String elName=bookChild.getName();
		            //节点值
		              String dataStr=bookChild.getStringValue();
		              
		              poBaseMap.put(elName, dataStr);
		              	
		          }
	        	  poBaseList.add(poBaseMap);
	         }
	         
            }
	      
	      /**
	       * 定义工单标准信息(base)
	       */
	     
	      Object erpDoc;
	      Object erpdocname;
	      Object productmaterial;
	      Object itemunit;
	      Object productcount;
	      Object stardate;
	      Object enddate;
	      Object createuser;
	      Object createtime;
	      Object edituser;
	      Object edittime;
	      Object custcode;
	      Object destroyno;
	      Object workstation;
	      Object dataauth;
	      Object comment1;
	      Object comment2;
	      Object comment3;
	      Object comment4;
	      Object comment5;
	      Object comment6;
	      Object projecttype;
	      String errorMsg=""; 
	      
	      
	      for (int i = 0; i < poBaseList.size(); i++) {
	    	  projecttype=poBaseList.get(i).get("PROJECT_TYPE");
	    	  erpDoc=poBaseList.get(i).get("ERP_DOC");
	    	  erpdocname=poBaseList.get(i).get("ERP_DOCNAME");
	    	  productmaterial=poBaseList.get(i).get("PRODUCT_MATERIAL");
	    	  itemunit=poBaseList.get(i).get("ITEM_UNIT");
	    	  productcount=poBaseList.get(i).get("PRODUCT_COUNT");
	    	  stardate=poBaseList.get(i).get("PROLEPSIS_START_DATE");
	    	  enddate=poBaseList.get(i).get("PROLEPSIS_END_DATE");
	    	  createuser=poBaseList.get(i).get("CREATE_USER");
	    	  createtime=poBaseList.get(i).get("CREATE_TIME");
	    	  edituser=poBaseList.get(i).get("EDIT_USER");
	    	  edittime=poBaseList.get(i).get("EDIT_TIME");
	    	  custcode=poBaseList.get(i).get("CUSTCODE");
	    	  destroyno=poBaseList.get(i).get("DESTROY_NO");
	    	  workstation=poBaseList.get(i).get("WORKSTATION");
	    	  dataauth=poBaseList.get(i).get("DATA_AUTH");
	    	  
	    	  comment1=poBaseList.get(i).get("COMMENT1");
	    	  comment2=poBaseList.get(i).get("COMMENT2");
	    	  comment3=poBaseList.get(i).get("COMMENT3");
	    	  comment4=poBaseList.get(i).get("COMMENT4");
	    	  comment5=poBaseList.get(i).get("COMMENT5");
	    	  comment6=poBaseList.get(i).get("COMMENT6");
	    	  
		       
	    	  //如果存在一个节点异常(无已上任意一节点)
		      if(erpDoc==null||erpdocname==null||productmaterial==null||productcount==null
		    		  ||stardate==null||enddate==null||createuser==null||createtime==null||edituser==null
		    		  ||edittime==null||custcode==null||destroyno==null||workstation==null||dataauth==null
		    		  ||comment1==null||comment2==null||comment3==null||comment4==null||comment5==null
		    		  ||comment6==null||itemunit==null||projecttype==null){
		    	  if("".equals(errorMsg)){
		    		  errorMsg="该PO无以下节点";
		    	  
		    	  } 
		    	  if(projecttype==null){
		    		  errorMsg+="PROJECT_TYPE,";
		    	  }
		    	  if(erpDoc==null){
		    		  errorMsg+="ERP_DOC,";
		    	  }
		    	  if(itemunit==null){
		    		  errorMsg+="ITEM_UNIT,";
		    	  }
		    	  if(erpdocname==null){
		    		  errorMsg+="ERP_DOCNAME,";
		    	  }
		    	  if(productmaterial==null){
		    		  errorMsg+="PRODUCT_MATERIAL,";
		    	  }
		    	  if(productcount==null){
		    		  errorMsg+="PRODUCT_COUNT,";
		    	  }
		    	  if(stardate==null){
		    		  errorMsg+="PROLEPSIS_START_DATE,";
		    	  }
		    	  if(enddate==null){
		    		  errorMsg+="PROLEPSIS_END_DATE,";
		    	  }
		    	  if(createuser==null){
		    		  errorMsg+="CREATE_USER,";
		    	  }
		    	  if(edituser==null){
		    		  errorMsg+="EDIT_USER,";
		    	  }
		    	  if(edittime==null){
		    		  errorMsg+="EDIT_TIME,";
		    	  }
		    	  if(custcode==null){
		    		  errorMsg+="CUSTCODE,";
		    	  }
		    	  if(destroyno==null){
		    		  errorMsg+="DESTROY_NO,";
		    	  }
		    	  if(workstation==null){
		    		  errorMsg+="WORKSTATION,";
		    	  }
		    	  if(dataauth==null){
		    		  errorMsg+="DATA_AUTH,";
		    	  }
		    	  if(comment1==null){
		    		  errorMsg+="COMMENT1,";
		    	  }
		    	  if(comment2==null){
		    		  errorMsg+="COMMENT2,";
		    	  }
		    	  if(comment3==null){
		    		  errorMsg+="COMMENT3,";
		    	  }
		    	  if(comment4==null){
		    		  errorMsg+="COMMENT4,";
		    	  }
		    	  if(comment5==null){
		    		  errorMsg+="COMMENT5,";
		    	  }
		    	  if(comment6==null){
		    		  errorMsg+="COMMENT6,";
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
		    	  if(stardate.equals("")){
		    		  stardate=DateUtil.getCurDateStr();  
		    	  }else{
		    		  if(DateUtil.parseDate(String.valueOf(stardate),"yyyy-MM-dd")==null){
			    		  
			    		  errorMsg+="此PROLEPSIS_START_DATE时间格式有误";
			    	  }
		    	  }
		    	  if(enddate.equals("")){
		    		  enddate=DateUtil.getCurDateStr();  
		    	  }else{
		    		  if(DateUtil.parseDate(String.valueOf(enddate),"yyyy-MM-dd")==null){
			    		  
			    		  errorMsg+="此PROLEPSIS_END_DATE时间格式有误";
			    	  }
		    	  }
		      }
		      
		      //无任何异常
		      if("".equals(errorMsg)){
		    	  
		    	    dataauth=getDataId(dataauth);
		    	   //erpDoc是否存在
		    	  	sql = "SELECT * FROM T_PM_PROJECT_BASE  WHERE ERP_DOC  =? and PRODUCT_MATERIAL =?";
		    	  	
					list = modelService.listDataSql(sql, new Object[] {erpDoc,productmaterial});  	 
					
					if(list.size()>0){
						update=new TableDataMapExt();
						update.setTableName("T_PM_PROJECT_BASE");
						update.setSqlWhere(" and erp_doc = '"+erpDoc+"' and PRODUCT_MATERIAL ='"+productmaterial+"'");//如何取值待测试
						update.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd"));
						update.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(edittime), "yyyy-MM-dd"));
						update.getColMap().put("ITEM_UNIT", itemunit);// 计量单位
						update.getColMap().put("ERP_DOCNAME",erpdocname);// 工单名称
						update.getColMap().put("PRODUCT_COUNT", productcount);// 开单人
						update.getColMap().put("PROLEPSIS_START_DATE", DateUtil.parseDate(String.valueOf(stardate), "yyyy-MM-dd"));// 组织机构
						update.getColMap().put("PROLEPSIS_END_DATE", DateUtil.parseDate(String.valueOf(enddate), "yyyy-MM-dd"));// 备注
						update.getColMap().put("CREATE_USER", createuser);// 
						update.getColMap().put("EDIT_USER", edituser);// 
						update.getColMap().put("CUST_CODE", custcode);// 
						update.getColMap().put("DESTROY_NO", destroyno);//
						//品名
						sql = "SELECT distinct t.CI_ITEM_NAME FROM T_CO_ITEM t  WHERE CI_ITEM_CODE  =? and data_auth=?";
						list = modelService.listDataSql(sql, new Object[] {productmaterial,dataauth});
						String qwe = list.get(0).get("CI_ITEM_NAME").toString();
						update.getColMap().put("PRODUCT_NAME", qwe);//品名
						//
						update.getColMap().put("WORKSTATION", workstation);// 
						update.getColMap().put("DATA_AUTH", dataauth);// 
						update.getColMap().put("COMMENT1", comment1);// 
						update.getColMap().put("COMMENT2", comment2);// 
						update.getColMap().put("COMMENT3", comment3);// 
						update.getColMap().put("COMMENT4", comment4);// 
						update.getColMap().put("COMMENT5", comment5);// 
						update.getColMap().put("COMMENT6", comment6);//
						update.getColMap().put("PROJECT_TYPE", projecttype);//
						modelService.edit(update);// 存储
						
						String sql003="select distinct t3.CBD_ITEM_CODE,t3.CBD_ITEM_CODE,t3.CBD_UNITS,to_char(t3.CBD_ITEM_NUM) CBD_ITEM_NUM,t3.ITEM_VERSION " +
								"from  T_PM_PROJECT_BASE  t  " +
								"left join T_CO_BOM t1 on t1.CB_ITEM_CODE = t.PRODUCT_MATERIAL " +
								"left join T_PM_PROJECT_DETAIL t2 on t2.PROJECT_ID = t.PROJECT_ID " +
								"left join T_CO_BOM_DETAIL t3 on t1.id = t3.CB_BOMID  " +
								"where sysdate between t3.CBD_StartDate and t3.CBD_EndDate";
						
						List<Map<String, String>> snLis1 = CommMethod.getBaseService().listDataSql(sql003);
						for(int j =0;j<snLis1.size();j++){
						if(snLis1.size()>0){
							String itemcode1 = snLis1.get(j).get("CBD_ITEM_CODE");
						    String unit1 = snLis1.get(j).get("CBD_UNITS");
						    String itemnum1 = snLis1.get(j).get("CBD_ITEM_NUM");
						    String vertion1 = snLis1.get(j).get("ITEM_VERSION");
							
			    	       update=new TableDataMapExt();
			    	       update.setTableName("T_PM_PROJECT_DETAIL");
			    	       update.setSqlWhere("and CBD_ITEM_CODE='"+snLis1.get(j).get("CBD_ITEM_CODE")+"' and data_auth='"+dataauth+"' ");
			    	       update.getColMap().put("CBD_ITEM_CODE", itemcode1);
			    	       update.getColMap().put("CBD_UNITS", unit1);//toInteger(wpdPlanNum)
			    	       update.getColMap().put("CBD_ITEM_NUM", Integer.parseInt(itemnum1));
			    	       update.getColMap().put("ITEM_VERSION", vertion1);//DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd")
			    	       update.getColMap().put("DATA_AUTH", dataauth);// 组织机构
			    	       update.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()), "yyyy-MM-dd"));
						   modelService.edit(update);
						   addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),erpDoc);
						   
						}
					    
						}
						
					}else{
			            //保存base信息
						String projectId = getReceiveNo(String.valueOf(dataauth),"S001",null,modelService);//生成工单号
						save=new TableDataMapExt();
						save.setTableName("T_PM_PROJECT_BASE");
						save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd"));
						save.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(edittime), "yyyy-MM-dd"));
						save.getColMap().put("ERP_DOC", erpDoc);// 
						save.getColMap().put("PROJECT_ID", projectId);
						save.getColMap().put("ERP_DOCNAME",erpdocname);
//						save.getColMap().put("PRODUCT_COUNT",erpdocname);//   
						save.getColMap().put("PRODUCT_MATERIAL", productmaterial);// 
						save.getColMap().put("PRODUCT_COUNT", productcount);// 
						save.getColMap().put("ACTUAL_START_DATE", DateUtil.parseDate(String.valueOf(stardate), "yyyy-MM-dd"));// 组织机构
						save.getColMap().put("ACTUAL_END_DATE", DateUtil.parseDate(String.valueOf(enddate), "yyyy-MM-dd"));// 备注
						save.getColMap().put("CREATE_USER", createuser);// 
						save.getColMap().put("EDIT_USER", edituser);// 
						save.getColMap().put("CUST_CODE", custcode);//
						save.getColMap().put("ID", StringUtils.getUUID());//
						save.getColMap().put("DESTROY_NO", destroyno);// 
						save.getColMap().put("WORKSTATION", workstation);//
						//品名
						sql = "SELECT t.CI_ITEM_NAME FROM T_CO_ITEM t  WHERE CI_ITEM_CODE  =?";
						list = modelService.listDataSql(sql, new Object[] {productmaterial});
						if(!(list==null)&&list.size()>0){
							String qwe = list.get(0).get("CI_ITEM_NAME").toString();
							save.getColMap().put("PRODUCT_NAME", qwe);//品名
						}else{
							save.getColMap().put("PRODUCT_NAME", erpdocname);//品名
						}
						save.getColMap().put("DATA_AUTH", dataauth);// 
						save.getColMap().put("COMMENT1", comment1);// 
						save.getColMap().put("COMMENT2", comment2);// 
						save.getColMap().put("COMMENT3", comment3);// 
						save.getColMap().put("COMMENT4", comment4);// 
						save.getColMap().put("COMMENT5", comment5);// 
						save.getColMap().put("COMMENT6", comment6);// 
						save.getColMap().put("PROJECT_TYPE", projecttype);// 
						modelService.save(save);// 存储
						
						
						String sql002="select distinct t3.CBD_ITEM_CODE,t3.CBD_UNITS,to_char(t3.CBD_ITEM_NUM) CBD_ITEM_NUM,t3.ITEM_VERSION " +
								"from  T_PM_PROJECT_BASE  t  " +
								"left join T_CO_BOM t1 on t1.CB_ITEM_CODE = t.PRODUCT_MATERIAL " +
								"left join T_PM_PROJECT_DETAIL t2 on t2.PROJECT_ID = t.PROJECT_ID " +
								"left join T_CO_BOM_DETAIL t3 on t1.id = t3.CB_BOMID  " +
								"where sysdate between t3.CBD_StartDate and t3.CBD_EndDate";
						List<Map<String, String>> snLis = CommMethod.getBaseService().listDataSql(sql002);
						if(snLis.size()>0){
							 String itemcode1 = snLis.get(0).get("CBD_ITEM_CODE");
							 String unit1 = snLis.get(0).get("CBD_UNITS");
							 Integer itemnum1 = Integer.parseInt(snLis.get(0).get("CBD_ITEM_NUM"));
							 String vertion1 = snLis.get(0).get("ITEM_VERSION");
							 save=new TableDataMapExt();
				    	     save.setTableName("T_PM_PROJECT_DETAIL");
				    	     save.getColMap().put("CBD_ITEM_CODE", itemcode1);
				    	     save.getColMap().put("CBD_UNITS", unit1);//toInteger(wpdPlanNum)
				    	     save.getColMap().put("CBD_ITEM_NUM", itemnum1);
				    	     save.getColMap().put("PROJECT_ID", projectId);
				    	     save.getColMap().put("ITEM_VERSION", vertion1);//DateUtil.parseDate(String.valueOf(createTime), "yyyy-MM-dd")
				    	     save.getColMap().put("DATA_AUTH", dataauth);// 组织机构
				    	     save.getColMap().put("ID", StringUtils.getUUID());
				    	     save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()),"yyyy-MM-dd"));
							 modelService.save(save);
							 addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),erpDoc);
							}else{
								returnErrorMsg+= toErrorStr(erpDoc,null,"有效期内无有效数据");
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
		 save.getColMap().put("OBJECTNAME", "YKPRODTASK");
		 save.getColMap().put("SYNCDIRECTION", "1");
		 save.getColMap().put("ERPNO", erpno);
		 return modelService.save(save);
	 }
	 
}
