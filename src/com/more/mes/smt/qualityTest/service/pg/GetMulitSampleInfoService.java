package com.more.mes.smt.qualityTest.service.pg;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class GetMulitSampleInfoService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    //String dataAuth = CommMethodMc.getDataAuthBySession(request);
    String dataAuth = request.getParameter("dataAuth");
    String mulitSampleSn = request.getParameter("mulitSampleSn");
    String subsetMulitSampleSn = request.getParameter("subsetMulitSampleSn");
    String inspectSn = request.getParameter("inspectSn");
    String infoId = request.getParameter("infoId");
    String type = request.getParameter("type");
    if(type != null && !type.trim().equals("") && type.equals("showDetail")){
        dataAuth = request.getParameter("dataAuth");
    }
    /*
     * String sql = "SELECT ROWNUM, D.* " + " FROM (SELECT A.* " + " FROM (SELECT B.*, " +
     * " C.ID, " + " C.QII_TEST_RESULT, " + " C.QII_ERROR_CODE, " + " C.QII_ERROR_GRADE, " +
     * " C.QII_ERROR_NUM, " + " E.CEC_NAME QII_ERROR_DEC, " +
     * " DECODE(C.QII_ERROR_GRADE,'1','轻缺陷','2','重缺陷','3','致命缺陷') AS QII_ERROR_GRADE_NAME, " +
     * " C.QII_ACTUAL_VALUE, " + " C.QII_MEMO " + " FROM (SELECT T.QII_INSPECT_SN, " +
     * " T1.QMI_ITEM_TYPE QII_ITEM_TYPE, " +
     * " DECODE(T1.QMI_ITEM_TYPE,'1','外观','2','性能') AS QII_ITEM_TYPE_NAME, " +
     * " T1.QMI_ITEM_NAME QII_ITEM_NAME, " + " T1.QMI_ITEM_SN QII_ITEM_SN, " +
     * " DECODE(T1.QMI_ITEM_CLASS,'0','范围值','1','固定值','2','状态值') AS QII_ITEM_CLASS, " +
     * " T1.QMI_ITEM_CLASS AS ITEM_CLASS, " + " T1.QMI_ITEM_UNIT QII_ITEM_UNIT, " +
     * " T1.QMI_ITEM_MAXVALUE QII_ITEM_MAXVALUE, " + " T1.QMI_ITEM_MINVALUE QII_ITEM_MINVALUE, " +
     * " T1.QMI_TEST_METHOD QII_TEST_METHOD, " + " T1.QMI_TEST_CONTENT QII_TEST_CONTENT " +
     * " FROM T_QM_MODEL_ITEM T1  " + " LEFT JOIN  T_QM_INSPECT_INFO T" +
     * " ON T.QII_ITEM_CODE = T1.QMI_MODEL_CODE " + " AND T.QII_TEST_STEP = T1.QMI_TEST_STEP " +
     * " WHERE T.ID = ?) B " + " LEFT JOIN T_QM_INSPECT_ITEM_INFO C " +
     * " ON B.QII_INSPECT_SN = C.QII_INSPECT_SN " + " AND B.QII_ITEM_TYPE = C.QII_ITEM_TYPE " +
     * " AND B.QII_ITEM_SN = C.QII_ITEM_SN " + " LEFT JOIN T_CO_ERROR_CODE E " +
     * " ON C.QII_ERROR_CODE=E.CEC_CODE WHERE C.QII_SN=?  AND C.QII_SUBSET_SN=?) A " +
     * " ORDER BY A.QII_ITEM_TYPE) D";
     */
    String sql = "SELECT ROW_NUMBER() OVER() ROWNUM, D.* " + " FROM (SELECT A.* "
                 + " FROM (SELECT B.*, " + " C.ID, " + " C.QII_TEST_RESULT, "
                 + " C.QII_ERROR_CODE, " + " C.QII_ERROR_GRADE, " + " C.QII_ERROR_NUM, "
                 + " E.CEC_NAME         QII_ERROR_DEC, "
                 + " F.VALUE            AS QII_ERROR_GRADE_NAME, " + " C.QII_ACTUAL_VALUE, "
                 + " C.QII_MEMO " + " FROM (SELECT T.QII_INSPECT_SN, "
                 + " T1.QMI_ITEM_TYPE     QII_ITEM_TYPE, "
                 + " G.VALUE              AS QII_ITEM_TYPE_NAME, "
                 + " T1.QMI_ITEM_NAME     QII_ITEM_NAME, " + " T1.QMI_ITEM_SN       QII_ITEM_SN, "
                 + " H.VALUE              AS QII_ITEM_CLASS, "
                 + " T1.QMI_ITEM_CLASS    AS ITEM_CLASS, "
                 + " T1.QMI_ITEM_UNIT     QII_ITEM_UNIT, "
                 + " T1.QMI_ITEM_MAXVALUE QII_ITEM_MAXVALUE, "
                 + " T1.QMI_ITEM_MINVALUE QII_ITEM_MINVALUE, "
                 + " T1.QMI_TEST_METHOD   QII_TEST_METHOD, "
                 + " T1.QMI_TEST_CONTENT  QII_TEST_CONTENT " + " FROM T_QM_MODEL_ITEM T1 "
                 + " LEFT JOIN T_QM_INSPECT_INFO T " + " ON T.QII_ITEM_CODE = T1.QMI_MODEL_CODE "
                 + " AND T.QII_TEST_STEP = T1.QMI_TEST_STEP " + " LEFT JOIN SY_DICT_VAL G "
                 + " ON T1.QMI_ITEM_TYPE = G.CODE " + " AND G.DICT_CODE = 'QTI_ITEM_TYPE' "
                 + " LEFT JOIN SY_DICT_VAL H " + " ON T1.QMI_ITEM_CLASS = H.CODE "
                 + " AND H.DICT_CODE = 'QTI_ITEM_CLASS' " + " WHERE T.ID = ?) B "
                 + " LEFT JOIN T_QM_INSPECT_ITEM_INFO C "
                 + " ON B.QII_INSPECT_SN = C.QII_INSPECT_SN "
                 + " AND B.QII_ITEM_TYPE = C.QII_ITEM_TYPE "
                 + " AND B.QII_ITEM_SN = C.QII_ITEM_SN " + " LEFT JOIN T_CO_ERROR_CODE E "
                 + " ON C.QII_ERROR_CODE = E.CEC_CODE " + " LEFT JOIN SY_DICT_VAL F "
                 + " ON C.QII_ERROR_GRADE = F.CODE " + " AND F.DICT_CODE = 'QMS_ERROR_GRADE' "
                 + " WHERE C.QII_SN = ? " + " AND C.QII_SUBSET_SN = ? AND C.DATA_AUTH=? ) A "
                 + " ORDER BY A.QII_ITEM_TYPE) D ";
    List resultList = modelService.listDataSql(sql, new Object[] {infoId, mulitSampleSn,
      subsetMulitSampleSn,dataAuth});
    if (resultList == null || resultList.isEmpty())
    {
      /*
       * sql = "SELECT ROWNUM, D.* " + " FROM (SELECT A.* " + " FROM (SELECT B.*, " + " C.ID, " +
       * " C.QII_TEST_RESULT, " + " C.QII_ERROR_CODE, " + " C.QII_ERROR_GRADE, " +
       * " C.QII_ERROR_NUM, " + " E.CEC_NAME QII_ERROR_DEC, " +
       * " DECODE(C.QII_ERROR_GRADE,'1','轻缺陷','2','重缺陷','3','致命缺陷') AS QII_ERROR_GRADE_NAME, " +
       * " C.QII_ACTUAL_VALUE, " + " C.QII_MEMO " + " FROM (SELECT T.QII_INSPECT_SN, " +
       * " T1.QTI_ITEM_TYPE QII_ITEM_TYPE, " +
       * " DECODE(T1.QTI_ITEM_TYPE,'1','外观','2','性能') AS QII_ITEM_TYPE_NAME, " +
       * " T1.QTI_ITEM_NAME QII_ITEM_NAME, " + " T1.QTI_ITEM_SN QII_ITEM_SN, " +
       * " DECODE(T1.QTI_ITEM_CLASS,'0','范围值','1','固定值','2','状态值') AS QII_ITEM_CLASS_NAME, " +
       * " T1.QTI_ITEM_CLASS AS ITEM_CLASS, " + " T1.QTI_ITEM_UNIT QII_ITEM_UNIT, " +
       * " T1.QTI_ITEM_MAXVALUE QII_ITEM_MAXVALUE, " + " T1.QTI_ITEM_MINVALUE QII_ITEM_MINVALUE, "
       * + " T1.QTI_TEST_METHOD QII_TEST_METHOD, " + " T1.QTI_TEST_CONTENT QII_TEST_CONTENT " +
       * " FROM T_QM_TEST_ITEM T1  " + " LEFT JOIN T_QM_INSPECT_INFO T " +
       * " ON T.QII_TEST_STEP = T1.QTI_TEST_STEP " + " WHERE T1.QTI_DEFAULT_FLAG = 'Y' " +
       * " AND T.ID = ?) B " + " LEFT JOIN T_QM_INSPECT_ITEM_INFO C " +
       * " ON B.QII_INSPECT_SN = C.QII_INSPECT_SN " + " AND B.QII_ITEM_TYPE = C.QII_ITEM_TYPE " +
       * " AND B.QII_ITEM_SN = C.QII_ITEM_SN " + "LEFT JOIN T_CO_ERROR_CODE E " +
       * " ON C.QII_ERROR_CODE=E.CEC_CODE WHERE C.QII_SN=?  AND C.QII_SUBSET_SN=?) A " +
       * " ORDER BY A.QII_ITEM_TYPE) D";
       */
      sql = "SELECT ROW_NUMBER() OVER() ROWNUM, D.* " + " FROM (SELECT A.* "
            + " FROM (SELECT B.*, " + " C.ID, " + " C.QII_TEST_RESULT, " + " C.QII_ERROR_CODE, "
            + " C.QII_ERROR_GRADE, " + " C.QII_ERROR_NUM, " + " E.CEC_NAME QII_ERROR_DEC, "
            + " F.VALUE AS QII_ERROR_GRADE_NAME, " + " C.QII_ACTUAL_VALUE, " + " C.QII_MEMO "
            + " FROM (SELECT T.QII_INSPECT_SN, " + " T1.QTI_ITEM_TYPE QII_ITEM_TYPE, "
            + " G.VALUE AS QII_ITEM_TYPE_NAME, " + " T1.QTI_ITEM_NAME QII_ITEM_NAME, "
            + " T1.QTI_ITEM_SN QII_ITEM_SN, " + " H.VALUE AS QII_ITEM_CLASS_NAME, "
            + " T1.QTI_ITEM_CLASS AS ITEM_CLASS, " + " T1.QTI_ITEM_UNIT QII_ITEM_UNIT, "
            + " T1.QTI_ITEM_MAXVALUE QII_ITEM_MAXVALUE, "
            + " T1.QTI_ITEM_MINVALUE QII_ITEM_MINVALUE, "
            + " T1.QTI_TEST_METHOD QII_TEST_METHOD, " + " T1.QTI_TEST_CONTENT QII_TEST_CONTENT "
            + " FROM T_QM_TEST_ITEM T1 " + " LEFT JOIN T_QM_INSPECT_INFO T "
            + " ON T.QII_TEST_STEP = T1.QTI_TEST_STEP " + " LEFT JOIN SY_DICT_VAL G "
            + " ON T1.QTI_ITEM_TYPE = G.CODE " + " AND G.DICT_CODE = 'QTI_ITEM_TYPE' "
            + " LEFT JOIN SY_DICT_VAL H " + " ON T1.QTI_ITEM_CLASS = H.CODE "
            + " AND H.DICT_CODE = 'QTI_ITEM_CLASS' " + " WHERE T1.QTI_DEFAULT_FLAG = 'Y' "
            + " AND T.ID = ?) B " + " LEFT JOIN T_QM_INSPECT_ITEM_INFO C "
            + " ON B.QII_INSPECT_SN = C.QII_INSPECT_SN "
            + " AND B.QII_ITEM_TYPE = C.QII_ITEM_TYPE " + " AND B.QII_ITEM_SN = C.QII_ITEM_SN "
            + " LEFT JOIN T_CO_ERROR_CODE E " + " ON C.QII_ERROR_CODE = E.CEC_CODE "
            + " LEFT JOIN SY_DICT_VAL F " + " ON C.QII_ERROR_GRADE = F.CODE "
            + " AND F.DICT_CODE = 'QMS_ERROR_GRADE' " + " WHERE C.QII_SN = ? "
            + " AND C.QII_SUBSET_SN = ? AND C.DATA_AUTH=? ) A " + " ORDER BY A.QII_ITEM_TYPE) D ";
      resultList = modelService.listDataSql(sql, new Object[] {infoId, mulitSampleSn,
        subsetMulitSampleSn,dataAuth});
      if (resultList == null || resultList.isEmpty())
      {
        /*
         * sql = "select rownum,A.* from (SELECT " + " T1.QMI_ITEM_TYPE QII_ITEM_TYPE, " +
         * " DECODE(T1.QMI_ITEM_TYPE, '1', '外观', '2', '性能') AS QII_ITEM_TYPE_NAME, " +
         * " T1.QMI_ITEM_NAME QII_ITEM_NAME, " + " T1.QMI_ITEM_SN QII_ITEM_SN, " +
         * " DECODE(T1.QMI_ITEM_CLASS, '0', '范围值', '1', '固定值', '2', '状态值') AS QII_ITEM_CLASS, " +
         * " T1.QMI_ITEM_CLASS AS ITEM_CLASS, " + " T1.QMI_ITEM_UNIT QII_ITEM_UNIT, " +
         * " T1.QMI_ITEM_MAXVALUE QII_ITEM_MAXVALUE, " +
         * " T1.QMI_ITEM_MINVALUE QII_ITEM_MINVALUE, " + " T1.QMI_TEST_METHOD QII_TEST_METHOD, " +
         * " T1.QMI_TEST_CONTENT QII_TEST_CONTENT " + " FROM T_QM_MODEL_ITEM T1  " +
         * " LEFT JOIN T_QM_INSPECT_INFO T " + " ON T.QII_ITEM_CODE = T1.QMI_MODEL_CODE " +
         * " AND T.QII_TEST_STEP = T1.QMI_TEST_STEP " +
         * " WHERE T.ID = ? order by T1.QMI_ITEM_TYPE) A";
         */
        sql = "SELECT ROW_NUMBER() OVER() ROWNUM, A.* "
              + " FROM (SELECT T1.QMI_ITEM_TYPE     QII_ITEM_TYPE, "
              + " G.VALUE              AS QII_ITEM_TYPE_NAME, "
              + " T1.QMI_ITEM_NAME     QII_ITEM_NAME, " + " T1.QMI_ITEM_SN       QII_ITEM_SN, "
              + " H.VALUE              AS QII_ITEM_CLASS, "
              + " T1.QMI_ITEM_CLASS    AS ITEM_CLASS, " + " T1.QMI_ITEM_UNIT     QII_ITEM_UNIT, "
              + " T1.QMI_ITEM_MAXVALUE QII_ITEM_MAXVALUE, "
              + " T1.QMI_ITEM_MINVALUE QII_ITEM_MINVALUE, "
              + " T1.QMI_TEST_METHOD   QII_TEST_METHOD, "
              + " T1.QMI_TEST_CONTENT  QII_TEST_CONTENT " + " FROM T_QM_MODEL_ITEM T1 "
              + " LEFT JOIN T_QM_INSPECT_INFO T " + " ON T.QII_ITEM_CODE = T1.QMI_MODEL_CODE "
              + " AND T.QII_TEST_STEP = T1.QMI_TEST_STEP " + " LEFT JOIN SY_DICT_VAL G "
              + " ON T1.QMI_ITEM_TYPE = G.CODE " + " AND G.DICT_CODE = 'QTI_ITEM_TYPE' "
              + " LEFT JOIN SY_DICT_VAL H " + " ON T1.QMI_ITEM_CLASS = H.CODE "
              + " AND H.DICT_CODE = 'QTI_ITEM_CLASS' " + " WHERE T.ID = ? "
              + " ORDER BY T1.QMI_ITEM_TYPE) A ";
        resultList = modelService.listDataSql(sql, new Object[] {infoId});
        if (resultList == null || resultList.isEmpty())
        {
          /*
           * sql = "select rownum,A.* from (SELECT " + " T1.QTI_ITEM_TYPE QII_ITEM_TYPE, " +
           * " DECODE(T1.QTI_ITEM_TYPE, '1', '外观', '2', '性能') AS QII_ITEM_TYPE_NAME, " +
           * " T1.QTI_ITEM_NAME QII_ITEM_NAME, " + " T1.QTI_ITEM_SN QII_ITEM_SN, " +
           * " DECODE(T1.QTI_ITEM_CLASS, '0', '范围值', '1', '固定值', '2', '状态值') AS QII_ITEM_CLASS_NAME, "
           * + " T1.QTI_ITEM_CLASS AS ITEM_CLASS, " + " T1.QTI_ITEM_UNIT QII_ITEM_UNIT, " +
           * " T1.QTI_ITEM_MAXVALUE QII_ITEM_MAXVALUE, " +
           * " T1.QTI_ITEM_MINVALUE QII_ITEM_MINVALUE, " + " T1.QTI_TEST_METHOD QII_TEST_METHOD, "
           * + " T1.QTI_TEST_CONTENT QII_TEST_CONTENT " + " FROM  T_QM_TEST_ITEM T1 " +
           * " LEFT JOIN T_QM_INSPECT_INFO T " + " ON T.QII_TEST_STEP = T1.QTI_TEST_STEP " +
           * " WHERE T1.QTI_DEFAULT_FLAG = 'Y' " + " AND T.ID = ? order by T1.QTI_ITEM_TYPE) A";
           */
          sql = "SELECT ROW_NUMBER() OVER() ROWNUM, A.* "
                + " FROM (SELECT T1.QTI_ITEM_TYPE     QII_ITEM_TYPE, "
                + " G.VALUE              AS QII_ITEM_TYPE_NAME, "
                + " T1.QTI_ITEM_NAME     QII_ITEM_NAME, " + " T1.QTI_ITEM_SN       QII_ITEM_SN, "
                + " H.VALUE              AS QII_ITEM_CLASS_NAME, "
                + " T1.QTI_ITEM_CLASS    AS ITEM_CLASS, "
                + " T1.QTI_ITEM_UNIT     QII_ITEM_UNIT, "
                + " T1.QTI_ITEM_MAXVALUE QII_ITEM_MAXVALUE, "
                + " T1.QTI_ITEM_MINVALUE QII_ITEM_MINVALUE, "
                + " T1.QTI_TEST_METHOD   QII_TEST_METHOD, "
                + " T1.QTI_TEST_CONTENT  QII_TEST_CONTENT " + " FROM T_QM_TEST_ITEM T1 "
                + " LEFT JOIN T_QM_INSPECT_INFO T " + " ON T.QII_TEST_STEP = T1.QTI_TEST_STEP "
                + " LEFT JOIN SY_DICT_VAL G " + " ON T1.QTI_ITEM_TYPE = G.CODE "
                + " AND G.DICT_CODE = 'QTI_ITEM_TYPE' " + " LEFT JOIN SY_DICT_VAL H "
                + " ON T1.QTI_ITEM_CLASS = H.CODE " + " AND H.DICT_CODE = 'QTI_ITEM_CLASS' "
                + " WHERE T1.QTI_DEFAULT_FLAG = 'Y' " + " AND T.ID = ? "
                + " ORDER BY T1.QTI_ITEM_TYPE) A ";
          resultList = modelService.listDataSql(sql, new Object[] {infoId});
        }
      }
    }

    // if (resultMap == null || resultMap.isEmpty())
    // {
    // return modelAction.alertParentInfo(modelAction.getText("该物料/产品SN不属于当前检验单，请更换"));
    // }
    CommMethod.listToEscapeJs(resultList);
    modelAction.setAjaxList(resultList);
    return BaseActionSupport.AJAX;
  }
}
