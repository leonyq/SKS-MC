package com.more.mes.smt.feeder.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 获得FEEDER信息
 * @ClassName ScrapBeforeShow
 * @author csj
 * @Company: morelean
 */
public class ScrapBeforeShow implements FuncService
{
  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    TableDataMapExt tdMap = new TableDataMapExt();
    String infoId = modelAction.getDataId();
    HttpServletRequest request = modelAction.getRequest();
	String status = request.getParameter("status");
    
    tdMap.put("ID", infoId);
    tdMap.put("status", status);
    String curUser = CommMethod.getSessionUser().getName();
    String feederSql = "select t.TCF_FEEDER_SN,t.TCT_TYPE,t.TCS_SPEC,t.CREATE_USER from T_CO_FEEDER_INFOR t where t.id=?";
    List<Map> feederInfoList = modelService.listDataSql(feederSql, new Object[] {infoId});
    
    String scrapSql = "select t.FS_SCR_CHECK,t.FS_SCR_CONFIRM,t.FS_SCR_REASON from T_CO_FEEDER_SCRAP_INFO t where t.id=?";
    List<String> scrapInfoList = modelService.listDataSql(scrapSql, new Object[] {infoId});
    
    String typeNameSql="select t3.value AS typeName from sy_dict_val t3 where t3.code=? and t3.dict_code='FEEDER_TYPE'";
    List<Map> list= modelService.listDataSql(typeNameSql, new Object[] {feederInfoList.get(0).get("TCT_TYPE")});
    if (list != null && !list.isEmpty())
    {
        tdMap.put("typeName", list.get(0).get("typeName"));
        tdMap.put("TCF_FEEDER_SN", feederInfoList.get(0).get("TCF_FEEDER_SN"));
        tdMap.put("TCS_SPEC", feederInfoList.get(0).get("TCS_SPEC"));
    }
    tdMap.put("curUser", curUser);
    if (scrapInfoList != null && !scrapInfoList.isEmpty())
    {
      Map<String, String> scrapMap = modelService.queryForMap(scrapSql, new Object[] {infoId});
      String scrConfirm = scrapMap.get("FS_SCR_CONFIRM");
      String scrCheck = scrapMap.get("FS_SCR_CHECK");
      String scrReason = scrapMap.get("FS_SCR_REASON");

      tdMap.put("FS_SCR_CONFIRM", scrConfirm);
      tdMap.put("FS_SCR_CHECK", scrCheck);
      tdMap.put("FS_SCR_REASON", scrReason);
    }
    //CommMethod.listMapToEscapeJs(feederInfoList);
    CommMethod.mapToEscapeJs(tdMap);
    modelAction.setDataMap(tdMap);
    modelAction.setDataList(feederInfoList);
    return null;
  }

}
