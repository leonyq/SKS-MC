package com.more.mes.smt.app.http;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * APP模块---新增模块保存
 * 
 * @author Administrator
 *
 */
public class EditMoudleInfo implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");// 是否关闭窗口
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			String dataId = request.getParameter("id");// 导航菜单
			String tamMenuId = request.getParameter("paraMapObj.TAM_MENU_ID");// 导航菜单
			String tamMoudleName = request.getParameter("paraMapObj.TAM_MOUDLE_NAME");// 功能模块
			String tamSeq = request.getParameter("paraMapObj.TAM_SEQ");// 显示顺序
			// String id= request.getParameter("paraMapObj.ID");// 显示顺序

			String sql = "SELECT * FROM t_app_moudle WHERE TAM_MENU_ID =? AND TAM_MOUDLE_NAME =? and id not in(?)";

			int count = modelService.countSql(sql, new Object[] { tamMenuId, tamMoudleName, dataId });
			if (count != 0) {
				return modelAction.alertParentInfo(modelAction.getText("当前导航菜单下此模块名称已存在"));
			}

			String sql2 = "SELECT * FROM t_app_moudle WHERE TAM_MENU_ID =?  AND TAM_SEQ =? and id not in(?)";
			int count2 = modelService.countSql(sql2, new Object[] { tamMenuId, Integer.parseInt(tamSeq), dataId });
			if (count2 != 0) {
				return modelAction.alertParentInfo(modelAction.getText("当前模块名称下顺序不可重复，请更改"));
			}

			TableDataMapExt device = new TableDataMapExt();

			device.setTableName("t_app_moudle");

			CommMethod.editSysDefCol(device.getColMap(), modelAction.getUser());
			// device.getColMap().put("TAM_MENU_ID", tamMenuId);// 导航菜单
			// device.setSqlWhere(" and ID='" + Id + "'");
			device.getColMap().put("TAM_MENU_ID", tamMenuId);// 导航菜单
			device.getColMap().put("TAM_MOUDLE_NAME", tamMoudleName);// 功能模块
			device.getColMap().put("TAM_SEQ", Integer.parseInt(tamSeq));// 显示顺序
			device.setSqlWhere(" and id=? ");
			List list = new ArrayList();
			list.add(dataId);
			device.setSqlWhereArgs(list);
			modelService.edit(device);
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}
}
