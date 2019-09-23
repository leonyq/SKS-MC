package com.more.sap.mes.http;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.pda.service.PdaBaseServiceUtils;
import com.more.mes.pda.service.PdaService;
import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;

import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import java.util.*;

/**
 * 工单缴库
 *
 * @author:phantomsaber
 * @version:2019/8/14 12:12
 * @email:phantomsaber@foxmail.com
 **/
public class ProjectPostPackIntfImpl extends InterfaceLog implements IhttpServiceJosn {
    private final Log log = LogFactory.getLog(this.getClass());
    private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

//    http://10.10.80.193:8080/sks-wss-ssm
    //private final String host = "http://phantomsaber.picp.io:53763";

    private final String host = "http://10.10.80.193:8080";

    private final String postPackPath = "/sks-wss-ssm/webservice/ProjectPostPackIntfImpl?wsdl";
    private final String feedPath = "/sks-wss-ssm/webservice/ProjectFeedIntfImpl?wsdl";
    private final String packFeedPath = "/sks-wss-ssm/webservice/ProjectPackFeedIntfImpl?wsdl";

    private final String postPackUrl = host + postPackPath;
    private final String feedUrl = host + feedPath;
    private final String packFeedUrl = host + packFeedPath;

    private final String funcName = "ajaxExecByIds";
    private final String paramName = "idsJson";


    @Override
    public String exeFunc(HttpCoreService service) {
        Map<String, String> map = new HashMap();
        Map<String, String> resultMap = new HashMap<>();
        try {
            String idList = service.getRequest().getParameter("idList");
            String[] ids = idList.split(",");
            List<String> dataIdList = new ArrayList<>();
            for (String curId : ids) {
                dataIdList.add(curId);
            }
            String dataIdJson = StringEscapeUtils.unescapeJava(JSON.toJSONString(dataIdList));

            String sql = " SELECT A.PROJECT_SORT FROM T_PM_PROJECT_BASE A INNER JOIN T_PM_PROJECT_POST B ON A.PROJECT_ID = B.PROJECT_ID WHERE 1 = 1 AND B.ID = ? ";
            for (String cur : dataIdList) {
                Map sortMap = modelService.queryForMap(sql, new Object[]{cur});
                String projectSort = sortMap.get("PROJECT_SORT").toString();

                Map<String, String> feedMap = execAjaxByIds(dataIdJson, feedUrl);
                Map<String, String> packFeedMap = new HashMap<>();
                Map<String, String> postPackMap = new HashMap<>();

                String sflagFeed = null;
                String messageFeed = null;
                try {
                    sflagFeed = getSflag(feedMap.get("json"));
                    messageFeed = getMessage(feedMap.get("json"));
                } catch (Exception e) {
                    sflagFeed = null;
                    messageFeed = null;
                }

                String sflagPack = null;
                String sflagPost = null;

                String messagePack = null;
                String messagePost = null;
                if(!("Y".equalsIgnoreCase(sflagFeed)) && sflagFeed != "Y"){
                    if("2".equals(projectSort) || projectSort == "2"){
                        packFeedMap = execAjaxByIds(dataIdJson, packFeedUrl);
                        sflagPack = getSflag(packFeedMap.get("json"));
                        messagePack = getMessage(packFeedMap.get("json"));
                        if(!("N".equalsIgnoreCase(sflagPack)) && sflagPack != "N"){
                            postPackMap = execAjaxByIds(dataIdJson, postPackUrl);
                            sflagPost = getSflag(postPackMap.get("json"));
                            messagePost = getMessage(postPackMap.get("json"));
                        }
                    }
                }else{
                    postPackMap = execAjaxByIds(dataIdJson, postPackUrl);
                    sflagPost = getSflag(postPackMap.get("json"));
                    messagePost = getMessage(postPackMap.get("json"));
                }

                if(!("N".equalsIgnoreCase(sflagFeed)) && sflagFeed != "N"){
                    if(!("N".equalsIgnoreCase(sflagPack)) && sflagPack != "N"){
                        if(!("N".equalsIgnoreCase(sflagPost)) && sflagPost != "N"){
                            String updatePost = " UPDATE T_PM_PROJECT_POST A SET A.SFLAG = ?, A.MESSAGE = ? WHERE 1=1 AND A.ID = ? ";
                            modelService.execSql(updatePost, new Object[]{sflagPost,messagePost, cur});
//                            map.put("resultMap", StringEscapeUtils.unescapeJava(JSON.toJSONString(postPackMap)));
                            map.put("SFLAG", sflagPost);
                            map.put("MESSAGE", messagePost);
                        }else{
                            String updatePost = " UPDATE T_PM_PROJECT_POST A SET A.SFLAG = ?, A.MESSAGE = ? WHERE 1=1 AND A.ID = ? ";
                            modelService.execSql(updatePost, new Object[]{sflagPost,messagePost, cur});
//                            map.put("resultMap", StringEscapeUtils.unescapeJava(JSON.toJSONString(postPackMap)));
                            map.put("SFLAG", sflagPost);
                            map.put("MESSAGE", messagePost);
                        }
                    }else{
                        String updatePost = " UPDATE T_PM_PROJECT_POST A SET A.SFLAG = ?, A.MESSAGE = ? WHERE 1=1 AND A.ID = ? ";
                        modelService.execSql(updatePost, new Object[]{sflagPack,messagePack, cur});
//                        map.put("resultMap", StringEscapeUtils.unescapeJava(JSON.toJSONString(postPackMap)));
                        map.put("SFLAG", sflagPack);
                        map.put("MESSAGE", messagePack);
                    }
                }else{
                    String updatePost = " UPDATE T_PM_PROJECT_POST A SET A.SFLAG = 'N', A.MESSAGE = ? WHERE 1=1 AND A.ID = ? ";
                    modelService.execSql(updatePost, new Object[]{messageFeed, cur});
//                    map.put("resultMap", StringEscapeUtils.unescapeJava(JSON.toJSONString(feedMap)));
                    map.put("SFLAG", sflagFeed);
                    map.put("MESSAGE", messageFeed);
                }
            }

            String jsonStr = PdaService.MapToJson(map);
            resultMap.put("json", jsonStr);
            service.setResult(resultMap);
        } catch (Exception e) {
            map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), e.toString()));
            service.setResult(resultMap);
        }
        return null;
    }

    /**
     * exec 包装单缴库
     * @param ids
     * @return
     */
    private Map<String, String> execAjaxByIds(String ids, String url) {
        Map<String, String> map = new HashMap();
        try {
            JaxWsProxyFactoryBean bean = new JaxWsProxyFactoryBean();
            bean.setAddress(url);

            Service soapService = new Service();
            Call call = null;

            call = (Call) soapService.createCall();
            call.setTargetEndpointAddress(url);
            QName qName = new QName("http://cxf.temptation.cn/", funcName);
            call.setOperationName(qName);
            call.setUseSOAPAction(true);
            //这下面两行一定要加上，否则接收在服务器端收不到。
            call.addParameter(paramName, XMLType.XSD_STRING, ParameterMode.IN);
            call.setReturnType(XMLType.XSD_STRING);

            String result = null;
            Map<String, String> resultMap = new HashMap<>();

            result = (String) call.invoke(new Object[]{ids});

            result = result.replace("[", "").replace("]", "");

            if(result.length() > 0){
                resultMap.put("result", result);
                String jsonStr = PdaService.MapToJson(resultMap);
                map.put("json", jsonStr);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), e.toString()));
        }
        return map;
    }

    private String getSflag(String json){
/*
        JSONArray jsonArray = JSON.parseArray(json.toUpperCase());
        JSONObject jsonObject = (JSONObject) jsonArray.get(0);
        String result = StringEscapeUtils.unescapeJava(JSON.toJSONString(jsonObject.get("RESULT")));
        System.out.println(result);
        String regex = "^" + "\"" + "*|" + "\"" + "*$";
        result = result.replaceAll(regex,"");
        result = result.replace("\"{", "{").replace("}\"","}");

        JSONObject jsonObject1 = JSONObject.parseObject(result);
        String sflag = jsonObject1.get("SFLAG").toString();
*/
        JSONArray jsonArray = JSON.parseArray(json.toUpperCase());
        JSONObject jsonObject = (JSONObject) jsonArray.get(0);
        String result = StringEscapeUtils.unescapeJava(JSON.toJSONString(jsonObject.get("RESULT")));
        System.out.println(result);
        String regex = "^" + "\"" + "*|" + "\"" + "*$";
        String regex1 = "\"\\[";
        String regex2 = "]\"";

        result = result.replaceAll(regex,"");
        result = result.replace("\"{", "{").replace("}\"","}");
        result = result.replaceAll(regex1,"[").replaceAll(regex2,"]");
        String sflag = null;
        try {
            JSONArray jsonArray1 = JSON.parseArray(result);

            for (Iterator iterator = jsonArray1.iterator(); iterator.hasNext();) {
                JSONObject jo = (JSONObject) iterator.next();
                sflag = jo.get("SFLAG").toString();
                if (("N".equalsIgnoreCase(sflag)) && sflag == "N") {
                    break;
                }
            }
        }catch (Exception e){
            result = "[" + result.replace("\"货物移动\"", "货物移动") + "]";
            JSONArray jsonArray1 = JSON.parseArray(result);

            for (Iterator iterator = jsonArray1.iterator(); iterator.hasNext();) {
                JSONObject jo = (JSONObject) iterator.next();
                sflag = jo.get("SFLAG").toString();
                if (("N".equalsIgnoreCase(sflag)) && sflag == "N") {
                    break;
                }
            }
        }

        return sflag;
    }

    private String getMessage(String json){
/*
        JSONArray jsonArray = JSON.parseArray(json.toUpperCase());
        JSONObject jsonObject = (JSONObject) jsonArray.get(0);
        String result = StringEscapeUtils.unescapeJava(JSON.toJSONString(jsonObject.get("RESULT")));
        System.out.println(result);
        String regex = "^" + "\"" + "*|" + "\"" + "*$";
        result = result.replaceAll(regex,"");
        result = result.replace("\"{", "{").replace("}\"","}");

        JSONObject jsonObject1 = JSONObject.parseObject(result);
        String sflag = jsonObject1.get("MESSAGE").toString();
*/
        JSONArray jsonArray = JSON.parseArray(json.toUpperCase());
        JSONObject jsonObject = (JSONObject) jsonArray.get(0);
        String result = StringEscapeUtils.unescapeJava(JSON.toJSONString(jsonObject.get("RESULT")));
        System.out.println(result);
        String regex = "^" + "\"" + "*|" + "\"" + "*$";
        String regex1 = "\"\\[";
        String regex2 = "]\"";

        result = result.replaceAll(regex,"");
        result = result.replace("\"{", "{").replace("}\"","}");
        result = result.replaceAll(regex1,"[").replaceAll(regex2,"]");


        String sflag = null;
        String message = null;

        try {
            JSONArray jsonArray1 = JSON.parseArray(result);
            for (Iterator iterator = jsonArray1.iterator(); iterator.hasNext();) {
                JSONObject jo = (JSONObject) iterator.next();
                sflag = jo.get("SFLAG").toString();
                message = jo.get("MESSAGE").toString();
                if (("N".equalsIgnoreCase(sflag)) && sflag == "N") {
                    break;
                }
            }
        } catch (Exception e) {
            result = "[" + result.replace("\"货物移动\"", "货物移动") + "]";
            JSONArray jsonArray1 = JSON.parseArray(result);
            for (Iterator iterator = jsonArray1.iterator(); iterator.hasNext();) {
                JSONObject jo = (JSONObject) iterator.next();
                sflag = jo.get("SFLAG").toString();
                message = jo.get("MESSAGE").toString();
                if (("N".equalsIgnoreCase(sflag)) && sflag == "N") {
                    break;
                }
            }
        }

        return message;
    }

}
