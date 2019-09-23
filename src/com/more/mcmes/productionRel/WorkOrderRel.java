package com.more.mcmes.productionRel;

import javax.servlet.http.HttpServletRequest;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import java.util.ArrayList;
import java.util.List;

/**
 * 工单关联
 *
 * @author:phantomsaber
 * @version:2019/7/3 4:38
 * @email:phantomsaber@foxmail.com
 **/
public class WorkOrderRel implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());
    private String ok = "OK";

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        // 获取封装的数据
        HttpServletRequest request = modelAction.getRequest();
        String workOrders = request.getParameter("workOrderSn");

        String[] split = workOrders.split("\\|");


        Boolean splitFlag = null;
        try {
            splitFlag = !StringUtils.isEmpty(split[1]);
        } catch (Exception e) {
            split = workOrders.split(",| ");
        }

        try {
            splitFlag = !StringUtils.isEmpty(split[1]);
        } catch (Exception e) {
            splitFlag = false;
        }

        Boolean isSelfRel = false;
        if(!splitFlag){
            if(!StringUtils.isEmpty(split[0])){
                isSelfRel = true;
            }else{
                throw new BussException(modelAction.getText("关联失败,工单分隔符格式错误,请使用'|' ','与空格"));
            }
        }


        String dataAuth = modelAction.getCurrUser().getData_auth();
        String baseOrder = StringUtils.toString(split[0]);
        String userId = modelAction.getUser().getId();

        String res = "";

        if(!isSelfRel){
            for (int i = 0; i < split.length; i++) {
                String curWorkOrder = StringUtils.toString(split[i]);
                if (!StringUtils.isEmpty(curWorkOrder)) {
                    if (baseOrder != curWorkOrder) {
                        res = callProjectRel(modelService, dataAuth, baseOrder, curWorkOrder,userId);
                    }
                }
            }
        }else if (isSelfRel){
            String curWorkOrder = baseOrder;
            res = callProjectRel(modelService, dataAuth, baseOrder, curWorkOrder,userId);
        }else{
            throw new BussException(modelAction.getText("关联失败,"+res), res);
        }

        if(!ok.equals(res)){
            res = StringUtils.toString(res.split(":")[1]);
            throw new BussException(modelAction.getText("关联失败,"+res), res);
        }

        String iframeId = modelAction.getRequest().getParameter("iframeId");
        if (iframeId == null) {
            iframeId = "iframe2";
        }
        String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");
        return modelAction.reloadIframeByIds(iframeId, modelAction.getText("工单关联成功"), "0");
    }

    /**
     * 调用工单关联存储过程
     *
     * @param modelService
     * @param dataAuth
     * @param workOrder
     * @param relWorkerOrder
     * @return
     */
    public String callProjectRel(ModelService modelService, String dataAuth, String workOrder, String relWorkerOrder,String userId) {
        ProFuncDto pf = new ProFuncDto();
       // int[] inPlace = {1, 2, 3};
        //int[] outplace = {4};
        int[] inPlace = {1, 2, 3,4};
        int[] outplace = {5};
        List<Object> list = new ArrayList<Object>();
        List<Object> outType = new ArrayList<Object>();
        list.add(dataAuth);
        list.add(workOrder);
        list.add(relWorkerOrder);
        list.add(userId);
        outType.add("String");
      //  pf.setClassName("P_C_REL_PROJECT_SN");
        pf.setClassName("P_LEO_REL_PROJECT_SN");
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
