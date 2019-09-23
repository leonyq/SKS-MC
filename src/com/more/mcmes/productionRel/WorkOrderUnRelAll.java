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
public class WorkOrderUnRelAll implements FuncService {
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
        if(StringUtils.isEmpty(dataAuth)){
            dataAuth = modelAction.getCurrUser().getData_auth();
        }

        try {
            splitFlag = !StringUtils.isEmpty(projectIds[1]);
        } catch (Exception e) {
            projectIds = workOrders.split(",| ");
        }
        try {
            splitFlag = !StringUtils.isEmpty(projectIds[1]);
        } catch (Exception e) {
            splitFlag = !StringUtils.isEmpty(projectIds[0]);
        }

        if (!splitFlag) {
            throw new BussException(modelAction.getText("解绑失败,工单分隔符格式错误,请使用'|' ','与空格"));
        }

        String userId = modelAction.getCurrUser().getId();

        List<String> topSnList = new ArrayList<>();
        List<String> subSnList = new ArrayList<>();

        try {
            for (int i = 0; i < projectIds.length; i++) {
                String curSn = StringUtils.toString(projectIds[i]);
                if (isTop(modelService, curSn)) {
                    topSnList.add(curSn);
                }else{
                    subSnList.add(curSn);
                }
            }

            if(topSnList.size() > 0){
                for(String curSn:topSnList){
                    res = callProjectRel(modelService, dataAuth, curSn, userId);
                }
            }else{
                for(String curSn:subSnList){
                    res = callProjectRel(modelService, dataAuth, curSn, userId);
                }
            }

            if (!ok.equals(res)) {
                throw new BussException(modelAction.getText("解绑失败," + res), res);
            }
        } catch (BussException e) {
            e.printStackTrace();
            throw new BussException(modelAction.getText("解绑失败," + e.getMessage()), e.getMessage());
        }

        String iframeId = modelAction.getRequest().getParameter("iframeId");
        if (iframeId == null) {
            iframeId = "iframe2";
        }
        String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");
        return modelAction.reloadIframeByIds(iframeId, modelAction.getText("工单解绑成功"), "0");
    }

    /**
     * 调用工单关联存储过程
     *
     * @param modelService
     * @param dataAuth
     * @param relWorkerOrder
     * @return
     */
    public String callProjectRel(ModelService modelService, String dataAuth, String relWorkerOrder, String userId) {
        ProFuncDto pf = new ProFuncDto();
        int[] inPlace = {1, 2, 3};
        int[] outplace = {4};
        List<Object> list = new ArrayList<Object>();
        List<Object> outType = new ArrayList<Object>();
        list.add(dataAuth);
        list.add(relWorkerOrder);
        list.add(userId);
        outType.add("String");
        pf.setClassName("P_C_VOID_UNREL_PROJECT_SN");
        pf.setInPlace(inPlace);
        pf.setOutPlace(outplace);
        pf.setTotalLen(list.size() + outType.size());
        pf.setValArgs(list);
        pf.setOutValType(outType);
        List<Object> relist = modelService.procComm(pf);
        String res = (String) relist.get(0);
        return res;
    }

    public Boolean isTop(ModelService modelService, String projectId) {
        String sql = "SELECT 1 FROM T_PM_PROJECT_REL A WHERE 1=1 AND A.PROJECT_ID = ? ";
        int count = 0;
        Boolean res = true;
        try {
            count = modelService.countSql(sql, new Object[]{projectId});
            res = count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            res = false;
        }
        return res;
    }
}
