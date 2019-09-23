package com.more.buss.eis.bd.basedos.service;

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
public class GetPrintTemplate implements FuncService
{
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String vrClass=request.getParameter("CLAS");//项目编码
    String dataAuth=request.getParameter("dataAuth");
    String sql="select b.LABEL_NAME from T_CO_ITEM_GROUP a left join ML_TEMPLATE b on b.id=a.cig_print_template";
    String sqlWhere = "";
     sqlWhere+= " and 1=1 ";
    List<Object> sqlwList = new ArrayList<Object>();
    if (StringUtils.isNotBlank(dataAuth))
    {
        
        sqlWhere+="and a.DATA_AUTH = ? ";
        sqlwList.add(dataAuth);
    }
    /*if (StringUtils.isNotBlank(dataAuth))
    {
        
        sqlWhere+="and b.DATA_AUTH = ? ";
        sqlwList.add(dataAuth);
    }*/
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
