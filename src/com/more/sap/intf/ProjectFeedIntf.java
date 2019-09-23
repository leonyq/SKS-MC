package com.more.sap.intf;
import com.more.sap.intf.comm.SapCommIntf;

import java.util.Map;

/**
 * 工单投料接口
 *
 * @author:phantomsaber
 * @version:2019/7/25 9:33
 * @email:phantomsaber@foxmail.com
 **/
public interface ProjectFeedIntf extends SapCommIntf {

    /**
     * 执行方法
     * @param funcName
     * @param syncItemCode
     */
    @Override
    void exec(String funcName, String syncItemCode);
}
