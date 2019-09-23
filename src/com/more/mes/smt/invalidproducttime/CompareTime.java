package com.more.mes.smt.invalidproducttime;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 
 * 比较时间
 *
 */
public class CompareTime implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
     HttpServletRequest request = modelAction.getRequest();
    String nowTime = request.getParameter("nowTime");// 结束开始时间
    String endTime = request.getParameter("endTime");// 结束暂停时间
    String areaSns = request.getParameter("areaSns");// 线别
    String auth = String.valueOf(request.getSession().getAttribute("mcDataAuth"));
   // String auth = request.getSession().getAttribute("mcDataAuth").toString();// 组织机构
    // 工厂时间
    String sql1 = "select  max(t.calw_end) MAX_TIME,MIN(t.calw_start) MIN_TIME"
                  + " from T_CO_CALENDAR_LINE C" + " LEFT JOIN T_CO_CALENDAR_WORKTIME t"
                  + " ON C.CAL_ID = t.CAL_ID and t.DATA_AUTH=C.DATA_AUTH "
                  + " where C.AREA_ID = ? and C.DATA_AUTH=? ";
    List<Map> list = modelService.listDataSql(sql1, new Object[] {areaSns,auth});
    //周末是否上班
    String sql2="select A.CAL_SAT_FLAG,A.CAL_SUN_FLAG"
                  +" from T_CO_CALENDAR A"+" LEFT JOIN T_CO_CALENDAR_LINE C"
                  + " ON C.CAL_ID = A.ID and  a.DATA_AUTH= c.DATA_AUTH "
                   + " WHERE C.AREA_ID = ? and  a.DATA_AUTH=?";
    
    List<Map> sumList = modelService.listDataSql(sql2, new Object[] {areaSns,auth});
    
    // 状态，开始时间，暂停时间
    String sql = "SELECT B.CSI_STATUS, B.CSI_BEGIN_TIME  BEGIN_TIME," + "B.CSI_END_TIME END_TIMES"
                 + " FROM T_CO_STOPLINE_INFO B " + "  where B.CSI_AREA_SN=? " +
                 		" and b.DATA_AUTH=? ";
    List<Map> arrList = modelService.listDataSql(sql, new Object[] {areaSns,auth});

    DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    DateFormat df1 = new SimpleDateFormat("HH:mm:ss");
    long maxWorkDate = 0;
    long minWorkDate = 0;
    long nowTimes = 0;
    long endTimes = 0;

    Date date;

    Map<String, String> map = new HashMap<String, String>();
    String Compare = "3";// 返回值
    try
    {
      // 暂停时间不能小于等于开始时间
      if (StringUtils.isNotBlank(endTime) && StringUtils.isNotBlank(nowTime))
      {
        nowTimes = df.parse(nowTime).getTime();
        endTimes = df.parse(endTime).getTime();
        if (nowTimes >= endTimes)
        {
          Compare = "0";
          map.put("Compare", Compare);
          modelAction.setAjaxMap(map);
          return BaseActionSupport.AJAX;
        }
      }
      // 开始时间比较
      if (StringUtils.isNotBlank(nowTime))
      {
        date = df.parse(nowTime);
        nowTimes = df1.parse(df1.format(date)).getTime();
        if (null != list && list.size() > 0)
        {
          // 工厂没有该线别
          if (StringUtils.isBlank(list.get(0).get("MAX_TIME")))
          {
            Compare = "4";
            map.put("Compare", Compare);
            modelAction.setAjaxMap(map);
            return BaseActionSupport.AJAX;
          }
          if (StringUtils.isBlank(list.get(0).get("MIN_TIME")))
          {
            Compare = "4";
            map.put("Compare", Compare);
            modelAction.setAjaxMap(map);
            return BaseActionSupport.AJAX;
          }

          date = df.parse(list.get(0).get("MAX_TIME").toString());
          maxWorkDate = df1.parse(df1.format(date)).getTime();
          date = df.parse(list.get(0).get("MIN_TIME").toString());
          minWorkDate = df1.parse(df1.format(date)).getTime();
          
          Calendar cal = Calendar.getInstance();
          cal.setTime(df.parse(nowTime));
          if (cal.get(Calendar.DAY_OF_WEEK)==Calendar.SATURDAY)
          {
            if(sumList.get(0).get("CAL_SAT_FLAG").equals("N")){
              Compare = "5";
              map.put("Compare", Compare);
              modelAction.setAjaxMap(map);
              return BaseActionSupport.AJAX;
              
            }
          }
          if (cal.get(Calendar.DAY_OF_WEEK)==Calendar.SUNDAY)
          {
            if(sumList.get(0).get("CAL_SUN_FLAG").equals("N")){
              Compare = "6";
              map.put("Compare", Compare);
              modelAction.setAjaxMap(map);
              return BaseActionSupport.AJAX;
              
            }
          }
          
          
          // 不能超过工作时间范围
          if (nowTimes > maxWorkDate || nowTimes < minWorkDate)
          {
            Compare = "1";
            map.put("Compare", Compare);
            modelAction.setAjaxMap(map);
            return BaseActionSupport.AJAX;
          }

        }
        // 时间不能交叉
        if (null != arrList && arrList.size() > 0)
        {
          nowTimes = df.parse(nowTime).getTime();
          for (int i = 0; i < arrList.size(); i++ )
          {

            if (StringUtils.isNotBlank(arrList.get(i).get("BEGIN_TIME")))
            {
              minWorkDate = df.parse(arrList.get(i).get("BEGIN_TIME").toString()).getTime();
              if (nowTimes > minWorkDate)
              {
                if (StringUtils.isNotBlank(arrList.get(i).get("END_TIMES")))
                {
                  maxWorkDate = df.parse(arrList.get(i).get("END_TIMES").toString()).getTime();
                  if (nowTimes < maxWorkDate)
                  {
                    map.put("Compare", "2");
                    modelAction.setAjaxMap(map);
                    return BaseActionSupport.AJAX;
                  }

                }
              }

            }
            if (StringUtils.isNotBlank(arrList.get(i).get("END_TIMES")))
            {
              if (StringUtils.isNotBlank(endTime) && StringUtils.isNotBlank(nowTime))
              {
                maxWorkDate = df.parse(arrList.get(i).get("END_TIMES").toString()).getTime();
                endTimes = df.parse(endTime).getTime();
                if (nowTimes < minWorkDate && endTimes > maxWorkDate)
                {
                  map.put("Compare", "2");
                  modelAction.setAjaxMap(map);
                  return BaseActionSupport.AJAX;
                }
                if (nowTimes < minWorkDate && minWorkDate < endTimes)
                {
                  map.put("Compare", "2");
                  modelAction.setAjaxMap(map);
                  return BaseActionSupport.AJAX;
                }
                if (nowTimes < maxWorkDate && maxWorkDate < endTimes)
                {
                  map.put("Compare", "2");
                  modelAction.setAjaxMap(map);
                  return BaseActionSupport.AJAX;
                }
              }
            }
          }
        }
      }

      if (StringUtils.isNotBlank(endTime))
      {
        date = df.parse(endTime);
        nowTimes = df1.parse(df1.format(date)).getTime();
        if (null != list && list.size() > 0)
        {
          // 工厂没有该线别
          if (StringUtils.isBlank(list.get(0).get("MAX_TIME")))
          {
            Compare = "4";
            map.put("Compare", Compare);
            modelAction.setAjaxMap(map);
            return BaseActionSupport.AJAX;
          }
          if (StringUtils.isBlank(list.get(0).get("MIN_TIME")))
          {
            Compare = "4";
            map.put("Compare", Compare);
            modelAction.setAjaxMap(map);
            return BaseActionSupport.AJAX;
          }
          date = df.parse(list.get(0).get("MAX_TIME").toString());
          maxWorkDate = df1.parse(df1.format(date)).getTime();
          date = df.parse(list.get(0).get("MIN_TIME").toString());
          minWorkDate = df1.parse(df1.format(date)).getTime();
          
          Calendar cal = Calendar.getInstance();
          cal.setTime(df.parse(endTime));
          if (cal.get(Calendar.DAY_OF_WEEK)==Calendar.SATURDAY)
          {
            if(sumList.get(0).get("CAL_SAT_FLAG").equals("N")){
              Compare = "5";
              map.put("Compare", Compare);
              modelAction.setAjaxMap(map);
              return BaseActionSupport.AJAX;
              
            }
          }
          if (cal.get(Calendar.DAY_OF_WEEK)==Calendar.SUNDAY)
          {
            if(sumList.get(0).get("CAL_SUN_FLAG").equals("N")){
              Compare = "6";
              map.put("Compare", Compare);
              modelAction.setAjaxMap(map);
              return BaseActionSupport.AJAX;
              
            }
          }
          if (nowTimes > maxWorkDate || nowTimes < minWorkDate)
          {
            Compare = "1";
            map.put("Compare", Compare);
            modelAction.setAjaxMap(map);
            return BaseActionSupport.AJAX;
          }

        }

        if (null != arrList && arrList.size() > 0)
        {
          nowTimes = df.parse(endTime).getTime();
          for (int i = 0; i < arrList.size(); i++ )
          {

            if (StringUtils.isNotBlank(arrList.get(i).get("BEGIN_TIME")))
            {
              minWorkDate = df.parse(arrList.get(i).get("BEGIN_TIME").toString()).getTime();
              if (nowTimes > minWorkDate)
              {
                if (StringUtils.isNotBlank(arrList.get(i).get("END_TIMES")))
                {
                  maxWorkDate = df.parse(arrList.get(i).get("END_TIMES").toString()).getTime();
                  if (nowTimes < maxWorkDate)
                  {
                    map.put("Compare", "2");
                    modelAction.setAjaxMap(map);
                    return BaseActionSupport.AJAX;
                  }

                }
              }
            }
            if (StringUtils.isNotBlank(arrList.get(i).get("END_TIMES")))
            {
              if (StringUtils.isNotBlank(endTime) && StringUtils.isNotBlank(nowTime))
              {
                maxWorkDate = df.parse(arrList.get(i).get("END_TIMES").toString()).getTime();
                endTimes = df.parse(nowTime).getTime();
                if (endTimes < minWorkDate && nowTimes > maxWorkDate)
                {
                  map.put("Compare", "2");
                  modelAction.setAjaxMap(map);
                  return BaseActionSupport.AJAX;
                }
                if (endTimes < minWorkDate && minWorkDate < nowTimes)
                {
                  map.put("Compare", "2");
                  modelAction.setAjaxMap(map);
                  return BaseActionSupport.AJAX;
                }
                if (endTimes < maxWorkDate && minWorkDate < nowTimes)
                {
                  map.put("Compare", "2");
                  modelAction.setAjaxMap(map);
                  return BaseActionSupport.AJAX;
                }
              }
            }
          }
        }
      }
    }
    catch (Exception e)
    {
      // TODO Auto-generated catch block
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }

    map.put("Compare", Compare);
    modelAction.setAjaxMap(map);
    return BaseActionSupport.AJAX;
  }

}
