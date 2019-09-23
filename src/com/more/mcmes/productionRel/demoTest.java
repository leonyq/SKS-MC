package com.more.mcmes.productionRel;

import com.sun.xml.internal.xsom.impl.scd.Iterators;
import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;

import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import javax.xml.rpc.ServiceException;
import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.Map;

public class demoTest extends org.apache.axis.client.Stub {

    public static void main(String[] args){
        String address = "http://localhost:8080/sks-ssm/webservice/ProjectPostPackIntfImpl?wsdl";
        JaxWsProxyFactoryBean bean = new JaxWsProxyFactoryBean();
        bean.setAddress(address);

        Service service = new Service();
        Call call = null;
        try {
            call = (Call) service.createCall();
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        call.setTargetEndpointAddress(address);
        QName qName = new QName("http://cxf.temptation.cn/", "ajaxExecList");
        call.setOperationName(qName);
        call.setUseSOAPAction(true);
        //这下面两行一定要加上，否则接收在服务器端收不到。
        call.addParameter("ids", XMLType.XSD_STRING, ParameterMode.IN);
        call.setReturnType(XMLType.XSD_STRING);
        String result = null;

        Map<String, String> MesIdList = new HashMap<>();
        MesIdList.put("ids", "111");
        try {
            result = (String) call.invoke(new Object[]{"111"});
        } catch (RemoteException e) {
            System.out.println(e.getMessage());
        }
        System.out.println(result);
    }
}
