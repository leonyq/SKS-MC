
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
 * @Description: 取消发货 接收参数 msg 
 * @author:mmz
 * @version:1.0
 * @since 2018年3月29日下午8:10:01
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class CancelSendGoodsSync implements IWebService {
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
	     
	      Object itemseq;
	      Object outnum;
	      
	      String errorMsg=""; 
	      
	      for (int i = 0; i < poBaseList.size(); i++) {
			
	    	  itemseq=poBaseList.get(i).get("WOD_ITEM_SEQ");
	    	  outnum=poBaseList.get(i).get("OUTSTOCK_NUM");
		      
		       
	    	  //如果存在一个节点异常(无已上任意一节点)
		      if(itemseq==null||outnum==null){
		    	  if("".equals(errorMsg)){
		    		  errorMsg="该表头出无以下节点";
		    	  } 	  
		    	  if(itemseq==null){
		    		  errorMsg+="WOD_ITEM_SEQ,";
		    	  }
		    	  if(outnum==null){
		    		  errorMsg+="OUTSTOCK_NUM,";
		    	  }
		    	  
		      }
		    
		       
		      
		      //无任何异常
		      if("".equals(errorMsg)){
		    	  	
		    	  //dataAuth=getDataId(dataAuth);
		    	   //erpDoc是否存在
		    	  	sql = "SELECT * FROM T_WMS_UNPRODOUTSTOCK  WHERE WOD_ITEM_SEQ =? ";
					list = modelService.listDataSql(sql, new Object[] {itemseq});
					if(list.size()>0){
						boolean sd = true;
						String sql1="select data_auth from T_WMS_OUTSTOCK_ITEM  where WOI_ITEM_SEQ=?";
						List<Map> list1 = modelService.listDataSql(sql1, new Object[] {itemseq});
						if(list1!=null&&list1.size()>0){
							String qwe = list1.get(0).get("DATA_AUTH").toString();
							sd=true;
						}else{
							returnErrorMsg+= toErrorStr(itemseq,null,"订单ID不是销售单所发的");
							addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),null);
							sd=false;
						}
						if(sd){
						update=new TableDataMapExt();
						update.setTableName("T_WMS_UNPRODOUTSTOCK");
						update.setSqlWhere(" and WOD_ITEM_SEQ='"+itemseq+"' ");
						update.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()), "yyyy-MM-dd"));
						update.getColMap().put("OUTSTOCK_NUM", outnum );// 
						modelService.edit(update);// 
						addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),itemseq);
						
						}
			              
						
					}else{
						boolean sd = true;
						String sql1="select data_auth from T_WMS_OUTSTOCK_ITEM  where WOI_ITEM_SEQ=?";
						List<Map> list1 = modelService.listDataSql(sql1, new Object[] {itemseq});
						if(list1!=null&&list1.size()>0){
							String qwe = list1.get(0).get("DATA_AUTH").toString();
							sd=true;
						}else{
							returnErrorMsg+= toErrorStr(itemseq,null,"订单ID不是销售单所发的");
							addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),null);
							sd=false;
						}
			            //保存base信息
						if(sd){
						save=new TableDataMapExt();
						save.setTableName("T_WMS_UNPRODOUTSTOCK");
						save.getColMap().put("ID", StringUtils.getUUID());
						save.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()), "yyyy-MM-dd"));// 
						save.getColMap().put("WOD_ITEM_SEQ",itemseq);// 
						save.getColMap().put("OUTSTOCK_NUM", outnum );// 
						save.getColMap().put("DATA_AUTH", list1.get(0).get("DATA_AUTH").toString());
						modelService.save(save);// 存储
						addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),itemseq);
						}
					}
		      }else{
		    	  returnErrorMsg+= toErrorStr(itemseq,null,errorMsg);
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
				+ "<WOI_ITEM_SEQ>"+String.valueOf(objects[0])+"</WOI_ITEM_SEQ>\n"
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
		 save.getColMap().put("OBJECTNAME", "UNPRODOUTSTOCK");
		 save.getColMap().put("SYNCDIRECTION", "1");
		 save.getColMap().put("ERPNO", erpno);
		 return modelService.save(save);
	 }
	 
}
