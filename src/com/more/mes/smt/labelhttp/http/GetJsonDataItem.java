package com.more.mes.smt.labelhttp.http;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.core.common.method.StringUtils;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.labelhttp.service.LabelInfoService;

public class GetJsonDataItem extends InterfaceLog implements IhttpServiceJosn {
    //

    /**
     * @param arg0
     * @param arg1
     * @return
     * @see com.more.fw.core.dbo.model.dao.BaseDao#find(java.lang.String, java.lang.Object[])
     */
    public List find(String arg0, Object... arg1) {
        // TODO Auto-generated method stub
        return null;
    }

    /**
     * @param arg0
     * @param arg1
     * @param arg2
     * @return
     * @see com.more.fw.core.dbo.model.dao.BaseDao#find
     * (org.springframework.orm.hibernate3.HibernateTemplate, java.lang.String,
     * java.lang.Object[])
     */
    public List find(HibernateTemplate arg0, String arg1, Object... arg2) {
        // TODO Auto-generated method stub
        return null;
    }

    /**
     * 获取打印数据项接口
     *
     * @param service
     * @return
     */
    @Override
    public String exeFunc(HttpCoreService service) {
        String itemSn = "";
        String labelId = "";
        String labelDetailId = "";
        String dataAuth = "";
        String rawLicenseSn = "";
        String weightNum = "";
        itemSn = StringUtils.toString(service.getParamTo().get("itemSn"));
        rawLicenseSn = StringUtils.toString(service.getParamTo().get("rawLicenseSn"));
        weightNum = StringUtils.toString(service.getParamTo().get("weightNum"));

        labelId = StringUtils.toString(service.getParamTo().get("labelId"));
        labelDetailId = StringUtils.toString(service.getParamTo().get("labelDetailId"));

        dataAuth = StringUtils.toString(service.getParamTo().get("dataAuth"));
        LabelInfoService lis = new LabelInfoService();

        JSONArray json = new JSONArray();

//    List list = lis.getDataItem(labelId, itemSn, dataAuth);
        List list = lis.getDataItemNew(itemSn, rawLicenseSn, weightNum, labelId,labelDetailId, dataAuth);

        if (list != null && !list.isEmpty()) {
            json = JSONArray.fromObject(list);
        }

        Map map = new HashMap();
        map.put("json", json);
        service.setResult(map);

        service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
        service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
        service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
        return null;
    }

}
