
package com.more.mes.smt.qualityTest.service.oracle;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class QualityTestBefShowService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    TableDataMapExt tdMap = new TableDataMapExt();
    String infoId = modelAction.getDataId();
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("dataAuth");
    //if(dataAuth.isEmpty()){
    //  dataAuth = "";//CommMethodMc.getDataAuthBySession(request);
    //}
    String type = request.getParameter("type");
    Map<String, Object> result = new HashMap<String, Object>();
    String tempStr="";
    try{
    // tag1列表
    String tagSql1 = "SELECT T.ID, " + " ROWNUM, " + " T.QIS_ITEM_TYPE QIS_ITEM_TYPE, "
                     + " G.VALUE AS QIS_ITEM_TYPE_NAME, " + " T1.QSP_PLAN_NAME, "
                     + " F.VALUE AS QIS_ERROR_GRADE, " + " I.VALUE AS QIS_TEST_LEVEL, "
                     + " H.VALUE AS QIS_TEST_GRADE, " + " T.QIS_ALQ_VALUE, "
                     + " T.QIS_TARGET_NUM, " + " T.QIS_ACTUAL_NUM, " + " T.QIS_ERROR_NUM, "
                     + " T.QIS_AC_NUM, " + " T.QIS_RE_NUM, "
                     + " DECODE(T.QIS_TEST_RESULT, '1', 'OK', '2', 'NG') AS QIS_TEST_RESULT "
                     + " FROM T_QM_INSPECT_SCHEME_INFO T " + " LEFT JOIN T_QM_SAMPLING_PLAN T1 "
                     + " ON T.QIS_SAMPLE_PLAN = T1.ID " + " LEFT JOIN T_QM_INSPECT_INFO T2 "
                     + " ON T2.QII_INSPECT_SN = T.QIS_INSPECT_SN " + " LEFT JOIN SY_DICT_VAL G "
                     + " ON T.QIS_ITEM_TYPE = G.CODE " + " AND G.DICT_CODE = 'QTI_ITEM_TYPE' "
                     + " LEFT JOIN SY_DICT_VAL F " + " ON T.QIS_ERROR_GRADE = F.CODE "
                     + " AND F.DICT_CODE = 'QMS_ERROR_GRADE' " + " LEFT JOIN SY_DICT_VAL H "
                     + " ON T.QIS_TEST_GRADE = H.CODE " + " AND H.DICT_CODE = 'QMS_TEST_GRADE' "
                     + " LEFT JOIN SY_DICT_VAL I " + " ON T.QIS_TEST_LEVEL = I.CODE "
                     + " AND I.DICT_CODE = 'QMS_TEST_LEVEL' " + " WHERE T2.ID = ? "
                     + " AND T.DATA_AUTH=? AND T1.DATA_AUTH=? ";

    // tag2检验项目类型
    String tagSql2 = "SELECT DISTINCT T1.QMI_ITEM_TYPE ITEM_TYPE, G.VALUE AS ITEM_TYPE_NAME "
                     + " FROM T_QM_MODEL_ITEM T1 " + " LEFT JOIN T_QM_INSPECT_INFO T "
                     + " ON T.QII_ITEM_CODE = T1.QMI_MODEL_CODE "
                     + " AND T.QII_TEST_STEP = T1.QMI_TEST_STEP " + " LEFT JOIN SY_DICT_VAL G "
                     + " ON T1.QMI_ITEM_TYPE = G.CODE " + " AND G.DICT_CODE = 'QTI_ITEM_TYPE' "
                     + " WHERE T.ID = ? AND T1.DATA_AUTH=?";

    List<Map<String, Object>> tagList1 = modelService.listDataSql(tagSql1, new Object[] {infoId,dataAuth,dataAuth});
    List<String> tagList2 = modelService.listDataSql(tagSql2, new Object[] {infoId,dataAuth});
    if (tagList2 == null || tagList2.isEmpty())
    {
      tagSql2 = "SELECT DISTINCT T1.QTI_ITEM_TYPE ITEM_TYPE, G.VALUE AS ITEM_TYPE_NAME "
                + " FROM T_QM_TEST_ITEM T1 " + " LEFT JOIN T_QM_INSPECT_INFO T "
                + " ON T.QII_TEST_STEP = T1.QTI_TEST_STEP " + " LEFT JOIN SY_DICT_VAL G "
                + " ON T1.QTI_ITEM_TYPE = G.CODE " + " AND G.DICT_CODE = 'QTI_ITEM_TYPE' "
                + " WHERE T1.QTI_DEFAULT_FLAG = 'Y' " + " AND T.ID = ?  AND T1.DATA_AUTH=? ";
      tagList2 = modelService.listDataSql(tagSql2, new Object[] {infoId,dataAuth});
    }

    // tag2检验项目信息

    String testItemSql = "SELECT ROWNUM, A.* " + " FROM (SELECT T1.QII_ITEM_TYPE     ITEM_TYPE, "
                         + " G.VALUE              AS ITEM_TYPE_NAME, "
                         + " T1.QII_ITEM_NAME     ITEM_NAME, "
                         + " T1.QII_ITEM_SN       QII_ITEM_SN, "
                         + " H.VALUE              AS ITEM_CLASS_NAME, "
                         + " T1.QII_ITEM_CLASS    AS ITEM_CLASS, "
                         + " T1.QII_ITEM_UNIT     ITEM_UNIT, "
                         + " T1.QII_ITEM_MAXVALUE ITEM_MAXVALUE, "
                         + " T1.QII_ITEM_MINVALUE ITEM_MINVALUE, "
                         + " T1.QII_TEST_METHOD   TEST_METHOD, "
                         + " T1.QII_TEST_CONTENT  TEST_CONTENT "
                         + " FROM T_QM_INSPECT_MID_ITEM_INFO T1 "
                         + " LEFT JOIN T_QM_INSPECT_INFO T "
                         + " ON T.QII_INSPECT_SN = T1.QII_INSPECT_SN "
                         + " LEFT JOIN SY_DICT_VAL G " + " ON T1.QII_ITEM_TYPE = G.CODE "
                         + " AND G.DICT_CODE = 'QTI_ITEM_TYPE' " + " LEFT JOIN SY_DICT_VAL H "
                         + " ON T1.QII_ITEM_CLASS = H.CODE "
                         + " AND H.DICT_CODE = 'QTI_ITEM_CLASS' " + " WHERE T.ID = ? AND T1.DATA_AUTH=? "
                         + " ORDER BY T1.QII_ITEM_TYPE) A ";

    List<String> testItemList = modelService.listDataSql(testItemSql, new Object[] {infoId,dataAuth});

    // tag2样本列表
    String inspectItemSql = "select rownum, A.* " + " FROM (SELECT T.ID, " + " T.QIP_SN, "
                            + " T.QIP_ITEM_NUM, " + " T.QIP_TEST_NUM, " + " T.QIP_SCARP_NUM, "
                            + " T.QIP_ERROR_NUM, " + " T.QIP_TEST_RESULT, "
                            + " T2.NAME QIP_TEST_EMP, "
                            + " to_char(T.QIP_TEST_TIME, 'yyyy-mm-dd hh24:mi:ss') QIP_TEST_TIME "
                            + " FROM T_QM_INSEPCT_PARENT_INFO T " + " LEFT JOIN SY_USER T2 "
                            + " ON T.QIP_TEST_EMP = T2.ID " + " LEFT JOIN T_QM_INSPECT_INFO T1 "
                            + " ON T.QIP_INSPECT_SN = T1.QII_INSPECT_SN "
                            + "  " + " WHERE T1.ID = ? AND T.DATA_AUTH=? AND T.QIP_INSPECT_FLAG = 'Y'"
                            + " ORDER BY T.QIP_TEST_TIME DESC) A";
    List<Map<String, Object>> inspectItemList = modelService.listDataSql(inspectItemSql,
      new Object[] {infoId,dataAuth});

    // tag3母本列表
    String tagSql3 = "select rownum,A.* from (SELECT T.ID,T.QIP_SN,T.QIP_DOC_NUM, "
                     + " T.QIP_TEST_RESULT, " + " T.QIP_INSPECT_SN, " + " T.QIP_ITEM_NUM, "
                     + " T.QIP_ITEM_CODE, " + " T.QIP_SAMPLE_FLAG, " + " T.QIP_TEST_EMP, "
                     + " T.QIP_TEST_TIME  " + " FROM T_QM_INSEPCT_PARENT_INFO T "
                     + " LEFT JOIN T_QM_INSPECT_INFO T1 "
                     + " ON T.QIP_INSPECT_SN = T1.QII_INSPECT_SN "
                     + " WHERE T1.ID = ? AND T.DATA_AUTH=? ORDER BY T.QIP_TEST_TIME DESC) A";
    List<Map<String, Object>> tagList3 = modelService.listDataSql(tagSql3, new Object[] {infoId,dataAuth});

    // 获取判定结果和自动审核标志
    String sql = "SELECT T.QSC_JUDGE_MODE, T.QSC_AUTO_EXAMINE " + " FROM T_QM_SAMPLE_CONFIG T "
                 + " LEFT JOIN T_QM_INSPECT_INFO T2 " + " ON T.QSC_TEST_STEP = T2.QII_TEST_STEP "
                 + " AND T.QSC_SAMPLE_TYPE = T2.QII_SAMPLE_TYPE " + " WHERE T2.ID = ? AND T.DATA_AUTH=? ";

    List<Map<String, Object>> map = modelService.listDataSql(sql, new Object[] {infoId,dataAuth});
    if (map == null || map.isEmpty())
    {
      sql = "SELECT T.QSC_JUDGE_MODE, T.QSC_AUTO_EXAMINE " + " FROM T_QM_SAMPLE_CONFIG T "
            + " WHERE T.QSC_DEFAULT_FLAG = 'Y' AND T.DATA_AUTH=?";
      map = modelService.listDataSql(sql , new Object[] {dataAuth});
    }

    if (tagList1 != null && !tagList1.isEmpty())
    {
      result.put("tagList1", tagList1);
    }
    if (tagList2 != null && !tagList2.isEmpty())
    {
      result.put("tagList2", tagList2);
    }
    if (tagList3 != null && !tagList3.isEmpty())
    {
      result.put("tagList3", tagList3);
    }
    if (testItemList != null && !testItemList.isEmpty())
    {
      result.put("testItemList", testItemList);
    }
    if (inspectItemList != null && !inspectItemList.isEmpty())
    {
      result.put("inspectItemList", inspectItemList);
    }
    result.put("JUDGE_MODE", map.get(0).get("QSC_JUDGE_MODE"));
    result.put("AUTO_EXAMINE", map.get(0).get("QSC_AUTO_EXAMINE"));
    }catch (Exception e) {
      tempStr=StringUtils.toString(e);
      // TODO: handle exception
    }
    
    result.put("infoId", infoId);
    result.put("type", type);
    modelAction.setDataMap(result);
    return null;
  }
}