package com.more.mes.smt.feeder.service.base;

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
 * @Description 获得FEEDER列表
 * @ClassName ShowFdInfoService
 * @author csj
 * @Company: morelean
 */
public class ShowFdInfoService implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    Map<String, Object> map = new HashMap<String, Object>();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String zjSn = request.getParameter("zj_sn");
    String zjType = request.getParameter("zj_type");
    String searchLike = request.getParameter("searchLike");
    String sqlList = "select info.ID,info.TCF_FEEDER_SN,info.TCS_SPEC,info.TCT_TYPE,info.TCF_MT_LASTTIME"
                     + " from T_CO_FEEDER_INFOR info where 1=1 ";
    Map<String,Object> paraMap = new HashMap<String,Object>();
    sqlList += " and info.DATA_AUTH=:DATA_AUTH";
    paraMap.put("DATA_AUTH", dataAuth);
    if (StringUtils.isNotBlank(zjSn))
    {
      if (StringUtils.isBlank(searchLike)) {
    	  sqlList += " and info.TCF_FEEDER_SN like '%' || :TCF_FEEDER_SN || '%'";
    	  paraMap.put("TCF_FEEDER_SN", zjSn);
      }else {
    	  sqlList += " and info.TCF_FEEDER_SN = :TCF_FEEDER_SN ";
    	  paraMap.put("TCF_FEEDER_SN", zjSn);
      }
    }
    if (StringUtils.isNotBlank(zjType) && !"0".equals(zjType))
    {
      sqlList += " and info.TCT_TYPE= :TCT_TYPE ";
      paraMap.put("TCT_TYPE", zjType);
    }

    List zjList = modelService.listSql(sqlList, modelAction.getPage(), paraMap, null, null);
    map.put("zjList", zjList);
    CommMethod.listToEscapeJs(zjList);
    modelAction.setAjaxPage(modelAction.getPage());
    modelAction.getAjaxPage().setDataList(zjList);

    return BaseActionSupport.AJAX;
  }

}
