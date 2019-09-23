package com.more.mes.smt.inspection.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 巡检方案信息明细
 * @ClassName ProDetailBeforeShowService
 * @author csj
 * @Company: morelean
 */
public class ProDetailBeforeShowService implements FuncService
{

  @SuppressWarnings({ "rawtypes", "unchecked" })
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    String infoId = modelAction.getDataId();
    String sql = "select t.QI_DEFAULT_FALG,t.QI_ALTERATE_FLAG from T_QC_INSPECTION_INFO t where t.ID=?";
    List resultList = modelService.listDataSql(sql, new Object[] {infoId});
    CommMethod.listMapToEscapeJs(resultList);
    modelAction.setDataList(resultList);
    return modelAction.ActionForwardExeid(modelAction.getExeid());
  }

}
