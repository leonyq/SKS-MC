package com.more.mes.smt.qualityTest.service.pg;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class SaveMulitSampleTestService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = CommMethodMc.getDataAuthBySession(request);
    String inspectSn = request.getParameter("inspectSn");
    String qipSn = request.getParameter("qipSn");
    String itemNum = request.getParameter("itemNum");
    String testNum = request.getParameter("testNum");
    String scarpNum = request.getParameter("scarpNum");
    String errorInputNum = request.getParameter("errorInputNum");
    String sampleNum = request.getParameter("sampleNum");
    String ngFlagStr = request.getParameter("ngFlag");
    boolean ngFlag = false;
    if (!"false".equals(ngFlagStr))
    {
      ngFlag = true;
    }

    String delMulitInfoSql = "SELECT DISTINCT T.QII_SUBSET_SN "
                             + " FROM T_QM_INSPECT_ITEM_INFO T " + " WHERE T.QII_SN = ? "
                             + " AND T.QII_INSPECT_SN = ? AND T.DATA_AUTH=?" + " ORDER BY T.QII_SUBSET_SN ";

    List<Map<String, Object>> delMulitInfoList = modelService.listDataSql(delMulitInfoSql,
      new Object[] {qipSn, inspectSn,dataAuth});

    if (delMulitInfoList != null && !delMulitInfoList.isEmpty())
    {
      if (Integer.parseInt(testNum) < delMulitInfoList.size())
      {
        for (int i = Integer.parseInt(testNum); i < delMulitInfoList.size(); i++ )
        {
          String sampleSn = StringUtils.toString(delMulitInfoList.get(i).get("QII_SUBSET_SN"));
          String delMulitInfoSql2 = "DELETE FROM T_QM_INSPECT_ITEM_INFO T WHERE T.QII_INSPECT_SN=? AND T.QII_SN=? AND T.QII_SUBSET_SN =? AND T.DATA_AUTH=?";
          modelService.execSql(delMulitInfoSql2, new Object[] {inspectSn, qipSn, sampleSn,dataAuth});
        }
      }
    }
    /*
     * // 样本数据 String mulitSampleInfoStr = request.getParameter("mulitSampleInfo");// 每条样本子集SN的检测数据
     * 格式为 // 样本子集SN,01.04.1254$10$5877001,1,2,。。。|样本子集SN,01.04.1254$10$5877002,1,3,... String[]
     * mulitSampleInfo = mulitSampleInfoStr.split("\\|", -1); try { for (int i = 0; i <
     * mulitSampleInfo.length; i++ ) { String[] tempStr = mulitSampleInfo[i].split(",", -1); String
     * mulitSampleSn = tempStr[0]; mulitSampleSn.replace(" ", ""); String id = tempStr[1]; String
     * itemType = tempStr[2]; String itemSn = tempStr[3]; String itemName = tempStr[4]; String
     * itemClass = tempStr[5]; String itenUnit = tempStr[6]; String maxVal = tempStr[7]; String
     * minVal = tempStr[8]; String actualVal = tempStr[9]; String testRe = tempStr[10]; String
     * errorCode = tempStr[11]; String errorDec = tempStr[12]; String errorGrade = tempStr[13];
     * String errorNum = tempStr[14]; String testMethod = tempStr[15]; String testContent =
     * tempStr[16]; String memo = tempStr[17]; TableDataMapExt insItemMap = new TableDataMapExt();
     * insItemMap.setTableName("T_QM_INSPECT_ITEM_INFO"); if ("2".equals(testRe)) { ngFlag = true;
     * } if (!"".equals(id)) { // 修改 insItemMap.setSqlWhere(" and ID='" + id + "' and QII_SN='" +
     * qipSn + "'" + " and "); insItemMap.getColMap().put("QII_ITEM_CLASS", itemClass);//
     * 值域（0范围值，1固定值，2状态值） insItemMap.getColMap().put("QII_ACTUAL_VALUE", actualVal);// 实际值
     * insItemMap.getColMap().put("QII_ERROR_NUM", errorNum);// 不良数量
     * insItemMap.getColMap().put("QII_TEST_RESULT", testRe);// 检测结果(1-OK，2-NG)
     * insItemMap.getColMap().put("QII_ERROR_CODE", errorCode);// 不良代码
     * insItemMap.getColMap().put("QII_ERROR_GRADE", errorGrade);// 缺陷等级（1-轻缺陷，2-重缺陷，3-致命缺陷）
     * insItemMap.getColMap().put("QII_MEMO", memo);// 备注 modelService.edit(insItemMap); } else {
     * // 保存 CommMethod.addSysDefCol(insItemMap.getColMap(), modelAction.getUser());
     * insItemMap.getColMap().put("QII_SN", qipSn);// 样本SN
     * insItemMap.getColMap().put("QII_INSPECT_SN", inspectSn);// 检验单号
     * insItemMap.getColMap().put("QII_ITEM_SN", itemSn);// 项目代码
     * insItemMap.getColMap().put("QII_ITEM_NAME", itemName);// 项目名称
     * insItemMap.getColMap().put("QII_ITEM_TYPE", itemType);// 项目类型
     * insItemMap.getColMap().put("QII_ITEM_CLASS", itemClass);// 值域（0范围值，1固定值，2状态值）
     * insItemMap.getColMap().put("QII_ITEM_UNIT", itenUnit);// 单位
     * insItemMap.getColMap().put("QII_ITEM_MAXVALUE", maxVal);// 上限值
     * insItemMap.getColMap().put("QII_ITEM_MINVALUE", minVal);// 下限值
     * insItemMap.getColMap().put("QII_ACTUAL_VALUE", actualVal);// 实际值
     * insItemMap.getColMap().put("QII_TEST_RESULT", testRe);// 检测结果(1-OK，2-NG)
     * insItemMap.getColMap().put("QII_ERROR_CODE", errorCode);// 不良代码
     * insItemMap.getColMap().put("QII_ERROR_GRADE", errorGrade);// 缺陷等级（1-轻缺陷，2-重缺陷，3-致命缺陷）
     * insItemMap.getColMap().put("QII_ERROR_NUM", errorNum);// 不良数量
     * insItemMap.getColMap().put("QII_TEST_METHOD", testMethod);// 检测方法
     * insItemMap.getColMap().put("QII_TEST_CONTENT", testContent);// 检测内容
     * insItemMap.getColMap().put("QII_MEMO", memo);// 备注
     * insItemMap.getColMap().put("QII_SUBSET_SN", mulitSampleSn);// 样本子集SN
     * modelService.save(insItemMap); } } } catch (Exception e) { log.error(e); throw new
     * BussException(modelAction.getText("保存失败"), e); }
     */
    // 修改母本信息
    try
    {
      ArrayList<Object> paraList = new ArrayList<Object>();
      TableDataMapExt parItemMap = new TableDataMapExt();
      parItemMap.setTableName("T_QM_INSEPCT_PARENT_INFO");
      // parItemMap.setSqlWhere(" and QIP_SN='" + qipSn + "'" + " and QIP_INSPECT_SN='" + inspectSn
      // + "'");
      parItemMap.setSqlWhere(" and QIP_SN = ? and QIP_INSPECT_SN = ? AND DATA_AUTH=?");
      paraList.add(qipSn);
      paraList.add(inspectSn);
      paraList.add(dataAuth);
      parItemMap.setSqlWhereArgs(paraList);

      int scarpNumber = 0;
      if (!StringUtils.isBlank(scarpNum))
      {
        scarpNumber = Integer.parseInt(scarpNum);
      }
      int sampleNumber = 0;
      if (!StringUtils.isBlank(sampleNum))
      {
        sampleNumber = Integer.parseInt(sampleNum);
      }
      int errorInputNumber = 0;
      if (!StringUtils.isBlank(errorInputNum))
      {
        errorInputNumber = Integer.parseInt(errorInputNum);
      }
      parItemMap.getColMap().put("QIP_ITEM_NUM", Integer.parseInt(itemNum));// 母本数量
      parItemMap.getColMap().put("QIP_TEST_NUM", Integer.parseInt(testNum));// 检验数量
      parItemMap.getColMap().put("QIP_SCARP_NUM", scarpNumber);// 损耗数量
      parItemMap.getColMap().put("QIP_SAMPLE_NUM", sampleNumber);// 损耗数量
      parItemMap.getColMap().put("QIP_ERROR_NUM", errorInputNumber);// 不良数量
      parItemMap.getColMap().put("QIP_INSPECT_FLAG", "Y");// 抽验标志（y/n）
      parItemMap.getColMap().put("QIP_TEST_FLAG", "1");// 检验状态(1-已检验，2-未检验)
      parItemMap.getColMap().put("QIP_TEST_EMP", CommMethod.getSessionUser().getId());// 检验人
      parItemMap.getColMap().put("QIP_TEST_TIME", DateUtil.getCurDate());// 检验时间
      if (ngFlag == true)
      {
        parItemMap.getColMap().put("QIP_TEST_RESULT", "2");// 检验结果(1-OK，2-NG)
      }
      else
      {
        parItemMap.getColMap().put("QIP_TEST_RESULT", "1");// 检验结果(1-OK，2-NG)
      }
      if (dataAuth != null)
      {
          parItemMap.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.edit(parItemMap);

      // 修改品质抽样信息表数据
      ArrayList<Object> paraList2 = new ArrayList<Object>();
      TableDataMapExt sampleMap = new TableDataMapExt();
      sampleMap.setTableName("T_QM_SAMPLE_INFO");
      // sampleMap.setSqlWhere(" and QSI_ITEM_SN='" + qipSn + "'" + " and QSI_INSPECT_DOC='"
      // + inspectSn + "'");
      sampleMap.setSqlWhere(" and QSI_ITEM_SN = ? and QSI_INSPECT_DOC = ? AND DATA_AUTH=?");
      paraList2.add(qipSn);
      paraList2.add(inspectSn);
      paraList2.add(dataAuth);
      sampleMap.setSqlWhereArgs(paraList2);

      sampleMap.getColMap().put("QSI_SCARP_NUM", Integer.parseInt(scarpNum));// 损耗数量
      if (dataAuth != null)
      {
        sampleMap.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.edit(sampleMap);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("保存失败"), e);
    }
    // 保存样本检测中间表信息
    String tempSql = "SELECT  T.QII_SN,T.QII_ITEM_TYPE, " + " T.QII_ERROR_GRADE, "
                     + " MAX(T.QII_ERROR_NUM) AS QII_ERROR_NUM "
                     + " FROM T_QM_INSPECT_ITEM_INFO T "
                     + " LEFT JOIN T_QM_INSEPCT_PARENT_INFO T1 " + " ON T.QII_SN = T1.QIP_SN "
                     + " WHERE T1.QIP_INSPECT_SN = ? and  T.QII_SN = ? AND T.DATA_AUTH=? AND T1.DATA_AUTH=?"
                     + " GROUP BY T.QII_SN,T.QII_ITEM_TYPE, T.QII_ERROR_GRADE";

    List<Map<String, Object>> tempList = modelService.listDataSql(tempSql, new Object[] {
      inspectSn, qipSn,dataAuth,dataAuth});

    int tempListSize = tempList.size();
    for (int i = 0; i < tempListSize; i++ )
    {
      try
      {
        String sql = "SELECT T.QIM_TEST_NUM,T.QIM_ERROR_NUM " + " FROM T_QM_INSPECT_MID_INFO T "
                     + " WHERE T.QIM_INSPECT_SN = ? AND T.QIM_SN=?"
                     + " AND T.QIM_ITEM_TYPE = ? AND T.QIM_ERROR_GRADE = ? AND T.DATA_AUTH=?";
        List<Map<String, Object>> resultList = null;
        if (tempList.get(i).get("QII_ERROR_GRADE") == null)
        {
          // 没有缺陷等级
          resultList = modelService.listDataSql(sql,
            new Object[] {inspectSn, qipSn, tempList.get(i).get("QII_ITEM_TYPE"), "0",dataAuth});
        }
        else
        {
          // 有缺陷等级
          resultList = modelService.listDataSql(sql,
            new Object[] {inspectSn, qipSn, tempList.get(i).get("QII_ITEM_TYPE"),
              tempList.get(i).get("QII_ERROR_GRADE"),dataAuth});
        }
        ArrayList<Object> paraList4 = new ArrayList<Object>();
        TableDataMapExt midInfoMap = new TableDataMapExt();
        midInfoMap.setTableName("T_QM_INSPECT_MID_INFO");
        if (resultList != null)
        {
          if (!resultList.isEmpty())
          {
            // 修改
            int tempNum2 = 0;
            if (tempList.get(i).get("QII_ERROR_GRADE") == null)
            {
              // 没有缺陷等级
              // midInfoMap.setSqlWhere(" and QIM_INSPECT_SN='" + inspectSn + "'" + " and QIM_SN='"
              // + qipSn + "'" + " and QIM_ITEM_TYPE="
              // + tempList.get(i).get("QII_ITEM_TYPE")
              // + " and QIM_ERROR_GRADE='0'");
              midInfoMap.setSqlWhere(" and QIM_INSPECT_SN=? and QIM_SN=? and QIM_ITEM_TYPE=? and QIM_ERROR_GRADE='0' AND DATA_AUTH=?");
              paraList4.add(inspectSn);
              paraList4.add(qipSn);
              paraList4.add(tempList.get(i).get("QII_ITEM_TYPE"));
              paraList4.add(dataAuth);
              midInfoMap.setSqlWhereArgs(paraList4);
            }
            else
            {
              // 有缺陷等级
              // midInfoMap.setSqlWhere(" and QIM_INSPECT_SN='" + inspectSn + "'" + " and QIM_SN='"
              // + qipSn + "'" + " and QIM_ITEM_TYPE='"
              // + tempList.get(i).get("QII_ITEM_TYPE")
              // + "' and QIM_ERROR_GRADE='"
              // + tempList.get(i).get("QII_ERROR_GRADE") + "'");
              midInfoMap.setSqlWhere(" and QIM_INSPECT_SN=? and QIM_SN=? and QIM_ITEM_TYPE=? and QIM_ERROR_GRADE=? AND DATA_AUTH=?");
              paraList4.add(inspectSn);
              paraList4.add(qipSn);
              paraList4.add(tempList.get(i).get("QII_ITEM_TYPE"));
              paraList4.add(tempList.get(i).get("QII_ERROR_GRADE"));
              paraList4.add(dataAuth);
              midInfoMap.setSqlWhereArgs(paraList4);
            }
            int tempNum1 = Integer.parseInt(testNum);

            if ((tempList.get(i)).get("QII_ERROR_NUM") != null)
            {
              tempNum2 = Integer.parseInt(StringUtils.toString((tempList.get(i)).get("QII_ERROR_NUM")));
            }

            midInfoMap.getColMap().put("QIM_ERROR_NUM", tempNum2);// 不良数量
            midInfoMap.getColMap().put("QIM_TEST_NUM", tempNum1);// 检测数量

            modelService.edit(midInfoMap);
          }
          else
          {
            // 新增
            CommMethod.addSysDefCol(midInfoMap.getColMap(), modelAction.getUser());

            midInfoMap.getColMap().put("QIM_SN", qipSn);// 样本SN
            midInfoMap.getColMap().put("QIM_INSPECT_SN", inspectSn);// 检验单号
            midInfoMap.getColMap().put("QIM_ITEM_TYPE", tempList.get(i).get("QII_ITEM_TYPE"));// 检验项目类型
            midInfoMap.getColMap().put("QIM_ITEM_NUM", Integer.parseInt(itemNum));// 样本数量
            midInfoMap.getColMap().put("QIM_TEST_NUM", Integer.parseInt(testNum));// 检测数量
            midInfoMap.getColMap().put("QIM_ERROR_NUM", tempList.get(i).get("QII_ERROR_NUM"));// 不良数量
            if (tempList.get(i).get("QII_ERROR_GRADE") == null)
            {
              // 没有缺陷等级
              midInfoMap.getColMap().put("QIM_ERROR_GRADE", "0");// 缺陷等级
            }
            else
            {
              // 有缺陷等级
              midInfoMap.getColMap().put("QIM_ERROR_GRADE", tempList.get(i).get("QII_ERROR_GRADE"));// 缺陷等级
            }
            if (dataAuth != null)
            {
                midInfoMap.getColMap().put("DATA_AUTH", dataAuth);
            }
            modelService.save(midInfoMap);
          }
        }

      }
      catch (Exception e)
      {
        log.error(e);
        throw new BussException(modelAction.getText("保存失败"), e);
      }
    }

    // 返回母本信息
    String sql = "SELECT ROW_NUMBER() OVER() ROWNUM, A.* " + " FROM (SELECT T.ID, "
                 + " T.QIP_SN, " + " T.QIP_TEST_RESULT, " + " T.QIP_INSPECT_SN, "
                 + " T.QIP_ITEM_NUM, " + " T.QIP_TEST_NUM, " + " T.QIP_ERROR_NUM, "
                 + " T.QIP_SCARP_NUM, " + " T1.NAME QIP_TEST_EMP, "
                + " TO_CHAR(T.QIP_TEST_TIME, 'YYYY-MM-DD HH24:MI:SS') QIP_TEST_TIME "
                 + " FROM T_QM_INSEPCT_PARENT_INFO T " + " LEFT JOIN SY_USER T1 "
                + " ON T.QIP_TEST_EMP=T1.ID " + " WHERE T.QIP_INSPECT_FLAG = 'Y' "
                + " AND T.QIP_INSPECT_SN = ? AND T.DATA_AUTH=? "+ " ORDER BY T.QIP_TEST_TIME DESC) A";
      
    List resultList = modelService.listDataSql(sql, new Object[] {inspectSn,dataAuth});

    String resultStr = "";
    String finalRes = "1";
    String listFlag = "3"; // 检验状态 默认检验完成
    String sql2 = "SELECT T.QIS_ITEM_TYPE, " + "T.QIS_ACTUAL_NUM, T.QIS_ERROR_GRADE, "
                  + " T.QIS_TARGET_NUM, " + " T.QIS_AC_NUM, " + " T.QIS_RE_NUM "
                  + " FROM T_QM_INSPECT_SCHEME_INFO T " + " WHERE T.QIS_INSPECT_SN = ? AND T.DATA_AUTH=?";

    List<Map<String, Object>> resultList2 = modelService.listDataSql(sql2,
      new Object[] {inspectSn,dataAuth});
    int tempNum = 0; // 计算总的ok数
    if (resultList2 != null && !resultList2.isEmpty())
    {
      int resultListSize = resultList2.size();
      try
      {

        for (int i = 0; i < resultListSize; i++ )
        {
          // 检验方案检验信息表获取的项目类型、缺陷等级在中间表中有没有记录 若有则修改不良数量 并与检验方案检验信息表的RE值做比较
          // 比较通过再把中间表汇总的检测数量和检验方案检验信息表的应抽数量做比较 修改检验方案信息表的检测结果
          // 若没有则把中间表汇总的检测数量和检验方案检验信息表的应抽数量做比较 并修改检验方案信息表的检测结果
          String itemType = StringUtils.toString(resultList2.get(i).get("QIS_ITEM_TYPE"));
          String errorGrade = StringUtils.toString(resultList2.get(i).get("QIS_ERROR_GRADE"));
          resultStr = resultStr + itemType + ",";

          int reNum = Integer.parseInt(StringUtils.toString(resultList2.get(i).get("QIS_RE_NUM"))); // re值
          int targetNum = Integer.parseInt(StringUtils.toString(resultList2.get(i).get(
            "QIS_TARGET_NUM"))); // 应抽数量

          int errorMaxNum = 0; // 不良数量
          String resStr = "1"; // 检验结果 默认ok
          int testTotalNum = 0; // 实抽数量

          // 获取检验数量 和用户输入的检验数量相加 用来比较
          // ////////////////////////////////////////////////////////////////////
          String sql3 = "SELECT SUM(T.QIM_TEST_NUM) AS TOTAL_TEST_NUM "
                        + " FROM (SELECT DISTINCT A.QIM_SN, A.QIM_ITEM_TYPE, A.QIM_TEST_NUM, A.DATA_AUTH "
                        + " FROM T_QM_INSPECT_MID_INFO A " + " WHERE A.QIM_INSPECT_SN = ? AND A.DATA_AUTH=?) T "
                        + " WHERE T.QIM_ITEM_TYPE = ? AND T.DATA_AUTH=?" + " GROUP BY T.QIM_ITEM_TYPE";

          List<Map<String, Object>> resultList3 = modelService.listDataSql(sql3, new Object[] {
            inspectSn,dataAuth, itemType,dataAuth});

          // 检验方案检验信息表中的项目类型、缺陷等级在中间表中有没有记录
          String exisitSql = "SELECT SUM(T.QIM_ERROR_NUM) QIM_ERROR_NUM "
                             + " FROM T_QM_INSPECT_MID_INFO T " + " WHERE T.QIM_INSPECT_SN = ? "
                             + " AND T.QIM_ITEM_TYPE = ? " + " AND T.QIM_ERROR_GRADE = ? AND T.DATA_AUTH=?"
                             + " GROUP BY T.QIM_ITEM_TYPE, T.QIM_ERROR_GRADE";
          List<Map<String, Object>> exisitList = modelService.listDataSql(exisitSql, new Object[] {
            inspectSn, itemType, errorGrade,dataAuth});
          if (resultList3 != null && !resultList3.isEmpty())
          {
            if (exisitList != null && !exisitList.isEmpty())
            {
              // 有记录
              // 不良数量和re值做比较、实抽数量和应抽数量做比较
              if (resultList3.get(0).get("TOTAL_TEST_NUM") != null)
              {
                testTotalNum = Integer.parseInt(StringUtils.toString(resultList3.get(0).get(
                  "TOTAL_TEST_NUM")));
              }
              resultStr = resultStr + testTotalNum + ",";
              if (exisitList.get(0).get("QIM_ERROR_NUM") != null)
              {
                errorMaxNum = Integer.parseInt(StringUtils.toString(exisitList.get(0).get(
                  "QIM_ERROR_NUM")));
              }
              resultStr = resultStr + errorMaxNum + ",";
              if (errorMaxNum > 0 && errorMaxNum >= reNum)
              {
                // 不良数量大于re值 ng
                resStr = "2";
                resultStr = resultStr + "NG" + ",";
              }
              else
              {
                if (targetNum > testTotalNum)
                {
                  // 实抽数量小于应抽数量 ng
                  resStr = "";
                  resultStr = resultStr + "--" + ",";
                  listFlag = "2";
                }
                else
                {
                  // ok
                  tempNum++ ;
                  resultStr = resultStr + "OK" + ",";
                }
              }
            }
            else
            {
              // 无记录
              // 实抽数量和应抽数量做比较
              if (resultList3.get(0).get("TOTAL_TEST_NUM") != null)
              {
                testTotalNum = Integer.parseInt(StringUtils.toString(resultList3.get(0).get(
                  "TOTAL_TEST_NUM")));
              }
              resultStr = resultStr + testTotalNum + ",";
              resultStr = resultStr + "0" + ",";
              if (targetNum > testTotalNum)
              {
                // 实抽数量小于应抽数量 ng
                resStr = "";
                resultStr = resultStr + "--" + ",";
                listFlag = "2";
              }
              else
              {
                // ok
                tempNum++ ;
                resultStr = resultStr + "OK" + ",";
              }
            }
          }
          else
          {
            resStr = "";
            resultStr = resultStr + "0" + ",";
            resultStr = resultStr + "0" + ",";
            resultStr = resultStr + "--" + ",";
            listFlag = "2";
          }
          ArrayList<Object> paraList5 = new ArrayList<Object>();
          TableDataMapExt schemeInfoMap = new TableDataMapExt();
          schemeInfoMap.setTableName("T_QM_INSPECT_SCHEME_INFO");
          // schemeInfoMap.setSqlWhere(" and QIS_INSPECT_SN='" + inspectSn + "'"
          // + " and QIS_ITEM_TYPE='" + itemType + "'"
          // + " and QIS_ERROR_GRADE='" + errorGrade + "'");

          schemeInfoMap.setSqlWhere(" and QIS_INSPECT_SN=? and QIS_ITEM_TYPE=? and QIS_ERROR_GRADE=? AND DATA_AUTH=?");
          paraList5.add(inspectSn);
          paraList5.add(itemType);
          paraList5.add(errorGrade);
          paraList5.add(dataAuth);
          schemeInfoMap.setSqlWhereArgs(paraList5);

          schemeInfoMap.getColMap().put("QIS_ACTUAL_NUM", testTotalNum);// 检验数量
          schemeInfoMap.getColMap().put("QIS_ERROR_NUM", errorMaxNum);// 不良数量
          schemeInfoMap.getColMap().put("QIS_TEST_RESULT", resStr);// 检验结果

          resultStr = resultStr + errorGrade + "|";
          modelService.edit(schemeInfoMap);
        }
      }
      catch (Exception e)
      {
        log.error(e);
        throw new BussException(modelAction.getText("保存失败"), e);
      }
      if (tempNum != resultListSize)
      {
        finalRes = "2";
      }
    }
    try
    {
      // String saveInspectInfoSql = "update T_QM_INSPECT_INFO t " + " set t.qii_error_num     = "
      // + " (select nvl(max(t2.qim_error_num), 0) "
      // + " from T_QM_INSPECT_MID_INFO t2 "
      // + " where t2.qim_inspect_sn = ?), "
      // + " t.qii_list_flag      = ?, " + " t.qii_insepct_result = ? "
      // + " where t.qii_inspect_sn = ? ";
      
      //String saveInspectInfoSql = "update T_QM_INSPECT_INFO " + " set qii_error_num     = "
      //                            + " (select coalesce(max(t2.qim_error_num), 0) "
      //                            + " from T_QM_INSPECT_MID_INFO t2 "
      //                            + " where t2.qim_inspect_sn = ?), "
      //                            + " qii_list_flag      = ?, " + " qii_insepct_result = ? "
      //                           + " where qii_inspect_sn = ? ";
      String saveInspectInfoSql = "UPDATE T_QM_INSPECT_INFO " + " SET QII_ERROR_NUM     = "
                                  + " (SELECT coalesce(MAX(T2.QIM_ERROR_NUM), 0) "
                                  + " FROM T_QM_INSPECT_SCHEME_INFO T3  "
                                  + " LEFT JOIN T_QM_INSPECT_MID_INFO T2 "
                                  + " ON T2.QIM_INSPECT_SN = T3.QIS_INSPECT_SN "
                                  + " AND T2.QIM_ERROR_GRADE = T3.QIS_ERROR_GRADE AND T2.QIM_ITEM_TYPE = T3.QIS_ITEM_TYPE "
                                  + " WHERE T2.QIM_INSPECT_SN = ? AND T2.DATA_AUTH=? ), "
                                  + " QII_LIST_FLAG      = ?, " + " QII_INSEPCT_RESULT = ? "
                                  + " WHERE QII_INSPECT_SN = ? AND DATA_AUTH=? ";
      modelService.execSql(saveInspectInfoSql, new Object[] {inspectSn,dataAuth, listFlag, finalRes,
        inspectSn,dataAuth});
      // String saveInspectInfoSql2 = "update T_QM_INSPECT_INFO t " +
      // " set t.qii_actual_num     = "
      // + " (select nvl(sum(t2.qip_test_num), 0) "
      // + " from T_QM_INSEPCT_PARENT_INFO t2 "
      // + " where t2.qip_inspect_sn = ?) "
      // + " where t.qii_inspect_sn = ? ";
      String saveInspectInfoSql2 = "update T_QM_INSPECT_INFO " + " set qii_actual_num     = "
                                   + " (select coalesce(sum(t2.qip_test_num), 0) "
                                   + " from T_QM_INSEPCT_PARENT_INFO t2 "
                                   + " where t2.qip_inspect_sn = ? AND T2.DATA_AUTH=?) "
                                   + " where qii_inspect_sn = ? AND DATA_AUTH=?";
      modelService.execSql(saveInspectInfoSql2, new Object[] {inspectSn,dataAuth, inspectSn,dataAuth});
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("保存失败"), e);
    }

    modelAction.setAjaxString(CommMethod.escapeJs(resultStr));
    CommMethod.listToEscapeJs(resultList);
    modelAction.setAjaxList(resultList);
    return BaseActionSupport.AJAX;
  }
}
