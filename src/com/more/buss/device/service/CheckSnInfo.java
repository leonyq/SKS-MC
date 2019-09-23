package com.more.buss.device.service;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**校验物料信息
 * @author development
 */
public class CheckSnInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    String itemSn = request.getParameter("itemSn");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    Map<String, Object> map = null;
    List<Map<String, Object>> resultList = null;
    try
    {

      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      // 个体
      String getStockInfoSql = " SELECT T.WSO_ITEM_CODE ITEM_CODE, "
                               + " T.WSO_DOC_NUM   DOC_NUM, " + " T.WSO_ITEM_NUM  ITEM_NUM, "
                               + " T1.CI_ITEM_NAME ITEM_NAME, " + " T1.CI_ITEM_SPEC ITEM_SPEC "
                               + " FROM T_WMS_SPARE_OUT_DETAIL T " + " LEFT JOIN T_CO_ITEM T1 "
                               + " ON T.WSO_ITEM_CODE=T1.CI_ITEM_CODE AND T1.DATA_AUTH=? "
                               + " WHERE T.WSO_ITEM_SN = ? AND T.DATA_AUTH=? ";
      resultList = modelService.listDataSql(getStockInfoSql, new Object[] {dataAuth,itemSn,dataAuth});

    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }
    CommMethod.listMapToEscapeJs(resultList);
    modelAction.setAjaxList(resultList);
    return BaseActionSupport.AJAX;
  }

}
