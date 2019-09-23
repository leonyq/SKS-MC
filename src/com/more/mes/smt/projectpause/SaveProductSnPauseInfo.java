package com.more.mes.smt.projectpause;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存产品挂起信息
 * @author Administrator
 *
 */
public class SaveProductSnPauseInfo implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String moNumber = request.getParameter("moNumber");
		String groupCode = request.getParameter("groupCode");
		String sn = request.getParameter("sn");
		String reason = request.getParameter("reason");
		String[] sns = sn.split(",");
		String uid = StringUtils.getUUID();
		//挂起原因
		TableDataMapExt ppt = new TableDataMapExt();
		ppt.setTableName("T_XA_PROJECT_PAUSE");
		CommMethod.addSysDefCol(ppt.getColMap(), modelAction.getUser());
		ppt.getColMap().put("ID", uid);
		ppt.getColMap().put("TPP_MO_NUMBER", moNumber); 
		ppt.getColMap().put("TPP_REASON", reason); 
		ppt.getColMap().put("TPP_GROUP_CODE", groupCode); 
		modelService.save(ppt);
		//挂起产品
		TableDataMapExt ps = new TableDataMapExt();
		ps.setTableName("T_XA_PAUSE_SN");
		int num = sns.length;
		for(int i=0;i<num;i++){
			ps.getColMap().clear();
			CommMethod.addSysDefCol(ps.getColMap(), modelAction.getUser());
			ps.getColMap().put("TPS_ID", uid);
			ps.getColMap().put("TPS_SN", sns[i]);
			ps.getColMap().put("TPS_BEGIN_TIME", new Date());
			modelService.save(ps);
		}
		return BaseActionSupport.AJAX;
	}

}
