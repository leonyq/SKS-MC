package com.more.mes.smt.app.http;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Comparator;
import java.util.TreeMap;

import org.apache.jasper.tagplugins.jstl.core.If;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.sun.org.apache.bcel.internal.generic.Select;

public class GetListInfo extends InterfaceLog implements IhttpServiceJosn
{
  private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(HttpCoreService service)
  {
    // TODO Auto-generated method stub
    Map<String, Object> jsonMap = new HashMap<String, Object>();
    Map<String, Object> resmap = new HashMap<String, Object>();
    HashMap<String, Object> resultHashMap = new HashMap<String, Object>();
    String MinorItemId = service.getParamTo().get("M_MINORITEM_ID");
    String MRomnum = service.getParamTo().get("M_ROMNUM");
    List date = new ArrayList<>();
    String[] nType = {"M_EMP_NO", "M_DEPT_ID", "M_AREA_CODE", "M_TEST_STEP", "M_WH_CODE",
      "M_AREA_SN"};

    try
    {
      String selectSql = " select t.TAS_DATA_CONTENT,t3.TAM_MOUDLE_NAME,"
                         + "t.TAS_FUN_NAME,t.ID,t.TAS_SHOW_TYPE,"
                         + " case when  t.TAS_FUNCTION_LINK is null then ''"
                         + " else  t.TAS_FUNCTION_LINK end  TAS_FUNCTION_LINK"
                         + " from  T_APP_SHOWMANAGE t"
                         + "  inner  join  T_APP_MOUDLE  t3  on  t3.id  =  t.TAs_MOUDLE_ID"
                         + " where t.id=? ";

      Map<String, String> map = modelService.queryForMap(selectSql, new Object[] {MinorItemId});

      if (null != map && map.size() > 0)
      {
        String competitive = map.get("TAS_DATA_CONTENT");
        String src;

        String ContentSql = CommMethod.toJsonObj(competitive).get("oracle").toString();
        String selSql = null;
        Map<String, Object> map3 = new HashMap<String, Object>();
        Map<String, Object> map4 = new HashMap<String, Object>();

        getHomeInformation getHomeInformation = new getHomeInformation();

        List selSqlMap = this.getSelSql(ContentSql, service, nType, MRomnum);

        map4 = (Map<String, Object>)selSqlMap.get(0);

        selSql = (String)selSqlMap.get(1);

        List<Map> list5 = new ArrayList<>();
        if (null != map4 && map4.size() > 0)
        {
          // list5=
          // modelService.listSql(selSql,null,map4,null,null);
          list5 = modelService.listSql(selSql, null, map4, null, null);
        }
        else
        {
          list5 = modelService.listDataSql(selSql);
        }
       List<Map> list=new ArrayList<Map>();
       list=delNull(list5);
        resultHashMap.put("title", map.get("TAM_MOUDLE_NAME") + "-" + map.get("TAS_FUN_NAME"));
        resultHashMap.put("data", list);
        resultHashMap.put("Type", map.get("TAS_SHOW_TYPE"));
        if (StringUtils.isNotBlank(map.get("TAS_FUNCTION_LINK")))
        {
          resultHashMap.put("TAS_FUNCTION_LINK", map.get("TAS_FUNCTION_LINK"));
        }else {
          resultHashMap.put("TAS_FUNCTION_LINK","");
        }
        
        resultHashMap.put("MINORITEMID", map.get("ID"));
        date.add(resultHashMap);
      }
      else
      {
        jsonMap.put("chkLog", false);
        jsonMap.put("Content", "");
        jsonMap.put("msg", "数据异常");
      }
    }
    catch (Exception e)
    {
      // TODO: handle exception
      jsonMap.put("chkLog", false);
      jsonMap.put("Content", "");
      jsonMap.put("msg", e.toString());
      // JSONObject jsonObject = JSONObject.fromObject(jsonMap);
      // resmap.put("json", CommMethod.toJson(jsonObject.toString()));
     
      // CommMethod.toJson(jsonMap)
      resmap.put("json",CommMethod.toJson(jsonMap));
      service.setResult(resmap);
      service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
      service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
      service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
      return null;
    }
    
    jsonMap.put("chkLog", true);
    jsonMap.put("Content", date);
    jsonMap.put("msg", "");
    
    String jsonStr = "";
    try
    {
      ObjectMapper objectMapper = new ObjectMapper();
      jsonStr= objectMapper.writeValueAsString(jsonMap);
    }
    catch (JsonProcessingException e1)
    {
      // TODO Auto-generated catch block
      e1.printStackTrace();
    }
    //resmap.put("json",CommMethod.toJson(jsonMap));
    resmap.put("json",jsonStr);
    service.setResult(resmap);
    service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
    service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
    service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
    return null;
  }

  @SuppressWarnings("rawtypes")
  public List<Map> delNull(List<Map> list5)
  {
    // TODO Auto-generated method stub
    List<Map> list = new ArrayList<>();
    for (int j = 0; j < list5.size(); j++ )
    {
      
      Map map2 = list5.get(j);
      int size = map2.size();
      
      Map map = new HashMap<>();
      for (Object key : map2.keySet())
      {

       if (StringUtils.isNotBlank(map2.get(key)))
      {
         if(map2.get(key) instanceof Date){
           map2.put(key, DateUtil.formatDate((Date)map2.get(key), "yyyy-MM-dd HH:mm:ss"));
          
         }
         if(map2.get(key) instanceof java.sql.Date){
         
           map2.put(key, DateUtil.formatDate((Date)map2.get(key), "yyyy-MM-dd"));
         }
         
         list5.get(j).put(key,StringUtils.toString( map2.get(key)));
         
      }else {
       // map.put(key,"");
        list5.get(j).put(key, "");
      }

       

      }


    }
    return list5;
  }
  
  @SuppressWarnings("rawtypes")
  public List<Map> delNulls(List<Map> list5)
  {
    // TODO Auto-generated method stub
    List<Map> list = new ArrayList<>();
    for (int j = 0; j < list5.size(); j++ )
    {
      
      Map map2 = list5.get(j);
      int size = map2.size();
      
      Map map = new HashMap<>();
      for (Object key : map2.keySet())
      {

     
        
         /*
         if(map2.get(key) instanceof Timestamp){
           System.out.println("value============="+map2.get(key));
         }*/
       if (StringUtils.isNotBlank(map2.get(key)))
      {
        // list5.get(j).put(key, map2.get(key));
         map.put(key, map2.get(key));
      }else {
        map.put(key,"");
       // list5.get(j).put(key, "");
      }
      }
      //list=list5;
     // Map<String, String> treeMap = new TreeMap<String, String>(map);
      map=sortMapByKey(map);
      list.add(map);
   

    }
    return list;
  }
  
  
  
  public static Map<String, String> sortMapByKey(Map<String, String> map) {
    if (map == null || map.isEmpty()) {
        return null;
    }

    Map<String, String> sortMap = new TreeMap<String, String>(
            new MapKeyComparator());

    sortMap.putAll(map);

    return sortMap;
}
  
  

  @SuppressWarnings("unchecked")
  public List getSelSql(String a3, HttpCoreService service, String[] nType, String MRomnum)
  {
    String selSql = null;
    String str = a3.toUpperCase();
    List list = new ArrayList<>();
    String s = str.replaceAll("\\{\"", "{'");
    String strSql;

    ArrayList<String> word = new ArrayList<String>();
    int m = 0, n = 0;
    int count = 0;
    // 获取所有大括号中的值
    for (int P = 0; P < s.length(); P++ )
    {
      if (str.charAt(P) == '{')
      {
        if (count == 0)
        {
          m = P;
        }
        count++ ;
      }
      if (str.charAt(P) == '}')
      {
        count-- ;
        if (count == 0)
        {
          n = P;
          word.add(str.substring(m + 1, n));
        }
      }

    }
    String labelwq;
    String tempSql;
    Map<String, Object> map3 = new HashMap<String, Object>();
    Map<String, Object> map4 = new HashMap<String, Object>();
    String[] labelSqlS = str.split("WHERE");
    String[] label = null;
    String[] labelSqla;
    if (labelSqlS.length >= 2)
    {
      label = labelSqlS[1].split("AND");
      String[] labels = labelSqlS[1].split("AND");
      String[] labelSql = new String[labels.length + 1];
      // String typess = label[label.length - 1].substring(label[label.length -
      // 1].indexOf("group by")).toUpperCase();
      // String strs = label[label.length - 1].substring(label[label.length -
      // 1].indexOf("group by"));
      if (labels[labels.length - 1].indexOf("GROUP BY") != -1)
      {
        for (int i = 0; i < labels.length - 1; i++ )
        {
          labelSql[i] = labels[i];
        }
        labelSql[labelSql.length - 2] = label[label.length - 1].split("GROUP BY")[0];
        labelSql[labelSql.length - 1] = label[label.length - 1].split("GROUP BY")[1];
        labelSqla = labelSql;
      }
      else
      {
        labelSqla = labels;
      }

      // 判断是否与传回来的参数是否一致
      if (null != word && word.size() > 0)
      {
        for (int H = 0; H < word.size(); H++ )
        {
          String brackets = word.get(H).toUpperCase();
          for (int j = 0; j < nType.length; j++ )
          {
            if (brackets.equals(nType[j]))
            {
              if (StringUtils.isNotBlank(service.getParamTo().get(nType[j])))
              {

                int r = 0;
                for (int k = 0; k < labelSqla.length; k++ )
                {

                  if (labelSqla[k].indexOf("{") != -1)
                  {
                    String bracketa = labelSqla[k].substring(labelSqla[k].indexOf("{") + 1,
                      labelSqla[k].indexOf("}"));
                    String type = labelSqla[k].substring(labelSqla[k].indexOf("AND") + 1,
                      labelSqla[k].indexOf("{")).toUpperCase();
                    if (brackets.equals(bracketa.toUpperCase()))
                    {
                      // String bracketas = label[k].substring(0,label[k].indexOf("="));
                      list.add(labelSqla[k]);
                      // label[k]=
                      // brackets+" = ? ";
                      labelSqla[k] = type + ":" + brackets;

                      map4.put(brackets, service.getParamTo().get(nType[j]));
                      r = k;
                      break;
                    }
                  }

                }
                if (StringUtils.isBlank(selSql))
                {
                  selSql = labelSqlS[0] + " WHERE " + labelSqla[r];
                }
                else
                {
                  selSql += " AND " + labelSqla[r];
                }

              }
              else
              {
                // 传回来的参数为空 条件变为1=1
                int r = 0;
                for (int k = 0; k < labelSqla.length; k++ )
                {
                  if (labelSqla[k].indexOf("{") != -1)
                  {
                    String bracketa = labelSqla[k].substring(labelSqla[k].indexOf("{") + 1,
                      labelSqla[k].indexOf("}"));
                    if (brackets.equals(bracketa.toUpperCase()))
                    {
                      // String bracketas = label[k].substring(0,label[k].indexOf("="));
                      list.add(labelSqla[k]);
                      labelSqla[k] = " 1=1";
                      r = k;
                      break;
                    }
                  }

                }
                if (StringUtils.isBlank(selSql))
                {
                  selSql = labelSqlS[0] + " WHERE " + labelSqla[r];
                }
                else
                {
                  selSql += " AND " + labelSqla[r];
                }

              }
            }
          }

        }
      }
      else
      {
        selSql = a3;
      }
    }
    else
    {
      selSql = a3;
    }
    // 如果有 group by
    if (labelSqlS.length >= 2)
    {
      String[] labels = labelSqlS[1].split("AND");
      String[] labelSql = new String[labels.length + 1];
      if (labels[labels.length - 1].indexOf("GROUP BY") != -1)
      {
        for (int i = 0; i < labels.length - 1; i++ )
        {
          labelSql[i] = labels[i];
        }
        labelSql[labelSql.length - 2] = label[label.length - 1].split("GROUP BY")[0];
        labelSql[labelSql.length - 1] = label[label.length - 1].split("GROUP BY")[1];
        labelSqla = labelSql;
      }
      else
      {
        labelSqla = labels;
      }
      // 不是{}条件的添加
      int y = 0;
     if(labelSqla.length == label.length){
       for (int j = 0; j < labelSqla.length; j++ )
       {
         for (int i = 0; i < list.size(); i++ )
         {
           if (!labelSqla[j].equals(String.valueOf(list.get(i))))
           {
             y++ ;
           }
         }
         if (y == list.size())
         {
           selSql = selSql + " AND " + labelSqla[j];
         }
         y = 0;
       }
     }else {
       for (int j = 0; j < labelSqla.length-1; j++ )
       {
         for (int i = 0; i < list.size(); i++ )
         {
           if (!labelSqla[j].equals(String.valueOf(list.get(i))))
           {
             y++ ;
           }
         }
         if (y == list.size())
         {
           selSql = selSql + " AND " + labelSqla[j];
         }
         y = 0;
       }
    }
      // group by 添加
      if (labelSqla.length != label.length)
      {
        selSql = selSql + " GROUP BY " + labelSqla[labelSqla.length - 1];
      }
    }
    
    
    
    
    

    selSql = "select * from (Select ROWNUM  as 序号 ,r.* from(" + selSql + ") r) where 序号  between :ROWNUM and :ROWNUM1  order by 序号 ";
    
    
    
    if (MRomnum.equals("0"))
    {
      map4.put("ROWNUM", MRomnum);
      map4.put("ROWNUM1", Integer.valueOf(MRomnum) + 20);
    }else {
      map4.put("ROWNUM", Integer.valueOf(MRomnum)+1);
      map4.put("ROWNUM1", Integer.valueOf(MRomnum) + 20);
    }
    
    
    
    
    Map<String, Object> map = new HashMap<>();
    map.put("Sql", selSql);
    List list2 = new ArrayList<>();

    list2.add(map4);
    list2.add(selSql);
    
    
    
    return list2;
  }
  
}

class MapKeyComparator implements Comparator<String>{

  @Override
  public int compare(String str1, String str2) {
      
      return str2.compareTo(str1);
  }
}
