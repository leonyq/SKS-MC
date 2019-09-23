/*
 * @File GetSn.java
 * @Package com.more.mes.smt.snconfigure
 * @Copyinght Copyright (c) 2018
 * @Company morelean
 * @author csj
 * @date 2018-11-21 上午9:26:48
 * @version V1.0
 */

package com.more.mes.smt.getsnhttp.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

public class GetSnService
{
  private final Log log = LogFactory.getLog(this.getClass());

  private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

  private String USERID;

  private int MAXNUM = 0;

  // 获取数据项
  public String getCodeSegment(String configureType, String sourceStr, String params)
  {
    String returnStr = "";
    List<Map<String, Object>> itemList = new ArrayList<Map<String, Object>>();
    try
    {
      sourceStr = sourceStr.toUpperCase();
      sourceStr = sourceStr.replaceAll(";", "");
      sourceStr = sourceStr.replaceAll("\\{[^{}]+\\}", "?");
      boolean tempFlag = true;
      if ("".equals(params) || params == null)
      {
        tempFlag = false;
      }
      if ("2".equals(configureType))
      {
        // SQL NG6 NG7
        // params：参数1,参数2,...
        if (tempFlag == false)
        {
          itemList = modelService.listDataSql(sourceStr);
        }
        else
        {
          String[] param = params.split(",");
          int len = param.length;
          Object[] tempParams = new Object[len];
          for (int i = 0; i < len; i++ )
          {
            tempParams[i] = param[i];
          }
          itemList = modelService.listDataSql(sourceStr, tempParams);
        }
        if (itemList.size() > 1)
        {
          returnStr = "NG6";
        }
        else if (itemList.size() == 0)
        {
          returnStr = "NG7";
        }
        else
        {
          Map<String, Object> tempMap = itemList.get(0);
          Iterator<Entry<String, Object>> i = tempMap.entrySet().iterator();
          Entry entry = i.next();
          String tempStr = StringUtils.toString(entry.getValue());
          returnStr = StringUtils.toString(entry.getValue());
        }
      }
      else if ("3".equals(configureType))
      {
        // 存储过程 NG8
        // params:参数1,参数2,...
        int len = 0;
        String[] param = new String[] {};
        if (tempFlag == true)
        {
          param = params.split(",");
          len = param.length;
        }
        ProFuncDto pf = new ProFuncDto();
        int[] inPlace = new int[len];
        for (int i = 0; i < len; i++ )
        {
          int j = i + 1;
          inPlace[i] = j;
        }
        int[] outplace = {len + 1};
        List<Object> list = new ArrayList<Object>();
        List<Object> outType = new ArrayList<Object>();
        for (int i = 0; i < len; i++ )
        {
          list.add(param[i]);
        }
        outType.add("String");
        pf.setClassName(sourceStr);// 获取辅料制具条码规则id
        pf.setInPlace(inPlace);// 存储过程中in
        pf.setOutPlace(outplace); // 存储过程中out
        pf.setValArgs(list);// 存储过程中输入的参数
        pf.setTotalLen(list.size() + outType.size());// 总个数
        pf.setOutValType(outType);// 输出的参数
        List<Object> relist = modelService.procComm(pf);// 接收返回值
        String res = (String)relist.get(0); // 结果
        if (relist.size() == 0)
        {
          returnStr = "NG9";
        }
        else if (relist.size() > 1)
        {
          returnStr = "NG10";
        }
        else if ("failure".equals(res))
        {
          returnStr = "NG8";
        }
        else
        {
          returnStr = res;
        }
      }
    }
    catch (Exception e)
    {
      log.error(e);
      returnStr = "NG1";
    }
    return returnStr;
  }

  // 获取日期变量
  public String getDateStr(String bvId)
  {
    // ML_BARCODE_VAL
    // ML_BARCODE_VARIABLES
    // type：年 2,月 3,日 4
    String returnStr = "";
    try
    {
      Calendar now = Calendar.getInstance();
      String year = now.get(Calendar.YEAR) + "";
      String month = (now.get(Calendar.MONTH) + 1) + "";
      String day = now.get(Calendar.DAY_OF_MONTH) + "";

      String sql = "SELECT T.DECIMAL_DIGITS,T.BARCODE_TYPE FROM ML_BARCODE_VARIABLES T WHERE T.ID=?";
      List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] {bvId});

      String type = StringUtils.toString(list.get(0).get("BARCODE_TYPE"));
      sql = "SELECT T.DISPLAY_VAL FROM ML_BARCODE_VAL T WHERE T.BV_ID=? AND T.ORIGINAL_VALUE=?";
      if ("2".equals(type))
      {
        list = modelService.listDataSql(sql, new Object[] {bvId, year});
      }
      else if ("3".equals(type))
      {
        list = modelService.listDataSql(sql, new Object[] {bvId, month});
      }
      else if ("4".equals(type))
      {
        list = modelService.listDataSql(sql, new Object[] {bvId, day});
      }
      returnStr = StringUtils.toString(list.get(0).get("DISPLAY_VAL"));
    }
    catch (Exception e)
    {
      log.error(e);
      returnStr = "NG3";
    }
    return returnStr;
  }

  // 获取流水号
  public String getSerialNum(String bvId, String startResetStr, String startSeq, String itemLen,
                             String fillType, String fillChar, int index,String dataAuth)
  {
    // ML_BARCODE_VAL
    // ML_BARCODE_VARIABLES
    String returnStr = "";
    try
    {
      String sql = "SELECT T.DECIMAL_DIGITS,T.BARCODE_TYPE FROM ML_BARCODE_VARIABLES T WHERE T.ID=? AND T.DATA_AUTH=? ";
      List<Map<String, Object>> list2 = modelService.listDataSql(sql, new Object[] {bvId,dataAuth});

      int maxNum = MAXNUM + index + 1;
      // 流水号进制转换

      sql = "SELECT T.DISPLAY_VAL FROM ML_BARCODE_VAL T WHERE T.BV_ID=? AND T.DATA_AUTH";
      List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] {bvId,dataAuth});
      int len = list.size();
      String chs[] = new String[len];
      {
        for (int i = 0; i < len; i++ )
        {
          chs[i] = StringUtils.toString((list.get(i).get("DISPLAY_VAL")));
        }
      }
      StringBuilder sb = new StringBuilder();
      int decimalDigits = Integer.parseInt(StringUtils.toString(list2.get(0).get("DECIMAL_DIGITS")));
      while (maxNum != 0)
      {
        sb.insert(0, chs[maxNum % decimalDigits]);
        maxNum = maxNum / decimalDigits;
      }
      returnStr = sb.toString();

      int strLen = returnStr.length();
      int tempLen = Integer.parseInt(itemLen);
      if (strLen > tempLen)
      {
        returnStr = "NG5";
      }
      else
      {
        if ("2".equals(fillType))
        {
          // 左填充
          String tempStr = "%" + tempLen + "s";
          returnStr = String.format(tempStr, returnStr).replace(' ', fillChar.charAt(0));
        }
        else if ("3".equals(fillType))
        {
          // 右填充
          String tempStr = "%-" + tempLen + "s";
          returnStr = String.format(tempStr, returnStr).replace(' ', fillChar.charAt(0));
        }
      }
    }
    catch (Exception e)
    {
      log.error(e);
      returnStr = "NG4";
    }
    return returnStr;
  }

  // 流水号递增
  public void saveMaxNum(String startResetStr, String startSeq, String dataAuth) {
    String returnStr = "";
    List<String> lockData = new ArrayList<String>();
    List<String> lockUser = new ArrayList<String>();
    try
    {
      lockData.add(startResetStr);
      for (String lock : lockData)
      {
        lockUser.add(USERID);
      }
      SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      if (lockData.isEmpty() || CommMethod.getLock(lockData, lockUser))
      {
        String sql = "SELECT T.MSS_MAX_NUM FROM T_CO_MID_SPLIT_SN T WHERE T.MSS_ITEM_SN=? AND T.DATA_AUTH=?  ";
        List<Map<String, Object>> list = modelService.listDataSql(sql,
          new Object[] {startResetStr,dataAuth});
        if ((list == null) || list.isEmpty())
        {
          // 不存在 新增
          String infoId = StringUtils.getUUID();
          TableDataMapExt mssMap = new TableDataMapExt();
          mssMap.setTableName("T_CO_MID_SPLIT_SN");
          mssMap.getColMap().put("ID", infoId);// id
          mssMap.getColMap().put("MSS_ITEM_SN", startResetStr);// 唯一条码
          mssMap.getColMap().put("MSS_MAX_NUM", startSeq);// 最大流水号
          mssMap.getColMap().put("MSS_CREATE_TIME", sdf2.parse(sdf2.format(new Date())));// 生成时间
          modelService.save(mssMap);

          returnStr = startSeq;
        }
        else
        {
          // 存在 获取最大流水 并修改最大流水号
          int tempNo = Integer.parseInt(StringUtils.toString(list.get(0).get("MSS_MAX_NUM")));
          tempNo = tempNo + 1;
          returnStr = tempNo + "";

          TableDataMapExt mssMap = new TableDataMapExt();
          mssMap.setTableName("T_CO_MID_SPLIT_SN");
          ArrayList<Object> paraList = new ArrayList<Object>();
          mssMap.setSqlWhere(" and MSS_ITEM_SN=  ? ");
          paraList.add(startResetStr);
          mssMap.setSqlWhereArgs(paraList);
          mssMap.getColMap().put("MSS_MAX_NUM", returnStr);
          modelService.edit(mssMap);
        }
      }
    }
    catch (Exception e)
    {
      log.error(e);
    }
    finally
    {
      boolean lock = CommMethod.unLock(lockData, lockUser);
      log.info("unlock:" + lock);
    }
  }

  public List<String> getSnByConfigureId(String configureId, String params, String codeNum,
                                         String userId,  String dataAuth)
    throws ParseException
  {
    USERID = userId;
    // T_CO_SN_CONFIGURE
    // T_CO_SN_CONFIGURE_DETAIL
    // T_CO_MID_SPLIT_SN
    String snErrorStr = "";
    boolean flag = true;
    String flagStr = "";
    List<String> returnList = new ArrayList<String>();
    String startNum = "";
    int codeNumber = 1;
    if (codeNum != null && !"".equals(codeNum))
    {
      codeNumber = Integer.parseInt(codeNum);
    }
    String sql = "SELECT T.CCD_CODE_SEGMENT   CODE_SEGENT, "
                 + " T.CCD_ITEM_VALUE     ITEM_VALUE, " + " T.CCD_ITEM_LEN       ITEM_LEN, "
                 + " T.CCD_FILL_TYPE      FILL_TYPE, " + " T.CCD_FILL_CHAR      FILL_CHAR, "
                 + " T.CCD_START_NUM      START_SEQ, " + " T.CCD_START_RESET    START_RESET, "
                 + " T.CCD_CONFIGURE_TYPE CONFIGURE_TYPE, "
                 + " T.CCD_CONFIGURE_VAL  CONFIGURE_VAL " + " FROM T_CO_SN_CONFIGURE_DETAIL T "
                 + " WHERE T.CCD_CONFIGURE_ID = ? AND T.DATA_AUTH=? " + " ORDER BY T.CCD_CONFIGURE_SEQ ";
    List<Map<String, Object>> snList = modelService.listDataSql(sql, new Object[] {configureId,dataAuth});
    if (snList.isEmpty() || snList == null)
    {
      snErrorStr = "NG";
      flag = false;
      flagStr = "NG";
    }
    else
    {
      int len = snList.size();
      // 获取流水重置标志
      String startResetStr = "";
      for (int i = 0; i < len; i++ )
      {
        String startReset = StringUtils.toString(snList.get(i).get("START_RESET"));
        if ("Y".equals(startReset))
        {
          String codeSegment = StringUtils.toString(snList.get(i).get("CODE_SEGENT"));
          if ("1".equals(codeSegment))
          {
            // 数据项
            String configureType = StringUtils.toString(snList.get(i).get("CONFIGURE_TYPE"));
            String configureVal = StringUtils.toString(snList.get(i).get("CONFIGURE_VAL"));
            if ("1".equals(configureType))
            {
              // 传入参数
              startResetStr += configureVal;
              flagStr = configureVal;
            }
            else
            {
              String tempStr = "";
              tempStr = getCodeSegment(configureType, configureVal, params);
              startResetStr += tempStr;
              flagStr = tempStr;
            }
          }
          else if ("2".equals(codeSegment))
          {
            // 文本
            String itemValue = StringUtils.toString(snList.get(i).get("ITEM_VALUE"));
            startResetStr += itemValue;
            flagStr = itemValue;
          }
          else if ("3".equals(codeSegment))
          {
            // 日期变量
            String tempStr = "";
            String bvId = StringUtils.toString(snList.get(i).get("ITEM_VALUE"));
            tempStr = getDateStr(bvId);
            startResetStr += tempStr;
            flagStr = tempStr;
          }
        }
        if ("NG1".equals(flagStr))
        {
          flag = false;
          snErrorStr = "未知错误(数据项)";
          break;
        }
        else if ("NG3".equals(flagStr))
        {
          flag = false;
          snErrorStr = "未知错误(日期变量)";
          break;
        }
        else if ("NG6".equals(flagStr))
        {
          flag = false;
          snErrorStr = "数据源返回多笔数据";
          break;
        }
        else if ("NG7".equals(flagStr))
        {
          flag = false;
          snErrorStr = "数据源查询无数据";
          break;
        }
        else if ("NG8".equals(flagStr))
        {
          flag = false;
          snErrorStr = "存储过程返回值错误";
          break;
        }
        else if ("NG9".equals(flagStr))
        {
          flag = false;
          snErrorStr = "存储过程无返回值";
          break;
        }
        else if ("NG10".equals(flagStr))
        {
          flag = false;
          snErrorStr = "存储过程输出多个值";
          break;
        }
        else if ("NG11".equals(flagStr))
        {
          flag = false;
          snErrorStr = "数据源存储过程不允许输入参数";
          break;
        }
      }
      if (flag == true)
      {
        String tempSql = "SELECT T.MSS_MAX_NUM FROM T_CO_MID_SPLIT_SN T WHERE T.MSS_ITEM_SN=? and T.DATA_AUTH=? ";
        List<Map<String, Object>> list = modelService.listDataSql(tempSql,
          new Object[] {startResetStr,dataAuth});
        if (list == null || list.isEmpty())
        {
          String tempStartSeq = StringUtils.toString(snList.get(0).get("START_SEQ"));
          if ("".equals(tempStartSeq) || tempStartSeq == null)
          {
            MAXNUM = 0;
          }
          else
          {
            MAXNUM = Integer.parseInt(tempStartSeq);
          }
        }
        else
        {
          MAXNUM = Integer.parseInt(StringUtils.toString(list.get(0).get("MSS_MAX_NUM")));
        }
        for (int j = 0; j < codeNumber; j++ )
        {
          String tempSnStr2 = "";
          for (int i = 0; i < len; i++ )
          {
            String tempSnStr = "";
            String codeSegment = StringUtils.toString(snList.get(i).get("CODE_SEGENT"));
            if ("1".equals(codeSegment))
            {
              // 数据项
              String configureType = StringUtils.toString(snList.get(i).get("CONFIGURE_TYPE"));
              String configureVal = StringUtils.toString(snList.get(i).get("CONFIGURE_VAL"));
              if ("1".equals(configureType))
              {
                // 传入参数
                tempSnStr = configureVal;
              }
              else
              {
                tempSnStr = getCodeSegment(configureType, configureVal, params);
              }
            }
            else if ("2".equals(codeSegment))
            {
              // 文本
              String itemValue = StringUtils.toString(snList.get(i).get("ITEM_VALUE"));
              tempSnStr = itemValue;
            }
            else if ("3".equals(codeSegment))
            {
              // 日期变量
              String bvId = StringUtils.toString(snList.get(i).get("ITEM_VALUE"));
              tempSnStr = getDateStr(bvId);
            }
            else if ("4".equals(codeSegment))
            {
              // 流水号
              startNum = StringUtils.toString(snList.get(i).get("START_SEQ"));
              String startSeq = StringUtils.toString(snList.get(i).get("START_SEQ"));
              String itemLen = StringUtils.toString(snList.get(i).get("ITEM_LEN"));
              String fillType = StringUtils.toString(snList.get(i).get("FILL_TYPE"));
              String fillChar = StringUtils.toString(snList.get(i).get("FILL_CHAR"));
              String bvId = StringUtils.toString(snList.get(i).get("ITEM_VALUE"));

              tempSnStr = getSerialNum(bvId, startResetStr, startSeq, itemLen, fillType, fillChar,
                j,dataAuth);
            }
            if ("NG1".equals(flagStr))
            {
              flag = false;
              snErrorStr = "未知错误(数据项)";
              break;
            }
            else if ("NG3".equals(flagStr))
            {
              flag = false;
              snErrorStr = "未知错误(日期变量)";
              break;
            }
            else if ("NG6".equals(flagStr))
            {
              flag = false;
              snErrorStr = "数据源返回多笔数据";
              break;
            }
            else if ("NG7".equals(flagStr))
            {
              flag = false;
              snErrorStr = "数据源查询无数据";
              break;
            }
            else if ("NG8".equals(flagStr))
            {
              flag = false;
              snErrorStr = "存储过程返回值错误";
              break;
            }
            else if ("NG9".equals(flagStr))
            {
              flag = false;
              snErrorStr = "存储过程无返回值";
              break;
            }
            else if ("NG10".equals(flagStr))
            {
              flag = false;
              snErrorStr = "存储过程输出多个值";
              break;
            }
            if ("NG4".equals(tempSnStr))
            {
              flag = false;
              snErrorStr = "未知错误(流水号)";
              break;
            }
            else if ("NG5".equals(tempSnStr))
            {
              flag = false;
              snErrorStr = "流水号超出设置的位数";
              break;
            }
            else if ("NG11".equals(flagStr))
            {
              flag = false;
              snErrorStr = "数据源存储过程不允许输入参数";
              break;
            }
            // snErrorStr += tempSnStr;
            tempSnStr2 += tempSnStr;
          }
          if (flag == false)
          {
            returnList.add(snErrorStr);
            break;
          }
          else
          {
            returnList.add(tempSnStr2);
          }
          saveMaxNum(startResetStr, startNum,dataAuth);
        }
      }
      else
      {
        returnList.add(snErrorStr);
      }
    }
    return returnList;
  }
  public String getSnForWordOrder(String dataAuth, String productConfigure, String productSnPrefix, String PRODUCT_COUNT)
  {
    String returnStr = "";
    String configureId = "";
    if ("".equals(dataAuth) || dataAuth == null || "null".equals(dataAuth)
        || "undefined".equals(dataAuth))
    {
      dataAuth = "";
    }
    if ("".equals(productConfigure) || productConfigure == null || "null".equals(productConfigure)
        || "undefined".equals(productConfigure))
    {
      productConfigure = "";
    }
    if ("".equals(productSnPrefix) || productSnPrefix == null || "null".equals(productSnPrefix) || "undefined".equals(productSnPrefix))
    {
      productSnPrefix = "";
    }
    if ("".equals(dataAuth) || dataAuth == null || "null".equals(dataAuth)
        || "undefined".equals(dataAuth))
    {
      dataAuth = "";
    }
    String params = "M_PARAM:'" + productSnPrefix ;
      returnStr = getSnByProcedure(dataAuth,productConfigure, params, PRODUCT_COUNT);
    
    return returnStr;
  }
  public String getSnByProcedure(String dataAuth,String configureId, String params, String codeNum)
  {
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2, 3, 4};
    int[] outplace = {5, 6};
    List<Object> list = new ArrayList<Object>();
    List<Object> outType = new ArrayList<Object>();
    list.add(dataAuth);
    list.add(configureId);
    list.add(params);
    list.add(codeNum);
    outType.add("String");
    outType.add("String");
    pf.setClassName("P_C_GET_SN");// 获取辅料制具条码规则id
    pf.setInPlace(inPlace);// 存储过程中in
    pf.setOutPlace(outplace); // 存储过程中out
    pf.setValArgs(list);// 存储过程中输入的参数
    pf.setTotalLen(list.size() + outType.size());// 总个数
    pf.setOutValType(outType);// 输出的参数
    List<Object> relist = modelService.procComm(pf);// 接收返回值
    String res = (String)relist.get(1); // 结果
    String returnStr = "";
    if (!"OK".equals(res))
    {
      returnStr = res;
    }
    else
    {
      returnStr = (String)relist.get(0);
    }
    return returnStr;
  }

  public String getSnForDocNum(String docType, String dispatchType, String emp, String dataAuth)
  {
    String returnStr = "";
    String configureId = "";
    if ("".equals(docType) || docType == null || "null".equals(docType)
        || "undefined".equals(docType))
    {
      docType = "";
    }
    if ("".equals(dispatchType) || dispatchType == null || "null".equals(dispatchType)
        || "undefined".equals(dispatchType))
    {
      dispatchType = "";
    }
    if ("".equals(emp) || emp == null || "null".equals(emp) || "undefined".equals(emp))
    {
      emp = "";
    }
    if ("".equals(dataAuth) || dataAuth == null || "null".equals(dataAuth)
        || "undefined".equals(dataAuth))
    {
      dataAuth = "";
    }
    String params = "M_DOC_TYPE:'" + docType + "';M_DISPATCH_TYPE:'" + dispatchType + "';M_EMP:'"
                    + emp + "';M_DATA_AUTH:'" + dataAuth + "'";
    String codeNum = "1";
    boolean tempFlag = true;
    String tempSql = "";
    List<Map<String, Object>> list = null;
    tempSql = "SELECT T.WDT_CREATE_RULE CREATE_RULE FROM T_WMS_DISPATCH_TYPE T WHERE T.WDT_TYPE_SN=? AND T.WDO_DISPATCH_SN=? AND T.DATA_AUTH=? AND T.WDT_CREATE_RULE IS NOT NULL ";
    list = modelService.listDataSql(tempSql, new Object[] {docType, dispatchType,dataAuth});
    if (list.isEmpty() || list == null || StringUtils.isEmpty(list.get(0).get("CREATE_RULE")))
    {
      tempSql = "SELECT T.WDT_CREATE_RULE CREATE_RULE FROM T_WMS_DOC_TYPE T WHERE T.WDT_TYPE_SN=? AND T.DATA_AUTH=? AND T.WDT_CREATE_RULE IS NOT NULL";
      list = modelService.listDataSql(tempSql, new Object[] {docType,dataAuth});
      if (list.isEmpty() || list == null || StringUtils.isEmpty(list.get(0).get("CREATE_RULE")))
      {
        tempSql = "SELECT T.ID CREATE_RULE FROM T_CO_SN_CONFIGURE T WHERE T.CCC_CONFIGURE_TYPE='1' AND T.CCC_DEFAULT_FLAG='Y' AND T.ID IS NOT NULL AND T.DATA_AUTH=?";
        list = modelService.listDataSql(tempSql, new Object[] {dataAuth});
        if (list.isEmpty() || list == null)
        {
          tempFlag = false;
        }
      }
    }
    if (tempFlag == false)
    {
      returnStr = "NG:条码生成规则未配置";
    }
    else
    {
      configureId = StringUtils.toString(list.get(0).get("CREATE_RULE"));
      returnStr = getSnByProcedure(dataAuth,configureId, params, codeNum);
    }
    return returnStr;
  }
  
  

  public String getSnForTinCode(String itemCode, String itemType, String emp, String dataAuth,
                                int num)
  {
    String returnStr = "";
    String configureId = "";
    if ("".equals(itemCode) || itemCode == null || "null".equals(itemCode)
        || "undefined".equals(itemCode))
    {
      itemCode = "";
    }
    if ("".equals(itemType) || itemType == null || "null".equals(itemType)
        || "undefined".equals(itemType))
    {
      itemType = "";
    }
    if ("".equals(emp) || emp == null || "null".equals(emp) || "undefined".equals(emp))
    {
      emp = "";
    }
    if ("".equals(dataAuth) || dataAuth == null || "null".equals(dataAuth)
        || "undefined".equals(dataAuth))
    {
      dataAuth = "";
    }
    String params = "M_ITEM_CODE:'" + itemCode + "';M_ITEM_TYPE:'" + itemType + "';M_EMP:'" + emp
                    + "';M_DATA_AUTH:'" + dataAuth + "'";
    String codeNum = num + "";
    boolean tempFlag = true;
    String tempSql = "";
    List<Map<String, Object>> list = null;
    tempSql = "SELECT T.TIN_CREATE_RULE CREATE_RULE FROM T_CO_ASSISTANTTOOL T WHERE T.ASSISTANTTOOLNO=?  AND T.DATA_AUTH=? AND T.TIN_CREATE_RULE IS NOT NULL";
    list = modelService.listDataSql(tempSql, new Object[] {itemCode,dataAuth});
    if (list.isEmpty() || list == null || StringUtils.isEmpty(list.get(0).get("CREATE_RULE")))
    {
      tempSql = "SELECT T.ID CREATE_RULE FROM T_CO_SN_CONFIGURE T WHERE T.CCC_CONFIGURE_TYPE='2' AND T.CCC_DEFAULT_FLAG='Y' AND T.ID IS NOT NULL  AND T.DATA_AUTH=?";
      list = modelService.listDataSql(tempSql, new Object[] {dataAuth});
      if (list.isEmpty() || list == null)
      {
        tempFlag = false;
      }
    }
    if (tempFlag == false)
    {
      returnStr = "NG:条码生成规则未配置";
    }
    else
    {
      configureId = StringUtils.toString(list.get(0).get("CREATE_RULE"));
      returnStr = getSnByProcedure(dataAuth,configureId, params, codeNum);
    }
    return returnStr;
  }
}
