package com.more.mes.labelmanage.template.oracle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 打印模板---解析清单数据源
 * @author development
 */
public class GetListColumnInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    String diaplayWay = request.getParameter("diaplayWay");
    String labelSql = request.getParameter("listSql");
    if ("1".equals(diaplayWay))
    {
      // 列表显示
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
        labelSql = labelSql.replaceAll("=\\s*\\{[^{}]+\\}", " IS NOT NULL");
        tempSql = labelSql.replaceAll("\\{[^{}]+\\}", "''");
        // String[] labelSqlS = labelSql.split("WHERE");
        // labelSql = labelSqlS[0] + "  WHERE ROWNUM=1";
        // sql = labelSqlS[0];
        labelSql = "SELECT * FROM (" + labelSql + ") WHERE ROWNUM=1";
        // }
        // else
        // {
        // sql = labelSql;
        // tempSql = labelSql + "  WHERE ROWNUM=1";
        // labelSql = labelSql + "  WHERE ROWNUM=1";
        // }
        //tempList = modelService.listDataSql(tempSql);
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
        log.error(e);
        // 数据库查询出错
        resStr = "ERROR";
      }
      modelAction.setAjaxMap(map);
      modelAction.setAjaxList(itemList2);
      modelAction.setAjaxString(resStr);

    }
    else
    {
      // 数据排列
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

        // if (labelSql.indexOf("WHERE") != -1)
        // {
        // labelSql = labelSql.replaceAll("\\{[^{}]+\\}", "''");
        // tempSql = labelSql.replaceAll("\\{[^{}]+\\}", "''");
        // String[] labelSqlS = labelSql.split("WHERE");
        // labelSql = labelSqlS[0] + "  WHERE ROWNUM=1";
        // }
        // else
        // {
        // tempSql = labelSql + "  WHERE ROWNUM=1";
        // labelSql = labelSql + "  WHERE ROWNUM=1";
        // }

        String sql = "";
        labelSql = labelSql.replaceAll("=\\s*\\{[^{}]+\\}", " IS NOT NULL");
        tempSql = labelSql.replaceAll("\\{[^{}]+\\}", "''");
        labelSql = "SELECT * FROM (" + labelSql + ") WHERE ROWNUM=1";

        //tempList = modelService.listDataSql(tempSql);
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
        log.error(e);
        // 数据库查询出错
        resStr = "ERROR";
      }
      if (itemList2.size() > 1)
      {
        resStr = "LEN_ERROR";
      }
      modelAction.setAjaxMap(map);
      modelAction.setAjaxList(itemList2);
      modelAction.setAjaxString(resStr);
    }
    return BaseActionSupport.AJAX;
  }
}
