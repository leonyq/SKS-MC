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
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * 根据选择的入库单的物料料号获取入库详细信息
 * 
 * @author development
 */
public class SaveSpareInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    String addType = request.getParameter("addType");// 新增方式
    String itemSn = request.getParameter("paraMap1@0#WSI_ITEM_SN");
    String itemCode = request.getParameter("paraMap1@0#WSI_ITEM_CODE");
    String itemNum = request.getParameter("paraMap1@0#WSI_ITEM_NUM");
    String productDate = request.getParameter("paraMap1@0#WSI_PRODUCE_DATE");// 生产日期
    String stockCode = request.getParameter("STORAGE_CODES");//库位SN
    String whCode = request.getParameter("WH_CODES");//仓库SN
    String memo = request.getParameter("paraMap1@0#WSI_MEMO");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String iframeId = request.getParameter("iframeId");
    List<Object> sqlWList = null;
    List<Object> sqlWList2 = null;
    try
    {

      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      if ("1".equals(addType))
      {
        // 个体
        // 物料SN校验条码规则,调用存储过程
        String res = checkItemSn(dataAuth,itemSn, modelService);
        if (!"OK".equals(res))
        {
          return modelAction.alertParentInfo(res);
        }
        String existsSql = "SELECT T.ID FROM T_WMS_SPARE_INFO T WHERE T.WSI_ITEM_SN=? AND T.DATA_AUTH=? ";
        List<Map<String, Object>> result2 = modelService.listDataSql(existsSql,
          new Object[] {itemSn,dataAuth});
        if (result2 != null && !result2.isEmpty())
        {
          return modelAction.alertParentInfo(modelAction.getText("物料已备品，请更换"));
        }
        TableDataMapExt wms = new TableDataMapExt();
        wms.setTableName("T_WMS_SPARE_INFO");
        CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
        wms.getColMap().put("WSI_ITEM_SN", itemSn);
        wms.getColMap().put("WSI_ITEM_CODE", itemCode);
        wms.getColMap().put("WSI_ITEM_NUM", Integer.parseInt(itemNum));
        if (!productDate.equals(""))
        {
          wms.getColMap().put("WSI_PRODUCE_DATE", sdf1.parse(productDate));// 交货日期
        }
        wms.getColMap().put("WSI_RECEIVE_TIME", sdf1.parse(sdf1.format(new Date())));
        wms.getColMap().put("WSI_RECEIVE_EMP", CommMethod.getSessionUser().getId());
        wms.getColMap().put("WSI_STOCK_SN", stockCode);//库位SN
        wms.getColMap().put("WSI_WH_CODE", whCode);//仓库SN
        wms.getColMap().put("WSI_MEMO", memo);
        if (dataAuth != null)
        {
          wms.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.save(wms);

        String spareSql = "SELECT T.* FROM T_WMS_SPARE_TOTAL T WHERE T.WST_ITEM_CODE=? AND T.DATA_AUTH=?";
        List<Map<String, Object>> result = modelService.listDataSql(spareSql,
          new Object[] {itemCode,dataAuth});
        if (result != null && !result.isEmpty())
        {
          // 修改个体数量
          int stockNum = Integer.parseInt(StringUtils.toString(result.get(0).get("WST_STOCK_NUM")));
          int spareNum = Integer.parseInt(StringUtils.toString(result.get(0).get("WST_SINGLE_NUM")));
          int tempNum1 = stockNum + Integer.parseInt(itemNum);
          int tempNum2 = spareNum + Integer.parseInt(itemNum);
          sqlWList = new ArrayList<Object>();
          sqlWList.add(itemCode);
          sqlWList.add(dataAuth);
          TableDataMapExt totalInfo = new TableDataMapExt();
          totalInfo.setTableName("T_WMS_SPARE_TOTAL");
          totalInfo.setSqlWhere(" and WST_ITEM_CODE=? AND DATA_AUTH=? ");
          totalInfo.setSqlWhereArgs(sqlWList);
          CommMethod.editSysDefCol(totalInfo.getColMap(), modelAction.getUser());
          totalInfo.getColMap().put("WST_STOCK_NUM", tempNum1);
          totalInfo.getColMap().put("WST_SINGLE_NUM", tempNum2);
          //totalInfo.getColMap().put("WST_RECEIVE_TIME", sdf1.parse(sdf1.format(new Date())));
          //totalInfo.getColMap().put("WST_RECEIVE_EMP", CommMethod.getSessionUser().getId());
          if (dataAuth != null)
          {
            totalInfo.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.edit(totalInfo);

        }
        else
        {
          // 新增该料号的总备品信息
          TableDataMapExt totalInfo = new TableDataMapExt();
          totalInfo.setTableName("T_WMS_SPARE_TOTAL");
          CommMethod.addSysDefCol(totalInfo.getColMap(), modelAction.getUser());
          totalInfo.getColMap().put("WST_ITEM_CODE", itemCode);
          totalInfo.getColMap().put("WST_STOCK_NUM", Integer.parseInt(itemNum));
          totalInfo.getColMap().put("WST_SINGLE_NUM", Integer.parseInt(itemNum));
          totalInfo.getColMap().put("WST_RECEIVE_TIME", sdf1.parse(sdf1.format(new Date())));
          totalInfo.getColMap().put("WST_RECEIVE_EMP", CommMethod.getSessionUser().getId());
          if (!productDate.equals(""))
          {
          totalInfo.getColMap().put("WST_PRODUCE_DATE", sdf1.parse(productDate));// 交货日期
          }
          if (dataAuth != null)
          {
            totalInfo.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.save(totalInfo);
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
          // 修改个体数量
          int stockNum = Integer.parseInt(StringUtils.toString(result.get(0).get("WST_STOCK_NUM")));
          int spareNum = Integer.parseInt(StringUtils.toString(result.get(0).get("WST_LOT_NUM")));
          int tempNum1 = stockNum + Integer.parseInt(itemNum);
          int tempNum2 = spareNum + Integer.parseInt(itemNum);
          sqlWList2 = new ArrayList<Object>();
          sqlWList2.add(itemCode);
          sqlWList2.add(dataAuth);
          TableDataMapExt totalInfo = new TableDataMapExt();
          totalInfo.setTableName("T_WMS_SPARE_TOTAL");
          totalInfo.setSqlWhere(" and WST_ITEM_CODE=? AND DATA_AUTH=? ");
          totalInfo.setSqlWhereArgs(sqlWList2);
          CommMethod.editSysDefCol(totalInfo.getColMap(), modelAction.getUser());
          totalInfo.getColMap().put("WST_STOCK_NUM", tempNum1);
          totalInfo.getColMap().put("WST_LOT_NUM", tempNum2);
          totalInfo.getColMap().put("WST_RECEIVE_TIME", sdf1.parse(sdf1.format(new Date())));
          totalInfo.getColMap().put("WST_RECEIVE_EMP", CommMethod.getSessionUser().getId());
          if (dataAuth != null)
          {
            totalInfo.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.edit(totalInfo);

        }
        else
        {
          // 新增该料号的总备品信息
          TableDataMapExt totalInfo = new TableDataMapExt();
          totalInfo.setTableName("T_WMS_SPARE_TOTAL");
          CommMethod.addSysDefCol(totalInfo.getColMap(), modelAction.getUser());
          totalInfo.getColMap().put("WST_ITEM_CODE", itemCode);
          totalInfo.getColMap().put("WST_STOCK_NUM", Integer.parseInt(itemNum));
          totalInfo.getColMap().put("WST_LOT_NUM", Integer.parseInt(itemNum));
          totalInfo.getColMap().put("WST_RECEIVE_TIME", sdf1.parse(sdf1.format(new Date())));
          totalInfo.getColMap().put("WST_RECEIVE_EMP", CommMethod.getSessionUser().getId());
          if (!productDate.equals(""))
          {
          totalInfo.getColMap().put("WST_PRODUCE_DATE", sdf1.parse(productDate));// 交货日期
          }
          if (dataAuth != null)
          {
            totalInfo.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.save(totalInfo);
        }
      }
    }
    catch (NumberFormatException e) {
		// TODO: handle exception
    	log.error(e);
        throw new BussException(modelAction.getText("格式转换失败"), e);
	}
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
  }

  @SuppressWarnings("unchecked")
  public String checkItemSn(String dataAuth,String itemSn, ModelService modelService)
  {
    String res = "";
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2, 3,4};
    int[] outplace = {5, 6};
    List<Object> list = new ArrayList<Object>();
    List<Object> outType = new ArrayList<Object>();
    list.add(dataAuth);
    list.add("7");
    list.add("");
    list.add("");
    outType.add("String");
    outType.add("String");
    pf.setClassName("P_C_GET_SN_RULEID");// 获取条码规则ID
    pf.setInPlace(inPlace);// 存储过程中in
    pf.setOutPlace(outplace); // 存储过程中out
    pf.setValArgs(list);// 存储过程中输入的参数
    pf.setTotalLen(list.size() + outType.size());// 总个数
    pf.setOutValType(outType);// 输出的参数
    List<Object> relist = modelService.procComm(pf);// 接收返回值
    String ruleId = (String)relist.get(0); // 条码规则ID
    res = (String)relist.get(1); // 结果
    if (!"OK".equals(res))
    {
      return res;
    }
    else
    {
      ProFuncDto pf2 = new ProFuncDto();
      int[] inPlace2 = {1, 2,3};
      int[] outplace2 = { 4, 5, 6, 7, 8, 9, 10,11};
      List<Object> list2 = new ArrayList<Object>();
      List<Object> outType2 = new ArrayList<Object>();
      list2.add(dataAuth);
      list2.add(itemSn);
      list2.add(ruleId);
      outType2.add("String");
      outType2.add("String");
      outType2.add("String");
      outType2.add("String");
      outType2.add("String");
      outType2.add("String");
      outType2.add("String");
      outType2.add("String");
      pf2.setClassName("P_C_CHECK_SN_RULE");// 校验物料SN
      pf2.setInPlace(inPlace2);// 存储过程中in
      pf2.setOutPlace(outplace2); // 存储过程中out
      pf2.setValArgs(list2);// 存储过程中输入的参数
      pf2.setTotalLen(list2.size() + outType2.size());// 总个数
      pf2.setOutValType(outType2);// 输出的参数
      List<Object> relist2 = modelService.procComm(pf2);// 接收返回值
      res = (String)relist2.get(7); // 结果
      return res;
    }
  }
}
