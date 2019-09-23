package com.more.taskCenter.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 
 * 
 * 产品项目删除控制
 */
public class delProductCheck implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        String formId = modelAction.getFormId();
        String[] delIds = modelAction.getRequest().getParameterValues(formId + "$ID");
        for (String delId : delIds) {
            if (StringUtils.isNotBlank(delId)) {
                String sql = "select id from T_TK_TASKCENTER C  WHERE PROJECT_ID=? ";
                List subList = modelService.listDataSql(sql, new Object[] { delId });
                if(subList!=null&&subList.size()>0){
                    return modelAction.alertParentInfo(modelAction.getText("选择删除的产品项目存在已被使用！")) ;              }
            }
        }
        modelAction.delComm();
        return BaseActionSupport.AJAX;
    }
}
