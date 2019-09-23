package com.more.mes.visual.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;

public class EditStockInfo
{
  static private final Log log = LogFactory.getLog("com.more.mes.visual.service.VisualService");

  private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

  @SuppressWarnings("unchecked")
  public boolean getDullStock(String numId, String type, ModelAction modelAction)
  {
    try
    {
      if (type.equals("1"))
      {
        /*
         * String sql1 = "select t.WRD_ITEM_SN from" + " T_WMS_RECEIVE_DETAIL T" +
         * " LEFT JOIN T_WMS_RECEIVE_ITEM T1" +
         * " T_WMS_RECEIVE_ITEM T1 ON T1.WRI_DOC_NUM =T.WRD_DOC_NUM where t1.id = ?";
         */

        String sql = "select t.WRI_DOC_NUM from T_WMS_RECEIVE_ITEM t where t.id = ?";

        Map<String, Object> map = modelService.queryForMap(sql, new Object[] {numId});

        TableDataMapExt wms = new TableDataMapExt();
        List<Object> lists = new ArrayList<Object>();
        wms.setTableName("T_WMS_STOCK_INFO");
        CommMethod.editSysDefCol(wms.getColMap(), modelAction.getUser());
        wms.setSqlWhere(" and WSI_DOC_NUM=?");

        lists.add(map.get("WRI_DOC_NUM").toString());
        wms.setSqlWhereArgs(lists);
        wms.getColMap().put("WSI_TEST_TIME", DateUtil.getCurDate());
        wms.getColMap().put("WSI_STOCK_FLAG", "2");
        wms.getColMap().put("WSI_ITEM_FLAG","Y");
      
        
        modelService.edit(wms);
      }
      else if (type.equals("2"))
      {
        
        String sql = "select t.WOD_ITEM_SN from" + " T_WMS_OUTSTOCK_DETAIL T" +
           " LEFT JOIN T_WMS_OUTSTOCK_ITEM T1" +
           "  ON T1.WOI_DOC_NUM =T.WOD_DOC_NUM where t1.id = ?";
        
      //  String sql = "SELECT T.WOI_DOC_NUM FROM T_WMS_OUTSTOCK_ITEM T WHERE T.ID = ?";

        List<Map> lists = modelService.listDataSql(sql, new Object[] {numId});
        
        sql ="SELECT * FROM T_WMS_STOCK_INFO WHERE WSI_ITEM_SN=?";
        
       
        int nums;
        if (null!=lists && lists.size()>0)
        {
          int lengths=lists.size();
          TableDataMapExt addwms = new TableDataMapExt();
          addwms.setTableName("T_WMS_STOCK_INFO_L");
          for (int i = 0; i <lengths ; i++ )
          {
            
            List<Map<String, Object>> list = modelService.listDataSql(sql, 
              new Object[]{lists.get(i).get("WOD_ITEM_SN").toString()});
            
             addwms.getColMap().clear();
             CommMethod.addSysDefCol(addwms.getColMap(), modelAction.getUser());
             addwms.getColMap().put("WSI_ITEM_SN",String.valueOf(list.get(0).get("WSI_ITEM_SN")).equals("null")?"":String.valueOf(list.get(0).get("WSI_ITEM_SN")));
             addwms.getColMap().put("WSI_DOC_NUM",String.valueOf(list.get(0).get("WSI_DOC_NUM")).equals("null")?"":String.valueOf(list.get(0).get("WSI_DOC_NUM")));
             addwms.getColMap().put("WSI_ITEM_CODE",String.valueOf(list.get(0).get("WSI_ITEM_CODE")).equals("null")?"":String.valueOf(list.get(0).get("WSI_ITEM_CODE")));
             if (StringUtils.isNotBlank(String.valueOf(list.get(0).get("WSI_ITEM_NUM"))))
            {
               nums = Integer.valueOf(String.valueOf(list.get(0).get("WSI_ITEM_NUM")));
               System.out.println("nums::"+nums);
               addwms.getColMap().put("WSI_ITEM_NUM",nums);
            }
             
             addwms.getColMap().put("WSI_CONNECT_DOC",String.valueOf(list.get(0).get("WSI_CONNECT_DOC")).equals("null")?"":String.valueOf(list.get(0).get("WSI_CONNECT_DOC")));
             addwms.getColMap().put("WSI_CUST_CODE",String.valueOf(list.get(0).get("WSI_CUST_CODE")).equals("null")?"":String.valueOf(list.get(0).get("WSI_CUST_CODE")));
             addwms.getColMap().put("WSI_DISTRICT_CODE",String.valueOf(list.get(0).get("WSI_DISTRICT_CODE")).equals("null")?"":String.valueOf(list.get(0).get("WSI_DISTRICT_CODE")));
             addwms.getColMap().put("WSI_DOC_NUM",String.valueOf(list.get(0).get("WSI_DOC_NUM")).equals("null")?"":String.valueOf(list.get(0).get("WSI_DOC_NUM")));
             addwms.getColMap().put("WSI_FIRST_SN",String.valueOf(list.get(0).get("WSI_FIRST_SN")).equals("null")?"":String.valueOf(list.get(0).get("WSI_FIRST_SN")));
             addwms.getColMap().put("WSI_FOURTH_SN",String.valueOf(list.get(0).get("WSI_FOURTH_SN")).equals("null")?"":String.valueOf(list.get(0).get("WSI_FOURTH_SN")));
             addwms.getColMap().put("WSI_FREEZE_FLAG",String.valueOf(list.get(0).get("WSI_FREEZE_FLAG")).equals("null")?"":String.valueOf(list.get(0).get("WSI_FREEZE_FLAG")));
             addwms.getColMap().put("WSI_INSPECT_FLAG",String.valueOf(list.get(0).get("WSI_INSPECT_FLAG")).equals("null")?"":String.valueOf(list.get(0).get("WSI_INSPECT_FLAG")));
             if (StringUtils.isNotBlank(String.valueOf(list.get(0).get("WSI_INVALID_DATE"))))
            {
               addwms.getColMap().put("WSI_INVALID_DATE",DateUtil.parseDate(String.valueOf(list.get(0).get("WSI_INVALID_DATE"))));
            }
             
             addwms.getColMap().put("WSI_ITEM_FLAG",String.valueOf(list.get(0).get("WSI_ITEM_FLAG")).equals("null")?"":String.valueOf(list.get(0).get("WSI_ITEM_FLAG")));
             addwms.getColMap().put("WSI_ITEM_SN",String.valueOf(list.get(0).get("WSI_ITEM_SN")).equals("null")?"":String.valueOf(list.get(0).get("WSI_ITEM_SN")));
             addwms.getColMap().put("WSI_LIGHT_FLAG",String.valueOf(list.get(0).get("WSI_LIGHT_FLAG")).equals("null")?"":String.valueOf(list.get(0).get("WSI_LIGHT_FLAG")));
             addwms.getColMap().put("WSI_LOT_NO",String.valueOf(list.get(0).get("WSI_LOT_NO")).equals("null")?"":String.valueOf(list.get(0).get("WSI_LOT_NO")));
             addwms.getColMap().put("WSI_MANUFACTURER",String.valueOf(list.get(0).get("WSI_MANUFACTURER")).equals("null")?"":String.valueOf(list.get(0).get("WSI_MANUFACTURER")));
             if (StringUtils.isNotBlank(String.valueOf(list.get(0).get("WSI_PRODUCE_DATE"))))
            {
               addwms.getColMap().put("WSI_PRODUCE_DATE",DateUtil.parseDate(String.valueOf(list.get(0).get("WSI_PRODUCE_DATE"))));
            }
             
             addwms.getColMap().put("WSI_RECEIVE_EMP",String.valueOf(list.get(0).get("WSI_RECEIVE_EMP")).equals("null")?"":String.valueOf(list.get(0).get("WSI_RECEIVE_EMP")));
             if (StringUtils.isNotBlank(String.valueOf(list.get(0).get("WSI_RECEIVE_TIME"))))
             {
               addwms.getColMap().put("WSI_RECEIVE_TIME",DateUtil.parseDate(String.valueOf(list.get(0).get("WSI_RECEIVE_TIME"))));
             }
             
             addwms.getColMap().put("WSI_RETURN_FLAG",String.valueOf(list.get(0).get("WSI_RETURN_FLAG")).equals("null")?"":String.valueOf(list.get(0).get("WSI_RETURN_FLAG")));
             addwms.getColMap().put("WSI_SALE_DOC",String.valueOf(list.get(0).get("WSI_SALE_DOC")).equals("null")?"":String.valueOf(list.get(0).get("WSI_SALE_DOC")));
             addwms.getColMap().put("WSI_SCARP_FLAG",String.valueOf(list.get(0).get("WSI_SCARP_FLAG")).equals("null")?"":String.valueOf(list.get(0).get("WSI_SCARP_FLAG")));
             addwms.getColMap().put("WSI_SECOND_SN",String.valueOf(list.get(0).get("WSI_SECOND_SN")).equals("null")?"":String.valueOf(list.get(0).get("WSI_SECOND_SN")));
             addwms.getColMap().put("WSI_STOCK_FLAG",String.valueOf(list.get(0).get("WSI_STOCK_FLAG")).equals("null")?"":String.valueOf(list.get(0).get("WSI_STOCK_FLAG")));
             addwms.getColMap().put("WSI_STORAGE_CODE",String.valueOf(list.get(0).get("WSI_STORAGE_CODE")).equals("null")?"":String.valueOf(list.get(0).get("WSI_STORAGE_CODE")));
             addwms.getColMap().put("WSI_SUP_CODE",String.valueOf(list.get(0).get("WSI_SUP_CODE")).equals("null")?"":String.valueOf(list.get(0).get("WSI_SUP_CODE")));
             addwms.getColMap().put("WSI_SUP_TRACE",String.valueOf(list.get(0).get("WSI_SUP_TRACE")).equals("null")?"":String.valueOf(list.get(0).get("WSI_SUP_TRACE")));
             if (StringUtils.isNotBlank(String.valueOf(list.get(0).get("WSI_TEST_TIME"))))
            {
               addwms.getColMap().put("WSI_TEST_TIME",DateUtil.parseDate(String.valueOf(list.get(0).get("WSI_TEST_TIME"))));
            }            
             addwms.getColMap().put("WSI_THIRD_SN",String.valueOf(list.get(0).get("WSI_THIRD_SN")).equals("null")?"":String.valueOf(list.get(0).get("WSI_THIRD_SN")));
             addwms.getColMap().put("WSI_VMI_FLAG",String.valueOf(list.get(0).get("WSI_VMI_FLAG")).equals("null")?"":String.valueOf(list.get(0).get("WSI_VMI_FLAG")));
             addwms.getColMap().put("WSI_WH_CODE",String.valueOf(list.get(0).get("WSI_WH_CODE")).equals("null")?"":String.valueOf(list.get(0).get("WSI_WH_CODE")));
             
             modelService.save(addwms);  
             
             TableDataMapExt delwms = new TableDataMapExt();
             delwms.setTableName("T_WMS_STOCK_INFO");
             List<Object> wList = new ArrayList<Object>();
             delwms.setSqlWhere(" and WSI_ITEM_SN=?");
             wList.add(lists.get(i).get("WOD_ITEM_SN").toString());
             delwms.setSqlWhereArgs(wList);
             modelService.del(delwms);
             
          }
          
        }
        
      }

    }
    catch (Exception ex)
    {
      log.info("getDullStock:" + ex.toString());
      return false;
    }
    return true;
  }
}
