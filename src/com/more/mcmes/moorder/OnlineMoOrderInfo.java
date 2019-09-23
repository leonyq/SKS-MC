package com.more.mcmes.moorder;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 制令单-上线页面
 * 
 */
public class OnlineMoOrderInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
        HttpServletRequest request=modelAction.getRequest();
        String dataId=modelAction.getDataId();
        String dataAuth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
        String sql="SELECT C.CIG_TEC_ID,  C.CIG_LINK_NUM,   C.CIG_SN_RULE_B, C.CIG_SN_RULE_S, C.CIG_REPAIR_MAX, C.CIG_REJ_FLAG, C.CIG_AUTO_FQC, C.CIG_FQC_NUM,  CIG_CONTRAL_TYPE  " +
        		"FROM T_PM_MO_BASE A, T_CO_ITEM B, T_CO_ITEM_GROUP C, T_CO_ITEM_CONNECT D "
        		+ " WHERE A.PM_MODEL_CODE = B.CI_ITEM_CODE   AND B.CI_ITEM_CODE = D.CIC_ITEM_CODE  " +
        		" AND C.CIG_SN = D.CIG_SN  "
        		+ " and b.data_auth=a.data_auth and c.data_auth=a.data_auth and d.data_auth=a.data_auth "
        		+ " AND A.ID = ?";
        List<Map> baseList = modelService.listDataSql(sql, new Object[] { dataId });
        Map map=new HashMap();
        if(baseList!=null&&baseList.size()>0){
            map.put("base", baseList.get(0));
        }
        CommMethod.mapToEscapeJs(map);
        modelAction.setDataMap(map);
        
        sql="select a.pm_model_code, a.PM_AREA_SN, a.PM_PROCESS_FACE,a.PM_PRODUCT_STEP,a.PM_PROJECT_ID  from t_pm_mo_base a where a.id = ?  ";
        List list=modelService.listDataSql(sql,new Object[]{dataId});
        String pmModelCode = null;
        String pmAreaSn = null;
        String pmProcessFace = null;
        String pmProductStep = null;
        String projectId = null;
        if(null!=list  &&list.size()>0){
        Map paramap=(Map)list.get(0);
         pmModelCode=(String)paramap.get("PM_MODEL_CODE");//机种代码
         pmAreaSn=(String)paramap.get("PM_AREA_SN");//线别
         pmProcessFace=(String)paramap.get("PM_PROCESS_FACE");//面别
         pmProductStep=(String)paramap.get("PM_PRODUCT_STEP");//生产阶别
         projectId=(String)paramap.get("PM_PROJECT_ID");
        }
        //工单BOM
        sql="select t.*,t2.ci_item_name as CBD_ITEM_NAME,t2.ci_item_spec as CBD_ITEM_SPEC "
            +" from t_pm_project_detail t left join t_co_item t2 on t.cbd_item_code=t2.ci_item_code and t.data_auth=t2.data_auth where t.PROJECT_ID = ? and t.data_auth=?";
        list=modelService.listDataSql(sql, new Object[] {projectId,dataAuth});
        if(null!=list  &&list.size()>0){
        	CommMethod.listMapToEscapeJs(list);
           modelAction.setDataList(list);
        }
        //料站表
        sql="select t.ID, t.CMD_DEVICE_TYPE, t.CMD_PROGRAM_NAME, t.CMD_DEVICE_SEQ, t.CMD_TABLE_NO, t.CMD_LOADPOINT, t.CMD_CHANEL_SN, t.CMD_ITEM_CODE,B.CI_ITEM_NAME,B.CI_ITEM_SPEC,T.CMD_TRY_FLAG,T.CMD_SHKIP_FLAG,CMD_POINT_NUM,CMD_POINT_LOCATION,T.CMD_BOM_FLAG from " +
        		"T_co_material_detail t "
        		+ " join t_co_material_table s   on s.CM_SN = t.cm_sn and t.data_auth=s.data_auth "
        		+ " join t_co_material_line a  on a.cm_sn=s.cm_sn and t.data_auth=a.data_auth "
        		+ " join t_co_item b    on b.ci_item_code = s.cm_model_code and t.data_auth=b.data_auth "
        		+ " where s.cm_model_code = ? and a.cml_area_sn=? and  s.cm_process_face=? and t.data_auth=? ";
        list=modelService.listDataSql(sql, new Object[] {pmModelCode,pmAreaSn,pmProcessFace,dataAuth});
        if(null!=list  && list.size()>0){
        	CommMethod.listMapToEscapeJs(list);
           modelAction.setDataList1(list);
        }
        
        //管控物料
        sql="SELECT T.CTI_ITEM_TYPE, T.CTI_ITEM_CODE,  B.CI_ITEM_NAME,   B.CI_ITEM_SPEC,   T.CTI_GROUP, T.CTI_ASSB_QTY, T.CTI_CONTROL_MODE, T.CTI_ITEM_SOURCE,   A.NAME,       T.CREATE_USER," +
        		"  T.CREATE_TIME  FROM T_CO_TECH_ITEM T "
        		+ " LEFT JOIN T_CO_ITEM B    ON B.CI_ITEM_CODE = T.CTI_ITEM_CODE and t.data_auth=b.data_auth "
        		+ "  LEFT JOIN SY_USER A    ON A.ID = T.CREATE_USER and t.data_auth=a.data_auth "
        		+ " WHERE T.CTI_MODEL_CODE = ? and T.CTI_PRODUCT_STEP=? and t.data_auth=?  ";
        list=modelService.listDataSql(sql, new Object[] {pmModelCode,pmProductStep,dataAuth});
        if(null!=list  &&list.size()>0){
        	CommMethod.listMapToEscapeJs(list);
           modelAction.setDataList2(list);
        }
        return modelAction.ActionForwardExeid(modelAction.getExeid());

    }
}