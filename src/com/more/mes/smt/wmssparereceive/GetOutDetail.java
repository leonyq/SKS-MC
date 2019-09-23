package com.more.mes.smt.wmssparereceive;

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
 * 备品领用单信息获取明细信息
 * @author wzy
 *
 */
public class GetOutDetail implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String id = request.getParameter("itemId");
    String dataAuth = modelAction.getRequest().getParameter("dataAuth");
    String sql=" SELECT DISTINCT B.WSO_DOC_NUM,B.WSO_ITEM_CODE,B.WSO_ITEM_NUM,B.WSO_ITEM_SN, "+
               " C.CI_ITEM_NAME,C.CI_ITEM_SPEC,SD.NAME AS DATA_AUTH2 "+
               " FROM T_WMS_SPARE_OUT_DETAIL B "+
               " LEFT JOIN T_CO_ITEM C ON B.WSO_ITEM_CODE=C.CI_ITEM_CODE and C.DATA_AUTH = B.DATA_AUTH "
               + " LEFT JOIN SY_DEPT SD ON SD.ID = B.DATA_AUTH "
               + " where 1=1 ";
    String userId = modelAction.getSessionUser().getId();
    Map<String, String> map = new HashMap<String, String>();
    if(StringUtils.isNotBlank(dataAuth)) {
    	sql += " and B.DATA_AUTH =  :DATA_AUTH1  ";
    	map.put("DATA_AUTH1", dataAuth);
    }else {
    	sql += " and B.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID1 ) ";
    	//sql += " and C.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :USER_ID2 ) ";
    	map.put("USER_ID1", userId);  
    //	map.put("USER_ID2", userId);  
    }

    
    if (StringUtils.isNotBlank(id))
    {
    	sql+=" and B.WSO_DOC_NUM=:id ";
    	map.put("id", id);
    }else{
    sql+=" and B.WSO_DOC_NUM = NULL ";
    	map.put("id", id);
    }
    List list = modelService.listSql(sql, modelAction.getPage(), map, null,  null);
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(list);
    modelAction.getAjaxPage().setDataList(list);
    return BaseActionSupport.AJAX;
  }

}
