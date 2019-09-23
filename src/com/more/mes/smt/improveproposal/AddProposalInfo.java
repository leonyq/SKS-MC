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
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * 保存改善提案信息
 * @author development
 *
 */
public class AddProposalInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
	    String iframeId = request.getParameter("iframeId");
	    try {
	    	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	String cipName = request.getParameter("paraMap1@0#CIP_NAME");//提案名称
			String cipDept = request.getParameter("paraMap1@0#CIP_DEPT");//提案部门
			String cipBadType = request.getParameter("paraMap1@0#CIP_BAD_TYPE");//不良类型
			String cipCurrentMethods = request.getParameter("paraMap1@0#CIP_CURRENT_METHODS");//现行方法
			String cipBadReason = request.getParameter("paraMap1@0#CIP_BAD_REASON");//不良原因
			String cipImproveMethods = request.getParameter("paraMap1@0#CIP_IMPROVE_METHODS");//改善方法
			String cipExceptResult = request.getParameter("paraMap1@0#CIP_EXCEPT_RESULT");//预期结果
			String sql = "select CIP_NAME from T_CO_IMPROVE_PROPOSAL where CIP_NAME=? AND DATA_AUTH=? ";
			List count = modelService.listDataSql(sql,new Object[] {cipName,dataAuth});
			if(count.size()!=0){
				return modelAction.alertParentInfo(modelAction.getText("提案名称已存在"));
			}
			String CIP_SN = getEcnNo(dataAuth,"DJ22","",modelService);//提案编号  
			//插入改善提案信息
			TableDataMapExt imp = new TableDataMapExt();
			imp.setTableName("T_CO_IMPROVE_PROPOSAL");
		 	CommMethod.addSysDefCol(imp.getColMap(), modelAction.getUser());
		 	imp.getColMap().put("CIP_SN", CIP_SN);
		 	imp.getColMap().put("CIP_NAME", cipName);
		 	imp.getColMap().put("CIP_DEPT", cipDept);
		 	imp.getColMap().put("CIP_EMP", CommMethod.getSessionUser().getLoginName());
		 	imp.getColMap().put("CIP_DATE", sdf1.parse(sdf1.format(new Date())));
		 	imp.getColMap().put("CIP_CURRENT_METHODS", cipCurrentMethods);
		 	imp.getColMap().put("CIP_BAD_TYPE", cipBadType);
		 	imp.getColMap().put("CIP_BAD_REASON", cipBadReason);
		 	imp.getColMap().put("CIP_IMPROVE_METHODS", cipImproveMethods);
		 	imp.getColMap().put("CIP_EXCEPT_RESULT", cipExceptResult);
		 	imp.getColMap().put("CIP_STATUS", "1");
		 	if(dataAuth!=null){
		 		imp.getColMap().put("DATA_AUTH", dataAuth);
		    }
		 	modelService.save(imp);
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("新增失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}
	
	@SuppressWarnings("unchecked")
	public String getEcnNo(String dataAuth,String prefix,String dispatchSn,ModelService modelService){
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
