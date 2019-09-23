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
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 单据审核 明细审核操作
 * 
 * @author development
 *
 */
public class AjaxAddAllDetailCheck implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		Map<String, String> map = new HashMap<String, String>();
		try {
			// 获取需要明细审核的id
			String docNum = request.getParameter("docNum");
			String itemState = "2";// 物料状态(1-待盘点,2-已盘点,3-盘0,4-已审核)
			String sql = "SELECT t.ID " + "FROM T_WMS_INVENTORY_DETAIL t where 1=1 and t.DATA_AUTH=:auth ";
			Map<String, String> sqlParaMap = new HashMap<String, String>();
			sqlParaMap.put("auth", auth);
			if (StringUtils.isNotBlank(docNum)) {
				sql += " and t.WID_DOC_NUM = :docNum ";
				sqlParaMap.put("docNum", docNum);
			}
			if (StringUtils.isNotBlank(itemState)) {
				sql += " and t.WID_ITEM_STATUS = :itemState ";
				sqlParaMap.put("itemState", itemState);
			}
			List<Map> itemList = modelService.listSql(sql, null, sqlParaMap, null, null);

			String checkId = ""; // 需要明细审核的id
			// 修改盘点单明细信息的物料状态
			TableDataMapExt invDetail = new TableDataMapExt();
			invDetail.setTableName("T_WMS_INVENTORY_DETAIL");
			int num = itemList.size();
			for (int i = 0; i < itemList.size(); i++) {
				Map<String, String> dataMap = new HashMap<String, String>();
				dataMap = itemList.get(i);
				checkId = dataMap.get("ID");
				CommMethod.editSysDefCol(invDetail.getColMap(), modelAction.getUser());
				invDetail.setSqlWhere(" and id= ? ");
				List<Object> wList1 = new ArrayList<Object>();
				wList1.add(checkId);
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
