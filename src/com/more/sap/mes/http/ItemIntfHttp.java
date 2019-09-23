package com.more.sap.mes.http;

import com.alibaba.fastjson.JSON;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.sap.intf.ItemIntf;
import com.more.sap.intf.impl.ItemIntfImpl;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * ZFM_MES_001_TEST 物料主数据接口 http
 * @author:phantomsaber
 * @version:2019/7/26 9:46
 * @email:phantomsaber@foxmail.com
 * url: /mc/http/interface.ms?model=ItemIntfHttp&method=sync
 **/
public class ItemIntfHttp extends InterfaceLog implements IhttpServiceJosn {
    private final Log log = LogFactory.getLog(this.getClass());
    private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

    @Override
    public String exeFunc(HttpCoreService service) {
        Map<String, String> map = new HashMap<>();
        String funcName = "ZFM_MES_001";
        String[] itemCodeArr = new String[]{"100000011","100000012","100000015","100000027","100000036","100000069","100000076","100000085","100000087","100000095","100000096","100000100","100000109","100000120","100000121","100000124","100000141","100000152","100000253","100000256","100000260","100000261","100000264","100000278","100000313","100000911","100001009","100001010","100001075","100001081","100001095","100001128","100001167","100001173","100001216","100001270","100001348","100001350","100001357","100001378","100001397","100001435","100001485","100001549","100001558","100001564","100001620","100001621","100001755","100001788","100001790","100001837","100001838","100002058","100002131","100002160","100002290","100002321","100002412","100002436","100002468","100002799","100002920","100002921","300000546","300005762","300005763","300005764","300005772","300018673","300018674","300041120","300052720","300061745","300062412","300063717","300069681","300069682","300078337","300078473","300079633","300082676","300082677","300082887","300089468","300093895","300100363","300102736","300109211","300112489","300115022","300115605","500040261","500048361","500054712","500065370","500065437","500066175","500066546","500068099","500068100","500068237","500072297","500075099","500078895","500080339","500084211","500086200","500087657","500088082"};
        try {
            ItemIntf itemIntf = new ItemIntfImpl();
            for(String cur:itemCodeArr){
                itemIntf.exec(funcName, cur);
            }
        } catch (Exception e) {
            throw new BussException();
        }
        map.put("flag", "success");
        return JSON.toJSONString(map);
    }
}
