package com.more.mes.smt.sample;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 
 * @Title 
 * @Description 样本大小字码
 * @ClassName SampleCode
 * @author Administrator
 * @version 1.0 developer 2017-9-30 created
 * @see SampleCode
 * @since 2017-9-30
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class SampleCode implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {

    HttpServletRequest t = modelAction.getRequest();
    String dataAuth = t.getParameter("dataAuth");
    String testStep = t.getParameter("testStep");
    if (StringUtils.isBlank(testStep))
    {
      modelAction.setAjaxString("add");
    }
    else
    {
      //if(StringUtils.isEmpty(dataAuth)){
      //  dataAuth=CommMethod.getUserDefDa(modelService, CommMethod.getSessionUser());
      //}
      String sql = "select t.* from T_QM_SAMPLE_CODE t where 1=1 and t.qsc_test_step=? and t.data_auth=? order by t.qsc_start_num,t.qsc_column_seq ";
      List<Map<String, Object>> slist = modelService.listDataSql(sql, new Object[] {
        testStep,dataAuth});
      if (slist == null || slist.isEmpty())
      {
        modelAction.setAjaxString("add");
      }
      else
      {
        Map<String, Object> dataMap = new HashMap<String, Object>();
        List<Map<String, Object>> rowList = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> aqlList = null;
        Map<String, Object> rowMap = null;
        Map<String, Object> aqlMap = null;
        String code = null;
        for (Map<String, Object> map : slist)
        {

          if (map.get("QSC_START_NUM") != null
              && !map.get("QSC_START_NUM").toString().equals(code))
          {
            aqlList = new ArrayList<Map<String, Object>>();
            rowMap = new HashMap<String, Object>();
            rowMap.put("QSC_START_NUM", map.get("QSC_START_NUM"));
            rowMap.put("QSC_END_NUM", map.get("QSC_END_NUM"));
            code = map.get("QSC_START_NUM").toString();
          }
          aqlMap = new HashMap<String, Object>();
          aqlMap.put("QSC_LETTER", map.get("QSC_LETTER"));
          aqlMap.put("QSC_TEST_LEVEL", map.get("QSC_TEST_LEVEL"));
          aqlMap.put("QSC_TEST_GRADE", map.get("QSC_TEST_GRADE"));
          aqlList.add(aqlMap);

          if (!contain(code, rowList))
          {
            rowMap.put("CODE", aqlList);
            rowList.add(rowMap);
          }

        }
        dataMap.put("rowList", rowList);
        CommMethod.mapToEscapeJs(dataMap);
        modelAction.setDataMap(dataMap);
      }
    }

   return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面

  }

  private boolean contain(String code, List<Map<String, Object>> rowList)
  {
    for (Map<String, Object> map : rowList)
    {
      if (code.equals(map.get("QSC_START_NUM").toString()))
      {
        return true;
      }
    }
    return false;

  }
}