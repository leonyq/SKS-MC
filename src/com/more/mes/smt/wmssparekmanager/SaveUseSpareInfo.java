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
import com.more.mes.smt.getsnhttp.service.GetSnService;
/**
 * 根据选择的入库单的物料料号获取入库详细信息
 * 
 * @author development
 */
public class SaveUseSpareInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    String addType = request.getParameter("paraMap1@0#WSO_OUT_TYPE");// 新增方式
    String dept = request.getParameter("paraMap1@0#WSO_DEPT");
    String memo = request.getParameter("paraMap1@0#WSO_MEMO");
    String[] itemSns = request.getParameterValues("ITEM_SN");// 物料sn
    String[] itemCodes = request.getParameterValues("ITEM_CODE");// 物料料号
    String[] useNums = request.getParameterValues("USE_NUM");// 领用数量
    String[] itemNums = request.getParameterValues("SINGLE_ITEM_NUM");// 个体数量
    String[] singleNums = request.getParameterValues("SINGLE_NUM");// 个体汇总数量
    String[] stockNums = request.getParameterValues("STOCK_NUM");// 剩余库存数量
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String formId = request.getParameter("formId");
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String iframeId = request.getParameter("iframeId");
    String docNum = getReceiveNo(dataAuth, "DJ24", "", modelService);// 领用单号
    String userId = modelAction.getUser().getId();
    GetSnService gss = new GetSnService();
    docNum = gss.getSnForDocNum("DJ24", "", userId, dataAuth);
     if (docNum.indexOf("NG") != -1)
      {
        return modelAction.alertParentInfo(docNum);
      }
    List<Object> sqlWList1 = null;
    List<Object> sqlWList2 = null;
    try
    {
      TableDataMapExt wms = new TableDataMapExt();
      wms.setTableName("T_WMS_DOC_INFO");
      CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
      wms.getColMap().put("WDI_DOC_NUM", docNum);
      wms.getColMap().put("WDI_STATUS", "1");
      wms.getColMap().put("WDI_DOC_TYPE", "DJ24");
      wms.getColMap().put("WDI_CREATE_MAN", CommMethod.getSessionUser().getId());
      wms.getColMap().put("WDI_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));
      wms.getColMap().put("WDI_MEMO", memo);
      if (dataAuth != null)
      {
        wms.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.save(wms);

      // 新增领用明细信息
      for (int i = 0; i < itemSns.length; i++ )
      {
        TableDataMapExt wms1 = new TableDataMapExt();
        wms1.setTableName("T_WMS_SPARE_OUT_DETAIL");
        CommMethod.addSysDefCol(wms1.getColMap(), modelAction.getUser());
        wms1.getColMap().put("WSO_DOC_NUM", docNum);
        wms1.getColMap().put("WSO_ITEM_SN", itemSns[i]);
        wms1.getColMap().put("WSO_ITEM_CODE", itemCodes[i]);
        wms1.getColMap().put("WSO_ITEM_NUM", Integer.valueOf(useNums[i]));
        if (dataAuth != null)
        {
          wms1.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.save(wms1);
      }

      String getNumSql = "SELECT SUM(T.WSO_ITEM_NUM) ITEM_NUM FROM T_WMS_SPARE_OUT_DETAIL T WHERE T.WSO_DOC_NUM=? AND T.DATA_AUTH=? ";
      List<Map<String, Object>> numRes = modelService.listDataSql(getNumSql, new Object[] {docNum,dataAuth});
      // 新增领用单信息
      TableDataMapExt wms2 = new TableDataMapExt();
      wms2.setTableName("T_WMS_SPARE_OUT_DOC");
      CommMethod.addSysDefCol(wms2.getColMap(), modelAction.getUser());
      wms2.getColMap().put("WSO_DOC_NUM", docNum);
      wms2.getColMap().put("WSO_OUT_TYPE", addType);
      wms2.getColMap().put("WSO_DEPT", dept);
      wms2.getColMap().put("WSO_MEMO", memo);
      wms2.getColMap().put("WSO_OUT_TIME", sdf1.parse(sdf1.format(new Date())));
      wms2.getColMap().put("WSI_OUT_EMP", CommMethod.getSessionUser().getId());
      wms2.getColMap().put("WSO_ITEM_NUM",
        Integer.parseInt(StringUtils.toString(numRes.get(0).get("ITEM_NUM"))));
      if (dataAuth != null)
      {
        wms2.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.save(wms2);

      // 修改备品明细、备品汇总表数据
      if ("1".equals(addType))
      {
        // 个体
        for (int i = 0; i < itemSns.length; i++ )
        {
         sqlWList1 = new ArrayList<Object>();
         sqlWList1.add(itemSns[i]);
         sqlWList1.add(dataAuth);
          TableDataMapExt spareInfo = new TableDataMapExt();
          spareInfo.setTableName("T_WMS_SPARE_INFO");
          spareInfo.setSqlWhere(" and WSI_ITEM_SN=? AND DATA_AUTH=? ");
          spareInfo.setSqlWhereArgs(sqlWList1);
          CommMethod.editSysDefCol(spareInfo.getColMap(), modelAction.getUser());
          spareInfo.getColMap().put("WSI_ITEM_NUM", Integer.valueOf(itemNums[i]));

          if (dataAuth != null)
          {
            spareInfo.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.edit(spareInfo);
          sqlWList1 = new ArrayList<Object>();
          sqlWList1.add(itemCodes[i]);
          sqlWList1.add(dataAuth);
          TableDataMapExt totalInfo = new TableDataMapExt();
          totalInfo.setTableName("T_WMS_SPARE_TOTAL");
          totalInfo.setSqlWhere(" and WST_ITEM_CODE=? AND DATA_AUTH=?");
          totalInfo.setSqlWhereArgs(sqlWList1);
          CommMethod.editSysDefCol(totalInfo.getColMap(), modelAction.getUser());
          totalInfo.getColMap().put("WST_STOCK_NUM", Integer.valueOf(stockNums[i]));
          totalInfo.getColMap().put("WST_SINGLE_NUM", Integer.valueOf(singleNums[i]));
          if (dataAuth != null)
          {
            totalInfo.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.edit(totalInfo);

        }
      }
      else if ("2".equals(addType))
      {
        for (int i = 0; i < itemCodes.length; i++ )
        {
        	sqlWList2 = new ArrayList<Object>();
        	sqlWList2.add(itemCodes[i]);
        	sqlWList2.add(dataAuth);
          TableDataMapExt totalInfo = new TableDataMapExt();
          totalInfo.setTableName("T_WMS_SPARE_TOTAL");
          totalInfo.setSqlWhere(" and WST_ITEM_CODE=? AND DATA_AUTH=? ");
          totalInfo.setSqlWhereArgs(sqlWList2);
          CommMethod.editSysDefCol(totalInfo.getColMap(), modelAction.getUser());
          totalInfo.getColMap().put("WST_STOCK_NUM", Integer.valueOf(stockNums[i]));
          totalInfo.getColMap().put("WST_LOT_NUM", Integer.valueOf(itemNums[i]));
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
    }catch (NumberFormatException e)
    {
        log.error(e);
        throw new BussException(modelAction.getText("格式转换错误"), e);
      }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("领用失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("领用成功"), isCloseWin);
  }

  @SuppressWarnings("unchecked")
  public String getReceiveNo(String dataAuth, String prefix, String dispatchSn,
                             ModelService modelService)
  {
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2, 3};
    int[] outplace = {4, 5};
    List<Object> list = new ArrayList<Object>();
    List<Object> outType = new ArrayList<Object>();
    list.add(dataAuth);
    list.add(prefix);
    list.add(dispatchSn);
    outType.add("String");
    outType.add("String");
    pf.setClassName("P_C_GET_DOC_NO");// 生成检验单号
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
