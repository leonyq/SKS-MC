package com.more.mes.smt.invalidproducttime;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 
 * 修改无效生产时间。
 *
 */

public class EditProductTime implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    //String dataAuth = request.getParameter("_DATA_AUTH");
    String dataAuth = String.valueOf(request.getSession().getAttribute("mcDataAuth"));
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");

    try
    {
      String id = request.getParameter("id");
      String csiBbeginTime = request.getParameter("paraMapObj.CSI_BEGIN_TIME");// 开始时间
      String csiEndTime = request.getParameter("paraMapObj.CSI_END_TIME");// 结束时间
      String csiStopType = request.getParameter("paraMapObj.CSI_STOP_TYPE");// 类型
      String csiStopTime = request.getParameter("paraMapObj.CSI_STOP_TIMES");// 停线时间
      String csiMaintenance = request.getParameter("paraMapObj.CSI_MAINTENANCE");// 原因

      String state;// 状态
      long csiStopTimes;
      List<Object> sqlList = new ArrayList<Object>();
      sqlList.add(id);       
      TableDataMapExt editExt = new TableDataMapExt();
      editExt.setTableName("T_CO_STOPLINE_INFO");
      CommMethod.editSysDefCol(editExt.getColMap(), modelAction.getUser());

      DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      // 判断状态确认/未确认，确认计算停线时长
       long begTime = df.parse(csiBbeginTime).getTime();

      if (StringUtils.isNotBlank(csiStopTime)){
        state = "2";
        long timeStamp = begTime + Integer.parseInt(csiStopTime)*60*1000;
        editExt.getColMap().put("CSI_STOP_TIMES", Integer.parseInt(csiStopTime));
        editExt.getColMap().put("CSI_END_TIME", new Date(timeStamp));

      }else
      if (StringUtils.isNotBlank(csiEndTime))
      {
        state = "2";
        long endTime = df.parse(csiEndTime).getTime();
        csiStopTimes = ((endTime - begTime) / 1000) / 60;
        editExt.getColMap().put("CSI_STOP_TIMES", csiStopTimes);
        editExt.getColMap().put("CSI_END_TIME", df.parse(csiEndTime));
      }
      else
      {
        state = "1";
      }
      // 记录时间
      String nowDate = DateUtil.formatDate(DateUtil.getCurDate(), DateUtil.yyyyMMddHHmmss);
      // 记录人
      String emp = CommMethod.getSessionUser().getId();
      editExt.getColMap().put("CSI_STATUS", state);
      editExt.getColMap().put("CSI_BEGIN_TIME", df.parse(csiBbeginTime));
      editExt.getColMap().put("CSI_STOP_TYPE", csiStopType);
      editExt.getColMap().put("CSI_MAINTENANCE", csiMaintenance);
      if (dataAuth != null)
      {
        editExt.getColMap().put("DATA_AUTH", dataAuth);// 组织结构
      }
      editExt.setSqlWhere(" and id = ? ");
      editExt.setSqlWhereArgs(sqlList);
      modelService.edit(editExt);
    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }

    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
  }

}
