package com.more.mes.smt.wmsOutStockManager;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 关结采购入库信息
 * 
 * @author development
 */
public class CloseTallyStockDoc implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    try
    {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String delId = request.getParameter("delId");// 需要删除的id
      String[] strArray = delId.split(",");
      // 根据id获取单据号
      String sql1 = "SELECT T.WOI_DOC_NUM FROM T_WMS_OUTSTOCK_ITEM T WHERE T.ID = ?";
      List<Map> itemList = null;
      String docNum = null;
      TableDataMapExt delwms1 = new TableDataMapExt();
      delwms1.setTableName("T_WMS_OUTSTOCK_ITEM");
      TableDataMapExt receive = new TableDataMapExt();
      receive.setTableName("T_WMS_OUTSTOCK_DOC");
      TableDataMapExt wms = new TableDataMapExt();
      wms.setTableName("T_WMS_DOC_INFO");
      for (int i = 0; i < strArray.length; i++ )
      {
        itemList = modelService.listDataSql(sql1, new Object[] {strArray[i]});
        docNum = (String)itemList.get(0).get("WOI_DOC_NUM");
        delwms1.setSqlWhere(" and WOI_DOC_NUM= ?");
        delwms1.getColMap().put("WOI_STATUS", "3");
        modelService.edit(delwms1);
        receive.setSqlWhere(" and WOD_DOC_NUM= ?");
        receive.getColMap().put("WOD_STATUS", "3");
        receive.getColMap().put("WOD_CLOSE_MAN", CommMethod.getSessionUser().getId());
        receive.getColMap().put("WOD_CLOSE_TIME", sdf.parse(sdf.format(new Date())));
        modelService.edit(receive);
        wms.setSqlWhere(" and WDI_DOC_NUM= ?");
        wms.getColMap().put("WDI_STATUS", "3");
        wms.getColMap().put("WDI_CLOSE_MAN", CommMethod.getSessionUser().getId());
        wms.getColMap().put("WDI_CLOSE_TIME", sdf.parse(sdf.format(new Date())));
        modelService.edit(wms);
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("关结失败"), e);
    }
    return modelAction.reloadParent(modelAction.getText("关结成功"));
  }

}
