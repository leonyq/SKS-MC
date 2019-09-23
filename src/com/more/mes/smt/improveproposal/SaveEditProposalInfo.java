package com.more.mes.smt.improveproposal;


import java.util.ArrayList;
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
 * 保存修改的改善提案信息
 * @author development
 *
 */
public class SaveEditProposalInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    String iframeId = request.getParameter("iframeId");
	    try {
	    	String dataId = request.getParameter("dataId");
	    	String cipName = request.getParameter("paraMapObj.CIP_NAME");//提案名称
			String cipDept = request.getParameter("paraMapObj.CIP_DEPT");//提案部门
			String cipBadType = request.getParameter("paraMapObj.CIP_BAD_TYPE");//不良类型
			String cipCurrentMethods = request.getParameter("paraMapObj.CIP_CURRENT_METHODS");//现行方法
			String cipBadReason = request.getParameter("paraMapObj.CIP_BAD_REASON");//不良原因
			String cipImproveMethods = request.getParameter("paraMapObj.CIP_IMPROVE_METHODS");//改善方法
			String cipExceptResult = request.getParameter("paraMapObj.CIP_EXCEPT_RESULT");//预期结果
			String sql = "select CIP_NAME from T_CO_IMPROVE_PROPOSAL where CIP_NAME=? and id !=? AND DATA_AUTH=? ";
			List count = modelService.listDataSql(sql,new Object[] {cipName,dataId,dataAuth});
			if(count.size()!=0){
				return modelAction.alertParentInfo(modelAction.getText("提案名称已存在"));
			}
			//插入改善提案信息
		    List<Object> sqlWList = new ArrayList<Object>();
			TableDataMapExt imp = new TableDataMapExt();
			imp.setTableName("T_CO_IMPROVE_PROPOSAL");
		 	CommMethod.editSysDefCol(imp.getColMap(), modelAction.getUser());
		 	sqlWList.add(dataId);
		 	sqlWList.add(dataAuth);
		 	imp.setSqlWhere(" and id=? and data_auth=? ");
		 	imp.setSqlWhereArgs(sqlWList);
		 	imp.getColMap().put("CIP_NAME", cipName);
		 	imp.getColMap().put("CIP_DEPT", cipDept);
		 	imp.getColMap().put("CIP_CURRENT_METHODS", cipCurrentMethods);
		 	imp.getColMap().put("CIP_BAD_TYPE", cipBadType);
		 	imp.getColMap().put("CIP_BAD_REASON", cipBadReason);
		 	imp.getColMap().put("CIP_IMPROVE_METHODS", cipImproveMethods);
		 	imp.getColMap().put("CIP_EXCEPT_RESULT", cipExceptResult);
		 	if(dataAuth!=null){
		 		imp.getColMap().put("DATA_AUTH", dataAuth);
		    }
		 	modelService.edit(imp);
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("修改失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}
	
}
