package com.more.mes.labelmanage.template;

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
import com.more.fw.core.common.method.StringUtils;

/**
 * 打印模板---获取已配置的数据项配置信息
 * @author development
 */
public class GetConfigureDataItemInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    String labelId = request.getParameter("labelId");
    String itemAlias = request.getParameter("itemAlias");
    String type = request.getParameter("type");
    Map<String, Object> map = new HashMap<String, Object>();
    List itemList = null;
    List tempList = null;
    String resStr = "";
    try
    {
      if (!"item".equals(type))
      {
        String sql = "SELECT T.CLD_LABEL_ID,T.CLD_ITEM_ALIAS,T.CLD_COLUMN_NAME,T.CLD_LIST_FLAG,T.CLD_SQL FROM T_CO_LABEL_DATACONFIGURE T WHERE T.CLD_LABEL_ID=?";
        itemList = modelService.listDataSql(sql, new Object[] {labelId});

        String sql2 = "SELECT T.CLD_SQL,T.CLD_CODE_ALIAS,T.CLD_NUM_ALIAS  FROM T_CO_LABEL_DATASOURCE T WHERE T.CLD_LABEL_ID=?";
        map = modelService.queryForMap(sql2, new Object[] {labelId});

      }
      else
      {
        String sql = "select * from T_CO_LABEL_ITEM_DATASOURCE t WHERE T.CLD_LABEL_ID=? AND T.CLD_ITEM_ALIAS=?";
        itemList = modelService.listDataSql(sql, new Object[] {labelId, itemAlias});

        String sql2 = "SELECT T.CLD_SQL  FROM T_CO_LABEL_DATACONFIGURE T WHERE T.CLD_LABEL_ID=?  AND T.CLD_ITEM_ALIAS=? AND T.CLD_SQL IS NOT NULL AND ROWNUM=1";
        map = modelService.queryForMap(sql2, new Object[] {labelId, itemAlias});
      }
    }
    catch (Exception e)
    {
      log.error(e);
      resStr = "ERROR";
      //resStr=StringUtils.toString(e);
    }
    modelAction.setAjaxList(itemList);
    modelAction.setAjaxMap(map);
    modelAction.setAjaxString(resStr);
    return BaseActionSupport.AJAX;
  }
}
