package com.more.mes.smt.materielonline;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 在线料表 修改保存
 * @author development
 *
 */
public class EditSaveMaterialOnline implements FuncService {
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
        String formId = request.getParameter("formId");
    	if(StringUtils.isBlank(formId)){
      		formId = request.getParameter("formIds");
   		 }
    	String iframeId = request.getParameter("iframeId");   
    	try {
    		//获取相关信息
    		String id = request.getParameter("dataId");
    		String areaSn = request.getParameter("areaId");
    		String itemCode = request.getParameter("paraMapObj.CMO_ITEM_CODE");
    		String deviceSeq = request.getParameter("paraMapObj.CMO_DEVICE_SEQ");
    		String tableNo = request.getParameter("paraMapObj.CMO_TABLE_NO");
    		String loadPoint = request.getParameter("paraMapObj.CMO_LOADPOINT");
    		String chanelSn = request.getParameter("paraMapObj.CMO_CHANEL_SN");
    		String pointLocation = request.getParameter("paraMapObj.CMO_POINT_LOCATION");
    		String pointNum = request.getParameter("paraMapObj.CMO_POINT_NUM");
    		String tryFlag = request.getParameter("paraMapObj.CMO_TRY_FLAG");
    	  String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    		String track = request.getParameter("paraMapObj.CMO_TRACK");
    		
    		
    		 String queryItemSql1 = "SELECT T.PDO_DEVICE_SN\r\n" + 
           "FROM T_PM_DEVICE_ONLINE T \r\n" + 
           "INNER JOIN T_CO_DEVICE_LOADPOINT A ON T.PDO_DEVICE_SN=A.CD_DEVICE_SN\r\n" + 
           "AND T.DATA_AUTH=A.DATA_AUTH\r\n" + 
           "WHERE T.PDO_AREA_SN=?\r\n" + 
           "AND T.PDO_DEVICE_SEQ=? AND A.CDL_TABLE=?  AND T.DATA_AUTH=?";
         List<Map> itemList1 = modelService.listDataSql(queryItemSql1, new Object[] { areaSn,deviceSeq,tableNo,dataAuth });
         if(itemList1==null||itemList1.size()==0){
           return modelAction.alertParentInfo(modelAction.getText("该线别以及设备序号下的TABLE不存在"));
         }
         else
         {
            queryItemSql1 = "SELECT T.PDO_DEVICE_SN,T.PDO_TRACK \r\n" + 
              "FROM T_PM_DEVICE_ONLINE T \r\n" + 
              "INNER JOIN T_CO_DEVICE_LOADPOINT A ON T.PDO_DEVICE_SN=A.CD_DEVICE_SN\r\n" + 
              "AND T.DATA_AUTH=A.DATA_AUTH\r\n" + 
              "WHERE T.PDO_AREA_SN=?\r\n" + 
              "AND T.PDO_DEVICE_SEQ=? AND A.CDL_TABLE=? AND A.CDL_LOADPOINT=? AND T.DATA_AUTH=?";
           itemList1 = modelService.listDataSql(queryItemSql1, new Object[] { areaSn,deviceSeq,tableNo,loadPoint,dataAuth });
           if(itemList1==null||itemList1.size()==0){
             return modelAction.alertParentInfo(modelAction.getText("该线别以及设备序号以及TABLE下的料站不存在"));
           }
         }
    		
    		
    		if(tryFlag == null){
    			tryFlag = "N";
    		}
    		String shkipFlag = request.getParameter("paraMapObj.CMO_SHKIP_FLAG");  		
    		String querySql = "select t.cmo_device_seq,t.cmo_table_no,t.cmo_loadpoint,t.cmo_chanel_sn from T_CO_MATERIAL_ONLINE t "
    		  + "where t.id != ? and t.CMO_AREA_SN = ? AND T.DATA_AUTH=? ";
    		List<Map> sList = modelService.listDataSql(querySql, new Object[] { id,areaSn,dataAuth });
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
    		if(shkipFlag == null){
    			shkipFlag = "N";
    		}
    		//验证通过则修改数据
    		List<Object> sqlList = new ArrayList<Object>();
    		sqlList.add(id);
    		TableDataMapExt device = new TableDataMapExt();
    		CommMethod.addSysDefCol(device.getColMap(), modelAction.getUser());
    		device.setTableName("T_CO_MATERIAL_ONLINE");
    		device.setSqlWhere(" and ID=? ");
    		device.setSqlWhereArgs(sqlList);
    		device.getColMap().put("CMO_ITEM_CODE", itemCode);
    		device.getColMap().put("CMO_DEVICE_SEQ", deviceSeq);
    		device.getColMap().put("CMO_TABLE_NO", tableNo);
    		device.getColMap().put("CMO_LOADPOINT", loadPoint);
    		device.getColMap().put("CMO_CHANEL_SN", chanelSn);
    		device.getColMap().put("CMO_POINT_LOCATION", pointLocation);
    		device.getColMap().put("CMO_POINT_NUM", Integer.valueOf(pointNum));
    		device.getColMap().put("CMO_TRY_FLAG", tryFlag);
    		device.getColMap().put("CMO_SHKIP_FLAG", shkipFlag);
    		device.getColMap().put("CMO_TRACK", track);
    		if(dataAuth!=null && !dataAuth.equals("")){
    			device.getColMap().put("DATA_AUTH", dataAuth);
    		}
    		modelService.edit(device);
    		if(shkipFlag != null){
    			//根据线别、设备序号获取设备信息
    			String sql = "SELECT t.pdo_device_sn,t.pdo_type FROM T_PM_DEVICE_ONLINE t "
    			  + "WHERE t.pdo_area_sn=? AND t.pdo_device_seq=? AND T.DATA_AUTH=? ";
    			List<Map> pList = modelService.listDataSql(sql, new Object[] { areaSn,deviceSeq,dataAuth });
    			if(pList!=null&&pList.size()>0){
	    			String deviceId = (String) pList.get(0).get("PDO_DEVICE_SN");
	    			//获取设备的生产状态(1:上线,2:转产,3:就绪)
	    			String productStatus = (String) pList.get(0).get("PDO_TYPE");
	    			if(productStatus.equals("3")){//当前设备  为 3-就绪 时，在修改时，判断，设备下是否还有 未上料的，如有则修改为2--转产
	    				String checkSql = "SELECT t.cmo_device_seq FROM T_CO_MATERIAL_ONLINE t " +
	    						"WHERE t.cmo_area_sn=? AND t.cmo_device_seq=? AND t.cmo_load_flag='Y' AND T.DATA_AUTH=? ";
	    				List count = modelService.listDataSql(checkSql, new Object[] { areaSn,deviceSeq,dataAuth });
	    				if(count.size() != 0){
	    					String upSql = "update T_PM_DEVICE_ONLINE set PDO_TYPE='2' where PDO_DEVICE_SN=? AND DATA_AUTH=? ";
	    					modelService.execSql(upSql,new Object[]{deviceId,dataAuth});
	    				}
	    			}else{//当前设备  不为3-就绪时，在修改时判断 设备下是否还有 未上料的，如无，则修改为  3--就绪
	    				String checkSql = "SELECT t.cmo_device_seq FROM T_CO_MATERIAL_ONLINE t " +
	    						"WHERE t.cmo_area_sn=? AND t.cmo_device_seq=? AND t.cmo_load_flag='N' "
	    						+ "AND t.CMO_SHKIP_FLAG!='Y' AND T.DATA_AUTH=? ";
	    				List count = modelService.listDataSql(checkSql, new Object[] { areaSn,deviceSeq,dataAuth });
	    				if(count.size() == 0){
	    					String upSql = "update T_PM_DEVICE_ONLINE set PDO_TYPE='3' where PDO_DEVICE_SN=? AND DATA_AUTH=? ";
	    					modelService.execSql(upSql,new Object[]{deviceId,dataAuth});
	    				}
	    			}
    			}
    		}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"), e);
		}
    	return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"),"0");	
	}

}
