package com.more.mes.smt.storeitemmanager;

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
 * 
 * @Title <获取回填信息>
 * @Description <获取回填信息> 
 * @ClassName GetIngredients
 * @see GetIngredients
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class GetIngredients implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
	    // TODO Auto-generated method stub
	    HttpServletRequest request = modelAction.getRequest();
	    Map<String, String> map = new HashMap<String, String>();
	    String id = request.getParameter("dataId");
	    String sql ="select * from T_CO_ASSISTANTTOOL where id=?";
	   /* String sqlWhere=" where 1=1";
	    if (StringUtils.isNotBlank(ID))
	    {
	        
	         sqlWhere=" and id = '"+ID+"'";
	      //  sqlWhere=" and id = :ID";
	      //sqlWhere=" and id = :ID";
	      // map.put("ID", ID);
	    }*/
	    List itemList = modelService.listDataSql(sql,new Object[] {id});
	    // List itemList = modelService.listSql(sql+sqlWhere, null, map, null, null);
	    modelAction.setAjaxList(itemList);
	    CommMethod.listMapToEscapeJs(itemList);
	    return BaseActionSupport.AJAX;
	  }

}
