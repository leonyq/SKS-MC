package com.more.mes.smt.wmssparereceive;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;



/**
 * 备品领用单信息获取明细分页
 * @author wzy
 *
 */
public class GetOutDetailPage implements FuncService
{

  @SuppressWarnings({"rawtypes", "static-access"})
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String ID = request.getParameter("itemId");
    String wsoItemSn = request.getParameter("WSO_ITEM_SN");
    String wsoItemCode = request.getParameter("WSO_ITEM_CODE");
    String wsoDocNum = request.getParameter("WSO_DOC_NUM");
    String dataAuth = modelAction.getRequest().getParameter("dataAuth");
    String sql=" SELECT DISTINCT B.WSO_DOC_NUM,B.WSO_ITEM_CODE,B.WSO_ITEM_NUM,B.WSO_ITEM_SN, "+
               " C.CI_ITEM_NAME,C.CI_ITEM_SPEC"+
               " FROM T_WMS_SPARE_OUT_DETAIL B "+
               " LEFT JOIN T_CO_ITEM C ON B.WSO_ITEM_CODE=C.CI_ITEM_CODE and C.DATA_AUTH =B.DATA_AUTH  where 1=1 ";
    Map<String, String> map = new HashMap<String, String>();
    if(StringUtils.isNotBlank(dataAuth)) {
    	sql += " and B.DATA_AUTH =  :DATA_AUTH1  ";
    	map.put("DATA_AUTH1", dataAuth);
    
    }
    if (StringUtils.isNotBlank(ID))
    {
    	sql+=" and B.WSO_DOC_NUM=:ID";
    	map.put("ID", ID);
    }
    if (StringUtils.isNotBlank(wsoItemSn))
    {
    	sql+=" and B.WSO_ITEM_SN=:wsoItemSn";
    	map.put("wsoItemSn", wsoItemSn);
    }
    if (StringUtils.isNotBlank(wsoItemCode))
    {
    	sql+=" and B.WSO_ITEM_CODE=:wsoItemCode";
    	map.put("wsoItemCode", wsoItemCode);
    }
    if (StringUtils.isNotBlank(wsoDocNum))
    {
    	sql+=" and B.WSO_DOC_NUM=:wsoDocNum ";
    	map.put("wsoDocNum", wsoDocNum);
    }
    
    List list = modelService.listSql(sql, modelAction.getPage(), map, null, null);
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(list);
    modelAction.getAjaxPage().setDataList(list);
    return modelAction.AJAX;
  }

}
