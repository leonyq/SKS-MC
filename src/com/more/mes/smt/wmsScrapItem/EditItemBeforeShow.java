package com.more.mes.smt.wmsScrapItem;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description
 * @ClassName RelieveBeforeShow
 * @author csj
 * @Company: morelean
 */
public class EditItemBeforeShow implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String docNum = request.getParameter("docNum");
    String sql = "SELECT T1.ID,T1.WSD_ITEM_SN   ITEM_SN, " + " T1.WSD_ITEM_CODE ITEM_CODE, "
                 + " T1.WSD_SCARP_NUM ITEM_NUM, " + " T2.CI_ITEM_NAME  ITEM_NAME, "
                 + " T2.CI_ITEM_SPEC  ITEM_SPEC, " + " T.WAD_WH_CODE    WH_CODE, "
                 + " T3.WA_AREA_NAME  WH_CODE_NAME " + " FROM T_WMS_SCARP_DOC T "
                 + " LEFT JOIN T_WMS_SCARP_DETAIL T1 " + " ON T.WSD_DOC_NUM = T1.WSD_DOC_NUM and t1.data_auth=T.data_Auth "
                 + " LEFT JOIN T_CO_ITEM T2 " + " ON T1.WSD_ITEM_CODE = T2.CI_ITEM_CODE and t1.data_auth=T2.data_Auth  "
                 + " LEFT JOIN T_WMS_AREA T3 " + " ON T.WAD_WH_CODE = T3.WA_AREA_SN and t3.data_auth=T.data_Auth  "
                 + " WHERE T.WSD_DOC_NUM = ? AND T.data_Auth = ? ";
    List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] {docNum,dataAuth});
    if (list != null && !list.isEmpty())
    {
      CommMethod.listMapToEscapeJs(list);
      modelAction.setDataList(list);
    }

    return modelAction.ActionForwardExeid(modelAction.getExeid());
  }

}
