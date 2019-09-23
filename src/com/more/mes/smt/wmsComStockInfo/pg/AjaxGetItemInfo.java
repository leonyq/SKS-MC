package com.more.mes.smt.wmsComStockInfo.pg;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 齐套库存
 * 
 * @author development
 */
public class AjaxGetItemInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("dataAuth");
    String boomId = request.getParameter("boomId");
    String searchSql = ""; // 查询条件

   /* if (StringUtils.isNotBlank(boomId))
    {
      searchSql += " AND T.PM_PROJECT_ID = '" + boomId + "'";
    }*/
    try
    {
      if (StringUtils.isNotBlank(boomId))
      {
        String[] boomIds = boomId.split(",");
        String tempStr = "";
        int length = boomIds.length;
        for (int i = 0; i < length; i++ )
        {
          if (i==0)
          {
            tempStr += boomIds[i];
          }else {
            tempStr += "','"+boomIds[i] ;
          }
          
        }
        searchSql += " and T.PM_PROJECT_ID in ('" + tempStr + "')";
      }

      String sql = "SELECT DISTINCT T.DATA_AUTH DATA_AUTH, " + " T.PM_MO_NUMBER PROJECT_ID, "
                   + " T1.CBD_ITEM_CODE ITEM_CODE, " + " T2.CI_ITEM_NAME ITEM_NAME, "
                   + " T2.CI_ITEM_SPEC ITEM_SPEC, " + " T.PM_TARGET_QTY, " + " T1.CBD_ITEM_NUM, "
                   + " COALESCE(T1.CBD_ITEM_NUM, 0) * COALESCE(T.PM_TARGET_QTY, 0) TOTAL_NUM, "
                   + " COALESCE(T3.WSI_ITEM_NUM, 0) ITEM_NUM, " + " T4.ITEM_STATUS, "
                   + " T4.COMPLETE_NUM, " + " COALESCE(T3.TOTAL_ITEM_NUM, 0) TOTAL_ITEM_NUM "
                   + " FROM T_PM_MO_BASE T " + " LEFT JOIN T_PM_PROJECT_DETAIL T1 "
                   + " ON T.PM_PROJECT_ID = T1.PROJECT_ID " + " LEFT JOIN T_CO_ITEM T2 "
                   + " ON T1.CBD_ITEM_CODE = T2.CI_ITEM_CODE "
                   + " LEFT JOIN (SELECT I.WSI_ITEM_CODE, " + " I.WSI_ITEM_NUM, "
                   + " COALESCE(I.TOTAL_ITEM_NUM, 0) TOTAL_ITEM_NUM " + " FROM (SELECT M.WSI_ITEM_CODE, "
                   + " COALESCE(M.WSI_ITEM_NUM, 0) TOTAL_ITEM_NUM, "
                   + " COALESCE(M.WSI_ITEM_NUM, 0) - COALESCE(J.WLD_LOCK_NUM, 0) WSI_ITEM_NUM "
                   + " FROM (SELECT A.WSI_ITEM_CODE, " + " SUM(A.WSI_ITEM_NUM) WSI_ITEM_NUM "
                   + " FROM T_WMS_STOCK_INFO A " + " WHERE (A.WSI_STOCK_FLAG = '2' OR "
                   + " A.WSI_STOCK_FLAG = '6') " + " AND A.WSI_INSPECT_FLAG = 'Y' "
                   + " AND A.WSI_FREEZE_FLAG = 'N' " + " GROUP BY A.WSI_ITEM_CODE) M "
                   + " LEFT JOIN (SELECT G.WLD_ITEM_CODE, " + " SUM(G.WLD_LOCK_NUM) WLD_LOCK_NUM "
                   + " FROM T_WMS_LOCKSTOCK_DETAIL G " + " LEFT JOIN T_WMS_LOCKSTOCK_DOC H "
                   + " ON G.WLD_LOCK_DOC = H.WLD_LOCK_DOC " + " AND H.WLD_LOCK_STATUS = '1' "
                   + " WHERE G.WLD_LOCK_STATUS = '1' " + " GROUP BY G.WLD_ITEM_CODE) J "
                   + " ON M.WSI_ITEM_CODE = J.WLD_ITEM_CODE) I "
                   + " LEFT JOIN T_WMS_LOCKSTOCK_DETAIL G "
                   + " ON I.WSI_ITEM_CODE = G.WLD_ITEM_CODE " + " LEFT JOIN T_WMS_LOCKSTOCK_DOC H "
                   + " ON G.WLD_LOCK_DOC = H.WLD_LOCK_DOC " + " AND H.WLD_LOCK_STATUS = '2') T3 "
                   + " ON T1.CBD_ITEM_CODE = T3.WSI_ITEM_CODE "
                   + " LEFT JOIN (SELECT DISTINCT R.PM_MO_NUMBER, " + " S.WSI_ITEM_NUM ITEM_NUM, "
                   + " CASE " + " WHEN COALESCE(S.WSI_ITEM_NUM, 0) = 0 THEN " + " '2' "
                   + " WHEN COALESCE(S.WSI_ITEM_NUM, 0) >= " + " COALESCE(U.CBD_ITEM_NUM, 0) * "
                   + " COALESCE(R.PM_TARGET_QTY, 0) THEN " + " '1' " + " ELSE " + " '2' "
                   + " END ITEM_STATUS, " + " CASE " + " WHEN COALESCE(S.WSI_ITEM_NUM, 0) = 0 THEN "
                   + "  0 " + " WHEN COALESCE(S.WSI_ITEM_NUM, 0) >= " + " COALESCE(U.CBD_ITEM_NUM, 0) * "
                   + " COALESCE(R.PM_TARGET_QTY, 0) THEN " + " R.PM_TARGET_QTY " + " ELSE "
                   + " ROUND(S.WSI_ITEM_NUM / U.CBD_ITEM_NUM) " + " END COMPLETE_NUM "
                   + " FROM (SELECT K.PM_MO_NUMBER, " + " L.WSI_ITEM_CODE, "
                   + " COALESCE(L.WSI_ITEM_NUM, 0) WSI_ITEM_NUM, "
                   + " RANK() OVER(PARTITION BY K.PM_MO_NUMBER ORDER BY COALESCE(L.WSI_ITEM_NUM, 0)) RN "
                   + " FROM T_PM_MO_BASE K " + " LEFT JOIN T_PM_PROJECT_DETAIL Q "
                   + " ON Q.PROJECT_ID = K.PM_PROJECT_ID " + " LEFT JOIN (SELECT F.WSI_ITEM_CODE, "
                   + " COALESCE(F.WSI_ITEM_NUM, 0) WSI_ITEM_NUM " + " FROM (SELECT D.WSI_ITEM_CODE, "
                   + " COALESCE(D.WSI_ITEM_NUM, 0) - " + " COALESCE(E.WLD_LOCK_NUM, 0) WSI_ITEM_NUM "
                   + " FROM (SELECT A.WSI_ITEM_CODE, " + " SUM(A.WSI_ITEM_NUM) WSI_ITEM_NUM "
                   + " FROM T_WMS_STOCK_INFO A " + " WHERE (A.WSI_STOCK_FLAG = '2' OR "
                   + " A.WSI_STOCK_FLAG = '6') " + " AND A.WSI_INSPECT_FLAG = 'Y' "
                   + " AND A.WSI_FREEZE_FLAG = 'N' " + " GROUP BY A.WSI_ITEM_CODE) D "
                   + " LEFT JOIN (SELECT B.WLD_ITEM_CODE, " + " SUM(B.WLD_LOCK_NUM) WLD_LOCK_NUM "
                   + " FROM T_WMS_LOCKSTOCK_DETAIL B " + " LEFT JOIN T_WMS_LOCKSTOCK_DOC C "
                   + " ON B.WLD_LOCK_DOC = " + " C.WLD_LOCK_DOC " + " AND C.WLD_LOCK_STATUS = '1' "
                   + " WHERE B.WLD_LOCK_STATUS = '1' " + " GROUP BY B.WLD_ITEM_CODE) E "
                   + " ON D.WSI_ITEM_CODE = " + " E.WLD_ITEM_CODE) F) L "
                   + " ON Q.CBD_ITEM_CODE = L.WSI_ITEM_CODE) S " + " LEFT JOIN T_PM_MO_BASE R "
                   + " ON R.PM_MO_NUMBER = S.PM_MO_NUMBER " + " LEFT JOIN T_PM_PROJECT_DETAIL U "
                   + " ON R.PM_PROJECT_ID = U.PROJECT_ID "
                   + " AND S.WSI_ITEM_CODE = U.CBD_ITEM_CODE " + " WHERE RN = 1) T4 "
                   + " ON T4.PM_MO_NUMBER = T.PM_MO_NUMBER " + " WHERE T1.CBD_ITEM_NUM IS NOT NULL "
                   + " AND (T.PM_MO_NUMBER, T1.CBD_ITEM_CODE) NOT IN "
                   + " (SELECT T5.WLD_PROJECT_ID, L.WLD_ITEM_CODE "
                   + " FROM T_WMS_LOCKSTOCK_DETAIL L " + " LEFT JOIN T_WMS_LOCKSTOCK_DOC T5 "
                   + " ON L.wld_lock_doc = T5.WLD_LOCK_DOC " + " WHERE L.WLD_LOCK_STATUS = '1') "
                   + " AND 1 = 1 ";

      String querySql = " select * from(" + sql + searchSql + ") as w ";
      List itemList = modelService.listSql(querySql, modelAction.getPage(), null, null, null, null);
      modelAction.setAjaxPage(modelAction.getPage());
      modelAction.getAjaxPage().setDataList(itemList);
    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error("查询失败",e );
      throw new BussException(modelAction.getText("查询失败"), e);
    }
   
    return BaseActionSupport.AJAX;
  }
}
