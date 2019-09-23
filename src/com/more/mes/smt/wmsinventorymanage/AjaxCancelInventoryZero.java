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
 * 单据审核取消盘0操作
 * 
 * @author development
 *
 */
public class AjaxCancelInventoryZero implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		Map<String, String> map = new HashMap<String, String>();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		try {
			String checkIds = request.getParameter("checkId"); // 需要取消盘0的id
			String docNum = request.getParameter("docNum");
			String[] checkId = checkIds.split(",");
			int num = checkId.length;
			// 修改盘点单明细信息的物料状态
			TableDataMapExt invDetail = new TableDataMapExt();
			invDetail.setTableName("T_WMS_INVENTORY_DETAIL");
			for (int i = 0; i < num; i++) {
				List<Object> sqlWList = new ArrayList<>();
				CommMethod.editSysDefCol(invDetail.getColMap(), modelAction.getUser());
				sqlWList.add(checkId[i]);
				invDetail.setSqlWhere(" and id= ? ");
				invDetail.setSqlWhereArgs(sqlWList);
				invDetail.getColMap().put("WID_ITEM_STATUS", "1");
				invDetail.getColMap().put("WID_INVENTORY_TIME", null);
				invDetail.getColMap().put("WID_INVENTORY_EMP", "");
				modelService.edit(invDetail);
			}
			// 先取出id对应的盘点单明细信息
			String sql = "select t.* from T_WMS_INVENTORY_DETAIL t where t.id=? ";
			List<Map> pList = null;
			// 删除盘0信息表 T_WMS_INVENTORY_LOSS_INFO 信息
			String delSql = "delete from T_WMS_INVENTORY_LOSS_INFO where WIL_DOC_NUM=? and WIL_ITEM_SN=? and DATA_AUTH=? ";
			for (int i = 0; i < num; i++) {
				pList = modelService.listDataSql(sql, new Object[] { checkId[i] });
				modelService.execSql(delSql,
						new Object[] { pList.get(0).get("WID_DOC_NUM"), pList.get(0).get("WID_ITEM_SN"), auth });
			}
			// 修改盘点单状态
			// 判断是否所有物料状态都为待盘点
			String cSql = "select t.WID_ITEM_STATUS from T_WMS_INVENTORY_DETAIL t where t.WID_DOC_NUM=? and t.DATA_AUTH=? "
					+ " and t.WID_ITEM_STATUS !='1' ";
			List wlist = modelService.listDataSql(cSql, new Object[] { docNum, auth });
			if (wlist.size() == 0) {
				List<Object> sqlWList = new ArrayList<>();
				sqlWList.add(docNum);
				sqlWList.add(auth);
				TableDataMapExt doc = new TableDataMapExt();
				doc.setTableName("T_WMS_INVENTORY_DOC");
				CommMethod.editSysDefCol(doc.getColMap(), modelAction.getUser());
				doc.setSqlWhere(" and WID_DOC_NUM= ? and DATA_AUTH=? ");
				doc.setSqlWhereArgs(sqlWList);
				doc.getColMap().put("WID_STATUS", "1");
				modelService.edit(doc);
			}
			map.put("returnMsg", "addSucc");
		} catch (Exception e) {
			log.error(e);
			map.put("returnMsg", "addError");
		}
		String alertMsg1 = modelAction.getText("取消盘0成功");
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
