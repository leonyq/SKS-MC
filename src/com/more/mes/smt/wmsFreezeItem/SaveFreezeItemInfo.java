package com.more.mes.smt.wmsFreezeItem;

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
 * 保存新增的生产领料信息
 * 
 * @author development
 */
public class SaveFreezeItemInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    // String dataAuth = request.getParameter("_DATA_AUTH");
    // String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    String auth = request.getSession().getAttribute("mcDataAuth").toString();
    try
    {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String memo = request.getParameter("paraMap1@0#WFI_FREEZE_MEMO");// 冻结原因
      String[] itemSns = request.getParameter("itemSns").split(",", -1);// 物料/产品SN

      // 增加仓库冻结信息表数据
      int len = itemSns.length - 1;
      List<Map<String, Object>> stockList = null;
      List<Map<String, Object>> freezeList = null;
      TableDataMapExt freezeMap = new TableDataMapExt();
      freezeMap.setTableName("T_WMS_FREEZE_INFO");
      TableDataMapExt stockMap = new TableDataMapExt();
      stockMap.setTableName("T_WMS_STOCK_INFO");
      for (int i = 0; i < len; i++ )
      {
        freezeMap.getColMap().clear();
        String sql = "select t.* from T_WMS_STOCK_INFO t where t.wsi_item_sn=? and t.DATA_AUTH=?";
        stockList = modelService.listDataSql(sql, new Object[] {itemSns[i],auth});
        String sql2 = "select t.* from T_WMS_FREEZE_INFO t where t.wfi_sn=? and t.DATA_AUTH=? ";
        freezeList = modelService.listDataSql(sql2, new Object[] {itemSns[i],auth});
        if (freezeList != null)
        {
          if (!freezeList.isEmpty())
          {
            // 修改
            CommMethod.editSysDefCol(freezeMap.getColMap(), modelAction.getUser());
            freezeMap.setSqlWhere(" and wfi_sn=? and DATA_AUTH=?");
            List<Object> wList = new ArrayList<Object>();
            wList.add(itemSns[i]);
            wList.add(auth);
            freezeMap.setSqlWhereArgs(wList);
            freezeMap.getColMap().put("WFI_FREEZE_FLAG", "1");// 冻结状态(1--冻结 2--解冻)
            freezeMap.getColMap().put("WFI_FREEZE_MEMO", memo);
            freezeMap.getColMap().put("WFI_FREEZE_EMP", CommMethod.getSessionUser().getId());
            freezeMap.getColMap().put("WFI_FREEZE_TIME", sdf.parse(sdf.format(new Date())));
            freezeMap.getColMap().put("DATA_AUTH", stockList.get(0).get("DATA_AUTH"));// 组织机构

            modelService.edit(freezeMap);
          }
          else
          {
            // 新增
            CommMethod.addSysDefCol(freezeMap.getColMap(), modelAction.getUser());

            freezeMap.getColMap().put("WFI_SN", stockList.get(0).get("WSI_ITEM_SN"));// 物料/产品SN
            freezeMap.getColMap().put("WFI_WH_CODE", stockList.get(0).get("WSI_WH_CODE"));// 仓库代码
            freezeMap.getColMap().put("WFI_ITEM_CODE", stockList.get(0).get("WSI_ITEM_CODE"));// 物料料号
            freezeMap.getColMap().put("WFI_NUM", stockList.get(0).get("WSI_ITEM_NUM"));// 物料数量
            freezeMap.getColMap().put("WFI_LOT", stockList.get(0).get("WSI_LOT_NO"));// 批次
            freezeMap.getColMap().put("WFI_CUST_CODE", stockList.get(0).get("WSI_CUST_CODE"));// 客户代码
            freezeMap.getColMap().put("WFI_SUP_CODE", stockList.get(0).get("WSI_SUP_CODE"));// 供应商代码
            freezeMap.getColMap().put("WFI_FREEZE_FLAG", "1");// 冻结状态(1--冻结 2--解冻)
            freezeMap.getColMap().put("WFI_ERROR_FLAG", stockList.get(0).get("WSI_ITEM_FLAG"));// 冻结前产品状态(1良品、2不良品)
            freezeMap.getColMap().put("DATA_AUTH", stockList.get(0).get("DATA_AUTH"));// 组织机构

            freezeMap.getColMap().put("WFI_FREEZE_MEMO", memo);
            freezeMap.getColMap().put("WFI_FREEZE_EMP", CommMethod.getSessionUser().getId());
            freezeMap.getColMap().put("WFI_FREEZE_TIME", sdf.parse(sdf.format(new Date())));

            modelService.save(freezeMap);
          }
          // 修改库存表
          stockMap.setSqlWhere(" and wsi_item_sn=? and DATA_AUTH=?");
          List<Object> wList = new ArrayList<Object>();
          wList.add(itemSns[i]);
          wList.add(auth);
          stockMap.setSqlWhereArgs(wList);
          stockMap.getColMap().put("WSI_FREEZE_FLAG", "Y");
          modelService.edit(stockMap);
          // 保存作业日志
          String saveRes = saveStockInfo(itemSns[i],
            StringUtils.toString(stockList.get(0).get("WSI_DOC_NUM")),
            CommMethod.getSessionUser().getLoginName(),auth, modelService);
          if (!"OK".equals(saveRes))
          {
            return modelAction.alertParentInfo("冻结失败");
          }
        }
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("冻结失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("冻结成功"), "0");
  }

  @SuppressWarnings("unchecked")
  public String saveStockInfo(String itemSN, String docNum, String userName,
                              String auth,
                              ModelService modelService)
  {
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2, 3, 4, 5, 6,7};
    int[] outplace = {8};
    List<Object> list = new ArrayList<Object>();
    List<Object> outType = new ArrayList<Object>();
    list.add(auth);
    list.add(itemSN);
    list.add("");
    list.add(null);
    list.add("冻结");
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
