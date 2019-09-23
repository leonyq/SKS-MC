//test1
package com.more.buss.eis.bd.basedos.service;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class MoveService implements FuncService {

	public String exeFunc(ModelAction modelaction, ModelService modelservice) {
		// 读取客户组名称并存入datalist
		String sql = "select CG_NAME,ID from T_CO_CUSTOMER_GROUP where 1=1";
		List l;
		l = modelservice.listSql(sql, null, null, null, null, null);
		modelaction.setDataList(l);
		// 取出客户以及对应的客户组
		List l2;
		String sql2 = "select CUSTOMER,CUST_GROUP from T_CO_CUSTOMER where 1=1";
		l2 = modelservice.listSql(sql2, null, null, null, null, null);
		modelaction.setDataList1(l2);
		return modelaction
				.ActionForwardExeid("1accca7e978441a0864a36e4af8e7b83");		
	}
}
