package com.more.mes.smt.invalidproducttime;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取在线制令单信息表
 */
public class GetCsiInfo implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String areaSn = request.getParameter("areaSn");
    //String dauth =request.getSession().getAttribute("mcDataAuth").toString();
    String dauth = String.valueOf(request.getSession().getAttribute("mcDataAuth"));
    String sql = "SELECT A.PMO_NUMBER,A.PMO_PROJECT_ID,"
                 + " B.CSI_AREA_SN,B.CSI_STATUS,TO_CHAR(B.CSI_BEGIN_TIME ,'yyyy-mm-dd HH24:MI:ss') BEGIN_TIME,"
                 + "TO_CHAR(B.CSI_END_TIME, 'yyyy-mm-dd HH24:MI:ss') END_TIMES"
                 + " FROM T_PM_MO_ONLINE A"
                 + "  LEFT JOIN T_CO_STOPLINE_INFO B ON A.PMO_AREA_SN=B.CSI_AREA_SN and A.DATA_AUTH=b.DATA_AUTH "
                 + "  where A.PMO_AREA_SN=? and A.DATA_AUTH=?";

    List<Map> list = modelService.listDataSql(sql, new Object[] {areaSn,dauth});
    Map<String, Object> map = null;
    if (null != list && list.size() > 0)
    {
      map = list.get(0);
    }
    CommMethod.mapToEscapeJs(map);
    modelAction.setAjaxMap(map);

    return BaseActionSupport.AJAX;
  }

}
