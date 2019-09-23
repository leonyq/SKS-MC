package com.more.mes.smt.wmsOutStockManager;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 删除采购入库信息
 * 
 * @author development
 */
public class DelTallyStockDoc implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    try
    {
      String delId = request.getParameter("delId");// 需要删除的id
      String[] strArray = delId.split(",");
      // 判断删除的id有没有明细
      String sql1 = "SELECT T.WOI_ITEM_CODE,T.WOI_DOC_NUM FROM T_WMS_OUTSTOCK_ITEM T WHERE T.ID = ?";
      String sql2 = "SELECT T.WOD_ITEM_CODE " + " FROM T_WMS_OUTSTOCK_DETAIL T "
                    + " LEFT JOIN T_WMS_OUTSTOCK_ITEM T1 " + " ON T.WOD_DOC_NUM = T1.WOI_DOC_NUM "
                    + " AND T.WOD_ITEM_CODE = T1.WOI_ITEM_CODE " + " WHERE T.WOD_ITEM_CODE = ? "
                    + " AND T1.ID = ? ";
      List<Map> itemList = null;
      String itemCode = null;
      for (int i = 0; i < strArray.length; i++ )
      {
        itemList = modelService.listDataSql(sql1, new Object[] {strArray[i]});
        if (itemList != null && !itemList.isEmpty())
        {
          itemCode = (String)itemList.get(0).get("WOI_ITEM_CODE");
          int count = modelService.execSql(sql2, new Object[] {itemCode, strArray[i]});
          if (count != 0)
          {
            return modelAction.alertParentInfo(modelAction.getText("不能删除有出库总明细的出库单"));
          }
        }
      }
      TableDataMapExt delwms1 = new TableDataMapExt();
      delwms1.setTableName("T_WMS_OUTSTOCK_ITEM");
      for (int i = 0; i < strArray.length; i++ )
      {
        delwms1.setSqlWhere(" and ID= ?");
        modelService.del(delwms1);
      }
      // 删除没有关联的采购单信息 即当该单号所关联的物料全部被删除时删除采购信息
      String sql = "DELETE FROM T_WMS_DOC_INFO T " + " WHERE T.WDI_DOC_NUM IN "
                   + " (SELECT T1.WOD_DOC_NUM " + " FROM T_WMS_OUTSTOCK_DOC T1 "
                   + " WHERE NOT EXISTS (SELECT T2.WOI_DOC_NUM " + " FROM T_WMS_OUTSTOCK_ITEM T2 "
                   + " WHERE T1.WOD_DOC_NUM = T2.WOI_DOC_NUM) AND T1.WOD_DOC_TYPE='DJ15') ";
      modelService.execSql(sql, null);
      // 删除没有关联的仓库单据信息表数据息 即当该单号所关联的物料全部被删除时删除仓库单据信息表数据
      String sql3 = "DELETE FROM T_WMS_OUTSTOCK_DOC T " + " WHERE T.WOD_DOC_NUM IN "
                    + " (SELECT T1.WDI_DOC_NUM " + " FROM T_WMS_DOC_INFO T1 "
                    + " WHERE NOT EXISTS (SELECT T2.WOI_DOC_NUM "
                    + " FROM T_WMS_OUTSTOCK_ITEM T2 "
                    + " WHERE T1.WDI_DOC_NUM = T2.WOI_DOC_NUM)) AND T.WOD_DOC_TYPE='DJ15'";
      modelService.execSql(sql3, null);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("删除失败"), e);
    }
    return modelAction.reloadParent(modelAction.getText("删除成功"));
  }

}
