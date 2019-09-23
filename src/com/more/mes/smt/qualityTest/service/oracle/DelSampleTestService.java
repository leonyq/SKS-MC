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
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class DelSampleTestService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    String tempStr="";
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = CommMethodMc.getDataAuthBySession(request);
    String infoId = request.getParameter("infoId");
    String inspectSn = request.getParameter("inspectSn");

    // 样本数据
    String qipSns = request.getParameter("sampleSns");
    String[] qipSnStrs = qipSns.split(",", -1);

    String res;
    try
    {
      int qipSnStrsLength = qipSnStrs.length - 1;
      for (int i = 0; i < qipSnStrsLength; i++ )
      {
        // 修改母本数据
        String editParSampleSql = "UPDATE T_QM_INSEPCT_PARENT_INFO T "
                                  + " SET T.QIP_TEST_FLAG = '2', QIP_INSPECT_FLAG='N',"
                                  + "T.QIP_SCARP_NUM  = 0, T.QIP_TEST_NUM  = 0,T.QIP_SAMPLE_NUM=0, "
                                  + " T.QIP_ERROR_NUM = 0, " + " T.QIP_TEST_EMP  = '', "
                                  + " T.QIP_TEST_TIME = '' ,T.QIP_TEST_RESULT='' "
                                  + " WHERE T.QIP_INSPECT_SN = ? " + " AND T.QIP_SN = ? AND T.DATA_AUTH=?";
        modelService.execSql(editParSampleSql, new Object[] {inspectSn, qipSnStrs[i],dataAuth});

        // 修改品质抽样信息表数据
        ArrayList<Object> paraList = new ArrayList<Object>();
        TableDataMapExt sampleMap = new TableDataMapExt();
        sampleMap.setTableName("T_QM_SAMPLE_INFO");
        // sampleMap.setSqlWhere(" and QSI_ITEM_SN='" + qipSnStrs[i] + "'" +
        // " and QSI_INSPECT_DOC='"
        // + inspectSn + "'");
        sampleMap.setSqlWhere(" and QSI_ITEM_SN = ? and QSI_INSPECT_DOC = ? AND DATA_AUTH=?");
        paraList.add(qipSnStrs[i]);
        paraList.add(inspectSn);
        paraList.add(dataAuth);
        sampleMap.setSqlWhereArgs(paraList);

        sampleMap.getColMap().put("QSI_SCARP_NUM", 0);// 损耗数量
        modelService.edit(sampleMap);

        // 删除样本表数据
        String delSampleSql = "DELETE FROM T_QM_INSPECT_ITEM_INFO T "
                              + " WHERE T.QII_INSPECT_SN = ?  " + " AND T.QII_SN = ? AND T.DATA_AUTH=?";
        modelService.execSql(delSampleSql, new Object[] {inspectSn, qipSnStrs[i],dataAuth});

        // 删除中间表数据
        String delMidSql = "DELETE FROM T_QM_INSPECT_MID_INFO T " + " WHERE T.QIM_INSPECT_SN = ? "
                           + " AND T.QIM_SN = ? AND T.DATA_AUTH=?";
        modelService.execSql(delMidSql, new Object[] {inspectSn, qipSnStrs[i],dataAuth});

      }
      // 若母本信息检验标志都为N,修改检验状态都为未检验
      String tempSql = "SELECT T.QIP_SN FROM T_QM_INSEPCT_PARENT_INFO T WHERE T.QIP_INSPECT_SN=? AND T.QIP_INSPECT_FLAG='Y' AND T.DATA_AUTH=?";
      List<Map<String, Object>> tempList = modelService.listDataSql(tempSql,
        new Object[] {inspectSn,dataAuth});
      if (tempList == null || tempList.isEmpty())
      {
        String editSampleInfoSql = "UPDATE T_QM_INSEPCT_PARENT_INFO T "
                                   + " SET T.QIP_TEST_FLAG = '2' "
                                   + " WHERE T.QIP_INSPECT_SN = ? AND T.DATA_AUTH=?";
        modelService.execSql(editSampleInfoSql, new Object[] {inspectSn,dataAuth});
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("删除失败"), e);
    }
    // 返回母本信息
    String sql = "SELECT ROWNUM, A.* " + " FROM (SELECT T.ID, " + " T.QIP_SN, "
                 + " T.QIP_TEST_RESULT, " + " T.QIP_INSPECT_SN, " + " T.QIP_ITEM_NUM, "
                 + " T.QIP_TEST_NUM, " + " T.QIP_ERROR_NUM, " + " T.QIP_SCARP_NUM, "
                 + " T1.NAME QIP_TEST_EMP, "
                 + " TO_CHAR(T.QIP_TEST_TIME, 'YYYY-MM-DD HH24:MI:SS') QIP_TEST_TIME "
                 + " FROM T_QM_INSEPCT_PARENT_INFO T " + " LEFT JOIN SY_USER T1 "
                 + " ON T.QIP_TEST_EMP=T1.ID " + " WHERE T.QIP_INSPECT_FLAG = 'Y' "
                 + " AND T.QIP_INSPECT_SN = ? AND T.DATA_AUTH=? " + " ORDER BY T.QIP_TEST_TIME DESC) A";
    List resultList = modelService.listDataSql(sql, new Object[] {inspectSn,dataAuth});

    String emptySql = "select t.id from T_QM_INSPECT_ITEM_INFO t where t.qii_inspect_sn = ? AND T.DATA_AUTH=?";
    List<Map<String, Object>> emptyList = modelService.listDataSql(emptySql,
      new Object[] {inspectSn,dataAuth});
    String resultStr = "";
    String finalRes = "1";
    String listFlag = "3"; // 检验状态 默认检验完成
    int tempNum = 0; // 计算总的ok数
    boolean emptyFlag = false;
    if (emptyList != null)
    {
      if (!emptyList.isEmpty())
      {
        String sql2 = "SELECT T.QIS_ITEM_TYPE, " + " T.QIS_ERROR_GRADE, " + " T.QIS_TARGET_NUM, "
                      + " T.QIS_AC_NUM, " + " T.QIS_RE_NUM " + " FROM T_QM_INSPECT_SCHEME_INFO T "
                      + " WHERE T.QIS_INSPECT_SN = ? AND T.DATA_AUTH=?";

        List<Map<String, Object>> resultList2 = modelService.listDataSql(sql2,
          new Object[] {inspectSn,dataAuth});
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

              int reNum = Integer.parseInt(StringUtils.toString(resultList2.get(i).get(
                "QIS_RE_NUM"))); // re值
              int targetNum = Integer.parseInt(StringUtils.toString(resultList2.get(i).get(
                "QIS_TARGET_NUM"))); // 应抽数量
              int testTotalNum = 0; // 实抽数量
              int errorMaxNum = 0; // 不良数量
              String resStr = "1"; // 检验结果 默认ok

              String sql3 = "SELECT SUM(T.QIM_TEST_NUM) AS TOTAL_TEST_NUM "
                            + " FROM (SELECT DISTINCT A.QIM_SN, A.QIM_ITEM_TYPE, A.QIM_TEST_NUM "
                            + " FROM T_QM_INSPECT_MID_INFO A " + " WHERE A.QIM_INSPECT_SN = ? AND A.DATA_AUTH=?) T "
                            + " WHERE T.QIM_ITEM_TYPE = ? " + " GROUP BY T.QIM_ITEM_TYPE";

              List<Map<String, Object>> resultList3 = modelService.listDataSql(sql3, new Object[] {
                inspectSn,dataAuth, itemType});

              // 检验方案检验信息表中的项目类型、缺陷等级在中间表中有没有记录
              String exisitSql = "SELECT SUM(T.QIM_ERROR_NUM) QIM_ERROR_NUM "
                                 + " FROM T_QM_INSPECT_MID_INFO T "
                                 + " WHERE T.QIM_INSPECT_SN = ? " + " AND T.QIM_ITEM_TYPE = ? "
                                 + " AND T.QIM_ERROR_GRADE = ? AND T.DATA_AUTH=?"
                                 + " GROUP BY T.QIM_ITEM_TYPE, T.QIM_ERROR_GRADE";
              List<Map<String, Object>> exisitList = modelService.listDataSql(exisitSql,
                new Object[] {inspectSn, itemType, errorGrade,dataAuth});
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
              ArrayList<Object> paraList2 = new ArrayList<Object>();
              TableDataMapExt schemeInfoMap = new TableDataMapExt();
              schemeInfoMap.setTableName("T_QM_INSPECT_SCHEME_INFO");
              // schemeInfoMap.setSqlWhere(" and QIS_INSPECT_SN='" + inspectSn + "'"
              // + " and QIS_ITEM_TYPE='" + itemType + "'"
              // + " and QIS_ERROR_GRADE='" + errorGrade + "'");
              schemeInfoMap.setSqlWhere(" and QIS_INSPECT_SN=? and QIS_ITEM_TYPE=? and QIS_ERROR_GRADE=? AND DATA_AUTH=?");
              paraList2.add(inspectSn);
              paraList2.add(itemType);
              paraList2.add(errorGrade);
              paraList2.add(dataAuth);
              schemeInfoMap.setSqlWhereArgs(paraList2);
              
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
      }
      else
      {
        emptyFlag = true;
        try
        {
          String sql3 = "SELECT T.QIS_TARGET_NUM, T.QIS_AC_NUM, T.QIS_RE_NUM ,T.QIS_ITEM_TYPE ,T.QIS_ERROR_GRADE"
                        + " FROM T_QM_INSPECT_SCHEME_INFO T WHERE T.QIS_INSPECT_SN = ?";
          List<Map<String, Object>> resultList3 = modelService.listDataSql(sql3,
            new Object[] {inspectSn});
          if (resultList3 != null && !resultList3.isEmpty())
          {
            int resultListSize = resultList3.size();
            for (int i = 0; i < resultListSize; i++ )
            {
              resultStr = resultStr + resultList3.get(i).get("QIS_ITEM_TYPE") + "," + "0" + ","
                          + "0" + ",";
              ArrayList<Object> paraList2 = new ArrayList<Object>();
              TableDataMapExt schemeInfoMap = new TableDataMapExt();
              schemeInfoMap.setTableName("T_QM_INSPECT_SCHEME_INFO");
              // schemeInfoMap.setSqlWhere(" and QIS_INSPECT_SN='" + inspectSn + "'"
              // + " and QIS_ITEM_TYPE='"
              // + resultList3.get(i).get("QIS_ITEM_TYPE") + "'"
              // + " and QIS_ERROR_GRADE='"
              // + resultList3.get(i).get("QIS_ERROR_GRADE") + "'");
              schemeInfoMap.setSqlWhere(" and QIS_INSPECT_SN=? and QIS_ITEM_TYPE=? and QIS_ERROR_GRADE=? AND DATA_AUTH=?");
              paraList2.add(inspectSn);
              paraList2.add(resultList3.get(i).get("QIS_ITEM_TYPE"));
              paraList2.add(resultList3.get(i).get("QIS_ERROR_GRADE"));
              paraList2.add(dataAuth);
              schemeInfoMap.setSqlWhereArgs(paraList2);

              schemeInfoMap.getColMap().put("QIS_ACTUAL_NUM", 0);// 检验数量
              schemeInfoMap.getColMap().put("QIS_ERROR_NUM", 0);// 不良数量
              schemeInfoMap.getColMap().put("QIS_TEST_RESULT", "");// 检验结果

              resultStr = resultStr + "--,";
              finalRes = "2";

              resultStr = resultStr + resultList3.get(i).get("QIS_ERROR_GRADE") + "|";
              modelService.edit(schemeInfoMap);
            }
          }

        }
        catch (Exception e)
        {
          log.error(e);
          throw new BussException(modelAction.getText("保存失败"), e);
        }
      }
    }
    try
    {
      String saveInspectInfoSql;
      if (emptyFlag == true)
      {
        saveInspectInfoSql = "update T_QM_INSPECT_INFO t "
                             + " set t.qii_actual_num=0, t.qii_error_num=0, "
                             + " t.qii_list_flag = '1',t.qii_insepct_result = '' "
                             + " where t.qii_inspect_sn = ? AND T.DATA_AUTH=?";
        modelService.execSql(saveInspectInfoSql, new Object[] {inspectSn,dataAuth});
      }
      else
      {
        // saveInspectInfoSql = "update T_QM_INSPECT_INFO t "
        // + " set (t.qii_actual_num, t.qii_error_num) = "
        // + " (select max(t2.qim_test_num), max(t2.qim_error_num) "
        // + " from T_QM_INSPECT_MID_INFO t2 "
        // + " where t2.qim_inspect_sn = ?  ), " // and t2.qim_error_grade!='0'
        // + " t.qii_list_flag = ?,t.qii_insepct_result = ? "
        // + " where t.qii_inspect_sn = ?";
        // modelService.execSql(saveInspectInfoSql, new Object[] {inspectSn, listFlag, finalRes,
        // inspectSn});
        saveInspectInfoSql = "UPDATE T_QM_INSPECT_INFO " + " SET QII_ERROR_NUM     = "
                                  + " (SELECT NVL(MAX(T2.QIM_ERROR_NUM), 0) "
                                  + " FROM T_QM_INSPECT_SCHEME_INFO T3  "
                                  + " LEFT JOIN T_QM_INSPECT_MID_INFO T2 "
                                  + " ON T2.QIM_INSPECT_SN = T3.QIS_INSPECT_SN "
                                  + " AND T2.QIM_ERROR_GRADE = T3.QIS_ERROR_GRADE AND T2.QIM_ITEM_TYPE = T3.QIS_ITEM_TYPE "
                                  + " WHERE T2.QIM_INSPECT_SN = ? AND T2.DATA_AUTH=?), "
                                  + " QII_LIST_FLAG      = ?, " + " QII_INSEPCT_RESULT = ? "
                                  + " WHERE QII_INSPECT_SN = ? AND DATA_AUTH=?";
        modelService.execSql(saveInspectInfoSql, new Object[] {inspectSn,dataAuth, listFlag, finalRes,
          inspectSn,dataAuth});
        String saveInspectInfoSql2 = "update T_QM_INSPECT_INFO t "
                                     + " set t.qii_actual_num     = "
                                     + " (select nvl(sum(t2.qip_test_num), 0) "
                                     + " from T_QM_INSEPCT_PARENT_INFO t2 "
                                     + " where t2.qip_inspect_sn = ? AND T2.DATA_AUTH=?) "
                                     + " where t.qii_inspect_sn = ? AND T.DATA_AUTH=?";
        modelService.execSql(saveInspectInfoSql2, new Object[] {inspectSn,dataAuth, inspectSn,dataAuth});
      }
    }
    catch (Exception e)
    {
      log.error(e);
      tempStr=StringUtils.toString(e);
      throw new BussException(modelAction.getText("保存失败"), e);
    }

    modelAction.setAjaxString(resultStr);
    //modelAction.setAjaxString(tempStr);
    
    modelAction.setAjaxList(resultList);
    return BaseActionSupport.AJAX;
  }
}
