package com.more.mes.smt.sampletype.service;

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
 * @Description 检测项目类型删除
 * @ClassName DelSampleTypeService
 * @author csj
 * @Company: morelean
 */
public class DelSampleTypeService implements FuncService
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

      // 判断条码配置有没有被引用
      String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
      String sql = "SELECT T2.ID " + " FROM T_QM_MODEL_TYPE T "
                   + " LEFT JOIN T_QM_SAMPLE_TYPE T2 "
                   + " ON T.QMT_ERROR_GRADE = T2.QST_ERROR_GRADE "
                   + " AND T.QMT_TEST_STEP = T2.QST_TEST_STEP "
                   + " AND T.QMT_SAMPLE_TYPE = T2.QST_SAMPLE_TYPE "
                   + " AND T.QMT_ITEM_TYPE = T2.QST_ITEM_TYPE "
                   + " AND T.QMT_SAMPLE_PLAN = T2.QST_SAMPLE_PLAN " + " WHERE T2.ID=? AND T.DATA_AUTH=? AND T2.DATA_AUTH=? ";
      for (int i = 0; i < strArray.length; i++ )
      {
        List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] {strArray[i],dataAuth,dataAuth});
        if (list != null && !list.isEmpty())
        {
          return modelAction.alertParentInfo((modelAction.getText("检测项目类型已被引用,无法删除")));
        }
      }

      String sql2 = "DELETE FROM T_QM_SAMPLE_TYPE T WHERE T.ID=? and T.DATA_AUTH = ?";

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