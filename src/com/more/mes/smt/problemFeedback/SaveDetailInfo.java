package com.more.mes.smt.problemFeedback;

import java.text.SimpleDateFormat;


import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.exception.BussException;
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
public class SaveDetailInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
	    String dataAuth = request.getParameter("_DATA_AUTH");
	    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
	    String formid = request.getParameter("formId");
	    if (null == formid)
	    {
	      formid = request.getParameter("formIds");
	    }

	    String iframeId = request.getParameter("iframeId");
	    try{
	    	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        String userId = CommMethod.getSessionUser().getId();// 创建人
	        String spfsn = getproblemNo(dataAuth,"problem","",modelService);// 问题编号
	        String[] cpfabstract = request.getParameterValues("CPF_ABSTRACT");// 问题摘要
	        String[] cpftype = request.getParameterValues("CPF_TYPE");// 问题类型
	        String[] cpfdescrib = request.getParameterValues("CPF_DESCRIBE");// 问题描述
	        
	        TableDataMapExt savaExt = new TableDataMapExt();
	        
	        savaExt.setTableName("T_CO_PROBLEM_FEEDBACK");
	        
	        CommMethod.addSysDefCol(savaExt.getColMap(), modelAction.getUser());
	        
	        savaExt.getColMap().put("CPF_SN", spfsn);//问题编号
	        savaExt.getColMap().put("CPF_ABSTRACT", cpfabstract);//问题摘要
	        savaExt.getColMap().put("CPF_TYPE", cpftype);//问题类型
	        savaExt.getColMap().put("CPF_DESCRIBE", cpfdescrib);//问题描述
	        savaExt.getColMap().put("CPF_LAUNCH_EMP", userId);// 创建人
	        savaExt.getColMap().put("CPF_LAUNCH_DATE", DateUtil.getCurDate());//创建时间
	        if (StringUtils.isNotBlank(dataAuth))
	        {
	          savaExt.getColMap().put("DATA_AUTH", dataAuth);
	        }
	    }
	        catch (Exception e) {
				log.error(e);
			    throw new BussException(modelAction.getText("新增失败"), e);
			}
		    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	    
	}
	@SuppressWarnings("unchecked")
	private String getproblemNo(String dataAuth,String prefix,String dispatchSn,ModelService modelService) {
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

