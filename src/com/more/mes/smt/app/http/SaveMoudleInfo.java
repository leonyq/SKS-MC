package com.more.mes.smt.app.http;

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
public class SaveMoudleInfo implements FuncService {
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

			String tamMenuId = request.getParameter("paraMap1@0#TAM_MENU_ID");// 导航菜单
			String tamMoudleName = request.getParameter("paraMap1@0#TAM_MOUDLE_NAME");// 功能模块
			String tamSeq = request.getParameter("paraMap1@0#TAM_SEQ");// 显示顺序

			String sql = "SELECT * FROM t_app_moudle WHERE TAM_MENU_ID =? AND TAM_MOUDLE_NAME =?";
			int count = modelService.countSql(sql, new Object[] { tamMenuId, tamMoudleName });
			if (count != 0) {
				return modelAction.alertParentInfo(modelAction.getText("当前导航菜单下此模块名称已存在"));
			}

			String sql2 = "SELECT * FROM t_app_moudle WHERE TAM_MENU_ID =? AND TAM_SEQ =?";
			int count2 = modelService.countSql(sql2, new Object[] { tamMenuId, Integer.parseInt(tamSeq) });
			if (count2 != 0) {
				return modelAction.alertParentInfo(modelAction.getText("当前模块名称下顺序不可重复，请更改"));
			}

			TableDataMapExt saveExt = new TableDataMapExt();

			saveExt.setTableName("t_app_moudle");

			CommMethod.addSysDefCol(saveExt.getColMap(), modelAction.getUser());
			saveExt.getColMap().put("TAM_MENU_ID", tamMenuId);// 导航菜单
			saveExt.getColMap().put("TAM_MOUDLE_NAME", tamMoudleName);// 功能模块
			saveExt.getColMap().put("TAM_SEQ", Integer.parseInt(tamSeq));// 显示顺序
			modelService.save(saveExt);
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e);
			throw new BussException(modelAction.getText("新增失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), "0");
	}
}
