package com.more.buss.xgglue.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class ReleaseTinMixInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    
    HttpServletRequest request = modelAction.getRequest();
    List<Object> sqlWlist = new ArrayList<Object>();
    TableDataMapExt td = new TableDataMapExt();
    String infoId = modelAction.getDataId();
    sqlWlist.add(infoId);
  //  String CTT_PASS_FLAG=request.getParameter("CTT_PASS_FLAG");//放行标志
    String ctmPassMemo=request.getParameter("paraMapObj.CTM_PASS_MEMO");//放行说明
        
     Map<String, Object> calMap = td.getColMap();
     td.setTableName("T_CO_TIN_MIX_INFO");
     td.setSqlWhere(" and ID= ? ");
     td.setSqlWhereArgs(sqlWlist);
     //calMap.put("CTT_PASS_MEMO", CTT_PASS_MEMO);

       calMap.put("CTM_PASS_FLAG", "Y"); 
    
    if(("").equals(ctmPassMemo)){
         calMap.put("CTM_PASS_MEMO","");
     }else{
        calMap.put("CTM_PASS_MEMO",ctmPassMemo);
     }
     try
        {
      modelService.edit(td);
       }
    catch (Exception e)
       {
      log.error(e);
      throw new BussException(modelAction.getText("放行失败"), e);
       }
     String iframeId = request.getParameter("iframeId");
     
     //return modelAction.commAjaxFunClassLoadParent(formId, iframeId, Constants.SUCCESS,Constants.OPERATE_TYPE_EDIT);
    return  modelAction.reloadIframeByIds(iframeId, modelAction.getText("放行成功"), "0");
    //return modelAction.alertParentInfo(modelAction.getText(iframeId));
  }

}
