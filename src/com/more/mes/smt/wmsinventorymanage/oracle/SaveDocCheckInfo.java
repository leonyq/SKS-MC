package com.more.mes.smt.wmsinventorymanage.oracle;

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
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.led.executor.Shelfexecutor;

/**
 * 单据审核操作
 * 
 * @author development
 *
 */
public class SaveDocCheckInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			String docNum = request.getParameter("docNum");
			String sql = "select WID_DOC_NUM from T_WMS_INVENTORY_DETAIL where WID_ITEM_STATUS in('1','2') "
					+ " and WID_DOC_NUM=? and DATA_AUTH=? ";
			int count = modelService.countSql(sql, new Object[] { docNum, auth });
			if (count != 0) {
				return modelAction.alertParentInfo(modelAction.getText("存在待盘点/已盘点的物料，不允许审核"));
			}
			// 灭灯
			String res = light(auth, docNum, modelService);
			if (!res.equals("OK")) {
				return modelAction.alertParentInfo(res);
			}
			String sql1 = "select T.CMD from T_WMS_BACKUP_MAT_CMD t WHERE T.DOC_NUM= ? ";
			List<Map> cmdList = modelService.listDataSql(sql1, new Object[] { docNum });
			String cmd = null;
			if (cmdList != null && cmdList.size() > 0) {
				int num = cmdList.size();
				String offCmd = "";// 灭灯
				for (int j = 0; j < num; j++) {
					cmd = (String) cmdList.get(j).get("CMD");
					if (cmd.indexOf("@@OFF") != -1) { // 有灭灯指令
						String[] cmdStr = cmd.split("@@OFF");
						offCmd += cmdStr[1].substring(cmdStr[1].indexOf("[") + 1, cmdStr[1].indexOf("]"));
					}
				}
				Shelfexecutor shel = new Shelfexecutor();
				shel.Execute(offCmd);
			}
			// 判断盘点物料表盈亏数量是否为0，不为0则生成对应的入库单或出库单,盘0的也生成出库单
			String itemsql = "select * from T_WMS_INVENTORY_ITEM where  WII_DOC_NUM=? and DATA_AUTH=? ";
			List<Map> iList = modelService.listDataSql(itemsql, new Object[] { docNum, auth });
			if (iList != null && iList.size() > 0) {
				int num = iList.size();
				// 根据物料料号获取盘点的物料sn
				boolean tempFlag = false;
				String deSql = "select * from T_WMS_INVENTORY_DETAIL where WID_ITEM_ID=? and DATA_AUTH=? ";
				String itemCode = null;
				String WRD_DOC_NUM = null;// 入库单号
				String WOD_DOC_NUM = null;// 其他出库单号
				String receiveDoc = "N";// 是否生成入库单
				String outDoc = "N";// 是否生成出库单
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
				WRD_DOC_NUM = getReceiveNo(dataAuth, "DJ06", "", modelService);// 入库单号
				WOD_DOC_NUM = getReceiveNo(dataAuth, "DJ14", "", modelService);// 出库单号
				TableDataMapExt receive1 = new TableDataMapExt();
				receive1.setTableName("T_WMS_RECEIVE_ITEM");
				TableDataMapExt outStockItem = new TableDataMapExt();
				outStockItem.setTableName("T_WMS_OUTSTOCK_ITEM");
				for (int i = 0; i < num; i++) {
					itemCode = (String) iList.get(i).get("WII_ITEM_CODE");
					List<Map> deList = modelService.listDataSql(deSql, new Object[] { iList.get(i).get("ID"), auth });

					int dNum = deList.size();
					for (int j = 0; j < dNum; j++) {

						int profit = Integer.parseInt(StringUtils.toString(deList.get(j).get("WID_PROFIT_NUM")));
						int stockNum = 0;
						int inventoryNum = Integer
								.parseInt(StringUtils.toString(deList.get(j).get("WID_INVENTORY_NUM")));
						if (StringUtils.isNotBlank(deList.get(j).get("WID_STOCK_NUM"))) {
							stockNum = Integer.parseInt(StringUtils.toString(deList.get(j).get("WID_STOCK_NUM")));
						}

						int tempNum = inventoryNum - stockNum;
						if (profit > 0) {
							// 盘盈（盘盈数量>0）则要其他入库
							String inItemSql = "SELECT T.ID,NVL(T.WRI_PLAN_NUM,0) WRI_PLAN_NUM,NVL(T.WRI_RECEIVE_NUM,0) WRI_RECEIVE_NUM "
									+ " FROM T_WMS_RECEIVE_ITEM T WHERE T.WRI_ITEM_CODE=? AND T.WRI_CONNECT_DOC=? and t.DATA_AUTH=? ";
							List<Map> inItemList = modelService.listDataSql(inItemSql,
									new Object[] { iList.get(i).get("WII_ITEM_CODE"), docNum, auth });
							if (tempNum != 0) {
								String tempIid = "";
								if (!inItemList.isEmpty()) {
									// 修改
									tempIid = StringUtils.toString(inItemList.get(0).get("ID"));
									TableDataMapExt tempMap = new TableDataMapExt();
									tempMap.setTableName("T_WMS_RECEIVE_ITEM");
									CommMethod.editSysDefCol(tempMap.getColMap(), modelAction.getUser());
									ArrayList paramList = new ArrayList();
									tempMap.setSqlWhere("and ID = ? ");
									paramList.add(tempIid);
									tempMap.setSqlWhereArgs(paramList);
									tempMap.getColMap().put("WRI_PLAN_NUM",
											Integer.parseInt(
													StringUtils.toString(inItemList.get(0).get("WRI_PLAN_NUM")))
													+ Math.abs(tempNum));
									tempMap.getColMap().put("WRI_RECEIVE_NUM",
											Integer.parseInt(
													StringUtils.toString(inItemList.get(0).get("WRI_RECEIVE_NUM")))
													+ Math.abs(tempNum));
									modelService.edit(tempMap);
								} else {
									outDoc = "Y";

									// 新增
									String iid = StringUtils.getUUID();
									tempIid = iid;
									// 插入入库单物料信息
									receive1.getColMap().clear();
									CommMethod.addSysDefCol(receive1.getColMap(), modelAction.getUser());
									receive1.getColMap().put("ID", iid);
									receive1.getColMap().put("WRI_DOC_NUM", WRD_DOC_NUM);
									receive1.getColMap().put("WRI_STATUS", "3");
									receive1.getColMap().put("WRI_ITEM_CODE", itemCode);
									receive1.getColMap().put("WRI_ITEM_SEQ", 0);
									receive1.getColMap().put("WRI_PLAN_NUM", Math.abs(tempNum));
									receive1.getColMap().put("WRI_RECEIVE_NUM", Math.abs(tempNum));
									receive1.getColMap().put("WRI_PACK_NUM", 0);
									receive1.getColMap().put("WRI_GIFT_NUM", 0);
									receive1.getColMap().put("WRI_CONNECT_DOC", docNum);
									if (dataAuth != null) {
										receive1.getColMap().put("DATA_AUTH", dataAuth);
									}
									modelService.save(receive1);
								}
								TableDataMapExt recDetail = new TableDataMapExt();
								recDetail.setTableName("T_WMS_RECEIVE_DETAIL");
								recDetail.getColMap().clear();
								CommMethod.addSysDefCol(recDetail.getColMap(), modelAction.getUser());
								recDetail.getColMap().put("WRD_ITEM_ID", tempIid);
								recDetail.getColMap().put("WRD_ITEM_SN", deList.get(j).get("WID_ITEM_SN"));
								recDetail.getColMap().put("WRD_CONNECT_DOC", docNum);
								recDetail.getColMap().put("WRD_DOC_NUM", WRD_DOC_NUM);
								recDetail.getColMap().put("WRD_ITEM_CODE", itemCode);
								recDetail.getColMap().put("WRD_RECEIVE_NUM", tempNum);// iList.get(i).get("WII_PROFIT_NUM")
								recDetail.getColMap().put("WRD_CURRENT_NUM", tempNum);// iList.get(i).get("WII_PROFIT_NUM")
								recDetail.getColMap().put("WRD_RECEIVE_TIME", DateUtil.getCurDate());
								recDetail.getColMap().put("WRD_RECEIVE_EMP", CommMethod.getSessionUser().getId());
								recDetail.getColMap().put("WRD_ITEM_SEQ", 0);
								recDetail.getColMap().put("WRD_WH_CODE", iList.get(i).get("WID_WH_CODE"));
								recDetail.getColMap().put("WRD_SUP_TRACE", iList.get(i).get("WID_SUP_CODE"));
								if (dataAuth != null) {
									recDetail.getColMap().put("DATA_AUTH", dataAuth);
								}
								modelService.save(recDetail);
							}
						} else {
							// 盘亏（盘盈数量<0）或者盘0 则要其他出库
							String outItemSql = "SELECT T.ID,NVL(T.WOI_PLAN_NUM,0) WOI_PLAN_NUM,NVL(T.WOI_OUT_NUM,0) WOI_OUT_NUM "
									+ " FROM T_WMS_OUTSTOCK_ITEM T WHERE T.WOI_ITEM_CODE=? AND T.WOI_CONNECT_DOC=? and t.DATA_AUTH=?";
							List<Map> outItemList = modelService.listDataSql(outItemSql,
									new Object[] { iList.get(i).get("WII_ITEM_CODE"), docNum, auth });
							if (tempNum != 0) {
								String tempIid = "";
								if (!outItemList.isEmpty()) {
									// 修改
									tempIid = StringUtils.toString(outItemList.get(0).get("ID"));
									TableDataMapExt tempMap = new TableDataMapExt();
									tempMap.setTableName("T_WMS_OUTSTOCK_ITEM");
									CommMethod.editSysDefCol(tempMap.getColMap(), modelAction.getUser());
									ArrayList paramList = new ArrayList();
									tempMap.setSqlWhere("and ID = ? ");
									paramList.add(tempIid);
									tempMap.setSqlWhereArgs(paramList);
									tempMap.getColMap().put("WOI_PLAN_NUM",
											Integer.parseInt(
													StringUtils.toString(outItemList.get(0).get("WOI_PLAN_NUM")))
													+ Math.abs(tempNum));
									tempMap.getColMap().put("WOI_OUT_NUM",
											Integer.parseInt(
													StringUtils.toString(outItemList.get(0).get("WOI_OUT_NUM")))
													+ Math.abs(tempNum));
									modelService.edit(tempMap);
								} else {
									// 新增
									String iid = StringUtils.getUUID();

									tempIid = iid;
									outStockItem.getColMap().clear();
									CommMethod.addSysDefCol(outStockItem.getColMap(), modelAction.getUser());
									outStockItem.getColMap().put("ID", iid);
									outStockItem.getColMap().put("WOI_DOC_NUM", WOD_DOC_NUM);// 出库单号
									outStockItem.getColMap().put("WOI_STATUS", "3");// 物料状态
									outStockItem.getColMap().put("WOI_ITEM_CODE", itemCode);// 物料料号
									outStockItem.getColMap().put("WOI_PLAN_NUM", Math.abs(tempNum));// 计划数量
									outStockItem.getColMap().put("WOI_OUT_NUM", Math.abs(tempNum));
									outStockItem.getColMap().put("WOI_ITEM_SEQ", 0);// 项次
									outStockItem.getColMap().put("WOI_CONNECT_DOC", docNum);// 关联单号
									outStockItem.getColMap().put("WOI_PACK_NUM", 0);// 标准包装数量
									if (dataAuth != null) {
										outStockItem.getColMap().put("DATA_AUTH", dataAuth);
									}

									modelService.save(outStockItem);
								}
								// 插入出库单详细信息
								// int dNum = deList.size();
								TableDataMapExt recDetail = new TableDataMapExt();
								recDetail.setTableName("T_WMS_OUTSTOCK_DETAIL");

								recDetail.getColMap().clear();
								CommMethod.addSysDefCol(recDetail.getColMap(), modelAction.getUser());
								recDetail.getColMap().put("WOD_ITEM_ID", tempIid);
								recDetail.getColMap().put("WOD_ITEM_SN", deList.get(j).get("WID_ITEM_SN"));
								recDetail.getColMap().put("WOD_DOC_NUM", WOD_DOC_NUM);
								recDetail.getColMap().put("WOD_ITEM_CODE", itemCode);
								recDetail.getColMap().put("WOD_OUTSTOCK_NUM", Math.abs(tempNum));// Integer.parseInt(iList.get(i).get("WII_PROFIT_NUM").toString())
								recDetail.getColMap().put("WOD_OUTSTOCK_TIME", DateUtil.getCurDate());
								recDetail.getColMap().put("WOD_OUTSTOCK_EMP", CommMethod.getSessionUser().getId());
								recDetail.getColMap().put("WOD_WH_CODE", iList.get(i).get("WID_WH_CODE"));
								if (dataAuth != null) {
									recDetail.getColMap().put("DATA_AUTH", dataAuth);
								}
								modelService.save(recDetail);
							}
						}
					}
				}

				String tempSql = "SELECT T.ID FROM T_WMS_INVENTORY_DETAIL T "
						+ "WHERE T.WID_DOC_NUM=? AND T.WID_PROFIT_NUM > 0 and t.DATA_AUTH=?  ";
				List<Map> tempList = modelService.listDataSql(tempSql, new Object[] { docNum, auth });

				if (!tempList.isEmpty()) {
					// 增加仓库单据信息表数据
					TableDataMapExt wms = new TableDataMapExt();
					wms.setTableName("T_WMS_DOC_INFO");
					CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
					wms.getColMap().put("WDI_DOC_NUM", WRD_DOC_NUM);
					wms.getColMap().put("WDI_STATUS", "1");
					wms.getColMap().put("WDI_URGENT_FLAG", "N");
					wms.getColMap().put("WDI_DOC_TYPE", "DJ06");
					wms.getColMap().put("WDI_CREATE_MAN", CommMethod.getSessionUser().getId());
					wms.getColMap().put("WDI_CREATE_TIME", DateUtil.getCurDate());
					if (dataAuth != null) {
						wms.getColMap().put("DATA_AUTH", dataAuth);
					}
					modelService.save(wms);
					// 插入入库单信息
					TableDataMapExt receive = new TableDataMapExt();
					receive.setTableName("T_WMS_RECEIVE_DOC");
					CommMethod.addSysDefCol(receive.getColMap(), modelAction.getUser());
					receive.getColMap().put("WRD_DOC_NUM", WRD_DOC_NUM);
					receive.getColMap().put("WRD_DOC_TYPE", "DJ06");
					receive.getColMap().put("WRD_STATUS", "3");
					receive.getColMap().put("WPD_DELIVERY_DATE", sdf2.parse(sdf2.format(DateUtil.getCurDate())));
					receive.getColMap().put("WRD_URGENT_FLAG", "N");
					receive.getColMap().put("WRD_CREATE_MAN", CommMethod.getSessionUser().getId());
					receive.getColMap().put("WRD_CREATE_TIME", DateUtil.getCurDate());
					if (dataAuth != null) {
						receive.getColMap().put("DATA_AUTH", dataAuth);
					}
					modelService.save(receive);
				}
				String tempSql2 = "SELECT T.ID FROM T_WMS_INVENTORY_DETAIL T "
						+ " WHERE T.WID_DOC_NUM=? AND T.WID_PROFIT_NUM <= 0 and t.DATA_AUTH=? ";
				List<Map> tempList2 = modelService.listDataSql(tempSql2, new Object[] { docNum, auth });
				/*
				 * if(tempList2.isEmpty()){ tempSql2 =
				 * "SELECT T.ID FROM T_WMS_INVENTORY_DETAIL_L T " +
				 * " WHERE T.WID_DOC_NUM=? AND T.WID_PROFIT_NUM <= 0 and t.DATA_AUTH=? ";
				 * tempList2 = modelService.listDataSql(tempSql2, new Object[] {docNum,auth}); }
				 */
				if (!tempList2.isEmpty()) {// 生成其他出库单
					// 增加仓库单据信息表数据
					TableDataMapExt wms = new TableDataMapExt();
					wms.setTableName("T_WMS_DOC_INFO");
					CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
					wms.getColMap().put("WDI_DOC_NUM", WOD_DOC_NUM);
					wms.getColMap().put("WDI_STATUS", "1");
					wms.getColMap().put("WDI_URGENT_FLAG", "N");
					wms.getColMap().put("WDI_DOC_TYPE", "DJ14");
					wms.getColMap().put("WDI_CREATE_MAN", CommMethod.getSessionUser().getId());
					wms.getColMap().put("WDI_CREATE_TIME", DateUtil.getCurDate());
					if (dataAuth != null) {
						wms.getColMap().put("DATA_AUTH", dataAuth);
					}
					modelService.save(wms);
					// 插入出库单信息
					TableDataMapExt receive = new TableDataMapExt();
					receive.setTableName("T_WMS_OUTSTOCK_DOC");
					CommMethod.addSysDefCol(receive.getColMap(), modelAction.getUser());
					receive.getColMap().put("WOD_DOC_NUM", WOD_DOC_NUM);
					receive.getColMap().put("WOD_DOC_TYPE", "DJ14");
					receive.getColMap().put("WOD_STATUS", "3");
					receive.getColMap().put("WOD_OUTSTOCK_DATE", sdf2.parse(sdf2.format(DateUtil.getCurDate())));
					receive.getColMap().put("WOD_URGENT_FLAG", "N");
					receive.getColMap().put("WOD_CREATE_MAN", CommMethod.getSessionUser().getId());
					receive.getColMap().put("WOD_CREATE_TIME", DateUtil.getCurDate());
					if (dataAuth != null) {
						receive.getColMap().put("DATA_AUTH", dataAuth);
					}
					modelService.save(receive);
				}
			}
			// 根据盘点物料明细表盘盈数量不为0的数据调整对应物料SN的库存数据，库存数量=盘点数量
			String querySql = "select * from T_WMS_INVENTORY_DETAIL "
					+ " where WID_PROFIT_NUM !=0 and WID_DOC_NUM=? and DATA_AUTH=? ";
			List<Map> pList = modelService.listDataSql(querySql, new Object[] { docNum, auth });
			if (pList != null && pList.size() > 0) {
				String itemSn = null;
				String upSql = "";
				int invNum = 0;
				for (int i = 0; i < pList.size(); i++) {
					itemSn = (String) pList.get(i).get("WID_ITEM_SN");
					invNum = Integer.parseInt(pList.get(i).get("WID_INVENTORY_NUM").toString());
					// 修改库存数量=盘点数量
					upSql = "update T_WMS_STOCK_INFO set WSI_ITEM_NUM=? where WSI_ITEM_SN=? ";
					modelService.execSql(upSql, new Object[] { invNum, itemSn });
				}
			}
			// 若为盘0物料，将盘0物料库存信息复制到库存日志表，删除库存信息表数据
			String insSql = "insert into t_wms_stock_info_l(wsi_item_sn,wsi_doc_num,wsi_item_code,wsi_item_num,"
					+ "wsi_lot_no,wsi_sup_code,wsi_cust_code,wsi_invalid_date,wsi_wh_code,wsi_district_code,"
					+ "wsi_storage_code,wsi_stock_flag,wsi_item_flag,wsi_inspect_flag,wsi_freeze_flag,wsi_return_flag,"
					+ "wsi_scarp_flag,wsi_vmi_flag,wsi_sup_trace,wsi_produce_date,wsi_receive_time,wsi_receive_emp,"
					+ "wsi_first_sn,wsi_second_sn,wsi_third_sn,wsi_fourth_sn,wsi_connect_doc,id,dept_id,create_user,"
					+ "create_time,data_auth,wsi_sale_doc,wsi_test_time,wsi_light_flag,wsi_manufacturer) "
					+ "select wsi_item_sn,wsi_doc_num,wsi_item_code,wsi_item_num,wsi_lot_no,wsi_sup_code,wsi_cust_code,"
					+ "wsi_invalid_date,wsi_wh_code,wsi_district_code,wsi_storage_code,wsi_stock_flag,wsi_item_flag,"
					+ "wsi_inspect_flag,wsi_freeze_flag,wsi_return_flag,wsi_scarp_flag,wsi_vmi_flag,wsi_sup_trace,"
					+ "wsi_produce_date,wsi_receive_time,wsi_receive_emp,wsi_first_sn,wsi_second_sn,wsi_third_sn,"
					+ "wsi_fourth_sn,wsi_connect_doc,f_c_getnewid(),?,?,sysdate,?,wsi_sale_doc,wsi_test_time,"
					+ "wsi_light_flag,wsi_manufacturer from t_wms_stock_info "
					+ "where wsi_item_sn in(select WID_ITEM_SN from T_WMS_INVENTORY_DETAIL where WID_ITEM_STATUS='3' "
					+ " and WID_DOC_NUM=? and DATA_AUTH=? ) and DATA_AUTH=? ";
			if (dataAuth != null) {
				modelService.execSql(insSql, new Object[] { CommMethod.getSessionUser().getDeptId(),
						CommMethod.getSessionUser().getId(), dataAuth, docNum, auth, auth });
			} else {
				modelService.execSql(insSql,
						new Object[] { CommMethod.getSessionUser().getDeptId(), CommMethod.getSessionUser().getId(),
								CommMethod.getSessionUser().getDeptId(), docNum, auth, auth });
			}
			// 删除库存信息表数据
			String delSql = "delete from T_WMS_STOCK_INFO where WSI_ITEM_SN in(select WID_ITEM_SN from T_WMS_INVENTORY_DETAIL "
					+ "where WID_ITEM_STATUS='3' and WID_DOC_NUM=? and DATA_AUTH=?) and DATA_AUTH=? ";
			modelService.execSql(delSql, new Object[] { docNum, auth, auth });
			// 将盘点物料明细移至盘点单明细日志表内，删除盘点单明细表数据
			// 将盘点物料明细移至盘点单明细日志表内
			String inSql = "insert into T_WMS_INVENTORY_DETAIL_L(ID,DEPT_ID,CREATE_USER,CREATE_TIME,"
					+ "DATA_AUTH,WID_ITEM_ID,WID_ITEM_SN,WID_SUP_CODE,WID_CUST_CODE,WID_WH_CODE,"
					+ "WID_DISTRICT_CODE,WID_STORAGE_CODE,WID_DOC_NUM,WID_ITEM_CODE,WID_STOCK_NUM,"
					+ "WID_INVENTORY_NUM,WID_PROFIT_NUM,WID_ITEM_STATUS,WID_UPLOAD_FLAG,"
					+ "WID_UPLOAD_TIME,WID_INVENTORY_TIME,WID_INVENTORY_EMP,WID_MEMO) "
					+ "SELECT F_C_GETNEWID(),?,?,sysdate,?,WID_ITEM_ID,WID_ITEM_SN,WID_SUP_CODE,"
					+ "WID_CUST_CODE,WID_WH_CODE,WID_DISTRICT_CODE,WID_STORAGE_CODE,WID_DOC_NUM,"
					+ "WID_ITEM_CODE,WID_STOCK_NUM,WID_INVENTORY_NUM,WID_PROFIT_NUM,WID_ITEM_STATUS,"
					+ "WID_UPLOAD_FLAG,WID_UPLOAD_TIME,WID_INVENTORY_TIME,WID_INVENTORY_EMP,WID_MEMO"
					+ " from T_WMS_INVENTORY_DETAIL where WID_DOC_NUM=? and DATA_AUTH=? ";
			if (dataAuth != null) {
				modelService.execSql(inSql, new Object[] { CommMethod.getSessionUser().getDeptId(),
						CommMethod.getSessionUser().getId(), dataAuth, docNum, auth });
			} else {
				modelService.execSql(inSql, new Object[] { CommMethod.getSessionUser().getDeptId(),
						CommMethod.getSessionUser().getId(), CommMethod.getSessionUser().getDeptId(), docNum, auth });
			}
			// 审核/单据关结/删除，则修改库存表状态为之前状态
			String upSql = "merge into t_wms_stock_info a "
					+ "using (select nvl(b.wid_storage_status,'2') wid_storage_status,b.wid_item_sn from T_WMS_INVENTORY_DETAIL b  "
					+ "where b.WID_DOC_NUM =? and b.DATA_AUTH=? ) aa  " + "on (aa.wid_item_sn=a.wsi_item_sn)  "
					+ "when matched then  " + "update set a.wsi_stock_flag=aa.wid_storage_status";
			modelService.execSql(upSql, new Object[] { docNum, auth });
			// 删除盘点单明细表数据
			TableDataMapExt detail1 = new TableDataMapExt();
			detail1.setTableName("T_WMS_INVENTORY_DETAIL");
			detail1.setSqlWhere(" and WID_DOC_NUM=? and DATA_AUTH=? ");
			List<Object> wList = new ArrayList<Object>();
			wList.add(docNum);
			wList.add(auth);
			detail1.setSqlWhereArgs(wList);
			modelService.del(detail1);
			// 将盘点单状态改为关结
			TableDataMapExt doc = new TableDataMapExt();
			doc.setTableName("T_WMS_INVENTORY_DOC");
			CommMethod.editSysDefCol(doc.getColMap(), modelAction.getUser());
			doc.setSqlWhere(" and WID_DOC_NUM=? and DATA_AUTH=? ");
			List<Object> wList1 = new ArrayList<Object>();
			wList1.add(docNum);
			wList1.add(auth);
			doc.setSqlWhereArgs(wList1);
			doc.getColMap().put("WID_STATUS", "3");
			if (dataAuth != null) {
				doc.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.edit(doc);
			// 修改单据信息表T_WMS_DOC_INFO 单据状态为关结
			TableDataMapExt doc1 = new TableDataMapExt();
			doc1.setTableName("T_WMS_DOC_INFO");
			CommMethod.editSysDefCol(doc1.getColMap(), modelAction.getUser());
			doc1.setSqlWhere(" and WDI_DOC_NUM=?  and DATA_AUTH=? ");
			List<Object> wList2 = new ArrayList<Object>();
			wList2.add(docNum);
			wList2.add(auth);
			doc1.setSqlWhereArgs(wList2);
			doc1.getColMap().put("WDI_STATUS", "3");
			if (dataAuth != null) {
				doc1.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.edit(doc1);

		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("单据审核失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("单据审核成功"), "0");
	}

	@SuppressWarnings("unchecked")
	public String light(String auth, String docNum, ModelService modelService) {
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = { 1, 2, 3, 4, 5, 6, 7 };
		int[] outplace = { 8 };
		List<Object> list2 = new ArrayList<Object>();
		List<Object> outType = new ArrayList<Object>();
		list2.add(auth);
		list2.add(docNum);
		list2.add(null);
		list2.add(null);
		list2.add(null);
		list2.add("13");
		list2.add(CommMethod.getSessionUser().getLoginName());
		outType.add("String");
		pf.setClassName("P_W_STOCK_LIGHT");// 货架亮灯
		pf.setInPlace(inPlace);// 存储过程中in
		pf.setOutPlace(outplace); // 存储过程中out
		pf.setValArgs(list2);// 存储过程中输入的参数
		pf.setTotalLen(list2.size() + outType.size());// 总个数
		pf.setOutValType(outType);// 输出的参数
		List<Object> relist = modelService.procComm(pf);// 接收返回值
		String res = (String) relist.get(0); // 结果
		return res;
	}

	@SuppressWarnings("unchecked")
	public String getReceiveNo(String dataAuth, String prefix, String dispatchSn, ModelService modelService) {
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = { 1, 2, 3 };
		int[] outplace = { 4, 5 };
		List<Object> list = new ArrayList<Object>();
		List<Object> outType = new ArrayList<Object>();
		list.add(dataAuth);
		list.add(prefix);
		list.add(dispatchSn);
		outType.add("String");
		outType.add("String");
		pf.setClassName("P_C_GET_DOC_NO");// 生成检验单号
		pf.setInPlace(inPlace);// 存储过程中in
		pf.setOutPlace(outplace); // 存储过程中out
		pf.setValArgs(list);// 存储过程中输入的参数
		pf.setTotalLen(list.size() + outType.size());// 总个数
		pf.setOutValType(outType);// 输出的参数
		List<Object> relist = modelService.procComm(pf);// 接收返回值
		String res = (String) relist.get(0); // 结果
		return res;
	}

}
