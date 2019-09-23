
package com.more.mes.smt.wmsFreezeItem;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import javax.servlet.http.HttpServletRequest;
import com.more.fw.core.common.method.StringUtils;
 /**
  *要根据对应的视图模型/基础信息：视图公用类的名称来替换继承类SuperServer
  *
  */
public class AjaxPageItemSns  implements FuncService
{
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(request.getSession().getAttribute("mcDataAuth"));
		String startDate = modelAction.getParaMap().get("startDate");
        String endDate = modelAction.getParaMap().get("endDate");
        String itemSN = modelAction.getParaMap().get("itemSN");
        String itemCode = modelAction.getParaMap().get("itemCode");
        String whCode = modelAction.getParaMap().get("whCode");
        String custCode = modelAction.getParaMap().get("custCode");
        String supCode = modelAction.getParaMap().get("supCode");
        String lotNo = modelAction.getParaMap().get("lotNo");
        String productStartDate = modelAction.getParaMap().get("productStartDate");//生产开始时间
        String productEndDate = modelAction.getParaMap().get("productEndDate");//生产结束时间
        String connectDoc = modelAction.getParaMap().get("connectDoc");//关联表单
        String inspectSn = modelAction.getParaMap().get("inspectSn");//检验表单
		String type = request.getParameter("type");
		String sql = "SELECT DISTINCT T.WSI_ITEM_SN ITEM_SN "
                 + " FROM T_WMS_STOCK_INFO T "
                 + " LEFT JOIN T_QM_INSPECT_INFO T2 ON T.WSI_ITEM_CODE = T2.QII_ITEM_CODE and T2.DATA_AUTH=T.DATA_AUTH "
                 + " WHERE T.DATA_AUTH = ?";
        if(type.equals("1")){
            sql += " AND T.WSI_FREEZE_FLAG = 'N' ";
        }else{
            sql += " AND T.WSI_FREEZE_FLAG = 'Y' ";
        }
        List<Object> paramList = new ArrayList<>();
        paramList.add(dataAuth);
        if (StringUtils.isNotBlank(startDate) && StringUtils.isNotBlank(endDate))
            {
            	sql += "AND T.WSI_RECEIVE_TIME BETWEEN(TO_DATE(?,'yyyy-MM-dd HH24:mi:ss')) " +
            			"AND (TO_DATE(?,'yyyy-MM-dd HH24:mi:ss'))";
            	paramList.add(startDate);
            	paramList.add(startDate);
            	
            }
            else
            {
              if (StringUtils.isNotBlank(startDate))
              {
            	  sql += "AND T.WSI_RECEIVE_TIME >= TO_DATE(?,'yyyy-MM-dd HH24:mi:ss')";
            	  paramList.add(startDate);
              }
              if (StringUtils.isNotBlank(endDate))
              {
            	  sql += "AND T.WSI_RECEIVE_TIME <= TO_DATE(?,'yyyy-MM-dd HH24:mi:ss' )";
            	  paramList.add(endDate);
              }
            }
            if (StringUtils.isNotBlank(itemSN))
            {
            	sql += " AND T.WSI_ITEM_SN like '%' || ? || '%' ";
            	paramList.add(itemSN);
            }
            if (StringUtils.isNotBlank(itemCode))
            {
            	sql += " AND T.WSI_ITEM_CODE =? ";
            	paramList.add(itemCode);
            }
            if (StringUtils.isNotBlank(whCode))
            {
            	sql += " AND T.WSI_WH_CODE =? ";
            	paramList.add(whCode);
            }
            if (StringUtils.isNotBlank(custCode))
            {
            	sql += " AND T.WSI_CUST_CODE =? ";
            	paramList.add(custCode);
            }
            if (StringUtils.isNotBlank(supCode))
            {
            	sql += " AND T.WSI_SUP_CODE =? ";
            	paramList.add(supCode);
            }
            if (StringUtils.isNotBlank(lotNo))
            {
            	sql += " AND T.WSI_LOT_NO like '%' || ? || '%' ";
            	paramList.add(lotNo);
            }
            
            if (StringUtils.isNotBlank(productStartDate))
            {
            	sql += "AND T.WSI_PRODUCE_DATE >= TO_DATE(?,'yyyy-MM-dd') ";
            	paramList.add(productStartDate);
            }
            if (StringUtils.isNotBlank(productEndDate))
            {
            	sql += "AND T.WSI_PRODUCE_DATE <= TO_DATE(?,'yyyy-MM-dd' ) ";
            	paramList.add(productEndDate);
            }
            if (StringUtils.isNotBlank(connectDoc))
            {
            	sql += " AND T.WSI_CONNECT_DOC =? ";
            	paramList.add(connectDoc);
            }
            if (StringUtils.isNotBlank(inspectSn))
            {
            	sql += " AND T2.QII_INSPECT_SN =? ";
            	paramList.add(inspectSn);
            }
           
        Object[] params = paramList.toArray();   
        List itemSns = modelService.listDataSql(sql, params);
        modelAction.setAjaxPage(modelAction.getPage());
        CommMethod.listMapToEscapeJs(itemSns);
        modelAction.getAjaxPage().setDataList(itemSns);
		return BaseActionSupport.AJAX;
	}
}
