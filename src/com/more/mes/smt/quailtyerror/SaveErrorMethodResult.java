package com.more.mes.smt.quailtyerror;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
 * 品质异常单 异常对策
 * @author development
 *
 */
public class SaveErrorMethodResult implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      String id = request.getParameter("dataId");
      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String shortMethod = request.getParameter("paraMapObj.CQI_SHORT_METHOD");// 短期对策
      String longMethod = request.getParameter("paraMapObj.CQI_LONG_METHOD");// 长期对策
      TableDataMapExt qualityError = new TableDataMapExt();
      qualityError.setTableName("T_CO_QE_INFO");
      CommMethod.editSysDefCol(qualityError.getColMap(), modelAction.getUser());
      ArrayList paramList = new ArrayList();
      qualityError.setSqlWhere("and ID = ? ");
      paramList.add(id);
      qualityError.setSqlWhereArgs(paramList);

      // qualityError.setSqlWhere(" and ID='" + id + "'");
      qualityError.getColMap().put("CQI_DOC_STATUS", "4");
      qualityError.getColMap().put("CQI_SHORT_METHOD", shortMethod);
      qualityError.getColMap().put("CQI_LONG_METHOD", longMethod);
      qualityError.getColMap().put("CQI_MAKE_EMP", CommMethod.getSessionUser().getId());
      qualityError.getColMap().put("CQI_MAKE_TIME", sdf1.parse(sdf1.format(new Date())));
      if (dataAuth != null)
      {
        qualityError.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.edit(qualityError);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("保存失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), "0");
  }

}
