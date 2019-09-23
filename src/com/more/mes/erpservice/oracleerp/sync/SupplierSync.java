
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
 * @Description: 供应商同步 接收参数 msg 
 * @author:mmz
 * @version:1.0
 * @since 2018年3月29日下午8:10:01
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class SupplierSync implements IWebService {
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
		
		
		//表头数据集合
		List<Map> poBaseList=new ArrayList<Map>();
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
	       * 单位转换信息(base)
	       */
	     
	      Object suppliercode;
	      Object suppliername;
	      Object shortname;
	      Object dataauth;
	      Object enable;
	      
	      String errorMsg=""; 
	      
	      for (int i = 0; i < poBaseList.size(); i++) {
			
	    	  suppliercode=poBaseList.get(i).get("SUPPLIER_CODE");
	    	  suppliername=poBaseList.get(i).get("SUPPLIER_NAME");
	    	  shortname=poBaseList.get(i).get("SUPPLIER_SHORTNAME");
	    	  dataauth=poBaseList.get(i).get("DATA_AUTH");
	    	  enable=poBaseList.get(i).get("ENABLE");
		      
		       
	    	  //如果存在一个节点异常(无已上任意一节点)
		      if(suppliercode==null||suppliername==null||shortname==null||dataauth==null
		    		  ||enable==null){
		    	  if("".equals(errorMsg)){
		    		  errorMsg="该表头出无以下节点";
		    	  } 	  
		    	  if(suppliercode==null){
		    		  errorMsg+="SUPPLIER_CODE,";
		    	  }
		    	  if(suppliername==null){
		    		  errorMsg+="SUPPLIER_NAME,";
		    	  }
		    	  if(shortname==null){
		    		  errorMsg+="SUPPLIER_SHORTNAME,";
		    	  }
		    	  if(dataauth==null){
		    		  errorMsg+="DATA_AUTH,";
		    	  }
		    	  if(enable==null){
		    		  errorMsg+="ENABLE,";
		    	  }
		      }
		    
		       
		      
		      //无任何异常
		      if("".equals(errorMsg)){
		    	  	
		    	  dataauth=getDataId(dataauth);
		    	   //erpDoc是否存在
		    	  	sql = "SELECT ID FROM T_CO_SUPPLIER  WHERE SUPPLIER_CODE =? and data_auth=?";
					list = modelService.listDataSql(sql, new Object[] {suppliercode,dataauth});
					
					if(list.size()>0){
						update=new TableDataMapExt();
						update.setTableName("T_CO_SUPPLIER");
						update.setSqlWhere(" and ID = '"+list.get(0).get("ID")+"'and SUPPLIER_CODE='"+suppliercode+"' ");
						update.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()), "yyyy-MM-dd"));
//						update.getColMap().put("SUPPLIER_CODE",suppliercode);// 
						update.getColMap().put("SUPPLIER_NAME", suppliername );// 
						update.getColMap().put("SUPPLIER_SHORTNAME", shortname);// SUPPLIER_SHORTNAME
						update.getColMap().put("DATA_AUTH", dataauth);//
						update.getColMap().put("ENABLE", enable );// 
						update.getColMap().put("SYNC_FLAG", "N" );//是否同步过云标签N标识否
						modelService.edit(update);// 
						addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),suppliercode);

			              
						
					}else{
			            //保存base信息
						save=new TableDataMapExt();
						save.setTableName("T_CO_SUPPLIER");
						save.getColMap().put("ID", StringUtils.getUUID());
						save.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()), "yyyy-MM-dd"));
						save.getColMap().put("SUPPLIER_CODE",suppliercode);// 
						save.getColMap().put("SUPPLIER_NAME", suppliername );// 
						save.getColMap().put("SUPPLIER_SHORTNAME", shortname);// 
						save.getColMap().put("DATA_AUTH", dataauth);//
//						save.getColMap().put("SYNC_FLAG", "N");
						save.getColMap().put("ENABLE", enable );// 
						
						modelService.save(save);// 存储
						addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),suppliercode);
						
					}
		      }else{
		    	  returnErrorMsg+= toErrorStr(suppliercode,null,errorMsg);
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
				+ "<SUPPLIER_CODE>"+String.valueOf(objects[0])+"</SUPPLIER_CODE>\n"
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
		 save.getColMap().put("OBJECTNAME", "SUPPLIER");
		 save.getColMap().put("SYNCDIRECTION", "1");
		 save.getColMap().put("ERPNO", erpno);
		 return modelService.save(save);
	 }
	 
}
