package com.more.mes.smt.msdmessage.pg;

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

public class GetWsiReplaceInfoPage implements FuncService
{
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("dataAuth").trim();
    String itemCode = request.getParameter("itemCode").trim();
    String itemName = request.getParameter("itemName").trim();
    String wsiItemReplace = request.getParameter("wsiItemReplace").trim();//替代料号
    String itemSn = request.getParameter("itemSn").trim();//物料SN
    String whCode = request.getParameter("whCode").trim();//仓库
    String districtCode = request.getParameter("districtCode").trim();//库区
    String storageCode = request.getParameter("storageCode").trim();//库位
    String itemState = request.getParameter("itemState").trim();//物料状态
    String inspectFlag = request.getParameter("inspectFlag").trim();//检验标志
    String freezeFlag = request.getParameter("freezeFlag").trim();//冻结标志
    String searchSql = " where 1=1 "; //查询条件
    Map<String, String> map = new HashMap<String, String>();
    if(StringUtils.isNotBlank(dataAuth)){
      searchSql+=" and t.DATA_AUTH =:dataAuth ";
      map.put("dataAuth", dataAuth);
    }
    if(StringUtils.isNotBlank(itemCode)){
      searchSql+=" and t.wsi_item_code like '%' || :itemCode || '%' ";
      map.put("itemCode", itemCode);
    }
    if(StringUtils.isNotBlank(itemName)){
      searchSql+=" and t2.ci_item_name like '%' || :itemName || '%' ";
      map.put("itemName", itemName);
    }
    if(StringUtils.isNotBlank(wsiItemReplace)){
      searchSql+=" and t8.CR_ITEM_REPLACE like '%' || :wsiItemReplace || '%' ";
      map.put("wsiItemReplace", wsiItemReplace);
    }
    if(StringUtils.isNotBlank(itemSn)){
      searchSql+=" and t.WSI_ITEM_SN like '%' || :itemSn || '%' ";
      map.put("itemSn", itemSn);
    }  
    if(StringUtils.isNotBlank(whCode)){
      searchSql+=" and t.WSI_WH_CODE =:whCode";
      map.put("whCode", whCode);
    }
    if(StringUtils.isNotBlank(districtCode)){
      searchSql+=" and t.WSI_DISTRICT_CODE =:districtCode";
      map.put("districtCode", districtCode);
    }
    if(StringUtils.isNotBlank(storageCode)){
      searchSql+=" and t.WSI_STORAGE_CODE =:storageCode";
      map.put("storageCode", storageCode);
    }
    if(StringUtils.isNotBlank(itemState)){
      searchSql+=" and t.WSI_STOCK_FLAG =:itemState";
      map.put("itemState", itemState);
    }
    if(StringUtils.isNotBlank(inspectFlag)){
      searchSql+=" and t.WSI_INSPECT_FLAG =:inspectFlag";
      map.put("inspectFlag", inspectFlag);
    }
    if(StringUtils.isNotBlank(freezeFlag)){
      searchSql+=" and t.WSI_FREEZE_FLAG =:freezeFlag ";
      map.put("freezeFlag", freezeFlag);
    }
   
   
    String sql = "SELECT distinct  t.*,t1.name dept_name,t2.ci_item_name,t2.ci_item_spec,t3.supplier_name," +
        "t4.customer,to_char(t.wsi_invalid_date,'yyyy-mm-dd') invalid_date," +
        "t5.wa_area_name wh_name,t6.wa_area_name district_name,t7.wa_area_name storage_name," +
        "t8.cr_item_replace,t8.cr_item_name,t8.cr_item_desc,"+
        "to_char(t.wsi_receive_time,'yyyy-mm-dd hh24:mi:ss') receive_time," +
        "to_char(t.wsi_produce_date,'yyyy-mm-dd') produce_date," +
        "round((extract(epoch from now()-t.wsi_invalid_date)/86400)::numeric,2) EXTEND_TIME," +
        "round((extract(epoch from now()-t.wsi_receive_time)/86400)::numeric,2) DULL_TIME " +
        "FROM T_WMS_STOCK_INFO t " +
        "LEFT JOIN sy_dept t1 ON t1.id=t.data_auth " +
        "LEFT JOIN t_co_item t2 ON t2.ci_item_code=t.wsi_item_code " +
        "LEFT JOIN t_co_supplier t3 ON t3.supplier_code=t.wsi_sup_code " +
        "LEFT JOIN t_co_customer t4 ON t4.cust_code=t.wsi_cust_code " +
        "LEFT JOIN t_wms_area t5 ON t5.wa_area_sn=t.wsi_wh_code " +
        "LEFT JOIN t_wms_area t6 ON t6.wa_area_sn=t.wsi_district_code " +
        "LEFT JOIN t_wms_area t7 ON t7.wa_area_sn=t.wsi_storage_code "+
        "LEFT JOIN t_co_item_replace t8 ON t8.cr_item_mian = t.wsi_item_code ";
    /*
    String sql1 ="SELECT distinct t.*,t1.name dept_name,t2.ci_item_name,t2.ci_item_spec,t3.supplier_name," +
      "t4.customer,to_char(t.wsi_invalid_date,'yyyy-mm-dd') invalid_date," +
      "t5.wa_area_name wh_name,t6.wa_area_name district_name,t7.wa_area_name storage_name," +
      "t8.cr_item_replace,t8.cr_item_name,t8.cr_item_desc,"+
      "to_char(t.wsi_receive_time,'yyyy-mm-dd hh24:mi:ss') receive_time," +
      "to_char(t.wsi_produce_date,'yyyy-mm-dd') produce_date," +
      "round(SYSDATE-t.wsi_invalid_date,2) EXTEND_TIME,round(SYSDATE-t.wsi_receive_time,2) DULL_TIME " +
      "FROM T_WMS_STOCK_INFO t,sy_dept t1, t_co_item t2,t_co_supplier t3,t_co_customer t4,t_wms_area t5,"+
      "t_wms_area t6,t_wms_area t7,t_co_item_replace t8 "+
      "where  t1.id=t.data_auth and t2.ci_item_code=t.wsi_item_code and t3.supplier_code=t.wsi_sup_code "+
      "and t4.cust_code=t.wsi_cust_code and t5.wa_area_sn=t.wsi_wh_code and t6.wa_area_sn=t.wsi_district_code "+
      "and t7.wa_area_sn=t.wsi_storage_code and t8.cr_item_mian IN "+
      "(select tt.wsi_item_code from T_WMS_STOCK_INFO tt  where tt.wsi_item_code = t8.cr_item_mian )"+searchSql;
    
   */
    
    String sql1 = sql + searchSql + " order by t.WSI_DOC_NUM ";
    List itemList = modelService.listSql(sql1, modelAction.getPage(), map, null,null);

    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(itemList);
    modelAction.getAjaxPage().setDataList(itemList);
    return BaseActionSupport.AJAX;
  }
}
