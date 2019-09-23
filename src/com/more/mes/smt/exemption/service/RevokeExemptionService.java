package com.more.mes.smt.exemption.service;

import java.util.ArrayList;

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
 * 免检管理撤销
 * @author development
 *
 */
public class RevokeExemptionService implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
	    String formId = request.getParameter("formId");
	    if (StringUtils.isBlank(formId))
	    {
	      formId = request.getParameter("formIds");
	    }
	    String iframeId = request.getParameter("iframeId");
	    try {
	    	String id = request.getParameter("dataId");
	    	String cancleReason = request.getParameter("paraMapObj.QEI_CANCEL_REASON"); // 撤销原因
	    	TableDataMapExt exemption = new TableDataMapExt();
			exemption.setTableName("T_QM_EXEMPTION_INFO");
		    CommMethod.editSysDefCol(exemption.getColMap(), modelAction.getUser());
		    exemption.setSqlWhere(" and ID=? ");
		    ArrayList delList = new ArrayList();
	        delList.add(id);
	        exemption.setSqlWhereArgs(delList);
		    exemption.getColMap().put("QEI_CANCEL_REASON", cancleReason);
		    exemption.getColMap().put("QEI_VALID_FLAG", "N");
		    if(dataAuth!=null){
		    	exemption.getColMap().put("DATA_AUTH", dataAuth);
		    }
		    modelService.edit(exemption);
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("撤销失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("撤销成功"), "0");
	}

}
