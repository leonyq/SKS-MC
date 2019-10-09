package com.morelean.mcmes.accountCheck;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;

/**
 * 新增生产投料-视图前执行类
 *
 * @author:phantomsaber
 * @version:2019/7/18 14:09
 * @email:phantomsaber@foxmail.com
 **/
public class ManualCheckImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest();
        String workOrderSn = request.getParameter("workOrderSn");
        String idSn = request.getParameter("idSn");
        String userId = modelAction.getCurrUser().getId();

        String updateSql =
                " UPDATE T_ACCOUNT_CHECK_BASE A " +
                " SET A.CHECK_FLAG = 'M'," +
                " A.CHECK_DESC = A.CHECK_DESC||'|已人工核对'," +
                " A.EDIT_TIME = SYSDATE," +
                " A.EDIT_USER = ? " +
                " WHERE 1=1 AND A.PROJECT_ID IN (" + workOrderSn + ")";

        String updateIdSql =
                " UPDATE T_ACCOUNT_CHECK_BASE A " +
                        " SET A.CHECK_FLAG = 'M'," +
                        " A.CHECK_DESC = A.CHECK_DESC||'|已人工核对'," +
                        " A.EDIT_TIME = SYSDATE," +
                        " A.EDIT_USER = ? " +
                        " WHERE 1=1 AND A.ID IN (" + idSn + ")";

        try {
//            modelService.execSql(updateSql, new Object[]{userId});
            modelService.execSql(updateIdSql, new Object[]{userId});

            modelAction.setAjaxString("人工核对成功");
        } catch (Exception e) {
            modelAction.setAjaxString("人工核对失败");
        }

        String iframeId = modelAction.getRequest().getParameter("iframeId");
        if (iframeId == null) {
            iframeId = "iframe9";
        }
        String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");
        return BaseActionSupport.AJAX;
    }
}