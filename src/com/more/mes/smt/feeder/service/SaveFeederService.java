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
 * @Description 新增FEEDER信息
 * @ClassName SaveFeederService
 * @author csj
 * @Company: morelean
 */
public class SaveFeederService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    Map<String, Object> feederMap = SaveFeederService.getParameters(modelAction);
    String addType = StringUtils.toString(feederMap.get("ADD_TYPE"));
    String isSuc = "false";

    // 保存并关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");

    if (("1").equals(addType))
    {
      isSuc = insertUtil(feederMap, modelService, modelAction);
      if (("true").equals(isSuc))
      {
        return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
      }
      else if (("false").equals(isSuc))
      {
        return modelAction.alertParentInfo("FEEDERSN重复，请更换");
      }
    }
    else if (("2").equals(addType))
    {
      insertBatch(feederMap, modelService, modelAction);

    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);

  }

  // 个体增加feeder
  @SuppressWarnings("unchecked")
  public String insertUtil(Map<String, Object> feederMap, ModelService modelService,
                           ModelAction modelAction)
  {
    HttpServletRequest request = modelAction.getRequest();
    String isSuc = "false";
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    TableDataMapExt tdMap = new TableDataMapExt();
    CommMethod.addSysDefCol(tdMap.getColMap(), modelAction.getUser());
    tdMap.setTableName("T_CO_FEEDER_INFOR");
    String feederSn = StringUtils.toString(feederMap.get("TCF_FEEDER_SN"));
    // feeder_sn唯一性验证 insert封装
    String sqlId = "select id from T_CO_FEEDER_INFOR t where t.TCF_FEEDER_SN=? and t.data_auth=? ";
    List<String> result = modelService.listDataSql(sqlId, new Object[] {feederSn,dataAuth});
    if (result != null && result.isEmpty())
    {
      // 插入数据
      Map<String, Object> map = tdMap.getColMap();
      map.put("TCF_FEEDER_SN", feederMap.get("TCF_FEEDER_SN"));
      map.put("TCS_SPEC", feederMap.get("TCS_SPEC"));
      map.put("TCF_STATUS", feederMap.get("TCF_STATUS"));
      map.put("TCT_TYPE", feederMap.get("TCT_TYPE"));
      if (StringUtils.isNotBlank(feederMap.get("TCT_MAX_COUNT")))
      {
        tdMap.getColMap().put("TCT_MAX_COUNT",Integer.parseInt(feederMap.get("TCT_MAX_COUNT").toString()));
      }
      //map.put("TCT_MAX_COUNT", feederMap.get("TCT_MAX_COUNT"));
      map.put("TCF_LEFT_CHANNEL_SN", feederMap.get("TCF_LEFT_CHANNEL_SN"));
      map.put("TCF_RIGHT_CHANNEL_SN", feederMap.get("TCF_RIGHT_CHANNEL_SN"));
      map.put("TCF_MIDDLE_CHANNEL_SN", feederMap.get("TCF_MIDDLE_CHANNEL_SN"));
      map.put("TCF_MT_TYPE", feederMap.get("TCF_MT_TYPE"));
      if (StringUtils.isNotBlank(feederMap.get("TCF_MT_VALUE")))
      {
        tdMap.getColMap().put("TCF_MT_VALUE",Integer.parseInt(feederMap.get("TCF_MT_VALUE").toString()));
      }
     // map.put("TCF_MT_VALUE", feederMap.get("TCF_MT_VALUE"));
      if (StringUtils.isNotBlank(feederMap.get("TCF_MT_NOTNUM")))
      {
        tdMap.getColMap().put("TCF_MT_NOTNUM",Integer.parseInt(feederMap.get("TCF_MT_NOTNUM").toString()));
      }
      //map.put("TCF_MT_NOTNUM", feederMap.get("TCF_MT_NOTNUM"));
      // map.put("CREATE_USER", feederMap.get("CREATE_USER"));
      if (StringUtils.isNotBlank(feederMap.get("TCS_USE_TIME")))
      {
        tdMap.getColMap().put("TCS_USE_TIME",Integer.parseInt(feederMap.get("TCS_USE_TIME").toString()));
      }
      //map.put("TCS_USE_TIME", feederMap.get("TCS_USE_TIME"));
      if (StringUtils.isNotBlank(feederMap.get("TCS_REMIND_NUM")))
      {
        tdMap.getColMap().put("TCS_REMIND_NUM",Integer.parseInt(feederMap.get("TCS_REMIND_NUM").toString()));
      }
     // map.put("TCS_REMIND_NUM", feederMap.get("TCS_REMIND_NUM"));
      if (StringUtils.isNotBlank(feederMap.get("TCS_MT_CYCLE")))
      {
        tdMap.getColMap().put("TCS_MAX_CYCLE",Integer.parseInt(feederMap.get("TCS_MAX_CYCLE").toString()));
      }
      //map.put("TCS_MAX_CYCLE", feederMap.get("TCS_MAX_CYCLE"));
      if (StringUtils.isNotBlank(feederMap.get("TCS_MT_CYCLE")))
      {
        tdMap.getColMap().put("TCS_MT_CYCLE",Integer.parseInt(feederMap.get("TCS_MT_CYCLE").toString()));
      }
     // map.put("TCS_MT_CYCLE", feederMap.get("TCS_MT_CYCLE"));
      if (StringUtils.isNotBlank(feederMap.get("TCS_REMIND_DAY")))
      {
        tdMap.getColMap().put("TCS_REMIND_DAY",Integer.parseInt(feederMap.get("TCS_REMIND_DAY").toString()));
      }
      //map.put("TCS_REMIND_DAY", feederMap.get("TCS_REMIND_DAY"));
      map.put("TCF_FEEDER_ID", feederMap.get("TCF_FEEDER_ID"));
      
      map.put("FEEDER_TYPE", "0");
      request.setAttribute("isDataAuth", modelAction.getIsDataAuth());
      try
      {
        modelService.save(tdMap);
      }
      catch (Exception e)
      {
        log.error(e);
        throw new BussException(modelAction.getText("增加失败"), e);
      }
      isSuc = "true";
    }
    /*
     * else { // feeder_sn 重复 isSuc = false; }
     */
    return isSuc;
  }

  // 批量增加feeder
  @SuppressWarnings("unchecked")
  public void insertBatch(Map<String, Object> feederMap, ModelService modelService,
                          ModelAction modelAction)
  {
    // 插入设备基本信息
    HttpServletRequest request = modelAction.getRequest();

    int maxSerialNum = getLastTimeMaxSerialNum(modelAction, modelService);
    int insertRows = Integer.parseInt(StringUtils.toString(feederMap.get("BATCH_NUMBER")));
    String tempSN = "";
    for (int i = 0; i < insertRows; i++ )
    {
        TableDataMapExt tdMap = new TableDataMapExt();
        CommMethod.addSysDefCol(tdMap.getColMap(), modelAction.getUser());
        tdMap.setTableName("T_CO_FEEDER_INFOR");    
        Map<String, Object> map = tdMap.getColMap();
      // 获得feeder_sn
      String feeder_sn = "F" + feederMap.get("TCS_SPEC") + getSerialNum(maxSerialNum, i);
      tempSN = feeder_sn;
      map.put("TCF_FEEDER_SN", feeder_sn); // F+规格+流水号
      map.put("TCS_SPEC", feederMap.get("TCS_SPEC"));
      map.put("TCF_STATUS", feederMap.get("TCF_STATUS"));
      map.put("TCT_TYPE", feederMap.get("TCT_TYPE"));
      String tct_type = StringUtils.toString(feederMap.get("TCT_TYPE"));
      if (("1").equals(tct_type))
      {
        // 单通道
        map.put("TCF_LEFT_CHANNEL_SN", feeder_sn + "A");
      }
      else if (("2").equals(tct_type))
      {
        // 左右通道
        map.put("TCF_LEFT_CHANNEL_SN", feeder_sn + "L");
        map.put("TCF_RIGHT_CHANNEL_SN", feeder_sn + "R");
      }
      else if (("3").equals(tct_type))
      {
        // 中间通道
        map.put("TCF_LEFT_CHANNEL_SN", feeder_sn + "L");
        map.put("TCF_RIGHT_CHANNEL_SN", feeder_sn + "R");
        map.put("TCF_MIDDLE_CHANNEL_SN", feeder_sn + "M");
      }
      if (StringUtils.isNotBlank(feederMap.get("TCT_MAX_COUNT")))
      {
        tdMap.getColMap().put("TCT_MAX_COUNT",Integer.parseInt(feederMap.get("TCT_MAX_COUNT").toString()));
      }
      //map.put("TCT_MAX_COUNT", feederMap.get("TCT_MAX_COUNT"));
      map.put("TCF_MT_TYPE", feederMap.get("TCF_MT_TYPE"));
      if (StringUtils.isNotBlank(feederMap.get("TCF_MT_VALUE")))
      {
        tdMap.getColMap().put("TCF_MT_VALUE",Integer.parseInt(feederMap.get("TCF_MT_VALUE").toString()));
      }
      //map.put("TCF_MT_VALUE", feederMap.get("TCF_MT_VALUE"));
      if (StringUtils.isNotBlank(feederMap.get("TCF_MT_NOTNUM")))
      {
        tdMap.getColMap().put("TCF_MT_NOTNUM",Integer.parseInt(feederMap.get("TCF_MT_NOTNUM").toString()));
      }
      //map.put("TCF_MT_NOTNUM", feederMap.get("TCF_MT_NOTNUM"));
      //map.put("CREATE_USER", feederMap.get("CREATE_USER"));
      if (StringUtils.isNotBlank(feederMap.get("TCS_USE_TIME")))
      {
        tdMap.getColMap().put("TCS_USE_TIME",Integer.parseInt(feederMap.get("TCS_USE_TIME").toString()));
      }
      //map.put("TCS_USE_TIME", feederMap.get("TCS_USE_TIME"));
      if (StringUtils.isNotBlank(feederMap.get("TCS_REMIND_NUM")))
      {
        tdMap.getColMap().put("TCS_REMIND_NUM",Integer.parseInt(feederMap.get("TCS_REMIND_NUM").toString()));
      }
      //map.put("TCS_REMIND_NUM", feederMap.get("TCS_REMIND_NUM"));
      if (StringUtils.isNotBlank(feederMap.get("TCS_MT_CYCLE")))
      {
        tdMap.getColMap().put("TCS_MAX_CYCLE",Integer.parseInt(feederMap.get("TCS_MAX_CYCLE").toString()));
      }
      //map.put("TCS_MAX_CYCLE", feederMap.get("TCS_MAX_CYCLE"));
      if (StringUtils.isNotBlank(feederMap.get("TCS_MT_CYCLE")))
      {
        tdMap.getColMap().put("TCS_MT_CYCLE",Integer.parseInt(feederMap.get("TCS_MT_CYCLE").toString()));
      }
     // map.put("TCS_MT_CYCLE", feederMap.get("TCS_MT_CYCLE"));
      if (StringUtils.isNotBlank(feederMap.get("TCS_REMIND_DAY")))
      {
        tdMap.getColMap().put("TCS_REMIND_DAY",Integer.parseInt(feederMap.get("TCS_REMIND_DAY").toString()));
      }
      //map.put("TCS_REMIND_DAY", feederMap.get("TCS_REMIND_DAY"));
      map.put("TCF_FEEDER_ID", feederMap.get("TCF_FEEDER_ID"));
      map.put("FEEDER_TYPE", "1");

      try
      {
        modelService.save(tdMap);
      }
      catch (Exception e)
      {
        log.error(e);
        throw new BussException(modelAction.getText("FEEDERSN重复:" + tempSN + ",请更换"), e);
      }
    }
  }

  // 获得流水号
  public String getSerialNum(int maxSerialNum, int index)
  {
    int serialNum = maxSerialNum + index + 1;
    String serialNumStr = String.valueOf(serialNum);
    if (serialNumStr.length() == 1)
    {
      serialNumStr = "000" + serialNumStr;
    }
    else if (serialNumStr.length() == 2)
    {
      serialNumStr = "00" + serialNumStr;
    }
    else if (serialNumStr.length() == 3)
    {
      serialNumStr = "0" + serialNumStr;
    }

    return serialNumStr;
  }

  // 获得上一次流水号的最大值
  @SuppressWarnings("unchecked")
  public int getLastTimeMaxSerialNum(ModelAction modelAction, ModelService modelService)
  {
	String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String sql = "select TCF_FEEDER_SN from T_CO_FEEDER_INFOR where FEEDER_TYPE = '1' and data_auth = ? ";
    // 所有的sn号
    List<Map<String, String>> resultList = modelService.listDataSql(sql,new Object[] {dataAuth});
    List<Integer> snList = new ArrayList<Integer>();
    if (resultList != null && !resultList.isEmpty())
    {
      int resultListSize = resultList.size();
      for (int i = 0; i < resultListSize; i++ )
      {
        String feederSn = resultList.get(i).get("TCF_FEEDER_SN");
        int index = feederSn.length();
        String snNum = feederSn.substring(index - 4, index);
        snList.add(Integer.parseInt(snNum));
      }
    }
    int maxNum = 0;
    int snListSize = snList.size();
    if (snListSize > 0)
    {
      // 比较获得最大的流水号
      maxNum = snList.get(0);
      for (int i = 1; i < snListSize; i++ )
      {
        if (maxNum < snList.get(i))
        {
          maxNum = snList.get(i);
        }
      }
    }
    return maxNum;
  }

  // 获取参数值
  public static Map<String, Object> getParameters(ModelAction modelAction)
  {
    Map<String, Object> feederMap = new HashMap<String, Object>();
    HttpServletRequest requert = modelAction.getRequest();
    String addType = requert.getParameter("paraMap2@0#ADD_TYPE");
    String batchNum = requert.getParameter("paraMap1@0#BATCH_NUMBER");
    String feederSN = requert.getParameter("paraMap1@0#TCF_FEEDER_SN");
    String feederSpec = requert.getParameter("paraMap1@0#TCS_SPEC");
    String feederType = requert.getParameter("paraMap1@0#TCT_TYPE");
    String maxCount = requert.getParameter("paraMap1@0#TCT_MAX_COUNT");
    String leftChannelSN = requert.getParameter("paraMap1@0#TCF_LEFT_CHANNEL_SN");
    String rightChannelSN = requert.getParameter("paraMap1@0#TCF_RIGHT_CHANNEL_SN");
    String middleChannelSN = requert.getParameter("paraMap1@0#TCF_MIDDLE_CHANNEL_SN");
    String mtType = requert.getParameter("paraMap1@0#TCF_MT_TYPE");
    String mtValue = requert.getParameter("paraMap1@0#TCF_MT_VALUE");
    String mtNotnum = requert.getParameter("paraMap1@0#TCF_MT_NOTNUM");
    String createUser = requert.getParameter("paraMap1@0#CREATE_USER");
    String tcsUseTime = requert.getParameter("paraMap1@0#TCS_USE_TIME");//保养点数
    String tcsRemindNum = requert.getParameter("paraMap1@0#TCS_REMIND_NUM");//提醒点数
    String tcsMaxCycle = requert.getParameter("paraMap1@0#TCS_MAX_CYCLE");//使用周期上限
    String tcsMtCycle = requert.getParameter("paraMap1@0#TCS_MT_CYCLE");//保养周期
    String tcsRemindDay = requert.getParameter("paraMap1@0#TCS_REMIND_DAY");//提醒天数
    String tcfFeederId = requert.getParameter("paraMap1@0#TCF_FEEDER_ID");

    feederMap.put("ADD_TYPE", addType);
    feederMap.put("BATCH_NUMBER", batchNum);
    feederMap.put("TCF_FEEDER_SN", feederSN);
    feederMap.put("TCS_SPEC", feederSpec);
    feederMap.put("TCT_TYPE", feederType);
    feederMap.put("TCF_STATUS", "1");
    feederMap.put("TCT_MAX_COUNT", maxCount);
    feederMap.put("TCF_LEFT_CHANNEL_SN", leftChannelSN);
    feederMap.put("TCF_RIGHT_CHANNEL_SN", rightChannelSN);
    feederMap.put("TCF_MIDDLE_CHANNEL_SN", middleChannelSN);
    feederMap.put("TCF_MT_TYPE", mtType);
    feederMap.put("TCF_MT_VALUE", mtValue);
    feederMap.put("TCF_MT_NOTNUM", mtNotnum);
    //feederMap.put("CREATE_USER", createUser);
    feederMap.put("TCS_USE_TIME", tcsUseTime);
    feederMap.put("TCF_FEEDER_ID", tcfFeederId);
    feederMap.put("TCS_REMIND_NUM", tcsRemindNum);
    feederMap.put("TCS_MAX_CYCLE", tcsMaxCycle);
    feederMap.put("TCS_MT_CYCLE", tcsMtCycle);
    feederMap.put("TCS_REMIND_DAY", tcsRemindDay);
    
    
    

    return feederMap;
  }
}
