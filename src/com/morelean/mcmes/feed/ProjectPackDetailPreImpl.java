package com.morelean.mcmes.feed;

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
 * 新增生产投料-视图前执行类
 * @author:phantomsaber
 * @version:2019/7/18 14:09
 * @email:phantomsaber@foxmail.com
 **/
public class ProjectPackDetailPreImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();
        String dataId=modelAction.getDataId();
        String sqlString = "select DATA_AUTH from t_pm_project_base "
                + "where id=?  ";
        Map<String, String> map1 =modelService.queryForMap(sqlString, new Object[]{dataId});

        String sql="SELECT DISTINCT T.*,T2.STOCK_CODE,T.CBD_ITEM_CODE AS ITEM_CODE,T2.CI_ITEM_NAME AS ITEM_NAME,T2.CI_ITEM_SPEC AS ITEM_SPEC,T.CBD_UNITS AS UNIT "
                +" FROM T_PM_PROJECT_DETAIL T LEFT JOIN T_CO_ITEM T2 ON T.CBD_ITEM_CODE=T2.CI_ITEM_CODE AND T.DATA_AUTH=T2.DATA_AUTH  "
                +"  LEFT JOIN T_PM_PROJECT_BASE T1 ON T.PROJECT_ID=T1.PROJECT_ID  AND T.DATA_AUTH=T1.DATA_AUTH  WHERE T1.ID=? AND T.DATA_AUTH=? ";
        List list=modelService.listDataSql(sql, new Object[] {dataId,map1.get("DATA_AUTH")});
        if(list.size()>0){
            CommMethod.listToEscapeJs(list);
            modelAction.setDataList(list);
        }
        //替代料
        sql="select t.*,t2.ci_item_name,t3.ci_item_name as cr_item_replace_name,"
                +"t3.ci_item_spec as cr_item_replace_spec,t.CR_STATUS from T_CO_ITEM_REPLACE t "
                +"left join t_co_item t2 on t.cr_item_mian=t2.ci_item_code AND T.DATA_AUTH=T2.DATA_AUTH  "
                +"left join t_co_item t3 on t.cr_item_replace=t3.ci_item_code AND T.DATA_AUTH=T3.DATA_AUTH "
                +"where t.cr_item_mian in( select CBD_ITEM_CODE from t_pm_project_detail pd left join t_pm_project_base pb on pb.PROJECT_ID=pd.PROJECT_ID where pb.id=? ) AND T.DATA_AUTH=? ";
        List rplist=modelService.listDataSql(sql, new Object[] {dataId,map1.get("DATA_AUTH")});
        if(rplist.size()>0){
            CommMethod.listToEscapeJs(rplist);
            modelAction.setDataList1(rplist);
        }
        return modelAction.ActionForwardExeid(modelAction.getExeid());
    }
}
