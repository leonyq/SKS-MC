package com.more.mes.smt.stationitem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ibm.pkcs11.r;
import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 物料作业记录-查看
 * @author development
 *
 */
public class ShowStationItem implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    
    String id = request.getParameter("id");
    String type = request.getParameter("type");
    
    String sqlWhere="where 1=1";
    Map<String, String> map = new HashMap<String, String>();
    if (StringUtils.isNotBlank(id))
    {
      sqlWhere+=" and T.ID =:id";
      map.put("id", id);
    }
    String sqlWhere1="where 1=1";
    if (StringUtils.isNotBlank(id))
    {
      sqlWhere1+=" and T1.ID =:id1";
      map.put("id1", id);
    }
    String sql = null;
    
    if (type.equals("1"))
    {
      sql= "select T.*,A.NAME,B.CA_NAME,C.ca_name AS AREA_NAME1,D.VALUE,E.VALUE AS ACTIONTYPE, "+
        "F.VALUE AS ITEM_TYPE,to_char(T.WSI_LOADTIME,'yyyy-mm-dd hh24:mi:ss') LOADTIME, G.SUPPLIER_NAME "+
        " from T_WIP_STATION_ITEM T"+
        " left join sy_user A on T.WSI_EMP=A.LOGIN_NAME "+
        " LEFT JOIN t_co_area B ON B.ca_id = T.WSI_AREA_ID "+
        "LEFT JOIN t_co_area C ON C.ca_id = T.WSI_WORKSTATION_SN "+
        " left join sy_dict_val D ON D.DICT_CODE='MO_PROCESS_FACE' AND D.CODE=T.WSI_PROCESS_FACE "+
        " left join sy_dict_val E ON E.DICT_CODE='ACTION_TYPE' AND E.CODE=T.WSI_ACTIONTYPE "+
        " left join sy_dict_val F ON F.DICT_CODE='WSI_ITEM_TYPE' AND F.CODE=T.WSI_ITEM_TYPE "+
        "  left join t_co_supplier G on G.SUPPLIER_CODE=T.WSI_SUPPLIERS "
        +sqlWhere+
        " union all "+
        "select T1.*,TA.NAME,TB.CA_NAME,TC.ca_name AS AREA_NAME1,TD.VALUE,TE.VALUE AS ACTIONTYPE, "+
        "TF.VALUE AS ITEM_TYPE,to_char(T1.WSI_LOADTIME,'yyyy-mm-dd hh24:mi:ss') LOADTIME,TG.SUPPLIER_NAME "+
        "from T_WIP_STATION_ITEM_LOG T1 "+
        " left join sy_user TA on T1.WSI_EMP=TA.LOGIN_NAME "+
        " LEFT JOIN t_co_area TB ON TB.ca_id = T1.WSI_AREA_ID "+
        "LEFT JOIN t_co_area TC ON TC.ca_id = T1.WSI_WORKSTATION_SN "+
        " left join sy_dict_val TD ON TD.DICT_CODE='MO_PROCESS_FACE' AND TD.CODE=T1.WSI_PROCESS_FACE "+
        " left join sy_dict_val TE ON TE.DICT_CODE='ACTION_TYPE' AND TE.CODE=T1.WSI_ACTIONTYPE "+
        " left join sy_dict_val TF ON TF.DICT_CODE='WSI_ITEM_TYPE' AND TF.CODE=T1.WSI_ITEM_TYPE "+
        "  left join t_co_supplier TG on TG.SUPPLIER_CODE=T1.WSI_SUPPLIERS "
        +sqlWhere1;
    }else if (type.equals("2")) {
      sql= "select T.*,A.NAME,B.CA_NAME,C.ca_name AS AREA_NAME1,D.VALUE,E.VALUE AS ACTIONTYPE, "+
        "to_char(T.WSI_LOADTIME,'yyyy-mm-dd hh24:mi:ss') LOADTIME, G.SUPPLIER_NAME "+
        " from T_WIP_PREPARE_ITEM_OFFLINE T"+
        " left join sy_user A on T.WSI_EMP=A.LOGIN_NAME "+
        " LEFT JOIN t_co_area B ON B.ca_id = T.WSI_AREA_ID "+
        "LEFT JOIN t_co_area C ON C.ca_id = T.WSI_WORKSTATION_SN "+
        " left join sy_dict_val D ON D.DICT_CODE='MO_PROCESS_FACE' AND D.CODE=T.WSI_PROCESS_FACE "+
        " left join sy_dict_val E ON E.DICT_CODE='ACTION_TYPE' AND E.CODE=T.WSI_ACTIONTYPE "+
        "  left join t_co_supplier G on G.SUPPLIER_CODE=T.WSI_SUPPLIERS "
        +sqlWhere+
        " union all "+
        "select T1.*,TA.NAME,TB.CA_NAME,TC.ca_name AS AREA_NAME1,TD.VALUE,TE.VALUE AS ACTIONTYPE, "+
        "to_char(T1.WSI_LOADTIME,'yyyy-mm-dd hh24:mi:ss') LOADTIME,TG.SUPPLIER_NAME "+
        "from T_WIP_PREPARE_ITEM_LOG T1 "+
        " left join sy_user TA on T1.WSI_EMP=TA.LOGIN_NAME "+
        " LEFT JOIN t_co_area TB ON TB.ca_id = T1.WSI_AREA_ID "+
        "LEFT JOIN t_co_area TC ON TC.ca_id = T1.WSI_WORKSTATION_SN "+
        " left join sy_dict_val TD ON TD.DICT_CODE='MO_PROCESS_FACE' AND TD.CODE=T1.WSI_PROCESS_FACE "+
        " left join sy_dict_val TE ON TE.DICT_CODE='ACTION_TYPE' AND TE.CODE=T1.WSI_ACTIONTYPE "+
        "  left join t_co_supplier TG on TG.SUPPLIER_CODE=T1.WSI_SUPPLIERS "
        +sqlWhere1;
    }
    
   

String sql1 = "select * from ("+sql+")aa ";

List poList = modelService.listSql(sql1, modelAction.getPage(), map, null,null);
modelAction.setAjaxPage(modelAction.getPage());
CommMethod.listMapToEscapeJs(poList);
modelAction.getAjaxPage().setDataList(poList);
return BaseActionSupport.AJAX;
    
  }

}
