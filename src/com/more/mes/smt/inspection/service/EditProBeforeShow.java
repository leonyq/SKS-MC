package com.more.mes.smt.inspection.service;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 获得巡检方案信息
 * @ClassName EditProBeforeShow
 * @author csj
 * @Company: morelean
 */
public class EditProBeforeShow implements FuncService
{
  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    TableDataMapExt tdMap = new TableDataMapExt();
    String infoId = modelAction.getDataId();
    tdMap.put("ID", infoId);

    String qcSql = "select t.QI_DEFAULT_FALG,t.QI_ALTERATE_FLAG,t.QI_TYPE,t.QI_MODEL from T_QC_INSPECTION_INFO t where t.id=?";
    String timeSql = "select t.ID, t.QIT_GROUP,t.QIT_TIME_INTERVAL,t.QIT_BEGIN_TIME,t.QIT_END_TIME from T_QC_INSPECTION_TIME t where t.QI_ID=?";
    List<String> qcInfoList = modelService.listDataSql(qcSql, new Object[] {infoId});
    List timeInfoList = modelService.listDataSql(timeSql, new Object[] {infoId});

    if (!qcInfoList.isEmpty())
    {
      Map<String, String> qcMap = modelService.queryForMap(qcSql, new Object[] {infoId});
      String altFlag = qcMap.get("QI_ALTERATE_FLAG");
      String defFlag = qcMap.get("QI_DEFAULT_FALG");
      String qiModel = qcMap.get("QI_MODEL");
      String qiType = qcMap.get("QI_TYPE");

      tdMap.put("QI_ALTERATE_FLAG", altFlag);
      tdMap.put("QI_DEFAULT_FALG", defFlag);
      tdMap.put("QI_MODEL", qiModel);
      tdMap.put("QI_TYPE", qiType);
    }
    CommMethod.mapToEscapeJs(tdMap);
    modelAction.setDataMap(tdMap);
    CommMethod.listMapToEscapeJs(timeInfoList);
    modelAction.setDataList(timeInfoList);
    return null;
  }
}
