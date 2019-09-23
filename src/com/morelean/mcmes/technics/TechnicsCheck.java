package com.morelean.mcmes.technics;

import java.util.ArrayList;
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

public class TechnicsCheck implements ValidateFuncService {

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

    String s = modelAction.getRequest().getRemoteAddr();

    String proNo = CommMethod.escapeJs((String) paraMap.get("CT_ID"));
    String pName = CommMethod.escapeJs((String) paraMap.get("CT_NAME"));
    String dataid = CommMethod.escapeJs(modelAction.getDataId());
    String step =  CommMethod.escapeJs((String) paraMap.get("CT_PRODUCT_STEP"));
    String face = CommMethod.escapeJs((String) paraMap.get("CT_PROCESS_FACE"));
    String flag = CommMethod.escapeJs((String) paraMap.get("CT_DEFAULT_FLAG"));
    String vflag = CommMethod.escapeJs((String) paraMap.get("CT_VALID_FLAG"));
    //String dataAuth = CommMethod.escapeJs((String) paraMap.get("DATA_AUTH"));
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    
    List subList3 = new ArrayList<>();
    String sql1 = "select * from T_CO_TECHNICS where CT_ID=? and DATA_AUTH=? ";
    String sql2 = "select * from T_CO_TECHNICS where CT_NAME=? and DATA_AUTH=?";
    String sql3 = "select * from T_CO_TECHNICS where CT_PRODUCT_STEP=? and CT_PROCESS_FACE=? and CT_DEFAULT_FLAG='Y' and CT_VALID_FLAG='Y' and DATA_AUTH=?";
    List subList1 = modelService.listDataSql(sql1, new Object[] { proNo,dataAuth });
    List subList2 = modelService.listDataSql(sql2, new Object[] { pName,dataAuth });
    if (!StringUtils.isEmpty(dataid)) {
      sql3 = sql3 + " and id != ? ";
      subList3 = modelService.listDataSql(sql3, new Object[] { step, face, dataid,dataAuth });
    } else {
      subList3 = modelService.listDataSql(sql3, new Object[] { step, face,dataAuth });
    }

    if (subList1 != null && subList1.size() > 0) {
      if (!StringUtils.isEmpty(dataid) && subList1.size() == 1) {
        String id1 = (String) ((Map) subList1.get(0)).get("ID");
        if (!dataid.equals(id1)) {
          return new OperResult(false, modelAction.getText("工艺代码1：") + proNo + modelAction.getText("，已存在"));

        }
      } else {
        return new OperResult(false, modelAction.getText("工艺代码2：") + proNo + modelAction.getText("，已存在"));
      }
    }
    if (subList2 != null && subList2.size() > 0) {
      if (!StringUtils.isEmpty(dataid) && subList2.size() == 1) {
        String id1 = (String) ((Map) subList2.get(0)).get("ID");
        if (!dataid.equals(id1)) {
          return new OperResult(false, modelAction.getText("工艺名称：") + pName + modelAction.getText("，已存在"));

        }
      } else {
        return new OperResult(false, modelAction.getText("工艺名称：") + pName + modelAction.getText("，已存在"));
      }
    }
    if (subList3.size() != 0) {
      if ("Y".equals(flag)) {
        return new OperResult(false, modelAction.getText("同一个生产阶别跟加工面别下只能有一个默认工艺"));
      }
    }
    /*
     * if (subList3 != 0) { if (!StringUtils.isEmpty(dataid) && subList3.size() == 1) { String id1 = (String) ((Map) subList3.get(0)).get("ID"); if (!dataid.equals(id1)) { return
     * new OperResult(false, modelAction.getText("同一个生产阶别跟加工面别下只能有一个默认工艺")); } } else { return new OperResult(false, modelAction.getText("同一个生产阶别跟加工面别下只能有一个默认工艺")); } }
     */
    return new OperResult(true);
  }
}
