package com.more.mes.smt.feeder.service.base;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 获得FEEDER信息
 * @ClassName MtEditBeforeShow
 * @author csj
 * @Company: morelean
 */
public class MtEditBeforeShow implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    String infoId = modelAction.getDataId();
    if (infoId != null)
    {
      String feederSql = "select info.TCF_FEEDER_SN,info.TCS_SPEC,info.TCT_TYPE,info.TCF_MT_LASTTIME"
                         + " from T_CO_FEEDER_INFOR info,T_CO_FEEDER_MAINTENANCE t  where t.ID=? and t.TCF_FEEDER_ID=info.ID";
      List<Map<String, Object>> feederList = modelService.listDataSql(feederSql,
        new Object[] {infoId});
      if (feederList != null && !feederList.isEmpty())
      {
    	CommMethod.listMapToEscapeJs(feederList);
        modelAction.setDataList(feederList);
      }
      String mtSql = "select info.TCFM_TYPE from T_CO_FEEDER_MAINTENANCE info where id=? ";
      List<Map<String, Object>> mtList = modelService.listDataSql(mtSql, new Object[] {infoId});
      if (mtList != null && !mtList.isEmpty())
      {
    	CommMethod.mapToEscapeJs(mtList.get(0));
        modelAction.setDataMap(mtList.get(0));
      }

    }
    return modelAction.ActionForwardExeid(modelAction.getExeid());
  }

}
