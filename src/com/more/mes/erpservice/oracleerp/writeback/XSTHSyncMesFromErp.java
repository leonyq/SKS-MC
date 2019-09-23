
package com.more.mes.erpservice.oracleerp.writeback;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.mes.erpservice.oracleerp.constant.ConstantClass;
import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;


	/**
	 * 
	 * 销售退货回写(定时器)
	 * 
	 */
	

public class XSTHSyncMesFromErp implements IJobx{

	private final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");
    private MsHTranMan hbtran = BussService.getHbTran();
	
	
	@Override
	public void exec(Args arg0) {
		
		String docType = "DJ04";
		
		String objectType=ConstantClass.INSALE;
		
		String xmlType=ConstantClass.MES_TO_ERP_SO_RETURN;
		
		String objectType1=ConstantClass.CANCELOUT;
		
		String xmlType1=ConstantClass.MES_TO_ERP_SO_CANCEL;
		
		String type = "IN";
		
		Object docNum = "";
		
		String pMesId = "";
		
		Map<String,Object> map;
		
		String isSuccess="";
		
		String xml = null;
		
		String returnStr="";
		
		String wriDocNum = "";
		
		TableDataMapExt  update = null;
		
		Map<String,Object> poBaseMap;
		
		try {
			
			List<Map> list = null;
		
			//
			String returnSql=" SELECT * FROM T_WMS_RECEIVE_DETAIL WHERE WRD_ITEM_ID=? ";
			
			List<Map> returnList;
			
			//汇总物料明细进行回传
			
			String formSql="SELECT * FROM ( "
					 + " SELECT T1.WRI_DOC_NUM,T1.ID,T2.id EDID,T1.WRI_PLAN_NUM ,T2.WOD_OUTSTOCK_NUM,WRI_STATUS FROM T_WMS_RECEIVE_ITEM T1 LEFT JOIN  "
					 + " (SELECT ID, WRD_ITEM_ID ,NVL(SUM(WRD_RECEIVE_NUM),0) AS WOD_OUTSTOCK_NUM  FROM T_WMS_RECEIVE_DETAIL WHERE WRD_WH_CODE IS NOT NULL AND (WRD_UPLOAD_FLAG='N' OR WRD_UPLOAD_FLAG IS NULL)   "
					 + " GROUP BY ID, WRD_ITEM_ID) T2 ON T1.ID=T2.WRD_ITEM_ID)  "
					 + " WHERE WRI_STATUS='3'  AND WRI_DOC_NUM=? ";
			
			
		List<Map> listXml = ConstantClass.getDocList(modelService, type, docType);
		 
		if(listXml.size()==0){
			
			throw new BussException("无回传数据");
			
		}
		
		for (int t = 0; t < listXml.size(); t++) {
			
			pMesId = StringUtils.getUUID();
			
			docNum = listXml.get(t).get("DOC_NUM");
			
			wriDocNum = String.valueOf(docNum);
			
			
			List<Map> formList = modelService.listDataSql(formSql, new Object[]{wriDocNum});
			
			Object wodItemId;
			
			if(formList.size()==0){
				
				continue;
				
			}
			
			for (int i = 0; i < formList.size(); i++) {
				
				wodItemId = formList.get(i).get("EDID");
				Object itemId= formList.get(i).get("ID");
				Object	itemname= formList.get(i).get("WRI_DOC_NUM");
				if(itemname.toString().substring(0, 2).equals("TH")){

					
					//根据物料明细行，进行多次回传,取消发货
					
					
					
					returnList=modelService.listDataSql(returnSql, new Object[]{itemId});
					
					String whereIn="";
					
					String mesId=StringUtils.getUUID();
					
					for (int j = 0; j < returnList.size(); j++) {
						
						
						
						if(returnList.size()-1==j){
							
							whereIn+="'"+String.valueOf(returnList.get(j).get("ID"))+"'";
							
						}else{
							
							whereIn+="'"+String.valueOf(returnList.get(j).get("ID"))+"'"+",";
							
						}
						
						
						//如果不存在mesid 更新指定mesid
						if(returnList.get(j).get("P_MES_ID")==null||returnList.get(j).get("P_MES_ID").equals("null")||returnList.get(j).get("P_MES_ID").equals("")){
							
							update=new TableDataMapExt();
							
							update.setTableName("T_WMS_RECEIVE_DETAIL");
							
							update.setSqlWhere(" and ID = '"+returnList.get(j).get("ID")+"' ");
							
							update.getColMap().put("P_MES_ID", mesId+"-"+i);
							
							modelService.edit(update);
						}
					
					
					
				}
				if(whereIn.equals("")){
					
					continue;
					
				}
				
				wodItemId = "'"+wodItemId+"'";
				
				map=ConstantClass.mesSyncFromErp(modelService, wriDocNum, "admin", objectType1, pMesId, xmlType1, String.valueOf(wodItemId));
		    	

				
				isSuccess=String.valueOf(map.get("isSuccess"));
				
				if(isSuccess.equals("Y")){
				
				xml	= String.valueOf(map.get("xml"));
					
				returnStr = String.valueOf(map.get("returnStr"));
				
				if(String.valueOf(returnStr).equals("null")){
					
					
					addErrorDate(update, returnStr, xml, modelService,wriDocNum,xmlType1);
					
					
				}
				String str="";
				try {
					str = returnStr.substring(returnStr.indexOf("<X_MSG_DATA>") + 12,
						returnStr.indexOf("</X_MSG_DATA>"));
				} catch (Exception e) {
					
					addErrorDate(update, returnStr, xml, modelService,wriDocNum,xmlType1);
					
					
				}	
				
				boolean flag=ConstantClass.isXmlDocument(str);
				
					if(flag){
						poBaseMap=ConstantClass.parsingXml(str);  
			   		    
						editPutInDocStatus(modelService, update, wriDocNum , objectType1, String.valueOf(wodItemId), "Y" , "E");
						
						list=new ArrayList<Map>();  
						
						list=(List<Map>) poBaseMap.get("list");
						
						Object batch;
						
						Object sourceLineId;
						
						Object sourceBatch;
						
						for (int z = 0; z < list.size(); z++) {
							
							batch=list.get(z).get("BATCH");
							
							if(batch==null){
								
								batch=list.get(z).get("LOT_NUMBER");
								
							}
							
							sourceLineId=list.get(z).get("SOURCE_LINE_ID");
							
							sourceBatch=list.get(z).get("SOURCE_BATCH");
							
							int a=editPutInDocStatusLine(modelService, update, wriDocNum, sourceBatch, sourceLineId, batch, objectType1);
							
						}
						
						
					}else{
						
						if("OK".equals(String.valueOf(str))||"事务处理成功。OK".equals(String.valueOf(str))){
						
							editPutInDocStatus(modelService, update, wriDocNum , objectType1, String.valueOf(wodItemId), "Y", "Y");
							
						}else{
							
							editPutInDocStatus(modelService, update, wriDocNum , objectType1, String.valueOf(wodItemId), "N", "N");
							
						}
						
					}
		    		//新增日志信息
		    		addErrorDate(update, returnStr, xml, modelService,wriDocNum,xmlType1);
		    		  		
		    		
				} else{
					
					addErrorDate(update, returnStr, xml, modelService,wriDocNum,xmlType1);
				}
					
					
					
			}else{
				
				//根据物料明细行，进行多次回传
				
				
				
				returnList=modelService.listDataSql(returnSql, new Object[]{itemId});
				
				String whereIn="";
				
				String mesId=StringUtils.getUUID();
				
				for (int j = 0; j < returnList.size(); j++) {
					
					
					
					if(returnList.size()-1==j){
						
						whereIn+="'"+String.valueOf(returnList.get(j).get("ID"))+"'";
						
					}else{
						
						whereIn+="'"+String.valueOf(returnList.get(j).get("ID"))+"'"+",";
						
					}
					
					
					//如果不存在mesid 更新指定mesid
					if(returnList.get(j).get("P_MES_ID")==null||returnList.get(j).get("P_MES_ID").equals("null")||returnList.get(j).get("P_MES_ID").equals("")){
						
						update=new TableDataMapExt();
						
						update.setTableName("T_WMS_RECEIVE_DETAIL");
						
						update.setSqlWhere(" and ID = '"+returnList.get(j).get("ID")+"' ");
						
						update.getColMap().put("P_MES_ID", mesId);
						
						modelService.edit(update);
					}
				
				
				
			}
			if(whereIn.equals("")){
				
				continue;
				
			}
			
			wodItemId = "'"+wodItemId+"'";
			
			itemId = "'"+itemId+"'";
			
			map=ConstantClass.mesSyncFromErp(modelService, wriDocNum, "admin", objectType, pMesId, xmlType, String.valueOf(itemId));
	    	

			
			isSuccess=String.valueOf(map.get("isSuccess"));
			
			if(isSuccess.equals("Y")){
			
			xml	= String.valueOf(map.get("xml"));
				
			returnStr = String.valueOf(map.get("returnStr"));
			
			if(String.valueOf(returnStr).equals("null")){
				
				
				addErrorDate(update, returnStr, xml, modelService,wriDocNum,xmlType);
				
				
			}
			String str="";
			try {
				str = returnStr.substring(returnStr.indexOf("<X_MSG_DATA>") + 12,
					returnStr.indexOf("</X_MSG_DATA>"));
			} catch (Exception e) {
				
				addErrorDate(update, returnStr, xml, modelService,wriDocNum,xmlType);
				
				
			}	
			
			boolean flag=ConstantClass.isXmlDocument(str);
			
				if(flag){
					poBaseMap=ConstantClass.parsingXml(str);  
		   		    
					editPutInDocStatus(modelService, update, wriDocNum , objectType, String.valueOf(wodItemId), "Y" , "E");
					
					list=new ArrayList<Map>();  
					
					list=(List<Map>) poBaseMap.get("list");
					
					Object batch;
					
					Object sourceLineId;
					
					Object sourceBatch;
					
					for (int z = 0; z < list.size(); z++) {
						
						batch=list.get(z).get("BATCH");
						
						if(batch==null){
							
							batch=list.get(z).get("LOT_NUMBER");
							
						}
						
						sourceLineId=list.get(z).get("SOURCE_LINE_ID");
						
						sourceBatch=list.get(z).get("SOURCE_BATCH");
						
						int a=editPutInDocStatusLine(modelService, update, wriDocNum, sourceBatch, sourceLineId, batch, objectType);
						
					}
					
					
				}else{
					
					if("OK".equals(String.valueOf(str))||"事务处理成功。OK".equals(String.valueOf(str))){
					
						editPutInDocStatus(modelService, update, wriDocNum , objectType, String.valueOf(wodItemId), "Y", "Y");
						
					}else{
						
						editPutInDocStatus(modelService, update, wriDocNum , objectType, String.valueOf(wodItemId), "N", "N");
						
					}
					
				}
	    		//新增日志信息
	    		addErrorDate(update, returnStr, xml, modelService,wriDocNum,xmlType);
	    		  		
	    		
			} else{
				
				addErrorDate(update, returnStr, xml, modelService,wriDocNum,xmlType);
			}
				}
		}
			
			
			
		
		}
		
		} catch (Exception e) {
			
			hbtran.commit();
			
			log.error(e);
			
			throw new BussException(e.toString());
			
			
		}
		hbtran.commit();
		
	}
		
	
	@SuppressWarnings("unchecked")
	int editPutInDocStatus(ModelService modelService,TableDataMapExt update,String wriDocNum,String type,String whereIn,String flag,String flag2){
		
		if(type.equals("OTHEREXITING")||type.equals("PURCHASERETURN")||type.equals("OUTSALE")||type.equals("OUTPRODUCTION")){
			
			update=new TableDataMapExt();
	
			update.setTableName("T_WMS_OUTSTOCK_DETAIL");
	
			update.setSqlWhere(" and WOD_ITEM_ID in ( "+whereIn+" ) ");
	
			update.getColMap().put("WOD_UPLOAD_FLAG", flag);
			
			update.getColMap().put("WOD_UPLOAD_TIME", DateUtil.getCurDate());
	
			modelService.edit(update);
			
			update=new TableDataMapExt();
			
			update.setTableName("T_WMS_OUTSTOCK_DOC");
	
			update.setSqlWhere(" and WOD_DOC_NUM='"+wriDocNum+"' ");
	
			update.getColMap().put("UPLOAD_FLAG", flag2);
			
			
			return modelService.edit(update);
			
			
			}else if(type.equals("CANCELOUT")){
			
                update=new TableDataMapExt();
				
				update.setTableName("T_WMS_RECEIVE_DETAIL");
				
				update.setSqlWhere(" and ID in ( "+whereIn+" ) ");
				
				update.getColMap().put("WRD_UPLOAD_FLAG", flag);
				
				update.getColMap().put("WRD_UPLOAD_TIME", DateUtil.getCurDate());
				
				modelService.edit(update);
				
                update=new TableDataMapExt();
				
				update.setTableName("T_WMS_RECEIVE_DOC");
		
				update.setSqlWhere(" and WRD_DOC_NUM='"+wriDocNum+"' ");
		
				update.getColMap().put("UPLOAD_FLAG", flag2);
				
				
				return modelService.edit(update);
						
//				update=new TableDataMapExt();
//				
//				update.setTableName("T_WMS_ALLOT_DOC");
//		
//				update.setSqlWhere(" and WAD_DOC_NUM='"+wriDocNum+"' ");
//		
//				update.getColMap().put("UPLOAD_FLAG", flag2);
//				
//				return modelService.edit(update);
			
			
				}else if(type.equals("ALLOT")){
					
					update=new TableDataMapExt();
					
					update.setTableName("T_WMS_ALLOT_DETAIL");
					
					update.setSqlWhere(" and ID in ( "+whereIn+" ) ");
					
					update.getColMap().put("WAD_UPLOAD_FLAG", flag);
					
					update.getColMap().put("WAD_UPLOAD_TIME", DateUtil.getCurDate());
					
					modelService.edit(update);
							
					update=new TableDataMapExt();
					
					update.setTableName("T_WMS_ALLOT_DOC");
			
					update.setSqlWhere(" and WAD_DOC_NUM='"+wriDocNum+"' ");
			
					update.getColMap().put("UPLOAD_FLAG", flag2);
					
					return modelService.edit(update);
				
				
					}else{
					
					update=new TableDataMapExt();
					
					update.setTableName("T_WMS_RECEIVE_DETAIL");
					
					update.setSqlWhere(" and WRD_ITEM_ID in ( "+whereIn+" ) ");
					
					update.getColMap().put("WRD_UPLOAD_FLAG", flag);
					
					update.getColMap().put("WRD_UPLOAD_TIME", DateUtil.getCurDate());
					
					modelService.edit(update);
							
					update=new TableDataMapExt();
					
					update.setTableName("T_WMS_RECEIVE_DOC");
			
					update.setSqlWhere(" and WRD_DOC_NUM='"+wriDocNum+"' ");
			
					update.getColMap().put("UPLOAD_FLAG", flag2);
			
					
					return modelService.edit(update);
				}
		
	}
	
	
	@SuppressWarnings("unchecked")
	int editPutInDocStatusLine(ModelService modelService,TableDataMapExt update,String wriDocNum
			,Object sourceBatch,Object sourceLineId,Object batch,String type){
		
		
		if(type.equals("OTHEREXITING")||type.equals("PURCHASERETURN")||type.equals("OUTSALE")||type.equals("OUTPRODUCTION")){
			
			update=new TableDataMapExt();
			
			update.setTableName("T_WMS_OUTSTOCK_DETAIL");
			
			update.setSqlWhere(" and WOD_DOC_NUM='"+wriDocNum+"' and P_MES_ID='"+sourceBatch+"' and "
					+ " WOD_LOT_NO='"+batch+"' and WOD_ITEM_ID='"+sourceLineId+"' ");
			
			update.getColMap().put("WOD_UPLOAD_FLAG", "N");
			
			modelService.edit(update);
			
			return modelService.edit(update);
			
			
			}else if(type.equals("ALLOT")){
			
				update=new TableDataMapExt();
				
				update.setTableName("T_WMS_ALLOT_DETAIL");
				
				update.setSqlWhere(" and WAD_DOC_NUM='"+wriDocNum+"' and P_MES_ID='"+sourceBatch+"' and "
						+ " WAD_LOT_NO='"+batch+"' and WAD_ITEM_ID='"+sourceLineId+"' ");
				
				update.getColMap().put("WAD_UPLOAD_FLAG", "N");
				
				modelService.edit(update);
				
				return modelService.edit(update);
			
			
				}else if(type.equals("CANCELOUT")){
					
					update=new TableDataMapExt();
					
					update.setTableName("T_WMS_RECEIVE_DETAIL");
					
					update.setSqlWhere(" and WRD_DOC_NUM='"+wriDocNum+"' and P_MES_ID='"+sourceBatch+"' and "
							+ " WRD_LOT_NO='"+batch+"' and WRD_ITEM_ID='"+sourceLineId+"' ");
					
					update.getColMap().put("WRD_UPLOAD_FLAG", "N");
					
					modelService.edit(update);
					
					return modelService.edit(update);
				
				
					}else{
					update=new TableDataMapExt();
		
					update.setTableName("T_WMS_RECEIVE_DETAIL");
		
					update.setSqlWhere(" and WRD_DOC_NUM='"+wriDocNum+"' and P_MES_ID='"+sourceBatch+"' and "
							+ " WRD_LOT_NO='"+batch+"' and WRD_ITEM_ID='"+sourceLineId+"' ");
		
					update.getColMap().put("WRD_UPLOAD_FLAG", "N");
		
					modelService.edit(update);
		
					return modelService.edit(update);
				}
	}
	
	//插入异常信息
	 @SuppressWarnings("unchecked")
		int addErrorDate(TableDataMapExt save,Object erpJson,Object mesJson,ModelService modelService,String wriDocNum,String type){
			 save=new TableDataMapExt();
			 save.setTableName("T_CO_ERPLOG");
			 save.getColMap().put("ID", StringUtils.getUUID());
			 save.getColMap().put("ERPJASON", erpJson);
			 save.getColMap().put("MESJASON", mesJson);
			 save.getColMap().put("OPERATEDATE", DateUtil.getCurDate());
			 save.getColMap().put("OBJECTNAME", type);
			 save.getColMap().put("MESNO", wriDocNum);
			return modelService.save(save);
		 }
		
	
	
	
}
