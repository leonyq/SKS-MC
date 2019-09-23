package com.morelean.mcmes.feed;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.List;


/**
 * 工单删除控制
 */
public class DelWorkOrderAjax implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        String dataAuth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
        String formId1 = modelAction.getFormId();
        String[] delIds = modelAction.getRequest().getParameterValues(formId1 + "$ID");
        for (String delId : delIds) {
            if (StringUtils.isNotBlank(delId)) {
//                String sql = "select 1  from T_PM_MO_BASE C "
//                        + "join T_PM_PROJECT_BASE a on a.project_id=c.pm_project_id "
//                        + "where a.id = ? AND C.DATA_AUTH=? ";
                String sql = "SELECT 1 FROM T_PM_PROJECT_FEED_BASE A " +
                        "JOIN T_PM_PROJECT_BASE B ON A.PROJECT_ID = B.PROJECT_ID AND B.PROJECT_STATUS IN ('3','5') " +
                        "WHERE 1=1 AND A.ID = ? AND A.DATA_AUTH = ? ";
                List subList = modelService.listDataSql(sql, new Object[]{delId, dataAuth});

                if (subList != null && subList.size() > 0) {
                    return modelAction.alertInfoAddPic(modelAction.getText("工单已进入下一个阶段，不能删除"), "1");
                }
            }
        }
        modelService.delComm(modelAction.getRequest(), modelAction.getUser());
        return modelAction.delAjaxLoadTable(modelAction.getText("删除成功"));
        //return modelAction.AJAX;
    }
}
