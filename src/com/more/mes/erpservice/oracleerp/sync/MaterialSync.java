
package com.more.mes.erpservice.oracleerp.sync;


import java.text.SimpleDateFormat;
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
 * ORACLE ERP
 * @ClassName:SyncPurchaseOrderInfo
 * @Description: 物料 接收参数 msg 
 * @author:mmz
 * @version:1.0
 * @since 2018年3月29日下午8:10:01
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class MaterialSync implements IWebService {
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
	       * 物料信息(base)
	       */
	      Object itemcode;
	      Object itemname;
	      Object itemspec;
	      Object itemtype;
	      Object unit;
	      Object maxstock;
	      Object minstock;
	      Object minpack;
	      Object dataauth;
	      Object enable;
	      Object createuser;
	      Object createtime;
	      Object edituser;
	      Object edittime;
	      Object vertion;
	      
	      String errorMsg=""; 
	      
	      
	      
	      
	      for (int i = 0; i < poBaseList.size(); i++) {
//			System.out.println("-----------"+i);
	    	  itemcode=poBaseList.get(i).get("CI_ITEM_CODE");
	    	  itemname=poBaseList.get(i).get("CI_ITEM_NAME");
	    	  itemspec=poBaseList.get(i).get("CI_ITEM_SPEC");
	    	  itemtype=poBaseList.get(i).get("CI_ITEM_TYPE");
	    	  unit=poBaseList.get(i).get("CI_UNIT");
	    	  maxstock=poBaseList.get(i).get("CI_MAX_STOCK");
	    	  minstock=poBaseList.get(i).get("CI_MIN_STOCK");
	    	  minpack=poBaseList.get(i).get("CI_MIN_PACK");
	    	  dataauth=poBaseList.get(i).get("DATA_AUTH");
	    	  enable=poBaseList.get(i).get("ENABLE");
	    	  createuser=poBaseList.get(i).get("CREATE_USER");
	    	  createtime=poBaseList.get(i).get("CREATE_TIME");
	    	  edituser=poBaseList.get(i).get("EDIT_USER");
	    	  edittime=poBaseList.get(i).get("EDIT_TIME");
	    	  vertion=poBaseList.get(i).get("DEFAULTVERSION");
	    	  
		       
		       
	    	  //如果存在一个节点异常(无已上任意一节点)
		      if(itemcode==null||itemname==null||itemspec==null||itemtype==null
		    		  ||unit==null||maxstock==null ||minstock==null||minpack==null||dataauth==null
		    		  ||enable==null||createuser==null||createtime==null||edituser==null
		    		  ||edittime==null||vertion==null){
		    	  if("".equals(errorMsg)){
		    		  errorMsg="该PO表头出无以下节点";
		    	  
		    	  } 	  
		    	  if(itemcode==null){
		    		  errorMsg+="CI_ITEM_CODE,";
		    	  }
		    	  if(itemname==null){
		    		  errorMsg+="CI_ITEM_NAME,";
		    	  }
		    	  if(itemspec==null){
		    		  errorMsg+="CI_ITEM_SPEC,";
		    	  }
		    	  if(itemtype==null){
		    		  errorMsg+="CI_ITEM_TYPE,";
		    	  }
		    	  if(unit==null){
		    		  errorMsg+="CI_UNIT,";
		    	  }
		    	  if(maxstock==null){
		    		  errorMsg+="CI_MAX_STOCK,";
		    	  }
		    	  if(minstock==null){
		    		  errorMsg+="CI_MIN_STOCK,";
		    	  }
		    	  if(minpack==null){
		    		  errorMsg+="CI_MIN_PACK,";
		    	  }
		    	  if(dataauth==null){
		    		  errorMsg+="DATA_AUTH,";
		    	  }
		    	  if(enable==null){
		    		  errorMsg+="ENABLE,";
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
		    	  if(vertion==null){
		    		  errorMsg+="DEFAULTVERSION,";
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
		      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		      //无任何异常
		      if("".equals(errorMsg)){
		    	  	
		    	  String dataAuth=getDataId(dataauth).toString();
		    	   //erpDoc是否存在
		    	  	sql = "SELECT * FROM T_CO_ITEM	WHERE CI_ITEM_CODE  =? and data_auth=?";
					list = modelService.listDataSql(sql, new Object[] {itemcode,dataAuth});  	 
					
					if(list.size()>0){
						update=new TableDataMapExt();
						update.setTableName("T_CO_ITEM");
						update.setSqlWhere("and CI_ITEM_CODE='"+itemcode+"' and DATA_AUTH='"+dataAuth+"' ");//sdf1.parse(sdf1.format(new Date()))
						update.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(edittime), "yyyy-MM-dd"));//
						update.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd"));
//						update.getColMap().put("CI_ITEM_CODE", itemcode);// 
						update.getColMap().put("CI_ITEM_NAME",itemname);// 
						update.getColMap().put("CI_ITEM_SPEC", itemspec );// 
						update.getColMap().put("CI_ITEM_TYPE", itemtype);// 
//						update.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
						update.getColMap().put("CI_UNIT", unit);// 
						update.getColMap().put("CI_MAX_STOCK", maxstock);// 
						update.getColMap().put("CI_MIN_STOCK", minstock);// 
						update.getColMap().put("CI_MIN_PACK", minpack);// 
						update.getColMap().put("ENABLE", enable);
						update.getColMap().put("CREATE_USER", createuser);
						update.getColMap().put("EDIT_USER", edituser);
						update.getColMap().put("DEFAULTVERSION", vertion);
						update.getColMap().put("SYNC_FLAG", "N");
						modelService.edit(update);//
						
						
						String sql001="select item_version from t_co_itemversion where ci_item_code='"+itemcode+"' and data_auth='"+dataAuth+"'";
						List<Map<String, String>> snLis1 = CommMethod.getBaseService().listDataSql(sql001);
						if(snLis1.isEmpty()){
//							String version01 = snLis1.get(0).get("ITEM_VERSION").toString();
//							if(!vertion.equals(version01)){
								save=new TableDataMapExt();
								save.setTableName("t_co_itemversion");
								save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
								save.getColMap().put("CI_ITEM_CODE", itemcode);//
								save.getColMap().put("ITEM_VERSION", vertion);// 
								save.getColMap().put("ID", StringUtils.getUUID());
								modelService.save(save);
								addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),itemcode);
//							}
							
						}else{
							String version01 = snLis1.get(0).get("ITEM_VERSION");
							if(!vertion.equals(version01)){
							save=new TableDataMapExt();
							save.setTableName("t_co_itemversion");
							save.getColMap().put("ID", StringUtils.getUUID());
							save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
							save.getColMap().put("CI_ITEM_CODE", itemcode);//
							save.getColMap().put("ITEM_VERSION", vertion);// 
							modelService.save(save);
							addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),itemcode);
							}
						}
						
						
						
						
					}else{
			            //保存base信息
						save=new TableDataMapExt();
						save.setTableName("T_CO_ITEM");
						save.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(edittime), "yyyy-MM-dd"));
						save.getColMap().put("CREATE_TIME",  DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd"));
						save.getColMap().put("CI_ITEM_CODE", itemcode);// 
						save.getColMap().put("CI_ITEM_NAME",itemname);// 
						save.getColMap().put("CI_ITEM_SPEC", itemspec );// 
						save.getColMap().put("CI_ITEM_TYPE", itemtype);// 
						save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
						save.getColMap().put("CI_UNIT", unit);// 
						save.getColMap().put("ID", StringUtils.getUUID());
						save.getColMap().put("CI_MAX_STOCK", maxstock);// 
						save.getColMap().put("CI_MIN_STOCK", minstock);// 
						save.getColMap().put("CI_MIN_PACK", minpack);// 
						save.getColMap().put("ENABLE", enable);
						save.getColMap().put("CREATE_USER", createuser);
						save.getColMap().put("EDIT_USER", edituser);
						save.getColMap().put("DEFAULTVERSION", vertion);
						modelService.save(save);// 存储
						String sql001="select item_version from t_co_itemversion where ci_item_code='"+itemcode+"' and data_auth='"+dataAuth+"'";
						List<Map<String, String>> snLis1 = CommMethod.getBaseService().listDataSql(sql001);
						if(snLis1.isEmpty()){
//							String version01 = snLis1.get(0).get("ITEM_VERSION").toString();
//							if(!vertion.equals(version01)){
							save=new TableDataMapExt();
							save.setTableName("t_co_itemversion");
							save.getColMap().put("ID", StringUtils.getUUID());
							save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
							save.getColMap().put("CI_ITEM_CODE", itemcode);//
							save.getColMap().put("ITEM_VERSION", vertion);// 
							modelService.save(save);
							addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),itemcode);
//							}
							
						}else{
							String version01 = snLis1.get(0).get("ITEM_VERSION");
							if(!vertion.equals(version01)){
							save=new TableDataMapExt();
							save.setTableName("t_co_itemversion");
							save.getColMap().put("ID", StringUtils.getUUID());
							save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
							save.getColMap().put("CI_ITEM_CODE", itemcode);//
							save.getColMap().put("ITEM_VERSION", vertion);// 
							modelService.save(save);
							addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),itemcode);
							}
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
				+ "<CI_ITEM_CODE>"+String.valueOf(objects[0])+"</CI_ITEM_CODE>\n"
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
	 /**
	     * 正则表达式：验证手机号
	     */
	    public static final String REGEX_MOBILE = "^((17[0-9])|(14[0-9])|(13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
	   /**
	     * 校验手机号
	     * 
	     * @param mobile
	     * @return 校验通过返回true，否则返回false
	     */
	    public static boolean isMobile(String mobile) {
	        return Pattern.matches(REGEX_MOBILE, mobile);
	    }
     
	    /**
	     * 正则表达式：验证邮箱
	     */
	    public static final String REGEX_EMAIL = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
	    /**
	     * 校验邮箱
	     * 
	     * @param email
	     * @return 校验通过返回true，否则返回false
	     */
	    public static boolean isEmail(String email) {
	        return Pattern.matches(REGEX_EMAIL, email);
	    }
	    @SuppressWarnings("unchecked")
		int addErrorDate(TableDataMapExt save,Object erpJson,Object mesJson,Object erpno){
			 save=new TableDataMapExt();
			 save.setTableName("T_CO_ERPLOG");
			 save.getColMap().put("ID", StringUtils.getUUID());
			 save.getColMap().put("ERPJASON", erpJson);
			 save.getColMap().put("MESJASON", mesJson);
			 save.getColMap().put("OPERATEDATE", DateUtil.getCurDate());
			 save.getColMap().put("OBJECTNAME", "MATERIAL");
			 save.getColMap().put("SYNCDIRECTION", "1");
			 save.getColMap().put("ERPNO", erpno);
			 return modelService.save(save);
		 }
	 
}
