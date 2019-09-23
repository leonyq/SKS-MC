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
 * 制令单 -chakan -获取数据
 * 
 * 
 */
public class OnLineGetInfo implements FuncService {
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
    if(StringUtils.isNotBlank(dataId)) {
      String sqlString = "select DATA_AUTH from T_PM_MO_BASE "
        + "where ID = ?  ";
     Map<String, String> map1 =modelService.queryForMap(sqlString, new Object[]{dataId});
     if(null!=map1 && map1.size()>0) {
    	 dataAuth=map1.get("DATA_AUTH");
     }
       
    }
		
		String sql = "SELECT T.PM_AREA_SN,T.PM_PROCESS_FACE,T.PM_MODEL_CODE  FROM T_PM_MO_BASE T WHERE T.ID=? AND T.DATA_AUTH=?" ;
		
		List sList = modelService.listDataSql(sql, new Object[] {dataId,dataAuth});
		modelAction.setAjaxList(sList);
		return BaseActionSupport.AJAX;
	}
}
