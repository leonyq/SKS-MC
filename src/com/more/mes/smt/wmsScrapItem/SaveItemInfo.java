package com.more.mes.smt.wmsScrapItem;

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
 * 保存新增的生产领料信息
 * 
 * @author development
 */
public class SaveItemInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    String docNum ;
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String scrapType = request.getParameter("paraMap1@0#WAD_SCARP_TYPE");// 报废类型
      String whCode = request.getParameter("paraMap1@0#WAD_WH_CODE");// 报废仓库
      String scrapRes = request.getParameter("paraMap1@0#WAD_SCARP_REASON");// 报废原因
      String dutyDept = request.getParameter("paraMap1@0#WSD_DUTY_DEPT");// 责任部门
      String dutyEmp = request.getParameter("paraMap1@0#WSD_DUTY_EMP");// 责任人
      String[] itemSns = request.getParameterValues("ITEM_SN");// 物料SN
      String[] itemCodes = request.getParameterValues("ITEM_CODE");// 物料料号
      String[] itemNums = request.getParameterValues("ITEM_NUM");// 物料数量
      String auth = request.getSession().getAttribute("mcDataAuth").toString();

      // 判断物料是否存在盘点物料
      for (int i = 0; i < itemSns.length; i++ )
      {
        String tempSql = "SELECT T.ID FROM T_WMS_STOCK_INFO T WHERE T.WSI_STOCK_FLAG ='5' " +
        		" AND T.WSI_ITEM_SN=? and t.DATA_AUTH=? ";
        List<String> result = modelService.listDataSql(tempSql, new Object[] {itemSns[i],auth});
        if (!(result == null) && !result.isEmpty())
        {
          return modelAction.alertParentInfo(modelAction.getText("已盘点的物料无法报废，请更换"));
        }
      }
      //String docNum = getReceiveNo(dataAuth, "DJ18", "", modelService);// 报废单号
      GetSnService gss = new GetSnService();
      String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
       docNum =gss.getSnForDocNum("DJ18", "", userId, dataAuth);
      if (docNum.indexOf("NG") != -1)
      {
        return modelAction.alertParentInfo(docNum);
      }

      // 增加仓库单据信息表数据
      TableDataMapExt wmsDoc = new TableDataMapExt();
      wmsDoc.setTableName("T_WMS_DOC_INFO");
      CommMethod.addSysDefCol(wmsDoc.getColMap(), modelAction.getUser());
      wmsDoc.getColMap().put("WDI_DOC_NUM", docNum);
      wmsDoc.getColMap().put("WDI_DOC_TYPE", "DJ18");
      wmsDoc.getColMap().put("WDI_CREATE_MAN", CommMethod.getSessionUser().getId());
      wmsDoc.getColMap().put("WDI_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));
      if (dataAuth != null)
      {
        wmsDoc.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.save(wmsDoc);

      // 增加仓库物料报废信息表数据
      TableDataMapExt wms = new TableDataMapExt();
      wms.setTableName("T_WMS_SCARP_DOC");
      CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
      wms.getColMap().put("WSD_DOC_NUM", docNum);// 报废单号
      wms.getColMap().put("WSD_DOC_TYPE", "DJ18");// 单据类型
      wms.getColMap().put("WAD_SCARP_TYPE", scrapType);// 报废类型
      wms.getColMap().put("WAD_WH_CODE", whCode);// 报废仓库
      wms.getColMap().put("WAD_SCARP_REASON", scrapRes);// 报废原因
      wms.getColMap().put("WSD_DUTY_DEPT", dutyDept);// 责任部门
      wms.getColMap().put("WSD_DUTY_EMP", dutyEmp);// 责任人
      wms.getColMap().put("WAD_CREATE_MAN", CommMethod.getSessionUser().getId());// 开单人
      wms.getColMap().put("WAD_SCARP_TIME", sdf1.parse(sdf1.format(new Date())));// 报废时间
      wms.getColMap().put("WAD_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));// 开单时间
      if (dataAuth != null)
      {
        wms.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.save(wms);
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
        String saveRes = saveStockInfo(dataAuth,itemSns[i], docNum,
          CommMethod.getSessionUser().getLoginName(), modelService);
        List<Map<String, Object>> stockList = null;
        if ("OK".equals(saveRes))
        {
          String stockSql = "SELECT T.* FROM T_WMS_STOCK_INFO T WHERE T.WSI_ITEM_SN= ? and t.DATA_AUTH=? ";
          stockList = modelService.listDataSql(stockSql, new Object[] {itemSns[i],auth});
          if (stockList != null && !stockList.isEmpty())
          {
            // 保存日志信息
            TableDataMapExt stockInfoMap = new TableDataMapExt();
            stockInfoMap.setTableName("T_WMS_STOCK_INFO_L");
            CommMethod.addSysDefCol(stockInfoMap.getColMap(), modelAction.getUser());
            stockInfoMap.setColMap(stockList.get(0));
            stockInfoMap.getColMap().put("ID", StringUtils.getUUID());
            modelService.save(stockInfoMap);

            TableDataMapExt delwms = new TableDataMapExt();
            delwms.setTableName("T_WMS_STOCK_INFO");
            delwms.setSqlWhere(" and WSI_ITEM_SN=? and DATA_AUTH=? ");
            List<Object> wList = new ArrayList<Object>();
            wList.add(itemSns[i]);
            wList.add(auth);
            delwms.setSqlWhereArgs(wList);
            modelService.del(delwms);
          }
        }
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功")+docNum, isCloseWin);
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

  @SuppressWarnings("unchecked")
  public String saveStockInfo(String dataAuth,String itemSN, String docNum, String userName,
                              ModelService modelService)
  {
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2, 3, 4, 5, 6,7};
    int[] outplace = {8};
    List<Object> list = new ArrayList<Object>();
    List<Object> outType = new ArrayList<Object>();
    list.add(dataAuth);
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
