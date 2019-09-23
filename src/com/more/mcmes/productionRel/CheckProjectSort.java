package com.more.mcmes.productionRel;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * 工单关联
 *
 * @author:phantomsaber
 * @version:2019/7/3 4:38
 * @email:phantomsaber@foxmail.com
 **/
public class CheckProjectSort implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());
    private String ok = "OK";

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        // 获取封装的数据
        HttpServletRequest request = modelAction.getRequest();
        String workOrders = request.getParameter("workOrderSn");
        String[] projectIds = workOrders.split("\\|");

        Boolean splitFlag = null;
        String res = "";

        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        if (StringUtils.isEmpty(dataAuth)) {
            dataAuth = modelAction.getCurrUser().getData_auth();
        }


        String iframeId = modelAction.getRequest().getParameter("iframeId");
        if (iframeId == null) {
            iframeId = "iframe2";
        }
        String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");
        return modelAction.reloadIframeByIds(iframeId, modelAction.getText("工单解绑成功"), "0");
    }
}