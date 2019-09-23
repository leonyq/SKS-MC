package com.more.buss.zhiju.service.base;

import java.math.BigDecimal;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * @Description 获取制具信息分页
 * @ClassName DelParameter
 * @author WZY
 * 
 */
public class GetFixtureInfoPage implements FuncService
{

  @SuppressWarnings({"unchecked", "rawtypes", "static-access"})
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub CommMethod.escapeJs()

    List<Map<String,Object>> lists = new ArrayList<Map<String,Object>>();

    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("DATA_AUTH");
    //String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
    String cfiFixSn = request.getParameter("CFI_FIX_SN");
    String cfiItemCode = request.getParameter("CFI_ITEM_CODE");
    String cfiItemType = request.getParameter("CFI_ITEM_TYPE");
    String cfiFixStatus = request.getParameter("CFI_FIX_STATUS");
    String begin = request.getParameter("begin");
    String end = request.getParameter("end");
     String userId=modelAction.getUser().getId();
     
    String sqlwhere = "";
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    /*
    if (StringUtils.isNotBlank(dataAuth))
    {
      sqlwhere += " and a.DATA_AUTH =:dataAuth1 and  b.DATA_AUTH =:dataAuth2   ";
      sqlParaMap.put("dataAuth1", dataAuth);
      sqlParaMap.put("dataAuth2", dataAuth);
     
             
      }
      
       else {
        sqlwhere += " and a.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId1 )" +
          " and b.DATA_AUTH  in( select DEPT_ID from sy_data_auth where USER_ID=:userId2 )  " ;
       
      
      sqlParaMap.put("userId1", userId);
      sqlParaMap.put("userId2", userId);
     
     
      
    }*/
    if (StringUtils.isNotBlank(cfiFixSn))
    {
      sqlwhere += " and a.CFI_FIX_SN like '%' || :CFI_FIX_SN || '%' ";
      sqlParaMap.put("CFI_FIX_SN", cfiFixSn);
    }
    if (StringUtils.isNotBlank(cfiItemCode))
    {
      sqlwhere += " and a.CFI_ITEM_CODE like '%' || :CFI_ITEM_CODE || '%' ";
      sqlParaMap.put("CFI_ITEM_CODE", cfiItemCode);
    }
    if (StringUtils.isNotBlank(cfiItemType))
    {
      sqlwhere += " and a.CFI_ITEM_TYPE = :CFI_ITEM_TYPE ";
      sqlParaMap.put("CFI_ITEM_TYPE", cfiItemType);
    }
    if (StringUtils.isNotBlank(cfiFixStatus))
    {
      sqlwhere += " and a.CFI_FIX_STATUS = :CFI_FIX_STATUS ";
      sqlParaMap.put("CFI_FIX_STATUS", cfiFixStatus);
    }
    if (StringUtils.isNotBlank(begin))
    {
      sqlwhere += " and a.CFI_INSTOCK_TIME >=to_timestamp(:CFI_INSTOCK_TIMES,'yyyy-mm-dd HH24:MI:ss')";
      sqlParaMap.put("CFI_INSTOCK_TIMES", begin);

    }
    if (StringUtils.isNotBlank(end))
    {
      sqlwhere += " and a.CFI_INSTOCK_TIME <=to_timestamp(:CFI_INSTOCK_TIME,'yyyy-mm-dd HH24:MI:ss')";
      sqlParaMap.put("CFI_INSTOCK_TIME", end);
    }

    String sql = "select a.id AS ID, c.name as DATA_AUTH2,a.DATA_AUTH as DATA_AUTH1,a.CFI_CYCLE_REMIND,a.CFI_NOW_USAGE,a.CFI_REMIND_CYCLE,a.CFI_MAX_USAGE,a.CFI_TOTAL_USAGE,"
                 + " a.CFI_MT_DATE,a.CFI_UPKEEP_PERIOD,a.CFI_REMIND_DAY,"
                 + " a.CFI_FIX_SN,a.CFI_FIX_STATUS,a.CFI_ITEM_TYPE,a.CFI_ITEM_CODE,a.CFI_INSTOCK_MAN,"
                 + " to_char(a.CFI_INSTOCK_TIME,'yyyy-mm-dd HH24:MI:ss') as CFI_INSTOCK_TIME,a.CFI_TINCKNESS,a.CFI_FLATNESS,b.ASSISTANTTOOLSPEC,b.ASSISTANTTOOLNAME"
                 + " from T_CO_FIXTURE_INFO a";
                 //+ " left join T_CO_ASSISTANTTOOL b on a.CFI_ITEM_CODE=b.ASSISTANTTOOLNO and b.DATA_AUTH = a.DATA_AUTH left join sy_dept c on c.id=a.data_auth where 1=1 ";
    if (StringUtils.isNotBlank(dataAuth))
    {
    	sqlwhere += " and a.DATA_AUTH = :dataAuth  ";  
      sql +=    " left join T_CO_ASSISTANTTOOL b on a.CFI_ITEM_CODE=b.ASSISTANTTOOLNO and b.DATA_AUTH = a.DATA_AUTH  "
               
                +" left join sy_dept c on c.id=a.data_auth "
    
                
                
                 + " where 1=1  ";
      sqlParaMap.put("dataAuth", dataAuth);
     
       
         
    }
    else 
    {
    	sqlwhere += " and a.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId1 )";	
         sql +=   " left join T_CO_ASSISTANTTOOL b on a.CFI_ITEM_CODE=b.ASSISTANTTOOLNO and b.DATA_AUTH = a.DATA_AUTH "
                + " left join sy_dept c on c.id=a.data_auth "
                    
                
                 + " where 1=1  ";
                   
       
       sqlParaMap.put("userId1", userId);
      
       //sqlParaMap.put("userId7", userId);
  
    }           
    List<Map> list = modelService.listSql(sql+sqlwhere, modelAction.getPage(), sqlParaMap, " ORDER BY a.CFI_FIX_SN ASC", null);
    long remind;
    long usage;
    long cycle;
    long mtDate;
    long mtCycle;
    long remindDay;
    BigDecimal bigDecimalData;
    if (null != list)
    {
      for (int i = 0; i < list.size(); i++ )
      {
        Map<String,Object> dataMap = list.get(i);
        if (null == dataMap.get("CFI_CYCLE_REMIND")
            || dataMap.get("CFI_CYCLE_REMIND").equals("0"))
        {
          // dataMap.put("CFI_CYCLE_REMIND", 0);//保养次数
          remind = 0;
        }
        else
        {
          // remind = dataMap.get("CFI_CYCLE_REMIND");
         // bigDecimalData = (BigDecimal)dataMap.get("CFI_CYCLE_REMIND");// 保养次数
          String aString = dataMap.get("CFI_CYCLE_REMIND").toString();
          remind = Long.parseLong(aString);
          // remind = Long.parseLong((String)dataMap.get("CFI_CYCLE_REMIND"));//保养次数
        }
        if (null == dataMap.get("CFI_NOW_USAGE")
            || dataMap.get("CFI_NOW_USAGE").equals("0"))
        {
          // dataMap.put("CFI_NOW_USAGE", 0);//当前使用次数
          usage = 0;
        }
        else
        {
          // usage = Long.parseLong((String)dataMap.get("CFI_NOW_USAGE")) ;

         // bigDecimalData = (BigDecimal)dataMap.get("CFI_NOW_USAGE");// 当前使用次数
          String aString = dataMap.get("CFI_NOW_USAGE").toString();
          usage = Long.parseLong(aString);
        }
        if (null == dataMap.get("CFI_REMIND_CYCLE")
            || dataMap.get("CFI_REMIND_CYCLE").equals("0"))
        {
          // dataMap.put("CFI_REMIND_CYCLE", 0);//保养提醒次数
          cycle = 0;
        }
        else
        {

          // cycle = Long.parseLong((String)dataMap.get("CFI_REMIND_CYCLE"));
         // bigDecimalData = (BigDecimal)dataMap.get("CFI_REMIND_CYCLE");// 保养提醒次数
          String aString = dataMap.get("CFI_REMIND_CYCLE").toString();
          cycle = Long.parseLong(aString);
        }

        if (null == dataMap.get("CFI_MT_DATE"))
        {
          mtDate = 0;
        }
        else
        {
          Date date = (Date)dataMap.get("CFI_MT_DATE");
          mtDate = date.getTime();// 最后保养时间
          Format format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
          String s = format.format(date);
          dataMap.put("CFI_MT_DATE", s);

        }
        if (null == dataMap.get("CFI_UPKEEP_PERIOD"))
        {
          // dataMap.put("CFI_UPKEEP_PERIOD", 0);//保养周期
          mtCycle = 0;
        }
        else
        {
          // Date cycles = (Date)dataMap.get("CFI_UPKEEP_PERIOD");
          // mtCycle =cycles.getTime();
         // bigDecimalData = (BigDecimal)dataMap.get("CFI_UPKEEP_PERIOD");// 保养周期
          String aString = dataMap.get("CFI_UPKEEP_PERIOD").toString();
          mtCycle = Long.parseLong(aString) * (1000 * 60 * 60 * 24);
        }
        if (null == dataMap.get("CFI_REMIND_DAY"))
        {
          // dataMap.put("CFI_REMIND_DAY", 0);//保养提醒天数
          remindDay = 0;
        }
        else
        {
          // Date day = (Date)dataMap.get("CFI_REMIND_DAY");
          // remindDay =day.getTime();
          // 1000 * 60 * 60 * 24
         // bigDecimalData = (BigDecimal)dataMap.get("CFI_REMIND_DAY");// 保养提醒天数
          String aString = dataMap.get("CFI_REMIND_DAY").toString();
          remindDay = Long.parseLong(aString) * (1000 * 60 * 60 * 24);
        }

        long state = remind - usage;// 次数到期时间

        long newTime = DateUtil.getCurDate().getTime();// 当前时间

        long numTime = mtDate + mtCycle;// 保养到期时间

        long timeState = numTime - newTime;

        if (state <= 0 || timeState <= 0)
        {
          dataMap.put("CFI_FIX_STATE", modelAction.getText("过期"));
        }
        else if (cycle >= state || remindDay >= timeState)
        {
          dataMap.put("CFI_FIX_STATE", modelAction.getText("到期"));
        }
        else
        {
          dataMap.put("CFI_FIX_STATE", modelAction.getText("正常"));
        }

        lists.add(dataMap);

      }
      CommMethod.listMapToEscapeJs(lists);
      modelAction.setAjaxPage(modelAction.getPage());
      modelAction.getAjaxPage().setDataList(lists);

      return modelAction.AJAX;

    }
    else
    {
      modelAction.setAjaxPage(modelAction.getPage());
      modelAction.getAjaxPage().setDataList(null);

      return modelAction.AJAX;
    }
  }

}
