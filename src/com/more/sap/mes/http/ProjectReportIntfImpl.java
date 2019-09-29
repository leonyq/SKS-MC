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
 * 工时报工
 *
 * @author:phantomsaber
 * @version:2019/8/14 12:12
 * @email:phantomsaber@foxmail.com
 **/
public class ProjectReportIntfImpl extends InterfaceLog implements IhttpServiceJosn {
    private final Log log = LogFactory.getLog(this.getClass());
    private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

//    private final String host = "http://phantomsaber.picp.io:53763";
     private final String host = "http://10.10.80.193:8080";
//    private final String host = "http://localhost:8080";

    private final String reportPath = "/sks-wss-ssm/webservice/ProjectReportIntfImpl?wsdl";
    private final String reportUrl = host + reportPath;

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

            for (String cur : dataIdList) {
                Map<String, String> reportMap = execAjaxByIds(dataIdJson, reportUrl);
                if("datagrid-title-ajax".equals(cur)){
                    break;
                }
                String sflag = null;
                String message = null;
                try {
                    sflag = getSflag(reportMap.get("json"));
                    message = getMessage(reportMap.get("json"));
                } catch (Exception e) {
                    sflag = "N";
                    message = reportMap.get("json");
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

    private Map<String,String> analysisJson(String json){
        Map<String, String> jsonMap = new HashMap<>();
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

        String sflag = null;
        String message = null;

        try {
            JSONArray jsonArray1 = JSON.parseArray(result);
            for (Iterator iterator = jsonArray1.iterator(); iterator.hasNext(); ) {
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
            for (Iterator iterator = jsonArray1.iterator(); iterator.hasNext(); ) {
                JSONObject jo = (JSONObject) iterator.next();
                sflag = jo.get("SFLAG").toString();
                message = jo.get("MESSAGE").toString();
                if (("N".equalsIgnoreCase(sflag)) && sflag == "N") {
                    break;
                }
            }
        }
        jsonMap.put("SFLAG", sflag);
        jsonMap.put("MESSAGE", message);
        return jsonMap;
    }

    private String getSflag(String json) {
        return analysisJson(json).get("SFLAG");
    }

    private String getMessage(String json) {
        return analysisJson(json).get("MESSAGE");
    }
}
