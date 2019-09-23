package com.morelean.sap.intf;
import com.morelean.sap.intf.comm.SapCommIntf;
import com.sap.conn.jco.JCoTable;

import java.util.Map;

/**
 * 物料信息接口
 * @author:phantomsaber
 * @version:2019/7/25 9:33
 * @email:phantomsaber@foxmail.com
 **/
public interface ItemIntf extends SapCommIntf {

    /**
     * 接口执行
     */
    @Override
    void exec(String funcName,String syncItemCode);

    /**
     * 保存接口日志
     * @param paraMap
     * @return
     */
    @Override
    Boolean saveLog(Map<String, String> paraMap);

    /**
     * set sap import
     * @param funcName SAP接口方法名
     * @param paraMap  参数map
     * @return
     */
    @Override
    JCoTable setImport(String funcName, Map<String, String> paraMap);

    /**
     * set sap tables
     * @param funcName SAP接口方法名
     * @param paraMap  参数map
     * @return
     */
    @Override
    JCoTable setTables(String funcName, Map<String, String> paraMap);

    /**
     * get sap import
     * @param funcName SAP接口方法名
     * @param paraMap  参数map
     * @return
     */
    @Override
    JCoTable getImport(String funcName, Map<String, String> paraMap);

    /**
     * get sap export
     * @param funcName SAP接口方法名
     * @param paraMap  参数map
     * @return
     */
    @Override
    JCoTable getExport(String funcName, Map<String, String> paraMap);

    /**
     * get sap changing
     * @param funcName SAP接口方法名
     * @param paraMap  参数map
     * @return
     */
    @Override
    JCoTable getChanging(String funcName, Map<String, String> paraMap);

    /**
     * get sap tables
     * @param funcName SAP接口方法名
     * @param paraMap  参数map
     * @return
     */
    @Override
    JCoTable getTables(String funcName, Map<String, String> paraMap);

    /**
     * get sap exceptions
     * @param funcName SAP接口方法名
     * @param paraMap  参数map
     * @return
     */
    @Override
    JCoTable getExceptions(String funcName, Map<String, String> paraMap);

    /**
     * 保存物料信息
     * @param paraMap
     * @return
     */
    Boolean saveItem(Map<String,String> paraMap);

}
