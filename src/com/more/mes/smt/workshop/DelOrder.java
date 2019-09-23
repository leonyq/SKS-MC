package com.more.mes.smt.workshop;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 车间建模---修改----指令集信息关联删除
 * 
 * @author Administrator
 *
 */
public class DelOrder implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String id = request.getParameter("checkid");
		if (id != null && id != "") {
			String paraId = id.replace("[", "").replace("]", "").replace("\"", "");
			String[] arrId = paraId.split(",");
			int num = arrId.length;
			for (int i = 0; i < arrId.length; i++) {
				List<Object> list = new ArrayList<Object>();
				ArrayList wtRep = new ArrayList();
				TableDataMapExt wttd = new TableDataMapExt();
				String rid = CommMethod.escapeJs(arrId[i]);
				wttd.setTableName("t_workstation_cmd");
				wttd.setSqlWhere(" and ID=?");
				wtRep.add(rid);
				wttd.setSqlWhereArgs(wtRep);
				modelService.del(wttd);
			}
		}
		return BaseActionSupport.AJAX;
	}

}
