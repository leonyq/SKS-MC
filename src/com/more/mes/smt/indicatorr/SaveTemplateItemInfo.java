package com.more.mes.smt.indicatorr;

import java.text.SimpleDateFormat;
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
 * 生产指示单----模板项目配置---新增保存
 * 
 * @author development
 */
public class SaveTemplateItemInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {//
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

			String templateName = request.getParameter("paraMap1@0#CTP_TEMPLATE_NAME");// 模板名称
			String[] proCode = request.getParameterValues("PROJECT_CODE");// 项目编码

			String sql = "SELECT DISTINCT T.CTP_TEMPLATE_NAME FROM T_CO_TEMPLATE_PROJECT T "
					+ "WHERE T.CTP_TEMPLATE_NAME=? AND T.DATA_AUTH=? ";
			List<String> result = modelService.listDataSql(sql, new Object[] { templateName, dataAuth });
			if (!(result == null) && !result.isEmpty()) {
				return modelAction.alertParentInfo(modelAction.getText("模板已存在，请更换"));
			}
			// 增加指示单项目表
			TableDataMapExt tMap = new TableDataMapExt();
			int num = proCode.length;
			tMap.setTableName("T_CO_TEMPLATE_PROJECT");
			for (int i = 0; i < num; i++) {
				String infoId = StringUtils.getUUID();
				tMap.getColMap().clear();
				CommMethod.addSysDefCol(tMap.getColMap(), modelAction.getUser());
				tMap.getColMap().put("ID", infoId);
				tMap.getColMap().put("CTP_TEMPLATE_NAME", templateName);
				tMap.getColMap().put("CTP_PROJECT_CODE", proCode[i]);
				if (dataAuth != null) {
					tMap.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.save(tMap);
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("新增失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}

}
