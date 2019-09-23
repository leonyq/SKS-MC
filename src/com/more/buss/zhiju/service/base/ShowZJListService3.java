package com.more.buss.zhiju.service.base;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 制具维保 选择制具
 * @author development
 *
 */
public class ShowZJListService3 implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request=modelAction.getRequest();
    Map<String,Object> map=new HashMap<String,Object> ();
    String zjSn=request.getParameter("zj_sn");
    String zjType=request.getParameter("zj_type");
    String auth = request.getSession().getAttribute("mcDataAuth").toString();
    List<String> param=new ArrayList<String>();
    Map<String,Object> sqlWMap = new HashMap<String,Object>();
    String sqlWhere="";
    String sqlList="select info.ID,info.CFI_FIX_SN, sdv.value, info.CFI_ITEM_CODE," +
        "tool.assistanttoolname,to_char(info.CFI_INSTOCK_TIME,'yyyy-MM-dd hh24:mi:ss') as CFI_INSTOCK_TIME " +
 " from T_CO_FIXTURE_INFO info, T_CO_ASSISTANTTOOL tool,sy_dict_val sdv where 1=1 and info.DATA_AUTH=:auth and tool.DATA_AUTH=:auth1 " ;
    
/* " where info.cfi_item_code=tool.assistanttoolno" +
 " and tool.assistanttooltype=sdv.code" +
 " and sdv.dict_code= 'ASSISTANTTOOL_TYPE'";*/
    
  /*  sqlWhere += " and info.cfi_item_code=tool.assistanttoolno" ;
    sqlWhere += " and tool.assistanttooltype=sdv.code" ; 
    sqlWhere += " and sdv.dict_code= 'ASSISTANTTOOL_TYPE' "; */
    
    sqlList += " and info.cfi_item_code=tool.assistanttoolno" ;
    sqlList += " and tool.assistanttooltype=sdv.code" ; 
    sqlList += " and sdv.dict_code= 'ASSISTANTTOOL_TYPE' ";
    
      if(StringUtils.isNotBlank(zjSn)){
        sqlList +=" and CFI_FIX_SN like '%' || :CFI_FIX_SN || '%'";
        sqlWMap.put("CFI_FIX_SN", zjSn);
       // sqlWhere += " and  CFI_FIX_SN  like ?";
      //   param.add("%"+zjSn+"%");
      //  param.add(zjSn);
      }
      if(StringUtils.isNotBlank(zjType)&&!"0".equals(zjType)){
        sqlList+=" and CFI_ITEM_TYPE= :CFI_ITEM_TYPE ";
        sqlWMap.put("CFI_ITEM_TYPE", zjType);
      //  sqlWhere+=" and CFI_ITEM_TYPE=?";
      //  param.add(zjType);
      }
      if(StringUtils.isNotBlank(auth)){
        sqlList +=" and info.DATA_AUTH =:auth and tool.DATA_AUTH=:auth1 ";
        sqlWMap.put("auth", auth);
        sqlWMap.put("auth1", auth);
       // sqlWhere += " and  CFI_FIX_SN  like ?";
      //   param.add("%"+zjSn+"%");
      //  param.add(zjSn);
      }
      
      //List zjList=modelService.listSql(sql0,null,null,null,null,null);
      List<Map<String,Object>> zjList=modelService.listSql(sqlList,modelAction.getPage(),sqlWMap,null,null);
      map.put("zjList", zjList);
     // modelAction.setAjaxMap(map);
      CommMethod.listMapToEscapeJs(zjList);
      modelAction.setAjaxPage(modelAction.getPage());
      modelAction.getAjaxPage().setDataList(zjList);
      
      return BaseActionSupport.AJAX;
  }

}
