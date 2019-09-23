package com.more.mes.smt.productfreeze.pg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 产品信息分页
 * 
 * @author development
 */
public class AjaxFindTracking implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    Map<String, String> map = new HashMap<String, String>();
    String moNumber = modelAction.getParaMap().get("moNumber");
    String modelCode = modelAction.getParaMap().get("modelCode");
    String docNum = modelAction.getParaMap().get("docNum"); // 异常单号
    String beginTime = modelAction.getParaMap().get("beginTime");
    String areaSn = modelAction.getParaMap().get("areaSn");
    String endTime = modelAction.getParaMap().get("endTime");
    String wtSn = modelAction.getParaMap().get("wt_sn");
    String dataAuth = modelAction.getParaMap().get("_DATA_AUTH");
    String sqlWhere = "";
    Map<String, Object> paraMap = new HashMap<String, Object>();
    String sql = "select t.wt_sn, " + " t.wt_mo_number, " + " b.ca_name, " + " t.wt_model_code, "
                 + " a.ci_item_name, " + " t.wt_num " + " from T_WIP_TRACKING t "
                 + " LEFT JOIN T_QM_INSEPCT_PARENT_INFO t1 " + " on t1.QIP_SN = t.WT_SN "
                 + " LEFT JOIN T_CO_ITEM a " + " ON a.ci_item_code = t.wt_model_code  and a.data_auth = :DATA_AUTH2 "
                 + " LEFT JOIN T_CO_AREA b " + " ON b.ca_id = t.wt_area_sn "
                 + " where t.WT_ERROR_FLAG <> '4' " + " and t.data_auth = :DATA_AUTH1 "
                 + " " + " and b.data_auth = :DATA_AUTH3 ";
    paraMap.put("DATA_AUTH1", dataAuth);
    paraMap.put("DATA_AUTH2", dataAuth);
    paraMap.put("DATA_AUTH3", dataAuth);
    if (StringUtils.isNotBlank(moNumber))
    {
      sqlWhere += " and t.WT_MO_NUMBER = :WT_MO_NUMBER";
      paraMap.put("WT_MO_NUMBER", moNumber);
    }
    if (StringUtils.isNotBlank(modelCode))
    {
      sqlWhere += " and t.WT_MODEL_CODE = :WT_MODEL_CODE ";
      paraMap.put("WT_MODEL_CODE", modelCode);
    }
    if (StringUtils.isNotBlank(areaSn))
    {
      sqlWhere += " and t.WT_AREA_SN = :WT_AREA_SN ";
      paraMap.put("WT_AREA_SN", areaSn);
    }
    if (StringUtils.isNotBlank(wtSn))
    {
      sqlWhere += " and t.WT_SN like '%' || :WT_SN || '%' ";
      paraMap.put("WT_SN", wtSn);
    }
    if (StringUtils.isNotBlank(beginTime))
    {
      sqlWhere += " and t.WT_IN_TIME > to_date( :WT_IN_TIME ,'yyyy-mm-dd hh24:mi:ss')";
      paraMap.put("WT_IN_TIME", beginTime);
    }
    if (StringUtils.isNotBlank(endTime))
    {
      sqlWhere += " and t.WT_IN_TIME < to_date( :WT_IN_TIME2 ,'yyyy-mm-dd hh24:mi:ss')";
      paraMap.put("WT_IN_TIME2", endTime);
    }
    if (StringUtils.isNotBlank(docNum))
    { // 根据异常单号获取检验批号
      String querySql = "select CQI_INSPECT_SN from T_CO_QE_INFO where CQI_DOC_NUMBER= ? and data_auth=?";
      List<Map> pList = modelService.listDataSql(querySql, new Object[] {docNum,dataAuth});
      if (pList.get(0).get("CQI_INSPECT_SN") != null)
      {
        sqlWhere += " and t1.QIP_INSPECT_SN = :QIP_INSPECT_SN ";
        paraMap.put("QIP_INSPECT_SN", pList.get(0).get("CQI_INSPECT_SN"));
        map.put("checkLot", (String)pList.get(0).get("CQI_INSPECT_SN"));
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
    List<Map> moList = modelService.listSql(sql, modelAction.getPage(), paraMap,
      " ORDER BY t.wt_sn", null);
    CommMethod.mapToEscapeJs(map);
    CommMethod.listToEscapeJs(moList);
    modelAction.setAjaxPage(modelAction.getPage());
    modelAction.getAjaxPage().setDataList(moList);
    modelAction.setAjaxMap(map);
    return BaseActionSupport.AJAX;
  }

}
