package com.more.mes.smt.wmssparekmanager;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @author development
 */
public class CheckSpareInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String addType = request.getParameter("addType");// 新增方式
    String itemSn = request.getParameter("itemSn");
    String itemCode = request.getParameter("itemCode");
    String itemNum = request.getParameter("itemNum");
    Map<String, Object> map = new HashMap<String, Object>();
    List<Map<String, Object>> resultList = null;
    try
    {

      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      if ("1".equals(addType))
      {
        // 个体
        String getStockInfoSql = "SELECT T.WSI_ITEM_SN,T.WSI_ITEM_CODE,T.WSI_ITEM_NUM,T.WSI_PRODUCE_DATE,T.WSI_RECEIVE_TIME,T.WSI_RECEIVE_EMP,"
                                 + " T1.CI_ITEM_NAME, T1.CI_ITEM_SPEC, T2.WST_STOCK_NUM,T2.WST_SINGLE_NUM, T3.NAME "
                                 + " FROM T_WMS_SPARE_INFO T "
                                 + " LEFT JOIN T_CO_ITEM T1 "
                                 + " ON T.WSI_ITEM_CODE = T1.CI_ITEM_CODE AND T1.DATA_AUTH=? "
                                 + " LEFT JOIN T_WMS_SPARE_TOTAL T2 "
                                 + " ON T.WSI_ITEM_CODE = T2.WST_ITEM_CODE "
                                 + " LEFT JOIN SY_USER T3 "
                                 + " ON T.WSI_RECEIVE_EMP = T3.ID "
                                 + " WHERE T.WSI_ITEM_SN = ? "
                                 + "AND T.DATA_AUTH=? "
                                 + "AND T2.DATA_AUTH=?  ";
        resultList = modelService.listDataSql(getStockInfoSql, new Object[] {dataAuth,itemSn,dataAuth,dataAuth});
        if (resultList == null || resultList.isEmpty())
        {
          map.put("FLAG", "FALSE");
          map.put("VALUE", modelAction.getText("物料不存在，请更换"));
          // return modelAction.alertParentInfo(modelAction.getText("物料不存在，请跟换"));
        }
        else
        {
          int spareNum = Integer.parseInt(StringUtils.toString(resultList.get(0).get(
            "WSI_ITEM_NUM")));
          if (spareNum < Integer.parseInt(itemNum))
          {
            map.put("FLAG", "FALSE");
            map.put("VALUE", modelAction.getText("领用数量不能大于库存数量"));
            // return modelAction.alertParentInfo(modelAction.getText("领用数量不能大于库存数量"));
          }
        }
      }
      else if ("2".equals(addType))
      {
        // 批量
        String spareSql = "SELECT T.WST_ITEM_CODE WSI_ITEM_CODE,T1.CI_ITEM_NAME,T1.CI_ITEM_SPEC,"+
                         "T.WST_RECEIVE_TIME AS WSI_RECEIVE_TIME,T.WST_RECEIVE_EMP AS WSI_RECEIVE_EMP, T3.NAME,  "+ 
                         "T.WST_PRODUCE_DATE AS WSI_PRODUCE_DATE, "+
                         "T.WST_LOT_NUM WSI_ITEM_NUM,T.WST_STOCK_NUM FROM T_WMS_SPARE_TOTAL T "+
                         "LEFT JOIN T_CO_ITEM T1 ON T.WST_ITEM_CODE=T1.CI_ITEM_CODE and T1.DATA_AUTH=? "+
                        " LEFT JOIN SY_USER T3 ON T.WST_RECEIVE_EMP = T3.ID "+
                         "WHERE T.WST_ITEM_CODE = ? AND T.DATA_AUTH=? ";
        resultList = modelService.listDataSql(spareSql, new Object[] {dataAuth,itemCode,dataAuth});
        if (resultList != null && !resultList.isEmpty())
        {
          // 修改个体数量
          int stockNum = Integer.parseInt(StringUtils.toString(resultList.get(0).get(
            "WSI_ITEM_NUM")));
          if (stockNum < Integer.parseInt(itemNum))
          {
            map.put("FLAG", "FALSE");
            map.put("VALUE", modelAction.getText("领用数量不能大于库存数量"));
            // return modelAction.alertParentInfo(modelAction.getText("领用数量不能大于库存数量"));
          }
        }
      }
    }catch (NumberFormatException e) {
		// TODO: handle exception
    	log.error(e);
        throw new BussException(modelAction.getText("格式转换错误"), e);
	}
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }
    CommMethod.mapToEscapeJs(map);
    CommMethod.listMapToEscapeJs(resultList);
    modelAction.setAjaxMap(map);
    modelAction.setAjaxList(resultList);
    return BaseActionSupport.AJAX;
  }

}
