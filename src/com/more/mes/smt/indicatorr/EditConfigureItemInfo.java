package com.more.mes.smt.indicatorr;

import java.text.SimpleDateFormat;
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
 * 生产指示单----机种项目配置---修改保存
 * 
 * @author development
 */
public class EditConfigureItemInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {//
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

			String itemCode = request.getParameter("itemCode");// 机种料号
			String[] proCode = request.getParameterValues("PROJECT_CODE");// 项目编码
			String templateName = request.getParameter("paraMapObj.CO_TEMPLATE_NAME");// 项目模板
			// String[] coState = request.getParameterValues("CO_STATE");// 项目编码
			List<Object> sqlList = new ArrayList<Object>();
			sqlList.add(itemCode);
			sqlList.add(dataAuth);
			TableDataMapExt delwms1 = new TableDataMapExt();
			delwms1.setTableName("T_CO_ITEM_PROJECT");
			delwms1.setSqlWhere(" and CO_ITEM_CODE=? AND DATA_AUTH=? ");
			delwms1.setSqlWhereArgs(sqlList);
			modelService.del(delwms1);
			int num = proCode.length;
			for (int i = 0; i < num; i++) {
				TableDataMapExt tMap = new TableDataMapExt();
				tMap.setTableName("T_CO_ITEM_PROJECT");
				String infoId = StringUtils.getUUID();
				tMap.getColMap().clear();
				CommMethod.addSysDefCol(tMap.getColMap(), modelAction.getUser());
				tMap.getColMap().put("ID", infoId);
				tMap.getColMap().put("CO_ITEM_CODE", itemCode);
				tMap.getColMap().put("CO_PROJECT_CODE", proCode[i]);
				tMap.getColMap().put("CO_TEMPLATE_NAME", templateName);
				tMap.getColMap().put("CO_STATE", "1");
				if (dataAuth != null) {
					tMap.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.save(tMap);
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}

}
