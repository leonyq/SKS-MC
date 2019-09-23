
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
  *ORACLE ERP
 * @ClassName:SyncPurchaseOrderInfo
 * @Description: 用户 接收参数 msg 
 * @author:mmz
 * @version:1.0
 * @since 2018年3月29日下午8:10:01
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class UserSync implements IWebService {
	final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");
    private MsHTranMan hbtran = BussService.getHbTran();
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Map<String, Object> excute(Object... objs) {
		//定义表单修改的的对象
		TableDataMapExt update;
		//定义表单存储的的对象
		TableDataMapExt save = null ;
		
//		String ID = StringUtils.getUUID();
		
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
		              
		              poBaseMap.put(elName, dataStr);
		              	
		          }
	        	  poBaseList.add(poBaseMap);
	         }          
            }
	      
	      /**
	       * 用户信息(base)
	       */
	     
	      //LOGIN_NAME
	      Object loginname;
	      
	      //NAME
	      Object name;
	      
	      //EMAIL
	      Object email;
	      
	      //PHONE
	      Object phone;
	      
	      //DEPT_ID
	      Object deptid;
	      
	      //DATA_AUTH
	      Object dataAuth;
	   
	      //ENABLE
	      Object enable;
	      
	    //ERP_DEPTID
	      Object erpdeptid;
	      
	    //ERP_TEAM
	      Object erpteam;
	      
	      String errorMsg=""; 
	      
	      
	      
	      
	      for (int i = 0; i < poBaseList.size(); i++) {
			
	    	  //LOGIN_NAME
	    	  loginname=poBaseList.get(i).get("LOGIN_NAME");
	    	  
	    	  //NAME
	    	  name=poBaseList.get(i).get("NAME");
		      
		      //EMAIL
	    	  email=poBaseList.get(i).get("EMAIL");
		      
		      //PHONE
	    	  phone=poBaseList.get(i).get("PHONE");
		      
		      //DEPT_ID
	    	  deptid=poBaseList.get(i).get("DEPT_ID");
		      
		      //DATA_AUTH
		       dataAuth=poBaseList.get(i).get("DATA_AUTH");
		      
		     //ENABLE
		       enable=poBaseList.get(i).get("ENABLE");
		       
		     //ERP_DEPTID
		       erpdeptid=poBaseList.get(i).get("ERP_DEPTID");
		       
		     //ERP_TEAM
		       erpteam=poBaseList.get(i).get("ERP_TEAM");
		       
	    	  //如果存在一个节点异常(无已上任意一节点)
		      if(loginname==null||name==null||email==null||phone==null
		    		  ||deptid==null||dataAuth==null ||enable==null||erpdeptid==null||erpteam==null){
		    	  if("".equals(errorMsg)){
		    		  errorMsg="该PO表头出无以下节点";
		    	  
		    	  } 	  
		    	  if(loginname==null){
		    		  errorMsg+="LOGIN_NAME,";
		    	  }
		    	  if(name==null){
		    		  errorMsg+="NAME,";
		    	  }
		    	  if(email==null){
		    		  errorMsg+="EMAIL,";
		    	  }
		    	  if(phone==null){
		    		  errorMsg+="PHONE,";
		    	  }
		    	  if(deptid==null){
		    		  errorMsg+="DEPT_ID,";
		    	  }
		    	  if(dataAuth==null){
		    		  errorMsg+="DATA_AUTH,";
		    	  }
		    	  if(enable==null){
		    		  errorMsg+="ENABLE,";
		    	  }
		    	  if(erpdeptid==null){
		    		  errorMsg+="ERP_DEPTID,";
		    	  }
		    	  if(erpteam==null){
		    		  errorMsg+="ERP_TEAM,";
		    	  }
		      }else{
		    	  
		    	  if(!isInteger(String.valueOf(enable))){
	   	    		   errorMsg+="此信息中enable不为数值";
	   	    	   }
//		    	  if (!isInteger(String.valueOf(enable))) {
//		    		  errorMsg+="手机号码长度不是11位";
//					}
//					if (!isMobile(String.valueOf(phone))) {
//						errorMsg+="手机号码格式有误,请核对";
//					}
//					if (!isEmail(String.valueOf(email))) {
//						errorMsg+="邮箱格式有误,请核对";
//					}
		      }
		    
		       
		      
		      //无任何异常
		      if("".equals(errorMsg)){
		    	  	
		    	  //dataAuth=getDataId(dataAuth);
		    	   //erpDoc是否存在
		    	  	sql = "SELECT * FROM SY_USER  WHERE LOGIN_NAME  =?";
					list = modelService.listDataSql(sql, new Object[] {loginname}); 
					boolean zw = true;
					if(dataAuth.equals("101")||dataAuth.equals("102")){
						zw=true;
					}else{
						returnErrorMsg+= toErrorStr(loginname,null,"组织机构不在操作范围内");
						addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),null);
						zw=false;
					}
					if(zw){
						
						if(list.size()>0){
							update=new TableDataMapExt();
							update.setTableName("SY_USER");
							update.setSqlWhere(" and LOGIN_NAME = '"+list.get(0).get("LOGIN_NAME")+"' ");
							update.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
							update.getColMap().put("NAME",name);// 
							update.getColMap().put("EMAIL", email );// 
							update.getColMap().put("MOBILE", phone);// 
							update.getColMap().put("ERP_DEPTID", deptid);// 
							update.getColMap().put("ENABLE", enable);// 
							update.getColMap().put("ERP_DEPTID", erpdeptid);// 
							update.getColMap().put("ERP_TEAM", erpteam);// 
							
							modelService.edit(update);// 存储-----------------------------------0912 12:07
							addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),loginname);
						}else{
				            //保存base信息
							save=new TableDataMapExt();
							save.setTableName("SY_USER");
							save.getColMap().put("ID", StringUtils.getUUID());
							save.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
							save.getColMap().put("LOGIN_NAME", loginname);//
							save.getColMap().put("NAME",name);// 
							save.getColMap().put("EMAIL", email );//
							save.getColMap().put("MOBILE", phone);// 
//							save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
							save.getColMap().put("ERP_DEPTID", deptid);//
							save.getColMap().put("DEPT_ID", "FA174AFF136D496A87B65443D22357E3");
							save.getColMap().put("ENABLE", enable);// 
							save.getColMap().put("ERP_DEPTID", erpdeptid);// 
							save.getColMap().put("ERP_TEAM", erpteam);// 
							modelService.save(save);// 存储
							
//							String data = "select ID from sy_user t where T.login_name = ?"; 
//				            List<Map> list1 = modelService.listDataSql(data, new Object[] { loginname });
				            String data2 = "select ID from sy_dept t where T.dep_sn = ?"; 
				            List<Map> list2 = modelService.listDataSql(data2, new Object[] { dataAuth });
			              	String ids2=list2.get(0).get("ID").toString();
			              	save=new TableDataMapExt();
							save.setTableName("SY_DATA_AUTH");
							save.getColMap().put("USER_ID",StringUtils.getUUID());
							save.getColMap().put("DEPT_ID",ids2);
							modelService.save(save);// 存储
							addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),loginname);
						}
					}
				}else{
		    	           returnErrorMsg+= toErrorStr(loginname,null,errorMsg);
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
				+ "<STUATE>NG</STUATE>\n"
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
		 save.getColMap().put("OBJECTNAME", "EMPLOYEE");
		 save.getColMap().put("SYNCDIRECTION", "1");
		 save.getColMap().put("ERPNO", erpno);
		 return modelService.save(save);
	 }
	 
}
