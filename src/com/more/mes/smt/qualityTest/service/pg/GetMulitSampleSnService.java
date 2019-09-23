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

public class GetMulitSampleSnService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    //String dataAuth = CommMethodMc.getDataAuthBySession(request);
    
    String dataAuth = request.getParameter("dataAuth");
    String mulitSampleSn = request.getParameter("mulitSampleSn");
    String inspectSn = request.getParameter("inspectSn");
    String infoId = request.getParameter("infoId");
    String type = request.getParameter("type");
    if(type != null && !type.trim().equals("") && type.equals("showDetail")){
        dataAuth = request.getParameter("dataAuth");
    }
    String sql = "SELECT T.QII_SUBSET_SN, " + " (CASE "
                 + " WHEN AVG(TO_NUMBER(T.QII_TEST_RESULT, '9999')) = 1 THEN " + " '1' "
                 + " ELSE " + " '2' " + " END) AS QII_TEST_RESULT "
                 + " FROM T_QM_INSPECT_ITEM_INFO T " + " WHERE T.QII_SN = ? "
                 + " AND T.QII_INSPECT_SN = ? AND T.DATA_AUTH=? " + " GROUP BY T.QII_SUBSET_SN "
                 + " ORDER BY T.QII_SUBSET_SN ";
    List resultList = modelService.listDataSql(sql, new Object[] {mulitSampleSn, inspectSn,dataAuth});
    CommMethod.listToEscapeJs(resultList);
    modelAction.setAjaxList(resultList);
    return BaseActionSupport.AJAX;
  }
}
