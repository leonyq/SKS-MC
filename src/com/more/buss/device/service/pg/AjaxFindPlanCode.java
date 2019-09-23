package com.more.buss.device.service.pg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;

/**
 * 保养计划查询分页
 * 
 * @author development
 */
public class AjaxFindPlanCode implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    String planSn = modelAction.getParaMap().get("planSn"); // 计划代码
    String planName = modelAction.getParaMap().get("planName"); // 计划名称
    String cdpCycle = modelAction.getParaMap().get("cdpCycle"); // 保养周期
    String cdpType = modelAction.getParaMap().get("cdpType"); // 计划类型
    String dataAuth =modelAction.getParaMap().get("dataAuth"); // 组织机构
    String userId = modelAction.getSessionUser().getId();
    Map<String, String> map = new HashMap<String, String>();
    String sqlWhere = " where 1 = 1 ";
    String querySql = "SELECT row_number() over() as ROWNUM,t.*,a.value CDPCYCLE "
                      + "FROM T_CO_DEVICE_PLAN_INFO t "
                      + "LEFT JOIN SY_DICT_VAL a ON t.cdp_cycle=a.code AND a.dict_code='CDP_CYCLE' ";
    if(StringUtils.isNotBlank(dataAuth)) {
    	sqlWhere += " and t.DATA_AUTH =  :DATA_AUTH ";
    	map.put("DATA_AUTH", dataAuth);
    }else {
    	sqlWhere += " and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID ) ";
    	map.put("USER_ID", userId);        	
    }    
    if (StringUtils.isNotBlank(planSn))
    {
      sqlWhere += " and t.cdp_plan_sn LIKE '%' ||:planSn|| '%'";
      map.put("planSn", planSn);
    }
    if (StringUtils.isNotBlank(planName))
    {
      sqlWhere += " and t.cdp_plan_name LIKE '%' ||:planName|| '%'";
      map.put("planName", planName);
    }
    if (StringUtils.isNotBlank(cdpCycle))
    {
      sqlWhere += " and t.cdp_cycle = :cdpCycle";
      map.put("cdpCycle", cdpCycle);
    }
    if (StringUtils.isNotBlank(cdpType))
    {
      sqlWhere += " and t.cdp_type = :cdpType";
      map.put("cdpType", cdpType);
    }
    List itemList = modelService.listSql(querySql + sqlWhere, modelAction.getPage(), map, null,
      null);
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listToEscapeJs(itemList);
    modelAction.getAjaxPage().setDataList(itemList);

    return BaseActionSupport.AJAX;
  }

}
