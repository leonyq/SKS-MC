package com.more.mes.smt.samplingplan.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class EditPlanBeforeShow implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    String infoId = modelAction.getDataId();
    if (infoId != null)
    {
      String sql = "select QMS_TEST_LEVEL,QMS_TEST_GRADE,QMS_SAMPLE_PLAN,QMS_ALQ_VALUE from T_QM_MODEL_SCHEME where id=?";
      List<Map<String, Object>> resultList = modelService.listDataSql(sql, new Object[] {infoId});
      if (resultList != null && !resultList.isEmpty())
      {
        modelAction.setDataList(resultList);
      }
    }
    return modelAction.ActionForwardExeid(modelAction.getExeid());

  }
}
