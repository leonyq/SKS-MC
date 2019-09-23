package com.more.mes.smt.wmsoutstock;

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
 * 采购退料---修改保存
 * 
 * @author development
 */
public class EditReturnStockInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
		// String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			String docNum = request.getParameter("docNum");// 入库单号
			String wodDispatchSn = request.getParameter("paraMapObj.T2#WOD_DISPATCH_SN");// 收发类型
			String wodDeliveryDate = request.getParameter("paraMapObj.T2#WOD_OUTSTOCK_DATE");// 出库日期
			String wodUrgentFlag = request.getParameter("paraMapObj.T2#WOD_URGENT_FLAG");// 紧急标志
			String wodMemo = request.getParameter("paraMapObj.T2#WOD_MEMO");// 备注
			String supCode = request.getParameter("paraMapObj.T2#WOD_SUP_CODE");// 供应商
			String[] itemCodes = request.getParameterValues("ITEM_CODE");// 物料料号
			String[] returnNums = request.getParameterValues("RETURN_NUM");
			String[] planNums = returnNums;
			String[] poNums = request.getParameterValues("PO_NUM");
			String[] itemSeqs = request.getParameterValues("ITEM_SEQ");
			String[] wmsSelects = request.getParameterValues("wmsSelect");// 仓库
			String[] deliveryDate = request.getParameterValues("OUTSTOCK_DATE");// 出库日期
			String delIds = request.getParameter("delIds");// 删除的id
			String[] strArray = delIds.split(",");
			String[] itemIds = request.getParameterValues("itemId");// 物料ID
			// 如果是原本的物料 则判断计划数量是否大于入库数量
			String sql = "select WOI_OUT_NUM from T_WMS_OUTSTOCK_ITEM where id=? ";
			List<Map> pList = null;
			int iNum = itemIds.length;
			for (int i = 0; i < iNum; i++) {
				if (!itemIds[i].equals("")) {
					pList = modelService.listDataSql(sql, new Object[] { itemIds[i] });
					if (!pList.isEmpty()) {
						if (pList.get(0).get("WOI_OUT_NUM") != null) {
							if (Integer.parseInt(planNums[i]) < Integer
									.parseInt(pList.get(0).get("WOI_OUT_NUM").toString())) {
								return modelAction.alertParentInfo(modelAction.getText("计划数量应大于出库数量"));
							}
						}
					}
				}
			}
			if (wodUrgentFlag == null || wodUrgentFlag == "" || wodUrgentFlag.equals("")) {
				wodUrgentFlag = "N";
			}
			List list = new ArrayList();
			// 修改仓库单据信息
			TableDataMapExt wms = new TableDataMapExt();
			wms.setTableName("T_WMS_DOC_INFO");
			CommMethod.editSysDefCol(wms.getColMap(), modelAction.getUser());
			wms.setSqlWhere(" and WDI_DOC_NUM=? and DATA_AUTH=? ");
			list.add(docNum);
			list.add(dataAuth);
			wms.setSqlWhereArgs(list);
			wms.getColMap().put("WDI_URGENT_FLAG", wodUrgentFlag);
			wms.getColMap().put("WDI_SUP_CODE", supCode);
			wms.getColMap().put("WDI_DISPATCH_TYPE", wodDispatchSn);
			wms.getColMap().put("WDI_MEMO", wodMemo);
			if (dataAuth != null) {
				wms.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.edit(wms);
			// 修改入库单信息
			TableDataMapExt outStock = new TableDataMapExt();
			outStock.setTableName("T_WMS_OUTSTOCK_DOC");
			CommMethod.editSysDefCol(outStock.getColMap(), modelAction.getUser());
			outStock.setSqlWhere(" and WOD_DOC_NUM=? and DATA_AUTH=? ");
			outStock.setSqlWhereArgs(list);
			if (!wodDeliveryDate.equals("")) {
				outStock.getColMap().put("WOD_OUTSTOCK_DATE", sdf2.parse(wodDeliveryDate));
			}
			outStock.getColMap().put("WOD_URGENT_FLAG", wodUrgentFlag);
			outStock.getColMap().put("WOD_DISPATCH_SN", wodDispatchSn);
			outStock.getColMap().put("WOD_MEMO", wodMemo);
			outStock.getColMap().put("WOD_SUP_CODE", supCode);// 客户
			if (dataAuth != null) {
				outStock.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.edit(outStock);
			// 先删除对应入库单物料信息
			if (!delIds.equals("")) {
				String delSql = "delete from T_WMS_OUTSTOCK_ITEM where id=? ";
				int sNum = strArray.length;
				for (int i = 0; i < sNum; i++) {
					modelService.execSql(delSql, new Object[] { strArray[i] });
				}
			}
			// 插入入库单物料信息
			TableDataMapExt outStockItem = new TableDataMapExt();
			outStockItem.setTableName("T_WMS_OUTSTOCK_ITEM");
			int num = itemCodes.length;
			for (int i = 0; i < num; i++) {
				int planNum = 0;
				int returnNum = 0;
				int itemSeq = 0;
				if (!StringUtils.isBlank(returnNums[i])) {
					returnNum = Integer.parseInt(returnNums[i]);
				}
				if (!StringUtils.isBlank(itemSeqs[i])) {
					itemSeq = Integer.parseInt(itemSeqs[i]);
				}
				if (!StringUtils.isBlank(planNums[i])) {
					planNum = Integer.parseInt(planNums[i]);
				}
				if (!itemIds[i].equals("")) { // 修改数据
					outStockItem.getColMap().clear();
					CommMethod.editSysDefCol(outStockItem.getColMap(), modelAction.getUser());
					outStockItem.setSqlWhere(" and id =? ");
					list.clear();
					list.add(itemIds[i]);
					outStockItem.setSqlWhereArgs(list);
					outStockItem.getColMap().put("WOI_PLAN_NUM", planNum);// 计划数量
					outStockItem.getColMap().put("WOI_REQUEST_NUM", planNum);
					outStockItem.getColMap().put("WOI_WH_CODE", wmsSelects[i]);// 仓库代码
					outStockItem.getColMap().put("WOI_RETURN_NUM", returnNum);// 标准包装数量
					if (!deliveryDate[i].equals("")) {
						outStockItem.getColMap().put("WOI_DELIVERY_DATE", sdf2.parse(deliveryDate[i]));
					}
					if (dataAuth != null) {
						outStockItem.getColMap().put("DATA_AUTH", dataAuth);
					}
					modelService.edit(outStockItem);
				} else {
					outStockItem.getColMap().clear();
					CommMethod.addSysDefCol(outStockItem.getColMap(), modelAction.getUser());
					outStockItem.getColMap().put("ID", StringUtils.getUUID());
					outStockItem.getColMap().put("WOI_DOC_NUM", docNum);// 入库单号
					outStockItem.getColMap().put("WOI_STATUS", "1");// 物料状态
					outStockItem.getColMap().put("WOI_ITEM_CODE", itemCodes[i]);// 物料料号
					outStockItem.getColMap().put("WOI_PLAN_NUM", returnNum);// 计划数量
					outStockItem.getColMap().put("WOI_REQUEST_NUM", returnNum);
					outStockItem.getColMap().put("WOI_ITEM_SEQ", itemSeq);// 项次
					outStockItem.getColMap().put("WOI_CONNECT_DOC", poNums[i]);// 关联单号
					outStockItem.getColMap().put("WOI_WH_CODE", wmsSelects[i]);// 仓库代码
					outStockItem.getColMap().put("WOI_MEMO", wodMemo);// 备注
					outStockItem.getColMap().put("WOI_RETURN_NUM", Integer.parseInt(returnNums[i]));
					if (!deliveryDate[i].equals("")) {
						outStockItem.getColMap().put("WOI_DELIVERY_DATE", sdf2.parse(deliveryDate[i]));
					}
					if (dataAuth != null) {
						outStockItem.getColMap().put("DATA_AUTH", dataAuth);
					}
					modelService.save(outStockItem);
				}
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}

}
