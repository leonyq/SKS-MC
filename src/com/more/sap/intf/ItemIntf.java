package com.more.sap.intf;
import com.more.sap.intf.comm.SapCommIntf;
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
     * 执行方法
     * @param funcName
     * @param syncItemCode
     */
    @Override
    void exec(String funcName, String syncItemCode);

    /**
     * 保存物料信息
     * @param paraMap
     * @return
     */
    Boolean saveItem(Map<String, String> paraMap);

    /**
     * 判断是否存在
     * @param code
     * @return
     */
    Boolean itemNotExist(String code);
}
