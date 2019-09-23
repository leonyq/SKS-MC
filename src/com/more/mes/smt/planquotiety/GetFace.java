package com.more.mes.smt.planquotiety;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 影响系数---判断阶别
 * 
 * @author Administrator
 *
 */
public class GetFace implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String dataAuth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		// TODO Auto-generated method stub
		String sql = "select count(code) as code from sy_dict_val where dict_code = ?";

		List<Map> list = modelService.listDataSql(sql, new Object[] { "PROJECT_STEP" });
		int code = 0;
		if (list != null && list.size() > 0) {
			if (StringUtils.isNotBlank(list.get(0).get("code"))) {
				code = Integer.parseInt(list.get(0).get("code").toString());// 阶别总数
			}
		}
		// int code=modelService.countSql(sql, new Object[]{"PROJECT_STEP"});

		String sql1 = "select * from T_PM_PLAN_QUOTIETY where 1=? AND DATA_AUTH=? ";

		int num = 1;

		int face = modelService.countSql(sql1, new Object[] { num, dataAuth });// 影响系数表下共有几条数据

		String sql2 = "select *  from t_co_area t where ca_type=? AND DATA_AUTH=? ";

		int area = modelService.countSql(sql2, new Object[] { "1", dataAuth });// 线别一共有几条

		String comp = "1";
// code *
		if (face != 0) {
			if (face ==area )// 影响系数总条数 == （已知的阶别下已添加完所有已知的线别）                  // 影响系数总条数 == 线别*阶别 不能添加数据（已知的阶别下已添加完所有已知的线别）
			{
				comp = "2";
			}
		}
		modelAction.setAjaxString(comp);

		return BaseActionSupport.AJAX;
	}

}
