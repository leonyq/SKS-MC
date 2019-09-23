package com.more.mes.smt.modelchecked;

import java.util.List;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 机种检测项目 获取项目类型
 * @author development
 *
 */
public class GetModTYPE implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    String sql = "select * from sy_dict_val where dict_code='QTI_ITEM_TYPE' ";
    List ajaxList = modelService.listSql(sql, null, null, null, "ORDER BY VALUE ", null);
    CommMethod.listToEscapeJs(ajaxList);
    modelAction.setAjaxList(ajaxList);
    return BaseActionSupport.AJAX;
  }

}
