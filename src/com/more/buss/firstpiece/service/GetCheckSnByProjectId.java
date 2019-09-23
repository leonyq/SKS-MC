package com.more.buss.firstpiece.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 首件检测 新增 根据工单获取产品SN
 * @author development
 *
 */
public class GetCheckSnByProjectId implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String projectId = request.getParameter("projectId"); // 工单
    String dataAuth = request.getParameter("dataAuth");
    String type = request.getParameter("type");
    String sql = "";
    if ("backFill".equals(type))
    {
      sql = "select distinct CFI_CHECK_RESULT,CFI_CHECK_CONTENT,CFI_EXAMINE_RESULT,CFI_CHECK_NUM,CFI_CHECK_SN "
            + "from T_CO_FAI_INFO where CFI_PROJECT_ID = ? and DATA_AUTH = ? and cfi_examine_result = '0' ";
    }
    else
    {
      sql = "select distinct CFI_CHECK_RESULT,CFI_CHECK_CONTENT,CFI_EXAMINE_RESULT,CFI_CHECK_NUM,CFI_CHECK_SN "
            + "from T_CO_FAI_INFO where CFI_PROJECT_ID = ? and DATA_AUTH = ? ";
    }
    List sList = modelService.listDataSql(sql, new Object[] {projectId, dataAuth});
    CommMethod.listToEscapeJs(sList);
    modelAction.setAjaxList(sList);
    return BaseActionSupport.AJAX;
  }

}
