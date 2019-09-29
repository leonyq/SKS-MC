package com.morelean.mcmes.accountCheck;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.mes.pda.service.PdaBaseServiceUtils;
import com.more.mes.pda.service.PdaService;
import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;

import javax.servlet.http.HttpServletRequest;
import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 新增包装-视图前执行类
 *
 * @author:phantomsaber
 * @version:2019/7/18 14:09
 * @email:phantomsaber@foxmail.com
 **/
public class projectAccountCheckSync implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

//    private final String host = "http://phantomsaber.picp.io:53763";
//    private final String host = "http://10.10.80.193:8080";

    private final String host = "http://localhost:8080";

    private final String checkPath = "/sks-wss-ssm/webservice/ProjectAccountCheckIntfImpl?wsdl";

    private final String checkUrl = host + checkPath;

    private final String funcName = "syncByProjectId";

    private final String paramName = "projectId";

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();

        String projectId = request.getParameter("PROJECT_ID");
        String getWsSql = " SELECT A.PROJECT_ID,A.WORK_SPACE FROM T_PM_PROJECT_BASE A WHERE 1=1 AND A.PROJECT_ID = ? ";

        Map wsMap = modelService.queryForMap(getWsSql, new Object[]{projectId});
        String workSpace = wsMap.get("WORK_SPACE").toString();

        Map<String, String> resMap = execAjaxByIds(projectId, checkUrl);

        modelAction.setDataMap(resMap);

        return BaseActionSupport.AJAX;
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
            Map<String, String> resultMap = new HashMap<>();

            result = (String) call.invoke(new Object[]{ids});

            result = result.replace("[", "").replace("]", "");

            if (result.length() > 0) {
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
}
