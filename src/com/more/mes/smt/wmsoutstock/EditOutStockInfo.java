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
 * 生产领料---修改---保存
 * 
 * @author development
 */
public class EditOutStockInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		// String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			String docNum = request.getParameter("docNum");// 入库单号
			String proFace = request.getParameter("WOD_PRO_FACE");// 面别
			if (proFace == null || proFace == "" || proFace.equals("")) {
				proFace = "";
			}
			String wodDispatchSn = request.getParameter("paraMapObj.T2#WOD_DISPATCH_SN");// 收发类型
			String wodDeliveryDate = request.getParameter("paraMapObj.T2#WOD_OUTSTOCK_DATE");// 出库日期
			String wodUrgentFlag = request.getParameter("paraMapObj.T2#WOD_URGENT_FLAG");// 紧急标志
			String wodMemo = request.getParameter("paraMapObj.T2#WOD_MEMO");// 备注
			String[] itemCodes = request.getParameterValues("ITEM_CODE");// 物料料号
			String[] planNums = request.getParameterValues("PLAN_NUM");// 计划数量
			String[] wmsSelects = request.getParameterValues("wmsSelect");// 仓库
			String[] deliveryDate = request.getParameterValues("DELIVERY_DATE");// 出库日期
			String[] moNums = request.getParameterValues("MO_NUMBER");// 关联单号
			String[] requestNums = request.getParameterValues("REQUEST_NUM");// 需求数量
			String[] exceedUseNums = request.getParameterValues("EXCEED_USE_NUM");// 使用超发数量
			String[] minPacks = request.getParameterValues("MIN_PACK");// 物料料号
			String[] itemSeqs = request.getParameterValues("ITEM_SEQ");// 项次
			String delIds = request.getParameter("delIds");// 删除的id
			String[] strArray = delIds.split(",");
			String[] itemIds = request.getParameterValues("itemId");// 物料ID
			List list = new ArrayList();
			// 如果是原本的物料 则判断计划数量是否大于入库数量
			String sql = "select WOI_OUT_NUM from T_WMS_OUTSTOCK_ITEM where id=? ";
			List<Map> pList = null;
			int num = itemIds.length;
			for (int i = 0; i < num; i++) {
				if (!itemIds[i].equals("")) {
					pList = modelService.listDataSql(sql, new Object[] { itemIds[i] });
					if (pList.get(0).get("WOI_OUT_NUM") != null) {
						if (Integer.parseInt(planNums[i]) < Integer
								.parseInt(pList.get(0).get("WOI_OUT_NUM").toString())) {
							return modelAction.alertParentInfo(modelAction.getText("计划数量应大于出库数量"));
						}
					}
				}
			}
			if (wodUrgentFlag == null || wodUrgentFlag == "" || wodUrgentFlag.equals("")) {
				wodUrgentFlag = "N";
			}
			/*
			 * //测试人员说先去掉 String tempSql4 = ""; List tempList2 = null; // 20180614 CSJ
			 * 校验物料是否超期 for (int i = 0; i < itemCodes.length; i++ ) { tempSql4 =
			 * "SELECT T.ID " + " FROM T_WMS_STOCK_INFO T " + " LEFT JOIN T_CO_ITEM T2 " +
			 * " ON T2.CI_ITEM_CODE = T.WSI_ITEM_CODE " + " WHERE T.WSI_ITEM_CODE = ? " +
			 * " AND (T.WSI_TEST_TIME + T2.CI_RECHECK_DAYS) <= SYSDATE " +
			 * " AND T2.CI_RECHECK_DAYS != 0 "; tempList2 =
			 * modelService.listDataSql(tempSql4, new Object[] {itemCodes[i]}); if
			 * ((tempList2 != null) && !tempList2.isEmpty()) { return
			 * modelAction.alertParentInfo(modelAction.getText("物料已超期,无法出库")); } }
			 */
			// 修改仓库单据信息
			TableDataMapExt wms = new TableDataMapExt();
			wms.setTableName("T_WMS_DOC_INFO");
			CommMethod.editSysDefCol(wms.getColMap(), modelAction.getUser());
			wms.setSqlWhere(" and WDI_DOC_NUM=? AND DATA_AUTH=? ");
			list.add(docNum);
			list.add(dataAuth);
			wms.setSqlWhereArgs(list);
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
			outStock.setSqlWhere(" and WOD_DOC_NUM=? AND DATA_AUTH=? ");
			list.clear();
			list.add(docNum);
			list.add(dataAuth);
			outStock.setSqlWhereArgs(list);
			if (!wodDeliveryDate.equals("")) {
				outStock.getColMap().put("WOD_OUTSTOCK_DATE", sdf2.parse(wodDeliveryDate));
			}
			outStock.getColMap().put("WOD_URGENT_FLAG", wodUrgentFlag);
			outStock.getColMap().put("WOD_DISPATCH_SN", wodDispatchSn);
			outStock.getColMap().put("WOD_MEMO", wodMemo);
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

			String tempStr = "";
			int iNum = itemCodes.length;
			for (int i = 0; i < iNum; i++) {
				if (tempStr.indexOf(itemCodes[i]) == -1) {
					tempStr += itemCodes[i] + "|";
					String tempSql2 = "SELECT T.WOI_ITEM_CODE,SUM(T.WOI_EXCEED_NUM) WOI_EXCEED_NUM"
							+ " FROM T_WMS_OUTSTOCK_ITEM T "
							+ " WHERE T.WOI_DOC_NUM = ? AND T.WOI_ITEM_CODE=? GROUP BY T.WOI_ITEM_CODE ";
					List<Map<String, Object>> tempResult = modelService.listDataSql(tempSql2,
							new Object[] { docNum, itemCodes[i] });

					int exceedNum = 0;
					if (!tempResult.isEmpty() && tempResult != null) {
						if (StringUtils.isNotBlank(tempResult.get(0).get("WOI_EXCEED_NUM"))) {
							exceedNum = Integer.parseInt(StringUtils.toString(tempResult.get(0).get("WOI_EXCEED_NUM")));
						}

					}

					String tempSql3 = "UPDATE T_MID_EXCEED_ITEM_INFO  " + " SET MEI_ITEM_COUNT = MEI_ITEM_COUNT +? "
							+ " WHERE MEI_ITEM_CODE=? ";
					modelService.execSql(tempSql3, new Object[] { exceedNum, itemCodes[i] });
				}
				if (!itemIds[i].equals("")) { // 修改数据
					CommMethod.editSysDefCol(outStockItem.getColMap(), modelAction.getUser());
					outStockItem.getColMap().clear();
					outStockItem.setSqlWhere(" and id =?");
					list.clear();
					list.add(itemIds[i]);
					outStockItem.setSqlWhereArgs(list);
					outStockItem.getColMap().put("WOI_PLAN_NUM", Integer.valueOf(planNums[i]));// 计划数量
					outStockItem.getColMap().put("WOI_WH_CODE", wmsSelects[i]);// 仓库代码
					outStockItem.getColMap().put("WOI_REQUEST_NUM", Integer.valueOf(requestNums[i]));// 需求数量
					outStockItem.getColMap().put("WOI_EXCEED_NUM", Integer.valueOf(exceedUseNums[i]));// 使用超发数量
					if (!deliveryDate[i].equals("")) {
						outStockItem.getColMap().put("WOI_DELIVERY_DATE", sdf2.parse(deliveryDate[i]));
					} else {
						outStockItem.getColMap().put("WOI_DELIVERY_DATE", null);
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
					outStockItem.getColMap().put("WOI_PROCESS_FACE", proFace);// 面别
					outStockItem.getColMap().put("WOI_ITEM_CODE", itemCodes[i]);// 物料料号
					outStockItem.getColMap().put("WOI_PLAN_NUM", Integer.valueOf(planNums[i]));// 计划数量
					outStockItem.getColMap().put("WOI_ITEM_SEQ", Integer.valueOf(itemSeqs[i]));// 项次
					// outStockItem.getColMap().put("WOI_ITEM_SEQ", 0);// 项次
					outStockItem.getColMap().put("WOI_CONNECT_DOC", moNums[i]);// 关联单号
					outStockItem.getColMap().put("WOI_WH_CODE", wmsSelects[i]);// 仓库代码
					outStockItem.getColMap().put("WOI_REQUEST_NUM", Integer.valueOf(planNums[i]));// 需求数量
					outStockItem.getColMap().put("WOI_EXCEED_NUM", Integer.valueOf(exceedUseNums[i]));// 使用超发数量
					outStockItem.getColMap().put("WOI_MIN_PACK", Integer.valueOf(minPacks[i]));// 使用超发数量
					outStockItem.getColMap().put("WOI_MEMO", wodMemo);// 备注
					if (!deliveryDate[i].equals("")) {
						outStockItem.getColMap().put("WOI_DELIVERY_DATE", sdf2.parse(deliveryDate[i]));
					} else {
						outStockItem.getColMap().put("WOI_DELIVERY_DATE", null);
					}

					if (dataAuth != null) {
						outStockItem.getColMap().put("DATA_AUTH", dataAuth);
					}
					modelService.save(outStockItem);
				}

			}
			// 修改超发物料信息表
			String tempSql2 = "SELECT T.WOI_ITEM_CODE,SUM(T.WOI_EXCEED_NUM) WOI_EXCEED_NUM"
					+ " FROM T_WMS_OUTSTOCK_ITEM T "
					+ " WHERE T.WOI_DOC_NUM = ? AND T.DATA_AUTH=? GROUP BY T.WOI_ITEM_CODE ";
			List<Map<String, Object>> tempResult = modelService.listDataSql(tempSql2,
					new Object[] { docNum, dataAuth });
			int tNum = tempResult.size();
			for (int i = 0; i < tNum; i++) {
				String itemCode = StringUtils.toString(tempResult.get(i).get("WOI_ITEM_CODE"));
				int exceedNum = 0;
				String exceedNumStr = StringUtils.toString(tempResult.get(i).get("WOI_EXCEED_NUM"));
				if (!StringUtils.isBlank(exceedNumStr)) {
					exceedNum = Integer.parseInt(StringUtils.toString(tempResult.get(i).get("WOI_EXCEED_NUM")));
				}
				String tempSql3 = "UPDATE T_MID_EXCEED_ITEM_INFO  " + " SET MEI_ITEM_COUNT = MEI_ITEM_COUNT -? "
						+ " WHERE MEI_ITEM_CODE=? AND DATA_AUTH=? ";
				modelService.execSql(tempSql3, new Object[] { exceedNum, itemCode, dataAuth });
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"), e);// modelAction.getText("修改失败")
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}

}
