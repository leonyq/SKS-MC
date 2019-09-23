package com.more.mes.smt.wmscodereprint;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
 * 条码打印---拆分打印---新增保存
 * 
 * @author development
 */
public class SaveSplitCodeInfo implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	private SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {//

		HttpServletRequest request = modelAction.getRequest();
		String itemSn = request.getParameter("itemSn");
		String itemCode = "";
		String itemNum = "";
		String addType = request.getParameter("addType");
		String memo = request.getParameter("paraMap1@0#WRC_MEMO");
		String diskNum = request.getParameter("WRC_DISK_NUM");// 拆分盘数
		String splitNum = request.getParameter("WRC_SPLIT_NUM");// 单盘数量
		String splitFlag = request.getParameter("splitFlag");// 原条码打印
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String formId = request.getParameter("formId");
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		List<Map<String, Object>> tempList = new ArrayList<Map<String, Object>>();

		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");

		int tempNum = 0;
		try {
			String getStockInfoSql = "SELECT T.* FROM T_WMS_STOCK_INFO T WHERE T.WSI_ITEM_SN = ? AND T.DATA_AUTH=? ";
			tempList = modelService.listDataSql(getStockInfoSql, new Object[] { itemSn, dataAuth });

			if ((tempList == null) || tempList.isEmpty()) {
				getStockInfoSql = "SELECT T.* FROM T_MID_SPOT_ITEM_INFO T WHERE T.MSI_ITEM_SN = ? AND T.DATA_AUTH=? ";
				tempList = modelService.listDataSql(getStockInfoSql, new Object[] { itemSn, dataAuth });

				if ((tempList == null) || tempList.isEmpty()) {
					return modelAction.alertParentInfo(modelAction.getText("物料SN不存在，请更换"));
				} else {
					List listParam = new ArrayList();
					itemCode = StringUtils.toString(tempList.get(0).get("MSI_ITEM_CODE"));
					itemNum = StringUtils.toString(tempList.get(0).get("MSI_ITEM_COUNT"));
					tempNum = Integer.parseInt(itemNum) - (Integer.parseInt(diskNum) * Integer.parseInt(splitNum));
					if (Integer.parseInt(itemNum) - Integer.parseInt(splitNum) < 0) {
						return modelAction.alertParentInfo(modelAction.getText("新数量不能大于旧数量"));
					}
					if (Integer.parseInt(itemNum) <= 0) {
						String delSql = "delete from T_WMS_STOCK_INFO T WHERE T.WSI_ITEM_SN = ? AND T.DATA_AUTH=? ";
						modelService.execSql(delSql, new Object[] { itemSn, dataAuth });
					}
					// 修改库存表、新增拆分库存物料记录
					TableDataMapExt msiMap = new TableDataMapExt();
					msiMap.setTableName("T_MID_SPOT_ITEM_INFO");
					CommMethod.editSysDefCol(msiMap.getColMap(), modelAction.getUser());
					listParam.add(itemSn);
					listParam.add(dataAuth);
					msiMap.setSqlWhere(" and MSI_ITEM_SN=? AND DATA_AUTH=? ");
					msiMap.setSqlWhereArgs(listParam);
					msiMap.getColMap().put("MSI_ITEM_COUNT", tempNum);
					if (dataAuth != null) {
						msiMap.getColMap().put("DATA_AUTH", dataAuth);
					}
					modelService.edit(msiMap);

					int[] tempNos = getSerialNum(modelService, modelAction, dataAuth, itemSn, diskNum);
					int minNo = tempNos[0];
					int maxNo = tempNos[1];

					for (int i = minNo; i <= maxNo; i++) {
						if ("false".equals(changeNum(i))) {
							return modelAction.alertParentInfo(modelAction.getText("超出三位流水号"));
						}
						String tempSn = itemSn + changeNum(i);
						// 新增库存记录
						TableDataMapExt msiMap2 = new TableDataMapExt();
						msiMap2.setTableName("T_MID_SPOT_ITEM_INFO");
						CommMethod.addSysDefCol(msiMap2.getColMap(), modelAction.getUser());
						if (dataAuth != null) {
							msiMap2.getColMap().put("DATA_AUTH", dataAuth);
						}
						msiMap2.getColMap().put("MSI_ITEM_SN", tempSn);// 新物料SN
						msiMap2.getColMap().put("MSI_ITEM_CODE", tempList.get(0).get("MSI_ITEM_CODE"));// 料号
						msiMap2.getColMap().put("MSI_ITEM_NAME", tempList.get(0).get("MSI_ITEM_NAME"));// 品名
						msiMap2.getColMap().put("MSI_ITEM_SPEC", tempList.get(0).get("MSI_ITEM_SPEC"));// 物料规格
						msiMap2.getColMap().put("MSI_ITEM_COUNT", splitNum);// 数量
						msiMap2.getColMap().put("MSI_ITEM_SUPPLIERS", tempList.get(0).get("MSI_ITEM_SUPPLIERS"));// 供应商
						msiMap2.getColMap().put("MSI_LOT_NUMBER", tempList.get(0).get("MSI_LOT_NUMBER"));// 批次
						msiMap2.getColMap().put("MSI_MARK_CODE", tempList.get(0).get("MSI_MARK_CODE"));// 标识码
						msiMap2.getColMap().put("MSI_PRODUCT_PLACE", tempList.get(0).get("MSI_PRODUCT_PLACE"));// 制造场所
						msiMap2.getColMap().put("MSI_EMP", tempList.get(0).get("MSI_EMP"));// 作业员
						msiMap2.getColMap().put("MSI_TIME", tempList.get(0).get("MSI_TIME"));// 分板时间
						msiMap2.getColMap().put("MSI_DOC_NUM", tempList.get(0).get("MSI_DOC_NUM"));// 出库单号
						msiMap2.getColMap().put("MSI_REQUEST_COUNT", tempList.get(0).get("MSI_REQUEST_COUNT"));// 需求数量
						msiMap2.getColMap().put("MSI_EXCEED_FLAG", tempList.get(0).get("MSI_EXCEED_FLAG"));// 超发标志（Y/N

						modelService.save(msiMap2);

						// 保存打印日志表信息
						TableDataMapExt wrcMap = new TableDataMapExt();
						wrcMap.setTableName("T_WMS_REPRINT_CODE");
						CommMethod.addSysDefCol(wrcMap.getColMap(), modelAction.getUser());
						if (dataAuth != null) {
							wrcMap.getColMap().put("DATA_AUTH", dataAuth);
						}
						wrcMap.getColMap().put("WRC_NEW_SN", tempSn);// 新物料SN
						wrcMap.getColMap().put("WRC_OLD_SN", itemSn);// 旧物料SN
						wrcMap.getColMap().put("WRC_TYPE", "2");// 作业类型
						wrcMap.getColMap().put("WRC_ITEM_CODE", itemCode);// 物料料号
						wrcMap.getColMap().put("WRC_OLD_NUM", itemNum);// 原数量
						wrcMap.getColMap().put("WRC_NEW_NUM", splitNum);// 新数量
						wrcMap.getColMap().put("WRC_REPRINT_EMP", CommMethod.getSessionUser().getId());// 打印人
						wrcMap.getColMap().put("WRC_REPRINT_TIME", sdf1.parse(sdf1.format(new Date())));// 打印时间
						wrcMap.getColMap().put("WRC_MEMO", memo);// 备注

						modelService.save(wrcMap);
					}
				}
			} else {
				List listParam = new ArrayList();
				itemCode = StringUtils.toString(tempList.get(0).get("WSI_ITEM_CODE"));
				itemNum = StringUtils.toString(tempList.get(0).get("WSI_ITEM_NUM"));
				tempNum = Integer.parseInt(itemNum) - (Integer.parseInt(diskNum) * Integer.parseInt(splitNum));
				if (Integer.parseInt(itemNum) - Integer.parseInt(splitNum) < 0) {
					return modelAction.alertParentInfo(modelAction.getText("新数量不能大于旧数量"));
				}
				// 修改库存表、新增拆分库存物料记录
				TableDataMapExt wsiMap = new TableDataMapExt();
				wsiMap.setTableName("T_WMS_STOCK_INFO");
				CommMethod.editSysDefCol(wsiMap.getColMap(), modelAction.getUser());
				listParam.add(itemSn);
				listParam.add(dataAuth);
				wsiMap.setSqlWhere(" and WSI_ITEM_SN=? AND DATA_AUTH=? ");
				wsiMap.setSqlWhereArgs(listParam);
				wsiMap.getColMap().put("WSI_ITEM_NUM", tempNum);
				if (dataAuth != null) {
					wsiMap.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.edit(wsiMap);

				// 获取最大流水号
				int[] tempNos = getSerialNum(modelService, modelAction, dataAuth, itemSn, diskNum);
				int minNo = tempNos[0];
				int maxNo = tempNos[1];

				for (int i = minNo; i <= maxNo; i++) {
					if ("false".equals(changeNum(i))) {
						return modelAction.alertParentInfo(modelAction.getText("超出三位流水号"));
					}
					String tempSn = itemSn + changeNum(i);
					// 新增库存记录
					TableDataMapExt wsiMap2 = new TableDataMapExt();
					wsiMap2.setTableName("T_WMS_STOCK_INFO");
					CommMethod.addSysDefCol(wsiMap2.getColMap(), modelAction.getUser());
					if (dataAuth != null) {
						wsiMap2.getColMap().put("DATA_AUTH", dataAuth);
					}
					wsiMap2.getColMap().put("WSI_ITEM_SN", tempSn);// 新物料SN
					wsiMap2.getColMap().put("WSI_DOC_NUM", tempList.get(0).get("WSI_DOC_NUM"));// 仓库单据号
					wsiMap2.getColMap().put("WSI_ITEM_CODE", tempList.get(0).get("WSI_ITEM_CODE"));// 物料料号
					wsiMap2.getColMap().put("WSI_ITEM_NUM", splitNum);// 物料数量
					wsiMap2.getColMap().put("WSI_LOT_NO", tempList.get(0).get("WSI_LOT_NO"));// 批次
					wsiMap2.getColMap().put("WSI_SUP_CODE", tempList.get(0).get("WSI_SUP_CODE"));// 供应商代码
					wsiMap2.getColMap().put("WSI_CUST_CODE", tempList.get(0).get("WSI_CUST_CODE"));// 客户代码
					wsiMap2.getColMap().put("WSI_INVALID_DATE", tempList.get(0).get("WSI_INVALID_DATE"));// 保质期
					wsiMap2.getColMap().put("WSI_WH_CODE", tempList.get(0).get("WSI_WH_CODE"));// 仓库代码
					wsiMap2.getColMap().put("WSI_DISTRICT_CODE", tempList.get(0).get("WSI_DISTRICT_CODE"));// 库区代码
					wsiMap2.getColMap().put("WSI_STORAGE_CODE", tempList.get(0).get("WSI_STORAGE_CODE"));// 库位代码
					wsiMap2.getColMap().put("WSI_STOCK_FLAG", tempList.get(0).get("WSI_STOCK_FLAG"));// 物料状态（1--未入库，2--在库，3--备料，4--调拨，5--盘点）
					wsiMap2.getColMap().put("WSI_ITEM_FLAG", tempList.get(0).get("WSI_ITEM_FLAG"));// 品质状态（1--良品，2--不良品）
					wsiMap2.getColMap().put("WSI_INSPECT_FLAG", tempList.get(0).get("WSI_INSPECT_FLAG"));// 检验标志（Y/N）
					wsiMap2.getColMap().put("WSI_FREEZE_FLAG", tempList.get(0).get("WSI_FREEZE_FLAG"));// 冻结标志（Y/N）
					wsiMap2.getColMap().put("WSI_RETURN_FLAG", tempList.get(0).get("WSI_RETURN_FLAG"));// 退料标志（Y/N）
					wsiMap2.getColMap().put("WSI_SCARP_FLAG", tempList.get(0).get("WSI_SCARP_FLAG"));// 报废标志（Y/N）
					wsiMap2.getColMap().put("WSI_VMI_FLAG", tempList.get(0).get("WSI_VMI_FLAG"));// VMI标志（Y/N）
					wsiMap2.getColMap().put("WSI_SUP_TRACE", tempList.get(0).get("WSI_SUP_TRACE"));// 供应商追溯信息
					wsiMap2.getColMap().put("WSI_PRODUCE_DATE", tempList.get(0).get("WSI_PRODUCE_DATE"));// 生产日期
					wsiMap2.getColMap().put("WSI_RECEIVE_TIME", tempList.get(0).get("WSI_RECEIVE_TIME"));// 入库时间
					wsiMap2.getColMap().put("WSI_RECEIVE_EMP", tempList.get(0).get("WSI_RECEIVE_EMP"));// 入库操作员
					wsiMap2.getColMap().put("WSI_FIRST_SN", tempList.get(0).get("WSI_FIRST_SN"));// 一级容器
					wsiMap2.getColMap().put("WSI_SECOND_SN", tempList.get(0).get("WSI_SECOND_SN"));// 二级容器
					wsiMap2.getColMap().put("WSI_THIRD_SN", tempList.get(0).get("WSI_THIRD_SN"));// 三级容器
					wsiMap2.getColMap().put("WSI_FOURTH_SN", tempList.get(0).get("WSI_FOURTH_SN"));// 四级容器
					wsiMap2.getColMap().put("WSI_CONNECT_DOC", tempList.get(0).get("WSI_CONNECT_DOC"));// 关联单号
					wsiMap2.getColMap().put("WSI_SALE_DOC", tempList.get(0).get("WSI_SALE_DOC"));// 销售单号
					wsiMap2.getColMap().put("WSI_LIGHT_FLAG", tempList.get(0).get("WSI_LIGHT_FLAG"));// 产品亮灯（Y/N）
					wsiMap2.getColMap().put("WSI_MANUFACTURER", tempList.get(0).get("WSI_MANUFACTURER"));// 制造商名称

					modelService.save(wsiMap2);

					// 保存打印日志表信息
					TableDataMapExt wrcMap = new TableDataMapExt();
					wrcMap.setTableName("T_WMS_REPRINT_CODE");
					CommMethod.addSysDefCol(wrcMap.getColMap(), modelAction.getUser());
					if (dataAuth != null) {
						wrcMap.getColMap().put("DATA_AUTH", dataAuth);
					}
					wrcMap.getColMap().put("WRC_NEW_SN", tempSn);// 新物料SN
					wrcMap.getColMap().put("WRC_OLD_SN", itemSn);// 旧物料SN
					wrcMap.getColMap().put("WRC_TYPE", "2");// 作业类型
					wrcMap.getColMap().put("WRC_ITEM_CODE", itemCode);// 物料料号
					wrcMap.getColMap().put("WRC_OLD_NUM", itemNum);// 原数量
					wrcMap.getColMap().put("WRC_NEW_NUM", splitNum);// 新数量
					wrcMap.getColMap().put("WRC_REPRINT_EMP", CommMethod.getSessionUser().getId());// 打印人
					wrcMap.getColMap().put("WRC_REPRINT_TIME", sdf1.parse(sdf1.format(new Date())));// 打印时间
					wrcMap.getColMap().put("WRC_MEMO", memo);// 备注

					modelService.save(wrcMap);
				}

			}
			if ("Y".equals(splitFlag)) {
				TableDataMapExt wrcMap = new TableDataMapExt();
				wrcMap.setTableName("T_WMS_REPRINT_CODE");
				CommMethod.addSysDefCol(wrcMap.getColMap(), modelAction.getUser());
				if (dataAuth != null) {
					wrcMap.getColMap().put("DATA_AUTH", dataAuth);
				}
				wrcMap.getColMap().put("WRC_NEW_SN", itemSn);// 新物料SN
				wrcMap.getColMap().put("WRC_OLD_SN", itemSn);// 旧物料SN
				wrcMap.getColMap().put("WRC_TYPE", "2");// 作业类型
				wrcMap.getColMap().put("WRC_ITEM_CODE", itemCode);// 物料料号
				wrcMap.getColMap().put("WRC_OLD_NUM", itemNum);// 原数量
				wrcMap.getColMap().put("WRC_NEW_NUM", tempNum);// 新数量
				wrcMap.getColMap().put("WRC_REPRINT_EMP", CommMethod.getSessionUser().getId());// 打印人
				wrcMap.getColMap().put("WRC_REPRINT_TIME", sdf1.parse(sdf1.format(new Date())));// 打印时间
				wrcMap.getColMap().put("WRC_MEMO", memo);// 备注

				modelService.save(wrcMap);
			}

		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("打印失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("打印成功"), isCloseWin);
	}

	public String changeNum(int index) {
		String tempStr = "";
		if (index < 10) {
			tempStr = "" + index;
		} else if (index < 100) {
			tempStr = "" + index;
		} else if (index > 999) {
			tempStr = "false";
		} else {
			tempStr = index + "";
		}
		tempStr = "-" + tempStr;
		return tempStr;
	}

	public int[] getSerialNum(ModelService modelService, ModelAction modelAction, String dataAuth, String itemSn,
			String diskNum) throws ParseException {

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		int[] tempNum = null;
		int minNo;
		int maxNo;
		String getNoSql = "SELECT T.MSS_MAX_NUM FROM T_WMS_MID_SPLIT_SN T WHERE T.MSS_ITEM_SN=? AND T.DATA_AUTH=? ";
		List<Map<String, Object>> getNoList = modelService.listDataSql(getNoSql, new Object[] { itemSn, dataAuth });
		if ((getNoList == null) || getNoList.isEmpty()) {
			// 不存在 新增
			String infoId = StringUtils.getUUID();
			TableDataMapExt mssMap = new TableDataMapExt();
			mssMap.setTableName("T_WMS_MID_SPLIT_SN");
			mssMap.getColMap().put("ID", infoId);// id
			mssMap.getColMap().put("MSS_ITEM_SN", itemSn);// 新物料SN
			mssMap.getColMap().put("DATA_AUTH", dataAuth);
			mssMap.getColMap().put("MSS_MAX_NUM", diskNum);// 旧物料SN
			mssMap.getColMap().put("MSS_CREAT_DATE", sdf2.parse(sdf2.format(new Date())));// 作业类型
			modelService.save(mssMap);

			minNo = 1;
			maxNo = Integer.parseInt(diskNum);
		} else {
			// 存在 获取最大流水 并修改最大流水号
			int tempNo = Integer.parseInt(StringUtils.toString(getNoList.get(0).get("MSS_MAX_NUM")));
			minNo = tempNo + 1;
			maxNo = tempNo + Integer.parseInt(diskNum);
			List listParam = new ArrayList();
			listParam.add(itemSn);
			listParam.add(dataAuth);
			TableDataMapExt mssMap = new TableDataMapExt();
			mssMap.setTableName("T_WMS_MID_SPLIT_SN");
			mssMap.setSqlWhere(" and MSS_ITEM_SN=? AND DATA_AUTH=? ");
			mssMap.setSqlWhereArgs(listParam);
			mssMap.getColMap().put("MSS_MAX_NUM", maxNo);
			modelService.edit(mssMap);
		}
		tempNum = new int[] { minNo, maxNo };
		return tempNum;
	}
}
