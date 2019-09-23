package com.more.mcmes.productionRel;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 查询待关联工单信息
 * @author:phantomsaber
 * @version:2019/7/16 11:25
 * @email:phantomsaber@foxmail.com
 **/
public class WorkOrderRelSearchInfo implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest();
        String projectSn = request.getParameter("workOrderSn");

        String sql= "SELECT A.PROJECT_ID,A.PRODUCT_MATERIAL,B.CI_ITEM_NAME AS ITEM_NAME,TO_CHAR(A.PRODUCT_COUNT) AS PRODUCT_COUNT,TO_CHAR(A.CREATE_TIME,'YYYY-MM-DD HH:MI:SS') AS CREATE_TIME FROM T_PM_PROJECT_BASE A LEFT JOIN T_CO_ITEM B ON A.PRODUCT_MATERIAL = B.CI_ITEM_CODE WHERE 1=1 AND A.PROJECT_ID = ? ";

        List list = modelService.listDataSql(sql, new Object[]{projectSn});

        CommMethod.listToEscapeJs(list);
        modelAction.setAjaxList(list);
        return BaseActionSupport.AJAX;
    }
}
