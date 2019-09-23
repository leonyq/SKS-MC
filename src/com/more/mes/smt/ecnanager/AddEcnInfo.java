package com.more.mes.smt.ecnanager;

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
 * 保存ECN变更单信息
 * 
 * @author development
 */
public class AddEcnInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		
    String iframeId = request.getParameter("iframeId");
    try
    {
      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
      String ceiEcrSn = request.getParameter("paraMap1@0#CEI_ECR_SN");// ECR编号
      String ceiItemCode = request.getParameter("paraMap1@0#CEI_ITEM_CODE");// 机种
      String ceiUrgentGrade = request.getParameter("paraMap1@0#CEI_URGENT_GRADE");// 紧急程度
      String ceiChangeImplement = request.getParameter("paraMap1@0#CEI_CHANGE_IMPLEMENT");// 变更执行
      String ceiDistributeDep = request.getParameter("paraMap1@0#CEI_DISTRIBUTE_DEP");// 副本分发部门
      String ceiEcrApplayDate = request.getParameter("paraMap1@0#CEI_ECR_APPLAYDATE");// ECR申请日期
      String ceiEcrApplayEmp = request.getParameter("paraMap1@0#CEI_ECR_APPLAYEMP");// ECR申请人
      String ceiEcrExamineEmp = request.getParameter("paraMap1@0#CEI_ECR_EXAMINEEMP");// ECR审核人
      String ceiEcrApprovalEmp = request.getParameter("paraMap1@0#CEI_ECR_APPROVALEMP");// ECR批准人
      // 物料明细
      String[] itemCodes = request.getParameterValues("CBD_ITEM_CODE");// 物料料号
      String[] actionSelects = request.getParameterValues("actionSelect");// 动作
      String[] projectStepSelects = request.getParameterValues("projectStepSelect");// 生产阶别
      String[] groupCodes = request.getParameterValues("GROUP_CODE");// 工序
      String[] cbdPoints = request.getParameterValues("CBD_POINT");// 位号
      String[] cbdUnits = request.getParameterValues("CBD_UNITS");// 单位
      String[] cbdItemNums = request.getParameterValues("CBD_ITEM_NUM");// 数量
      String[] replaceTypes = request.getParameterValues("REPLACE_TYPE");// 替代方式
      String[] cutTypeSelects = request.getParameterValues("cutTypeSelect");// 切入方式
      String[] cutCodes = request.getParameterValues("CUT_CODE");// 切入模块编码
      // 物料库存明细
      String[] itemCode1s = request.getParameterValues("ITEM_CODE1");// 物料料号
      String[] wsiItemNums = request.getParameterValues("WSI_ITEM_NUM");// 库存物料数量
      String[] stockDates = request.getParameterValues("STOCK_DATE");// 库存统计日期
      String[] stockWaySelects = request.getParameterValues("stockWaySelect");// 库存物料处理方式
      String[] orderItemNums = request.getParameterValues("ORDERITEM_NUM");// 已下订单物料数量
      String[] orderDates = request.getParameterValues("ORDER_DATE");// 已下订单统计日期
      String[] orderWaySelects = request.getParameterValues("orderWaySelect");// 已下订单处理方式
      // 成品库存明细
      String[] trackNums = request.getParameterValues("TRACKNUM");// 在制数量
      String[] trackDates = request.getParameterValues("TRACK_DATE");// 在制统计日期
      String[] trackWaySelects = request.getParameterValues("trackWaySelect");// 在制处理方式
      String[] stockNums = request.getParameterValues("STOCKNUM");// 在库数量
      String[] productDates = request.getParameterValues("PRODUCT_DATE");// 在库统计日期
      String[] productWaySelects = request.getParameterValues("productWaySelect");// 在库处理方式
      String[] shipNums = request.getParameterValues("SHIP_NUM");// 已出货数量
      String[] shipDates = request.getParameterValues("SHIP_DATE");// 出货统计日期
      String[] shipWaySelects = request.getParameterValues("shipWaySelect");// 出货处理方式

      String ceiEcnSn = getEcnNo(dataAuth, "DJ21", "", modelService);// ECN单号
      // 插入ECN信息
      TableDataMapExt ecn = new TableDataMapExt();
      ecn.setTableName("T_CO_ECN_INFO");
      CommMethod.addSysDefCol(ecn.getColMap(), modelAction.getUser());
      ecn.getColMap().put("CEI_ECR_SN", ceiEcrSn);
      ecn.getColMap().put("CEI_ITEM_CODE", ceiItemCode);
      ecn.getColMap().put("CEI_URGENT_GRADE", ceiUrgentGrade);
      ecn.getColMap().put("CEI_CHANGE_IMPLEMENT", ceiChangeImplement);
      ecn.getColMap().put("CEI_DISTRIBUTE_DEP", ceiDistributeDep);
      if (!ceiEcrApplayDate.equals(""))
      {
        ecn.getColMap().put("CEI_ECR_APPLAYDATE", sdf2.parse(ceiEcrApplayDate));
      }
      ecn.getColMap().put("CEI_ECR_APPLAYEMP", ceiEcrApplayEmp);
      ecn.getColMap().put("CEI_ECR_EXAMINEEMP", ceiEcrExamineEmp);
      ecn.getColMap().put("CEI_ECR_APPROVALEMP", ceiEcrApprovalEmp);
      ecn.getColMap().put("CEI_ECN_SN", ceiEcnSn);
      ecn.getColMap().put("CEI_ECN_TYPE", "1");
      ecn.getColMap().put("CEI_ECN_CREATEEMP", CommMethod.getSessionUser().getId());
      ecn.getColMap().put("CEI_ECN_CREATEDATE", sdf1.parse(sdf1.format(new Date())));
      if (dataAuth != null)
      {
        ecn.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.save(ecn);
      // 插入 ECN物料明细表
      TableDataMapExt ecnDetail = new TableDataMapExt();
      ecnDetail.setTableName("T_CO_ECN_ITEM_DETAIL");
      if (itemCodes != null)
      {
        int num = itemCodes.length;
        for (int i = 0; i < num; i++ )
        {
          ecnDetail.getColMap().clear();
          CommMethod.addSysDefCol(ecnDetail.getColMap(), modelAction.getUser());
          ecnDetail.getColMap().put("CEID_ECN_SN", ceiEcnSn);
          ecnDetail.getColMap().put("CEID_ITEM_CODE", itemCodes[i]);
          ecnDetail.getColMap().put("CEID_ACTION", actionSelects[i]);
          ecnDetail.getColMap().put("CEID_PRODUCT_STEP", projectStepSelects[i]);
          ecnDetail.getColMap().put("CEID_GROUP_CODE", groupCodes[i]);
          ecnDetail.getColMap().put("CEID_NUMBER", cbdPoints[i]);
          ecnDetail.getColMap().put("CEID_UNIT", cbdUnits[i]);
          ecnDetail.getColMap().put("CEID_ITEM_NUM", Integer.valueOf(cbdItemNums[i]));
          ecnDetail.getColMap().put("CEID_REPLACE_TYPE", replaceTypes[i]);
          ecnDetail.getColMap().put("CEID_CUT_TYPE", cutTypeSelects[i]);
          ecnDetail.getColMap().put("CEID_CUT_CODE", cutCodes[i]);
          if (dataAuth != null)
          {
            ecnDetail.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.save(ecnDetail);
        }
      }
      // 插入 ECN物料库存明细表
      TableDataMapExt stockDetail = new TableDataMapExt();
      stockDetail.setTableName("T_CO_ECN_ITEMSTOCK_DETAIL");
      if (itemCode1s != null)
      {
        int num = itemCode1s.length;
        for (int i = 0; i < num; i++ )
        {
          stockDetail.getColMap().clear();
          CommMethod.addSysDefCol(stockDetail.getColMap(), modelAction.getUser());
          stockDetail.getColMap().put("CEID_ECN_SN", ceiEcnSn);
          stockDetail.getColMap().put("CEID_ITEM_CODE", itemCode1s[i]);
          stockDetail.getColMap().put("CEID_ITEMSTOCK_NUM", Integer.valueOf(wsiItemNums[i]));
          if (!stockDates[i].equals(""))
          {
            stockDetail.getColMap().put("CEID_STOCK_COUNTDATE", sdf2.parse(stockDates[i]));
          }
          stockDetail.getColMap().put("CEID_ITEMSTOCK_HANDLEWAY", stockWaySelects[i]);
          stockDetail.getColMap().put("CEID_ORDERITEM_NUM", Integer.valueOf(orderItemNums[i]));
          if (!orderDates[i].equals(""))
          {
            stockDetail.getColMap().put("CEID_ORDERITEM_COUNTDATE", sdf2.parse(orderDates[i]));
          }
          stockDetail.getColMap().put("CEID_ORDERITEM_HANDLEWAY", orderWaySelects[i]);
          if (dataAuth != null)
          {
            stockDetail.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.save(stockDetail);
        }
      }
      // 插入 ECN成品库存明细表
      TableDataMapExt proDetail = new TableDataMapExt();
      proDetail.setTableName("T_CO_ECN_PRODUCTSTOCK_DETAIL");
      if (trackNums != null)
      {
        int num = trackNums.length;
        for (int i = 0; i < num; i++ )
        {
          proDetail.getColMap().clear();
          CommMethod.addSysDefCol(proDetail.getColMap(), modelAction.getUser());
          proDetail.getColMap().put("CEPD_ECN_SN", ceiEcnSn);
          proDetail.getColMap().put("CEPD_TRACK_NUM", Integer.valueOf(trackNums[i]));
          if (!trackDates[i].equals(""))
          {
            proDetail.getColMap().put("CEPD_TRACK_COUNTDATE", sdf2.parse(trackDates[i]));
          }
          proDetail.getColMap().put("CEPD_TRACK_HANDLEWAY", trackWaySelects[i]);
          proDetail.getColMap().put("CEPD_STOCK_NUM", Integer.valueOf(stockNums[i]));
          if (!productDates[i].equals(""))
          {
            proDetail.getColMap().put("CEPD_STOCK_COUNTDATE", sdf2.parse(productDates[i]));
          }
          proDetail.getColMap().put("CEPD_STOCK_HANDLEWAY", productWaySelects[i]);
          proDetail.getColMap().put("CEPD_SHIPMENT_NUM", Integer.valueOf(shipNums[i]));
          if (!shipDates[i].equals(""))
          {
            proDetail.getColMap().put("CEPD_SHIPMENT_COUNTDATE", sdf2.parse(shipDates[i]));
          }
          proDetail.getColMap().put("CEPD_SHIPMENT_HANDLEWAY", shipWaySelects[i]);
          if (dataAuth != null)
          {
            proDetail.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.save(proDetail);
        }
      }
      // //////////////////////////////////////////
      String modelCode = ceiItemCode;
      String sql = "SELECT T.* " + " FROM T_CO_ITEM_PROJECT T " + " WHERE T.CO_ITEM_CODE = ? "
                   + " AND T.CO_PROJECT_CODE IN " + " (SELECT T2.CO_PROJECT_CODE "
                   + " FROM T_CO_INDICATORR_PROJECT T2 " + " WHERE T2.CO_AFFECT_INFO = '1' AND T2.DATA_AUTH=? ) "
                   + " AND T.DATA_AUTH=? ";
      List<Map<String, Object>> result = modelService.listDataSql(sql, new Object[] {modelCode,dataAuth,dataAuth});
      if (!(result == null) && !result.isEmpty())
      {
        String tempSql = "UPDATE T_CO_ITEM_PROJECT T SET CO_STATE = '1' WHERE T.CO_ITEM_CODE = ? AND T.DATA_AUTH=? ";

        modelService.execSql(tempSql, new Object[] {modelCode,dataAuth});
        tempSql = "UPDATE T_CO_INDICATORR T SET CO_STATE = '1' WHERE T.CO_MODEL_CODE = ? AND T.CO_MO_NUMBER IS NULL AND T.DATA_AUTH=? ";

        modelService.execSql(tempSql, new Object[] {modelCode,dataAuth});
        tempSql = "UPDATE T_CO_INDICATORR_PROJECT_INFO T " + " SET CO_STATE = '1' "
                  + " WHERE T.CO_INDICATORR_SN = " + " (SELECT T2.CO_INDICATORR_SN "
                  + " FROM T_CO_INDICATORR T2 "
                  + " WHERE T2.CO_MODEL_CODE = ?  AND T2.CO_MO_NUMBER IS NULL AND T2.DATA_AUTH=? ) "
                  + " AND T.DATA_AUTH=? ";

        modelService.execSql(tempSql, new Object[] {modelCode,dataAuth,dataAuth});
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
  }

  @SuppressWarnings("unchecked")
  public String getEcnNo(String dataAuth, String prefix, String dispatchSn,
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
