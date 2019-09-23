package com.more.mes.smt.invalidproducttime;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
 * 添加保存无效生产时间
 *
 */
public class AddProductTime implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
   // String dataAuth = request.getParameter("_DATA_AUTH");
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
      String csiAreaSn = request.getParameter("paraMap1@0#CSI_AREA_SN");// 线别
      String moNumber = request.getParameter("moNumber");// 制令单
      String projectId = request.getParameter("projectId");// 工单
      String csiBbeginTime = request.getParameter("paraMap1@0#CSI_BEGIN_TIME");// 开始时间
      String csiEndTime = request.getParameter("paraMap1@0#CSI_END_TIME");// 结束时间
      String csiStopType = request.getParameter("paraMap1@0#CSI_STOP_TYPE");// 类型
      String csiStopTime = request.getParameter("paraMap1@0#CSI_STOP_TIMES");// 停线时间
      String csiMaintenance = request.getParameter("paraMap1@0#CSI_MAINTENANCE");// 原因
      String auth = request.getSession().getAttribute("mcDataAuth").toString();// 组织机构
      String state;// 状态
      long csiStopTimes;

      String sql = "select CSI_BEGIN_TIME,CSI_END_TIME from  T_CO_STOPLINE_INFO "
                   + " where CSI_AREA_SN=? and DATA_AUTH=?";
      List<Map> list = modelService.listDataSql(sql, new Object[] {csiAreaSn,auth});
      if (null != list && list.size() > 0)
      {
        for (int i = 0; i < list.size(); i++ )
        {
          if (StringUtils.isBlank(list.get(i).get("CSI_BEGIN_TIME")))
          {
            return modelAction.alertParentInfo(modelAction.getText("上条记录停线结束时间未填写"));
          }
          if (StringUtils.isBlank(list.get(i).get("CSI_END_TIME")))
          {
            return modelAction.alertParentInfo(modelAction.getText("上条记录停线结束时间未填写"));
          }
        }
      }

      TableDataMapExt saveExt = new TableDataMapExt();
      saveExt.setTableName("T_CO_STOPLINE_INFO");
      CommMethod.addSysDefCol(saveExt.getColMap(), modelAction.getUser());

      DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      long begTime = df.parse(csiBbeginTime).getTime();
      // 判断状态确认/未确认，确认计算停线时长
      if (StringUtils.isNotBlank(csiStopTime)){
        state = "2";
        long timeStamp = begTime + Integer.parseInt(csiStopTime)*60*1000;
        saveExt.getColMap().put("CSI_STOP_TIMES", Integer.parseInt(csiStopTime));
        saveExt.getColMap().put("CSI_END_TIME", new Date(timeStamp));
      }else if (StringUtils.isNotBlank(csiEndTime))
      {
        state = "2";

        //long begTime = df.parse(csiBbeginTime).getTime();
        long endTime = df.parse(csiEndTime).getTime();
        csiStopTimes = ((endTime - begTime) / 1000) / 60;
        saveExt.getColMap().put("CSI_STOP_TIMES", csiStopTimes);
        saveExt.getColMap().put("CSI_END_TIME", df.parse(csiEndTime));
      }
      else
      {
        state = "1";
      }
      // 记录时间
      String nowDate = DateUtil.formatDate(DateUtil.getCurDate(), DateUtil.yyyyMMddHHmmss);
      // 记录人
      String emp = CommMethod.getSessionUser().getId();

      saveExt.getColMap().put("CSI_RECORD_TIME", df.parse(nowDate));
      saveExt.getColMap().put("CSI_RECORD_EMP", emp);
      saveExt.getColMap().put("CSI_STATUS", state);
      saveExt.getColMap().put("CSI_AREA_SN", csiAreaSn);
      saveExt.getColMap().put("CSI_PROJECT_ID", projectId);
      saveExt.getColMap().put("CSI_MO_NUMBER", moNumber);
      saveExt.getColMap().put("CSI_BEGIN_TIME", df.parse(csiBbeginTime));
      saveExt.getColMap().put("CSI_STOP_TYPE", csiStopType);
      saveExt.getColMap().put("CSI_MAINTENANCE", csiMaintenance);
      saveExt.getColMap().put("CSI_TYPE", "1");
      if (dataAuth != null)
      {
        saveExt.getColMap().put("DATA_AUTH", dataAuth);// 组织结构
      }
      modelService.save(saveExt);

    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }

    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
  }

}
