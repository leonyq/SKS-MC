package com.more.sap.mes.wss;

import com.alibaba.fastjson.JSON;
import com.more.fw.webservice.service.IWebService;

import javax.xml.ws.Endpoint;
import java.util.HashMap;
import java.util.Map;

/**
 * 工单新增下达接口 wss
 * @author:phantomsaber
 * @version:2019/7/31 17:00
 * @email:phantomsaber@foxmail.com
 **/
public class workOrderSynAddWss implements IWebService {

    private final String sflag = "SFLAG";
    private final String message = "MESSAGE";
    private final String Y = "Y";
    private final String N = "N";
    private final Map<String, String> flagMap = new HashMap<>();

    @Override
    public Map<String, Object> excute(Object... objects) {
        return null;
    }

    /**
     * 获取工单基本参数
     *
     * @param AUFNR  订单号
     * @param AUART  订单类型 AUART=ZP01/ZP02 TYPE=2 包装单;其它订单类型,TYPE=1 制造单
     * @param PLNBEZ 物品编码
     * @param GAMNG  生产数量
     * @param CHARG  生产批次
     * @param GSTRP  计划开始时间
     * @param GLTRP  计划结束时间
     * @param FTRMI  实际开始时间
     * @param TYPE   制造单/包装单 1:制造单;2:包装单
     * @param GMEIN  基本计量单位
     * @param LGORT  仓库
     * @return sflag Y/N
     */
    public Map<String,String> getOrderBase(String AUFNR, String AUART, String PLNBEZ, String GAMNG, String CHARG,
                               String GSTRP, String GLTRP, String FTRMI,
                               String TYPE, String GMEIN, String LGORT) {

        Map<String, String> reqMap = new HashMap<>();
        reqMap.put("AUFNR", AUFNR);
        reqMap.put("AUART", AUART);
        reqMap.put("PLNBEZ", PLNBEZ);
        reqMap.put("GAMNG", GAMNG);
        reqMap.put("CHARG", CHARG);
        reqMap.put("GSTRP", GSTRP);
        reqMap.put("GLTRP", GLTRP);
        reqMap.put("FTRMI", FTRMI);
        reqMap.put("TYPE", TYPE);
        reqMap.put("GMEIN", GMEIN);
        reqMap.put("LGORT", LGORT);
        String mapJson = JSON.toJSONString(reqMap);
        System.out.println("getOrderBase.mapJson: >>> " + mapJson);

        flagMap.put(sflag, Y);
        flagMap.put(message, Y);
        return flagMap;
    }

    /**
     * 获取工序参数
     *
     * @param AUFNR 订单号
     * @param VORNR 工序
     * @param ARBPL 工作中心
     * @param STEXT 工作中心描述
     * @param BMSCH 基本数量
     * @param VGW01 准备工时
     * @param VGW02 机器工时
     * @param VGW03 人工工时
     * @param VGE04 工时单位
     * @return sflag Y/N
     */
    public Map<String,String> getOrderProcess(String AUFNR, String VORNR, String ARBPL, String STEXT, String BMSCH,
                                  String VGW01, String VGW02, String VGW03, String VGE04) {
        Map<String, String> reqMap = new HashMap<>();
        reqMap.put("AUFNR", AUFNR);
        reqMap.put("VORNR", VORNR);
        reqMap.put("ARBPL", ARBPL);
        reqMap.put("STEXT", STEXT);
        reqMap.put("BMSCH", BMSCH);
        reqMap.put("VGW01", VGW01);
        reqMap.put("VGW02", VGW02);
        reqMap.put("VGW03", VGW03);
        reqMap.put("VGE04", VGE04);
        String mapJson = JSON.toJSONString(reqMap);
        System.out.println("getOrderProcess.mapJson: >>> " + mapJson);

        flagMap.put(sflag, Y);
        flagMap.put(message, Y);
        return flagMap;
    }

    /**
     * 获取预留参数字段
     *
     * @param AUFNR 订单号
     * @param POSNR 项目号
     * @param POSTP 项目类型
     * @param MATNR 组件
     * @param NOMNG 数量
     * @param MEINS 单位
     * @param WERKS 工厂
     * @param LGORT 库存地点
     * @param SORTF 排序字符串
     * @return sflag Y/N
     */
    public Map<String,String> getReserved(String AUFNR, String POSNR, String POSTP, String MATNR, String NOMNG,
                              String MEINS, String WERKS, String LGORT, String SORTF) {
        Map<String, String> reqMap = new HashMap<>();
        reqMap.put("AUFNR", AUFNR);
        reqMap.put("POSNR", POSNR);
        reqMap.put("POSTP", POSTP);
        reqMap.put("MATNR", MATNR);
        reqMap.put("NOMNG", NOMNG);
        reqMap.put("MEINS", MEINS);
        reqMap.put("WERKS", WERKS);
        reqMap.put("LGORT", LGORT);
        reqMap.put("SORTF", SORTF);
        String mapJons = JSON.toJSONString(reqMap);
        System.out.println("getReserved.mapJons: >>> " + mapJons);
        flagMap.put(sflag, Y);
        flagMap.put(message, Y);
        return flagMap;
    }

    /**
     * KDAUF	销售订单号
     * KDPOS	行项目
     * KDEIN	交货计划行
     * VDATU	交货日期
     * EDATU	1交货日期
     * KUNNR	订货方
     * NAME1	订货方描述
     * ORT01	订货城市
     * ZTEXT	BOM文本
     * @return  sflag Y/N
     */
    public Map<String,String> getSalesOrder(String KDAUF, String KDPOS, String KDEIN, String VDATU, String EDATU,
                                String KUNNR, String NAME1, String ORT01, String ZTEXT) {
        String sflag = Y;
        Map<String, String> reqMap = new HashMap<>();
        reqMap.put("KDAUF", KDAUF);
        reqMap.put("KDPOS", KDPOS);
        reqMap.put("KDEIN", KDEIN);
        reqMap.put("VDATU", VDATU);
        reqMap.put("EDATU", EDATU);
        reqMap.put("KUNNR", KUNNR);
        reqMap.put("NAME1", NAME1);
        reqMap.put("ORT01", ORT01);
        reqMap.put("ZTEXT", ZTEXT);
        String mapJson = JSON.toJSONString(reqMap);
        System.out.println("getSalesOrder.mapJson: >>> " + mapJson);
        flagMap.put(sflag, Y);
        flagMap.put(message, Y);
        return flagMap;
    }

    /**
     * @param AUFNR  订单号
     * @param AUART  订单类型
     * @param PLNBEZ 物品编码
     * @param GAMNG  生产数量
     * @param CHARG  生产批次
     * @param GSTRP  计划开始时间
     * @param GLTRP  计划结束时间
     * @param FTRMI  实际开始时间
     * @param TYPE   制造单/包装单
     * @param GMEIN  单位
     * @param LGORT  仓库
     * @param VORNR  工序
     * @param ARBPL  工作中心
     * @param STEXT  工作中心描述
     * @param BMSCH  基本数量
     * @param VGW01  准备工时
     * @param VGW02  机器工时
     * @param VGW03  人工工时
     * @param VGE04  工时单位
     * @param POSNR  项目号
     * @param POSTP  项目类型
     * @param MATNR  组件
     * @param NOMNG  数量
     * @param MEINS  单位
     * @param WERKS  工厂
     * @param SORTF  排序字符串
     * @param KDAUF  销售订单号
     * @param KDPOS  行项目
     * @param KDEIN  交货计划行
     * @param VDATU  交货日期
     * @param EDATU  1交货日期
     * @param KUNNR  订货方
     * @param NAME1  订货方描述
     * @param ORT01  订货城市
     * @param ZTEXT  BOM文本
     * @return sflag Y/N
     */
    public Map<String, String> getOrderAllParam(String AUFNR, String AUART, String PLNBEZ, String GAMNG, String CHARG, String GSTRP, String GLTRP, String FTRMI, String TYPE, String GMEIN, String LGORT,
                                   String VORNR, String ARBPL, String STEXT, String BMSCH, String VGW01, String VGW02, String VGW03, String VGE04,
                                   String POSNR, String POSTP, String MATNR, String NOMNG, String MEINS, String WERKS, String SORTF,
                                   String KDAUF, String KDPOS, String KDEIN, String VDATU, String EDATU, String KUNNR, String NAME1, String ORT01, String ZTEXT) {
        Map<String, String> reqMap = new HashMap<>();
        reqMap.put("AUFNR", AUFNR);
        reqMap.put("AUART", AUART);
        reqMap.put("PLNBEZ", PLNBEZ);
        reqMap.put("GAMNG", GAMNG);
        reqMap.put("CHARG", CHARG);
        reqMap.put("GSTRP", GSTRP);
        reqMap.put("GLTRP", GLTRP);
        reqMap.put("FTRMI", FTRMI);
        reqMap.put("TYPE", TYPE);
        reqMap.put("GMEIN", GMEIN);
        reqMap.put("LGORT", LGORT);

        reqMap.put("VORNR", VORNR);
        reqMap.put("ARBPL", ARBPL);
        reqMap.put("STEXT", STEXT);
        reqMap.put("BMSCH", BMSCH);
        reqMap.put("VGW01", VGW01);
        reqMap.put("VGW02", VGW02);
        reqMap.put("VGW03", VGW03);
        reqMap.put("VGE04", VGE04);

        reqMap.put("POSNR", POSNR);
        reqMap.put("POSTP", POSTP);
        reqMap.put("MATNR", MATNR);
        reqMap.put("NOMNG", NOMNG);
        reqMap.put("MEINS", MEINS);
        reqMap.put("WERKS", WERKS);
        reqMap.put("SORTF", SORTF);

        reqMap.put("KDAUF", KDAUF);
        reqMap.put("KDPOS", KDPOS);
        reqMap.put("KDEIN", KDEIN);
        reqMap.put("VDATU", VDATU);
        reqMap.put("EDATU", EDATU);
        reqMap.put("KUNNR", KUNNR);
        reqMap.put("NAME1", NAME1);
        reqMap.put("ORT01", ORT01);
        reqMap.put("ZTEXT", ZTEXT);

        String mapJson = JSON.toJSONString(reqMap);
        System.out.println("getOrderAllParam.mapJson: >>> " + mapJson);
        flagMap.put(sflag, Y);
        flagMap.put(message, Y);
        return flagMap;
    }

    /**
     * 认证
     */
    public static void checkHesder() {

    }


    public static void main(String[] args) {
        /**
         * 参数1：服务的发布地址
         * 参数2：服务的实现者
         * Endpoint 会重新启动一个线程
         */
        Endpoint.publish("http://localhost:8080/wss/services/VoidWss", new workOrderSynAddWss());
        System.out.println("------- 服务启动成功! --------- ");
    }
}
