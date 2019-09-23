package com.morelean.mcmes.craftsetting;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 工艺信息--机种关联
 * @author development
 *
 */
public class GetItemCode implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    
    String code = request.getParameter("itemCode");//机种
    
    String name = request.getParameter("itemName");//机种名称
    
    String spce = request.getParameter("itemSpce");//机种料号
    //request.getParameter("paraMap1@0#CT_PRODUCT_STEP")
    String step=request.getParameter("step");//阶别
    
    String face=request.getParameter("face");//面别
    
    //String dataAuth = request.getParameter("dataAuth");
    String dataAuth =String.valueOf( request.getSession().getAttribute("mcDataAuth"));
    
    Map<String, String> map = new HashMap<String, String>();
    
    //同个阶别，面别下不允许出现相同的机种
          
    String sql = " select distinct t2.id,T.CB_ITEM_CODE as CI_ITEM_CODE,T2.CI_ITEM_NAME,t2.CI_ITEM_SPEC from T_CO_BOM t" +
                   " LEFT JOIN T_CO_ITEM T2 " +
    		        " ON T.CB_ITEM_CODE=T2.CI_ITEM_CODE "+
    		        " where  T.CB_ITEM_CODE not in(select t3.CTM_MODEL_CODE" +
    		        " from T_CO_TECH_MODEL t3 where t3.CTM_PROCESS_FACE=:face and " +
    		        " t3.CTM_PRODUCT_STEP=:step and t3.DATA_AUTH=:dataAuth ) and t.DATA_AUTH=:dataAuth and t2.DATA_AUTH=:dataAuth   "; // and t2.DATA_AUTH=:DATAAUTH
   
    
    map.put("face",face);
    map.put("step",step);
    map.put("dataAuth",dataAuth);
    //map.put("dataAuth",dataAuth);
    
    String sqlWhere="  ";
    
    if (StringUtils.isNotBlank(code))
    {
      sqlWhere+=" and CB_ITEM_CODE like '%'||:code||'%'";
      map.put("code", code);
      
    }
    if (StringUtils.isNotBlank(name))
    {
      sqlWhere+=" and CI_ITEM_NAME like '%'||:name||'%'";
      map.put("name", name);
      
    }
    if (StringUtils.isNotBlank(spce))
    {
      sqlWhere+=" and CI_ITEM_SPEC like '%'||:spce||'%'";
      map.put("spce", spce);
      
    }
    
    String sql1="select * from (select * from("+sql+sqlWhere+")  w)  r";
    
    List list = modelService.listSql(sql1, modelAction.getPage(), map, " order by CI_ITEM_CODE ", null);
    
    modelAction.setAjaxPage(modelAction.getPage());
    modelAction.getAjaxPage().setDataList(list);
    return BaseActionSupport.AJAX;
  }

}
