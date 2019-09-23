package com.more.mcmes.productionRel;

import java.util.HashMap;

/**
 * 模拟soapUI调用WebService,解析返回报文
 * Created by PengHongfu 2018-04-26 15:36
 */
public class TestSoap {
    public static void main(String[] args) {
        WebServiceClient ws = new WebServiceClient(
                "http://cxf.temptation.cn/",
                "http://localhost:8080/sks-ssm/webservice/ItemIntfImpl?wsdl",
                "ItemIntf", "exec",
                "exec", "exec");
        HashMap<String, String> inMsg = new HashMap<String, String>();
        try {
            String ret = ws.sendMessage(inMsg);
            System.out.println(ret);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
