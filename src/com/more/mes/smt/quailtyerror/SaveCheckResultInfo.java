package com.more.mes.smt.quailtyerror;

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
/**
 * 品质异常单 执行确认
 * @author development
 *
 */
public class SaveCheckResultInfo implements FuncService
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
      // 根据id取出对应的开立时间
      String sql = "select to_char(CQI_CREATE_TIME,'yyyy-mm-dd hh24:mi:ss') CQI_CREATE_TIME from T_CO_QE_INFO where ID = ?";
      List<Map> timeList = modelService.listDataSql(sql, new Object[] {id});
      String createTime = null;
      if (timeList != null && timeList.size() > 0)
      {
        createTime = (String)timeList.get(0).get("CQI_CREATE_TIME");
      }
      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      double cqiProcessTime = (double)(new Date().getTime() - sdf1.parse(createTime).getTime())
                                / (1000 * 3600 * 24);
      cqiProcessTime = (double)Math.round(cqiProcessTime * 100) / 100;
      String checkResult = request.getParameter("paraMapObj.CQI_RESULT_CHECK");// 执行结果
      String memo = request.getParameter("paraMapObj.CQI_MEMO");// 备注
      TableDataMapExt qualityError = new TableDataMapExt();
      qualityError.setTableName("T_CO_QE_INFO");
      CommMethod.editSysDefCol(qualityError.getColMap(), modelAction.getUser());
      ArrayList paramList = new ArrayList();
      qualityError.setSqlWhere("and ID = ? ");
      paramList.add(id);
      qualityError.setSqlWhereArgs(paramList);

      // qualityError.setSqlWhere(" and ID='" + id + "'");
      qualityError.getColMap().put("CQI_DOC_STATUS", "5");
      qualityError.getColMap().put("CQI_RESULT_CHECK", checkResult);
      qualityError.getColMap().put("CQI_MEMO", memo);
      qualityError.getColMap().put("CQI_CHECK_EMP", CommMethod.getSessionUser().getId());
      qualityError.getColMap().put("CQI_CHECK_TIME", sdf1.parse(sdf1.format(new Date())));
      qualityError.getColMap().put("CQI_PROCESS_TIME", cqiProcessTime);
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
