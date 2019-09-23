package com.more.sap.intf.comm.impl;

import bsh.StringUtil;
import com.more.fw.core.common.method.*;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.sap.comm.RfcManager;
import com.more.sap.intf.comm.SapCommIntf;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoTable;

import java.util.HashMap;
import java.util.Map;

/**
 * SAP通用接口父级实现类
 * @author:phantomsaber
 * @version:2019/7/26 16:37
 * @email:phantomsaber@foxmail.com
 **/
public class SapCommIntfImpl implements SapCommIntf {

    private Boolean flag = true;

//--------------------------------------------------------------
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

//--------------------------------------------------------------

    /**
     * levelCode 产品层次 PRODH
     */
    private static final String levelCode = "PRODH";

    /**
     * levelNo 产品层次中的层号 STUFE
     */
    private static final String levelNo = "STUFE";

    /**
     * levelDesc 描述 VTEXT
     */
    private static final String levelDesc = "VTEXT";

    /**
     * levelEnd 是否最末级(1:最末级;0:非最末级) ENDH
     */
    private static final String levelEnd = "ENDH";

    /**
     * levelDataOpt 数据处理方式(A-新增;M-修改;D-删除) METHOD
     */
    private static final String levelDataOpt = "METHOD";

//--------------------------------------------------------------

    @Override
    public void exec(String funcName, String syncItemCode) {

    }

    /**
     * 获取 JCoFunction
     *
     * @param funcName
     * @return
     */
    @Override
    public JCoFunction getFunction(String funcName) {
        return RfcManager.getFunction(funcName);
    }

    /**
     * 去除料号第一个非0字符前的0
     *
     * @param itemCode 料号
     * @return
     */
    @Override
    public String getItemCodeFormatZero(String itemCode) {
        return itemCode.replaceAll("^(0+)", "");
    }

    /**
     * 保存接口日志
     *
     * @param paraMap{DATA_AUTH,RL_FUNC_NAME,RL_FLAG,RL_MESSAGE,RL_IMPORT,RL_EXPORT,RL_CHANGING,RL_CHANGING,RL_TABLES,RL_EXCEPTIONS,RL_SY_ERROR}
     * DATA_AUTH        --组织机构
     * RL_FUNC_NAME     --接口名称
     * RL_FLAG          --同步结果
     * RL_MESSAGE       --同步描述
     * RL_IMPORT        --SAP import 数据
     * RL_EXPORT        --SAP export 数据
     * RL_CHANGING      --SAP changing 数据
     * RL_TABLES        --SAP table 数据
     * RL_EXCEPTIONS    --SAP exceptions 数据
     * RL_SY_ERROR      --系统异常信息
     *
     */
    @Override
    public Boolean saveLog(Map<String, String> paraMap) {
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
            dataMapExt.getColMap().put("ID", StringUtils.getUUID());
            dataMapExt.getColMap().put("DEPT_ID", "1");
            dataMapExt.getColMap().put("CREATE_USER", "2a60fc3ebc344a7eae9dea50bfcfc528");
            dataMapExt.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
            dataMapExt.getColMap().put("EDIT_USER", "");
            dataMapExt.getColMap().put("EDIT_TIME", "");
            dataMapExt.getColMap().put("DATA_AUTH", "FA174AFF136D496A87B65443D22357E3");

            dataMapExt.getColMap().put("RL_FUNC_NAME", rlFuncName);
            dataMapExt.getColMap().put("RL_FLAG", rlFlag);
            dataMapExt.getColMap().put("RL_MESSAGE", rlMessage);
            dataMapExt.getColMap().put("RL_IMPORT", rlImport);
            dataMapExt.getColMap().put("RL_EXPORT", rlExport);
            dataMapExt.getColMap().put("RL_CHANGING", rlChanging);
            dataMapExt.getColMap().put("RL_TABLES", rlTables);
            dataMapExt.getColMap().put("RL_EXCEPTIONS", rlExceptions);
            dataMapExt.getColMap().put("RL_SY_ERROR", rlSyError);
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
    public Map<String, String> getOutMap(JCoTable itOut) {
        return null;
    }

    /**
     * 生成日志参数map
     * @param function
     * @return
     */
    @Override
    public Map<String, String> getLogMap(JCoFunction function,Exception e) {
        Map<String, String> logMap = new HashMap<>();
        logMap.put("DATA_AUTH", "");
        logMap.put("RL_FUNC_NAME", function.getName());

        try{
            logMap.put("RL_FLAG", function.getImportParameterList().getString("SFLAG"));

        }catch (Exception e1){
            logMap.put("RL_FLAG", "");
        }

        try{
            logMap.put("RL_MESSAGE", function.getExportParameterList().getString("MESSAGE"));
        }catch (Exception e1){
            logMap.put("RL_MESSAGE", "");
        }

        try {
            logMap.put("RL_IMPORT", function.getImportParameterList().toString());
        }catch (Exception e1){
            logMap.put("RL_IMPORT", "");
        }

        try {
            logMap.put("RL_EXPORT", function.getExportParameterList().toString().replaceAll("-","").replaceAll("\\|",""));
        } catch (Exception e1) {
            logMap.put("RL_EXPORT", "");
        }
        try {
            logMap.put("RL_CHANGING", function.getChangingParameterList().toString());
        } catch (Exception e1) {
            logMap.put("RL_CHANGING", "");
        }
        try {
            logMap.put("RL_TABLES", function.getTableParameterList().toString());
        } catch (Exception e1) {
            logMap.put("RL_TABLES", "");
        }
        try {
            logMap.put("RL_EXCEPTIONS", function.getExceptionList().toString());
        } catch (Exception e1) {
            logMap.put("RL_EXCEPTIONS", "");
        }

        try {
            logMap.put("RL_SY_ERROR", e.getMessage());
        } catch (Exception e1) {
            logMap.put("RL_SY_ERROR", "");
        }

        return logMap;
    }

    @Override
    public Map<String, String> getLogMap(JCoFunction function) {
        Map<String, String> logMap = new HashMap<>();

        logMap.put("DATA_AUTH", "");
        logMap.put("RL_FUNC_NAME", function.getName());

        try {
            String sflag = function.getImportParameterList().getString("SFLAG");
            String message = function.getExportParameterList().getString("MESSAGE");
            if(!StringUtils.isEmpty(sflag)){
                logMap.put("RL_FLAG", sflag);
            }
            if(!StringUtils.isEmpty(message)){
                logMap.put("RL_MESSAGE", message);
            }
        } catch (Exception e) {
            logMap.put("RL_FLAG", "");
            logMap.put("RL_MESSAGE", "");
        }

        logMap.put("RL_IMPORT", function.getImportParameterList().toString());
        logMap.put("RL_EXPORT", function.getExportParameterList().toString().replaceAll("-","").replaceAll("\\|",""));
        logMap.put("RL_CHANGING", function.getChangingParameterList().toString());
        logMap.put("RL_TABLES", function.getTableParameterList().toString());
        logMap.put("RL_EXCEPTIONS", function.getExceptionList().toString());
        logMap.put("RL_SY_ERROR", "");

        return logMap;
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
    public JCoTable getTables(String tablesName, JCoFunction function) {
        return function.getTableParameterList().getTable(tablesName);
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

    public static String getLevelCode() {
        return levelCode;
    }

    public static String getLevelNo() {
        return levelNo;
    }

    public static String getLevelDesc() {
        return levelDesc;
    }

    public static String getLevelEnd() {
        return levelEnd;
    }

    public static String getLevelDataOpt() {
        return levelDataOpt;
    }

}
