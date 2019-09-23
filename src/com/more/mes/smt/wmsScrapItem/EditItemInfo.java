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
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * 保存新增的生产领料信息
 * 
 * @author development
 */
public class EditItemInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    String formId = request.getParameter("formId");
    String docNum = request.getParameter("docNum");// 报废单号
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      String scrapType = request.getParameter("paraMapObj.T2#WAD_SCARP_TYPE");// 报废类型
      String whCode = request.getParameter("paraMapObj.T2#WAD_WH_CODE");// 报废仓库
      String scrapRes = request.getParameter("paraMapObj.T2#WAD_SCARP_REASON");// 报废原因
      String dutyDept = request.getParameter("paraMapObj.T2#WSD_DUTY_DEPT");// 责任部门
      String dutyEmp = request.getParameter("paraMapObj.T2#WSD_DUTY_EMP");// 责任人
      String[] itemSns = request.getParameterValues("ITEM_SN");// 物料SN
      String[] itemCodes = request.getParameterValues("ITEM_CODE");// 物料料号
      String[] itemNums = request.getParameterValues("ITEM_NUM");// 物料数量

      // 判断物料是否存在盘点物料
      for (int i = 0; i < itemSns.length; i++ )
      {
        String tempSql = "SELECT T.ID FROM T_WMS_STOCK_INFO T WHERE T.WSI_STOCK_FLAG ='5' AND T.WSI_ITEM_SN=?";
        List<String> result = modelService.listDataSql(tempSql, new Object[] {itemSns[i]});
        if (!(result == null) && !result.isEmpty())
        {
          return modelAction.alertParentInfo(modelAction.getText("已盘点的物料无法报废，请更换"));
        }
      }
      // 删除仓库物料明细表数据
      TableDataMapExt delwms = new TableDataMapExt();
      delwms.setTableName("T_WMS_SCARP_DETAIL");
      delwms.setSqlWhere(" and WSD_DOC_NUM=? and DATA_AUTH=? ");
      List<Object> wList = new ArrayList<Object>();
      wList.add(docNum);
      wList.add(dataAuth);
      delwms.setSqlWhereArgs(wList);
      modelService.del(delwms);

      // 修改仓库物料报废信息表数据
      TableDataMapExt wms = new TableDataMapExt();
      wms.setTableName("T_WMS_SCARP_DOC");
      CommMethod.editSysDefCol(wms.getColMap(), modelAction.getUser());
      wms.setSqlWhere(" and WSD_DOC_NUM=? and DATA_AUTH=? ");
      wms.setSqlWhereArgs(wList);
      wms.getColMap().put("WAD_SCARP_TYPE", scrapType);// 报废类型
      wms.getColMap().put("WAD_WH_CODE", whCode);// 报废仓库
      wms.getColMap().put("WAD_SCARP_REASON", scrapRes);// 报废原因
      wms.getColMap().put("WSD_DUTY_DEPT", dutyDept);// 责任部门
      wms.getColMap().put("WSD_DUTY_EMP", dutyEmp);// 责任人
      if (dataAuth != null)
      {
        wms.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.edit(wms);

      // 插入仓库报废物料明细信息
      TableDataMapExt scrapDetail = new TableDataMapExt();
      scrapDetail.setTableName("T_WMS_SCARP_DETAIL");
      for (int i = 0; i < itemCodes.length; i++ )
      {
    	scrapDetail.getColMap().clear();
        CommMethod.addSysDefCol(scrapDetail.getColMap(), modelAction.getUser());
        scrapDetail.getColMap().put("WSD_ITEM_SN", itemSns[i]);// 物料SN
        scrapDetail.getColMap().put("WSD_DOC_NUM", docNum);// 报废单号
        scrapDetail.getColMap().put("WSD_ITEM_CODE", itemCodes[i]);// 物料料号
        scrapDetail.getColMap().put("WSD_SCARP_NUM", Integer.parseInt(itemNums[i]));// 报废数量
        if (dataAuth != null)
        {
          scrapDetail.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.save(scrapDetail);
        String saveRes = saveStockInfo(itemSns[i], docNum,
          CommMethod.getSessionUser().getLoginName(), modelService);
        List<Map<String, Object>> stockList = null;
        List<Map<String, Object>> stockList2 = null;
        if ("OK".equals(saveRes))
        {
          String stockSql = "SELECT T.* FROM T_WMS_STOCK_INFO T WHERE T.WSI_ITEM_SN= ? and t.DATA_AUTH=? ";
          stockList = modelService.listDataSql(stockSql, new Object[] {itemSns[i],dataAuth});
          if (stockList != null)
          {
            if (!stockList.isEmpty())
            {
              // 保存日志信息 删除库存信息
              TableDataMapExt stockInfoMap = new TableDataMapExt();
              stockInfoMap.setTableName("T_WMS_STOCK_INFO_L");
              CommMethod.addSysDefCol(stockInfoMap.getColMap(), modelAction.getUser());
              stockInfoMap.setColMap(stockList.get(0));
              stockInfoMap.getColMap().put("ID", StringUtils.getUUID());
              modelService.save(stockInfoMap);

              TableDataMapExt delstock = new TableDataMapExt();
              delstock.setTableName("T_WMS_STOCK_INFO");
              delstock.setSqlWhere(" and WSI_ITEM_SN=? and DATA_AUTH=? ");
              List<Object> wList1 = new ArrayList<Object>();
              wList1.add(itemSns[i]);
              wList1.add(dataAuth);
              delstock.setSqlWhereArgs(wList);
              modelService.del(delstock);
            }
            else
            {
              String stockSql2 = "SELECT T.* FROM T_WMS_STOCK_INFO_L T WHERE T.WSI_ITEM_SN= ? and t.DATA_AUTH=? ";
              stockList2 = modelService.listDataSql(stockSql2, new Object[] {itemSns[i],dataAuth});
              if (stockList2 != null && !stockList2.isEmpty())
              {
                // 保存库存信息
                TableDataMapExt stockInfoMap2 = new TableDataMapExt();
                stockInfoMap2.setTableName("T_WMS_STOCK_INFO");
                CommMethod.addSysDefCol(stockInfoMap2.getColMap(), modelAction.getUser());
                stockInfoMap2.setColMap(stockList2.get(0));
                stockInfoMap2.getColMap().put("ID", StringUtils.getUUID());
                modelService.save(stockInfoMap2);
              }
            }

          }
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

  @SuppressWarnings("unchecked")
  public String saveStockInfo(String itemSN, String docNum, String userName,
                              ModelService modelService)
  {
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2, 3, 4, 5, 6};
    int[] outplace = {7};
    List<Object> list = new ArrayList<Object>();
    List<Object> outType = new ArrayList<Object>();
    list.add(itemSN);
    list.add("");
    list.add(null);
    list.add("报废");
    list.add(docNum);
    list.add(userName);
    outType.add("String");
    pf.setClassName("P_W_SAVE_TASK_LOG");// 保存日志信息
    pf.setInPlace(inPlace);// 存储过程中in
    pf.setOutPlace(outplace); // 存储过程中out
    pf.setValArgs(list);// 存储过程中输入的参数
    pf.setTotalLen(list.size() + outType.size());// 总个数
    pf.setOutValType(outType);// 输出的参数
    List<Object> relist = modelService.procComm(pf);// 接收返回值
    String res = (String)relist.get(0); // 结果
    return res;
  }

}
