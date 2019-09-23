package com.more.sap.intf;

import com.more.sap.intf.comm.SapCommIntf;

import java.util.Map;

public interface ItemLevelIntf extends SapCommIntf {
    @Override
    void exec(String funcName, String syncItemCode);

    /**
     * 保存物料层级
     * @param paraMap
     */
    Boolean saveItemLevel(Map<String, String> paraMap);

    /**
     * 判断是否存在物料层级编号
     * @param code
     * @return
     */
    Boolean levelCodeNotExist(String code);
}
