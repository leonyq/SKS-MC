package com.more.mes.smt.msdmessage;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.Null;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.morelean.mcmes.moOrder.MoService;

/**
 * @Description 時序信息表--新增获取信息
 * @ClassName DelParameter
 * @author WZY
 */
public class GetPreparaInterval implements FuncService
{

  @SuppressWarnings({"unchecked", "unused"})
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String cstModelCode = request.getParameter("CST_MODEL_CODE");// 机种
    String womMoNum = request.getParameter("WOM_MO_NUM");// 计划数量
    String womOutNum = request.getParameter("WOM_OUT_NUM");// 累计备料数
    String stepCode = request.getParameter("stepCode");// 生产阶别
    Map<String, String> map = new HashMap<String, String>();
    String sql = "SELECT VR_VALUE FROM T_SYS_PARAMETER_INI WHERE VR_CLASS=? AND DATA_AUTH=? ";

    List<Map> list = modelService.listDataSql(sql,new Object[]{"WMS0016",dataAuth});

    String sql1 = "SELECT CST_STANDARD_TIME,CST_PROCESS_FACE FROM  T_CO_STANDARD_TIME";

    String sqlWhere1 = " where 1=1 ";
    sqlWhere1 += " and DATA_AUTH=:DATA_AUTH ";
    map.put("DATA_AUTH", dataAuth);   
    if (StringUtils.isNotBlank(cstModelCode))
    {
      sqlWhere1 += " and CST_MODEL_CODE=:cstModelCode";
      map.put("cstModelCode", cstModelCode);
    }
    if (StringUtils.isNotBlank(stepCode))
    {
      sqlWhere1 += " and CST_STEP_CODE=:stepCode";
      map.put("stepCode", stepCode);
    }

    List<Map> mList = modelService.listSql(sql1+sqlWhere1, null, map,null, null);
    Map dataMap = null;
    Map dataMaps = null;
    String sTime = null;// 获取标准工时
    String cstProcessFace = null;
    if (null!=mList && mList.size()>0)
    {
      dataMaps = mList.get(0);// 标准工时
      if (StringUtils.isBlank(dataMaps.get("CST_STANDARD_TIME")) )
      {
        sTime = "0";
      }
      else
      {
        BigDecimal bigDecimalData = (BigDecimal)dataMaps.get("CST_STANDARD_TIME");
        sTime = bigDecimalData.toString();
      }
      if (StringUtils.isBlank(dataMaps.get("CST_PROCESS_FACE")))
      {
        cstProcessFace = "";
      }
      else
      {
        cstProcessFace = dataMaps.get("CST_PROCESS_FACE").toString();
      }

    }
    else
    {
      sTime = "0";
      cstProcessFace = "";
    }
    if (null!=list && list.size() > 0)
    {
      dataMap = list.get(0);// 物料间隔
    }

    String value;// 获取物料间隔

    double cstStandardTime = Double.parseDouble(sTime);// 获取标准工时

    if (StringUtils.isBlank(dataMap.get("VR_VALUE")) )
    {
      value = "0";
    }
    else
    {
      value = dataMap.get("VR_VALUE").toString();
    }

    // BigDecimal bigDecimal = (BigDecimal)dataMap.get("VR_VALUE");

    double vrValue = Double.parseDouble(value);// 获取物料间隔

    // int womNextNum = (int)(cstStandardTime/vrValue);//下次备料数

    double womNextNum = ((vrValue*3600) / cstStandardTime);// 判断当前备料数量和下次数量
    
    
    
    double NextNum =2*womNextNum;
    
    double womMoNums = Double.parseDouble(womMoNum);//计划数量
    //累计备料数    
    double womOutNumS;
    if (StringUtils.isNotBlank(womOutNum))
    {
      womOutNumS = Double.parseDouble(womOutNum);
    }else {
      womOutNumS=0;
    }
   
    long newTime = DateUtil.getCurDate().getTime();// 当前时间
    
    SimpleDateFormat endData = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//时间换算
    
    double CurrentNum = 0;//当前被料量
    String nextTimes = null;//下次备料时间
    String state = null;//状态
    if (womMoNums<NextNum)//如果计划数量小于两倍判断值
    {
      CurrentNum=womMoNums;
      womNextNum=0;
      womOutNumS=womMoNums;
      nextTimes="";
      state="3";
    }
    else if (womMoNums>NextNum) 
    {
      BigDecimal bsS = new BigDecimal(womNextNum);//为取整做准备
      CurrentNum = bsS.setScale(0, BigDecimal.ROUND_HALF_UP).doubleValue();
      womOutNumS = bsS.setScale(0, BigDecimal.ROUND_HALF_UP).doubleValue();
      double minNum = womMoNums-womOutNumS;//计划数量-累计备料数
      
      if(minNum<=NextNum)
      {
          womNextNum = minNum;
      }
      else if (minNum > NextNum) 
      {
        womNextNum = bsS.setScale(0, BigDecimal.ROUND_HALF_UP).doubleValue();
      }
      
      long cstTime = (long)(vrValue * 3600 * 1000); // 标准工时换算成毫秒
      long nextTime = newTime + cstTime;
      nextTimes = endData.format(nextTime);//下次备料时间
      
      state="1";
    }
    
    String operateTime = endData.format(newTime);//当前备料时间
    

    dataMap.put("WOM_STANDARD_HOURS", sTime);// 标准工时
    dataMap.put("WOM_PROCESS_FACE", cstProcessFace);// 面别
    dataMap.put("WOM_OPERATE_TIME", operateTime);// 当前时间
    dataMap.put("WOM_NEXT_TIME", nextTimes);// 下次备料时间
    dataMap.put("WOM_NEXT_NUM", womNextNum);// 下次备料数
    dataMap.put("WOM_CURRENT_NUM", CurrentNum);// 当前备料数
    dataMap.put("WOM_STATUS", state);// 状态
    dataMap.put("WOM_OUT_NUM", womOutNumS);// 累积备料数
    
    CommMethod.mapToEscapeJs(dataMap);
    modelAction.setAjaxMap(dataMap);

    return BaseActionSupport.AJAX;
  }

}
