package com.more.mes.smt.inspection.service;

import java.util.Date;
import java.util.HashMap;
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
 * @Description 保存巡检方案信息
 * @ClassName SaveProgrammeService
 * @author csj
 * @Company: morelean
 */
public class SaveProgrammeService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings({"unchecked"})
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String defFlag = request.getParameter("QI_DEFAULT_FALG");
    String dataAuth = request.getParameter("_DATA_AUTH");
    
    Map<String, Object> infoMap = SaveProgrammeService.getParameters(modelAction);
    if (StringUtils.isEmpty(infoMap.get("QI_NAME"))
    		||StringUtils.isEmpty(infoMap.get("QI_TYPE"))) {
    	return modelAction.alertParentInfo("输入参数缺失");
	}
    // 方案名唯一性
    String qiName = StringUtils.toString(infoMap.get("QI_NAME"));
    String sqlName = "select t.ID from T_QC_INSPECTION_INFO t where t.QI_NAME=? and t.data_auth=? ";
    List<String> list = modelService.listDataSql(sqlName, new Object[] {qiName,dataAuth});
    if (list != null && !list.isEmpty())
    {
      return modelAction.alertParentInfo("方案名" + qiName + "已存在，请更换");
    }

    String sqlId = "select t.ID from T_QC_INSPECTION_INFO t where t.QI_DEFAULT_FALG=? and t.data_auth=? ";
    List<String> result = modelService.listDataSql(sqlId, new Object[] {defFlag,dataAuth});
    // 添加巡检方案信息
    TableDataMapExt qcTdMap = new TableDataMapExt();
    CommMethod.addSysDefCol(qcTdMap.getColMap(), modelAction.getUser());
    Map<String, Object> qcMap = qcTdMap.getColMap();
    String qcId = StringUtils.getUUID();
    qcTdMap.setTableName("T_QC_INSPECTION_INFO");
    qcMap.put("ID", qcId);
    qcMap.put("QI_NAME", infoMap.get("QI_NAME"));
    qcMap.put("QI_DEFAULT_FALG", infoMap.get("QI_DEFAULT_FALG"));
    qcMap.put("QI_ALTERATE_FLAG", infoMap.get("QI_ALTERATE_FLAG"));
    qcMap.put("QI_TYPE", infoMap.get("QI_TYPE"));
    if(!infoMap.get("QI_ADVANCE_ALARM").equals("")){
    	qcMap.put("QI_ADVANCE_ALARM", Integer.parseInt((String)infoMap.get("QI_ADVANCE_ALARM")));
    }
    qcMap.put("QI_MODEL", infoMap.get("QI_MODEL"));
    if(!infoMap.get("QI_INPUT_TIME").equals("")){
    	qcMap.put("QI_INPUT_TIME", Integer.parseInt((String)infoMap.get("QI_INPUT_TIME")));
    }
    qcMap.put("CREATE_TIME", infoMap.get("CREATE_TIME"));
    if(dataAuth!=null){
    	qcMap.put("DATA_AUTH", dataAuth);
    }
    if (result.isEmpty())
    {
      try
      {
        modelService.save(qcTdMap);
      }
      catch (Exception e)
      {
        log.error(e);
        throw new BussException(modelAction.getText("保存失败"), e);
      }
    }
    else
    {
      return modelAction.alertParentInfo("已存在默认巡检方案");
    }

    TableDataMapExt timeTdMap = new TableDataMapExt();
    CommMethod.addSysDefCol(timeTdMap.getColMap(), modelAction.getUser());
    timeTdMap.setTableName("T_QC_INSPECTION_TIME");
    String[] calwGroup = ((String)infoMap.get("CALW_GROUP")).split(",");
    String[] calwTime = ((String)infoMap.get("CALW_TIME")).split(",");
    String[] calwStart = ((String)infoMap.get("CALW_START")).split(",");
    String[] calwEnd = ((String)infoMap.get("CALW_END")).split(",");

    if (calwGroup != null && calwGroup.length != 0)
    {
      // 保存时段信息
      if (!"".equals(calwGroup[0]))
      {
        for (int i = 0; i < calwGroup.length; i++ )
        {
          String timeId = StringUtils.getUUID();
          timeTdMap.getColMap().put("ID", timeId);
          timeTdMap.getColMap().put("QI_ID", qcId);
          timeTdMap.getColMap().put("QIT_GROUP", calwGroup[i]);
          Date startTime = DateUtil.parseDate(
            (DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd") + " " + calwStart[i] + ":00"),
            "yyyy-MM-dd HH:mm:ss");
          Date endTime = DateUtil.parseDate(
            (DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd") + " " + calwEnd[i] + ":00"),
            "yyyy-MM-dd HH:mm:ss");
          timeTdMap.getColMap().put("QIT_TIME_INTERVAL", calwTime[i]);
          timeTdMap.getColMap().put("QIT_BEGIN_TIME", startTime);
          timeTdMap.getColMap().put("QIT_END_TIME", endTime);
          try
          {
            modelService.save(timeTdMap);
          }
          catch (Exception e)
          {
            log.error(e);
            throw new BussException(modelAction.getText("保存失败"), e);
          }
        }
      }
    }

    // 保存并关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");

    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), isCloseWin);
  }

  public static Map<String, Object> getParameters(ModelAction modelAction)
  {
    Map<String, Object> proMap = new HashMap<String, Object>();
    String nowDate = DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd HH:mm:ss");
    HttpServletRequest requert = modelAction.getRequest();
    String qiName = requert.getParameter("paraMap1@0#QI_NAME");
    String defFlag = requert.getParameter("QI_DEFAULT_FALG");
    if (defFlag == null)
    {
      defFlag = "N";
    }
    String altFlag = requert.getParameter("QI_ALTERATE_FLAG");
    if (altFlag == null)
    {
      altFlag = "N";
    }
    String qiType = requert.getParameter("paraMap1@0#QI_TYPE");
    String advAlarm = requert.getParameter("paraMap1@0#QI_ADVANCE_ALARM");
    if (advAlarm == null)
    {
      advAlarm = "";
    }
    String qiModel = requert.getParameter("paraMap1@0#QI_MODEL");
    if (qiModel == null || ("").equals(qiModel))
    {
      qiModel = "0";
    }

    String qiInputTime = requert.getParameter("paraMap1@0#QI_INPUT_TIME");
    if (qiInputTime == null)
    {
      qiInputTime = "";
    }
    Date createTime = DateUtil.parseDate(nowDate, "yyyy-MM-dd HH:mm:ss");
    String calwGroup = requert.getParameter("groups");
    String calwTime = requert.getParameter("times");
    String calwStart = requert.getParameter("timeStarts");
    String calwEnd = requert.getParameter("timeEnds");

    proMap.put("QI_NAME", qiName);
    proMap.put("QI_DEFAULT_FALG", defFlag);
    proMap.put("QI_ALTERATE_FLAG", altFlag);
    proMap.put("QI_TYPE", qiType);
    proMap.put("QI_ADVANCE_ALARM", advAlarm);
    proMap.put("QI_MODEL", qiModel);
    proMap.put("QI_INPUT_TIME", qiInputTime);
    proMap.put("CREATE_TIME", createTime);
    proMap.put("CALW_GROUP", calwGroup!=null?calwGroup:"");
    proMap.put("CALW_TIME", calwTime!=null?calwTime:"");
    proMap.put("CALW_START", calwStart!=null?calwStart:"");
    proMap.put("CALW_END", calwEnd!=null?calwEnd:"");

    return proMap;
  }

}
