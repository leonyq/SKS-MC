package com.more.taskCenter.taskBuss;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @author
 */
public class delTaskCheck implements FuncService
{
    private final Log log = LogFactory.getLog(this.getClass());

    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService)
    {
        String formId = modelAction.getFormId();
        String[] delIds = modelAction.getRequest().getParameterValues(formId + "$ID");
        for (String delId : delIds)
        {
            if (StringUtils.isNotBlank(delId))
            {
                String sql = "select *  from T_TK_TASKCENTER C connect by prior id = pid start with"
                             + " c.id = ? ";
                List subList = modelService.listDataSql(sql, new Object[] {delId});

                if (subList != null && subList.size() > 0)
                {
                    for (int k = 0; k < subList.size(); k++ )
                    {
                        Map<String, Object> map = (Map)subList.get(k);
                        String taskState = (String)map.get("TASK_STATE");
                        if (!"1".equals(taskState))
                        {
                            return modelAction.alertParentInfo(modelAction.getText("下级任务非未开始，不能删除"));
                        }
                    }
                }
            }
        }
        modelAction.delComm();
        return BaseActionSupport.AJAX;
    }
}
