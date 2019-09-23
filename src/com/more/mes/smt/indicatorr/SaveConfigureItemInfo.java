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
 * 生产指示单----机种项目配置---新增保存
 * 
 * @author development
 */
public class SaveConfigureItemInfo implements FuncService {

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

			String itemCode = request.getParameter("paraMap1@0#CO_ITEM_CODE");// 机种料号
			String templateName = request.getParameter("paraMap1@0#CO_TEMPLATE_NAME");// 项目模板
			String[] proCode = request.getParameterValues("PROJECT_CODE");// 项目编码

			String sql = "SELECT DISTINCT T.CO_ITEM_CODE FROM T_CO_ITEM_PROJECT T WHERE T.CO_ITEM_CODE=? AND T.DATA_AUTH=? ";
			List<String> result = modelService.listDataSql(sql, new Object[] { itemCode, dataAuth });
			if (!(result == null) && !result.isEmpty()) {
				return modelAction.alertParentInfo(modelAction.getText("该机种已存在项目模板，请更换"));
			}
			// 增加指示单项目表
			int num = proCode.length;
			for (int i = 0; i < num; i++) {
				TableDataMapExt tMap = new TableDataMapExt();
				tMap.setTableName("T_CO_ITEM_PROJECT");
				String infoId = StringUtils.getUUID();
				CommMethod.addSysDefCol(tMap.getColMap(), modelAction.getUser());
				tMap.getColMap().put("ID", infoId);
				tMap.getColMap().put("CO_ITEM_CODE", itemCode);
				tMap.getColMap().put("CO_TEMPLATE_NAME", templateName);
				tMap.getColMap().put("CO_PROJECT_CODE", proCode[i]);
				tMap.getColMap().put("CO_STATE", "1");
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
