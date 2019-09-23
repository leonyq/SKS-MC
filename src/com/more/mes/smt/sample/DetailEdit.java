package com.more.mes.smt.sample;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 〈抽样方案明细修改〉
 * @Description 〈抽样方案明细修改〉
 * @ClassName DetailEdit
 * @author Administrator
 * @version 1.0 developer 2017-9-25 created
 * @see DetailEdit
 * @since 2017-9-25
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class DetailEdit implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    String dataId = modelAction.getDataId();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String sql = "select t.id from T_QM_SAMPLING_DETAIL t where t.qsd_plan_id = ? and t.data_auth = ? ";
    List<Map<String, Object>> slist = modelService.listDataSql(sql, new Object[] {dataId,dataAuth});
    if (slist == null || slist.isEmpty())
    {
      modelAction.setAjaxString("add");
    }
    else
    {
      Map<String, Object> dataMap = new HashMap<String, Object>();
      sql = "select QSD_SAMPLE_CODE, QSD_SAMPLE_NUM, QSD_AQL_VALUE, QSD_AC_VALUE,QSD_RE_VALUE ,"
            + " qsd_row_seq from T_QM_SAMPLING_DETAIL t where t.qsd_plan_id = ? and t.data_auth = ?  order by t.qsd_row_seq, t.qsd_aql_value";
      slist = modelService.listDataSql(sql, new Object[] {dataId,dataAuth});
      List<Map<String, Object>> rowList = new ArrayList<Map<String, Object>>();
      List<Map<String, Object>> aqlList = null;
      Map<String, Object> rowMap = null;
      Map<String, Object> aqlMap = null;
      String code = null;
      for (Map<String, Object> map : slist)
      {

        if (map.get("QSD_SAMPLE_CODE") != null && !map.get("QSD_SAMPLE_CODE").equals(code))
        {
          aqlList = new ArrayList<Map<String, Object>>();
          rowMap = new HashMap<String, Object>();
          rowMap.put("QSD_SAMPLE_CODE", map.get("QSD_SAMPLE_CODE"));
          rowMap.put("QSD_SAMPLE_NUM", map.get("QSD_SAMPLE_NUM"));
          code = map.get("QSD_SAMPLE_CODE").toString();
        }
        aqlMap = new HashMap<String, Object>();
        aqlMap.put("QSD_AC_VALUE", map.get("QSD_AC_VALUE"));
        aqlMap.put("QSD_RE_VALUE", map.get("QSD_RE_VALUE"));
        aqlList.add(aqlMap);
        

        if (!contain(code, rowList))
        {
          rowMap.put("QSD_AQL_VALUE", aqlList);
          rowList.add(rowMap);
        }

      }
      dataMap.put("rowList", rowList);
      sql = "select t.QSD_SAMPLE_CODE,t.QSD_AQL_VALUE  from T_QM_SAMPLING_DETAIL t where t.qsd_plan_id = ?"
            + "  and t.qsd_sample_code=? and t.data_auth = ? order by QSD_AQL_VALUE";
      slist = modelService.listDataSql(sql,
        new Object[] {dataId, slist.get(0).get("QSD_SAMPLE_CODE"),dataAuth});
      dataMap.put("AQL", slist);
      CommMethod.mapToEscapeJs(dataMap);
      modelAction.setDataMap(dataMap);
    }
     return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面

    //return modelAction.ActionForward("/buss/viewCode/MC-MES/PZGL/cyfa/detailEdit.jsp");
  }

  private boolean contain(String code, List<Map<String, Object>> rowList)
  {
    for (Map<String, Object> map : rowList)
    {
      if (code.equals(map.get("QSD_SAMPLE_CODE")))
      {
        return true;
      }
    }
    return false;

  }
}