package com.more.mes.smt.problemFeedback.oracle;

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
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

public class SaveAnswerInfo implements FuncService{

	private final Log log = LogFactory.getLog(this.getClass());
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
	HttpServletRequest request = modelAction.getRequest();
		//String formId =CommMethod.escapeJs(request.getParameter("formId")) ;
	    String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");// 是否关闭窗口
		String formId = request.getParameter("formId");
        if (StringUtils.isBlank(formId))
        {
          formId = request.getParameter("formIds");
        } 
        String iframeId = request.getParameter("iframeId");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	    try{
	       
	        
	        
	        
	        
	        
	        String cpfPriority = request.getParameter("paraMapObj.CPF_PRIORITY");// 优先级
	        String cpfProblemBelong= request.getParameter("paraMapObj.CPF_PROBLEM_BELONG");// 问题归属
	        String cpfProposalScheme= request.getParameter("paraMapObj.CPF_PROPOSAL_SCHEME");// 建议方案
	        String cpfAbstract = request.getParameter("paraMapObj.CPF_ABSTRACT");// 问题摘要
			String cpfType = request.getParameter("paraMapObj.CPF_TYPE");// 问题类型
			String cpfstatus = request.getParameter("paraMapObj.CPF_STATUS");//状态
			//String cpsProblemProject = request.getParameter("paraMapObj.CPF_PROBLEM_PROJECT");// 项目名称
			String cpfHandleEmp = request.getParameter("paraMapObj.CPF_HANDLE_EMP");// 责任人
			String cpfLiabilityDept = request.getParameter("paraMapObj.CPF_LIABILITY_DEPT");// 责任部门
			String cpfExpectedCompletionTime = request.getParameter("paraMapObj.CPF_EXPECTED_COMPLETION_TIME");// 预计完成时间
			String cpfRequestDate = request.getParameter("paraMapObj.CPF_REQUEST_DATE");// 需求时间
			String cpfHandleDate = request.getParameter("paraMapObj.CPF_HANDLE_DATE");// 处理时间
			String cpfHandleWay = request.getParameter("paraMapObj.CPF_HANDLE_WAY");// 处理对策
			
			
			//插入新的答复信息
	        TableDataMapExt saveExt = new TableDataMapExt();	        
	         List<Object> wList = new ArrayList<Object>();
	        saveExt.setTableName("T_CO_PROBLEM_FEEDBACK");	        
	        
	        CommMethod.editSysDefCol(saveExt.getColMap(), modelAction.getUser());
	        
	        saveExt.getColMap().put("CPF_STATUS", cpfstatus);//状态
	        saveExt.getColMap().put("CPF_PRIORITY", cpfPriority);//优先级
	        saveExt.getColMap().put("CPF_PROBLEM_BELONG", cpfProblemBelong);//问题归属
	        saveExt.getColMap().put("CPF_PROPOSAL_SCHEME", cpfProposalScheme);//建议方案
	        saveExt.getColMap().put("CPF_ABSTRACT", cpfAbstract);//问题摘要
	        saveExt.getColMap().put("CPF_TYPE", cpfType);//问题类型
	        
	        //saveExt.getColMap().put("CPF_PROBLEM_PROJECT", cpsProblemProject);//项目名称
	        saveExt.getColMap().put("CPF_HANDLE_EMP", cpfHandleEmp);//责任人
	        saveExt.getColMap().put("CPF_LIABILITY_DEPT", cpfLiabilityDept);// 责任部门
	        if(StringUtils.isNotBlank(cpfExpectedCompletionTime)){
	        	saveExt.getColMap().put("CPF_EXPECTED_COMPLETION_TIME", sdf1.parse(cpfExpectedCompletionTime));// 预计完成时间
	        }
	        if(!cpfRequestDate.equals("")){
	        	saveExt.getColMap().put("CPF_REQUEST_DATE", sdf1.parse(cpfRequestDate));// 需求时间
	        }
	        saveExt.getColMap().put("CPF_HANDLE_DATE", DateUtil.getCurDate());//处理时间
	        saveExt.getColMap().put("CPF_HANDLE_WAY", cpfHandleWay);// 处理对策
	        String dataId=modelAction.getDataId();
	        saveExt.setSqlWhere("and id= ? ");
	        saveExt.setSqlWhereArgs(wList);
	        modelService.edit(saveExt);
	        }catch (Exception e) {
				log.error(e);
				throw new BussException(modelAction.getText("答复失败"), e);
			}
	    	return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"),"0");
	     }

}