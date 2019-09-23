package com.more.buss.xgglue.service.base;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.method.CommMethod;

/**
 * 展示详情
 * @author development
 *
 */
public class DiscardInfoService implements FuncService{
	private final Log log = LogFactory.getLog(this.getClass());
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		 
		Map<String,Object> map=new HashMap<String,Object> ();
		Map<String, String> dataMap=new HashMap<String, String>();
	    String curUser=CommMethod.getSessionUser().getName();
		String scarpTime=DateUtil.formatDate(DateUtil.getCurDate(),"yyyy-MM-dd HH:mm:ss");
		String tinSn=modelAction.getDataId();
		String dataauth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		String isSql="select info.id TINID from T_CO_TIN_INFO info where info.CTI_TIN_SN=? AND info.DATA_AUTH=? ";//查看tin_sn是否存在，辅料信息表
		String tinSnSql="select info.id ID,info.CTI_ITEM_CODE CTI_ITEM_CODE,tool.assistanttoolname ASSISTANTTOOLNAME," +
				"tool.assistanttoolspec ASSISTANTTOOLSPEC,supplier.supplier_name SUPPLIERNAME," +
				"supplier.supplier_code SUPPLIERCODE,tool.ASSISTANTTOOLTYPE ASSISTANTTOOLTYPE," +
				"info.CTI_LOT CTI_LOT "+
  " from T_CO_TIN_INFO info, T_CO_ASSISTANTTOOL tool,T_CO_SUPPLIER supplier"+
 " where tool.assistanttoolno = info.cti_item_code"+
 " and supplier.supplier_code=info.cti_supplier_code"+
 " and info.CTI_TIN_SN=? AND info.DATA_AUTH=? ";
		@SuppressWarnings("unchecked")
		List<Map<String,String>> isList=modelService.listDataSql(isSql, new Object[]{tinSn,dataauth});
		if(isList!=null && !isList.isEmpty()){ 
			String tinId=isList.get(0).get("TINID");
			String scarpSql="select CTS_SCARP_TYPE,CTS_SCARP_REASON from T_CO_TIN_SCARP_INFO  where ID=? AND DATA_AUTH=? ";//查看报废报废表中是否存在这条数据
			@SuppressWarnings("unchecked")
			List<Map<String, String>> scarplList=modelService.listDataSql(scarpSql, new Object[]{tinId,dataauth});
		  	if(!scarplList.isEmpty()){
		  		map.put("scarplList", scarplList);
		  		 
		  	}
			try{
			List resultList=modelService.listDataSql(tinSnSql, new Object[]{tinSn,dataauth});
		  	dataMap.put("curUser", curUser);
		  	dataMap.put("scarpTime", scarpTime);
		 // 	modelAction.setAjaxList(resultList);
		  	resultList.add(dataMap);
			map.put("snList", resultList);
			CommMethod.mapToEscapeJs(map);
			modelAction.setAjaxMap(map);
		  	}catch(Exception e){
				log.error(e);
				throw new BussException(modelAction.getText("增加失败"),e);
			}
			
		}else{
			map.put("scarplList", "");
			map.put("snList", "");
			CommMethod.mapToEscapeJs(map);
			modelAction.setAjaxMap(map);
			//modelAction.setAjaxString(modelAction.getText("辅料SN不存在,请更换"));
			//return modelAction.reloadParent(modelAction.getText("辅料SN不存在,请更换"));	
			
		}
		return BaseActionSupport.AJAX;
		
	}

}
