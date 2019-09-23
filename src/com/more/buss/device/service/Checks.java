package com.more.buss.device.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

public class Checks implements ValidateFuncService {
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public OperResult valJavaFun(String formId, Map paraMap, ModelService modelService, ModelAction modelAction,
      Object... objs) {
    String type = modelAction.getParaMap2().get("type");
    String coItmeCode = StringUtils.toString(paraMap.get("ASSISTANTTOOLNO"));
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String sql = "select id from T_CO_ASSISTANTTOOL where ASSISTANTTOOLNO=? and DATA_AUTH=? ";
    List<Map> resList = modelService.listDataSql(sql,new Object[] {coItmeCode,dataAuth});
    int count =resList.size();
    if (count > 0) {
      if (("edit").equals(type)) {
        sql = "select ASSISTANTTOOLNO from T_CO_ASSISTANTTOOL where ID=?";
        resList = modelService.listDataSql(sql, new Object[] { modelAction.getDataId() });
        String coItmeCodeTemp = StringUtils.toString(resList.get(0).get("ASSISTANTTOOLNO"));
        if ((coItmeCodeTemp).equals(coItmeCode)) {
          return new OperResult(true);
        } else {
          return new OperResult(false, CommMethod.getText("辅料制具料号") + coItmeCode+ CommMethod.getText("已存在"));
        }
      } else {
        return new OperResult(false, CommMethod.getText("辅料制具料号") + coItmeCode + CommMethod.getText("已存在"));
      }
    } else {
      return new OperResult(true);
    }
  }

}
