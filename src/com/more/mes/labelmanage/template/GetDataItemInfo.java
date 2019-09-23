package com.more.mes.labelmanage.template;

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
 * 打印模板----获取数据项配置信息
 * @author development
 */
public class GetDataItemInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    String labelId = request.getParameter("labelId");
    Map<String, Object> map = new HashMap<String, Object>();
    List itemList = null;
    List<Map<String, Object>> itemList2 = new ArrayList<Map<String, Object>>();
    String resStr = "SUC";
    try
    {
      String sql = "SELECT T.TEMPLATE_ID,T.DATA_ITEMS_NAME,T.DATA_ITEMS_ALIAS FROM ML_DATA_ITEMS T WHERE T.TEMPLATE_ID=? AND T.PICTURE_FLAG!='Y'";
      itemList = modelService.listDataSql(sql, new Object[] {labelId});

      String sql2 = "SELECT T.CLASS_ONE_LABEL_ID, " + " T.CLASS_ONE_LABEL_ITEM, "
                    + " T.CLASS_TWO_LABEL_ID, " + " T.CLASS_TWO_LABEL_ITEM, "
                    + " T.CLASS_THREE_LABEL_ID, " + " T.CLASS_THREE_LABEL_ITEM "
                    + " FROM ML_PACKAGING_RULES T " + " WHERE T.ITEM_LABEL_ID = ? ";
      itemList2 = modelService.listDataSql(sql2, new Object[] {labelId});
    }
    catch (Exception e)
    {
      log.error(e);
      resStr = "ERROR";
    }
    modelAction.setAjaxList(itemList);
    modelAction.setAjaxString(resStr);
    if (itemList2 != null && !itemList2.isEmpty())
    {
      map = itemList2.get(0);
    }
    modelAction.setAjaxMap(map);
    return BaseActionSupport.AJAX;
  }
}
