package com.more.mes.smt.wmsallot;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
 * 保存修改的调拨单信息
 * 
 * @author development
 *
 */
public class SaveEditAllotInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		// String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
		String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			String WAD_DOC_NUM = request.getParameter("docNum");// 调拨单号
			String WAD_DISPATCH_SN = request.getParameter("paraMapObj.T2#WAD_DISPATCH_SN");// 收发类型
			String WAD_ALLOT_DATE = request.getParameter("paraMapObj.T2#WAD_ALLOT_DATE");// 调拨日期
			String WAD_URGENT_FLAG = request.getParameter("paraMapObj.T2#WAD_URGENT_FLAG");// 紧急标志
			String WAD_OUTSTOCK_FLAG = request.getParameter("paraMapObj.T2#WAD_OUTSTOCK_FLAG");// 出库标志
			String WAD_MEMO = request.getParameter("paraMapObj.T2#WAD_MEMO");// 备注
			String delIds = request.getParameter("delIds");// 删除的id
			String[] strArray = delIds.split(",");
			String[] itemIds = request.getParameterValues("itemId");// 物料ID
			String[] itemCodes = request.getParameterValues("CI_ITEM_CODE");// 物料料号
			String[] planNums = request.getParameterValues("PLAN_NUM");// 计划数量
			String[] packNums = request.getParameterValues("MIN_PACK");// 标准包装数量
			String[] wmsSelects = request.getParameterValues("wmsSelect");// 调入仓库
			String[] outSelects = request.getParameterValues("outSelect");// 调出仓库
			String[] allotDates = request.getParameterValues("ALLOT_DATE");// 调拨日期
			// 判断调入/调出仓库是否一致
			int num = itemCodes.length;
			for (int i = 0; i < num; i++) {
				if (wmsSelects[i].equals(outSelects[i])) {
					return modelAction.alertParentInfo(modelAction.getText("调入/调出仓库必须不一致"));
				}
			}
			if (WAD_URGENT_FLAG == null || WAD_URGENT_FLAG == "" || WAD_URGENT_FLAG.equals("")) {
				WAD_URGENT_FLAG = "N";
			}
			if (WAD_OUTSTOCK_FLAG == null || WAD_OUTSTOCK_FLAG == "" || WAD_OUTSTOCK_FLAG.equals("")) {
				WAD_OUTSTOCK_FLAG = "N";
			}
			// 如果是原本的物料 则判断计划数量是否大于入库数量
			String sql = "select WAI_ALLOT_NUM from T_WMS_ALLOT_ITEM where id=? ";
			List<Map> pList = null;
			int num1 = itemIds.length;
			for (int i = 0; i < num1; i++) {
				if (!itemIds[i].equals("")) {
					pList = modelService.listDataSql(sql, new Object[] { itemIds[i] });
					if (pList.get(0).get("WAI_ALLOT_NUM") != null) {
						if (Integer.parseInt(planNums[i]) < Integer
								.parseInt(pList.get(0).get("WAI_ALLOT_NUM").toString())) {
							return modelAction.alertParentInfo(modelAction.getText("计划数量应大于调拨数量"));
						}
					}
				}
			}

			// 修改仓库单据信息表数据
			TableDataMapExt wms = new TableDataMapExt();
			wms.setTableName("T_WMS_DOC_INFO");
			wms.setSqlWhere(" AND WDI_DOC_NUM=? AND DATA_AUTH=? ");
			List<Object> wList = new ArrayList<Object>();
			wList.add(WAD_DOC_NUM);
			wList.add(dataAuth);
			wms.setSqlWhereArgs(wList);
			wms.getColMap().put("WDI_URGENT_FLAG", WAD_URGENT_FLAG);
			wms.getColMap().put("WDI_DISPATCH_TYPE", WAD_DISPATCH_SN);
			wms.getColMap().put("WDI_MEMO", WAD_MEMO);
			if (dataAuth != null) {
				wms.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.edit(wms);
			// 修改调拨单信息
			TableDataMapExt receive = new TableDataMapExt();
			receive.setTableName("T_WMS_ALLOT_DOC");
			CommMethod.editSysDefCol(receive.getColMap(), modelAction.getUser());
			receive.setSqlWhere(" AND WAD_DOC_NUM=? AND DATA_AUTH=? ");
			receive.setSqlWhereArgs(wList);
			if (!WAD_ALLOT_DATE.equals("")) {
				receive.getColMap().put("WAD_ALLOT_DATE", sdf2.parse(WAD_ALLOT_DATE));
			}
			receive.getColMap().put("WAD_URGENT_FLAG", WAD_URGENT_FLAG);
			receive.getColMap().put("WAD_OUTSTOCK_FLAG", WAD_OUTSTOCK_FLAG);
			receive.getColMap().put("WAD_DISPATCH_SN", WAD_DISPATCH_SN);
			receive.getColMap().put("WAD_MEMO", WAD_MEMO);
			if (dataAuth != null) {
				receive.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.edit(receive);
			// 先删除对应入库单物料信息
			if (!delIds.equals("")) {
				String delSql = "delete from T_WMS_ALLOT_ITEM where id=? ";
				for (int i = 0; i < strArray.length; i++) {
					modelService.execSql(delSql, new Object[] { strArray[i] });
				}
			}
			// 插入调拨单物料信息
			TableDataMapExt receive1 = new TableDataMapExt();
			receive1.setTableName("T_WMS_ALLOT_ITEM");
			for (int i = 0; i < num; i++) {
				if (!itemIds[i].equals("")) { // 修改数据
					receive1.getColMap().clear();
					CommMethod.editSysDefCol(receive1.getColMap(), modelAction.getUser());
					receive1.setSqlWhere(" and id =?");
					List<Object> wList1 = new ArrayList<Object>();
					wList1.add(itemIds[i]);
					receive1.setSqlWhereArgs(wList1);
					receive1.getColMap().put("WAI_PLAN_NUM", Integer.parseInt(planNums[i]));
					receive1.getColMap().put("WAI_PACK_NUM", Integer.parseInt(packNums[i]));
					receive1.getColMap().put("WAI_IN_WH", wmsSelects[i]);
					receive1.getColMap().put("WAI_OUT_WH", outSelects[i]);
					if (!allotDates[i].equals("")) {
						receive1.getColMap().put("WAI_ALLOT_DATE", sdf2.parse(allotDates[i]));
					} else {
						receive1.getColMap().put("WAI_ALLOT_DATE", null);
					}
					if (dataAuth != null) {
						receive1.getColMap().put("DATA_AUTH", dataAuth);
					}
					modelService.edit(receive1);
				} else {
					receive1.getColMap().clear();
					CommMethod.addSysDefCol(receive1.getColMap(), modelAction.getUser());
					receive1.getColMap().put("ID", StringUtils.getUUID());
					receive1.getColMap().put("WAI_DOC_NUM", WAD_DOC_NUM);
					receive1.getColMap().put("WAI_STATUS", "1");
					receive1.getColMap().put("WAI_ALLOT_NUM", 0);
					receive1.getColMap().put("WAI_ITEM_CODE", itemCodes[i]);
					receive1.getColMap().put("WAI_PLAN_NUM", Integer.parseInt(planNums[i]));
					receive1.getColMap().put("WAI_PACK_NUM", Integer.parseInt(packNums[i]));
					receive1.getColMap().put("WAI_IN_WH", wmsSelects[i]);
					receive1.getColMap().put("WAI_OUT_WH", outSelects[i]);
					if (!allotDates[i].equals("")) {
						receive1.getColMap().put("WAI_ALLOT_DATE", sdf2.parse(allotDates[i]));
					}
					if (dataAuth != null) {
						receive1.getColMap().put("DATA_AUTH", dataAuth);
					}
					modelService.save(receive1);
				}
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}

}
