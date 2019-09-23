package com.more.mes.smt.projectpause;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * 挂起---校验输入的产品sn
 * @author Administrator
 *
 */
public class CheckProductSnInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String psn = request.getParameter("psn");
		String workSn = request.getParameter("workSn");
		String res = checkSn(psn,workSn,modelService);
		modelAction.setAjaxString(res);
		return BaseActionSupport.AJAX;
	}
	
	@SuppressWarnings("unchecked")
	public String checkSn(String psn, String workSn, ModelService modelService) {
        ProFuncDto pf = new ProFuncDto();
        int[] inPlace = {1, 2,3};
        int[] outplace = {2, 4};
        List<Object> list = new ArrayList<Object>();
        List<Object> outType = new ArrayList<Object>();
        list.add(psn);
        list.add("");
        list.add(workSn);
        outType.add("String");
        outType.add("String");
        
        pf.setClassName("P_C_CHECK_SN_ROUTE");//
        pf.setInPlace(inPlace);// 存储过程中in
        pf.setOutPlace(outplace); // 存储过程中out
        pf.setValArgs(list);// 存储过程中输入的参数
        pf.setTotalLen(4);// 总个数
        pf.setOutValType(outType);// 输出的参数
        List<Object> relist1 = modelService.procComm(pf);// 接收返回值
        String res = (String)relist1.get(1); // 校验结果
        return res;
    }

}
