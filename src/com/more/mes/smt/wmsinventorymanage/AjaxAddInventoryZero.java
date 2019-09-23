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
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 单据审核进行盘0操作
 * 
 * @author development
 *
 */
public class AjaxAddInventoryZero implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String dataAuth = request.getParameter("dataAuth");
		Map<String, String> map = new HashMap<String, String>();
		int invNum = 0;// WID_INVENTORY_NUM 盘点数量
		int stockNum = 0;// WID_STOCK_NUM 库存数量
		int profitNum = 0;// WID_PROFIT_NUM 盈亏
		try {
			String checkIds = request.getParameter("checkId"); // 需要盘0的id
			String docNum = request.getParameter("docNum");
			String[] checkId = checkIds.split(",");
			int num = checkId.length;
			// 修改盘点单状态为操作中
			TableDataMapExt doc = new TableDataMapExt();
			doc.setTableName("T_WMS_INVENTORY_DOC");
			CommMethod.editSysDefCol(doc.getColMap(), modelAction.getUser());
			doc.setSqlWhere(" and WID_DOC_NUM= ? and DATA_AUTH=? ");
			List<Object> wList = new ArrayList<Object>();
			wList.add(docNum);
			wList.add(auth);
			doc.setSqlWhereArgs(wList);
			doc.getColMap().put("WID_STATUS", "2");
			modelService.edit(doc);
			// 修改盘点单明细信息的物料状态
			TableDataMapExt invDetail = new TableDataMapExt();
			invDetail.setTableName("T_WMS_INVENTORY_DETAIL");
			CommMethod.editSysDefCol(invDetail.getColMap(), modelAction.getUser());
			for (int i = 0; i < num; i++) {
				invDetail.setSqlWhere(" and id= ? ");
				List<Object> wList1 = new ArrayList<Object>();
				wList1.add(checkId[i]);
				invDetail.setSqlWhereArgs(wList1);
				invDetail.getColMap().put("WID_ITEM_STATUS", "3");
				invDetail.getColMap().put("WID_INVENTORY_TIME", DateUtil.getCurDate());
				invDetail.getColMap().put("WID_INVENTORY_EMP", CommMethod.getSessionUser().getLoginName());
				modelService.edit(invDetail);
			}
			// 先取出id对应的盘点单明细信息
			String sql = "select t.* from T_WMS_INVENTORY_DETAIL t where t.id=? ";
			List<Map> pList = null;

			TableDataMapExt invLoss = new TableDataMapExt();
			invLoss.setTableName("T_WMS_INVENTORY_LOSS_INFO");
			for (int i = 0; i < num; i++) {
				pList = modelService.listDataSql(sql, new Object[] { checkId[i] });
				invNum = Integer.valueOf(String.valueOf(pList.get(0).get("WID_INVENTORY_NUM")));
				stockNum = Integer.valueOf(String.valueOf(pList.get(0).get("WID_STOCK_NUM")));
				profitNum = invNum - stockNum;
				// 修改盘点明细表 T_WMS_INVENTORY_DETAIL 信息
				TableDataMapExt invDetail2 = new TableDataMapExt();
				invDetail2.setTableName("T_WMS_INVENTORY_DETAIL");
				invDetail2.setSqlWhere(" and id= ? ");
				List<Object> wList1 = new ArrayList<Object>();
				wList1.add(checkId[i]);
				invDetail2.setSqlWhereArgs(wList1);
				invDetail2.getColMap().put("WID_PROFIT_NUM", profitNum);
				modelService.edit(invDetail2);
				// 新增盘0信息表 T_WMS_INVENTORY_LOSS_INFO 信息
				invLoss.getColMap().clear();
				CommMethod.addSysDefCol(invLoss.getColMap(), modelAction.getUser());
				invLoss.getColMap().put("WIL_ITEM_SN", pList.get(0).get("WID_ITEM_SN"));
				invLoss.getColMap().put("WIL_SUP_CODE", pList.get(0).get("WID_SUP_CODE"));
				invLoss.getColMap().put("WIL_CUST_CODE", pList.get(0).get("WID_CUST_CODE"));
				invLoss.getColMap().put("WIL_WH_CODE", pList.get(0).get("WID_WH_CODE"));
				invLoss.getColMap().put("WIL_DISTRICT_CODE", pList.get(0).get("WID_DISTRICT_CODE"));
				invLoss.getColMap().put("WIL_STORAGE_CODE", pList.get(0).get("WID_STORAGE_CODE"));
				invLoss.getColMap().put("WIL_DOC_NUM", pList.get(0).get("WID_DOC_NUM"));
				invLoss.getColMap().put("WIL_ITEM_CODE", pList.get(0).get("WID_ITEM_CODE"));
				invLoss.getColMap().put("WIL_STOCK_NUM", pList.get(0).get("WID_STOCK_NUM"));
				invLoss.getColMap().put("WIL_INVENTORY_NUM", pList.get(0).get("WID_INVENTORY_NUM"));
				invLoss.getColMap().put("WIL_PROFIT_NUM", profitNum);
				invLoss.getColMap().put("WIL_INVENTORY_TIME", DateUtil.getCurDate());
				invLoss.getColMap().put("WIL_INVENTORY_EMP", CommMethod.getSessionUser().getLoginName());
				invLoss.getColMap().put("WIL_MEMO", pList.get(0).get("WID_MEMO"));
				if (StringUtils.isNotBlank(dataAuth)) {
					invLoss.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.save(invLoss);
			}
			map.put("returnMsg", "addSucc");
		} catch (Exception e) {
			log.error(e);
			map.put("returnMsg", "addError");
		}
		String alertMsg1 = modelAction.getText("盘0成功");
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
