//test1
package com.more.buss.eis.bd.basedos.service;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;



import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class SaveService implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());
	
	public String exeFunc(ModelAction modelaction, ModelService modelService) {
		String cg_name = modelaction.getRequest().getParameter("cg_name");
 		String customer_arry = modelaction.getRequest()
				.getParameter("customer");
		String customer_arry2 = modelaction.getRequest().getParameter(
				"customer2");
		String[] customer_text = customer_arry.split(";");
		String[] customer_text2 = customer_arry2.split(";");
		String sql = "";
		String sql2 = "";
		String customer = "";
		String customer2 = "";
		List l;
		
		
			for (int i = 0; i < customer_text.length; i++) {
			     
				customer = customer_text[i];
				sql = "update T_CO_CUSTOMER set CUST_GROUP = ? where CUSTOMER = ?";
				modelService.execSql(sql,new Object[]{cg_name,customer});
			}

			for (int i = 0; i < customer_text2.length; i++) {
				customer2 = customer_text2[i];
				sql2 = "select CUST_GROUP from T_CO_CUSTOMER where CUSTOMER = ?";//
				l = modelService.listDataSql(sql2, new Object[]{customer2});
				if(customer2 != ""){//防止右侧为空时还运行代码
					Map map = (Map)l.get(0);
					String cg_name2 = StringUtils.toString(map.get("CUST_GROUP"));
					
					if (cg_name2.equals(cg_name)) {//因为无论左右移动皆经过此类，所以若右边未归属客户数据库的组名与所操作的组相同，则证明为右移
						sql2 = "update T_CO_CUSTOMER set CUST_GROUP = '000' where CUSTOMER = ?";
						modelService.execSql(sql2,new Object[]{customer2});
					}
					
				}
				
			}
		
		// 读取客户组名称并存入datalist
				String sql3 = "select CG_NAME,ID from T_CO_CUSTOMER_GROUP where 1=1";
				List l2;
				l2 = modelService.listSql(sql3, null, null, null, null, null);
				modelaction.setDataList(l2);
				// 取出客户以及对应的客户组
				List l3;
				String sql4 = "select CUSTOMER,CUST_GROUP from T_CO_CUSTOMER where 1=1";
				l3 = modelService.listSql(sql4, null, null, null, null, null);
				System.out.println(l3);
				modelaction.setAjaxList(l3);
				return BaseActionSupport.AJAX;
		
	}

}
