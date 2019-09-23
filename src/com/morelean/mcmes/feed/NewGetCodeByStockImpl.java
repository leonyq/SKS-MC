package com.morelean.mcmes.feed;

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
 * 新增生产投料-根据存货代码获取物料信息
 * @author:phantomsaber
 * @version:2019/7/19 13:59
 * @email:phantomsaber@foxmail.com
 **/
public class NewGetCodeByStockImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();
        String stockCode = request.getParameter("STOCK_CODE");

        /*-- version:2019/7/18 15:38 | desc:投料标准配方 --*/
        String feedDetailSql =
                "SELECT A.CI_ITEM_CODE AS ITEM_CODE,B.CBD_ITEM_NUM AS ITEM_NUM,A.CI_ITEM_NAME AS ITEM_NAME,C.WORK_SPACE,C.WARE_HOUSE FROM T_CO_ITEM A " +
                        " LEFT JOIN T_CO_BOM_DETAIL B ON A.CI_ITEM_CODE = B.CBD_ITEM_CODE " +
                        " LEFT JOIN T_PM_PROJECT_DETAIL C ON c.cbd_item_code = A.CI_ITEM_CODE " +
                        "WHERE 1=1 " +
                        "AND A.STOCK_CODE = ? " +
                        "AND ROWNUM = 1";
        List list = modelService.listDataSql(feedDetailSql, new Object[]{stockCode});
		if (list.size() > 0) {
            CommMethod.listToEscapeJs(list);
            modelAction.setAjaxList(list);
        }
        return BaseActionSupport.AJAX;
    }

}
