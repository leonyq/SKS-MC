package com.more.mes.smt.devicedataconfig;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @author cb
 * 根据设备SN关联区域SN和名称
 */
public class GetInfoBySn implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String snKey = request.getParameter("snKey");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String sql1 = "select t1.CD_DEVICE_SN,t.ca_id,t2.ca_name from T_CO_AREA_DEVICE t " +
    		"inner join T_CO_DEVICE t1 on t.CAD_DEVICE_ID=t1.id AND t1.DATA_AUTH=? " +
    		"inner join T_CO_AREA t2 on t.ca_id=t2.ca_id AND t2.DATA_AUTH=? " +
    		"WHERE t1.CD_DEVICE_SN=? AND t.DATA_AUTH=? ";
        List<Map> wmsList1 = modelService.listDataSql(sql1, new Object[]{dataAuth,dataAuth,snKey,dataAuth});
        Map<Object, Object> map = new HashMap<Object, Object>();
        if(wmsList1!=null&&!wmsList1.isEmpty()) {
        	map.put("CD_DEVICE_SN", wmsList1.get(0).get("CA_ID"));
            map.put("CA_NAME", wmsList1.get(0).get("CA_NAME"));
        }
        modelAction.setAjaxMap(map);
        return BaseActionSupport.AJAX;
  }
}

