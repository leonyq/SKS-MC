package com.more.buss.device.service.oracle;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.ibm.pkcs11.nat.e;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存关联的设备
 * @author Administrator
 *
 */
public class SaveConnDevicePlanInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    //String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
	    String formId = request.getParameter("formId");
	    if (StringUtils.isBlank(formId))
	    {
	      formId = request.getParameter("formIds");
	    }
	    String iframeId = request.getParameter("iframeId");
	    try {
			//获取相关信息
	      List list = new ArrayList();
	    	String allPlanSn = request.getParameter("paraMap1@0#CDP_PLAN_SN");  //总的设备计划代码
	    	String allDeviceSn = request.getParameter("paraMap1@0#CDPI_DEVICE_SN"); //总的设备sn
	    	if(allDeviceSn.equals("")){   //如果没有选择设备sn则取当前区域下所有的设备
	    		String areaId = request.getParameter("areaId");  //线别或车间
	    		TableDataMapExt device = new TableDataMapExt();
	    		device.setTableName("T_CO_DEVICE");//设备信息表
	    		CommMethod.editSysDefCol(device.getColMap(), modelAction.getUser());
	    		String sql = "select * from T_CO_AREA t start with t.ca_id=? and t.data_auth=?  " +
	    				" connect by prior t.ca_id = t.ca_parentareaid ";  //取出该区域及底下的区域
	    	/*	String sql= "  WITH RECURSIVE Ta  AS ( "+
            "  SELECT * "+
            "  FROM t_co_area "+
            "  WHERE ca_id =? "   +
            "  UNION ALL "+
            "  SELECT  d.* "+
            "  FROM t_co_area D "+
            "  JOIN Ta ON  D.CA_PARENTAREAID=Ta.ca_id "  +
            "  ) "+
            "  SELECT ca_id FROM Ta ";*/
	    		List<Map> sList = modelService.listDataSql(sql, new Object[] { areaId,dataAuth });
	    		String caId = null;
	    		List<Map> pList = null;
	    		//根据区域获取设备
	    		String querySql = "SELECT t.CD_DEVICE_SN FROM T_CO_DEVICE t "+
	    					"left join T_CO_AREA_DEVICE a on a.cad_device_id = t.id and a.data_auth=? " +
	    				    "WHERE a.ca_id = ? and t.data_auth = ? ";		
	    		
	    		if(sList!=null&&sList.size()>0){
	    			for(int i=0;i<sList.size();i++){
	    				caId = (String) sList.get(i).get("CA_ID");
	    				pList = modelService.listDataSql(querySql, new Object[] { dataAuth,caId,dataAuth });
	    				if(pList!=null&&pList.size()>0){
	    					for(int j=0;j<pList.size();j++){
	    						device.setSqlWhere(" and CD_DEVICE_SN=? and DATA_AUTH=? ");
	    						list.clear();
	    						list.add(pList.get(j).get("CD_DEVICE_SN"));
	    						list.add(dataAuth);
	    						device.setSqlWhereArgs(list);
	    						device.getColMap().put("CDP_PLAN_SN", allPlanSn);
	    						modelService.edit(device);
	    					}
	    				}
	    			}
	    		}
	    	}else{   //如果选择了设备sn
	    		TableDataMapExt device = new TableDataMapExt();
	    		device.setTableName("T_CO_DEVICE");//设备信息表
	    		CommMethod.editSysDefCol(device.getColMap(), modelAction.getUser());
	    		list.clear();
	    		list.add(allDeviceSn);
	    		list.add(dataAuth);
	    		device.setSqlWhere(" and CD_DEVICE_SN=? and DATA_AUTH=? ");
	    		device.setSqlWhereArgs(list);
				device.getColMap().put("CDP_PLAN_SN", allPlanSn);
				modelService.edit(device);
	    	}
	    	String trCount = request.getParameter("trCount");  //获取数量
	    	int num = Integer.parseInt(trCount);
	    	if(num!=0){
	    		String deviceSn = null;  //设备sn
	    		String itemCode = null;  //保养项目
	    		String areaSn = null;  //所属区域
	    		String planSn = null;  //计划代码


	    		for(int i=1;i<=num;i++){
	    			deviceSn = request.getParameter("deviceSn_"+i);
	    			itemCode = request.getParameter("itemCode_"+i);
	    			areaSn = request.getParameter("area_"+i);
	    			planSn = request.getParameter("paraMap"+i+"@4#PLAN_CODE");
	    			//判断是否已存在
	    			String sql = "select t.* from T_CO_DEVICE_PLAN_CONNECT t " +
	    					"WHERE t.CDPI_DEVICE_SN = ? AND t.cdpi_item_code = ? AND t.data_auth = ?  ";
	    			List<Map> sList = modelService.listDataSql(sql, new Object[] { deviceSn,itemCode,dataAuth });
	    			if(sList!=null&&sList.size()>0){  //如果存在则修改数据
	    				String editId = null;
	    				for(int j=0;j<sList.size();j++){
	    			        TableDataMapExt connDevice1 = new TableDataMapExt();
	    			        connDevice1.setTableName("T_CO_DEVICE_PLAN_CONNECT");//设备关联保养计划信息表
	    			        CommMethod.editSysDefCol(connDevice1.getColMap(), modelAction.getUser());	    					
	    					editId = (String) sList.get(j).get("ID");
	    					connDevice1.setSqlWhere(" and ID=?");
	    					list.clear();
	    					list.add(editId);
	    					connDevice1.setSqlWhereArgs(list);
	    					connDevice1.getColMap().put("CDPI_AREA_SN", areaSn);
	    	    			connDevice1.getColMap().put("CDP_PLAN_SN", planSn);
	    	    			
	    	    		  int res =	modelService.edit(connDevice1);
	    				}
	    			}else{
	    	    		TableDataMapExt connDevice = new TableDataMapExt();
	    		        connDevice.setTableName("T_CO_DEVICE_PLAN_CONNECT");//设备关联保养计划信息表
	    		        CommMethod.addSysDefCol(connDevice.getColMap(), modelAction.getUser());	    				
		    			connDevice.getColMap().put("CDPI_DEVICE_SN", deviceSn);
		    			connDevice.getColMap().put("CDPI_ITEM_CODE", itemCode);
		    			connDevice.getColMap().put("CDPI_AREA_SN", areaSn);
		    			connDevice.getColMap().put("CDP_PLAN_SN", planSn);

		    			
			    		int res = modelService.save(connDevice);
	    			}
	    		}
	    	}
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("新增失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), "0");
	}

}
