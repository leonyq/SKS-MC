package com.more.mes.smt.wmssparekmanager;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
 * 根据选择的入库单的物料料号获取入库详细信息
 * 
 * @author development
 */
public class ScrapSpareInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    String addType = request.getParameter("addType");// 新增方式
    String itemSn = request.getParameter("paraMap1@0#WSS_ITEM_SN");
    String itemCode = request.getParameter("paraMap1@0#WSS_ITEM_CODE");
    String itemNum = request.getParameter("paraMap1@0#WSS_ITEM_NUM");
    String productDate = request.getParameter("paraMap1@0#WSS_PRODUCE_DATE");// 生产日期
    String memo = request.getParameter("paraMap1@0#WSS_MEMO");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String formId = request.getParameter("formId");
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String iframeId = request.getParameter("iframeId");
    List<Object> sqlWList = null;
    try
    {

      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      if ("1".equals(addType))
      {
        // 个体
        String getStockInfoSql = "SELECT T.* FROM T_WMS_SPARE_INFO T WHERE T.WSI_ITEM_SN=? AND T.DATA_AUTH=? ";
        List<Map<String, Object>> result1 = modelService.listDataSql(getStockInfoSql,
          new Object[] {itemSn,dataAuth});
        if (result1 == null || result1.isEmpty())
        {
          return modelAction.alertParentInfo(modelAction.getText("物料不存在，请更换"));
        }
        int spareNum = Integer.parseInt(StringUtils.toString(result1.get(0).get("WSI_ITEM_NUM")));
        if (Integer.parseInt(itemNum) > spareNum)
        {
          return modelAction.alertParentInfo(modelAction.getText("报废数量不能大于库存数量"));
        }
        else
        {
          if (Integer.parseInt(itemNum) == spareNum)
          {
            // 报废数量等于库存数量、删除物料SN在备品库存表数据
        	sqlWList = new ArrayList<Object>();
        	sqlWList.add(itemSn);
        	sqlWList.add(dataAuth);
            TableDataMapExt delwms = new TableDataMapExt();
            delwms.setTableName("T_WMS_SPARE_INFO");
            delwms.setSqlWhere(" and WSI_ITEM_SN=? AND DATA_AUTH=? ");
            delwms.setSqlWhereArgs(sqlWList);
            modelService.del(delwms);
          }
          else
          {
             	sqlWList = new ArrayList<Object>();
            	sqlWList.add(itemSn); 
            	sqlWList.add(dataAuth);
            // 报废数量未达到库存数量，修改物料SN对应的备品库存信息
            TableDataMapExt spareInfo = new TableDataMapExt();
            spareInfo.setTableName("T_WMS_SPARE_INFO");
            spareInfo.setSqlWhere(" and WSI_ITEM_SN=? AND DATA_AUTH=? ");
            spareInfo.setSqlWhereArgs(sqlWList);
            CommMethod.editSysDefCol(spareInfo.getColMap(), modelAction.getUser());
            int tempNum = spareNum - Integer.parseInt(itemNum);
            spareInfo.getColMap().put("WSI_ITEM_NUM", tempNum);
            if (dataAuth != null)
            {
              spareInfo.getColMap().put("DATA_AUTH", dataAuth);
            }
            modelService.edit(spareInfo);
          }
          // 保存报废信息
          TableDataMapExt scrapInfo = new TableDataMapExt();
          scrapInfo.setTableName("T_WMS_SPARE_SCARP_INFO");
          CommMethod.addSysDefCol(scrapInfo.getColMap(), modelAction.getUser());
          scrapInfo.getColMap().put("WSS_ITEM_SN", itemSn);
          scrapInfo.getColMap().put("WSS_ITEM_CODE", result1.get(0).get("WSI_ITEM_CODE"));
          scrapInfo.getColMap().put("WSS_ITEM_NUM", Integer.parseInt(itemNum));
          if (!productDate.equals(""))
          {
            scrapInfo.getColMap().put("WSS_PRODUCE_DATE", sdf1.parse(productDate));// 交货日期
          }
          scrapInfo.getColMap().put("WSS_RECEIVE_TIME", sdf1.parse(sdf1.format(new Date())));
          scrapInfo.getColMap().put("WSS_RECEIVE_EMP", CommMethod.getSessionUser().getId());
          scrapInfo.getColMap().put("WSS_MEMO", memo);
          if (dataAuth != null)
          {
            scrapInfo.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.save(scrapInfo);
          // 修改库存汇总表数据
          String spareSql = "SELECT T.* FROM T_WMS_SPARE_TOTAL T WHERE T.WST_ITEM_CODE=? AND T.DATA_AUTH=? ";
          List<Map<String, Object>> result = modelService.listDataSql(spareSql,
            new Object[] {result1.get(0).get("WSI_ITEM_CODE"),dataAuth});
          if (result != null && !result.isEmpty())
          {
            // 修改个体数量
            int stockNum = Integer.parseInt(StringUtils.toString(result.get(0).get("WST_STOCK_NUM")));
            int singleNum = Integer.parseInt(StringUtils.toString(result.get(0).get(
              "WST_SINGLE_NUM")));
            int tempNum1 = stockNum - Integer.parseInt(itemNum);
            int tempNum2 = singleNum - Integer.parseInt(itemNum);
            sqlWList = new ArrayList<Object>();
            sqlWList.add(result1.get(0).get("WSI_ITEM_CODE"));
            sqlWList.add(dataAuth);
            TableDataMapExt totalInfo = new TableDataMapExt();
            totalInfo.setTableName("T_WMS_SPARE_TOTAL");
            totalInfo.setSqlWhere(" and WST_ITEM_CODE=? and DATA_AUTH=? ");
            totalInfo.setSqlWhereArgs(sqlWList);
            CommMethod.editSysDefCol(totalInfo.getColMap(), modelAction.getUser());
            totalInfo.getColMap().put("WST_STOCK_NUM", tempNum1);
            totalInfo.getColMap().put("WST_SINGLE_NUM", tempNum2);
            if (dataAuth != null)
            {
              totalInfo.getColMap().put("DATA_AUTH", dataAuth);
            }
            modelService.edit(totalInfo);

          }
        }
      }
      else if ("2".equals(addType))
      {

        // 批量
        String spareSql = "SELECT T.* FROM T_WMS_SPARE_TOTAL T WHERE T.WST_ITEM_CODE=? AND T.DATA_AUTH=? ";
        List<Map<String, Object>> result = modelService.listDataSql(spareSql,
          new Object[] {itemCode,dataAuth});
        if (result != null && !result.isEmpty())
        {
          // 校验当前物料数量不能大于备品汇总表内改物料总数
          int totalNum = Integer.parseInt(StringUtils.toString(result.get(0).get("WST_STOCK_NUM")));
          if (Integer.parseInt(itemNum) > totalNum)
          {
            return modelAction.alertParentInfo(modelAction.getText("报废数量不能大于库存数量"));
          }
          
          
          
            // 保存报废信息
          TableDataMapExt scrapInfo = new TableDataMapExt();
          scrapInfo.setTableName("T_WMS_SPARE_SCARP_INFO");
          CommMethod.addSysDefCol(scrapInfo.getColMap(), modelAction.getUser());

          scrapInfo.getColMap().put("WSS_ITEM_CODE", result.get(0).get("WST_ITEM_CODE"));
          scrapInfo.getColMap().put("WSS_ITEM_NUM", Integer.parseInt(itemNum));
          if (!productDate.equals(""))
          {
            scrapInfo.getColMap().put("WSS_PRODUCE_DATE", sdf1.parse(productDate));// 交货日期
          }
          scrapInfo.getColMap().put("WSS_RECEIVE_TIME", sdf1.parse(sdf1.format(new Date())));
          scrapInfo.getColMap().put("WSS_RECEIVE_EMP", CommMethod.getSessionUser().getId());
          scrapInfo.getColMap().put("WSS_MEMO", memo);
          if (dataAuth != null)
          {
            scrapInfo.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.save(scrapInfo);
          
          
          // 修改个体数量
          int stockNum = Integer.parseInt(StringUtils.toString(result.get(0).get("WST_STOCK_NUM")));
          int spareNum = Integer.parseInt(StringUtils.toString(result.get(0).get("WST_LOT_NUM")));
          int tempNum1 = stockNum - Integer.parseInt(itemNum);
          int tempNum2 = spareNum - Integer.parseInt(itemNum);
          sqlWList = new ArrayList<Object>();
          sqlWList.add(itemCode);
          sqlWList.add(dataAuth);
          TableDataMapExt totalInfo = new TableDataMapExt();
          totalInfo.setTableName("T_WMS_SPARE_TOTAL");
          totalInfo.setSqlWhere(" and WST_ITEM_CODE=? AND DATA_AUTH=? ");
          totalInfo.setSqlWhereArgs(sqlWList);
          CommMethod.editSysDefCol(totalInfo.getColMap(), modelAction.getUser());
          totalInfo.getColMap().put("WST_STOCK_NUM", tempNum1);
          totalInfo.getColMap().put("WST_LOT_NUM", tempNum2);
          if (dataAuth != null)
          {
            totalInfo.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.edit(totalInfo);
        }
      }
      // 判断并删除库存明细表数据
      String delSql2 = "DELETE FROM T_WMS_SPARE_INFO T WHERE T.WSI_ITEM_NUM=0 AND T.DATA_AUTH=? ";
      modelService.execSql(delSql2,new Object[] {dataAuth});
      // 判断并删除库存汇总表数据
      String delSql = "DELETE FROM T_WMS_SPARE_TOTAL T WHERE T.WST_STOCK_NUM=0 AND T.DATA_AUTH=? ";
      modelService.execSql(delSql,new Object[] {dataAuth});
    }
    catch (NumberFormatException e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("格式转换错误"), e);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("报废失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("报废成功"), isCloseWin);
  }

}
