package com.more.mes.smt.qualityTest.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取物料/产品信息
 * @author development
 *
 */
public class AjaxGetItemInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String checkNo = request.getParameter("checkNo");//检验单号
		String dataAuth = request.getParameter("dataAuth");
		String sql = "select t.*,to_char(t.qip_test_time,'yyyy-mm-dd hh24:mi:ss') TEST_TIME,a.name USERNAME " +
				"from T_QM_INSEPCT_PARENT_INFO t LEFT JOIN sy_user a ON a.id=t.qip_test_emp " + " where t.qip_inspect_sn = ? and t.data_auth=?";
		//List trackingList = modelService.listSql(sql, modelAction.getPage(), sqlWhere, null, null,null);
		List trackingList = modelService.listDataSql(sql, new Object[] {checkNo,dataAuth});
        modelAction.setAjaxPage(modelAction.getPage());
        modelAction.getAjaxPage().setDataList(trackingList);
        return BaseActionSupport.AJAX;
	}

}
