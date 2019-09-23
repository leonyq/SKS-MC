package com.more.sap.mes.http;

import com.alibaba.fastjson.JSON;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.xml.soap.*;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import java.util.HashMap;
import java.util.Map;

/**
 * ZFM_MES_001_TEST 物料主数据接口 http
 * @author:phantomsaber
 * @version:2019/7/26 9:46
 * @email:phantomsaber@foxmail.com
 * url: https://skshu_21.morewiscloud.com/mc/http/interface.ms?model=ItemIntfImplHttp&method=sync
 **/
public class ItemIntfImplHttp extends InterfaceLog implements IhttpServiceJosn {
    private final Log log = LogFactory.getLog(this.getClass());
    private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
    private final String url = "http://phantomsaber.picp.io:53763/sks-ssm/webservice/ItemIntfImpl?wsdl";

    @Override
    public String exeFunc(HttpCoreService service) {
        try {
            // Create SOAP Connection
            SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
            SOAPConnection soapConnection = soapConnectionFactory.createConnection();

            SOAPMessage soapResponse = soapConnection.call(createSOAPRequest(), url);

            // Process the SOAP Response
            printSOAPResponse(soapResponse);

            soapConnection.close();
        } catch (Exception e) {
            System.err.println("Error occurred while sending SOAP Request to Server");
            e.printStackTrace();
        }
        Map<String, String> map = new HashMap<>();
        map.put("FLAG", "SUCCESS");
        return JSON.toJSONString(map);
    }

    private static SOAPMessage createSOAPRequest() throws Exception {
        String nameSpace = "http://cxf.temptation.cn/";
        String serviceName = "ItemIntf";

        MessageFactory messageFactory = MessageFactory.newInstance();
        SOAPMessage soapMessage = messageFactory.createMessage();
        SOAPPart soapPart = soapMessage.getSOAPPart();

        // SOAP Envelope
        SOAPEnvelope envelope = soapPart.getEnvelope();
        envelope.addNamespaceDeclaration("wsdl", nameSpace);

        // SOAP Body
        SOAPBody soapBody = envelope.getBody();
        SOAPElement soapBodyElem = soapBody.addChildElement("exec", "wsdl");
        MimeHeaders headers = soapMessage.getMimeHeaders();
//        headers.addHeader("SOAPAction", nameSpace  + serviceName);

        soapMessage.saveChanges();

        /* Print the request message */
        System.out.print("Request SOAP Message = ");
        soapMessage.writeTo(System.out);
        System.out.println();

        return soapMessage;
    }

    /**
     * Method used to print the SOAP Response
     */
    private static void printSOAPResponse(SOAPMessage soapResponse) throws Exception {
        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        Source sourceContent = soapResponse.getSOAPPart().getContent();
        System.out.print("\nResponse SOAP Message = ");
        StreamResult result = new StreamResult(System.out);
        transformer.transform(sourceContent, result);
    }
}
