package com.more.mes.smt.problemreport;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存8D报告单 小组祝贺
 * 
 * @author development
 */
public class SaveCongratulate implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String iframeId = request.getParameter("iframeId");
    try
    {
      String dataId = request.getParameter("dataId");

      String CPR_CONGRATULATE = request.getParameter("paraMapObj.CPR_CONGRATULATE");// 恭贺团队

      // 修改8D报告单信息
      List<Object> sqlW = new ArrayList<Object>();
      sqlW.add(dataId); 
      sqlW.add(dataAuth); 
      TableDataMapExt pro = new TableDataMapExt();
      pro.setTableName("T_CO_PROBLEM_REPORT");
      CommMethod.editSysDefCol(pro.getColMap(), modelAction.getUser());
      pro.setSqlWhere("and id =? and data_auth=? ");
      pro.setSqlWhereArgs(sqlW);
      pro.getColMap().put("CPR_STATUS", "5");
      pro.getColMap().put("CPR_CONGRATULATE", CPR_CONGRATULATE);
      // pro.getColMap().put("CPR_CONGRATULATE", CPR_CONGRATULATE);
      pro.getColMap().put("CPR_CONFIRM_EMP", CommMethod.getSessionUser().getId());

      if (dataAuth != null)
      {
        pro.getColMap().put("DATA_AUTH", dataAuth);
      }

      modelService.edit(pro);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("保存失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), "0");
  }

}
