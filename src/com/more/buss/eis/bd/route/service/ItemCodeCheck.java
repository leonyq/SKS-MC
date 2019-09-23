package com.more.buss.eis.bd.route.service;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

public class ItemCodeCheck implements ValidateFuncService {

  private final Log log = LogFactory.getLog(this.getClass());

  /**
   * @param formId
   *          表单ID
   * @param paraMap
   *          数据对象
   * @param modelService
   *          modelService
   * @return
   */
  @Override
  public OperResult valJavaFun(String formId, Map paraMap, ModelService modelService, ModelAction modelAction,
      Object... objs) {
    String type = modelAction.getParaMap2().get("type");
    String coItmeCode = StringUtils.toString(paraMap.get("CI_ITEM_CODE"));
    String dataAuth = modelAction.getRequest().getParameter("_DATA_AUTH");
    String sql = "select count(1) as count from T_CO_ITEM where CI_ITEM_CODE=? and DATA_AUTH=? ";
    Map resultMap = modelService.queryForMap(sql, new Object[] { coItmeCode,dataAuth });
    int count = Integer.parseInt(resultMap.get("count").toString());
    if (count > 0) {
      if (("edit").equals(type)) {
        sql = "select CI_ITEM_CODE from T_CO_ITEM where ID=?";
        resultMap = modelService.queryForMap(sql, new Object[] { modelAction.getDataId() });
        String coItmeCodeTemp = StringUtils.toString(resultMap.get("CI_ITEM_CODE"));
        if ((coItmeCodeTemp).equals(coItmeCode)) {
          return new OperResult(true);
        } else {
          return new OperResult(false, CommMethod.getText("物料代码") + coItmeCode + CommMethod.getText("已存在"));
        }
      } else {
        return new OperResult(false, CommMethod.getText("物料代码") + coItmeCode + CommMethod.getText("已存在"));
      }
    } else {
      return new OperResult(true);
    }
  }
}
