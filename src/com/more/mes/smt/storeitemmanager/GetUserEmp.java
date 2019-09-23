package com.more.mes.smt.storeitemmanager;

import java.util.List;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * @Description 物料管控新增获取员工号
 * @ClassName DelParameter
 * @author WZY
 * 
 */
public class GetUserEmp implements FuncService
{
	private final Log log = LogFactory.getLog(GetUserEmp.class);
	@Override
	public String exeFunc(ModelAction modelAction, ModelService mService) 
	{
		// TODO Auto-generated method stub
		    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
			String sql = "select login_name from sy_user where 1=1 and data_auth = ?  ";//
			
			List list =mService.listDataSql(sql,new Object[] {dataAuth});
		//	List list =mService.listDataSql(sql);
			CommMethod.listToEscapeJs(list);
			modelAction.setAjaxList(list);
		
		
		return BaseActionSupport.AJAX;
	}

	
	
}
