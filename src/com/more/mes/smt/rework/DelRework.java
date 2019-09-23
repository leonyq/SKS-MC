package com.more.mes.smt.rework;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 
 * @Title 〈一句话功能简述〉
 * @Description 返工单删除控制
 * @ClassName DelRework
 * @author Administrator
 * @version 1.0 developer 2017-10-26 created
 * @see DelRework
 * @since 2017-10-26
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class DelRework implements FuncService
{
    private final Log log = LogFactory.getLog(this.getClass());

    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService)
    {
        String[] formId = modelAction.getRequest().getParameterValues("formId");
        String[] delIds = modelAction.getRequest().getParameterValues(formId[0] + "$ID");
        String dataAuth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
        for (String delId : delIds)
        {
            if (StringUtils.isNotBlank(delId))
            {
                String sql = "select 1 from T_CO_REWORK_DETAIL t "+
                            " join t_co_rework_info s on t.crd_doc_number=s.cri_doc_number and t.data_auth=s.data_auth "+
                            " where s.id=? and t.data_auth=? ";
                List subList = modelService.listDataSql(sql, new Object[] {delId,dataAuth});

                if (subList != null && !subList.isEmpty())
                {
                    return modelAction.alertParentInfo(modelAction.getText("返工单已关联产品，不能删除"));
                }
            }
        }
        return  modelAction.delAjaxComm();
    }
}
