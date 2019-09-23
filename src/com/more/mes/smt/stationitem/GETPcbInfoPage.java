package com.more.mes.smt.stationitem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * @Description PCB关联条件有pcba是查询方法
 * @ClassName GetPcbaInfo
 * @author WZY
 * 
 */
public class GETPcbInfoPage implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String wpiPcbSn = request.getParameter("WPI_PCB_SN");
    String wpiItemCode = request.getParameter("WPI_ITEM_CODE");
    String wpiMoNumber = request.getParameter("WPI_MO_NUMBER");
    String PCBA = request.getParameter("PCBA");
    String wpiTimeBegin = request.getParameter("WPI_TIME_BEGIN");
    String wpiTimeEnd = request.getParameter("WPI_TIME_END");
    String dataAuth = request.getParameter("DATA_AUTH");
    String newSn = request.getParameter("newSn");
    String userId = modelAction.getSessionUser().getId();
    
    String querySql = "SELECT distinct t3.name as data_auth2, T.Id, T.SPLIT_GROUP_ID,T.WPI_PCB_SN,T.WPI_ITEM_CODE,T.WPI_ITEM_NAME,T.WPI_ITEM_SPEC, "
      + " T.WPI_ITEM_COUNT,T1.SUPPLIER_NAME,T.WPI_MO_NUMBER,T.WPI_LOT_NUMBER,T.WPI_ITEM_MARK_CODE,"
      + " T.WPI_TRACE_FLAG,T4.NAME,T.WPI_EMP,to_char(T.WPI_TIME,'yyyy-mm-dd hh24:mi:ss') WPI_TIMES"
      + " FROM T_WIP_PCB_ITEM T"
      + " left join SY_USER T4 on T4.LOGIN_NAME=T.WPI_EMP"
      + " LEFT JOIN T_CO_SUPPLIER T1 ON T1.supplier_code=T.WPI_ITEM_SUPPLIERS"
      + " left join T_CO_SN_RELATION T2  on (t.SPLIT_GROUP_ID = t2.split_group_id"
      + " or t2.SPLIT_GROUP_OLDID=t.split_group_id) AND T.DATA_AUTH=T2.DATA_AUTH " +
      "   left join sy_dept t3 on t3.id=t.data_auth " + " where 1=1 ";
    Map<String, String> map = new HashMap<String, String>();
    if(StringUtils.isNotBlank(PCBA)){
      querySql += " AND T2.OLD_SN LIKE '%' || :PCBA || '%' ";
      map.put("PCBA", PCBA);
    }
    
    if(StringUtils.isNotBlank(newSn)){
      querySql += " AND T2.NEW_SN LIKE '%' || :newSn || '%' ";
      map.put("newSn", newSn);
    }
    
    if(StringUtils.isNotBlank(wpiPcbSn)){
      querySql += " AND T.WPI_PCB_SN LIKE '%' || :wpiPcbSn || '%'";
      map.put("wpiPcbSn", wpiPcbSn);
    }
    if(StringUtils.isNotBlank(wpiItemCode)){
      querySql += " AND T.WPI_ITEM_CODE LIKE '%' || :wpiItemCode || '%'";
      map.put("wpiItemCode", wpiItemCode);
    }
    if(StringUtils.isNotBlank(wpiMoNumber)){
      querySql += " AND T.WPI_MO_NUMBER LIKE '%' || :wpiMoNumber || '%'";
      map.put("wpiMoNumber", wpiMoNumber);
    }
    if(StringUtils.isNotBlank(dataAuth)){
      querySql += " AND T.DATA_AUTH =:dataAuth";
      map.put("dataAuth", dataAuth);
    }else {
      querySql += " and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID ) ";
      map.put("USER_ID", userId); 
    }
    if (StringUtils.isNotBlank(wpiTimeBegin))
    {
      querySql += " and T.WPI_TIME >=to_date(:wpiTimeBegin,'yyyy-mm-dd hh24:mi:ss')";
      map.put("wpiTimeBegin", wpiTimeBegin);

     }
    if (StringUtils.isNotBlank(wpiTimeEnd))
    {
      querySql += " and T.WPI_TIME <=to_date(:wpiTimeEnd,'yyyy-mm-dd hh24:mi:ss')";
      map.put("wpiTimeEnd", wpiTimeEnd);
    }
  
    List list = modelService.listSql(querySql, modelAction.getPage(), map, null, null);
 
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(list);
    modelAction.getAjaxPage().setDataList(list);
    
    return BaseActionSupport.AJAX;
  }

}
