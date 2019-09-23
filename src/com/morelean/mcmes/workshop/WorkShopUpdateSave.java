package com.morelean.mcmes.workshop;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 车间信息修改保存
 * @author Administrator
 *
 */
public class WorkShopUpdateSave implements FuncService{
	private final Log log = LogFactory.getLog(this.getClass());
	 public String exeFunc(ModelAction modelAction, ModelService modelService) {
	    	HttpServletRequest request = modelAction.getRequest();
	    	String wId=modelAction.getDataId();
	    	String CA_TYPE= request.getParameter("paraMapObj.CA_TYPE").trim();
	    	String CA_PARENTAREAID= request.getParameter("paraMapObj.CA_PARENTAREAID").trim();
	    	String CA_ID= request.getParameter("paraMapObj.CA_ID").trim();
	    	String CA_NAME= request.getParameter("paraMapObj.CA_NAME").trim();
	    	String CA_EMP_ROLE= request.getParameter("paraMapObj.CA_EMP_ROLE").trim();
	    	String CA_GROUP= request.getParameter("paraMapObj.CA_GROUP").trim();
	    	String CA_STATUS= request.getParameter("paraMapObj.CA_STATUS");
	    	
	    	//负责人关联信息表的值(新增)
	    	String[] groups= request.getParameterValues("group_o");
	    	String[] chargeEmps= request.getParameterValues("chargeEmp_o");
	    	String []chargeTechs= request.getParameterValues("chargeTech_o");
	    	String[] chargeDevices= request.getParameterValues("chargeDevice_o");
	    	String[] chargeQualitys= request.getParameterValues("chargeQuality_o");
	    	//修改的值
	    	String[]cIds=request.getParameterValues("chargeId_n");
	    	String[] groups1= request.getParameterValues("group_n");
	    	String[] chargeEms1= request.getParameterValues("chargeEmp_n");
	    	String []chargeTechs1= request.getParameterValues("chargeTech_n");
	    	String[] chargeDevices1= request.getParameterValues("chargeDevice_n");
	    	String[] chargeQualitys1= request.getParameterValues("chargeQuality_n");
	    	//设备信息关联表中的框的值(新增)
	    	String[] deviceSeqs1= request.getParameterValues("deviceSeq_n");
	    	String[] deviceNames1= request.getParameterValues("deviceName_n");
	    	//车间信息修改
	    	TableDataMapExt workShop = new TableDataMapExt();
	    	workShop.setTableName("T_CO_AREA");
	    	workShop.setSqlWhere(" and ID='" + wId + "'");
	    	workShop.getColMap().put("CA_TYPE", CA_TYPE);
	    	workShop.getColMap().put("CA_PARENTAREAID", CA_PARENTAREAID);
	    	workShop.getColMap().put("CA_ID", CA_ID);
	    	workShop.getColMap().put("CA_NAME", CA_NAME);
	    	workShop.getColMap().put("CA_EMP_ROLE", CA_EMP_ROLE);
	    	workShop.getColMap().put("CA_GROUP", CA_GROUP);
	    	workShop.getColMap().put("CA_STATUS", CA_STATUS);
	    	modelService.edit(workShop);
	    	//设备关联信息新增
	    	if(deviceSeqs1!=null){
		    	TableDataMapExt sbTable = new TableDataMapExt();
		    	CommMethod.addSysDefCol(sbTable.getColMap(), modelAction.getUser());
		    	Map sbMap=sbTable.getColMap();
		    	for(int i=0;i<deviceSeqs1.length;i++){
		    		sbMap.put("CAD_DEVICE_SEQUENCE", deviceSeqs1[i]);
		    		sbMap.put("CA_ID", CA_ID);
		    		sbMap.put("CAD_DEVICE_ID", deviceNames1[i]);
		    		sbMap.put("ID",StringUtils.getUUID());
		    		sbTable.setTableName("T_CO_AREA_DEVICE");
		    		int res1 = modelService.save(sbTable);
		    		if (res1 < 1)
		    		{
		    			return modelAction.alertParentInfo(modelAction.getText("修改失败") );
		    		}
		    	}
		    	}
	    	//负责人关联信息新增
	    	if(groups!=null){
		    	TableDataMapExt fzTable = new TableDataMapExt();
		    	CommMethod.addSysDefCol(fzTable.getColMap(), modelAction.getUser());
		    	Map fzMap=fzTable.getColMap();
		    	for(int i=0;i<groups.length;i++){
		    		fzMap.put("CAC_GROUP", groups[i]);
		    		fzMap.put("CA_ID", CA_ID);
		    		fzMap.put("CAC_CHARGE_EMP",chargeEmps[i]);
		    		fzMap.put("CAC_CHARGE_TECH",chargeTechs[i]);
		    		fzMap.put("CAC_CHARGE_DEVICE",chargeDevices[i]);
		    		fzMap.put("CAC_CHARGE_QUALITY",chargeQualitys[i]);
		    		
		    		fzMap.put("ID",StringUtils.getUUID());
		    		fzTable.setTableName("T_CO_AREA_CHARGE");
		    		int res2 = modelService.save(fzTable);
		    		if (res2 < 1)
		    		{
		    			return modelAction.alertParentInfo(modelAction.getText("修改失败"));
		    		} 
		    	}
		    	}
	    	//负责人信息关联修改
	    	if(cIds!=null){
	    	TableDataMapExt charge = new TableDataMapExt();
	    	for(int i=0;i<cIds.length;i++){
	    	charge.setTableName("T_CO_AREA_CHARGE");
	    	charge.setSqlWhere(" and ID='" + cIds[i] + "'");
	    	charge.getColMap().put("CAC_GROUP", groups1[i]);
	    	charge.getColMap().put("CAC_CHARGE_EMP", chargeEms1[i]);
	    	charge.getColMap().put("CAC_CHARGE_TECH", chargeTechs1[i]);
	    	charge.getColMap().put("CAC_CHARGE_DEVICE", chargeDevices1[i]);
	    	charge.getColMap().put("CAC_CHARGE_QUALITY", chargeQualitys1[i]);
	    	modelService.edit(charge);
	    	}
	    	}
	    	return modelAction.alertParentInfo(modelAction.getText("修改成功") );
	    	
	    	
	    	
		   
	    	
	    	
}
}
