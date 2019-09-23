package com.more.buss.xgglue.service.base;

import java.util.ArrayList;
import java.util.Date;
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
 * 辅料信息 新增保存
 * @author development
 *
 */
public class SaveXGService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {

    HttpServletRequest request = modelAction.getRequest();
    String iframeId = request.getParameter("iframeId");
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String ctiAddWay = request.getParameter("paraMap1@0#CTI_ADDWAY");// 新增方式 CTI_ASSISTANTTOOLTYPE
    String ctiassistantToolType = request.getParameter("ctiItemType");
    String ctiCount = request.getParameter("paraMap1@0#CTI_COUNT");// 批次数量
    String ctiLot = request.getParameter("paraMap1@0#CTI_LOT");// 生产批号 paraMap1@0#CTI_LOT
    //String userId = CommMethod.getSessionUser().getId();// 创建人
    String ctiItemCode = request.getParameter("paraMap1@0#CTI_ITEM_CODE");// 辅料料号
    String ctiTinSn = request.getParameter("paraMap1@0#CTI_TIN_SN"); // 辅料sn
    String ctiItemType = modelAction.getRequest().getParameter("ctiItemType");
    //String dataAuth = request.getParameter("_DATA_AUTH");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    if (dataAuth == null)
    {
      dataAuth = "";
    }
    if (ctiAddWay.equals("1"))
    { // 如果为个体，先校验输入的辅料sn的条码规则
      // 调用存储过程
      ProFuncDto pf = new ProFuncDto();
      int[] inPlace = {1, 2, 3,4};
      int[] outplace = { 5,6};
      List<Object> list2 = new ArrayList<Object>();
      List<Object> outType = new ArrayList<Object>();
      list2.add(dataAuth);
      list2.add("2");
      list2.add(ctiItemCode);
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
      //System.out.println(res);
      if (!res.equals("OK"))
      {
        return modelAction.alertParentInfo(res);
      }
      String ruleId = (String)relist.get(0); // 辅料制具条码规则id

      ProFuncDto pf1 = new ProFuncDto();
      int[] inPlace1 = {1, 2,3};
      int[] outplace1 = { 4, 5, 6, 7, 8, 9, 10,11};
      List<Object> list1 = new ArrayList<Object>();
      List<Object> outType1 = new ArrayList<Object>();
      list1.add(dataAuth);
      list1.add(ctiTinSn);
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
        return modelAction.alertParentInfo("辅料SN不符合条码规则");
      }
    }
    // 将前端的数据封装成map
    Map<String, Object> ctimap = new HashMap<String, Object>();
    ctimap = SaveXGService.getParameters(modelAction);
    // 根据料号、生产批号查询 料号、生产批号
    String sqlCliLot = "select CTI_TIN_SN from T_CO_TIN_INFO t where t.CTI_ITEM_CODE=? and t.cti_lot=?  ";//and t.DATA_AUTH=?
    String sqlId = "select id from T_CO_TIN_INFO t where t.CTI_TIN_SN=? and t.CTI_DECIDE=? and t.DATA_AUTH=?  ";//
    String isSuc2 = addway(ctiAddWay, ctiItemCode, ctiItemType, ctiLot, ctiCount,dataAuth,
      modelService, sqlCliLot, sqlId, ctiassistantToolType, ctimap, ctiTinSn,  modelAction);
    if (isSuc2.equals("1"))
    {
      return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), isCloseWin);
    }
    else
    {
      // return modelAction.reloadParent(modelAction.getText("锡膏胶水SN重复，请更换"));
      return modelAction.alertParentInfo("锡膏胶水SN重复，请更换");
    }

  }

  /**
   * 具体操作
   * 
   * @param CTI_ADDWAY
   *          判断是批量还是个体
   * @param CTI_ITEM_CODE
   *          料号
   * @param CTI_LOT
   *          生产批号
   * @param CTI_COUNT
   *          批次数量
   * @param modelService
   * @param sql1
   *          判断当料号和生产批号 与数据库相同时
   * @param sql2
   *          获取当料号和生产批号 与数据库相同时，的所有生产批次 CTI_LOT
   * @param sql3
   *          当为个体时进行唯一性验证
   * @param CTI_ASSISTANTTOOLTYPE
   *          物料类型 2位
   * @return
   */
  @SuppressWarnings("unchecked")
  public String addway(String ctiAddway, String ctiItemCode, String ctiItemType,
                       String ctiLot, String ctiCount,String dataAuth,  ModelService modelService,
                       String sqlCliLot, String sqlId, String ctiAssistantToolType,
                       Map<String, Object> ctiMap, String ctiTinSn, ModelAction modelAction)
  {
    String isSuc = "1";
    List<String> ctiLotstrs = new ArrayList<String>();
    String ctiLot2 = ctiLot;
    String ctiLot3 = ctiLot;
    if (ctiAssistantToolType.length() == 1)
    {
      ctiAssistantToolType = "0" + ctiAssistantToolType;
    }
    if (ctiAddway.equals("2"))
    {// 批量 物料类型(2位)+‘-’+料号+‘-’+生产批号+‘-’+3位流水
      String ctiDecide = "1";
      List<Map<String, String>> list = modelService.listDataSql(sqlCliLot, new Object[] {
        ctiItemCode, ctiLot});// 当生产批号相同时，获得全部的生产
      if (list!=null && list.size() != 0)
      {// 有相同的料号、生产批号
        String strs = list.get(0).get("CTI_TIN_SN");
        //String[] lotstr_arr = strs.split("\\$");
        //String lootstr = lotstr_arr[2];
        //if (CTI_LOT2.equals(lootstr))
        //{
          for (int i = 0; i < list.size(); i++ )
          {
            String cti = list.get(i).get("CTI_TIN_SN");
            ctiLotstrs.add(cti);
          }
          int ctiLotMax = SaveXGService.getMaxClot(ctiLotstrs);
          String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
          GetSnService gss = new GetSnService();
          String snStr = gss.getSnForTinCode(ctiItemCode, ctiItemType, userId, dataAuth,
            Integer.parseInt(ctiCount));
          if (snStr.indexOf("NG") != -1)
          {
            return modelAction.alertParentInfo(snStr);
          }
          if(snStr!=null && !snStr.equals("")) {
        	  String[] snStrs = snStr.split(",");
              for (int i = 0; i <= snStrs.length - 1; i++ )
              {
                // 算流水号
                ctiLot = ctiAssistantToolType + "$" + ctiItemCode + "$" + ctiLot3 + "$"
                         + getCtilot(ctiLotMax, i);
                // 插入数据
                String infoId = StringUtils.getUUID();
                ctiMap.put("CTI_TIN_SN", snStrs[i]);
                // ctiMap.put("CTI_LOT",getCtilot(ctilotmax, i));
                // insert(info_id,ctiMap, getCtilot(ctilotmax, i),modelService,ctiDecide,modelAction);
                insert(infoId, ctiMap, ctiLot2, modelService, ctiDecide, modelAction);
                insertOperateLog(infoId, ctiMap, modelService, modelAction);
                // insertThawingInfo(info_id, ctiMap, modelService, modelAction);
              }
          }
        //}
        /*else
        {
          String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
          GetSnService gss = new GetSnService();
          String snStr = gss.getSnForTinCode(ctiItemCode, ctiItemType, userId, dataAuth,
            Integer.parseInt(ctiCount));
          if (snStr.indexOf("NG") != -1)
          {
            return modelAction.alertParentInfo(snStr);
          }
          String[] snStrs = snStr.split(",");
          for (int i = 0; i <= snStrs.length - 1; i++ )
          {
            // 算流水号

            String twocount = getCtilot(0, i);

            ctiLot = ctiAssistantToolType + "$" + ctiItemCode + "$" + CTI_LOT2 + "$" + twocount;
            // 插入数据
            String info_id = StringUtils.getUUID();
            ctiMap.put("CTI_TIN_SN", snStrs[i]);
            // ctiMap.put("CTI_LOT",twocount);
            // insert(info_id,ctiMap, twocount,modelService,ctiDecide,modelAction);
            insert(info_id, ctiMap, ctiLot2, modelService, ctiDecide, modelAction);
            insertOperateLog(info_id, ctiMap, modelService, modelAction);
            // insertThawingInfo(info_id, ctiMap, modelService, modelAction);
          }
        }*/

      }
      else
      {
        String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
        GetSnService gss = new GetSnService();
        String snStr = gss.getSnForTinCode(ctiItemCode, ctiItemType, userId, dataAuth,
          Integer.parseInt(ctiCount));
        if (snStr.indexOf("NG") != -1)
        {
          return modelAction.alertParentInfo(snStr);
        }
        if(snStr!=null && !snStr.equals("")) {
	        String[] snStrs = snStr.split(",");
	        for (int i = 0; i <= snStrs.length - 1; i++ )
	        {
	          // 算流水号
	          String twoCount = getCtilot(0, i);
	          ctiLot = ctiAssistantToolType + "$" + ctiItemCode + "$" + ctiLot3 + "$" + twoCount;
	          // 插入数据
	          String infoId = StringUtils.getUUID();
	          ctiMap.put("CTI_TIN_SN", snStrs[i]);
	          // ctiMap.put("CTI_LOT",twocount);
	          // insert(info_id,ctiMap, twocount,modelService,ctiDecide,modelAction);
	          insert(infoId, ctiMap, ctiLot2, modelService, ctiDecide, modelAction);
	          insertOperateLog(infoId, ctiMap, modelService, modelAction);
	          // insertThawingInfo(info_id, ctiMap, modelService, modelAction);
	        }
        }
      }
    }
    else
    {// 个体 锡膏胶水唯一性验证
      String ctiDecide = "0";
      List<String> list = modelService.listDataSql(sqlId, new Object[] {ctiTinSn, ctiDecide,dataAuth});
      // if(list.size()==0){
      if (list.isEmpty())
      {
        // 插入数据
        String infoId = StringUtils.getUUID();
        insert(infoId, ctiMap, ctiLot3, modelService, ctiDecide, modelAction);
        insertOperateLog(infoId, ctiMap, modelService, modelAction);
        // insertThawingInfo(info_id, ctiMap, modelService, modelAction);
      }
      else
      {
        isSuc = "0";// 胶水SN重复
      }
    }

    return isSuc;
  }

  /**
   * 辅料履历信息表
   * 
   * @param ID
   * @param ctimap
   * @param modelService
   */

  @SuppressWarnings("unchecked")
  public void insertOperateLog(String operateId, Map<String, Object> ctiMap,
                               ModelService modelService, ModelAction modelAction)
  {
    HttpServletRequest request = modelAction.getRequest();
    //String dataAuth = request.getParameter("_DATA_AUTH");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String userId = CommMethod.getSessionUser().getId();// 创建人
    TableDataMapExt oprateLog = new TableDataMapExt();
    CommMethod.addSysDefCol(oprateLog.getColMap(), modelAction.getUser());
    if ("0".equals(ctiMap.get("CTI_ITEM_TYPE")) || "1".equals(ctiMap.get("CTI_ITEM_TYPE")))
    {
      oprateLog.setTableName("T_CO_TIN_OPERATE_LOG");
      //CommMethod.addSysDefCol(operateLog.getColMap(), modelAction.getUser());
      // oprateLog.getColMap().put("id", operateId);
      oprateLog.getColMap().put("CTO_TIN_SN", ctiMap.get("CTI_TIN_SN"));
      oprateLog.getColMap().put("CTO_OPERATE_TYPE", "0");
      oprateLog.getColMap().put("CTO_OPERATE_TIME", ctiMap.get("CTI_INSTOCK_TIME"));
      oprateLog.getColMap().put("CTO_OPEATOR", ctiMap.get("CTI_INSTOCK_MAN"));
      oprateLog.getColMap().put("CTO_ITEM_TYPE", ctiMap.get("CTI_ITEM_TYPE"));
      oprateLog.getColMap().put("CTO_TIN_CODEE", ctiMap.get("CTI_ITEM_CODE"));
      oprateLog.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
      oprateLog.getColMap().put("CTO_OPEATOR", userId);// 创建人
      try
      {
        modelService.save(oprateLog);
      }
      catch (Exception e)
      {
        log.error(e);
        throw new BussException(modelAction.getText("增加失败"), e);
      }

    }
  }

  /**
   * 回温信息表
   * 
   * @param Id
   * @param ctiMap
   * @param modelService
   */
  @SuppressWarnings("unchecked")
  public void insertThawingInfo(String thawingId, Map<String, Object> ctiMap,
                                ModelService modelService, ModelAction modelAction)
  {
    if ("0".equals(ctiMap.get("CTI_ITEM_TYPE")) || "1".equals(ctiMap.get("CTI_ITEM_TYPE")))
    {
      HttpServletRequest request = modelAction.getRequest();
      //String dataAuth = request.getParameter("_DATA_AUTH");
      String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
      
      TableDataMapExt thawingInfo = new TableDataMapExt();
      CommMethod.addSysDefCol(thawingInfo.getColMap(), modelAction.getUser());
      thawingInfo.setTableName("T_CO_TIN_THAWING_INFO");
      // thawingInfo.getColMap().put("id", thawingId);
      thawingInfo.getColMap().put("CTT_TIN_SN", ctiMap.get("CTI_TIN_SN"));
      thawingInfo.getColMap().put("CTT_ITEM_CODE", ctiMap.get("CTI_ITEM_CODE"));
      thawingInfo.getColMap().put("CTT_ITEM_TYPE", ctiMap.get("CTI_ITEM_TYPE"));
      thawingInfo.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
      try
      {
        modelService.save(thawingInfo);
      }
      catch (Exception e)
      {
        log.error(e);
        throw new BussException(modelAction.getText("增加失败"), e);
      }

    }

  }

  /**
   * 辅料信息表插入数据
   * 
   * @param ctimap
   *          封装数据的
   * @param CTI_LOT
   *          流水号
   */

  @SuppressWarnings("unchecked")
  public void insert(String infoId, Map<String, Object> ctiMap, String ctiLot,
                     ModelService modelService, String ctiDecide, ModelAction modelAction)
  {
    // 值
    Date ctiInstockTime = (Date)ctiMap.get("CTI_INSTOCK_TIME");
    Double ctiWeight = Double.valueOf(String.valueOf(ctiMap.get("CTI_WEIGHT")));
    // Integer CTI_WEIGHT = Integer.valueOf(String.valueOf(ctiMap.get("CTI_WEIGHT")));
    String ctiSupplier = String.valueOf(ctiMap.get("CTI_SUPPLIER"));
    String ctiItemCode = String.valueOf(ctiMap.get("CTI_ITEM_CODE"));
    String ctiQulityDateOpen = String.valueOf(ctiMap.get("CTI_QULITY_DATE_OPEN")).equals("") ? "0" : String.valueOf(ctiMap.get("CTI_QULITY_DATE_OPEN"));
    String ctiInstockDoc = String.valueOf(ctiMap.get("CTI_INSTOCK_DOC"));
    String ctiItemType = String.valueOf(ctiMap.get("CTI_ITEM_TYPE"));
    String ctiQulityDate = String.valueOf(ctiMap.get("CTI_QULITY_DATE")).equals("") ? "0" : String.valueOf(ctiMap.get("CTI_QULITY_DATE"));
    String ctiThawingCycle = String.valueOf(ctiMap.get("CTI_THAWING_CYCLE")).equals("") ? "0" : String.valueOf(ctiMap.get("CTI_THAWING_CYCLE"));
    String ctiMemo = String.valueOf(ctiMap.get("CTI_MEMO"));
    Date ctiExpireDate = (Date)ctiMap.get("CTI_EXPIRE_DATE");
    Date ctiProductDate = (Date)ctiMap.get("CTI_PRODUCT_DATE");
    String ctiTinSn = String.valueOf(ctiMap.get("CTI_TIN_SN"));
    String ctiThawingTimeMax = String.valueOf(ctiMap.get("CTI_THAWING_TIME_MAX")).equals("") ? "0" : String.valueOf(ctiMap.get("CTI_THAWING_TIME_MAX"));
    String ctiInstockMan = String.valueOf(ctiMap.get("CTI_INSTOCK_MAN"));
    String ctiReflowTime = String.valueOf(ctiMap.get("CTI_REFLOW_TIME")).equals("") ? "0" : String.valueOf(ctiMap.get("CTI_REFLOW_TIME"));
    String ctiSupplierCode = String.valueOf(ctiMap.get("CTI_SUPPLIER_CODE"));
    String ctiLot2 = String.valueOf(ctiMap.get("CTI_LOT"));
    String ctiRohsFlag = String.valueOf(ctiMap.get("CTI_ROHS_FLAG"));
    String ctiStockSn = String.valueOf(ctiMap.get("CTI_STOCK_SN"));
    
    // 插入设备基本信息
    HttpServletRequest request = modelAction.getRequest();
    //String dataAuth = request.getParameter("_DATA_AUTH");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
    TableDataMapExt device = new TableDataMapExt();
    CommMethod.addSysDefCol(device.getColMap(), modelAction.getUser());
    device.setTableName("T_CO_TIN_INFO");
    device.getColMap().put("ID", infoId);
    device.getColMap().put("CTI_EXPIRE_DATE", ctiExpireDate); // 品质至到期时间
    // device.getColMap().put("CTI_EXPIRE_DATE_OPEN", ctimap.get("CTI_EXPIRE_DATE_OPEN"));
    device.getColMap().put("CTI_INSTOCK_DOC", ctiInstockDoc);
    device.getColMap().put("CTI_INSTOCK_MAN", userId);
    device.getColMap().put("CTI_INSTOCK_TIME", ctiInstockTime);// 入库时间
    device.getColMap().put("CTI_PRODUCT_DATE", ctiProductDate);// 生产日期
    device.getColMap().put("CTI_ITEM_CODE", ctiItemCode);
    device.getColMap().put("CTI_LOT", ctiLot); // 生产批号
    device.getColMap().put("CTI_MEMO", ctiMemo);
    device.getColMap().put("CTI_QULITY_DATE", Integer.valueOf(ctiQulityDate));
    device.getColMap().put("CTI_QULITY_DATE_OPEN", Integer.valueOf(ctiQulityDateOpen));
    device.getColMap().put("CTI_REFLOW_TIME", Integer.valueOf(ctiReflowTime));
    device.getColMap().put("CTI_ROHS_FLAG", ctiRohsFlag);// ROHS标记
    device.getColMap().put("CTI_SUPPLIER_CODE", ctiSupplierCode);
    device.getColMap().put("CTI_THAWING_CYCLE", Integer.valueOf(ctiThawingCycle));
    device.getColMap().put("CTI_THAWING_TIME_MAX", Integer.valueOf(ctiThawingTimeMax));
    // device.getColMap().put("CTI_THAWING_TIME_TOTAL",ctimap.get("CTI_THAWING_TIME_TOTAL"));
    device.getColMap().put("CTI_TIN_SN", ctiTinSn);
    device.getColMap().put("CTI_TIN_STATUS", "0"); // 状态 入库状态，默认为0-->在库
    device.getColMap().put("CTI_WEIGHT", ctiWeight);
    device.getColMap().put("CTI_SUPPLIER_CODE", ctiSupplierCode);
    device.getColMap().put("CTI_ITEM_TYPE", ctiItemType);
    device.getColMap().put("CTI_DECIDE", ctiDecide);
    device.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
    device.getColMap().put("CTI_STOCK_SN", ctiStockSn);
    device.getColMap().put("CTI_MIX_TIME",
      Integer.valueOf(String.valueOf(ctiMap.get("CTI_MIX_TIME"))));// 搅拌时间
    device.getColMap().put("CTI_THAWING_DECAY",
      Integer.valueOf(String.valueOf(ctiMap.get("CTI_THAWING_DECAY"))));// 回温衰减
    device.getColMap().put("CTI_THAWING_MAX_CYCLE",
      Integer.valueOf(String.valueOf(ctiMap.get("CTI_THAWING_MAX_CYCLE"))));// 回温上限时间（分钟）
    device.getColMap().put("CTI_MIX_MAX_TIME",
      Integer.valueOf(String.valueOf(ctiMap.get("CTI_MIX_MAX_TIME"))));// 回温上限时间（分钟）
    try
    {
      modelService.save(device);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("增加失败"), e);
    }
  }

  /**
   * 根据最大生产批号 算流水号(3位)
   * 
   * @param ctilotmax
   * @param i
   * @return
   */
  public String getCtilot(int ctilotMax, int index)
  {
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

  /**
   * 获取前台参数
   * 
   * @param modelAction
   * @return
   */

  public static Map<String, Object> getParameters(ModelAction modelAction)
  {
    Map<String, Object> ctiMap = new HashMap<String, Object>();
    String ctiExpireDate = modelAction.getRequest().getParameter("CTI_EXPIRE_DATE");// 品质到期时间
                                                                                    // CTI_LOT
    ctiMap.put("CTI_EXPIRE_DATE", DateUtil.parseDate(ctiExpireDate, "yyyy-MM-dd HH:mm:ss"));
    String ctiSupplier = modelAction.getRequest().getParameter("paraMap1@0#CTI_SUPPLIER");// 获得供应商代码
    ctiMap.put("CTI_SUPPLIER", ctiSupplier);
    String ctiLot = modelAction.getRequest().getParameter("paraMap1@0#CTI_LOT");// 生产批号
    ctiMap.put("CTI_LOT", ctiLot);
    // String
    // CTI_EXPIRE_DATE_OPEN=modelAction.getRequest().getParameter("CTI_EXPIRE_DATE_OPEN");//开罐报废时间
    // 表格没有数据？？？
    // ctimap.put("CTI_EXPIRE_DATE_OPEN", CTI_EXPIRE_DATE_OPEN); CTI_ITEM_CODE
    String ctiInstockDoc = modelAction.getRequest().getParameter("paraMap1@0#CTI_INSTOCK_DOC");// 入库单号
    ctiMap.put("CTI_INSTOCK_DOC", ctiInstockDoc);
    String ctiInstockMan = modelAction.getRequest().getParameter("CTI_INSTOCK_MAN");// 入库人
    ctiMap.put("CTI_INSTOCK_MAN", ctiInstockMan);
    String ctiInstockTime = modelAction.getRequest().getParameter("CTI_INSTOCK_TIME");// 入库时间
    ctiMap.put("CTI_INSTOCK_TIME", DateUtil.parseDate(ctiInstockTime, "yyyy-MM-dd HH:mm:ss"));
    String ctiProductDate = modelAction.getRequest().getParameter("paraMap1@0#CTI_PRODUCT_DATE");// 生产日期
    ctiMap.put("CTI_PRODUCT_DATE", DateUtil.parseDate(ctiProductDate, "yyyy-MM-dd HH:mm:ss"));
    String ctiItemCode = modelAction.getRequest().getParameter("paraMap1@0#CTI_ITEM_CODE");// 辅料料号
    ctiMap.put("CTI_ITEM_CODE", ctiItemCode);
    String ctiMemo = modelAction.getRequest().getParameter("paraMap1@0#CTI_MEMO");// 备注
    // String CTI_TIN_STATUS=modelAction.getRequest().getParameter("CTI_TIN_STATUS2");
    // ctimap.put("paraMap1_CTI_ITEM_CODE",CTI_TIN_STATUS );
    String ctiItemType = modelAction.getRequest().getParameter("ctiItemType");
    ctiMap.put("CTI_ITEM_TYPE", ctiItemType);
    // 判断状态的编号
    if (ctiMemo.equals(""))
    {
      ctiMap.put("CTI_MEMO", "");
    }
    else
    {
      ctiMap.put("CTI_MEMO", ctiMemo);
    }
    String ctiQulityDate = modelAction.getRequest().getParameter("CTI_QULITY_DATE");// 保质期（天）

    if (ctiQulityDate.equals(""))
    {
      ctiMap.put("CTI_QULITY_DATE", "0");
    }
    else
    {
      ctiMap.put("CTI_QULITY_DATE", ctiQulityDate);
    }

    String ctiQulityDateOpen = modelAction.getRequest().getParameter("CTI_QULITY_DATE_OPEN");// 开罐保质期（分钟）

    if (ctiQulityDateOpen.equals(""))
    {
      ctiMap.put("CTI_QULITY_DATE_OPEN", "0");
    }
    else
    {
      ctiMap.put("CTI_QULITY_DATE_OPEN", ctiQulityDateOpen);
    }
    String ctiReflowTime = modelAction.getRequest().getParameter("CTI_REFLOW_TIME");// 过炉时间（分钟）1

    if (ctiReflowTime.equals(""))
    {
      ctiMap.put("CTI_REFLOW_TIME", "0");
    }
    else
    {
      ctiMap.put("CTI_REFLOW_TIME", ctiReflowTime);
    }
    String ctiRohsFlag = modelAction.getRequest().getParameter("paraMap1@0#CTI_ROHS_FLAG");// RoHS标志
    if (!"Y".equals(ctiRohsFlag))
    {
      ctiMap.put("CTI_ROHS_FLAG", "N");
    }
    else
    {
      ctiMap.put("CTI_ROHS_FLAG", ctiRohsFlag);
    }
    String ctiStockSn = modelAction.getRequest().getParameter("STORAGE_CODE");// 库位SN
    ctiMap.put("CTI_STOCK_SN", ctiStockSn);
    String ctiSupplierCode = modelAction.getRequest().getParameter("paraMap1@0#CTI_SUPPLIER");// 供应商代码
                                                                                              // 只知道供应商的名称？？？
    ctiMap.put("CTI_SUPPLIER_CODE", ctiSupplierCode);

    String ctiThawingCycle = modelAction.getRequest().getParameter("CTI_THAWING_CYCLE");// 回温时长（分钟）

    if (ctiThawingCycle.equals(""))
    {
      ctiMap.put("CTI_THAWING_CYCLE", "0");
    }
    else
    {
      ctiMap.put("CTI_THAWING_CYCLE", ctiThawingCycle);
    }
    String ctiThawingTimeMax = modelAction.getRequest().getParameter("CTI_THAWING_TIME_MAX");// 回温次数上限

    if (ctiThawingTimeMax.equals(""))
    {
      ctiMap.put("CTI_THAWING_TIME_MAX", "0");
    }
    else
    {
      ctiMap.put("CTI_THAWING_TIME_MAX", ctiThawingTimeMax);
    }
    // String
    // CTI_THAWING_TIME_TOTAL=modelAction.getRequest().getParameter("CTI_THAWING_TIME_TOTAL");//累计回温次数
    // 前台没有数据
    // ctimap.put("CTI_THAWING_TIME_TOTAL",CTI_THAWING_TIME_TOTAL );
    String ctiTinSn = modelAction.getRequest().getParameter("paraMap1@0#CTI_TIN_SN");// 锡膏胶水SN
    if (("").equals(ctiTinSn))
    {
      ctiMap.put("CTI_TIN_SN", "");
    }
    else
    {
      // ctiMap.put("CTI_TIN_SN", ctiThawingTimeMax);
      ctiMap.put("CTI_TIN_SN", ctiTinSn);
    }
    // String CTI_TIN_STATUS=modelAction.getRequest().getParameter("CTI_TIN_STATUS");//状态 前台没有数据
    // ctimap.put("CTI_TIN_STATUS",CTI_TIN_STATUS );
    // String CTI_TOTAL_OPEN=modelAction.getRequest().getParameter("CTI_TOTAL_OPEN");//累计开罐时间（分钟）
    // 前台没有数据
    // ctimap.put("CTI_TOTAL_OPEN",CTI_TOTAL_OPEN );
    String ctiWeight = modelAction.getRequest().getParameter("paraMap1@0#CTI_WEIGHT");// 重量（克）
    ctiMap.put("CTI_WEIGHT", ctiWeight);
    // String CTI_WH_CODE=modelAction.getRequest().getParameter("CTI_WH_CODE");//仓库SN (入库单号)前台没有数据
    // ctimap.put("CTI_WH_CODE", CTI_WH_CODE);
    String ctiThawingDecay = modelAction.getRequest().getParameter("paraMap1@0#CTI_THAWING_DECAY");
    if (StringUtils.isNotBlank(ctiThawingDecay))
    {
      ctiMap.put("CTI_THAWING_DECAY", ctiThawingDecay);
    }
    else
    {
      ctiMap.put("CTI_THAWING_DECAY", "0");
    }
    String ctiMixTime = modelAction.getRequest().getParameter("paraMap1@0#CTI_MIX_TIME");
    if (StringUtils.isNotBlank(ctiMixTime))
    {
      ctiMap.put("CTI_MIX_TIME", ctiMixTime);
    }
    else
    {
      ctiMap.put("CTI_MIX_TIME", "0");
    }
    String ctiThawingMaxCycle = modelAction.getRequest().getParameter(
      "paraMap1@0#CTI_THAWING_MAX_CYCLE");
    if (StringUtils.isNotBlank(ctiThawingMaxCycle))
    {
      ctiMap.put("CTI_THAWING_MAX_CYCLE", ctiThawingMaxCycle);
    }
    else
    {
      ctiMap.put("CTI_THAWING_MAX_CYCLE", "0");
    }
    String ctiMixMaxTime = modelAction.getRequest().getParameter("paraMap1@0#CTI_MIX_MAX_TIME");
    if (StringUtils.isNotBlank(ctiMixMaxTime))
    {
      ctiMap.put("CTI_MIX_MAX_TIME", ctiMixMaxTime);
    }
    else
    {
      ctiMap.put("CTI_MIX_MAX_TIME", "0");
    }
    return ctiMap;
  }

  /**
   * 当料号、生产批号与当前新增的项一致时，获取最大的批次数量
   * 
   * @param ctilots
   *          流水号
   * @return 获取最大的批次数量
   */
  public static int getMaxClot(List<String> ctilots)
  {
    List<String> lastThrees = new ArrayList<String>();// 封装所有流水号的后三位
    String lastmax = "";// 用于返回最大的流水号
    int max = 0;
    for (int i = 0; i < ctilots.size(); i++ )
    {
      String ctilot = ctilots.get(i);
      String lastThree = ctilot.substring(ctilot.length() - 3);
      lastThrees.add(lastThree);
    }
    lastmax = lastThrees.get(0);
    max = Integer.parseInt(lastThrees.get(0));
    for (int i = 1; i < lastThrees.size(); i++ )
    {
      int min = Integer.parseInt(lastThrees.get(i));
      if (min > max)
      {
        lastmax = lastThrees.get(i);
        max = Integer.parseInt(lastThrees.get(i));
      }
    }
    return Integer.parseInt(lastmax);
  }
}
