package com.more.mes.smt.ipqctest;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

public class CheckProgram implements ValidateFuncService
{

  @Override
  public OperResult valJavaFun(String formId, Map paraMap, ModelService modelService,
                               ModelAction modelAction, Object... objs)
  {
    // TODO Auto-generated method stub
    String QII_ITEM_CODE = (String)paraMap.get("QII_ITEM_CODE");
    String QII_ITEM_NAME = (String)paraMap.get("QII_ITEM_NAME");
    String QII_ITEM_TYPE = (String)paraMap.get("QII_ITEM_TYPE");
    String QII_TEST_CONTENT = (String)paraMap.get("QII_TEST_CONTENT");
    String QII_EFFECTIVE_FLAG = (String)paraMap.get("QII_EFFECTIVE_FLAG");
    String dataid = modelAction.getDataId();
    // 校验项目代码
    String sql = "select T.QII_ITEM_CODE from T_QM_IPQC_ITEM T where T.QII_ITEM_CODE =?";
    List subList = modelService.listDataSql(sql, new Object[] {QII_ITEM_CODE});
    if (subList != null && subList.size() > 0)
    {
      if (!StringUtils.isEmpty(dataid) && subList.size() == 1)
      {
        String id1 = (String)((Map)subList.get(0)).get("ID");
        if (!dataid.equals(id1))
        {
          return new OperResult(false, "项目代码已存在");
        }
      }
      else
      {
        return new OperResult(false, "项目代码已存在");
      }
    }
    return new OperResult(true);
  }

}