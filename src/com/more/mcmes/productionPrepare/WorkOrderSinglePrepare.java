package com.more.mcmes.productionPrepare;

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
public class WorkOrderSinglePrepare implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());
    private String ok = "OK";

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        // 获取封装的数据
        HttpServletRequest request = modelAction.getRequest();
        String workOrders = request.getParameter("workOrderSn");

        try {
            String[] split = workOrders.split(",");
            String dataAuth = modelAction.getCurrUser().getData_auth();

            for (int i = 0; i < split.length; i++) {
                String res = "";
                String curWorkOrder = StringUtils.toString(split[i]);
                if (!StringUtils.isEmpty(curWorkOrder)) {
                    res = callProjectPrepare(modelService, dataAuth, curWorkOrder);
                }
                if (!ok.equals(res)) {
                    throw new BussException(modelAction.getText(curWorkOrder+"备料失败," + res), res);
                }
            }

            String iframeId = modelAction.getRequest().getParameter("iframeId");
            if (iframeId == null) {
                iframeId = "iframe2";
            }
            String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");
            return modelAction.reloadIframeByIds(iframeId, modelAction.getText("工单备料成功"), "0");
        }catch (Exception e){
            log.error("WorkOrderSinglePrepare:", e);
            return null;
        }
    }

    /**
     * 调用工单关联存储过程
     *
     * @param modelService
     * @param dataAuth
     * @param relWorkerOrder
     * @return
     */
    public String callProjectPrepare(ModelService modelService, String dataAuth, String relWorkerOrder) {
        ProFuncDto pf = new ProFuncDto();
        int[] inPlace = {1, 2};
        int[] outplace = {3};
        List<Object> list = new ArrayList<Object>();
        List<Object> outType = new ArrayList<Object>();
        list.add(dataAuth);
        list.add(relWorkerOrder);
        outType.add("String");
        pf.setClassName("P_C_PREPARE_PROJECT_SN");
        pf.setInPlace(inPlace);
        pf.setOutPlace(outplace);
        pf.setTotalLen(list.size() + outType.size());
        pf.setValArgs(list);
        pf.setOutValType(outType);
        List<Object> relist = modelService.procComm(pf);
        String res = (String) relist.get(0);
        return res;
    }
}
