package com.more.sap.mes;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.exception.BussException;
import com.sap.conn.jco.JCoDestination;
import com.sap.conn.jco.JCoDestinationManager;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * demo
 * @author:phantomsaber
 * @version:2019/7/26 11:24
 * @email:phantomsaber@foxmail.com
 **/
public class demo implements IJobx {
    private final Log log = LogFactory.getLog(this.getClass());

    /**
     * itemCode 物料号 MATNR
     */
    private static final String itemCode = "MATNR";
    /**
     * itemName 物料描述 MAKTX
     */
    private static final String itemName = "MAKTX";
    /**
     * stockCode 存货代码 ZSTOR
     */
    private static final String stockCode = "ZSTOR";
    /**
     * colorCode 调色号码 ZTONE
     */
    private static final String colorCode = "ZTONE";
    /**
     * levelGroup 产品层级 PRDHA
     */
    private static final String levelGroup = "PRDHA";

    /**
     * undefined2 预留2 ZRES2
     */
    private static final String undefined2 = "ZRES2";

    /**
     * grossWeight 毛重 BRGEW
     */
    private static final String grossWeight = "BRGEW";
    /**
     * netWeight 净重 NTGEW
     */
    private static final String netWeight = "NTGEW";
    /**
     * weightUnit 重量单位 GEWEI
     */
    private static final String weightUnit = "GEWEI";
    /**
     * baseUnit 基本单位 MEINS
     */
    private static final String baseUnit = "MEINS";
    /**
     * isDel X表示删除 LVORM
     */
    private static final String isDel = "LVORM";
    /**
     * isConfigurable 物料是否可配置 KZKFG
     */
    private static final String isConfigurable = "KZKFG";

    public void doExec(){
        String dateStr = "2019-07-02";

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        try {
            Date dateParse = dateFormat.parse(dateStr);
            String sysDate = dateTimeFormat.format(dateParse);
            Time sysTime = new Time((dateParse).getTime());

            JCoDestination destination = JCoDestinationManager.getDestination("ABAP_AS");
            JCoFunction function = destination.getRepository().getFunction("ZFM_MES_001");
//            JCoFunction function = RfcManager.getFunction("ZFM_MES_001");


            JCoParameterList exportParameterList = function.getExportParameterList();
            JCoParameterList tableParameterList = function.getTableParameterList();
            JCoParameterList importParameterList = function.getImportParameterList();

            JCoTable itOut = tableParameterList.getTable("IT_OUT");

            importParameterList.setValue("IV_DATE", sysDate);
            importParameterList.setValue("IV_TIME", sysTime);

            JCoTable itMatnr = tableParameterList.getTable("IT_MATNR");
            itMatnr.appendRow();
            itMatnr.setValue("SIGN", "I");
            itMatnr.setValue("OPTION", "CP");
            itMatnr.setValue("LOW", "*30011237*");
            itMatnr.setValue("HIGH", "");
            tableParameterList.setValue("IT_MATNR", itMatnr);
            function.execute(JCoDestinationManager.getDestination("ABAP_AS"));

            String sflag = exportParameterList.getString("SFLAG");
            String message = exportParameterList.getString("MESSAGE");

            System.out.println("SFLAG: >>> \n" + sflag);
            System.out.println("MESSAGE: >>> \n" + message);

            System.out.println("IT_OUT: >>> ");
            List<Map<String, String>> outList = new ArrayList<>();

            for (int i = 0; i < itOut.getNumRows(); i++) {
                Map<String, String> outMap = new HashMap<>();
                itOut.setRow(i);
                outMap.put("itemCode", itOut.getString(itemCode));
                outMap.put("itemName", itOut.getString(itemName));
                outMap.put("stockCode", itOut.getString(stockCode));
                outMap.put("colorCode", itOut.getString(colorCode));
                outMap.put("levelGroup", itOut.getString(levelGroup));
                outMap.put("undefined2", itOut.getString(undefined2));
                outMap.put("grossWeight", itOut.getString(grossWeight));
                outMap.put("netWeight", itOut.getString(netWeight));
                outMap.put("weightUnit", itOut.getString(weightUnit));
                outMap.put("baseUnit", itOut.getString(baseUnit));
                outMap.put("isDel", itOut.getString(isDel));
                outMap.put("isConfigurable", itOut.getString(isConfigurable));

                outList.add(outMap);
            }

            JSONArray ja = JSONArray.parseArray(JSON.toJSONString(outList));
            System.out.println(ja);

        } catch (Exception e) {
            log.error(e);
            throw new BussException(e.getMessage(), "");
        }
    }

    @Override
    public void exec(Args args) throws Exception {
        doExec();
    }
}
