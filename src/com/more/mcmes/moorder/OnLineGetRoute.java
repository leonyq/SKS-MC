package com.more.mcmes.moorder;

import java.util.List;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.method.StringUtils;
import java.util.Map;
/**
 * 工艺关联流程
 * 
 * 
 */
public class OnLineGetRoute implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
	   String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	  /*
	   String dataAuthId = modelAction.getRequest().getParameter("dataAuthId");
	    if (dataAuthId != null && !dataAuthId.equals("") && !dataAuthId.equals("undefined"))
      {
        dataAuth=dataAuthId;
      }
      */
   String dataId = modelAction.getRequest().getParameter("dataId");
   String ctId = modelAction.getRequest().getParameter("ctId");
   String flag = modelAction.getRequest().getParameter("flag");
    if(StringUtils.isNotBlank(dataId)) {
    if(flag !=null&& flag.equals("1")) {
      String sqlString = "select DATA_AUTH from T_CO_TECHNICS "
        + "where ID = ?  ";
     Map<String, String> map1 =modelService.queryForMap(sqlString, new Object[]{dataId});
        dataAuth=map1.get("DATA_AUTH");
      
    }else
    {
    String sqlString = "select DATA_AUTH,PM_TECH_SN from t_pm_mo_base "
                    + "where ID = ?  ";
    Map<String, String> map1 =modelService.queryForMap(sqlString, new Object[]{dataId});
    dataAuth=map1.get("DATA_AUTH");
    ctId = map1.get("PM_TECH_SN");
    }
    }
		
		String sql = "select s.ct_id,s.ct_name,b.GROUP_NAME as CR_MO_INPUT,"+ 
		    "c.GROUP_NAME as CR_MO_OUTPUT,a.CR_BLOCKS_MSG,a.CR_CONN_MSG "+ 
		    "from T_CO_TECHNICS s "+ 
		    "left join t_co_route a on a.cr_route_id=s.ct_route_code and s.data_auth=a.data_auth " +
				"left join t_co_group b on b.GROUP_CODE = a.CR_MO_INPUT and s.data_auth=b.data_auth " +
				"left join t_co_group c on c.GROUP_CODE = a.CR_MO_OUTPUT and s.data_auth=a.data_auth " +
				"where s.ct_id = ?  and s.data_auth=? " ;
		
		List sList = modelService.listDataSql(sql, new Object[] {ctId,dataAuth});
		//CommMethod.listMapToEscapeJs(sList);
		modelAction.setAjaxList(sList);
		return BaseActionSupport.AJAX;
	}
}
