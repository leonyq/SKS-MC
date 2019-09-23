package com.morelean.sap.intf.comm;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoTable;

import java.util.Map;

/**
 * Sap接口通用intf
 * @author:phantomsaber
 * @version:2019/7/25 11:05
 * @email:phantomsaber@foxmail.com
 **/
public interface SapCommIntf {

    /**
     * 接口执行方法
     */
    void exec(String funcName,String syncItemCode);
    /**
     * 保存接口日志
     * @param paraMap
     * @return
     */
    Boolean saveLog(Map<String, String> paraMap);

    /**
     * 获取 JCoFunction
     * @param funcName
     * @return
     */
    JCoFunction getFunction(String funcName);

    /**
     * 设置SAP import JCoTable传参
     * @param funcName SAP接口方法名
     * @param paraMap  参数map
     * @return
     */
    JCoTable setImport(String funcName,Map<String,String> paraMap);

    /**
     * 设置SAP tables JCoTable传参
     * @param tablesName SAP table名
     * @param paraMap  参数map
     * @return
     */
    JCoTable setTables(String tablesName,Map<String,String> paraMap);

    /**
     * 获取 SAP import JCoTable
     * @param funcName SAP接口方法名
     * @param paraMap  参数map
     * @return
     */
    JCoTable getImport(String funcName,Map<String,String> paraMap);

    /**
     * 获取 SAP export JCoTable
     * @param funcName SAP接口方法名
     * @param paraMap  参数map
     * @return
     */
    JCoTable getExport(String funcName,Map<String,String> paraMap);

    /**
     * 获取 SAP changing JCoTable
     * @param funcName SAP接口方法名
     * @param paraMap  参数map
     * @return
     */
    JCoTable getChanging(String funcName,Map<String,String> paraMap);

    /**
     * 获取 SAP tables JCoTable
     * @param funcName SAP接口方法名
     * @param paraMap  参数map
     * @return
     */
    JCoTable getTables(String funcName,Map<String,String> paraMap);

    /**
     * 获取 SAP exceptions JCoTable
     * @param funcName SAP接口方法名
     * @param paraMap  参数map
     * @return
     */
    JCoTable getExceptions(String funcName,Map<String,String> paraMap);
}
