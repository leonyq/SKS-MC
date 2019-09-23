package com.more.http;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.http.*;
import java.util.List;
import org.apache.commons.logging.LogFactory;

import org.apache.commons.logging.Log;
import com.more.fw.core.common.method.StringUtils;

import org.apache.http.*;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.util.ArrayList;
import java.io.*;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.conn.ssl.TrustSelfSignedStrategy;

/**
 * HttpCoreService 提供如下:
 *          Map result; 返回结果类型 key: json为json解析       xml 用xml解析     obj 返回对象
 *          Map<String, String> paramTo; 传递参数   service.getParamTo().get("name");
 *          Map resultDto; xml 解析时需要 对象的 .class：
 *                                      resultName.put("xmlBean", HttpConfigDto.class);
 *                                      service.setResultDto(resultName);
 *          DataInteraction dit;对象传输时用到：
 *                                      service.getDit().get("name");
 *                                      service.getDit().put("name", "test");  
 *          Map paramLog; log日志：
 *                          Map map = service.getParamLog();
 *                          map.put("message","用户自定义信息");
 *                          super.log(map);
 */
public class Pdaloginaction extends InterfaceLog implements IhttpServiceJosn {
  private final Log log = LogFactory.getLog(this.getClass());
  
  @Override
  public String exeFunc(HttpCoreService service) {

String name = StringUtils.toString(service.getParamTo().get("name"));
     String pwd = StringUtils.toString(service.getParamTo().get("pwd"));
     String device=StringUtils.toString(service.getParamTo().get("device"));
     String dataAuth = StringUtils.toString(service.getParamTo().get("dataAuth"));
     String link="http://190.160.2.122:8014/N2/sys/LoginAction_forPdaLogin.ms";
     link="https://"+service.getRequest().getHeader("host")+service.getRequest().getContextPath()+"/sys/LoginAction_forPdaLogin.ms";
      String url=service.getRequest().getRequestURL().toString();
     link=url.substring(0, StringUtils.ordinalIndexOf(url,"/", 4))+"/sys/LoginAction_forPdaLogin.ms";
     pwd=encrypt(pwd);
     String jsonStr="{\"USER\":\""+name+"\",\"PW\":\""+pwd+"\",\"DEVICE\":\""+device+"\",\"ORG\":\""+dataAuth+"\"}";
     Map<String, String> map1 = new HashMap<>();
     
     
     map1.put("USER",name);
     map1.put("PW",pwd);
     map1.put("DEVICE",device);
     map1.put("ORG",dataAuth);
    
     JSONObject jsonObject = JSONObject.fromObject(map1);
     String jsonsString=jsonObject.toString();
     //String a = StringUtils.toString(CommMethod.sendPost(link, jsonsString));
     String a = StringUtils.toString(this.doPost(link, map1));
     a=a.replace("null", "\"\"");
  
     System.out.println(a);

     log.info("pdalog:"+a);
  
     JSONObject json=JSONObject.fromObject(a);
     json=JSONObject.fromObject(json.getString("ajaxMap"));
   
     Map map = new HashMap();
     map.put("json", json);
     service.setResult(map);
     service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
     service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
     service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
     service.getResponse().setHeader("Content-type", "application/json; charset=utf-8");
     

     return null;


  }
  public String doPost(String link, Map<String, String> param)
  {
    // 创建Httpclient对象
    CloseableHttpClient httpClient = null;//HttpClients.createDefault();
    CloseableHttpResponse response = null;
    String resultString = "";
    try
    {

      //link="https://www.morewiscloud.com:10014/N2/sys/LoginAction_forPdaLogin.ms";
    	
    	SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(
    				SSLContexts.custom().loadTrustMaterial(null,new TrustSelfSignedStrategy()).build(),NoopHostnameVerifier.INSTANCE
    			);
    	httpClient = HttpClients.custom().setSSLSocketFactory(sslsf).build();
      // 创建Http Post请求
      HttpPost httpPost = new HttpPost(link);
        // 创建参数列表
      if (param != null)
      {
        List<NameValuePair> paramList = new ArrayList<>();
        for (String key : param.keySet())
        {
          paramList.add(new BasicNameValuePair(key, param.get(key)));
        }
        // 模拟表单
        UrlEncodedFormEntity entity = new UrlEncodedFormEntity(paramList);
        httpPost.setEntity(entity);
      }
      
      // 执行http请求
      response = httpClient.execute(httpPost);
      resultString = EntityUtils.toString(response.getEntity(), "utf-8");
    }
    catch (Exception e)
    {
      log.error("com.more.http.Pdaloginaction:doPost",e);
      e.printStackTrace();
    }
    finally
    {
      try
      {
        response.close();
      }
      catch (Exception e)
      {
        // TODO Auto-generated catch block
        e.printStackTrace();
        return e.toString();
      }
    }

    return resultString;
  }  
  
  /**
     * 发送Http post请求
     * 
     * @param xmlInfo
     *            json转化成的字符串
     * @param URL
     *            请求url
     * @return 返回信息
     */
     public static String encrypt(String pw){
      ScriptEngineManager manager = new ScriptEngineManager();
      ScriptEngine engine = manager.getEngineByName("javascript");
      try{
        engine.eval("function encrypt(pw){\r\n" + 
          "  var key = \"1000000\";\r\n" + 
          "  var keyLen = key.length;\r\n" + 
          "  var k=0;\r\n" + 
          "  var newPw =\"\";\r\n" + 
          "  for(var i=0,j=pw.length;i<j;i++,k++){\r\n" + 
          "    if(k== keyLen){k=0}\r\n" + 
          "    if(k<keyLen){\r\n" + 
          "      newPw+= String.fromCharCode(pw.charCodeAt(i) ^ key.charAt(k));\r\n" + 
          "    }\r\n" + 
          "  }\r\n" + 
          "  return newPw;}");
        if (engine instanceof Invocable) {
            Invocable in = (Invocable) engine;
            return in.invokeFunction("encrypt",pw).toString();
        }
        }catch(Exception e){
        e.printStackTrace();
    }
      return null;
    }
     
     

}
