package com.morelean.mcmes.materialtable;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.insu.elec.smt.smtpp.feedTables.fuji.FujiSeries;
import com.more.fw.insu.elec.smt.smtpp.feedTables.juki.Jm20;
import com.more.fw.insu.elec.smt.smtpp.feedTables.models.FeedTable;
import com.more.fw.insu.elec.smt.smtpp.feedTables.models.Feeder;
import com.more.fw.insu.elec.smt.smtpp.feedTables.models.ResultInfo;
import com.more.fw.insu.elec.smt.smtpp.feedTables.panasonic.CMSeries;
import com.more.fw.insu.elec.smt.smtpp.feedTables.panasonic.NPMSeries;
import com.more.fw.insu.elec.smt.smtpp.feedTables.philips.Ax201Series;
import com.more.fw.insu.elec.smt.smtpp.feedTables.sanyo.TCMSeries;
import com.more.fw.insu.elec.smt.smtpp.feedTables.yamaha.YVYGSeries;

/**
 * @Title
 * @description 程式文件导入保存
 * @ClassName MaterialPImport
 * @author msad013
 * @version 1.0 developer 2017-6-28 created
 * @see MaterialPImport
 * @since 2017-6-28
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class MaterialPImport implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    List<Map<String, Object>> resData = new ArrayList<Map<String, Object>>();
    try
    {
         String modelCode = request.getParameter("modelCode");
      String device = request.getParameter("deviceArr");
      if (StringUtils.isBlank(device))
      {
        return modelAction.alertParentInfo((modelAction.getText("请绑定设备")));
      }
      JSONArray deviceArr = JSONArray.fromObject(device);

      File file = modelAction.getUpFile();
      String deviceType = request.getParameter("paraMap1@0#CMD_DEVICE_TYPE");// 贴片机型

      ResultInfo info = feedTablesReader(deviceType, file);

      if (info == null)
      {
        return modelAction.alertParentInfo((modelAction.getText("不支持该贴片机型")));
      }
      String res = info.getRes();
      if (res.startsWith("NG"))
      {
        return modelAction.alertParentInfo(res.substring(3));
      }
      String sql = "select vr_value from t_sys_parameter_ini s where s.vr_class=? and  vr_value=? ";
      List<Map> sList = modelService.listDataSql(sql, new Object[]{"SMT0001","1"});
      boolean bomFlag = false;
      if (sList != null && !sList.isEmpty())
      {
        bomFlag = true;
      }

      FeedTable feedTable = info.getFeedTables().get(0);
      for (Feeder feeder : feedTable.getFeeders())
      {
        Map<String, Object> map = new HashMap<String, Object>();
        String machine = feeder.getMachine();// 机器,设备代码
        String deviceSeq = checkDevice(deviceArr, machine);
        if (StringUtils.isEmpty(deviceSeq)) continue;
        map.put("CMD_DEVICE_SEQ", deviceSeq);
        map.put("CMD_TABLE_NO", feeder.getTable());
        map.put("CMD_LOADPOINT", feeder.getSlot());
        map.put("CMD_CHANEL_SN", feeder.getSubSlot());
        map.put("CMD_ITEM_CODE", feeder.getPartCode());

        String locations = "";
        for (String Chips : feeder.getChips())
        {
          if ("".equals(locations))
          {
            locations = Chips;
          }
          else
          {
            locations += "," + Chips;
          }
        }
        map.put("CMD_POINT_LOCATION", locations);
        if (StringUtils.isBlank(locations)){
            map.put("CMD_POINT_NUM", 0);
        }
        else{
            map.put("CMD_POINT_NUM", locations.split(",").length);
        }

        // if(i==10) break;
        // Object CMD_FEEDER_SPEC = map.get("CMD_FEEDER_SPEC");// feeder规格
        /*
         * Object CMD_TRY_FLAG = map.get("CMD_TRY_FLAG");// TRY盘物料 if
         * (StringUtils.isBlank(CMD_TRY_FLAG)) { return
         * modelAction.alertParentInfo((modelAction.getText("TRY盘物料不能为空"))); } if
         * (CMD_TRY_FLAG.toString().trim().equals("是")) { CMD_TRY_FLAG = "Y"; } if
         * (CMD_TRY_FLAG.toString().trim().equals("否")) { CMD_TRY_FLAG = "N"; }
         * map.put("CMD_TRY_FLAG", CMD_TRY_FLAG);
         */
        if (bomFlag)
        {
         
          sql = "select * from T_CO_BOM_DETAIL t "+
            " left join T_CO_BOM t1 on t.CB_BOMID=t1.ID "+
            " where t1.CB_ITEM_CODE=? and t.CBD_ITEM_CODE=? and t1.CB_DEFAULT=?";
          sList = modelService.listDataSql(sql, new Object[] {modelCode,feeder.getPartCode(),"Y"});
         
          if (sList != null && !sList.isEmpty())
          {
            map.put("CMD_BOM_FLAG", "Y");
          }
          else
          {
            map.put("CMD_BOM_FLAG", "N");
          }
        }
        // Object CMD_MEMO = map.get("CMD_MEMO");//备注
        resData.add(map);
      }
      if (resData == null || resData.isEmpty())
      {
        return modelAction.alertParentInfo((modelAction.getText("未找到对应设备的有效数据")));

      }
    }
    catch (Exception e)
    {
      return modelAction.alertParentInfo((modelAction.getText("文件格式不正确")));
    }
    return addParentData(modelAction, CommMethod.bean2Json(resData));

  }

  private String addParentData(ModelAction modelAction, String jsonData)
  {
    StringBuffer content = new StringBuffer();
    jsonData = string2Json(jsonData);
    content.append("<script>");
    content.append("try{");
    content.append("window.parent.addParentData('");
    content.append(jsonData);
    content.append("');");
    content.append("}catch(e){alert(\"");
      content.append("\");}");
    content.append("</script>");
    modelAction.outHtml(content.toString(), Constants.CHARACTER_ENCODING_UTF_8);
    return null;
  }

  private String string2Json(String jsonData)
  {
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < jsonData.length(); i++ )
    {

      char c = jsonData.charAt(i);
      switch (c)
      {
        case '\"':
          sb.append("\\\"");
          break;
        case '\\':
          sb.append("\\\\");
          break;
        case '/':
          sb.append("\\/");
          break;
        case '\b':
          sb.append("\\b");
          break;
        case '\f':
          sb.append("\\f");
          break;
        case '\n':
          sb.append("\\n");
          break;
        case '\r':
          sb.append("\\r");
          break;
        case '\t':
          sb.append("\\t");
          break;
        default:
          sb.append(c);
      }
    }
    return sb.toString();
  }

  private ResultInfo feedTablesReader(String deviceType, File file)
  {
    ResultInfo info = null;
    if ("CM602".equalsIgnoreCase(deviceType))
    {
      info = CMSeries.anylizeResult(file);
    }
    else if (deviceType.startsWith("NPM"))
    {
      info = NPMSeries.anylizeResult(file);
    }
    else if (deviceType.equalsIgnoreCase("AX201"))
    {
      info = Ax201Series.anylizeResult(file);
    }
    else if (deviceType.equalsIgnoreCase("JM20") || deviceType.equalsIgnoreCase("FX3"))
    {
      info = Jm20.anylizeResult(file);
    }
    else if (deviceType.equalsIgnoreCase("TCM3500"))
    {
      info = TCMSeries.anylizeResult(file);
    }
    else if (deviceType.equalsIgnoreCase("YG100") || deviceType.equalsIgnoreCase("YV100"))
    {
      info = YVYGSeries.anylizeResult(file);
    }
    else if (deviceType.equalsIgnoreCase("NXT3") || deviceType.equalsIgnoreCase("XPF3"))
    {
      info = FujiSeries.anylizeResult(file);
    }
    return info;
  }

  private String checkDevice(JSONArray deviceArr, String machine)
  {
    Map<String, Object> dmap = new HashMap<String, Object>();
    for (int i = 0; i < deviceArr.size(); i++ )
    {
      dmap = (Map<String, Object>)deviceArr.get(i);
      if (StringUtils.isNotBlank(machine))
      {
        if (machine.equals(dmap.get("CD_DEVICE_SN")))
          return StringUtils.toString(dmap.get("CAD_DEVICE_SEQUENCE"));
      }
    }
    return "";

  }
}