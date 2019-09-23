package com.more.mes.labelmanage.template.pg;

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
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 打印模板---获取数据项配置列名
 * @author development
 */
public class GetItemColumnInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    String labelSql = request.getParameter("labelSql");
    Map<String, Object> map = new HashMap<String, Object>();
    List<Map<String, Object>> itemList = null;
    List<Map<String, Object>> tempList = null;
    List itemList2 = new ArrayList<String>();
    String resStr = "";
    try
    {
      labelSql = labelSql.trim();
      labelSql = labelSql.toUpperCase();
      labelSql = labelSql.replaceAll("\\s{1,}", " ");
      labelSql = labelSql.replaceAll(";", "");
      String tempSql = "";

      String sql = "";
      // if (labelSql.indexOf("WHERE") != -1)
      // {
      // labelSql = labelSql.replaceAll("\\{[^{}]+\\}", "''");
      // tempSql = labelSql.replaceAll("\\{[^{}]+\\}", "''");
      // String[] labelSqlS = labelSql.split("WHERE");
      // labelSql = labelSqlS[0] + "  limit 1";
      // sql = labelSqlS[0];
      // }
      // else
      // {
      // sql = labelSql;
      // tempSql = labelSql + "   limit 1";
      // labelSql = labelSql + "  limit 1";
      // }
      labelSql = labelSql.replaceAll("=\\s*\\{[^{}]+\\}", " IS NOT NULL");
      tempSql = labelSql.replaceAll("\\{[^{}]+\\}", "''");
      labelSql = "SELECT * FROM (" + labelSql + ") as table1 limit 1";

      // tempList = modelService.listDataSql(tempSql);
      // itemList = modelService.listDataSql(labelSql);

      //tempList = modelService.listDataSql(labelSql);
      itemList = modelService.listDataSql(labelSql);

      if (itemList != null)
      {
        if (itemList != null && !itemList.isEmpty())
        {
          for (int i = 0; i < itemList.size(); i++ )
          {
            Map<String, Object> tempMap = itemList.get(i);
            for (String key : tempMap.keySet())
            {
              itemList2.add(key);
            }
          }
        }
      }
      else
      {
        resStr = "EMPTY_ERROR";
      }
    }
    catch (Exception e)
    {
        resStr = "ERROR";
      //resStr = StringUtils.toString(e);
      log.error(e);
      // 数据库查询出错

    }
    String alertMsg1 = modelAction.getText("解析成功");
    map.put("alertMsg", msgPopData(modelAction, alertMsg1).get("alertMsg"));
    map.put("title", msgPopData(modelAction, alertMsg1).get("title"));
    map.put("width", msgPopData(modelAction, alertMsg1).get("width"));
    map.put("height", msgPopData(modelAction, alertMsg1).get("height"));
    map.put("time", msgPopData(modelAction, alertMsg1).get("time"));
    modelAction.setAjaxMap(map);
    itemList2 = removeDuplicate(itemList2);
    modelAction.setAjaxList(itemList2);
    modelAction.setAjaxString(resStr);
    return BaseActionSupport.AJAX;
  }

  public static List removeDuplicate(List list)
  {
    for (int i = 0; i < list.size() - 1; i++ )
    {
      for (int j = list.size() - 1; j > i; j-- )
      {
        if (list.get(j).equals(list.get(i)))
        {
          list.remove(j);
        }
      }
    }
    return list;
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
