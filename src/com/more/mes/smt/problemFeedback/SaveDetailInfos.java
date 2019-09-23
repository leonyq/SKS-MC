package com.more.mes.smt.problemFeedback;

import java.text.SimpleDateFormat;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存新增问题反馈信息
 * 
 * 
 * @author ht
 *
 */
public class SaveDetailInfos implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");// 是否关闭窗口
		String formId = request.getParameter("formId");
        if (StringUtils.isBlank(formId))
        {
          formId = request.getParameter("formIds");
        }
        String iframeId = request.getParameter("iframeId");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	    try{
	        String userId = CommMethod.getSessionUser().getId();// 创建人
	        String cpfSn = execproblemNo(dataAuth,"DJ25","",modelService);// 问题编号
	       
	       
	       
	       
	        
	        String cpfPriority = request.getParameter("paraMap1@0#CPF_PRIORITY");// 优先级
	        String cpfProblemBelong= request.getParameter("paraMap1@0#CPF_PROBLEM_BELONG");// 问题归属
	        String cpfProposalScheme= request.getParameter("paraMap1@0#CPF_PROPOSAL_SCHEME");// 建议方案
	        String cpfAbstract = request.getParameter("paraMap1@0#CPF_ABSTRACT");// 问题摘要
			String cpfType = request.getParameter("paraMap1@0#CPF_TYPE");// 问题类型
			String cpfDescrib = request.getParameter("paraMap1@0#CPF_DESCRIBE");// 问题描述
			String cpsProblemProject = request.getParameter("paraMap1@0#CPF_PROBLEM_PROJECT");// 项目名称
			String cpfHandleEmp = request.getParameter("paraMap1@0#CPF_HANDLE_EMP");// 责任人
			String cpfLiabilityDept = request.getParameter("paraMap1@0#CPF_LIABILITY_DEPT");// 责任部门
			String cpfRequestDate = request.getParameter("paraMap1@0#CPF_REQUEST_DATE");// 需求时间
			
			//插入新的问题反馈信息
	        TableDataMapExt saveExt = new TableDataMapExt();	        
	        
	        saveExt.setTableName("T_CO_PROBLEM_FEEDBACK");	        
	        
	        CommMethod.addSysDefCol(saveExt.getColMap(), modelAction.getUser());
	        
	        saveExt.getColMap().put("CPF_SN", cpfSn);//问题编号
	        saveExt.getColMap().put("CPF_STATUS", "1");//状态
	        saveExt.getColMap().put("CPF_PRIORITY", cpfPriority);//优先级
	        saveExt.getColMap().put("CPF_PROBLEM_BELONG", cpfProblemBelong);//问题归属
	        saveExt.getColMap().put("CPF_PROPOSAL_SCHEME", cpfProposalScheme);//建议方案
	        saveExt.getColMap().put("CPF_ABSTRACT", cpfAbstract);//问题摘要
	        saveExt.getColMap().put("CPF_TYPE", cpfType);//问题类型
	        saveExt.getColMap().put("CPF_DESCRIBE", cpfDescrib);//问题描述
	        saveExt.getColMap().put("CPF_PROBLEM_PROJECT", cpsProblemProject);//项目名称
	        saveExt.getColMap().put("CPF_HANDLE_EMP", cpfHandleEmp);//责任人
	        saveExt.getColMap().put("CPF_LIABILITY_DEPT", cpfLiabilityDept);// 责任部门
	        if(!cpfRequestDate.equals("")){
	        	saveExt.getColMap().put("CPF_REQUEST_DATE", sdf1.parse(cpfRequestDate));// 需求时间
	        }
	        saveExt.getColMap().put("CPF_LAUNCH_EMP", userId);// 创建人
	        saveExt.getColMap().put("CPF_LAUNCH_DATE", DateUtil.getCurDate());//创建时间
	        if(dataAuth!=null && !dataAuth.equals("")){
	            saveExt.getColMap().put("DATA_AUTH", dataAuth);
	        }
	        modelService.save(saveExt);
	        
	        }catch (Exception e) {
				log.error(e);
				throw new BussException(modelAction.getText("新增失败"), e);
			}
	    	return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"),isCloseWin);
	     }
	@SuppressWarnings("unchecked")
	private String execproblemNo(String dataAuth,String prefix,String dispatchSn,ModelService modelService) {
		// TODO Auto-generated method stub
		ProFuncDto pf = new ProFuncDto();
	    int[] inPlace = {1, 2, 3};
	      int[] outplace = {4, 5};
	      List<Object> list = new ArrayList<Object>();
	      List<Object> outType = new ArrayList<Object>();
	      list.add(dataAuth);
	      list.add(prefix);
	      list.add(dispatchSn);
	      outType.add("String");
	      outType.add("String");
	      pf.setClassName("P_C_GET_DOC_NO");//生成检验单号
	      pf.setInPlace(inPlace);//存储过程中in 
	      pf.setOutPlace(outplace); //存储过程中out
	      pf.setValArgs(list);//存储过程中输入的参数
	      pf.setTotalLen(list.size()+outType.size());//总个数
	      pf.setOutValType(outType);//输出的参数
	      List<Object> relist = modelService.procComm(pf);//接收返回值
	      String res = (String) relist.get(0);  //结果
	    return res;
	}
}
