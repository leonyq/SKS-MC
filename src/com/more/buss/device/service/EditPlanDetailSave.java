package com.more.buss.device.service;

import java.text.SimpleDateFormat;
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
 * @Description 保存修改的保养计划及保养计划明细
 * @ClassName AddDeviceService
 * @author development
 * @Company: morelean
 */
public class EditPlanDetailSave implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    String formId = request.getParameter("formId");
	    if (StringUtils.isBlank(formId))
	    {
	      formId = request.getParameter("formIds");
	    }
	    String iframeId = request.getParameter("iframeId");
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    try {
			//获取设备保养计划信息
	    	String planType = request.getParameter("CDP_TYPE");//计划类型
	    	String planSn = request.getParameter("paraMapObj.CDP_PLAN_SN");//计划代码
	    	String planName = request.getParameter("paraMapObj.CDP_PLAN_NAME");//计划名称
	    	String planCycle = request.getParameter("CDP_CYCLE");//保养周期
	    	String planSpace = request.getParameter("CDP_SPACE");//保养间隔
	    	String productTimes = request.getParameter("CDP_PRODUCT_TIMES");//生产次数
	    	String memo = request.getParameter("paraMapObj.CDP_MEMO");//备注
	    	String id = request.getParameter("dataId");
	    	String sql = "select t.CDP_PLAN_SN from T_CO_DEVICE_PLAN_INFO t where t.CDP_PLAN_SN=?  and t.id != ? and t.data_auth=?";
	        int count = modelService.countSql(sql, new Object[] {planSn,id,dataAuth});
	        if (count != 0)
	        {
	          return modelAction.alertParentInfo(modelAction.getText("计划代码已存在"));
	        }
	        List list = new ArrayList();
	    	TableDataMapExt device = new TableDataMapExt();
	        device.setTableName("T_CO_DEVICE_PLAN_INFO");//设备保养计划信息表
	        CommMethod.editSysDefCol(device.getColMap(), modelAction.getUser());
	    	if(!planType.equals("1")){ //没有计划明细
	    		device.setSqlWhere(" and ID=?");
	    		list.add(id);
	    		device.setSqlWhereArgs(list);
	    		device.getColMap().put("CDP_PLAN_SN", planSn);
	    		device.getColMap().put("CDP_PLAN_NAME", planName);
	    		//device.getColMap().put("CDP_TYPE", planType);
	    		//device.getColMap().put("CDP_CYCLE", planCycle);
	    		if (StringUtils.isNotBlank(planSpace))
          {
            device.getColMap().put("CDP_SPACE", Integer.valueOf(planSpace));
          }
	    		//device.getColMap().put("CDP_SPACE", planSpace);
	    		if (StringUtils.isNotBlank(productTimes))
          {
            device.getColMap().put("CDP_PRODUCT_TIMES", Integer.valueOf(productTimes));
          }
	    		//device.getColMap().put("CDP_PRODUCT_TIMES", productTimes);
	    		device.getColMap().put("CDP_MEMO", memo);
	    		//device.getColMap().put("CDP_CREATE_DATE", sdf.parse(sdf.format(new Date())));
	    		//device.getColMap().put("CDP_CREATE_MAN", CommMethod.getSessionUser().getId());
	    		if(dataAuth!=null){
      				device.getColMap().put("DATA_AUTH", dataAuth);
      			}
	    		
	    		modelService.edit(device);
	    	}else{	//有计划明细
	    		device.setSqlWhere(" and ID=?");
	    		list.add(id);
	    		device.setSqlWhereArgs(list);
	    		device.getColMap().put("CDP_PLAN_SN", planSn);
	    		device.getColMap().put("CDP_PLAN_NAME", planName);
	    		//device.getColMap().put("CDP_TYPE", planType);
	    		//device.getColMap().put("CDP_CYCLE", planCycle);
	    		if (StringUtils.isNotBlank(planSpace))
          {
	    		  device.getColMap().put("CDP_SPACE", Integer.valueOf(planSpace));
          }
	    		if (StringUtils.isNotBlank(productTimes))
          {
            device.getColMap().put("CDP_PRODUCT_TIMES", Integer.valueOf(productTimes));
          }
	    		//device.getColMap().put("CDP_PRODUCT_TIMES", productTimes);
	    		device.getColMap().put("CDP_MEMO", memo);
	    		//device.getColMap().put("CDP_CREATE_DATE", sdf.parse(sdf.format(new Date())));
	    		//device.getColMap().put("CDP_CREATE_MAN", CommMethod.getSessionUser().getId());
	    		if(dataAuth!=null){
      				device.getColMap().put("DATA_AUTH", dataAuth);
      			}
	    		
	    		modelService.edit(device);   //保存设备保养计划
	    		
	    		String trCount = request.getParameter("trCount");
	    		String delId = null;
	    		TableDataMapExt planDetail1 = new TableDataMapExt();
	    		planDetail1.setTableName("T_CO_DEVICE_PLAN_DETAIL");//设备保养计划明细表
	    		String delPlanSn = null;
	    		//先删除计划明细
	    		for(int i=1;i<=Integer.parseInt(trCount);i++){
	    			delId = request.getParameter("delId_"+i);
	    			if(delId!=null){
	    				//取出对应的保养计划sn
	    				String querySql = "select t.cdp_plan_sn from T_CO_DEVICE_PLAN_DETAIL t where t.id=? and t.DATA_AUTH=?";
	    				List<Map> sList = modelService.listDataSql(querySql, new Object[] { delId,dataAuth });
	    				if (sList!=null&&!sList.isEmpty()) {
	    					delPlanSn = (String) sList.get(0).get("CDP_PLAN_SN");	
						}
	    				break;
	    				/*planDetail1.setSqlWhere(" and ID ='"+delId+"'");
	    				modelService.del(planDetail1);*/
	    			}
	    		}
	    		//删除对应计划sn的详细信息
	    		planDetail1.setSqlWhere(" and CDP_PLAN_SN =? and DATA_AUTH=? ");
	    		list.clear();
	    		list.add(delPlanSn);
	    		list.add(dataAuth);
	    		planDetail1.setSqlWhereArgs(list);
				modelService.del(planDetail1);
	    		TableDataMapExt planDetail = new TableDataMapExt();
	    		planDetail.setTableName("T_CO_DEVICE_PLAN_DETAIL");//设备保养计划明细表
	    		
	    		//计划明细
	    		String CDPD_HALF_YEAR = null;//半年
	    		String CDPD_QUARTER = null;//季度
	    		String CDPD_MONTH = null;//月份
	    		String CDPD_DATE = null;//日
	    		String CDPD_WEEK = null;//星期
	    		String CDPD_CREATE_DATE = null;//创建时间
	    		String CDPD_CREATE_MAN = null;//创建人
	    		for(int i=1;i<=Integer.parseInt(trCount);i++){
	    			CDPD_HALF_YEAR = request.getParameter("CDPD_HALF_YEAR_"+i);
	    			CDPD_QUARTER = request.getParameter("CDPD_QUARTER_"+i);
	    			CDPD_MONTH = request.getParameter("CDPD_MONTH_"+i);
	    			CDPD_DATE = request.getParameter("CDPD_DATE_"+i);
	    			CDPD_WEEK = request.getParameter("CDPD_WEEK_"+i);
	    			CDPD_CREATE_DATE = request.getParameter("CDPD_CREATE_DATE_"+i);
	    			CDPD_CREATE_MAN = request.getParameter("CDPD_CREATE_MAN_"+i);
	    			if(CDPD_HALF_YEAR!=null&&CDPD_QUARTER!=null&&CDPD_MONTH!=null&&CDPD_DATE!=null
	    					&&CDPD_WEEK!=null&&CDPD_CREATE_DATE!=null){
	    				if(CDPD_MONTH.equals("/"))	CDPD_MONTH="";
		    			if(CDPD_DATE.equals("/"))	CDPD_DATE="";
		    			if(CDPD_DATE.equals("最后一天"))	CDPD_DATE="0";
		    			if(CDPD_WEEK.equals("/"))	CDPD_WEEK="";
		    			CommMethod.addSysDefCol(planDetail.getColMap(), modelAction.getUser());
	    				planDetail.getColMap().put("ID", StringUtils.getUUID());
			    		planDetail.getColMap().put("CDP_PLAN_SN", planSn);
			    		planDetail.getColMap().put("CDPD_CYCLE", planCycle);
			    		planDetail.getColMap().put("CDPD_HALF_YEAR", CDPD_HALF_YEAR);
			    		planDetail.getColMap().put("CDPD_QUARTER", CDPD_QUARTER);
			    		planDetail.getColMap().put("CDPD_MONTH", CDPD_MONTH);
			    		planDetail.getColMap().put("CDPD_DATE", CDPD_DATE);
			    		planDetail.getColMap().put("CDPD_WEEK", CDPD_WEEK);
			    		planDetail.getColMap().put("CDPD_CREATE_DATE", sdf.parse(CDPD_CREATE_DATE));
			    		planDetail.getColMap().put("CDPD_CREATE_MAN", CDPD_CREATE_MAN);
			    		if(dataAuth!=null){
      						planDetail.getColMap().put("DATA_AUTH", dataAuth);
     	 				}
			    		
			    		modelService.save(planDetail);
	    			}
	    		}
	    	}
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("修改失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}

}
