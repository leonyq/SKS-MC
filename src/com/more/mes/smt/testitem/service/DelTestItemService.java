package com.more.mes.smt.testitem.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 品质检测项目删除
 * @ClassName DelTestItemService
 * @author csj
 * @Company: morelean
 */
public class DelTestItemService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    try
    {
      String delId = request.getParameter("delId");// 需要删除的id
      if (StringUtils.isEmpty(delId)) {
		return modelAction.alertParentInfo("ID为空");
	}
      String[] strArray = delId.split(",");
      String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
      // 判断条码配置有没有被引用

      String sql = "SELECT DISTINCT T.ID " + " FROM  T_QM_MODEL_ITEM T2 "
                   + " LEFT JOIN T_QM_TEST_ITEM T  " + " ON T.QTI_ITEM_SN = T2.QMI_ITEM_SN AND T.DATA_AUTH = T2.DATA_AUTH "
                   + " WHERE T.ID = ? AND T.DATA_AUTH = ?";
      for (int i = 0; i < strArray.length; i++ )
      {
        List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] {strArray[i],dataAuth});
        if (list != null && !list.isEmpty())
        {
          return modelAction.alertParentInfo((modelAction.getText("检测项目已被引用,无法删除")));
        }
      }

      String sql2 = "DELETE FROM T_QM_TEST_ITEM T WHERE T.ID=? AND T.DATA_AUTH = ?";

      for (int i = 0; i < strArray.length; i++ )
      {
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
