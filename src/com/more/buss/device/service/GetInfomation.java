package com.more.buss.device.service;

import java.util.ArrayList;
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
  *要根据对应的视图模型/基础信息：视图公用类的名称来替换继承类SuperServer
  *
  */
public class GetInfomation implements FuncService
{
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String vrClass=request.getParameter("CLAS");//项目编码
    String dataAuth=request.getParameter("dataAuth");
    String sql="select b.CCC_CONFIGURE_NAME from T_CO_ASSISTANTTOOL a left join T_CO_SN_CONFIGURE b on a.tin_create_rule=b.id";
    String sqlWhere = "";
     sqlWhere+= " and 1=1 ";
    List<Object> sqlwList = new ArrayList<Object>();
    if (StringUtils.isNotBlank(dataAuth))
    {
        
        sqlWhere+="and a.DATA_AUTH = ? ";
        sqlwList.add(dataAuth);
    }
    if (StringUtils.isNotBlank(dataAuth))
    {
        
        sqlWhere+="and b.DATA_AUTH = ? ";
        sqlwList.add(dataAuth);
    }
    if (StringUtils.isNotBlank(vrClass))
    {
        
        sqlWhere+="and a.ID = ? ";
        sqlwList.add(vrClass);
    }
    
    List list = modelService.listSql(sql, null, sqlWhere, sqlwList, null, null);//获取参数配置信息
    
    modelAction.setAjaxList(list);
    CommMethod.listMapToEscapeJs(list);	
    
    return BaseActionSupport.AJAX;
  }
}
