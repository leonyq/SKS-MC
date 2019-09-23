package com.more.mes.smt.devicedowntime;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
 * 保存新增的生产领料信息
 * 
 * @author development
 */
public class SaveDownTimeInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    //String dataAuth = request.getParameter("_DATA_AUTH");
     String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    

      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

      String deivceSN = request.getParameter("paraMap1@0#CDD_DEVICE_SN");// 设备SN
      String status = "";// 状态（1、开立 2、关结）
      String startTime = request.getParameter("paraMap1@0#CDD_START_TIME");// 开始时间
      String endTime = request.getParameter("paraMap1@0#CDD_END_TIME");// 结束时间
      String stopType = request.getParameter("paraMap1@0#CDD_STOP_TYPE");// 停机类型（1、人为 2、缺修）
      String stopReason = request.getParameter("paraMap1@0#CDD_STOP_REASON");// 停机原因
      String temporaryMethod = request.getParameter("paraMap1@0#CDD_TEMPORARY_METHOD");// 临时处理方法
      String longtermMethod = request.getParameter("paraMap1@0#CDD_LONGTERM_METHOD");// 长期处理方法
      String memo = request.getParameter("paraMap1@0#CDD_MEMO");// 备注
      if(!StringUtils.isEmpty(startTime)&&!StringUtils.isEmpty(endTime)){
    	  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	  long sdate;
		long edate;
		try {
			sdate = simpleDateFormat.parse(startTime).getTime();
			  edate = simpleDateFormat.parse(endTime).getTime();
	          if(sdate>edate){
	        	  throw new BussException(modelAction.getText("结束时间不能早于开始时间")); 
	          }			  
		} catch (ParseException e) {
		      log.error(e);
		      throw new BussException(modelAction.getText("时间有误"));
		}
      }
      try
      {      
      if (StringUtils.isEmpty(endTime) || StringUtils.isEmpty(temporaryMethod)
          || StringUtils.isEmpty(longtermMethod))
      {
        status = "1";
      }
      else
      {
        status = "2";
      }
      TableDataMapExt downTime = new TableDataMapExt();
      downTime.setTableName("T_CO_DEVICE_DOWNTIME");
      CommMethod.addSysDefCol(downTime.getColMap(), modelAction.getUser());
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
      }
      if (!StringUtils.isEmpty(endTime))
      {
        downTime.getColMap().put("CDD_END_TIME", sdf1.parse(endTime));
      }

      if (dataAuth != null)
      {
        downTime.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.save(downTime);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
  }

}
