package com.more.mcmes.moorder;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.morelean.mes.smt.indicator.service.IndicatorTableService;

/**
 * 制令单上线校验生产指示单
 * @author Administrator
 *
 */
public class CheckNumBfOnLine implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    String mes = "";
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String moNum = request.getParameter("moNum");
    if(checkProjectStatusOk(modelAction,modelService,moNum)){//校验是否工单状态为取消状态 
    IndicatorTableService idService = new IndicatorTableService();
      mes = idService.checkMoNumBfOnline(modelAction, modelService, moNum,dataAuth);//生产指示校验
    }else{
    	mes = CommMethod.getText("工单已取消");
    }
    CommMethod.escapeJs(mes);
    modelAction.setAjaxString(mes);
    return BaseActionSupport.AJAX;
  }
  
   public boolean checkProjectStatusOk(ModelAction modelAction,ModelService modelService,String moNum){
     String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
  	 String sql =  "  SELECT A.ID  FROM  T_PM_MO_BASE A "
  	   + "JOIN T_PM_PROJECT_BASE  B ON A.PM_PROJECT_ID = B.PROJECT_ID AND B.PROJECT_STATUS = '3'  AND A.PM_MO_NUMBER = ? "
  	   + "WHERE A.DATA_AUTH=? AND B.DATA_AUTH=?  " ;
       return modelService.listDataSql(sql, new Object[]{moNum, dataAuth, dataAuth}).size() <= 0;
   }

}
