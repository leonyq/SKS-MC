package com.more.buss.xgglue.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 添加报废信息
 * @author cym
 * @date   2017-5-5下午1:54:13
 */
public class DiscardeXGService implements FuncService{
    
	@SuppressWarnings("unchecked")
	public String exeFunc(ModelAction modelAction, ModelService modelService) {

		String infoId=modelAction.getDataId();
		String sql="select info.id ID,info.cti_tin_sn CTS_TIN_SN,info.CTI_ITEM_TYPE CTI_ITEM_TYPE,"+
       "info.cti_item_code CTS_ITEM_CODE,"+
       "tool.assistanttoolname ASSISTANTTOOLNAME,"+
       "tool.assistanttoolspec ASSISTANTTOOLSPEC,"+
       "supplier.supplier_name SUPPLIER_NAME,"+
       "info.cti_lot CTS_LOT,"+
       "info.cti_supplier_code CTS_SUPPLIER_CODE"+
  " from T_CO_TIN_INFO info, T_CO_ASSISTANTTOOL tool, T_CO_SUPPLIER supplier"+
 " where tool.ASSISTANTTOOLNO = info.cti_item_code"+
  " and supplier.supplier_code = info.cti_supplier_code"+
 " and info.id=?";
		//查询报废表，是否存在这条信息
	  String sql2="select CTS_SCARP_TYPE,CTS_SCARP_REASON from T_CO_TIN_SCARP_INFO where ID=?";
      List<String> disCarde=modelService.listDataSql(sql,new Object[]{infoId});
      List<String> disList=modelService.listDataSql(sql2,new Object[]{infoId});
      Map<String, String> dataMap=new HashMap<String, String>();
      if(disList!=null && !disList.isEmpty()){
    	     Map<String,String> dis_count=modelService.queryForMap(sql2,new Object[]{infoId});
    	     String CTS_SCARP_TYPE=dis_count.get("CTS_SCARP_TYPE");
    	     String CTS_SCARP_REASON=dis_count.get("CTS_SCARP_REASON");
    	     if(dis_count.size()!=0){//存在信息
    	    	  dataMap.put("CTS_SCARP_TYPE",CTS_SCARP_TYPE);
    	    	  dataMap.put("CTS_SCARP_REASON",CTS_SCARP_REASON);
    	    	  dataMap.put("noCount","1");
    	     }
      }else{//报废表不存在这条信息
    	  dataMap.put("noCount","0");  
     }
      modelAction.setDataMap(dataMap);
	  modelAction.setDataList(disCarde);
		return null;
	  
	}

}
