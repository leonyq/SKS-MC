package com.more.mes.smt.sampletype.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * @Description 检测项目类型修改前action
 * @ClassName EditTypeBeforeShow
 * @author csj
 * @Company: morelean
 */
public class EditTypeBeforeShow implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    String infoId = modelAction.getDataId();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    if (infoId != null)
    {
      String sql = "select QST_TEST_LEVEL,QST_TEST_GRADE,QST_SAMPLE_PLAN,QST_ALQ_VALUE from T_QM_SAMPLE_TYPE where id=? and DATA_AUTH = ?";
      List<Map<String, Object>> resultList = modelService.listDataSql(sql, new Object[] {infoId,dataAuth});
      if (resultList != null && !resultList.isEmpty())
      {
    	CommMethod.listMapToEscapeJs(resultList);
        modelAction.setDataList(resultList);
      }
    }
    return modelAction.ActionForwardExeid(modelAction.getExeid());

  }
}
