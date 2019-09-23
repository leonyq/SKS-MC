package com.more.mes.smt.materielonline.pg;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class AddMaterialOnline implements FuncService {
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
        String isCloseWin = request.getParameter("isCloseWin");//是否关闭窗口
        String formId = request.getParameter("formId");
    	if(StringUtils.isBlank(formId)){
      		formId = request.getParameter("formIds");
   		 }
    	String iframeId = request.getParameter("iframeId");   
    	try {
    		//获取相关信息
    		String areaSn = request.getParameter("paraMap1@0#CMO_AREA_SN");
    		String itemCode = request.getParameter("paraMap1@0#CMO_ITEM_CODE");
    		String deviceSeq = request.getParameter("paraMap1@0#CMO_DEVICE_SEQ");
    		String tableNo = request.getParameter("paraMap1@0#CMO_TABLE_NO");
    		String loadPoint = request.getParameter("paraMap1@0#CMO_LOADPOINT");
    		String chanelSn = request.getParameter("paraMap1@0#CMO_CHANEL_SN");
    		String pointLocation = request.getParameter("paraMap1@0#CMO_POINT_LOCATION");
    		String pointNum = request.getParameter("paraMap1@0#CMO_POINT_NUM");
    		String tryFlag = request.getParameter("paraMap1@0#CMO_TRY_FLAG");
    	  String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    		if(tryFlag == null){
    			tryFlag = "N";
    		}
    		String shkipFlag = request.getParameter("paraMap1@0#CMO_SHKIP_FLAG");
    		if(shkipFlag == null){
    			shkipFlag = "N";
    		}
    		String querySql = "select t.cmo_device_seq,t.cmo_table_no,t.cmo_loadpoint,t.cmo_chanel_sn from T_CO_MATERIAL_ONLINE t "
    		  + "where t.CMO_AREA_SN = ? AND T.DATA_AUTH=? ";
    		List<Map> sList = modelService.listDataSql(querySql, new Object[] { areaSn,dataAuth });
    		String cmoDeviceSeq = null;
    		String cmoTableNo = null;
    		String cmoLoadpoint = null;
    		String cmoChanelSn = null;
    		for(int i=0;i<sList.size();i++){
    			cmoDeviceSeq = (String) sList.get(i).get("CMO_DEVICE_SEQ");
    			cmoTableNo = (String) sList.get(i).get("CMO_TABLE_NO");
    			cmoLoadpoint = (String) sList.get(i).get("CMO_LOADPOINT");
    			cmoChanelSn = (String) sList.get(i).get("CMO_CHANEL_SN");
    			if(deviceSeq.equals(cmoDeviceSeq) && tableNo.equals(cmoTableNo)
    					&& loadPoint.equals(cmoLoadpoint) && chanelSn.equals(cmoChanelSn)){
    				return modelAction.alertParentInfo(modelAction.getText("设备序号和Table和料站和通道不能同时相同"));
    			}
    		}
    		//根据线别以及设备序号获取对应的制令单等信息
    		String queryItemSql = "SELECT pdo_number, pdo_project_id, pdo_model_code, pdo_process_face " +
    				"FROM t_pm_device_online t " +
    				"WHERE t.pdo_area_sn = ? AND t.pdo_device_seq = ? AND T.DATA_AUTH=? LIMIT 1 ";
    		List<Map> itemList = modelService.listDataSql(queryItemSql, new Object[] { areaSn,deviceSeq,dataAuth });
    		if(itemList.size()==0){
    			return modelAction.alertParentInfo(modelAction.getText("该线别以及设备序号下的制令单不存在"));
    		}
    		String pdoNumber = null;        //制令单号
    		String pdoProjectId = null;	//工单号
    		String pdoModelCode = null;	//机种
    		String pdoProcessFace = null; //加工面别
    		for(int i=0;i<itemList.size();i++){
    			pdoNumber = (String) itemList.get(i).get("PDO_NUMBER");
    			pdoProjectId = (String) itemList.get(i).get("PDO_PROJECT_ID");
    			pdoModelCode = (String) itemList.get(i).get("PDO_MODEL_CODE");
    			pdoProcessFace = (String) itemList.get(i).get("PDO_PROCESS_FACE");
    		}
    		//获取料站主表编码
    		String querySnSql = "select cm_sn from T_CO_MATERIAL_ONLINE t " +
    							"where t.cmo_mo_number = ? and t.cmo_process_face = ? " +
    							"and t.cmo_area_sn = ? and t.cmo_device_seq = ? AND T.DATA_AUTH=? " +
    							"LIMIT 1";
    		String cm_sn = "";        //料站主表编码
    		List<Map> map = modelService.listDataSql(querySnSql, new Object[] { pdoNumber,pdoProcessFace,areaSn,deviceSeq,dataAuth });
    		if(map.size()==0){
    			return modelAction.alertParentInfo(modelAction.getText("料站主表编码获取错误"));
    		}
    		for(int i=0;i<map.size();i++){
    			cm_sn = (String) map.get(i).get("CM_SN");
    		}
    		//验证通过则插入数据
    		String id = StringUtils.getUUID();
    		String cmdId = StringUtils.getUUID();
    		TableDataMapExt device = new TableDataMapExt();
    		CommMethod.addSysDefCol(device.getColMap(), modelAction.getUser());
    		device.setTableName("T_CO_MATERIAL_ONLINE");
    		device.getColMap().put("ID", id);
    		device.getColMap().put("CMD_ID", cmdId);
    		device.getColMap().put("CM_SN", cm_sn);
    		device.getColMap().put("CMO_AREA_SN", areaSn);
    		device.getColMap().put("CMO_ITEM_CODE", itemCode);
    		device.getColMap().put("CMO_DEVICE_SEQ", deviceSeq);
    		device.getColMap().put("CMO_TABLE_NO", tableNo);
    		device.getColMap().put("CMO_LOADPOINT", loadPoint);
    		device.getColMap().put("CMO_CHANEL_SN", chanelSn);
    		device.getColMap().put("CMO_POINT_LOCATION", pointLocation);
    		device.getColMap().put("CMO_POINT_NUM", Integer.valueOf(pointNum));
    		device.getColMap().put("CMO_TRY_FLAG", tryFlag);
    		device.getColMap().put("CMO_SHKIP_FLAG", shkipFlag);
    		device.getColMap().put("CMO_LOAD_FLAG", "N");
    		device.getColMap().put("CMO_MO_NUMBER", pdoNumber);
    		device.getColMap().put("CMO_PROJECT_ID", pdoProjectId);
    		device.getColMap().put("CMO_MODEL_CODE", pdoModelCode);
    		device.getColMap().put("CMO_PROCESS_FACE", pdoProcessFace);
    		if(dataAuth!=null && !dataAuth.equals("")){
    			device.getColMap().put("DATA_AUTH", dataAuth);
    		}   		
    		modelService.save(device);
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("新增失败"), e);
		}
    	 return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"),isCloseWin);
	}

}
