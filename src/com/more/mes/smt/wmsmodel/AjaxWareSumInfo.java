package com.more.mes.smt.wmsmodel;

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

public class AjaxWareSumInfo implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    
    HttpServletRequest request = modelAction.getRequest();
    
    String begin = request.getParameter("begin");
    String end = request.getParameter("end");
    String dataAuth = request.getParameter("dataAuth");
    String itemSn = request.getParameter("itemSn");
    String itemCode = request.getParameter("itemCode");
    String itemName = request.getParameter("itemName");
    String operateType = request.getParameter("operateType");
    String userId = modelAction.getSessionUser().getId();
    
    Map<String, String> map = new HashMap<String, String>();
    
    String sql=" select sum(t1.WTI_ITEM_NUM) as WTI_ITEM_NUM, "+
               " t1.WTI_OPERATE_TYPE,t1.WTI_ITEM_CODE,t1.DATA_AUTH, "+
               " T2.CI_ITEM_NAME,T2.CI_ITEM_SPEC ,t3.NAME"+
               " from T_WMS_TASK_LOG t1 "+
               " left join t_co_item T2 on t1.wti_item_code=T2.ci_item_code "+
               " left join SY_DEPT t3 on t3.id = t1.DATA_AUTH";
    String sqlWhere = " where 1=1 ";
    if (StringUtils.isNotBlank(begin))
    {
      sqlWhere += " and t1.WTI_OPERATE_TIME >= to_date( :begin1  ,'yyyy-mm-dd hh24:mi:ss')";
      map.put("begin1", begin);
    }
    if (StringUtils.isNotBlank(end))
    {
      sqlWhere += " and t1.WTI_OPERATE_TIME <= to_date( :end1  ,'yyyy-mm-dd hh24:mi:ss')";
      map.put("end1", end);
    }
    if (StringUtils.isNotBlank(dataAuth))
    {
      sqlWhere += " and t1.DATA_AUTH = :dataAuth1";
      map.put("dataAuth1", dataAuth);
    }else {
	   sqlWhere += " and t1.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID ) ";
	   map.put("USER_ID", userId); 
	        }
    if (StringUtils.isNotBlank(itemSn))
    {
      sqlWhere += " and t1.WTI_ITEM_SN like '%' || :itemSn1 || '%' ";
      map.put("itemSn1", itemSn);
    }
    if (StringUtils.isNotBlank(itemCode))
    {
      sqlWhere += " and t1.WTI_ITEM_CODE like '%' || :itemCode1 || '%' ";
      map.put("itemCode1", itemCode);
    }
    if (StringUtils.isNotBlank(itemName))
    {
      sqlWhere += " and t2.CI_ITEM_NAME like '%' || :itemName1 || '%' ";
      map.put("itemName1", itemName);
    }
    if (StringUtils.isNotBlank(operateType))
    {
      sqlWhere += " and t1.WTI_OPERATE_TYPE like '%' || :operateType1 || '%' ";
      map.put("operateType1", operateType);
    }
    
    
    String groupSql=" group by WTI_OPERATE_TYPE,WTI_ITEM_CODE, t1.DATA_AUTH,CI_ITEM_NAME,CI_ITEM_SPEC,NAME ";
    
    String sql1 = "Select * from ("+sql+sqlWhere+groupSql+")aa ";
    List itemList = modelService.listSql(sql1, modelAction.getPage(), map, null,null);
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listToEscapeJs(itemList);
    modelAction.getAjaxPage().setDataList(itemList);
    return BaseActionSupport.AJAX;
  }

  
}
