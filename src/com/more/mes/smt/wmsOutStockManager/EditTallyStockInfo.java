package com.more.mes.smt.wmsOutStockManager;

import java.text.SimpleDateFormat;
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
 * 保存修改的采购入库信息
 * 
 * @author development
 */
public class EditTallyStockInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
      String docNum = request.getParameter("docNum");// 入库单号
      String wodDispatchSn = request.getParameter("paraMapObj.T2#WOD_DISPATCH_SN");// 收发类型
      String wodDeliveryDate = request.getParameter("paraMapObj.T2#WOD_OUTSTOCK_DATE");// 出库日期
      String wodUrgentFlag = request.getParameter("paraMapObj.T2#WOD_URGENT_FLAG");// 紧急标志
      String wodMemo = request.getParameter("paraMapObj.T2#WOD_MEMO");// 备注
      String supCode = request.getParameter("paraMapObj.T2#WOD_SUP_CODE");// 供应商
      String[] itemCodes = request.getParameterValues("ITEM_CODE");// 物料料号
      String[] planNums = request.getParameterValues("PLAN_NUM");// 计划数量
      String[] packNums = request.getParameterValues("MIN_PACK");// 标准包装数量
      String[] wmsSelects = request.getParameterValues("wmsSelect");// 仓库
      String[] deliveryDate = request.getParameterValues("OUTSTOCK_DATE");// 出库日期
      String delIds = request.getParameter("delIds");// 删除的id
      String[] strArray = delIds.split(",");
      String[] itemIds = request.getParameterValues("itemId");// 物料ID
      // 如果是原本的物料 则判断计划数量是否大于入库数量
      String sql = "select WOI_OUT_NUM from T_WMS_OUTSTOCK_ITEM where id=? ";
      List<Map> pList = null;
      for (int i = 0; i < itemIds.length; i++ )
      {
        if (!itemIds[i].equals(""))
        {
          pList = modelService.listDataSql(sql, new Object[] {itemIds[i]});
          if (pList.get(0).get("WOI_OUT_NUM") != null)
          {
            if (Integer.parseInt(planNums[i]) < Integer.parseInt(pList.get(0).get("WOI_OUT_NUM").toString()))
            {
              return modelAction.alertParentInfo(modelAction.getText("计划数量应大于出库数量"));
            }
          }
        }
      }
      if (wodUrgentFlag == null || wodUrgentFlag == "" || wodUrgentFlag.equals(""))
      {
        wodUrgentFlag = "N";
      }
      // 修改仓库单据信息
      TableDataMapExt wms = new TableDataMapExt();
      wms.setTableName("T_WMS_DOC_INFO");
      CommMethod.editSysDefCol(wms.getColMap(), modelAction.getUser());
      wms.getColMap().put("WDI_URGENT_FLAG", wodUrgentFlag);
      wms.getColMap().put("WDI_SUP_CODE", supCode);
      wms.getColMap().put("WDI_DISPATCH_TYPE", wodDispatchSn);
      wms.setSqlWhere(" and WDI_DOC_NUM= ?");
      wms.getColMap().put("WDI_MEMO", wodMemo);
      if (dataAuth != null)
      {
        wms.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.edit(wms);
      // 修改入库单信息
      TableDataMapExt outStock = new TableDataMapExt();
      outStock.setTableName("T_WMS_OUTSTOCK_DOC");
      CommMethod.editSysDefCol(outStock.getColMap(), modelAction.getUser());
      outStock.setSqlWhere(" and WOD_DOC_NUM= ?");
      if (!wodDeliveryDate.equals(""))
      {
        outStock.getColMap().put("WOD_OUTSTOCK_DATE", sdf2.parse(wodDeliveryDate));
      }
      outStock.getColMap().put("WOD_URGENT_FLAG", wodUrgentFlag);
      outStock.getColMap().put("WOD_DISPATCH_SN", wodDispatchSn);
      outStock.getColMap().put("WOD_MEMO", wodMemo);
      outStock.getColMap().put("WOD_SUP_CODE", supCode);// 客户
      if (dataAuth != null)
      {
        outStock.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.edit(outStock);
      // 先删除对应入库单物料信息
      if (!delIds.equals(""))
      {
        String delSql = "delete from T_WMS_OUTSTOCK_ITEM where id=? ";
        for (int i = 0; i < strArray.length; i++ )
        {
          modelService.execSql(delSql, new Object[] {strArray[i]});
        }
      }
      // 插入入库单物料信息
      TableDataMapExt outStockItem = new TableDataMapExt();
      outStockItem.setTableName("T_WMS_OUTSTOCK_ITEM");

      for (int i = 0; i < itemCodes.length; i++ )
      {
        if (!itemIds[i].equals(""))
        { // 修改数据
          CommMethod.editSysDefCol(outStockItem.getColMap(), modelAction.getUser());
          outStockItem.getColMap().clear();
          outStockItem.setSqlWhere(" and id = ?");
          outStockItem.getColMap().put("WOI_PLAN_NUM", planNums[i]);// 计划数量
          outStockItem.getColMap().put("WOI_WH_CODE", wmsSelects[i]);// 仓库代码
          outStockItem.getColMap().put("WOI_PACK_NUM", packNums[i]);// 标准包装数量
          if (!deliveryDate[i].equals(""))
          {
            outStockItem.getColMap().put("WOI_DELIVERY_DATE", sdf2.parse(deliveryDate[i]));
          }
          if (dataAuth != null)
          {
            outStockItem.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.edit(outStockItem);
        }
        else
        {
          outStockItem.getColMap().clear();
          CommMethod.addSysDefCol(outStockItem.getColMap(), modelAction.getUser());
          outStockItem.getColMap().put("ID", StringUtils.getUUID());
          outStockItem.getColMap().put("WOI_DOC_NUM", docNum);// 入库单号
          outStockItem.getColMap().put("WOI_STATUS", "1");// 物料状态
          outStockItem.getColMap().put("WOI_ITEM_CODE", itemCodes[i]);// 物料料号
          outStockItem.getColMap().put("WOI_PLAN_NUM", planNums[i]);// 计划数量
          outStockItem.getColMap().put("WOI_ITEM_SEQ", 0);// 项次
          outStockItem.getColMap().put("WOI_WH_CODE", wmsSelects[i]);// 仓库代码
          outStockItem.getColMap().put("WOI_MEMO", wodMemo);// 备注
          outStockItem.getColMap().put("WOI_PACK_NUM", packNums[i]);// 标准包装数量
          if (!deliveryDate[i].equals(""))
          {
            outStockItem.getColMap().put("WOI_DELIVERY_DATE", sdf2.parse(deliveryDate[i]));
          }
          if (dataAuth != null)
          {
            outStockItem.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.save(outStockItem);
        }
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
  }

}
