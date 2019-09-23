package com.more.mes.smt.wmslockstockinfo;

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
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.mes.smt.getsnhttp.service.GetSnService;

/**
 * 齐套---锁定保存
 * 
 * @author development
 */
public class SaveLockStockInfo implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String ids = request.getParameter("projectIds");
			String itemInfos = request.getParameter("itemInfos");
			String[] idStrs = ids.split(",");
			String[] itemInfoStrs = itemInfos.split(",");

			int length = idStrs.length;
			String sql = "select * from T_WMS_LOCKSTOCK_DOC t where t.wld_project_id=? and "
					+ "t.wld_lock_status !='1' AND T.DATA_AUTH=? ";
			List<Map<String, Object>> stockList = null;
			for (int i = 0; i < length; i++) {
				stockList = modelService.listDataSql(sql, new Object[] { idStrs[i], dataAuth });
				if (stockList == null || stockList.isEmpty() == true) {
					// 新增
					// 生成锁定单号
					// String docNum = getReceiveNo(dataAuth, "DJ20", "", modelService);// 锁定单号
					String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
					GetSnService gss = new GetSnService();
					String docNum = gss.getSnForDocNum("DJ20", "", userId, dataAuth);
					if (docNum.indexOf("NG") != -1) {
						return modelAction.alertParentInfo(docNum);
					}
					// 增加仓库单据信息表数据
					TableDataMapExt wms = new TableDataMapExt();
					wms.setTableName("T_WMS_DOC_INFO");
					CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
					wms.getColMap().put("WDI_DOC_NUM", docNum);
					wms.getColMap().put("WDI_STATUS", "1");
					wms.getColMap().put("WDI_DOC_TYPE", "DJ20");
					wms.getColMap().put("WDI_CREATE_MAN", CommMethod.getSessionUser().getId());
					wms.getColMap().put("WDI_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));
					if (dataAuth != null) {
						wms.getColMap().put("DATA_AUTH", dataAuth);
					}
					modelService.save(wms);
					// 插入锁定单信息
					TableDataMapExt lockStock = new TableDataMapExt();
					lockStock.setTableName("T_WMS_LOCKSTOCK_DOC");
					CommMethod.addSysDefCol(lockStock.getColMap(), modelAction.getUser());
					lockStock.getColMap().put("WLD_LOCK_DOC", docNum);// 锁定单号
					lockStock.getColMap().put("WLD_PROJECT_ID", idStrs[i]);// 工单号
					lockStock.getColMap().put("WLD_LOCK_STATUS", "1");// 锁定状态
					lockStock.getColMap().put("WLD_DOC_TYPE", "DJ20");// 单据类型
					lockStock.getColMap().put("WLD_CREATE_MAN", CommMethod.getSessionUser().getId());// 开单人
					lockStock.getColMap().put("WLD_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));// 开单时间
					lockStock.getColMap().put("WLD_LOCK_MAN", CommMethod.getSessionUser().getId());// 锁定人
					lockStock.getColMap().put("WLD_LOCK_TIME", sdf1.parse(sdf1.format(new Date())));// 锁定时间
					if (dataAuth != null) {
						lockStock.getColMap().put("DATA_AUTH", dataAuth);
					}
					modelService.save(lockStock);
					// 插入锁定明细信息
					TableDataMapExt lockStockItem = new TableDataMapExt();
					lockStockItem.setTableName("T_WMS_LOCKSTOCK_DETAIL");
					String item = itemInfoStrs[i];
					String[] itemStrs = item.split("\\|");
					int length2 = itemStrs.length;
					for (int j = 0; j < length2; j++) {
						String[] tempStrs = itemStrs[j].split("/", -1);
						lockStockItem.getColMap().clear();
						CommMethod.addSysDefCol(lockStockItem.getColMap(), modelAction.getUser());
						lockStockItem.getColMap().put("WLD_ITEM_CODE", tempStrs[0]);// 物料料号
						lockStockItem.getColMap().put("WLD_LOCK_DOC", docNum);// 锁定单号
						lockStockItem.getColMap().put("WLD_LOCK_NUM", Integer.parseInt(tempStrs[1]));// 锁定数量
						lockStockItem.getColMap().put("WLD_LOCK_STATUS", "1");// 锁定状态
						if (dataAuth != null) {
							lockStockItem.getColMap().put("DATA_AUTH", dataAuth);
						}
						modelService.save(lockStockItem);
					}
				} else {
					// 修改
					// 修改锁定单信息
					String docNum = StringUtils.toString(stockList.get(0).get("WLD_LOCK_DOC"));
					TableDataMapExt lockStock = new TableDataMapExt();
					lockStock.setTableName("T_WMS_LOCKSTOCK_DOC");
					CommMethod.editSysDefCol(lockStock.getColMap(), modelAction.getUser());
					lockStock.setSqlWhere(" and WLD_LOCK_DOC=? AND DATA_AUTH=? ");
					List<Object> wList2 = new ArrayList<Object>();
					wList2.add(docNum);
					wList2.add(dataAuth);
					lockStock.setSqlWhereArgs(wList2);
					lockStock.getColMap().put("WLD_LOCK_STATUS", "1");// 锁定状态
					lockStock.getColMap().put("WLD_LOCK_MAN", CommMethod.getSessionUser().getId());// 锁定人
					lockStock.getColMap().put("WLD_LOCK_TIME", sdf1.parse(sdf1.format(new Date())));// 锁定时间
					if (dataAuth != null) {
						lockStock.getColMap().put("DATA_AUTH", dataAuth);
					}
					modelService.edit(lockStock);

					// //////////////////////////////////////////////////////////////////////
					// 先删除锁定明细信息
					/*
					 * TableDataMapExt delwms = new TableDataMapExt();
					 * delwms.setTableName("T_WMS_LOCKSTOCK_DETAIL");
					 * delwms.setSqlWhere(" and WLD_LOCK_DOC='" + docNum + "'");
					 * modelService.del(delwms); // 插入锁定明细信息 TableDataMapExt lockStockItem = new
					 * TableDataMapExt(); lockStockItem.setTableName("T_WMS_LOCKSTOCK_DETAIL");
					 * String item = itemInfoStrs[i]; String[] itemStrs =
					 * itemInfoStrs[i].split("\\|"); int length2 = itemStrs.length; for (int j = 0;
					 * j < length2; j++ ) { String[] tempStrs = itemStrs[j].split("/");
					 * CommMethod.addSysDefCol(lockStockItem.getColMap(), modelAction.getUser());
					 * lockStockItem.getColMap().put("ID", StringUtils.getUUID());
					 * lockStockItem.getColMap().put("WLD_ITEM_CODE", tempStrs[0]);// 物料料号
					 * lockStockItem.getColMap().put("WLD_LOCK_DOC", docNum);// 锁定单号
					 * lockStockItem.getColMap().put("WLD_LOCK_NUM",
					 * Integer.parseInt(tempStrs[1]));// 锁定数量
					 * lockStockItem.getColMap().put("WLD_LOCK_STATUS", "1");// 锁定状态 if (dataAuth !=
					 * null) { lockStockItem.getColMap().put("DATA_AUTH", dataAuth); }
					 * modelService.save(lockStockItem); // 修改库存信息表 TableDataMapExt stockItem = new
					 * TableDataMapExt(); stockItem.setTableName("T_WMS_STOCK_INFO");
					 * CommMethod.editSysDefCol(stockItem.getColMap(), modelAction.getUser());
					 * stockItem.setSqlWhere(" and WSI_ITEM_CODE='" + tempStrs[0] + "'");
					 * stockItem.getColMap().put("WSI_STOCK_FLAG", "6");// 物料状态
					 * modelService.edit(stockItem); // 保存仓库日志信息 }
					 */

					// 修改锁定明细信息
					TableDataMapExt lockStockItem = new TableDataMapExt();
					lockStockItem.setTableName("T_WMS_LOCKSTOCK_DETAIL");
					String[] itemStrs = itemInfoStrs[i].split("\\|");
					int length2 = itemStrs.length;
					for (int j = 0; j < length2; j++) {
						String[] tempStrs = itemStrs[j].split("/");
						lockStockItem.getColMap().clear();
						CommMethod.editSysDefCol(lockStockItem.getColMap(), modelAction.getUser());
						lockStockItem.setSqlWhere(" and WLD_LOCK_DOC=? and WLD_ITEM_CODE=? AND DATA_AUTH=? ");
						List<Object> wList = new ArrayList<Object>();
						wList.add(docNum);
						wList.add(tempStrs[0]);
						wList.add(dataAuth);
						lockStockItem.setSqlWhereArgs(wList);
						// lockStockItem.setSqlWhere(" and WLD_ITEM_CODE='" + tempStrs[0] + "'");
						// lockStockItem.getColMap().put("WLD_ITEM_CODE", tempStrs[0]);// 物料料号
						// lockStockItem.getColMap().put("WLD_LOCK_DOC", docNum);// 锁定单号
						lockStockItem.getColMap().put("WLD_LOCK_NUM", Integer.parseInt(tempStrs[1]));// 锁定数量
						lockStockItem.getColMap().put("WLD_LOCK_STATUS", "1");// 锁定状态
						if (dataAuth != null) {
							lockStockItem.getColMap().put("DATA_AUTH", dataAuth);
						}
						modelService.edit(lockStockItem);
						// 修改库存信息表
						TableDataMapExt stockItem = new TableDataMapExt();
						stockItem.setTableName("T_WMS_STOCK_INFO");
						stockItem.getColMap().clear();
						CommMethod.editSysDefCol(stockItem.getColMap(), modelAction.getUser());
						stockItem.setSqlWhere(" and WSI_ITEM_CODE=? AND DATA_AUTH=? ");
						List<Object> wList1 = new ArrayList<Object>();
						wList1.add(tempStrs[0]);
						wList1.add(dataAuth);
						stockItem.setSqlWhereArgs(wList1);
						stockItem.getColMap().put("WSI_STOCK_FLAG", "6");// 物料状态
						modelService.edit(stockItem);
						// 保存仓库日志信息

					}
				}
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("锁定失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("锁定成功"), "0");
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

	// 保存仓库作业日志
	@SuppressWarnings("unchecked")
	public String saveStockInfo(String dataAuth, String docNum, ModelService modelService) {
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = { 1, 2, 3, 4, 5, 6, 7 };
		int[] outplace = { 8 };
		List<Object> list = new ArrayList<Object>();
		List<Object> outType = new ArrayList<Object>();
		list.add(dataAuth);
		list.add(""); // 物料/产品/容器SN
		list.add("");// 新物料/产品SN
		list.add(null);// 数量（用于数量变更）
		list.add("锁定");// 作业代码
		list.add(docNum);// 单据号
		list.add(CommMethod.getSessionUser().getLoginName());// 员工号
		outType.add("String");
		pf.setClassName("P_W_SAVE_TASK_LOG");// 生成检验单号
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
