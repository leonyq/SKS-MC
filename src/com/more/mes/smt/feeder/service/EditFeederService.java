package com.more.mes.smt.feeder.service;

import java.util.ArrayList;
import java.util.HashMap;
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
 * @Description 修改FEEDER信息
 * @ClassName EditFeederService
 * @author csj
 * @Company: morelean
 */
public class EditFeederService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    TableDataMapExt tdMap = new TableDataMapExt();
    List list = new ArrayList();
    String infoId = modelAction.getDataId();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    tdMap.setTableName("T_CO_FEEDER_INFOR");
    tdMap.setSqlWhere("and ID=?");
    list.add(infoId);
    tdMap.setSqlWhereArgs(list);
    String feederSn = request.getParameter("paraMapObj.TCF_FEEDER_SN");
    String sqlId = "select id from T_CO_FEEDER_INFOR t where t.TCF_FEEDER_SN=? and t.data_auth=? and t.id!=?";
    List<String> result = modelService.listDataSql(sqlId, new Object[] {feederSn,dataAuth, infoId});
    Map<String, Object> map = tdMap.getColMap();

    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    if (result != null && result.isEmpty())
    {
      Map<String, Object> feederMap = EditFeederService.getParameters(modelAction);
      map.put("TCF_FEEDER_SN", feederMap.get("TCF_FEEDER_SN"));
      map.put("TCS_SPEC", feederMap.get("TCS_SPEC"));
      map.put("TCT_TYPE", feederMap.get("TCT_TYPE"));
      if (StringUtils.isNotBlank(feederMap.get("TCT_MAX_COUNT")))
      {
        map.put("TCT_MAX_COUNT", Integer.parseInt(feederMap.get("TCT_MAX_COUNT").toString()));
      }
     
      map.put("TCF_LEFT_CHANNEL_SN", feederMap.get("TCF_LEFT_CHANNEL_SN"));
      map.put("TCF_RIGHT_CHANNEL_SN", feederMap.get("TCF_RIGHT_CHANNEL_SN"));
      map.put("TCF_MIDDLE_CHANNEL_SN", feederMap.get("TCF_MIDDLE_CHANNEL_SN"));
      map.put("TCF_MT_TYPE", feederMap.get("TCF_MT_TYPE"));
      if (StringUtils.isNotBlank(feederMap.get("TCF_MT_VALUE")))
      {
        map.put("TCF_MT_VALUE", Integer.parseInt(feederMap.get("TCF_MT_VALUE").toString()));
      }
      //map.put("TCF_MT_VALUE", feederMap.get("TCF_MT_VALUE"));
      if (StringUtils.isNotBlank(feederMap.get("TCF_MT_NOTNUM")))
      {
        map.put("TCF_MT_NOTNUM", Integer.parseInt(feederMap.get("TCF_MT_NOTNUM").toString()));
      }
      //map.put("TCF_MT_NOTNUM", feederMap.get("TCF_MT_NOTNUM"));
      if (StringUtils.isNotBlank(feederMap.get("TCS_USE_TIME")))
      {
        map.put("TCS_USE_TIME", Integer.parseInt(feederMap.get("TCS_USE_TIME").toString()));
      }
      //map.put("TCS_USE_TIME", feederMap.get("TCS_USE_TIME"));
      if (StringUtils.isNotBlank(feederMap.get("TCS_REMIND_NUM")))
      {
        map.put("TCS_REMIND_NUM", Integer.parseInt(feederMap.get("TCS_REMIND_NUM").toString()));
      }
      //map.put("TCS_REMIND_NUM", feederMap.get("TCS_REMIND_NUM"));
      if (StringUtils.isNotBlank(feederMap.get("TCS_MAX_CYCLE")))
      {
        map.put("TCS_MAX_CYCLE", Integer.parseInt(feederMap.get("TCS_MAX_CYCLE").toString()));
      }
      //map.put("TCS_MAX_CYCLE", feederMap.get("TCS_MAX_CYCLE"));
      if (StringUtils.isNotBlank(feederMap.get("TCS_MT_CYCLE")))
      {
        map.put("TCS_MT_CYCLE", Integer.parseInt(feederMap.get("TCS_MT_CYCLE").toString()));
      }
      //map.put("TCS_MT_CYCLE", feederMap.get("TCS_MT_CYCLE"));
      if (StringUtils.isNotBlank(feederMap.get("TCS_REMIND_DAY")))
      {
        map.put("TCS_REMIND_DAY", Integer.parseInt(feederMap.get("TCS_REMIND_DAY").toString()));
      }
      //map.put("TCS_REMIND_DAY", feederMap.get("TCS_REMIND_DAY"));
      map.put("TCF_FEEDER_ID", feederMap.get("TCF_FEEDER_ID"));
      try
      {
        modelService.edit(tdMap);
      }
      catch (Exception e)
      {
        log.error(e);
        throw new BussException(modelAction.getText("修改失败"), e);
      }
    }
    else
    {
      // feeder_sn 重复
      return modelAction.alertParentInfo("FEEDERSN重复，请更换");
    }
    String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), isCloseWin);
  }

  // 获取参数值
  public static Map<String, Object> getParameters(ModelAction modelAction)
  {
    Map<String, Object> feederMap = new HashMap<String, Object>();
    HttpServletRequest requert = modelAction.getRequest();
    String feederSN = requert.getParameter("paraMapObj.TCF_FEEDER_SN");
    String feederSpec = requert.getParameter("paraMapObj.TCS_SPEC");
    String feederType = requert.getParameter("paraMapObj.TCT_TYPE");
    String maxCount = requert.getParameter("paraMapObj.TCT_MAX_COUNT");
    String leftChannelSN = requert.getParameter("paraMapObj.TCF_LEFT_CHANNEL_SN");
    String rightChannelSN = requert.getParameter("paraMapObj.TCF_RIGHT_CHANNEL_SN");
    String middleChannelSN = requert.getParameter("paraMapObj.TCF_MIDDLE_CHANNEL_SN");
    String mtType = requert.getParameter("paraMapObj.TCF_MT_TYPE");
    String mtValue = requert.getParameter("paraMapObj.TCF_MT_VALUE");
    String mtNotnum = requert.getParameter("paraMapObj.TCF_MT_NOTNUM");
    String tcsUseTime = requert.getParameter("paraMapObj.TCS_USE_TIME");//保养点数
    String tcsRemindNum = requert.getParameter("paraMapObj.TCS_REMIND_NUM");//提醒点数
    String tcsMaxCycle = requert.getParameter("paraMapObj.TCS_MAX_CYCLE");//使用周期上限
    String tcsMtCycle = requert.getParameter("paraMapObj.TCS_MT_CYCLE");//保养周期
    String tcsRemindDay = requert.getParameter("paraMapObj.TCS_REMIND_DAY");//提醒天数
    String tcfFeederId = requert.getParameter("paraMapObj.TCF_FEEDER_ID");

    feederMap.put("TCF_FEEDER_SN", feederSN);
    feederMap.put("TCS_SPEC", feederSpec);
    feederMap.put("TCT_TYPE", feederType);
    feederMap.put("TCT_MAX_COUNT", maxCount);
    feederMap.put("TCF_LEFT_CHANNEL_SN", leftChannelSN);
    feederMap.put("TCF_RIGHT_CHANNEL_SN", rightChannelSN);
    feederMap.put("TCF_MIDDLE_CHANNEL_SN", middleChannelSN);
    feederMap.put("TCF_MT_TYPE", mtType);
    feederMap.put("TCF_MT_VALUE", mtValue);
    feederMap.put("TCF_MT_NOTNUM", mtNotnum);
    
    feederMap.put("TCS_USE_TIME", tcsUseTime);
    feederMap.put("TCF_FEEDER_ID", tcfFeederId);
    feederMap.put("TCS_REMIND_NUM", tcsRemindNum);
    feederMap.put("TCS_MAX_CYCLE", tcsMaxCycle);
    feederMap.put("TCS_MT_CYCLE", tcsMtCycle);
    feederMap.put("TCS_REMIND_DAY", tcsRemindDay);

    return feederMap;
  }

}
