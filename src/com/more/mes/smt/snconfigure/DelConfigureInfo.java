package com.more.mes.smt.snconfigure;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 编码生成配置页面----删除
 * @author Administrator
 *
 */
public class DelConfigureInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    try
    {
      String delId = request.getParameter("delId");// 需要删除的id
      String[] strArray = delId.split(",");
      List<Map<String, Object>> list = null;
      String existSql = "";
      String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
      // 判断条码配置有没有被引用
      // 单据
      existSql = "SELECT T.ID FROM T_WMS_DOC_TYPE T WHERE T.WDT_CREATE_RULE=? AND T.DATA_AUTH=? ";
      for (int i = 0; i < strArray.length; i++ )
      {
        list = modelService.listDataSql(existSql, new Object[] {strArray[i],dataAuth});
        if (list != null && !list.isEmpty())
        {
          return modelAction.alertParentInfo((modelAction.getText("生成规则已被引用,无法删除")));
        }
      }
      existSql = "SELECT T.ID FROM T_WMS_DISPATCH_TYPE T WHERE T.WDT_CREATE_RULE=?  AND T.DATA_AUTH=? ";
      for (int i = 0; i < strArray.length; i++ )
      {
        list = modelService.listDataSql(existSql, new Object[] {strArray[i],dataAuth});
        if (list != null && !list.isEmpty())
        {
          return modelAction.alertParentInfo((modelAction.getText("生成规则已被引用,无法删除")));
        }
      }
      // 制具料号
      existSql = "SELECT T.ID FROM T_CO_ASSISTANTTOOL T WHERE T.TIN_CREATE_RULE=?  AND T.DATA_AUTH=? ";
      for (int i = 0; i < strArray.length; i++ )
      {
        list = modelService.listDataSql(existSql, new Object[] {strArray[i],dataAuth});
        if (list != null && !list.isEmpty())
        {
          return modelAction.alertParentInfo((modelAction.getText("生成规则已被引用,无法删除")));
        }
      }

      String sql = "DELETE FROM T_CO_SN_CONFIGURE T WHERE T.ID=?";
      String sql2 = "DELETE FROM T_CO_SN_CONFIGURE_DETAIL T WHERE T.CCD_CONFIGURE_ID=?   AND T.DATA_AUTH=? ";

      for (int i = 0; i < strArray.length; i++ )
      {
        modelService.execSql(sql, new Object[] {strArray[i]});
        modelService.execSql(sql2, new Object[] {strArray[i],dataAuth});
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("删除失败"), e);
    }
    return modelAction.reloadParent(modelAction.getText("删除成功"));
  }

}
