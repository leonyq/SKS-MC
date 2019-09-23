package com.more.mes.smt.wmsScrapItem;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 删除采购入库信息
 * 
 * @author development
 */
public class DelScrapItem implements FuncService
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

      TableDataMapExt delwms1 = new TableDataMapExt();
      delwms1.setTableName("T_WMS_SCARP_DETAIL");
      for (int i = 0; i < strArray.length; i++ )
      {
        // 保存库存信息
        List<Map<String, Object>> stockList = null;
        String stockSql = "SELECT T.* " + " FROM T_WMS_STOCK_INFO_L T "
                          + " LEFT JOIN T_WMS_SCARP_DETAIL T1 "
                          + " ON T.WSI_ITEM_SN = T1.WSD_ITEM_SN " + " WHERE T1.ID = ?";
        stockList = modelService.listDataSql(stockSql, new Object[] {strArray[i]});
        if (stockList != null && !stockList.isEmpty())
        {
          // 保存库存信息
          TableDataMapExt stockInfoMap2 = new TableDataMapExt();
          stockInfoMap2.setTableName("T_WMS_STOCK_INFO");
          CommMethod.addSysDefCol(stockInfoMap2.getColMap(), modelAction.getUser());
          stockInfoMap2.setColMap(stockList.get(0));
          stockInfoMap2.getColMap().put("ID", StringUtils.getUUID());
          modelService.save(stockInfoMap2);
        }
        delwms1.setSqlWhere(" and ID=? ");
        List<Object> wList = new ArrayList<Object>();
        wList.add(strArray[i]);
        delwms1.setSqlWhereArgs(wList);
        modelService.del(delwms1);
      }
      // 删除没有关联的报废单信息 即当该单号所关联的物料全部被删除时删除采购信息
      String sql = "DELETE FROM T_WMS_SCARP_DOC T " + " WHERE T.WSD_DOC_NUM IN "
                   + " (SELECT T1.WDI_DOC_NUM " + " FROM T_WMS_DOC_INFO T1 "
                   + " WHERE NOT EXISTS (SELECT T2.WSD_DOC_NUM " + " FROM T_WMS_SCARP_DETAIL T2 "
                   + " WHERE T1.WDI_DOC_NUM = T2.WSD_DOC_NUM))";
      modelService.execSql(sql, null);
      // 删除没有关联的仓库单据信息表数据息 即当该单号所关联的物料全部被删除时删除仓库单据信息表数据
      String sql3 = "DELETE FROM T_WMS_DOC_INFO T1 " + " WHERE T1.WDI_DOC_NUM IN "
                    + " (SELECT T.WSD_DOC_NUM " + " FROM T_WMS_SCARP_DOC T "
                    + " WHERE NOT EXISTS (SELECT T2.WSD_DOC_NUM " + " FROM T_WMS_SCARP_DETAIL T2 "
                    + " WHERE T.WSD_DOC_NUM = T2.WSD_DOC_NUM))";
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
