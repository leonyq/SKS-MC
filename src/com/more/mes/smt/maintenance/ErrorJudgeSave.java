package com.more.mes.smt.maintenance;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 产品维修---误判保存
 * @Description
 * @ClassName ErrorJudge
 * @author Administrator
 * @version 1.0 developer 2017-7-25 created
 * @see ErrorJudgeSave
 * @since 2017-7-25
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class ErrorJudgeSave implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest t = modelAction.getRequest();
		String id = t.getParameter("id");
		String WE_SN = t.getParameter("paraMap1@0#WE_SN");
		String SMI_MISJUDGE_TYPE = t.getParameter("paraMap1@0#SMI_MISJUDGE_TYPE");
		String WE_ID = t.getParameter("paraMap1@0#WE_ID");
		String SMI_ITEM_CODE = t.getParameter("paraMap1@0#WE_MODEL_CODE");
		String SMI_MO_NUMBER = t.getParameter("paraMap1@0#WE_MO_NUMBER");
		String SMI_MISJUDGE_REASON = t.getParameter("paraMap1@0#SMI_MISJUDGE_REASON");
		String dataAuth = t.getSession().getAttribute("mcDataAuth").toString();
		// String dataAuth = t.getParameter("paraMapObj._DATA_AUTH");
		TableDataMapExt tdMap = new TableDataMapExt();
		tdMap.setTableName("T_WIP_SN_MISJUDGE_INFO");

		Map<String, Object> map = tdMap.getColMap();
		CommMethod.addSysDefCol(map, modelAction.getUser());
		map.put("SMI_SN", WE_SN);
		map.put("WE_ID", WE_ID);
		map.put("SMI_ITEM_CODE", SMI_ITEM_CODE);

		map.put("SMI_MO_NUMBER", SMI_MO_NUMBER);
		map.put("SMI_MISJUDGE_TYPE", SMI_MISJUDGE_TYPE);
		map.put("SMI_MISJUDGE_REASON", SMI_MISJUDGE_REASON);
		map.put("SMI_MISJUDGE_TIME", DateUtil.getCurDate());
		map.put("SMI_MISJUDGE_MAN", CommMethod.getSessionUser().getId());
		if (dataAuth != null && !dataAuth.equals("")) {
			map.put("DATA_AUTH", dataAuth);
		}

		modelService.save(tdMap);
		tdMap = new TableDataMapExt();
		tdMap.setTableName("T_WIP_ERROR");
		tdMap.setSqlWhere("and id = ? ");
		tdMap.getSqlWhereArgs().add(WE_ID);
		map = tdMap.getColMap();
		CommMethod.editSysDefCol(map, modelAction.getUser());
		map.put("WE_MISJUDGE_FLAG", "Y");
		map.put("WE_REPAIR_FLAG", "1");
		modelService.edit(tdMap);
		String alertMsg = modelAction.getText("误判成功");
		return addParentData(modelAction, alertMsg);

	}

	private String addParentData(ModelAction modelAction, String alertMsg) {
		String title = ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
		title = modelAction.getText(title);
		String width = ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
		String height = ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
		String time = ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
		StringBuffer content = new StringBuffer();
		content.append("<script>");
		content.append("try{");
		content.append("window.parent.addParentData('");
		content.append(alertMsg + "','" + title + "','" + width + "','" + height + "','" + time);
		content.append("');");
		content.append("}catch(e){alert(\"");
        content.append("\");}");
		content.append("</script>");
		modelAction.outHtml(content.toString(), Constants.CHARACTER_ENCODING_UTF_8);
		return null;
	}

}