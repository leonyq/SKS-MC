package com.more.sap.mes.http;

import com.alibaba.fastjson.JSON;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.sap.intf.ItemLevelIntf;
import com.more.sap.intf.impl.ItemLevelIntfImpl;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import java.util.HashMap;
import java.util.Map;

/**
 * ZFM_MES_002_TEST 产品层级HTTP接口
 * @author:phantomsaber
 * @version:2019/7/28 22:17
 * @email:phantomsaber@foxmail.com
 * url: /mc/http/interface.ms?model=ItemLevelIntfHttp&method=ItemLevelIntfHttp
 **/
public class ItemLevelIntfHttp extends InterfaceLog implements IhttpServiceJosn {
    private final Log log = LogFactory.getLog(this.getClass());
    @Override
    public String exeFunc(HttpCoreService service) {
        Map<String, String> map = new HashMap<>();
        String funcName = "ZFM_MES_002";
        try {
            ItemLevelIntf itemLevelIntf = new ItemLevelIntfImpl();
            itemLevelIntf.exec(funcName,"");
        } catch (Exception e) {
            log.error(e);
        }
        map.put("flag", "success");
        return JSON.toJSONString(map);
    }
}
