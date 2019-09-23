package com.morelean.sap.intf.impl;

import com.more.fw.core.common.method.*;
import com.morelean.sap.comm.RfcManager;
import com.morelean.sap.intf.ItemIntf;
import com.morelean.sap.intf.comm.impl.SapCommIntfImpl;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 物料信息同步接口实现类
 *
 * @author:phantomsaber
 * @version:2019/7/25 9:33
 * @email:phantomsaber@foxmail.com
 **/
public class ItemIntfImpl extends SapCommIntfImpl implements ItemIntf {

    /**
     * 接口执行方法
     */
    @Override
    public void exec(String funcName,String syncItemCode) {
//        String funcName = "ZFM_MES_001";
//        String syncItemCode = "30011237";

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String curDate = dateTimeFormat.format(new Date());
        Time curTime = new Time((new Date()).getTime());

//        Date curDate = DateUtil.getCurDate();
//        Time curTime = new Time(curDate.getTime());
//        JCoFunction function = getFunction(funcName);

        JCoFunction function = RfcManager.getFunction(funcName);

        /*-- version:2019/7/25 15:09 | desc:import --*/
        JCoParameterList importParameterList = function.getImportParameterList();
        importParameterList.setValue("IV_DATE", curDate);
        importParameterList.setValue("IV_TIME", curTime);

        /*-- version:2019/7/25 15:10 | desc:tables --*/
        JCoParameterList tableParameterList = function.getTableParameterList();

        JCoTable itOut = tableParameterList.getTable("IT_OUT");

        JCoTable itMatnr = tableParameterList.getTable("IT_MATNR");
        itMatnr.appendRow();
        itMatnr.setValue("SIGN", "I");
        itMatnr.setValue("OPTION", "CP");
        itMatnr.setValue("LOW", "*"+syncItemCode+"*");
        itMatnr.setValue("HIGH", "");

        tableParameterList.setValue("IT_MATNR", itMatnr);
        RfcManager.execute(function);

        JCoParameterList exportParameterList = function.getExportParameterList();
        String sflag = exportParameterList.getString("SFLAG");
        String message = exportParameterList.getString("MESSAGE");

        Map<String, String> logMap = new HashMap<>();
        logMap.put("DATA_AUTH", "");
        logMap.put("RL_FUNC_NAME", funcName);
        logMap.put("RL_FLAG", sflag);
        logMap.put("RL_MESSAGE", message);
        logMap.put("RL_IMPORT", importParameterList.toString());
        logMap.put("RL_EXPORT", exportParameterList.toString());
        logMap.put("RL_CHANGING", "");
        logMap.put("RL_TABLES", tableParameterList.toString());
        logMap.put("RL_EXCEPTIONS", "");
        logMap.put("RL_SY_ERROR", "");

//        MsHTranMan hbtran = BussService.getHbTran();
        try {
            if("Y".equalsIgnoreCase(sflag)){
                Map<String, String> outMap = new HashMap<>();
                for (int i = 0; i < itOut.getNumRows(); i++) {
                    itOut.setRow(i);
                    outMap.put(getItemCode(), itOut.getString(getItemCode()));
                    outMap.put(getItemName(), itOut.getString(getItemName()));
                    outMap.put(getStockCode(), itOut.getString(getStockCode()));
                    outMap.put(getColorCode(), itOut.getString(getColorCode()));
                    outMap.put(getLevelGroup(), itOut.getString(getLevelGroup()));
                    outMap.put(getUndefined2(), itOut.getString(getUndefined2()));
                    outMap.put(getGrossWeight(), itOut.getString(getGrossWeight()));
                    outMap.put(getNetWeight(), itOut.getString(getNetWeight()));
                    outMap.put(getWeightUnit(), itOut.getString(getWeightUnit()));
                    outMap.put(getBaseUnit(), itOut.getString(getBaseUnit()));
                    outMap.put(getIsDel(), itOut.getString(getIsDel()));
                    outMap.put(getIsConfigurable(), itOut.getString(getIsConfigurable()));

                    saveItem(outMap);
                }
                saveLog(logMap);
//                hbtran.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
            logMap.put("RL_SY_ERROR", e.getMessage());
            saveLog(logMap);
//            hbtran.rollback();
        }

    }

    /**
     * 保存物料信息
     * @param paraMap
     * @return
     */
    @Override
    public Boolean saveItem(Map<String, String> paraMap) {
        Boolean flag = true;

        /**
         * itemCode 物料号 MATNR
         */
        String itemCode = paraMap.get(getItemCode());

        /**
         * itemName 物料描述 MAKTX
         */
        String itemName = paraMap.get(getItemName());

        /**
         * stockCode 存货代码 ZSTOR
         */
        String stockCode = paraMap.get(getStockCode());

        /**
         * colorCode 调色号码 ZTONE
         */
        String colorCode = paraMap.get(getColorCode());

        /**
         * levelGroup 产品层级 PRDHA
         */
        String levelGroup = paraMap.get(getLevelGroup());

        /**
         * undefined2 预留2 ZRES2
         */
        String undifined2 = paraMap.get(getUndefined2());

        /**
         * grossWeight 毛重 BRGEW
         */
        String grossWeight = paraMap.get(getGrossWeight());

        /**
         * netWeight 净重 NTGEW
         */
        String netWeight = paraMap.get(getNetWeight());

        /**
         * weightUnit 重量单位 GEWEI
         */
        String weightUnit = paraMap.get(getWeightUnit());

        /**
         * baseUnit 基本单位 MEINS
         */
        String baseUnit = paraMap.get(getBaseUnit());

        /**
         * isDel X表示删除 LVORM
         */
        String isDel = paraMap.get(getIsDel());

        /**
         * isConfigurable 物料是否可配置 KZKFG
         */
        String isConfigurable = paraMap.get(getIsConfigurable());

//        MsHTranMan hbtran = BussService.getHbTran();

        String insertItemSql = "INSERT INTO T_CO_ITEM " +
                "  (ID,DEPT_ID,CREATE_USER,CREATE_TIME,EDIT_USER,EDIT_TIME,DATA_AUTH," +
                "  CI_ITEM_CODE,CI_ITEM_NAME,CI_ITEM_SPEC,CI_UNIT,CI_MEMO,CI_GROUP_ID,STOCK_CODE," +
                "  SAP_WEIGHT_UNIT,SAP_IS_DEL,SAP_BASE_UNIT,SAP_COLOR_CODE,SAP_LEVEL_GROUP,SAP_GROSS_WEIGHT,SAP_NET_WEIGHT,SAP_IS_CONFIG) " +
                "VALUES " +
                "  ('','','','','','',''," +
                "  '','','','','','','','','','','','','','','')";
        try {
/*
            TableDataMapExt dataMapExt = new TableDataMapExt();
            dataMapExt.setTableName("T_CO_ITEM");
            dataMapExt.getColMap().put("ID", StringUtils.getUUID());
            dataMapExt.getColMap().put("DEPT_ID", "");
            dataMapExt.getColMap().put("CREATE_USER", "");
            dataMapExt.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
            dataMapExt.getColMap().put("EDIT_USER", "");
            dataMapExt.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
            dataMapExt.getColMap().put("DATA_AUTH", "");

            dataMapExt.getColMap().put("CI_ITEM_CODE", itemCode);
            dataMapExt.getColMap().put("CI_ITEM_NAME", itemName);
            dataMapExt.getColMap().put("CI_ITEM_SPEC", itemName);
            dataMapExt.getColMap().put("CI_UNIT", baseUnit);
            dataMapExt.getColMap().put("CI_MEMO", itemName);
            dataMapExt.getColMap().put("CI_GROUP_ID", levelGroup);
            dataMapExt.getColMap().put("STOCK_CODE", stockCode);

            dataMapExt.getColMap().put("SAP_WEIGHT_UNIT", weightUnit);
            dataMapExt.getColMap().put("SAP_IS_DEL", isDel);
            dataMapExt.getColMap().put("SAP_BASE_UNIT", baseUnit);
            dataMapExt.getColMap().put("SAP_COLOR_CODE", colorCode);
            dataMapExt.getColMap().put("SAP_LEVEL_GROUP", levelGroup);
            dataMapExt.getColMap().put("SAP_GROSS_WEIGHT", grossWeight);
            dataMapExt.getColMap().put("SAP_NET_WEIGHT", netWeight);
            dataMapExt.getColMap().put("SAP_IS_CONFIG", isConfigurable);

            CommMethod.getBaseService().save(dataMapExt);
//            hbtran.commit();
*/

            CommMethod.getBaseService().execSql(insertItemSql,new Object[]{StringUtils.getUUID(),"",DateUtil.getCurDate(),"",DateUtil.getCurDate(),"",
                    itemCode,itemName,itemName,baseUnit,itemName,levelGroup,stockCode,
                    weightUnit,isDel,baseUnit,colorCode,levelGroup,grossWeight,netWeight,isConfigurable
            });
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
//            hbtran.rollback();
        }
        return flag;
    }

    @Override
    public Boolean saveLog(Map<String, String> paraMap) {
        return super.saveLog(paraMap);
    }

    @Override
    public JCoTable setImport(String funcName, Map<String, String> paraMap) {
        return super.setImport(funcName, paraMap);
    }

    @Override
    public JCoTable setTables(String funcName, Map<String, String> paraMap) {
        return super.setTables(funcName, paraMap);
    }

    @Override
    public JCoTable getImport(String funcName, Map<String, String> paraMap) {
        return super.getImport(funcName, paraMap);
    }

    @Override
    public JCoTable getExport(String funcName, Map<String, String> paraMap) {
        return super.getExport(funcName, paraMap);
    }

    @Override
    public JCoTable getTables(String tablesName, Map<String, String> paraMap) {
        return super.getTables(tablesName, paraMap);
    }
}
