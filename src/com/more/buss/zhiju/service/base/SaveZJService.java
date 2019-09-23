package com.more.buss.zhiju.service.base;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.mes.smt.getsnhttp.service.GetSnService;
/**
 * 制具—新增保存
 * @author development
 *
 */
public class SaveZJService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // String =request.getParameter("");//CommMethod.escapeJs()
    HttpServletRequest request = modelAction.getRequest();
    String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");
    String cfiFixSn = request.getParameter("paraMap1@0#CFI_FIX_SN");// 制具SN
    String cfiAddWay = request.getParameter("paraMap1@0#CFI_ADDWAY");// 新增方式
    String cfItemCode = request.getParameter("paraMap1@0#CFI_ITEM_CODE");// 制具料号
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    if (dataAuth == null)
    {
      dataAuth = "";
    }
    if (cfiAddWay.equals("1"))
    { // 如果为个体，先校验输入的辅料sn的条码规则
      // 调用存储过程
      ProFuncDto pf = new ProFuncDto();
      int[] inPlace = {1, 2, 3,4};
      int[] outplace = {5,6};
      List<Object> list2 = new ArrayList<Object>();
      List<Object> outType = new ArrayList<Object>();
      list2.add(dataAuth);
      list2.add("2");
      list2.add(cfItemCode);
      list2.add(null);
      outType.add("String");
      outType.add("String");
      pf.setClassName("P_C_GET_SN_RULEID");// 获取辅料制具条码规则id
      pf.setInPlace(inPlace);// 存储过程中in
      pf.setOutPlace(outplace); // 存储过程中out
      pf.setValArgs(list2);// 存储过程中输入的参数
      pf.setTotalLen(list2.size() + outType.size());// 总个数
      pf.setOutValType(outType);// 输出的参数
      List<Object> relist = modelService.procComm(pf);// 接收返回值
      String res = (String)relist.get(1); // 结果
      if (!res.equals("OK"))
      {
        return modelAction.alertParentInfo(res);
      }
      String ruleId = (String)relist.get(0); // 辅料制具条码规则id

      ProFuncDto pf1 = new ProFuncDto();
      int[] inPlace1 = {1,2,3};
      int[] outplace1 = {4,5,6,7,8,9,10,11};
      List<Object> list1 = new ArrayList<Object>();
      List<Object> outType1 = new ArrayList<Object>();
      list1.add(dataAuth);
      list1.add(cfiFixSn);
      list1.add(ruleId);
      outType1.add("String");
      outType1.add("String");
      outType1.add("String");
      outType1.add("String");
      outType1.add("String");
      outType1.add("String");
      outType1.add("String");
      outType1.add("String");
      pf1.setClassName("P_C_CHECK_SN_RULE");// 校验辅料制具条码规则
      pf1.setInPlace(inPlace1);// 存储过程中in
      pf1.setOutPlace(outplace1); // 存储过程中out
      pf1.setValArgs(list1);// 存储过程中输入的参数
      pf1.setTotalLen(list1.size() + outType1.size());// 总个数
      pf1.setOutValType(outType1);// 输出的参数
      List<Object> relist1 = modelService.procComm(pf1);// 接收返回值
      String result = (String)relist1.get(7); // 校验结果
      if (!result.equals("OK"))
      {
        return modelAction.alertParentInfo("制具SN不符合条码规则");
      }
    }

    String isSuc = this.addCfi(this.getParam(modelAction), modelAction, modelService, dataAuth,
      cfItemCode);

    String iframeId = request.getParameter("iframeId");

    if ("0".equals(isSuc))
    {
      return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), isCloseWin);
      // return modelAction.commAjaxFunClassLoadParent(formId,iframeId,1,1);
    }
    else
    {
      return modelAction.alertParentInfo("制具SN重复，请更换");
      // return modelAction.commAjaxFunClassLoadParent(formId,iframeId,2,1);
    }
  }

  /**
   * 获取前端页面数据
   * 
   * @param modelAction
   * @return
   */
  public String addCfi(Map<String, Object> cfiParaMap, ModelAction modelAction,
                       ModelService modelService, String dataAuth, String ctiItemCode)
  {
    String isSuc = "0"; // SN重复标志
    String sqlCfiBySn = "select id from T_CO_FIXTURE_INFO where CFI_FIX_SN=? and DATA_AUTH=?";
    if ("2".equals(cfiParaMap.get("cfiAddWay")))
    {// 批次
     // String sqlFixtrueByAdd="select from T_CO_FIXTURE_INFO where CFI_ITEM_CODE=? and CTI_LOT"
     // List<Map<String,String>> fixtrueByAddMap=modelService.listDataSql(arg0, arg1);

      String sqlCfiSns = "select CFI_FIX_SN from T_CO_FIXTURE_INFO";
      @SuppressWarnings("unchecked")
      List<Map<String, Object>> listCfiBySn = modelService.listDataSql(sqlCfiSns);// !!!!!!!!
      //List<Map<String,Object>> listCfiBySn=modelService.listDataSql(sqlCfiSns,new Object[]{ecId,dataAuth});
      // CommMethod.listToEscapeJs(listCfiBySn);
      // CommMethod.listMapToEscapeJs(listCfiBySn);
      int cfiCount = Integer.parseInt((String)cfiParaMap.get("cfiCount"));
      String cfiItemType = (String)cfiParaMap.get("CFI_ITEM_TYPE");
      // cfiItemType = "0" + cfiItemType;// 制具类型
      String cfiItemCode = (String)cfiParaMap.get("CFI_ITEM_CODE");// 制具料号
      String cfiLot = DateUtil.formatDate(DateUtil.getCurDate(), "yyyyMMdd");// 生产批号
                                                                             // 物料类型(2位)+料号+生产批号+3位流水”
      List<String> cfiArrays = new ArrayList<String>();
      String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
      GetSnService gss = new GetSnService();
      // 首先判断是否重复
      // if (!listCfiBySn.isEmpty())
      // {

      // for (int i = 0; i < listCfiBySn.size(); i++ )
      // {
      // String cfiFixSn = String.valueOf(listCfiBySn.get(i).get("CFI_FIX_SN"));
      // if (cfiFixSn.length() > 0 && cfiFixSn.indexOf("$") > 0
      // && cfiFixSn.split("\\$").length == 4)
      // {// 该SN为生产批次的
      // String[] cfiFixSn_arr = cfiFixSn.split("\\$");
      // String fixStr = cfiFixSn_arr[2];
      // String fixNum = cfiFixSn_arr[3];
      // if (cfiLot.equals(fixStr))
      // {
      // cfiArrays.add(fixNum);
      // }
      // }
      // }
      // if (!cfiArrays.isEmpty())
      // {
      // int ctilotmax = this.getMaxLot(cfiArrays);
      // 算最大流水号
      String snStr = gss.getSnForTinCode(ctiItemCode, cfiItemType, userId, dataAuth, cfiCount);
      if (snStr.indexOf("NG") != -1)
      {
        return modelAction.alertParentInfo(snStr);
      }
      if(snStr!=null&&!snStr.equals("")) {
          String[] snStrs = snStr.split(",");
          for (int i = 0; i <= snStrs.length - 1; i++ )
          {
            // String cfiSn = cfiItemType + "$" + cfiItemCode + "$" + cfiLot + "$" +
            // this.getLotBit(ctilotmax, i);
    
            cfiParaMap.put("CFI_FIX_SN", snStrs[i]);
            this.insertFixtrue(cfiParaMap, modelAction, modelService);
          }
      }
      
      // }
      // else
      // {
      // for (int i = 1; i <= cfiCount; i++ )
      // {
      // // 生成SN
      // String cfiNum = this.getLotBit(0, i);
      // String cfiSn = cfiItemType + "$" + cfiItemCode + "$" + cfiLot + "$" + cfiNum;
      // cfiParaMap.put("CFI_FIX_SN", cfiSn);
      // this.insertFixtrue(cfiParaMap, modelAction, modelService);
      // }
      // }

      // }
      // else
      // {// 首次添加批量新增
      // for (int i = 1; i <= cfiCount; i++ )
      // {
      // // 生成SN
      // String cfiNum = this.getLotBit(0, i);
      // String cfiSn = cfiItemType + "$" + cfiItemCode + "$" + cfiLot + "$" + cfiNum;
      // cfiParaMap.put("CFI_FIX_SN", cfiSn);
      // this.insertFixtrue(cfiParaMap, modelAction, modelService);
      // }
      // }

    }
    else
    {// 个体 SN唯一想验证
      @SuppressWarnings("unchecked")
      List<Map<String, Object>> listCfiBySn = modelService.listDataSql(sqlCfiBySn,
        new Object[] {cfiParaMap.get("CFI_FIX_SN"),dataAuth});
      // CommMethod.listMapToEscapeJs(listCfiBySn);
      if (listCfiBySn.isEmpty())
      {// SN没有重复的

        this.insertFixtrue(cfiParaMap, modelAction, modelService);

      }
      else
      {
        isSuc = "1";// 胶水SN重复
      }
    }
    return isSuc;
  }

  public int getMaxLot(List<String> cfiArrays)
  {
    // List<String> lastThrees=new ArrayList<String>();//封装所有流水号的后三位
    String lastmax = "";// 用于返回最大的流水号
    int max = 0;
    /*
     * for(int i=0;i<cfiArrays.size();i++){ String ctilot=cfiArrays.get(i); String
     * lastThree=ctilot.substring(ctilot.length()-3); lastThrees.add(lastThree); }
     */
    if(cfiArrays!=null&&!cfiArrays.isEmpty()) {
    	lastmax = cfiArrays.get(0);
        for (int i = 1; i < cfiArrays.size(); i++ )
        {
          int min = Integer.parseInt(cfiArrays.get(i));
          if (min > max)
          {
            lastmax = cfiArrays.get(i);
            max = Integer.parseInt(cfiArrays.get(i));
          }
        }
    }
    return Integer.parseInt(lastmax);
  }

  /**
   * 获取流水号
   * 
   * @param bit
   * @return
   */
  public String getLotBit(int ctilotMax, int index)
  { // 0 i
    int ctiLot = ctilotMax + index;
    String ctilotStr = String.valueOf(ctiLot);

    if (ctilotStr.length() == 1)
    {
      ctilotStr = "00" + ctilotStr;
    }
    if (ctilotStr.length() == 2)
    {
      ctilotStr = "0" + ctilotStr;
    }
    return ctilotStr;
  }

  public void insertFixtrue(Map<String, Object> cfiParaMap, ModelAction modelAction,
                            ModelService modelService)
  {
    // 插入数据
    HttpServletRequest request = modelAction.getRequest();
    //String dataAuth = request.getParameter("_DATA_AUTH");
    //	String dataAuth = request.getParameter("_DATA_AUTH");
     String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    String fixId = StringUtils.getUUID();
    String curUser = CommMethod.getSessionUser().getName();
    String nowDate = DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd HH:mm:ss");
    TableDataMapExt fixtureInfo = new TableDataMapExt();
    fixtureInfo.setTableName("T_CO_FIXTURE_INFO");
    @SuppressWarnings("unchecked")
    Map<String, Object> colMap = fixtureInfo.getColMap();
   // colMap.put("CFI_ADDWAY", cfiParaMap.get("CFI_ADDWAY"));// 新增方式
    colMap.put("ID", fixId);// Integer.valueOf(String.valueOf(a))
    colMap.put("CFI_FIX_SN", cfiParaMap.get("CFI_FIX_SN"));// 制具SN
    colMap.put("CFI_ITEM_CODE", cfiParaMap.get("CFI_ITEM_CODE"));// 制具料号
    colMap.put("CFI_INSTOCK_DOC", cfiParaMap.get("CFI_INSTOCK_DOC")); // 入库单号
    colMap.put("CFI_SUPPLIER_CODE", cfiParaMap.get("CFI_SUPPLIER_CODE"));// 供应商编号
    colMap.put("CFI_ROHS_FLAG", cfiParaMap.get("CFI_ROHS_FLAG"));// RoHS标志
    if (StringUtils.isNotBlank(cfiParaMap.get("CFI_MAX_USAGE")))
    {
      colMap.put("CFI_MAX_USAGE", Integer.valueOf(String.valueOf(cfiParaMap.get("CFI_MAX_USAGE"))));// 最大使用次数
    }
    if (StringUtils.isNotBlank(cfiParaMap.get("CFI_TOTAL_USAGE")))
    {
      colMap.put("CFI_TOTAL_USAGE",
        Integer.valueOf(String.valueOf(cfiParaMap.get("CFI_TOTAL_USAGE"))));// 累计使用次数
    }
    if (StringUtils.isNotBlank(cfiParaMap.get("CFI_CYCLE_REMIND")))
    {
      colMap.put("CFI_CYCLE_REMIND",
        Integer.valueOf(String.valueOf(cfiParaMap.get("CFI_CYCLE_REMIND"))));// 保养次数
    }
    if (StringUtils.isNotBlank(cfiParaMap.get("CFI_REMIND_CYCLE")))
    {
      colMap.put("CFI_REMIND_CYCLE",
        Integer.valueOf(String.valueOf(cfiParaMap.get("CFI_REMIND_CYCLE"))));// 保养提醒次数
    }
    if (StringUtils.isNotBlank(cfiParaMap.get("CFI_PERIOD_LIMIT")))
    {
      colMap.put("CFI_PERIOD_LIMIT",
        Integer.valueOf(String.valueOf(cfiParaMap.get("CFI_PERIOD_LIMIT"))));// 周期上限
    }
    if (StringUtils.isNotBlank(cfiParaMap.get("CFI_UPKEEP_PERIOD")))
    {
      colMap.put("CFI_UPKEEP_PERIOD",
        Integer.valueOf(String.valueOf(cfiParaMap.get("CFI_UPKEEP_PERIOD"))));// 保养周期
    }
    if (StringUtils.isNotBlank(cfiParaMap.get("CFI_REMIND_DAY")))
    {
      colMap.put("CFI_REMIND_DAY",
        Integer.valueOf(String.valueOf(cfiParaMap.get("CFI_REMIND_DAY"))));// 保养提醒天数
    }
    if (StringUtils.isNotBlank(cfiParaMap.get("CFI_TINCKNESS")))
    {
      colMap.put("CFI_TINCKNESS", Double.parseDouble(String.valueOf(cfiParaMap.get("CFI_TINCKNESS"))));// 厚度
    }
    if (StringUtils.isNotBlank(cfiParaMap.get("CFI_FLATNESS")))
    {
      colMap.put("CFI_FLATNESS", Integer.valueOf(String.valueOf(cfiParaMap.get("CFI_FLATNESS"))));// 整齐度
    }
    if (StringUtils.isNotBlank(cfiParaMap.get("CFI_STRAIN_DIS")))
    {
      colMap.put("CFI_STRAIN_DIS",
        Integer.valueOf(String.valueOf(cfiParaMap.get("CFI_STRAIN_DIS"))));// 张力差异
    }

    colMap.put("CFI_ITEM_TYPE", cfiParaMap.get("CFI_ITEM_TYPE"));// 制具类型

    if (StringUtils.isNotBlank(cfiParaMap.get("CFI_LEFT_TOP")))
    {
      colMap.put("CFI_LEFT_TOP", Integer.valueOf(String.valueOf(cfiParaMap.get("CFI_LEFT_TOP"))));// 左上张力
    }
    if (StringUtils.isNotBlank(cfiParaMap.get("CFI_RIGHT_TOP")))
    {
      colMap.put("CFI_RIGHT_TOP", Integer.valueOf(String.valueOf(cfiParaMap.get("CFI_RIGHT_TOP"))));// 右上张力
    }
    if (StringUtils.isNotBlank(cfiParaMap.get("CFI_MIDDLE")))
    {
      colMap.put("CFI_MIDDLE", Integer.valueOf(String.valueOf(cfiParaMap.get("CFI_MIDDLE"))));// 中间张力
    }
    if (StringUtils.isNotBlank(cfiParaMap.get("CFI_LEFT_LOWER")))
    {
      colMap.put("CFI_LEFT_LOWER",
        Integer.valueOf(String.valueOf(cfiParaMap.get("CFI_LEFT_LOWER"))));// 左下张力
    }
    if (StringUtils.isNotBlank(cfiParaMap.get("CFI_RIGHT_LOWER")))
    {
      colMap.put("CFI_RIGHT_LOWER",
        Integer.valueOf(String.valueOf(cfiParaMap.get("CFI_RIGHT_LOWER"))));// 右下张力
    }
    colMap.put("CFI_STOCK_SN", cfiParaMap.get("CFI_STOCK_SN"));// 库位SN
    colMap.put("CFI_WH_CODE", cfiParaMap.get("CFI_WH_CODE"));// 仓库
    colMap.put("CFI_MEMO", cfiParaMap.get("CFI_MEMO"));// 备注
    colMap.put("CFI_FIX_STATUS", "0");// 状态 首次添加默认为 在库 0
    colMap.put("CFI_INSTOCK_MAN", curUser);// 入库人 CFI_MT_DATE
    colMap.put("CFI_INSTOCK_TIME", DateUtil.parseDate(nowDate, "yyyy-MM-dd HH:mm:ss"));// 入库时间
    colMap.put("CFI_MT_DATE", DateUtil.parseDate(nowDate, "yyyy-MM-dd HH:mm:ss"));// 最后保养时间
    // CommMethod.getuserd 如果不控制组织机构则取默认的
    // CommMethod.getUserDefDa(arg0, arg1)
    // CommMethod.isAuthData(arg0, arg1)
    if (dataAuth != null)
    {
     colMap.put("DATA_AUTH", dataAuth);// 组织结构
    }

    // 制具履历表
    TableDataMapExt cfo = new TableDataMapExt();
    // CommMethod.addSysDefCol(cfo.getColMap(), modelAction.getUser());
    cfo.setTableName("T_CO_FIX_OPERATE_LOG");

    cfo.getColMap().put("ID", fixId);
    cfo.getColMap().put("create_user", curUser);
    cfo.getColMap().put("create_time", DateUtil.parseDate(nowDate, "yyyy-MM-dd HH:mm:ss"));
    cfo.getColMap().put("CFO_FIX_SN", cfiParaMap.get("CFI_FIX_SN"));
    cfo.getColMap().put("CFO_ITEM_CODE", cfiParaMap.get("CFI_ITEM_CODE"));
    // cfo.getColMap().put("CFO_FIX_SN", cfoFixSn);
    cfo.getColMap().put("CFO_ITEM_TYPE", cfiParaMap.get("CFI_ITEM_TYPE"));
    cfo.getColMap().put("CFO_OPEATOR", modelAction.getUser().getId());
    cfo.getColMap().put("CFO_OPERATE_TIME", DateUtil.parseDate(nowDate, "yyyy-MM-dd HH:mm:ss"));
    cfo.getColMap().put("CFI_MEMO", cfiParaMap.get("CFI_MEMO"));
    cfo.getColMap().put("CFO_OPERATE_TYPE", "0");
    cfo.getColMap().put("CFO_ITEM_CURUSER", curUser);
    if (dataAuth != null)
    {
      cfo.getColMap().put("DATA_AUTH", dataAuth);// 组织结构
    }

    try
    {
      modelService.save(fixtureInfo);
      modelService.save(cfo);

    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("增加失败"), e);
    }
  }

  /**
   * 获取前端的数据
   * 
   * @param modelAction
   * @return
   */
  public Map<String, Object> getParam(ModelAction modelAction)
  {
    Map<String, Object> cfiMap = new HashMap<String, Object>();
    HttpServletRequest request = modelAction.getRequest();
    String cfiAddWay = request.getParameter("paraMap1@0#CFI_ADDWAY");// 新增方式
    //cfiMap.put("CFI_ADDWAY", cfiAddWay);// 111111 paraMap1@0#CFI_FIX_SN
    //cfiMap.put("cfiAddWay", cfiAddWay);
    cfiMap.put("cfiAddWay", cfiAddWay);
    String cfiFixSn = request.getParameter("paraMap1@0#CFI_FIX_SN");// 制具SN paraMap1@0#CFI_FIX_SN
    cfiMap.put("CFI_FIX_SN", cfiFixSn);
    String cfiCount = request.getParameter("paraMap1@0#CFI_COUNT");// 批次数量
    cfiMap.put("cfiCount", cfiCount);
    String cfItemCode = request.getParameter("paraMap1@0#CFI_ITEM_CODE");// 制具料号
    cfiMap.put("CFI_ITEM_CODE", cfItemCode);
    String cfiInstockDoc = request.getParameter("paraMap1@0#CFI_INSTOCK_DOC");// 入库单号
    cfiMap.put("CFI_INSTOCK_DOC", cfiInstockDoc);
    String cfiSupplierCode = request.getParameter("paraMap1@0#CFI_SUPPLIER_CODE");// 供应商编号
    cfiMap.put("CFI_SUPPLIER_CODE", cfiSupplierCode);
    String cfiRohsFlag = request.getParameter("paraMap1@0#CFI_ROHS_FLAG");// RoHS标志
    if (cfiRohsFlag == null)
    {
      cfiMap.put("CFI_ROHS_FLAG", "N");
    }
    else
    {
      cfiMap.put("CFI_ROHS_FLAG", cfiRohsFlag);
    }
    String cfiMaxUsage = request.getParameter("paraMap1@0#CFI_MAX_USAGE");// 最大使用次数
    cfiMap.put("CFI_MAX_USAGE", cfiMaxUsage);
    String cfiTotalUsage = request.getParameter("paraMap1@0#CFI_TOTAL_USAGE");// 累计使用次数
    cfiMap.put("CFI_TOTAL_USAGE", cfiTotalUsage);

    String cfiItemType = request.getParameter("_cfi_item_type");// 制具类型
    cfiMap.put("CFI_ITEM_TYPE", cfiItemType);
    String cfiAssistanttoolName = request.getParameter("paraMap1@0#CFI_ASSISTANTTOOLNAME");// 制具名称

    String cfiAssistanttoolSpec = request.getParameter("paraMap1@0#CFI_ASSISTANTTOOLSPEC");// 制具规格

    String cfiLeftTop = request.getParameter("paraMap1@0#CFI_LEFT_TOP");// 左上张力
    cfiMap.put("CFI_LEFT_TOP", cfiLeftTop);
    String cfiRightTop = request.getParameter("paraMap1@0#CFI_RIGHT_TOP");// 右上张力

    cfiMap.put("CFI_RIGHT_TOP", cfiRightTop);
    String cfiMiddle = request.getParameter("paraMap1@0#CFI_MIDDLE");// 中间张力
    cfiMap.put("CFI_MIDDLE", cfiMiddle);
    String cfiLeftLower = request.getParameter("paraMap1@0#CFI_LEFT_LOWER");// 左下张力
    cfiMap.put("CFI_LEFT_LOWER", cfiLeftLower);
    String cfiRightLower = request.getParameter("paraMap1@0#CFI_RIGHT_LOWER");// 右下张力
    cfiMap.put("CFI_RIGHT_LOWER", cfiRightLower);
    int rightTop = Integer.valueOf(cfiRightTop).intValue();
    int leftTop = Integer.valueOf(cfiLeftTop).intValue();
    int middle = Integer.valueOf(cfiMiddle).intValue();
    int leftLower = Integer.valueOf(cfiLeftLower).intValue();
    int rightLower = Integer.valueOf(cfiRightLower).intValue();
    int[] a = new int[] {rightTop, leftLower, rightLower, leftTop, middle};
    Arrays.sort(a);
    int strainDis = a[4] - a[0];
    String cfiStrainDis = strainDis + "";// 张力差异
    cfiMap.put("CFI_STRAIN_DIS", cfiStrainDis);

    String cfiCycleRemind = request.getParameter("paraMap1@0#CFI_CYCLE_REMIND");// 保养次数
    cfiMap.put("CFI_CYCLE_REMIND", cfiCycleRemind);
    String cfiRemindCycle = request.getParameter("paraMap1@0#CFI_REMIND_CYCLE");// 保养提醒次数
    cfiMap.put("CFI_REMIND_CYCLE", cfiRemindCycle);
    String cfiPeriodLimit = request.getParameter("paraMap1@0#CFI_PERIOD_LIMIT");// 周期上限
    cfiMap.put("CFI_PERIOD_LIMIT", cfiPeriodLimit);
    String cfiUpkeepReriod = request.getParameter("paraMap1@0#CFI_UPKEEP_PERIOD");// 保养周期
    cfiMap.put("CFI_UPKEEP_PERIOD", cfiUpkeepReriod);
    String cfiRemindDay = request.getParameter("paraMap1@0#CFI_REMIND_DAY");// 保养提醒天数
    cfiMap.put("CFI_REMIND_DAY", cfiRemindDay);
    String cfiTinckness = request.getParameter("paraMap1@0#CFI_TINCKNESS");// 厚度
    cfiMap.put("CFI_TINCKNESS", cfiTinckness);
    String cfiFlaness = request.getParameter("paraMap1@0#CFI_FLATNESS");// 整齐度
    cfiMap.put("CFI_FLATNESS", cfiFlaness);

    String stockSn = request.getParameter("STORAGE_CODE");// 库位SN
    cfiMap.put("CFI_STOCK_SN", stockSn);
    String whCode = request.getParameter("WH_CODE");// 仓库
    cfiMap.put("CFI_WH_CODE", whCode);

    String cfiMemo = request.getParameter("paraMap1@0#CFI_MEMO");// 备注
    cfiMap.put("CFI_MEMO", cfiMemo);
    return cfiMap;
  }

}
