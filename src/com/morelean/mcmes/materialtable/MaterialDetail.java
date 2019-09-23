package com.morelean.mcmes.materialtable;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title
 * @description 新增料站表明细自定义类
 * @ClassName MaterialDetail
 * @author msad013
 * @version 1.0 developer 2017-6-16 created
 * @see MaterialDetail
 * @since 2017-6-16
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class MaterialDetail implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // String dataId = modelAction.getDataId();// item_code 机种
    HttpServletRequest t = modelAction.getRequest();
    String type = t.getParameter("type");

    String sql = null;
    List sList = null;
    String areaSn = null;
    String areaSnStr = t.getParameter("areaSn");
    //String cmdDeviceType = t.getParameter("cmdDeviceType");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    if (StringUtils.isNotEmpty(areaSnStr))
    {
      String[] areaSnArr = areaSnStr.split(",");
      areaSn = areaSnArr[0];
    }

    if ("1".equals(type))
    {
     
      sql = "SELECT T.CAD_DEVICE_SEQUENCE MKEY,T2.CD_DEVICE_NAME VAL,T.CAD_DEVICE_ID FROM "
            + "T_CO_AREA_DEVICE T  JOIN T_CO_AREA T1 ON T1.CA_ID=T.CA_ID AND T1.CA_PARENTAREAID = ? AND T1.DATA_AUTH = ?  "
            +" join T_CO_DEVICE T2 on T.CAD_DEVICE_ID=T2.ID where 1=1 and T.DATA_AUTH = ?  order by t.CAD_DEVICE_SEQUENCE";
     
        /*
        sql = "SELECT T.CAD_DEVICE_SEQUENCE KEY,T.CAD_DEVICE_SEQUENCE VAL,T.CAD_DEVICE_ID FROM "
            + "T_CO_AREA_DEVICE T  JOIN T_CO_AREA T1 ON T1.CA_ID=T.CA_ID AND T1.CA_PARENTAREAID = ? order by t.CAD_DEVICE_SEQUENCE";
           */
         sList = modelService.listDataSql(sql, new Object[] {areaSn,dataAuth,dataAuth});
    }
    else if ("2".equals(type))
    {
      String seviceSeq = t.getParameter("seviceSeq");
      sql = "select distinct t.CDL_TABLE  from T_CO_DEVICE_LOADPOINT t  join t_co_area_device s "
            + "on s.cad_device_id=t.cd_device_id and s.data_auth = ?  JOIN T_CO_AREA T1 ON T1.CA_ID=S.CA_ID"
            + " and T1.data_auth = ?  where s.cad_device_sequence=?  AND  T1.CA_PARENTAREAID =? AND T.data_auth = ?  order by t.CDL_TABLE ";
      sList = modelService.listDataSql(sql, new Object[] {dataAuth,dataAuth,seviceSeq, areaSn,dataAuth});
    }
    else if ("3".equals(type))
    {
      String seviceSeq = t.getParameter("seviceSeq");
      String table = t.getParameter("table");
      sql = "select distinct t.CDL_LOADPOINT  from T_CO_DEVICE_LOADPOINT t  join t_co_area_device s "
            + "on s.cad_device_id=t.cd_device_id and s.data_auth=?  JOIN T_CO_AREA T1 ON T1.CA_ID=S.CA_ID"
            + " and t1.data_auth=?   where s.cad_device_sequence=? and t.CDL_TABLE = ?  AND T1.CA_PARENTAREAID=? AND t.data_auth=? order by t.CDL_LOADPOINT  ";
      sList = modelService.listDataSql(sql, new Object[] {dataAuth,dataAuth,seviceSeq, table, areaSn,dataAuth});
    }
    else if ("4".equals(type))
    {
      sql = "select vr_value from t_sys_parameter_ini s where s.vr_class=? and  vr_value=? and data_auth=? ";
      sList = modelService.listDataSql(sql,new Object[] {"SMT0001", "1",dataAuth});
      if (sList != null && !sList.isEmpty())
      {
       String modelCode = t.getParameter("modelCode");
        String itemCode = t.getParameter("itemCode");
       // sql = "select t.id from t_Co_Bom_Detail t where t.cbd_item_code =?  ";
        sql = "select * from T_CO_BOM_DETAIL t "+
          " left join T_CO_BOM t1 on t.CB_BOMID=t1.ID "+
          " where t1.CB_ITEM_CODE=? and t.CBD_ITEM_CODE=? and t1.CB_DEFAULT=? and t.data_auth=? ";
        sList = modelService.listDataSql(sql, new Object[] {modelCode,itemCode,"Y",dataAuth});
        if (sList != null && !sList.isEmpty())
        {
          modelAction.setAjaxString("Y");
        }
        else
        {
          modelAction.setAjaxString("N");
        }

      }
      else
      {
        modelAction.setAjaxString("");
      }
      return BaseActionSupport.AJAX;

    }
    CommMethod.listToEscapeJs(sList);
    modelAction.setAjaxList(sList);
    return BaseActionSupport.AJAX;

  }
}
