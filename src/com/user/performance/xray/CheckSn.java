package com.user.performance.xray;


import java.util.Map;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

/**
 * @ClassName:CheckSn
 * @Description: 验证sn合法性
 * @author:mmz
 * @version:1.0
 * @see 
 * @since 2018年3月21日上午12:53:03
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class CheckSn  implements ValidateFuncService{


	@Override
	public OperResult valJavaFun(String formId, Map paraMap,
			ModelService modelService, ModelAction modelAction, Object... objs) {
        HttpServletRequest request = modelAction.getRequest();
        //查询在制信息表 判定当前制令单下是否存在该Sn
        String sql = "select wt_mo_number from T_WIP_TRACKING where  wt_sn = ?";
        String sn = request.getParameter("paraMap1@0#XRAY_SN");
//        List list = modelService.listSql(sql,modelAction.getPage(), null, null, null, null);
        List list = modelService.listDataSql(sql,new Object[]{ sn });
        if (null==list||list.size() < 1) {
            return new OperResult(false, modelAction.getText("产品SN不存在当前制令单中"));
        }else {
            return new OperResult(true);
        }
			
	}

}
