package com.more.mes.smt.usermanager.employeereward;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 自定义的查询奖惩信息列表接口
 * 
 * @author development
 */
 
public class AjaxGetReward1 implements FuncService {
	
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String loginName = modelAction.getParaMap().get("loginName");
	    String name = modelAction.getParaMap().get("name");
	    String rewardName = modelAction.getParaMap().get("rewardName");
	    String rewardType = modelAction.getParaMap().get("rewardType");
	    String rewardDateBegin =  modelAction.getParaMap().get("rewardDateBegin");
	    String rewardDateEnd =  modelAction.getParaMap().get("rewardDateEnd");
	    String sqlWhere = "";
		
        String querySql = "select  distinct t1.id,t1.REWARD_CODE,t1.REWARD_DATE,t1.REWARD_NAME,t1.REWARD_TYPE,"
                            + "t1.REWARD_COUNT,t1.REWARD_FILE_NAME,t1.REWARD_FILE_PATH,t1.REWARD_FILE_REAL_NAME,t1.REWARD_FILE_SIZE " 
                            + " from T_USER_REWARD t1 "
                            +" left join T_USER_REWARD_USER t2 on t1.ID=t2.REWARD_ID "
                            +" left join SY_USER t3 on t2.USER_ID=t3.ID ";
        Map<String, String> map = new HashMap<String, String>();
        if(StringUtils.isNotBlank(loginName)){
            sqlWhere +=" and t3.LOGIN_NAME LIKE '%' || :loginName || '%'";
			//sqlWhere +=" and t3.LOGIN_NAME LIKE '%" + loginName + "%'";
			map.put("loginName", loginName);
		}
		if(StringUtils.isNotBlank(name)){
		    sqlWhere +=" and t3.NAME LIKE '%' || :name || '%'";
			//sqlWhere +=" and t3.NAME LIKE '%" + name + "%'";
			map.put("name", name);
		}
		if(StringUtils.isNotBlank(rewardName)){
		    sqlWhere +=" and t1.REWARD_NAME LIKE '%' || :rewardName || '%'";
		//	sqlWhere +=" and t1.REWARD_NAME LIKE '%" + rewardName + "%'";
			map.put("rewardName", rewardName);
		}
		if(StringUtils.isNotBlank(rewardType)){
		    sqlWhere +=" and t1.REWARD_TYPE = :rewardType ";
		//	sqlWhere +=" and t1.REWARD_TYPE = '"+rewardType+"'";
			map.put("rewardType", rewardType);
		}
		
		if(StringUtils.isNotBlank(rewardDateBegin)){
		    sqlWhere +=" and t1.REWARD_DATE >= to_date( :rewardDateBegin,'yyyy-MM-dd') ";
		//	sqlWhere +=" and t1.REWARD_DATE >= to_date('" + rewardDateBegin + "','yyyy-MM-dd') ";
			map.put("rewardDateBegin", rewardDateBegin);
		}
		if(StringUtils.isNotBlank(rewardDateEnd)){
		    sqlWhere +=" and t1.REWARD_DATE <= to_date( :rewardDateEnd,'yyyy-MM-dd') ";
		 //   sqlWhere +=" and t1.REWARD_DATE <= to_date('" + rewardDateEnd + "','yyyy-MM-dd') ";
		 	map.put("rewardDateEnd", rewardDateEnd);
		    
		}
		
        List rewardList = modelService.listSql(querySql, modelAction.getPage(), map, null,null);
        
        //String dictSql = "select code,value from SY_DICT_VAL where DICT_CODE='REWARD_TYPE'";
       // List dictList = modelService.listDataSql(dictSql,new Object[]{});
       // rewardList.add(dictList);
       
        modelAction.setAjaxPage(modelAction.getPage());
        CommMethod.listMapToEscapeJs(rewardList);
        modelAction.getAjaxPage().setDataList(rewardList);
		return BaseActionSupport.AJAX;
	}

}
