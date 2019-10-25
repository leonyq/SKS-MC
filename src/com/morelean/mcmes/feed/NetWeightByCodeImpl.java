package com.morelean.mcmes.feed;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 新增生产投料-根据物料及单位获取物料净值信息
 **/
public class NetWeightByCodeImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();
        String itemCode = request.getParameter("ITEM_CODE");

        String feedDetailSql = "SELECT T1.SAP_NET_WEIGHT FROM T_CO_ITEM T1 where T1.SAP_BASE_UNIT='PAI' AND  T1.CI_ITEM_CODE = ?  ";
        Map map = modelService.queryForMap(feedDetailSql, new Object[]{itemCode});
        if (map.size() > 0) {
            CommMethod.mapToEscapeJs(map);
            modelAction.setAjaxMap(map);
        }
        return BaseActionSupport.AJAX;
    }

}
