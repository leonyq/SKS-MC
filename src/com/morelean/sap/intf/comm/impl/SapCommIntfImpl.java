package com.morelean.sap.intf.comm.impl;

import com.more.fw.core.common.method.*;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.morelean.sap.comm.RfcManager;
import com.morelean.sap.intf.comm.SapCommIntf;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoTable;

import java.util.Map;

public class SapCommIntfImpl implements SapCommIntf {

    private Boolean flag = true;
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

    @Override
    public void exec(String funcName,String syncItemCode) {

    }

    @Override
    public JCoFunction getFunction(String funcName) {
        return RfcManager.getFunction(funcName);
    }

    @Override
    public Boolean saveLog(Map<String, String> paraMap) {
/*
        M_DATA_AUTH      IN VARCHAR2, --组织机构
        M_FUNC_NAME      IN VARCHAR2, --接口名称
        M_FLAG           IN VARCHAR2, --同步结果
        M_MESSAGE        IN VARCHAR2, --同步描述
        M_IMPORT         IN VARCHAR2, --SAP import 数据
        M_EXPORT         IN VARCHAR2, --SAP export 数据
        M_CHANGING       IN VARCHAR2, --SAP changing 数据
        M_TABLES         IN VARCHAR2, --SAP table 数据
        M_EXCEPTIONS     IN VARCHAR2, --SAP exceptions 数据
        M_SY_ERROR       IN VARCHAR2, --系统异常信息
*/


        String dataAuth = paraMap.get("DATA_AUTH");
        String rlFuncName = paraMap.get("RL_FUNC_NAME");
        String rlFlag = paraMap.get("RL_FLAG");
        String rlMessage = paraMap.get("RL_MESSAGE");
        String rlImport = paraMap.get("RL_IMPORT");
        String rlExport = paraMap.get("RL_EXPORT");
        String rlChanging = paraMap.get("RL_CHANGING");
        String rlTables = paraMap.get("RL_TABLES");
        String rlExceptions = paraMap.get("RL_EXCEPTIONS");
        String rlSyError = paraMap.get("RL_SY_ERROR");

        MsHTranMan hbtran = BussService.getHbTran();
        try {
            TableDataMapExt dataMapExt = new TableDataMapExt();
            dataMapExt.setTableName("T_RFC_LOG");
//            CommMethod.addSysDefCol(dataMapExt.getColMap(), modelAction.getUser());

            dataMapExt.getColMap().put("ID", StringUtils.getUUID());
            dataMapExt.getColMap().put("DEPT_ID", "");
            dataMapExt.getColMap().put("CREATE_USER", "");
            dataMapExt.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
            dataMapExt.getColMap().put("EDIT_USER", "");
            dataMapExt.getColMap().put("EDIT_TIME", "");
            dataMapExt.getColMap().put("DATA_AUTH", dataAuth);

            dataMapExt.getColMap().put("RL_FUNC_NAME", rlFuncName);
            dataMapExt.getColMap().put("RL_FLAG", rlFlag);
            dataMapExt.getColMap().put("RL_MESSAGE", rlMessage);
            dataMapExt.getColMap().put("RL_IMPORT", rlImport);
            dataMapExt.getColMap().put("RL_EXPORT", rlExport);
            dataMapExt.getColMap().put("RL_CHANGING", rlChanging);
            dataMapExt.getColMap().put("RL_TABLES", rlTables);
            dataMapExt.getColMap().put("RL_EXCEPTIONS", rlExceptions);
            dataMapExt.getColMap().put("RL_SY_ERROR", rlSyError);

//            modelService.save(dataMapExt);
            CommMethod.getBaseService().save(dataMapExt);
            hbtran.commit();
            flag = true;
        } catch (Exception e) {
            flag = false;
            e.printStackTrace();
            hbtran.rollback();
        }
        return flag;
    }

    @Override
    public JCoTable setImport(String funcName, Map<String, String> paraMap) {
        return null;
    }

    @Override
    public JCoTable setTables(String funcName, Map<String, String> paraMap) {
        return null;
    }

    @Override
    public JCoTable getImport(String funcName, Map<String, String> paraMap) {
        return null;
    }

    @Override
    public JCoTable getExport(String funcName, Map<String, String> paraMap) {
        return null;
    }

    @Override
    public JCoTable getChanging(String funcName, Map<String, String> paraMap) {
        return null;
    }

    @Override
    public JCoTable getTables(String tablesName, Map<String, String> paraMap) {
        return null;
    }

    @Override
    public JCoTable getExceptions(String funcName, Map<String, String> paraMap) {
        return null;
    }


    public static String getItemCode() {
        return itemCode;
    }

    public static String getItemName() {
        return itemName;
    }

    public static String getStockCode() {
        return stockCode;
    }

    public static String getColorCode() {
        return colorCode;
    }

    public static String getLevelGroup() {
        return levelGroup;
    }

    public static String getUndefined2() {
        return undefined2;
    }

    public static String getGrossWeight() {
        return grossWeight;
    }

    public static String getNetWeight() {
        return netWeight;
    }

    public static String getWeightUnit() {
        return weightUnit;
    }

    public static String getBaseUnit() {
        return baseUnit;
    }

    public static String getIsDel() {
        return isDel;
    }

    public static String getIsConfigurable() {
        return isConfigurable;
    }
}
