package com.more.mes.smt.snconfigure.oracle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 编码生成配置----解析数据源
 * @author development
 */
public class AnalysisSource implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    String configureType = request.getParameter("configureType");
    String configureVal = request.getParameter("configureVal");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    Map<String, Object> map = new HashMap<String, Object>();
    List<Map<String, Object>> tempList = null;
    List<Map<String, Object>> itemList = null;
    List itemList2 = new ArrayList<String>();
    String resStr = "";

    if ("2".equals(configureType))
    {
      // SQL
      try
      {
        configureVal = configureVal.trim();
        configureVal = configureVal.toUpperCase();
        configureVal = configureVal.replaceAll("\\s{1,}", " ");
        configureVal = configureVal.replaceAll(";", "");
        String tempSql = "";

        String sql = "";
        tempSql = configureVal.replaceAll("\\{[^{}]+\\}", "''");
        /*
         * if (configureVal.indexOf("WHERE") != -1) { configureVal =
         * configureVal.replaceAll("\\{[^{}]+\\}", "''"); tempSql =
         * configureVal.replaceAll("\\{[^{}]+\\}", "''"); String[] configureValS =
         * configureVal.split("WHERE"); configureVal = configureValS[0] + "  WHERE ROWNUM=1"; sql =
         * configureValS[0]; } else { sql = configureVal; tempSql = configureVal +
         * "  WHERE ROWNUM=1"; configureVal = configureVal + "  WHERE ROWNUM=1"; }
         */

        tempList = modelService.listDataSql(tempSql);
        // itemList = modelService.listDataSql(configureVal);

        /*
         * if (itemList != null) { if (itemList != null && !itemList.isEmpty()) { for (int i = 0; i
         * < itemList.size(); i++ ) { Map<String, Object> tempMap = itemList.get(i); for (String
         * key : tempMap.keySet()) { itemList2.add(key); } } } }
         */}
      catch (Exception e)
      {
        log.error(e);
        // 数据库查询出错
        resStr = "SQLERROR";
      }
    }
    else if ("3".equals(configureType))
    {
      // 存储过程
      if (configureVal.indexOf("(") == -1)
      {
        resStr = "PROCEDUREERROR2";
      }
      configureVal = configureVal.toUpperCase();
      configureVal = configureVal.replaceAll("\\([^{}]+\\)", "");
      String sql = "select * from USER_SOURCE t where t.name=? ";
      tempList = modelService.listDataSql(sql, new Object[] {configureVal});
      if (tempList.isEmpty() || tempList == null)
      {
        resStr = "PROCEDUREERROR";
      }
    }

    if (itemList2.size() > 1)
    {
      resStr = "LEN_ERROR";
    }
    String alertMsg1 = modelAction.getText("解析成功");
    map.put("alertMsg", msgPopData(modelAction, alertMsg1).get("alertMsg"));
    map.put("title", msgPopData(modelAction, alertMsg1).get("title"));
    map.put("width", msgPopData(modelAction, alertMsg1).get("width"));
    map.put("height", msgPopData(modelAction, alertMsg1).get("height"));
    map.put("time", msgPopData(modelAction, alertMsg1).get("time"));
    modelAction.setAjaxMap(map);
    modelAction.setAjaxString(resStr);
    return BaseActionSupport.AJAX;
  }

  @SuppressWarnings("unchecked")
  private Map msgPopData(ModelAction modelAction, String alertMsg)
  {
    Map map = new HashMap<String, Object>();
    String title = ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
    title = modelAction.getText(title);
    String width = ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
    String height = ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
    String time = ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
    map.put("title", title);
    map.put("width", width);
    map.put("height", height);
    map.put("time", time);
    map.put("alertMsg", alertMsg);
    return map;
  }
}
