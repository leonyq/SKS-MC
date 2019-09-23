package com.more.mes.smt.wmsStockRecheck.pg;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.login.model.UserDto;
import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * 库存复检定时器
 * 
 * @author development
 */
public class StockRecheckTimer implements IJobx
{

  private final Log log = LogFactory.getLog(this.getClass());

  private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

  @SuppressWarnings("unchecked")
  @Override
  public void exec(Args arg0)
    throws Exception
  {
    try
    {
      // 先取出超期的物料
      String checkSql = "SELECT t.wsi_item_code, SUM(t.wsi_item_num) item_num "
                        + " FROM t_wms_stock_info t "
                        + " LEFT JOIN T_QM_INSEPCT_PARENT_INFO a "
                        + " ON a.qip_sn = t.wsi_item_sn "
                        + " AND (a.QIP_TEST_FLAG = '1' OR a.QIP_TEST_FLAG = '3' OR "
                        + " a.QIP_TEST_FLAG IS NULL) "
                        + " LEFT JOIN t_co_item c "
                        + " ON c.ci_item_code = t.wsi_item_code "
                        + " WHERE (t.wsi_test_time + (c.ci_recheck_days::text || ' days')::interval) < clock_timestamp() "
                        + " and t.wsi_stock_flag = '2' " + " GROUP BY t.wsi_item_code ";
      // 根据物料获取物料信息
      String sql = "SELECT DISTINCT t.* "
                   + " FROM t_wms_stock_info t "
                   + " LEFT JOIN T_QM_INSEPCT_PARENT_INFO a "
                   + " ON a.qip_sn = t.wsi_item_sn "
                   + " AND (a.QIP_TEST_FLAG = '1' OR a.QIP_TEST_FLAG = '3' OR "
                   + " a.QIP_TEST_FLAG IS NULL) "
                   + " LEFT JOIN t_co_item c "
                   + " ON c.ci_item_code = t.wsi_item_code "
                   + " WHERE (t.wsi_test_time + (c.ci_recheck_days::text || ' days')::interval) < clock_timestamp() "
                   + " and t.wsi_stock_flag = '2' " + " and t.wsi_item_code = ? ";
      // 取出系统默认用户sys001
      String userSql = "select t.* from SY_USER t WHERE t.login_name='sys001' ";
      List<UserDto> user = modelService.listSql(userSql, null, null, null, null, new UserDto());
      List<Map<String, Object>> timeList = modelService.listDataSql(checkSql);
      if (timeList != null && timeList.size() > 0)
      {
        int num = timeList.size();
        List<Map<String, Object>> pList = null;
        TableDataMapExt wms = new TableDataMapExt();
        wms.setTableName("T_WMS_DOC_INFO");
        TableDataMapExt recheck = new TableDataMapExt();
        recheck.setTableName("T_WMS_RECHECK_DOC");
        TableDataMapExt recheckDet = new TableDataMapExt();
        recheckDet.setTableName("T_WMS_RECHECK_DETAIL");

        TableDataMapExt stock = new TableDataMapExt();
        stock.setTableName("T_WMS_STOCK_INFO");

        for (int i = 0; i < num; i++ )
        {
          String WRD_DOC_NUM = getRecheckNo(user.get(0).getDeptId(), "DJ19", "", modelService);// 复检单号
          // 增加仓库单据信息表数据
          wms.getColMap().clear();
          CommMethod.addSysDefCol(wms.getColMap(), user.get(0));
          wms.getColMap().put("WDI_DOC_NUM", WRD_DOC_NUM);
          wms.getColMap().put("WDI_STATUS", "1");
          wms.getColMap().put("WDI_DOC_TYPE", "DJ19");
          wms.getColMap().put("WDI_CREATE_MAN", user.get(0).getId());
          wms.getColMap().put("WDI_CREATE_TIME", DateUtil.getCurDate());
          modelService.save(wms);
          // 新增复检单信息
          recheck.getColMap().clear();
          CommMethod.addSysDefCol(recheck.getColMap(), user.get(0));
          recheck.getColMap().put("WRD_DOC_NUM", WRD_DOC_NUM);
          recheck.getColMap().put("WRD_DOC_TYPE", "DJ19");
          recheck.getColMap().put("WRD_TEST_STEP", "0");
          recheck.getColMap().put("WRD_ITEM_CODE", timeList.get(i).get("WSI_ITEM_CODE"));
          recheck.getColMap().put("WRD_ITEM_NUM", timeList.get(i).get("ITEM_NUM"));
          recheck.getColMap().put("WRD_CREATE_MAN", user.get(0).getId());
          recheck.getColMap().put("WRD_CREATE_TIME", DateUtil.getCurDate());
          modelService.save(recheck);
          // 新增复检单明细信息
          pList = modelService.listDataSql(sql,
            new Object[] {timeList.get(i).get("WSI_ITEM_CODE")});
          int pNum = pList.size();
          for (int j = 0; j < pNum; j++ )
          {
            recheckDet.getColMap().clear();
            CommMethod.addSysDefCol(recheckDet.getColMap(), user.get(0));
            recheckDet.getColMap().put("WRD_DOC_NUM", WRD_DOC_NUM);
            recheckDet.getColMap().put("WRD_ITEM_SN", pList.get(j).get("WSI_ITEM_SN"));
            recheckDet.getColMap().put("WRD_ITEM_CODE", pList.get(j).get("WSI_ITEM_CODE"));
            recheckDet.getColMap().put("WRD_ITEM_NUM", pList.get(j).get("WSI_ITEM_NUM"));
            recheckDet.getColMap().put("WRD_LOT_NO", pList.get(j).get("WSI_LOT_NO"));
            recheckDet.getColMap().put("WRD_SUP_CODE", pList.get(j).get("WSI_SUP_CODE"));
            recheckDet.getColMap().put("WRD_CUST_CODE", pList.get(j).get("WSI_CUST_CODE"));
            recheckDet.getColMap().put("WRD_WH_CODE", pList.get(j).get("WSI_WH_CODE"));
            recheckDet.getColMap().put("WRD_DISTRICT_CODE", pList.get(j).get("WSI_DISTRICT_CODE"));
            recheckDet.getColMap().put("WRD_STORAGE_CODE", pList.get(j).get("WSI_STORAGE_CODE"));
            modelService.save(recheckDet);

            // 修改库存表物料sn状态
            ArrayList<Object> paraList = new ArrayList<Object>();
            stock.getColMap().clear();
            stock.setSqlWhere(" and WSI_ITEM_SN=? ");
            paraList.add(pList.get(j).get("WSI_ITEM_SN"));
            stock.setSqlWhereArgs(paraList);

            stock.getColMap().put("WSI_STOCK_FLAG", "6");
            modelService.edit(stock);
          }
          List<Object> reList = getBatchNo("0", "", user.get(0).getDeptId(), WRD_DOC_NUM,
            modelService);

          ArrayList<Object> paraList2 = new ArrayList<Object>();
          TableDataMapExt recheck1 = new TableDataMapExt();
          recheck1.setTableName("T_WMS_RECHECK_DOC");
          recheck1.setSqlWhere(" and WRD_DOC_NUM=? ");
          paraList2.add(WRD_DOC_NUM);
          recheck1.setSqlWhereArgs(paraList2);

          recheck1.getColMap().put("WRD_TEST_DOC", reList.get(0));
          modelService.edit(recheck1);
        }
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new Exception();
    }

  }

  @SuppressWarnings("unchecked")
  public String getRecheckNo(String dataAuth, String prefix, String dispatchSn,
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
  public List<Object> getBatchNo(String testStep, String sampleType, String dataAuth,
                                 String RecheckNo, ModelService modelService)
  {
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2, 3, 4, 5, 6};
    int[] outplace = {7, 8};
    List<Object> list = new ArrayList<Object>();
    List<Object> outType = new ArrayList<Object>();
    list.add(testStep);
    list.add(sampleType);
    list.add(dataAuth);
    list.add(RecheckNo);
    list.add("sys001");
    list.add(dataAuth);
    outType.add("String");
    outType.add("String");
    pf.setClassName("P_C_SAVE_DOC_BATCH");// 生成检验单号
    pf.setInPlace(inPlace);// 存储过程中in
    pf.setOutPlace(outplace); // 存储过程中out
    pf.setValArgs(list);// 存储过程中输入的参数
    pf.setTotalLen(list.size() + outType.size());// 总个数
    pf.setOutValType(outType);// 输出的参数
    List<Object> relist = modelService.procComm(pf);// 接收返回值
    // String res = (String) relist.get(0); //结果
    return relist;
  }

}
