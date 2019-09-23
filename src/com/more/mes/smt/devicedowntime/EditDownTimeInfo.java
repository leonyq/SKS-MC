package com.more.mes.smt.devicedowntime;

import java.text.SimpleDateFormat;
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
 * 保存新增的生产领料信息
 * 
 * @author development
 */
public class EditDownTimeInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    String formId = request.getParameter("formId");
    String infoId = modelAction.getDataId();
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

      String deivceSN = request.getParameter("paraMapObj.CDD_DEVICE_SN");// 设备SN
      String status = "";// 状态（1、开立 2、关结）
      String startTime = request.getParameter("paraMapObj.CDD_START_TIME");// 开始时间
      String endTime = request.getParameter("paraMapObj.CDD_END_TIME");// 结束时间
      String stopType = request.getParameter("paraMapObj.CDD_STOP_TYPE");// 停机类型（1、人为 2、缺修）
      String stopReason = request.getParameter("paraMapObj.CDD_STOP_REASON");// 停机原因
      String temporaryMethod = request.getParameter("paraMapObj.CDD_TEMPORARY_METHOD");// 临时处理方法
      String longtermMethod = request.getParameter("paraMapObj.CDD_LONGTERM_METHOD");// 长期处理方法
      String memo = request.getParameter("paraMapObj.CDD_MEMO");// 备注

      if (StringUtils.isEmpty(startTime) || StringUtils.isEmpty(endTime) || StringUtils.isEmpty(temporaryMethod)
          || StringUtils.isEmpty(longtermMethod))
      {
        status = "1";
      }
      else
      {
        status = "2";
      }
      List<Object> sqlList = new ArrayList<Object>();
      sqlList.add(infoId);
      TableDataMapExt downTime = new TableDataMapExt();
      downTime.setTableName("T_CO_DEVICE_DOWNTIME");
      downTime.setSqlWhere(" AND ID=? ");
      downTime.setSqlWhereArgs(sqlList);
      CommMethod.editSysDefCol(downTime.getColMap(), modelAction.getUser());
      downTime.getColMap().put("CDD_DEVICE_SN", deivceSN);
      downTime.getColMap().put("CDD_STATUS", status);
      downTime.getColMap().put("CDD_STOP_TYPE", stopType);
      downTime.getColMap().put("CDD_STOP_REASON", stopReason);
      downTime.getColMap().put("CDD_TEMPORARY_METHOD", temporaryMethod);
      downTime.getColMap().put("CDD_LONGTERM_METHOD", longtermMethod);
      downTime.getColMap().put("CDD_MEMO", memo);
      if (!StringUtils.isEmpty(startTime))
      {
        downTime.getColMap().put("CDD_START_TIME", sdf1.parse(startTime));
      }else{
    	  downTime.getColMap().put("CDD_START_TIME", null); 
      }
      if (!StringUtils.isEmpty(endTime))
      {
        downTime.getColMap().put("CDD_END_TIME", sdf1.parse(endTime));
      }else{
    	  downTime.getColMap().put("CDD_END_TIME", null);  
      }
      if (dataAuth != null)
      {
        downTime.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.edit(downTime);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
  }

}
