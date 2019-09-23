package com.more.mes.smt.quailtyerror.pg;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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

public class SaveResponsibleJudgeResult implements FuncService
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
      String dept = request.getParameter("paraMapObj.CQI_RESPONSIBLE_DEP");// 责任部门
      String dec = request.getParameter("paraMapObj.CQI_RESPONSIBLE_DESC");// 判定描述

      String sql = "select CQI_DOC_STATUS from T_CO_QE_INFO where id=?";
      List<Map> list = modelService.listDataSql(sql, new Object[] {id});

      Map<String, Object> map = list.get(0);

      String state = (String)map.get("CQI_DOC_STATUS");

      int cprStatus = 3;
      String cprState = null;
      if (StringUtils.isNotBlank(state))
      {
        int status = Integer.parseInt(state);
        if (cprStatus < status)
        {
          cprState = status + "";
        }
        else
        {
          cprState = cprStatus + "";
        }
      }

      TableDataMapExt qualityError = new TableDataMapExt();
      qualityError.setTableName("T_CO_QE_INFO");
      CommMethod.editSysDefCol(qualityError.getColMap(), modelAction.getUser());
      ArrayList paramList = new ArrayList();
      qualityError.setSqlWhere("and ID = ? ");
      paramList.add(id);
      qualityError.setSqlWhereArgs(paramList);

      // qualityError.setSqlWhere(" and ID='" + id + "'");
      qualityError.getColMap().put("CQI_DOC_STATUS", cprState);
      qualityError.getColMap().put("CQI_RESPONSIBLE_DEP", dept);
      qualityError.getColMap().put("CQI_RESPONSIBLE_DESC", dec);
      qualityError.getColMap().put("CQI_JUDGE_EMP", CommMethod.getSessionUser().getId());
      qualityError.getColMap().put("CQI_JUDGE_TIME", sdf1.parse(sdf1.format(new Date())));
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
