package com.more.mes.smt.quailtyerror;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取产品信息
 * 
 * @author development
 */
public class AjaxGetTracking implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    Map<String, Object> paraMap = new HashMap<String, Object>();
    Map<String, String> map = new HashMap<String, String>();
    String moNumber = request.getParameter("moNumber");
    String modelCode = request.getParameter("modelCode");
    String docNum = request.getParameter("docNum"); // 异常单号
    String dataAuth = request.getParameter("dataAuth");
    String sql = "select t.wt_sn, " + " t.wt_mo_number, " + " b.ca_name, " + " t.wt_model_code, "
                 + " a.ci_item_name, " + " t.wt_num " + " from T_WIP_TRACKING t "
                 + " LEFT JOIN T_QM_INSEPCT_PARENT_INFO t1 " + " on t1.QIP_SN = t.WT_SN "
                 + " LEFT JOIN T_CO_ITEM a " + " ON a.ci_item_code = t.wt_model_code and a.data_auth = :DATA_AUTH2 "
                 + " LEFT JOIN T_CO_AREA b " + " ON b.ca_id = t.wt_area_sn "
                 + " where t.WT_ERROR_FLAG <> '4' " + " and t.data_auth = :DATA_AUTH1 "
                 + "  " + " and b.data_auth = :DATA_AUTH3 ";
    paraMap.put("DATA_AUTH1", dataAuth);
    paraMap.put("DATA_AUTH2", dataAuth);
    paraMap.put("DATA_AUTH3", dataAuth);
    String sqlWhere = "";
    if (StringUtils.isNotBlank(moNumber))
    {
      sqlWhere += " and t.wt_mo_number = :wt_mo_number ";
      paraMap.put("wt_mo_number", moNumber);
    }
    if (StringUtils.isNotBlank(modelCode))
    {
      sqlWhere += " and t.wt_model_code = :wt_model_code ";
      paraMap.put("wt_model_code", modelCode);
    }
    if (StringUtils.isNotBlank(docNum))
    { // 根据异常单号获取检验批号
      String querySql = "select CQI_INSPECT_SN from T_CO_QE_INFO where CQI_DOC_NUMBER= ? and DATA_AUTH=?";
      List<Map> pList = modelService.listDataSql(querySql, new Object[] {docNum,dataAuth});
      if (pList != null && !pList.isEmpty() && pList.get(0).get("CQI_INSPECT_SN") != null)
      {
        sqlWhere += " and t1.QIP_INSPECT_SN = :QIP_INSPECT_SN ";
        map.put("checkLot", (String)pList.get(0).get("CQI_INSPECT_SN"));
        paraMap.put("QIP_INSPECT_SN", pList.get(0).get("CQI_INSPECT_SN"));
      }
      else
      {
        map.put("checkLot", "");
      }
    }
    else
    {
      map.put("checkLot", "");
    }
    sql = sql + sqlWhere;
    List trackingList = modelService.listSql(sql, modelAction.getPage(), paraMap,
      " ORDER BY t.wt_sn", null);
    CommMethod.mapToEscapeJs(map);
    CommMethod.listToEscapeJs(trackingList);
    modelAction.setAjaxPage(modelAction.getPage());
    modelAction.getAjaxPage().setDataList(trackingList);
    modelAction.setAjaxMap(map);
    return BaseActionSupport.AJAX;
  }

}
