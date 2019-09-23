package com.morelean.mcmes.pack;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 新增包装-视图前执行类
 * @author:phantomsaber
 * @version:2019/7/18 14:09
 * @email:phantomsaber@foxmail.com
 **/
public class packToFeedAddPreImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();
        String dataId = modelAction.getDataId();
        String sql = "SELECT distinct T1.*,T3.CI_ITEM_NAME,T3.CI_ITEM_SPEC,T2.WARE_HOUSE,T2.WORK_SPACE "
		  + " FROM T_PM_PROJECT_DETAIL T1 "
		  + " LEFT JOIN T_PM_PROJECT_BASE T2 ON T1.PROJECT_ID = T2.PROJECT_ID  "
		  + " LEFT JOIN T_CO_ITEM T3 ON T3.CI_ITEM_CODE = T1.CBD_ITEM_CODE  "
		  + " WHERE 1=1 AND T2.id = ?  ";
        List list = modelService.listDataSql(sql, new Object[]{dataId});
        if (list.size() > 0) {
            CommMethod.listToEscapeJs(list);
            modelAction.setDataList(list);
            modelAction.setAjaxList(list);
        }

        return modelAction.ActionForwardExeid(modelAction.getExeid());
    }

}
