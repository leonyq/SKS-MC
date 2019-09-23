package com.more.mes.smt.qualityTest.service.oracle;

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

public class SaveSampleTestService implements FuncService
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
    // 样本数据
    String ids = request.getParameter("ids");
    String[] idStrs = ids.split(",", -1);
    String itemTypes = request.getParameter("itemTypes");
    String[] itemTypeStrs = itemTypes.split(",", -1);
    String itemNames = request.getParameter("itemNames");
    String[] itemNameStrs = itemNames.split(",", -1);
    String itemClasses = request.getParameter("itemClasses");
    String[] itemClassStrs = itemClasses.split(",", -1);
    String itenUnits = request.getParameter("itenUnits");
    String[] itenUnitStrs = itenUnits.split(",", -1);
    String maxVals = request.getParameter("maxVals");
    String[] maxValStrs = maxVals.split(",", -1);
    String minVals = request.getParameter("minVals");
    String[] minValStrs = minVals.split(",", -1);
    String actualVals = request.getParameter("actualVals");
    String[] actualValStrs = actualVals.split(",", -1);
    String testRes = request.getParameter("testRes");
    String[] testResStrs = testRes.split(",", -1);
    String errorCodes = request.getParameter("errorCodes");
    String[] errorCodeStrs = errorCodes.split(",", -1);
    String errorGrades = request.getParameter("errorGrades");
    String[] errorGradeStrs = errorGrades.split(",", -1);
    String testMethods = request.getParameter("testMethods");
    String[] testMethodStrs = testMethods.split(",", -1);
    String testContents = request.getParameter("testContents");
    String[] testContentStrs = testContents.split(",", -1);
    String memos = request.getParameter("memos");
    String[] memoStrs = memos.split(",", -1);
    String itemSns = request.getParameter("itemSns");
    String[] itemSnStrs = itemSns.split(",", -1);
    String errorNums = request.getParameter("errorNums");
    String[] errorNumStrs = errorNums.split(",", -1);

    boolean ngFlag = false;
    // 保存样本信息
    try
    {
      int idLengt = idStrs.length - 1;
      for (int i = 0; i < idLengt; i++ )
      {
        TableDataMapExt insItemMap = new TableDataMapExt();
        insItemMap.setTableName("T_QM_INSPECT_ITEM_INFO");
        if ("2".equals(testResStrs[i]))
        {
          ngFlag = true;
        }
        if (!"".equals(idStrs[i]))
        {
          // 修改
          ArrayList<Object> paraList = new ArrayList<Object>();
          // insItemMap.setSqlWhere(" and ID='" + idStrs[i] + "' and QII_SN='" + qipSn + "'");
          insItemMap.setSqlWhere(" and ID = ? and QII_SN = ? ");
          paraList.add(idStrs[i]);
          paraList.add(qipSn);
          insItemMap.setSqlWhereArgs(paraList);
          insItemMap.getColMap().put("QII_ITEM_CLASS", itemClassStrs[i]);// 值域（0范围值，1固定值，2状态值）
          insItemMap.getColMap().put("QII_ACTUAL_VALUE", actualValStrs[i]);// 实际值
          insItemMap.getColMap().put("QII_ERROR_NUM", errorNumStrs[i]);// 不良数量
          insItemMap.getColMap().put("QII_TEST_RESULT", testResStrs[i]);// 检测结果(1-OK，2-NG)
          insItemMap.getColMap().put("QII_ERROR_CODE", errorCodeStrs[i]);// 不良代码
          insItemMap.getColMap().put("QII_ERROR_GRADE", errorGradeStrs[i]);// 缺陷等级（1-轻缺陷，2-重缺陷，3-致命缺陷）
          insItemMap.getColMap().put("QII_MEMO", memoStrs[i]);// 备注
          if (dataAuth != null)
          {
            insItemMap.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.edit(insItemMap);
        }
        else
        {
          // 保存
          CommMethod.addSysDefCol(insItemMap.getColMap(), modelAction.getUser());
          insItemMap.getColMap().put("QII_SN", qipSn);// 样本SN
          insItemMap.getColMap().put("QII_INSPECT_SN", inspectSn);// 检验单号
          insItemMap.getColMap().put("QII_ITEM_SN", itemSnStrs[i]);// 项目代码
          insItemMap.getColMap().put("QII_ITEM_NAME", itemNameStrs[i]);// 项目名称
          insItemMap.getColMap().put("QII_ITEM_TYPE", itemTypeStrs[i]);// 项目类型
          insItemMap.getColMap().put("QII_ITEM_CLASS", itemClassStrs[i]);// 值域（0范围值，1固定值，2状态值）
          insItemMap.getColMap().put("QII_ITEM_UNIT", itenUnitStrs[i]);// 单位
          insItemMap.getColMap().put("QII_ITEM_MAXVALUE", maxValStrs[i]);// 上限值
          insItemMap.getColMap().put("QII_ITEM_MINVALUE", minValStrs[i]);// 下限值
          insItemMap.getColMap().put("QII_ACTUAL_VALUE", actualValStrs[i]);// 实际值
          insItemMap.getColMap().put("QII_TEST_RESULT", testResStrs[i]);// 检测结果(1-OK，2-NG)
          insItemMap.getColMap().put("QII_ERROR_CODE", errorCodeStrs[i]);// 不良代码
          insItemMap.getColMap().put("QII_ERROR_GRADE", errorGradeStrs[i]);// 缺陷等级（1-轻缺陷，2-重缺陷，3-致命缺陷）
          insItemMap.getColMap().put("QII_ERROR_NUM", errorNumStrs[i]);// 不良数量
          insItemMap.getColMap().put("QII_TEST_METHOD", testMethodStrs[i]);// 检测方法
          insItemMap.getColMap().put("QII_TEST_CONTENT", testContentStrs[i]);// 检测内容
          insItemMap.getColMap().put("QII_MEMO", memoStrs[i]);// 备注
          if (dataAuth != null)
          {
            insItemMap.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.save(insItemMap);
        }
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("保存失败"), e);
    }
    // 修改母本信息
    try
    {
      ArrayList<Object> paraList = new ArrayList<Object>();
      TableDataMapExt parItemMap = new TableDataMapExt();
      parItemMap.setTableName("T_QM_INSEPCT_PARENT_INFO");
      // parItemMap.setSqlWhere(" and QIP_SN='" + qipSn + "'" + " and QIP_INSPECT_SN='" +
      // inspectSn+ "'");
      parItemMap.setSqlWhere(" and QIP_SN = ? and QIP_INSPECT_SN = ? AND DATA_AUTH=?");
      paraList.add(qipSn);
      paraList.add(inspectSn);
      paraList.add(dataAuth);
      parItemMap.setSqlWhereArgs(paraList);

      parItemMap.getColMap().put("QIP_ITEM_NUM", Integer.parseInt(itemNum));// 母本数量
      parItemMap.getColMap().put("QIP_TEST_NUM", Integer.parseInt(testNum));// 检验数量
      parItemMap.getColMap().put("QIP_SCARP_NUM", scarpNum);// 损耗数量
      parItemMap.getColMap().put("QIP_SAMPLE_NUM", sampleNum);// 损耗数量
      parItemMap.getColMap().put("QIP_ERROR_NUM", errorInputNum);// 不良数量
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

      sampleMap.getColMap().put("QSI_SCARP_NUM", Integer.parseInt(sampleNum));// 损耗数量
      modelService.edit(sampleMap);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("保存失败"), e);
    }
    // 20180615 CSJ 保存样本中间表信息之前先删除数据
    ArrayList<Object> paraList3 = new ArrayList<Object>();
    TableDataMapExt delwms1 = new TableDataMapExt();
    delwms1.setTableName("T_QM_INSPECT_MID_INFO");
    // delwms1.setSqlWhere(" and QIM_INSPECT_SN='" + inspectSn + "'");
    // delwms1.setSqlWhere(" and QIM_SN='" + qipSn + "'");
    delwms1.setSqlWhere(" and QIM_SN = ? and QIM_INSPECT_SN = ? AND DATA_AUTH=?");
    paraList3.add(qipSn);
    paraList3.add(inspectSn);
    paraList3.add(dataAuth);
    delwms1.setSqlWhereArgs(paraList3);
    
    modelService.del(delwms1);

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
            if (dataAuth != null)
            {
                midInfoMap.getColMap().put("DATA_AUTH", dataAuth);
            }
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
    String sql = "SELECT ROWNUM, A.* " + " FROM (SELECT T.ID, " + " T.QIP_SN, "
                 + " T.QIP_TEST_RESULT, " + " T.QIP_INSPECT_SN, " + " T.QIP_ITEM_NUM, "
                 + " T.QIP_TEST_NUM, " + " T.QIP_ERROR_NUM, " + " T.QIP_SCARP_NUM, "
                 + " T1.NAME QIP_TEST_EMP, "
                 + " TO_CHAR(T.QIP_TEST_TIME, 'YYYY-MM-DD HH24:MI:SS') QIP_TEST_TIME "
                 + " FROM T_QM_INSEPCT_PARENT_INFO T " + " LEFT JOIN SY_USER T1 "
                 + " ON T.QIP_TEST_EMP=T1.ID " + " WHERE T.QIP_INSPECT_FLAG = 'Y' "
                 + " AND T.QIP_INSPECT_SN = ? AND T.DATA_AUTH=?" + " ORDER BY T.QIP_TEST_TIME DESC) A";
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

          //int reNum = Integer.parseInt(StringUtils.toString(resultList2.get(i).get("QIS_RE_NUM"))); // re值
          //int targetNum = Integer.parseInt(StringUtils.toString(resultList2.get(i).get(
          //  "QIS_TARGET_NUM"))); // 应抽数量
          int reNum = 0;
          int targetNum = 0;
          if (resultList2.get(i).get("QIS_RE_NUM") != ""
              && resultList2.get(i).get("QIS_RE_NUM") != null)
          {
            reNum = Integer.parseInt(StringUtils.toString(resultList2.get(i).get("QIS_RE_NUM"))); // re值
          }
          if (resultList2.get(i).get("QIS_TARGET_NUM") != ""
              && resultList2.get(i).get("QIS_TARGET_NUM") != null)
          {
            targetNum = Integer.parseInt(StringUtils.toString(resultList2.get(i).get(
              "QIS_TARGET_NUM"))); // 应抽数量
          }

          int errorMaxNum = 0; // 不良数量
          String resStr = "1"; // 检验结果 默认ok
          int testTotalNum = 0; // 实抽数量

          // 获取检验数量 和用户输入的检验数量相加 用来比较
          // ////////////////////////////////////////////////////////////////////
          String sql3 = "SELECT SUM(T.QIM_TEST_NUM) AS TOTAL_TEST_NUM "
                        + " FROM (SELECT DISTINCT A.QIM_SN, A.QIM_ITEM_TYPE, A.QIM_TEST_NUM "
                        + " FROM T_QM_INSPECT_MID_INFO A " + " WHERE A.QIM_INSPECT_SN = ? AND A.DATA_AUTH=?) T "
                        + " WHERE T.QIM_ITEM_TYPE = ? " + " GROUP BY T.QIM_ITEM_TYPE";

          List<Map<String, Object>> resultList3 = modelService.listDataSql(sql3, new Object[] {
            inspectSn,dataAuth, itemType});

          // 检验方案检验信息表中的项目类型、缺陷等级在中间表中有没有记录
          String exisitSql = "SELECT SUM(T.QIM_ERROR_NUM) QIM_ERROR_NUM "
                             + " FROM T_QM_INSPECT_MID_INFO T " + " WHERE T.QIM_INSPECT_SN = ? "
                             + " AND T.QIM_ITEM_TYPE = ? " + " AND T.QIM_ERROR_GRADE = ? AND T.DATA_AUTH=?"
                             + " GROUP BY T.QIM_ITEM_TYPE, T.QIM_ERROR_GRADE";
          List<Map<String, Object>> exisitList = modelService.listDataSql(exisitSql, new Object[] {
            inspectSn, itemType, errorGrade ,dataAuth});
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
      String saveInspectInfoSql = "UPDATE T_QM_INSPECT_INFO "
                                  + " SET QII_ERROR_NUM     = "
                                  + " (SELECT nvl(MAX(A.ERROR_NUM),0) "
                                  + " FROM (SELECT SUM(T2.QIM_ERROR_NUM) ERROR_NUM, T2.QIM_ERROR_GRADE "
                                  + " FROM T_QM_INSPECT_SCHEME_INFO T3 "
                                  + " LEFT JOIN T_QM_INSPECT_MID_INFO T2 "
                                  + " ON T2.QIM_INSPECT_SN = T3.QIS_INSPECT_SN "
                                  + " AND T2.QIM_ERROR_GRADE = T3.QIS_ERROR_GRADE "
                                  + " AND T2.QIM_ITEM_TYPE = T3.QIS_ITEM_TYPE "
                                  + " WHERE T2.QIM_INSPECT_SN = ? AND T2.DATA_AUTH=? "
                                  + " GROUP BY T2.QIM_ERROR_GRADE,T2.QIM_ITEM_TYPE) A), "
                                  + " QII_LIST_FLAG      = ?, " + " QII_INSEPCT_RESULT = ? "
                                  + " WHERE QII_INSPECT_SN = ? AND DATA_AUTH=?";
      modelService.execSql(saveInspectInfoSql, new Object[] {inspectSn,dataAuth, listFlag, finalRes,
        inspectSn,dataAuth});
      String saveInspectInfoSql2 = "update T_QM_INSPECT_INFO t " + " set t.qii_actual_num     = "
                                   + " (select nvl(sum(t2.qip_test_num), 0) "
                                   + " from T_QM_INSEPCT_PARENT_INFO t2 "
                                   + " where t2.qip_inspect_sn = ? AND T2.DATA_AUTH=?) "
                                   + " where t.qii_inspect_sn = ? AND T.DATA_AUTH=?";
      modelService.execSql(saveInspectInfoSql2, new Object[] {inspectSn,dataAuth, inspectSn,dataAuth});
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("保存失败"), e);
    }

    modelAction.setAjaxString(resultStr);
    modelAction.setAjaxList(resultList);
    return BaseActionSupport.AJAX;
  }
}
