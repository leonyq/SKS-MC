package com.morelean.mcmes.qmtest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 生产投料查看-视图前执行类
 *
 * @author:phantomsaber
 * @version:2019/7/10 11:25
 * @email:phantomsaber@foxmail.com
 **/
public class QmSimpleTestViewImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();
        String dataId = modelAction.getDataId();
//        String sqlString = "select DATA_AUTH from t_pm_project_base where id=?  ";

        String sqlString = "SELECT A.* FROM T_PM_PROJECT_FEED_BASE A WHERE 1=1 AND A.ID = ? ";

        Map<String, String> map1 = modelService.queryForMap(sqlString, new Object[]{dataId});

        String sql= "SELECT A.* FROM T_PM_PROJECT_FEED_DETAIL A " +
                    "INNER JOIN T_PM_PROJECT_FEED_BASE B ON A.PROJECT_ID = B.PROJECT_ID " +
                    "WHERE 1=1 AND B.ID = ? AND A.DATA_AUTH = ? ";

        List list = modelService.listDataSql(sql, new Object[]{dataId, map1.get("DATA_AUTH")});

        if (list.size() > 0) {
            CommMethod.listToEscapeJs(list);
            modelAction.setDataList(list);
        }
        return modelAction.ActionForwardExeid(modelAction.getExeid());
    }

}
