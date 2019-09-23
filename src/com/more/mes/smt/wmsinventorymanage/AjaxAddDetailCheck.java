package com.more.mes.smt.wmsinventorymanage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 单据审核 明细审核操作
 * 
 * @author development
 *
 */
public class AjaxAddDetailCheck implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		Map<String, String> map = new HashMap<String, String>();
		try {
			String checkIds = request.getParameter("checkId"); // 需要明细审核的id
			String[] checkId = checkIds.split(",");
			int num = checkId.length;
			// 修改盘点单明细信息的物料状态
			TableDataMapExt invDetail = new TableDataMapExt();
			invDetail.setTableName("T_WMS_INVENTORY_DETAIL");
			for (int i = 0; i < num; i++) {
				CommMethod.editSysDefCol(invDetail.getColMap(), modelAction.getUser());
				invDetail.setSqlWhere(" and id= ? ");
				List<Object> wList1 = new ArrayList<Object>();
				wList1.add(checkId[i]);
				invDetail.setSqlWhereArgs(wList1);
				invDetail.getColMap().put("WID_ITEM_STATUS", "4");
				modelService.edit(invDetail);
			}
			map.put("returnMsg", "addSucc");
		} catch (Exception e) {
			log.error(e);
			map.put("returnMsg", "addError");
		}
		String alertMsg1 = modelAction.getText("明细审核成功");
		map.put("alertMsg", (String) msgPopData(modelAction, alertMsg1).get("alertMsg"));
		map.put("title", (String) msgPopData(modelAction, alertMsg1).get("title"));
		map.put("width", (String) msgPopData(modelAction, alertMsg1).get("width"));
		map.put("height", (String) msgPopData(modelAction, alertMsg1).get("height"));
		map.put("time", (String) msgPopData(modelAction, alertMsg1).get("time"));
		return modelAction.outJson(CommMethod.bean2Json(map), Constants.CHARACTER_ENCODING_UTF_8);
	}

	@SuppressWarnings("unchecked")
	private Map msgPopData(ModelAction modelAction, String alertMsg) {
		Map map = new HashMap<String, Object>();
		String title = ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
		title = modelAction.getText(title);
		String width = ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
		String height = ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
		String time = ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
		map.put("title", title);
		map.put("width", width);
		map.put("height", height);
		map.put("time", time);
		map.put("alertMsg", alertMsg);
		return map;
	}

}
