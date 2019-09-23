package com.more.buss.xgglue.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.Constants;

/**
 * 辅料放行结果的判断
 * @author zx
 *
 */

public class IngredientsRelease implements FuncService{
	
	 private final Log log = LogFactory.getLog(this.getClass());
	
	@SuppressWarnings("unchecked")

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		TableDataMapExt td = new TableDataMapExt();
		String infoId = modelAction.getDataId();
		String cttPassFlag=request.getParameter("CTT_PASS_FLAG");//放行标志
		String cttPassMemo=request.getParameter("paraMapObj.CTT_PASS_MEMO");//放行说明
				
		 Map<String, Object> calMap = td.getColMap();
		 List<Object> sqlWlist = new ArrayList<Object>();
		 td.setTableName("T_CO_TIN_THAWING_INFO");
		 //td.setSqlWhere("and ID='" + infoId + "'");
		 td.setSqlWhere(" and ID= ? ");
		 sqlWlist.add(infoId);
	     td.setSqlWhereArgs(sqlWlist);
		 //calMap.put("CTT_PASS_MEMO", CTT_PASS_MEMO);
		 if("Y".equals(cttPassFlag)){
			 calMap.put("CTT_PASS_FLAG", cttPassFlag);
		 }else{
			 calMap.put("CTT_PASS_FLAG", "Y"); 
		 }
 		if(("").equals(cttPassMemo)){
 		     calMap.put("CTT_PASS_MEMO","");
 		 }else{
		    calMap.put("CTT_PASS_MEMO",cttPassMemo);
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
		 String formId = request.getParameter("formId");
		 //String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");
		 String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		 String iframeId = request.getParameter("iframeId");
		 
		 //return modelAction.commAjaxFunClassLoadParent(formId, iframeId, Constants.SUCCESS,Constants.OPERATE_TYPE_EDIT);
		return  modelAction.reloadIframeByIds(iframeId, modelAction.getText("放行成功"), "0");
		//return modelAction.alertParentInfo(modelAction.getText(iframeId));
	}
}