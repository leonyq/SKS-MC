package com.more.mes.smt.wmsreceivemanager;

import java.text.SimpleDateFormat;
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

import examples.newsgroups;

/**
 * 保存修改的完工入库信息
 * 
 * @author development
 */
public class SaveEditFinishReceive implements FuncService
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
      String wrdDocNum = request.getParameter("docNum");// 入库单号
      String wrdDispatchSn = request.getParameter("paraMapObj.T2#WRD_DISPATCH_SN");// 收发类型
      String wpdDeliveryDate = request.getParameter("paraMapObj.T2#WPD_DELIVERY_DATE");// 入库日期
      String wrdUrgentFlag = request.getParameter("paraMapObj.T2#WRD_URGENT_FLAG");// 紧急标志
      String wrdSupCode = request.getParameter("paraMapObj.T2#WRD_CUST_CODE");// 客户
      String wrdMemo = request.getParameter("paraMapObj.T2#WRD_MEMO");// 备注
      String delIds = request.getParameter("delIds");// 删除的id
      String[] strArray=new String[] {};
      if(delIds!=null && !delIds.equals("")) {
  	  strArray = delIds.split(",");
      }
      String[] itemIds = request.getParameterValues("itemId");// 物料ID
      String[] itemCodes = request.getParameterValues("CI_ITEM_CODE");// 物料料号
      String[] planNums = request.getParameterValues("PLAN_NUM");// 计划数量
      String[] packNums = request.getParameterValues("MIN_PACK");// 标准包装数量
      String[] itemSeqs = request.getParameterValues("ITEM_SEQ");// 项次
      String[] wpiPos = request.getParameterValues("WPI_PO");// 工单号
      String[] wmsSelects = request.getParameterValues("wmsSelect");// 仓库
      String[] lotNos = request.getParameterValues("WRI_LOT_NO");// 生产批号
      String[] productDates = request.getParameterValues("WRI_PRODUCE_DATE");// 生产日期
      // 判断机种料号是否有相同的
      for (int i = 0; i < itemCodes.length; i++ )
      {
        for (int j = i + 1; j < itemCodes.length; j++ )
        {
          if (itemCodes[i].equals(itemCodes[j]))
          { // 如果机种料号相同则判断项次
            if (itemSeqs[i].equals(itemSeqs[j]))
            {
              return modelAction.alertParentInfo(modelAction.getText("相同机种料号,项次需不同"));
            }
          }
        }
      }
      if (wrdUrgentFlag == null || wrdUrgentFlag == "" || wrdUrgentFlag.equals(""))
      {
    	  wrdUrgentFlag = "N";
      }
      // 如果是原本的物料 则判断计划数量是否大于入库数量
      String sql = "select WRI_RECEIVE_NUM from T_WMS_RECEIVE_ITEM where id=? ";
      List<Map> pList = null;
      if(itemIds!=null){
      for (int i = 0; i < itemIds.length; i++ )
      {
        if (!itemIds[i].equals(""))
        {
          pList = modelService.listDataSql(sql, new Object[] {itemIds[i]});
          if(pList!=null &&!pList.isEmpty()) {
        	  if (pList.get(0).get("WRI_RECEIVE_NUM") != null)
              {
                if (Integer.parseInt(planNums[i]) < Integer.parseInt(pList.get(0).get(
                  "WRI_RECEIVE_NUM").toString()))
                {
                  return modelAction.alertParentInfo(modelAction.getText("计划数量应大于入库数量"));
                }
              } 
          }
        }
      }}
      // 修改仓库单据信息表数据
      List<Object> lists = new ArrayList<Object>();
      TableDataMapExt wms = new TableDataMapExt();
      wms.setTableName("T_WMS_DOC_INFO");
      CommMethod.editSysDefCol(wms.getColMap(), modelAction.getUser());
      wms.setSqlWhere(" and WDI_DOC_NUM=? and DATA_AUTH=? ");
      lists.add(wrdDocNum);
      lists.add(dataAuth);
      wms.setSqlWhereArgs(lists);
      wms.getColMap().put("WDI_URGENT_FLAG", wrdUrgentFlag);
      wms.getColMap().put("WDI_CUST_CODE", wrdSupCode);
      wms.getColMap().put("WDI_DISPATCH_TYPE", wrdDispatchSn);
      wms.getColMap().put("WDI_MEMO", wrdMemo);
      if (dataAuth != null)
      {
        wms.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.edit(wms);
      // 修改入库单信息

      TableDataMapExt receive = new TableDataMapExt();
      receive.setTableName("T_WMS_RECEIVE_DOC");
      CommMethod.editSysDefCol(receive.getColMap(), modelAction.getUser());
      receive.setSqlWhere(" and WRD_DOC_NUM=? AND DATA_AUTH=? ");
      lists.clear();
      lists.add(wrdDocNum);
      lists.add(dataAuth);
      receive.setSqlWhereArgs(lists);
      receive.getColMap().put("WRD_CUST_CODE", wrdSupCode);
      if (!wpdDeliveryDate.equals(""))
      {
        receive.getColMap().put("WPD_DELIVERY_DATE", sdf2.parse(wpdDeliveryDate));
      }
      receive.getColMap().put("WRD_URGENT_FLAG", wrdUrgentFlag);
      receive.getColMap().put("WRD_DISPATCH_SN", wrdDispatchSn);
      receive.getColMap().put("WRD_MEMO", wrdMemo);
      if (dataAuth != null)
      {
        receive.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.edit(receive);
      // 先删除对应入库单物料信息
      if (!delIds.equals(""))
      {
        String delSql = "delete from T_WMS_RECEIVE_ITEM where id=? ";
        for (int i = 0; i < strArray.length; i++ )
        {
          modelService.execSql(delSql, new Object[] {strArray[i]});
        }
      }
      // 插入入库单物料信息
      TableDataMapExt receive1 = new TableDataMapExt();
      receive1.setTableName("T_WMS_RECEIVE_ITEM");
      for (int i = 0; i < itemCodes.length; i++ )
      {
        if (itemIds!=null && i<itemIds.length && !itemIds[i].equals(""))
        { // 修改数据
          receive1.getColMap().clear();
          CommMethod.editSysDefCol(receive1.getColMap(), modelAction.getUser());
          lists.clear();
          receive1.setSqlWhere(" and id =?");
          lists.add(itemIds[i]);
          receive1.setSqlWhereArgs(lists);
          receive1.getColMap().put("WRI_ITEM_SEQ", Integer.valueOf(itemSeqs[i]));
          receive1.getColMap().put("WRI_PLAN_NUM", Integer.valueOf(planNums[i]));
          receive1.getColMap().put("WRI_PACK_NUM", Integer.valueOf(packNums[i]));
          receive1.getColMap().put("WRI_CONNECT_DOC", wpiPos[i]);
          receive1.getColMap().put("WRI_WH_CODE", wmsSelects[i]);
          receive1.getColMap().put("WRI_LOT_NO", lotNos[i]);
          if (!productDates[i].equals(""))
          {
            receive1.getColMap().put("WRI_PRODUCE_DATE", sdf2.parse(productDates[i]));
          }
          else
          {
            receive1.getColMap().put("WRI_PRODUCE_DATE", null);
          }
          if (dataAuth != null)
          {
            receive1.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.edit(receive1);
        }
        else
        {
          receive1.getColMap().clear();
          CommMethod.addSysDefCol(receive1.getColMap(), modelAction.getUser());
          receive1.getColMap().put("ID", StringUtils.getUUID());
          receive1.getColMap().put("WRI_DOC_NUM", wrdDocNum);
          receive1.getColMap().put("WRI_STATUS", "1");
          receive1.getColMap().put("WRI_ITEM_CODE", itemCodes[i]);
          receive1.getColMap().put("WRI_ITEM_SEQ", Integer.valueOf(itemSeqs[i]));
          receive1.getColMap().put("WRI_PLAN_NUM", Integer.valueOf(planNums[i]));
          receive1.getColMap().put("WRI_PACK_NUM", Integer.valueOf(packNums[i]));
          receive1.getColMap().put("WRI_CONNECT_DOC", wpiPos[i]);
          receive1.getColMap().put("WRI_WH_CODE", wmsSelects[i]);
          receive1.getColMap().put("WRI_LOT_NO", lotNos[i]);
          if (!productDates[i].equals(""))
          {
            receive1.getColMap().put("WRI_PRODUCE_DATE", sdf2.parse(productDates[i]));
          }
          if (dataAuth != null)
          {
            receive1.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.save(receive1);
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
