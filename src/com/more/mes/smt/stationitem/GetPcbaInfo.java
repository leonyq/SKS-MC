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
 * @Description PCB关联获取PCBA信息
 * @ClassName GetPcbaInfo
 * @author WZY
 * 
 */
public class GetPcbaInfo implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    
    HttpServletRequest request = modelAction.getRequest();
    
    String dataId=request.getParameter("dataId");
    
    String sql = "select t.*,t2.NAME,to_char(T.SPLIT_TIME,'yyyy-mm-dd hh24:mi:ss') WPI_TIMES from T_CO_SN_RELATION t "
                +" left join T_WIP_PCB_ITEM t1 on t1.SPLIT_GROUP_ID=t.SPLIT_GROUP_OLDID  "
                +" left join SY_USER t2 on t2.login_name = t.SPLIT_EMP where 1=1 ";
    Map<String, String> map = new HashMap<String, String>();
    if (StringUtils.isNotBlank(dataId))
    {
    	sql+=" and t1.id=:dataId ";
      map.put("dataId", dataId);
    }
    
    List list = modelService.listSql(sql, modelAction.getPage(), map, null, null);
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(list);
    modelAction.getAjaxPage().setDataList(list);
    
    return BaseActionSupport.AJAX;
  }

}
