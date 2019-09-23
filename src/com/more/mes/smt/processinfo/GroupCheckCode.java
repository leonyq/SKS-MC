package com.more.mes.smt.processinfo;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

/**
 * 工序信息---表单校验工序代码
 * 
 * @author Administrator
 *
 */
public class GroupCheckCode implements ValidateFuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	/**
	 * @param formId       表单ID
	 * @param paraMap      数据对象
	 * @param modelService modelService
	 * @return
	 */
	@Override
	public OperResult valJavaFun(String formId, Map paraMap, ModelService modelService, ModelAction modelAction,
			Object... objs) {
		String proNo = (String) paraMap.get("GROUP_CODE");
		String dataid = modelAction.getDataId();
		// 获取
		HttpServletRequest request = modelAction.getRequest();
		// 组织机构
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String sql = "select * from T_CO_GROUP where GROUP_CODE=? and data_auth=?";
		List subList = modelService.listDataSql(sql, new Object[] { proNo, auth });
		if (subList != null && subList.size() > 0) {
			if (!StringUtils.isEmpty(dataid) && subList.size() == 1) {
				String id1 = (String) ((Map) subList.get(0)).get("ID");
				if (!dataid.equals(id1)) {
					return new OperResult(false, "工序代码：" + proNo + "，已存在！");
				}
			} else {
				return new OperResult(false, "工序代码：" + proNo + "，已存在！");
			}
		}

		return new OperResult(true);
	}
}
