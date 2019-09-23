package com.more.mcmes.moorder;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dto.FuncCode;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 制令单-下线
 * 
 */
public class OfflineMoOrderInfoAjax implements FuncService
{
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService)
    {
        HttpServletRequest request=modelAction.getRequest();
        String dataAuth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
        String[] formIds = request.getParameterValues("formId");
        for (String formId : formIds){
            String[] ids = request.getParameterValues(formId + "$ID");
            if (null != ids && ids.length > 0){
                for (String dataId : ids){
                    TableDataMapExt tdmap = new TableDataMapExt();
                    tdmap.getColMap().put("PM_STATUS", 3); //下线    
                    tdmap.setTableName("T_PM_MO_BASE");
                    tdmap.setSqlWhere(" and ID = ?");
                    tdmap.getSqlWhereArgs().add(dataId);
                    int res = modelService.edit(tdmap);
                    if (res < 1)
                    {
                      throw new BussException(FuncCode.MS100_0001_002 + CommMethod.getText("未找到数据"));
                    }
                    
                    String sql="delete from T_CO_MATERIAL_ONLINE t where t.cmo_mo_number in (select a.PM_MO_NUMBER from t_pm_mo_base a where a.id = ? ) AND T.DATA_AUTH=? ";
                    res=modelService.execSql(sql, new Object[]{dataId,dataAuth});
                    
                }
                
            }

        }
        return  modelAction.reloadParent(modelAction.getText("下线成功"));
        
    }
}