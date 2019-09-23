
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
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;


	/**
	 * 
	 * 生产退料回写(定时器)
	 * 
	 */
	

public class SCTLSyncMesFromErp implements IJobx{

	private final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");
    private MsHTranMan hbtran = BussService.getHbTran();
	
	
	@Override
	public void exec(Args arg0) {
		
		String docType = "DJ03";
		
		String objectType=ConstantClass.INPRODUCTION;
		
		String xmlType=ConstantClass.CUX_MES_IPI;
		
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
		
		List<Map> listXml = ConstantClass.getDocList(modelService, type, docType);
		 
		if(listXml.size()==0){
			
			throw new BussException("无回传数据");
			
		}
		
		for (int i = 0; i < listXml.size(); i++) {
			
			pMesId = StringUtils.getUUID();
			
			docNum = listXml.get(i).get("DOC_NUM");
			
			wriDocNum = String.valueOf(docNum);
			
			//先获取回传信息主键
			Map<Object,Object> returnMap=ConstantClass.getDetailIdMap(update, modelService, pMesId, objectType, String.valueOf(docNum));
			
			Object whereIn=returnMap.get("whereIn");
			
			if(whereIn.equals("")){
				
				continue;
				
			}
			
			map=ConstantClass.mesSyncFromErp(modelService, String.valueOf(docNum), "admin", objectType, pMesId, xmlType, String.valueOf(whereIn));
			
			isSuccess=String.valueOf(map.get("isSuccess"));
			
			if(isSuccess.equals("Y")){
			
			xml	= String.valueOf(map.get("xml"));
				
			returnStr = String.valueOf(map.get("returnStr"));
			
			if(String.valueOf(returnStr).equals("null")){
				
				
				ConstantClass.addErrorDate(update, returnStr, xml, modelService,String.valueOf(docNum),xmlType);
				continue;
				
			}
			String str="";
			try {
				str = returnStr.substring(returnStr.indexOf("<X_MSG_DATA>") + 12,
					returnStr.indexOf("</X_MSG_DATA>"));
			} catch (Exception e) {
				ConstantClass.addErrorDate(update, returnStr, xml, modelService,String.valueOf(docNum),xmlType);
				continue;
			}	
			
			boolean flag=ConstantClass.isXmlDocument(str);
			
			if(flag){
				
				poBaseMap=ConstantClass.parsingXml(str);  
	   		    
				ConstantClass.editPutInDocStatus(modelService, update, wriDocNum , objectType, String.valueOf(whereIn), "Y" , "E");
				
				list=new ArrayList<Map>();  
				
				list=(List<Map>) poBaseMap.get("list");
				
				Object batch;
				
				Object sourceLineId;
				
				Object sourceBatch;
				
				Object subinventoryCode;
				
				for (int z = 0; z < list.size(); z++) {
					
					subinventoryCode=list.get(z).get("SUBINVENTORY_CODE");
					
					batch=list.get(z).get("BATCH");
					
					if(batch==null){
						
					batch=list.get(z).get("LOT_NUMBER");
						
					}
					
					sourceLineId=list.get(z).get("SOURCE_LINE_ID");
					
					sourceBatch=list.get(z).get("SOURCE_BATCH");
					
					ConstantClass.editPutInDocStatusLine(modelService, update, wriDocNum, sourceBatch, sourceLineId, batch, objectType ,subinventoryCode);
					
				}
				
				
			}else{
				
				if("OK".equals(String.valueOf(str))||"事务处理成功。OK".equals(String.valueOf(str))){
				
					ConstantClass.editPutInDocStatus(modelService, update, wriDocNum , objectType, String.valueOf(whereIn), "Y", "Y");
					
				}else{
					
					
					ConstantClass.editPutInDocStatus(modelService, update, wriDocNum , objectType, String.valueOf(whereIn), "N", "N");
					
				}
				
			}
    		//新增日志信息
			ConstantClass.addErrorDate(update, returnStr, xml, modelService,wriDocNum,xmlType);
			
		}
		
		}
		
		} catch (Exception e) {
			
			hbtran.commit();
			
			log.error(e);
			
			throw new BussException(e.toString());
			
			
		}
		hbtran.commit();
		
	}
		
	
		
		
	
	
	
}
