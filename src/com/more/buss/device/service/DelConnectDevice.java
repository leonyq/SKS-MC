package com.more.buss.device.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.ibm.sslite.s;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import examples.newsgroups;

/**
 * 解除关联的设备
 * @author development
 *
 */
public class DelConnectDevice implements FuncService {
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		try {
			String delId = request.getParameter("delId");//需要解除关联的id
			String flag = request.getParameter("flag");//单个解除还是多个解除
			String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
			
			if (StringUtils.isBlank(delId)) {
				return modelAction.alertParentInfo(modelAction.getText("ID为空"));
			}
			String[] strArray = delId.split(",");
			List list = new ArrayList();
			if(flag.equals("0")){//单个解除
			 
				TableDataMapExt planDetail = new TableDataMapExt();
	    		planDetail.setTableName("T_CO_DEVICE_PLAN_CONNECT");//设备关联保养计划信息表
				for(int i=1;i<strArray.length;i++){
				  String sql = "select * from T_CO_DEVICE_PLAN_CONNECT where ID =?";
	        List<Map> lMaps = modelService.listDataSql(sql, new Object[]{strArray[i]});
				  
					planDetail.setSqlWhere(" and ID =?");
					list.clear();
					list.add(strArray[i]);
					planDetail.setSqlWhereArgs(list);
    			modelService.del(planDetail);
    			
    			String sqlString = "select * from T_CO_DEVICE_PLAN_CONNECT where CDPI_DEVICE_SN = ? and DATA_AUTH = ? ";
    			int count = modelService.countSql(sqlString, new Object[]{lMaps.get(0).get("CDPI_DEVICE_SN"),dataAuth});
    			if (count==0)
          {
    			  TableDataMapExt deviceExt = new TableDataMapExt();
            deviceExt.setTableName("T_CO_DEVICE");
            deviceExt.setSqlWhere("and CD_DEVICE_SN =? and DATA_AUTH=? ");
            list.clear();
            list.add(lMaps.get(0).get("CDPI_DEVICE_SN"));
            list.add(dataAuth);
            deviceExt.setSqlWhereArgs(list);
            deviceExt.getColMap().put("CDP_PLAN_SN", "");
            modelService.edit(deviceExt);
            
          }
    			
				}
			}else{
				String querySql = "select t.CDP_PLAN_SN from T_CO_DEVICE_PLAN_INFO t where t.id = ?";
				List<Map> sList = null;
				TableDataMapExt planDetail = new TableDataMapExt();
	    		planDetail.setTableName("T_CO_DEVICE_PLAN_CONNECT");//设备关联保养计划信息表
	    	TableDataMapExt deviceExt = new	TableDataMapExt();
	    	deviceExt.setTableName("T_CO_DEVICE");
				for(int i=1;i<strArray.length;i++){
					sList = modelService.listDataSql(querySql, new Object[] { strArray[i] });
					planDetail.setSqlWhere(" and CDP_PLAN_SN =? and DATA_AUTH=? ");
					list.clear();
					list.add(sList.get(0).get("CDP_PLAN_SN"));
					list.add(dataAuth);
					planDetail.setSqlWhereArgs(list);
    				modelService.del(planDetail);
    			
    			deviceExt.setSqlWhere("and CDP_PLAN_SN =? and DATA_AUTH =? ");
    			deviceExt.setSqlWhereArgs(list);
    			deviceExt.getColMap().put("CDP_PLAN_SN", "");
    			modelService.edit(deviceExt);
				}
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("解除失败"), e);
		}
		return modelAction.reloadParent(modelAction.getText("解除成功"));
	}

}
