package com.morelean.mcmes.moOrder;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 制令单-快速转产-加载
 * @Description 当前制令单在线信息与转产制令单信息对比
 * @ClassName QuicklySwitch
 * @author Administrator
 * @version 1.0 developer 2017-8-2 created
 * @see QuicklySwitch
 * @since 2017-8-2
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class QuicklySwitch implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest req = modelAction.getRequest();
    String pdoDeviceSn = req.getParameter("pdoDeviceSn");
    String pdoNumber = req.getParameter("pdoNumber");
    String pdoProcessFace = req.getParameter("pdoProcessFace");
    String pdoModelCode = req.getParameter("pdoModelCode");
    String pdoAreaSn = req.getParameter("pdoAreaSn");
    String pdoNumber_s = req.getParameter("pdoNumber_s");
    String pdoModelCode_s = req.getParameter("pdoModelCode_s");
    String pdoProcessFace_s = req.getParameter("pdoProcessFace_s");
    String flags = req.getParameter("flag");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));

    if (pdoNumber.equals(pdoNumber_s))
    {
      modelAction.setAjaxString(modelAction.getText("转产制令单不能是当前制令单"));
      return BaseActionSupport.AJAX;
    }

    List ajaxList = new ArrayList();
    MoService moService = new MoService(modelService, modelAction);

    // 获取当前制令单在线信息
    /*
     * Map thisMap = new HashMap<String, Object>(); thisMap.put("CMO_MO_NUMBER", pdoNumber);
     * thisMap.put("CMO_MODEL_CODE", pdoModelCode); thisMap.put("CMO_PROCESS_FACE",
     * pdoProcessFace); thisMap.put("CMO_AREA_SN", pdoAreaSn); thisMap.put("CMO_DEVICE_SEQ",
     * pdoDeviceSn); List thisList = moService.thisMoInfoMap(thisMap);
     */

    Object[] obj = {pdoDeviceSn, pdoNumber, pdoModelCode, pdoProcessFace, pdoAreaSn,dataAuth};
    List thisList = moService.thisMoInfoObj(obj);
    if (thisList == null || thisList.isEmpty())
    {
      modelAction.setAjaxString(modelAction.getText("未查询到当前制令单相关信息"));
      return BaseActionSupport.AJAX;
    }

    if (flags.equals("1"))
    {
     
      modelAction.setAjaxPage(modelAction.getPage());
      modelAction.getPage().setDataList(thisList);
      return BaseActionSupport.AJAX;
    }

    // 获取对比制令单在线信息
    /*
     * Map inMap = new HashMap<String, Object>(); inMap.put("CMO_MODEL_CODE", pdoModelCode);
     * inMap.put("CMO_PROCESS_FACE", pdoProcessFace); inMap.put("CMO_AREA_SN", pdoAreaSn);
     * inMap.put("CMO_DEVICE_SEQ", pdoDeviceSn); List inList = moService.inMoInfoMap(inMap);
     */

    Object[] objIn = {pdoModelCode_s, pdoAreaSn, pdoDeviceSn, pdoProcessFace_s,dataAuth};
    List inList = moService.inMoInfoObj(objIn);
    if (inList == null || inList.isEmpty())
    {
      modelAction.setAjaxString(modelAction.getText("未查询到转产制令单相关信息"));
      return BaseActionSupport.AJAX;
    }

    Map mapThis = null;
    Map<String, Object> mapIn = null;
    Map<String, Object> replaceMap = null;
    int thisLen = thisList.size();
    int inLen = inList.size();
    int yesCount = 0;
    int flag = 0;
    int replaceListLen = 0;
    List replaceList = null;
    boolean replaceFlag = false;
    for (int i = 0; i < thisLen; i++ )
    {
      mapThis = (Map)thisList.get(i);
      for (int j = 0; j < inLen; j++ )
      {
        mapIn = (Map<String, Object>)inList.get(j);
        if (mapThis.get("CMO_DEVICE_SEQ").equals(mapIn.get("CMD_DEVICE_SEQ"))
            && mapThis.get("CMO_TABLE_NO").equals(mapIn.get("CMD_TABLE_NO"))
            && mapThis.get("CMO_LOADPOINT").equals(mapIn.get("CMD_LOADPOINT"))
            && mapThis.get("CMO_CHANEL_SN").equals(mapIn.get("CMD_CHANEL_SN"))
            && mapThis.get("CMO_SHKIP_FLAG").equals(mapIn.get("CMD_SHKIP_FLAG")))
        {
          if (mapThis.get("CMO_ITEM_CODE").equals(mapIn.get("CMD_ITEM_CODE")))
          {
            mapThis.put("RESULT", 0);
            yesCount++ ;
          }
          else
          {
            Object[] replaceObj = {mapIn.get("CMD_ITEM_CODE"),dataAuth};
            replaceList = moService.replace(replaceObj);
            replaceListLen = replaceList.size();
            for (int j2 = 0; j2 < replaceListLen; j2++ )
            {
              replaceMap = (Map)replaceList.get(j2);
              if (mapThis.get("CMO_ITEM_CODE").equals(replaceMap.get("CR_ITEM_REPLACE")))
              {
                mapThis.put("RESULT", 0);
                yesCount++ ;
                replaceFlag = true;
              }
            }
            if (!replaceFlag)
            {
              flag++ ;
              replaceFlag = false;
            }
          }

        }
        else
        {
          flag++ ;
        }
      }
      if (flag == inLen)
      {
        mapThis.put("RESULT", 1);
      }
      flag = 0;
    }

    ajaxList.add(0, yesCount);
    ajaxList.add(1, thisLen - yesCount);
    modelAction.setAjaxList(ajaxList);

    modelAction.setAjaxPage(modelAction.getPage());
    modelAction.getPage().setDataList(thisList);

    return BaseActionSupport.AJAX;

  }

}
