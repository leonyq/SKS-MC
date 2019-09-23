package com.more.mes.smt.improveproposal;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存实施确认的改善提案信息
 * @author development
 *
 */
public class SaveImplementProposal implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    String iframeId = request.getParameter("iframeId");
	    try {
	    	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	String dataId = request.getParameter("dataId");
	    	String cipImplementConfirm = request.getParameter("paraMapObj.CIP_IMPLEMENT_CONFIRM");//实施确认
			//插入改善提案信息
	    	List<Object> sqlWList = new ArrayList<Object>();
	    	sqlWList.add(dataId);
	    	sqlWList.add(dataAuth);
			TableDataMapExt imp = new TableDataMapExt();
			imp.setTableName("T_CO_IMPROVE_PROPOSAL");
		 	CommMethod.editSysDefCol(imp.getColMap(), modelAction.getUser());
		 	imp.setSqlWhere(" and id=? and data_auth=? ");
		 	imp.setSqlWhereArgs(sqlWList);
		 	imp.getColMap().put("CIP_IMPLEMENT_CONFIRM", cipImplementConfirm);
		 	imp.getColMap().put("CIP_CONFIRM_EMP", CommMethod.getSessionUser().getLoginName());
		 	imp.getColMap().put("CIP_CONFIRM_DATE", sdf1.parse(sdf1.format(new Date())));
		 	imp.getColMap().put("CIP_STATUS", "2");
		 	if(dataAuth!=null){
		 		imp.getColMap().put("DATA_AUTH", dataAuth);
		    }
		 	modelService.edit(imp);
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("保存失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), "0");
	}
	
}
