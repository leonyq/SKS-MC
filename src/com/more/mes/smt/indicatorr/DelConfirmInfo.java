package com.more.mes.smt.indicatorr;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 生产指示单----机种项目配置---删除
 * 
 * @author development
 */
public class DelConfirmInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		try {
			String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
			String delId = request.getParameter("delId");// 需要删除的id
			String[] strArray = delId.split(",");
			// 判断删除的id有没有被引用
			String sql1 = "SELECT T.ID " + " FROM T_CO_INDICATORR T1  " + " LEFT JOIN T_CO_ITEM_PROJECT T "
					+ " ON T.CO_ITEM_CODE = T1.CO_MODEL_CODE " + " WHERE T.ID = ? AND T1.DATA_AUTH=? ";
			List<Map> itemList = null;
			int num = strArray.length;
			for (int i = 0; i < num; i++) {
				itemList = modelService.listDataSql(sql1, new Object[] { strArray[i], dataAuth });

				if (itemList != null && !itemList.isEmpty()) {
					return modelAction.alertParentInfo(modelAction.getText("不能删除被引用的机种检查项目"));
				}
			}

			for (int i = 0; i < num; i++) {
				String sql = "DELETE FROM T_CO_ITEM_PROJECT T WHERE T.ID=?";
				modelService.execSql(sql, new Object[] { strArray[i] });
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("删除失败"), e);
		}
		return modelAction.reloadParent(modelAction.getText("删除成功"));
	}

}
