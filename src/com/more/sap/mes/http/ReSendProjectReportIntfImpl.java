package com.more.sap.mes.http;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.pda.service.PdaBaseServiceUtils;
import com.more.mes.pda.service.PdaService;
import com.sun.deploy.panel.CacheSettingsDialog;
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
 * 工单报工异常重发
 *
 * @author:phantomsaber
 * @version:2019/8/28 14:35
 * @email:phantomsaber@foxmail.com
 **/
public class ReSendProjectReportIntfImpl extends InterfaceLog implements IhttpServiceJosn {
    private final Log log = LogFactory.getLog(this.getClass());
    private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

    private final String host = "http://phantomsaber.picp.io:53763";
//    private final String host = "http://localhost:8080";

//    private final String host = "http://10.10.78.161:8080";
//    private final String host = "http://10.10.80.193:8080";

    private final String reportPath = "/sks-wss-ssm/webservice/ProjectReportIntfImpl?wsdl";
    private final String reportUrl = host + reportPath;

    private final String feedPath = "/sks-wss-ssm/webservice/ProjectFeedIntfImpl?wsdl";
    private final String feedUrl = host + feedPath;

    private final String feedPackPath = "/sks-wss-ssm/webservice/ProjectPackFeedIntfImpl?wsdl";
    private final String feedPackUrl = host + feedPackPath;

    private final String postPath = "/sks-wss-ssm/webservice/ProjectPostPackIntfImpl?wsdl";
    private final String postUrl = host + postPath;

    private final String funcName = "ajaxRedoBySapLogDetail";
    private final String paramName = "logDetailIdsJson";

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

            for (String cur : dataIdList) {
                String sql = "SELECT A.INTF_TYPE FROM T_PROJECT_SAP_LOG_DETAIL A WHERE 1=1 AND A.ID = ? ";
                Map intfTypeMap = modelService.queryForMap(sql, new Object[]{cur});

                String intfType = intfTypeMap.get("INTF_TYPE").toString();

                String execUrl = null;

                //5-制造单投料,6-包装单投料, 7-工单缴库, 8-工单报工
                if ("5".equals(intfType) || "5" == intfType) {
                    execUrl = feedUrl;
                } else if ("6".equals(intfType) || "6" == intfType) {
                    execUrl = feedPackUrl;
                } else if ("7".equals(intfType) || "7" == intfType) {
                    execUrl = postUrl;
                } else if ("8".equals(intfType) || "8" == intfType) {
                    execUrl = reportUrl;
                } else {
                    throw new Exception("工单类型异常");
                }

                Map<String, String> reportMap = execAjaxByIds(dataIdJson, execUrl);

                String sflag = null;
                String message = null;

                List<TProjectSapLogDetail> sapLogDetailList = getSapLogDetail(reportMap.get("json"));
                for (TProjectSapLogDetail tProjectSapLogDetail : sapLogDetailList) {
                    String sflag1 = tProjectSapLogDetail.getSFLAG();
                    String message1 = tProjectSapLogDetail.getMESSAGE();
                }

                try {
                    sflag = getSflag(reportMap.get("json"));
                    message = getMessage(reportMap.get("json"));
                } catch (Exception e) {
                    sflag = "N";
                    message = e.getMessage();
                }

                if (!("N".equalsIgnoreCase(sflag)) && sflag != "N") {
                    String updateReport = " UPDATE T_PM_PROJECT_REPORT A SET A.SFLAG = ? ,A.MESSAGE = ? WHERE 1=1 AND A.ID = ? ";
                    modelService.execSql(updateReport, new Object[]{sflag, message, cur});
                    map.put("SFLAG", sflag);
                    map.put("MESSAGE", message);
                } else {
                    String updateReport = " UPDATE T_PM_PROJECT_REPORT A SET A.SFLAG = ? ,A.MESSAGE = ? WHERE 1=1 AND A.ID = ? ";
                    modelService.execSql(updateReport, new Object[]{sflag, message, cur});
                    map.put("SFLAG", sflag);
                    map.put("MESSAGE", message);
                }
            }
            String jsonStr = PdaService.MapToJson(map);
            resultMap.put("json", jsonStr);
            service.setResult(resultMap);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), e.toString()));
            service.setResult(map);
        }
        return null;
    }

    /**
     * exec 包装单缴库
     *
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

            result = (String) call.invoke(new Object[]{ids});
            Map<String, String> resultMap = new HashMap<>();
            resultMap.put("result", result);

            String jsonStr = PdaService.MapToJson(resultMap);
            map.put("json", jsonStr);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), e.toString()));
        }
        return map;
    }

    private String getSflag(String json) {
        JSONArray jsonArray = JSON.parseArray(json.toUpperCase());
        JSONObject jsonObject = (JSONObject) jsonArray.get(0);
        String result = StringEscapeUtils.unescapeJava(JSON.toJSONString(jsonObject.get("RESULT")));
        System.out.println(result);
        String regex = "^" + "\"" + "*|" + "\"" + "*$";
        String regex1 = "\"\\[";
        String regex2 = "]\"";

        result = result.replaceAll(regex, "");
        result = result.replace("\"{", "{").replace("}\"", "}");
        result = result.replaceAll(regex1, "[").replaceAll(regex2, "]");

        JSONArray jsonArray1 = JSON.parseArray(result);

        String sflag = null;

        for (Iterator iterator = jsonArray1.iterator(); iterator.hasNext(); ) {
            JSONObject jo = (JSONObject) iterator.next();
            sflag = jo.get("SFLAG").toString();
            if (("N".equalsIgnoreCase(sflag)) && sflag == "N") {
                break;
            }
        }
        return sflag;
    }

    private String getMessage(String json) {
        JSONArray jsonArray = JSON.parseArray(json.toUpperCase());
        JSONObject jsonObject = (JSONObject) jsonArray.get(0);
        String result = StringEscapeUtils.unescapeJava(JSON.toJSONString(jsonObject.get("RESULT")));
        System.out.println(result);
        String regex = "^" + "\"" + "*|" + "\"" + "*$";
        String regex1 = "\"\\[";
        String regex2 = "]\"";

        result = result.replaceAll(regex, "");
        result = result.replace("\"{", "{").replace("}\"", "}");
        result = result.replaceAll(regex1, "[").replaceAll(regex2, "]");

        JSONArray jsonArray1 = JSON.parseArray(result);

        String sflag = null;
        String message = null;

        for (Iterator iterator = jsonArray1.iterator(); iterator.hasNext(); ) {
            JSONObject jo = (JSONObject) iterator.next();
            sflag = jo.get("SFLAG").toString();
            message = jo.get("MESSAGE").toString();
            if (("N".equalsIgnoreCase(sflag)) && sflag == "N") {
                break;
            }
        }
        return message;
    }

    private List<TProjectSapLogDetail> getSapLogDetail(String json){
        JSONArray jsonArray = JSON.parseArray(json.toUpperCase());
        JSONObject jsonObject = (JSONObject) jsonArray.get(0);
        String result = StringEscapeUtils.unescapeJava(JSON.toJSONString(jsonObject.get("RESULT")));
        System.out.println(result);
        String regex = "^" + "\"" + "*|" + "\"" + "*$";
        String regex1 = "\"\\[";
        String regex2 = "]\"";

        result = result.replaceAll(regex, "");
        result = result.replace("\"{", "{").replace("}\"", "}");
        result = result.replaceAll(regex1, "[").replaceAll(regex2, "]");

        JSONArray jsonArray1 = JSON.parseArray(result);

        String sflag = null;

        String js = JSONObject.toJSONString(jsonArray1, SerializerFeature.WriteClassName);

        List<TProjectSapLogDetail> collection = JSONObject.parseArray(js, TProjectSapLogDetail.class);//把字符串转换成集合

        return collection;
    }
}
