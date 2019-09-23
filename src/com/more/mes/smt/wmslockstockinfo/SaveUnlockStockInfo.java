package com.more.mes.smt.wmslockstockinfo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * 齐套信息---解锁
 * 
 * @author development
 */
public class SaveUnlockStockInfo implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
			String delId = request.getParameter("docStr");// 解锁的单据号
			String[] strArray = delId.split(",");
			String itemCodeStr = request.getParameter("itemCodeStr");// 解锁的单据号
			String[] itemCodeStrs = itemCodeStr.split(",");

			// 修改锁定单信息
			TableDataMapExt editwms = new TableDataMapExt();
			editwms.setTableName("T_WMS_LOCKSTOCK_DOC");
			int num = strArray.length;
			TableDataMapExt delwms = new TableDataMapExt();
			delwms.setTableName("T_WMS_LOCKSTOCK_DETAIL");
			// 修改锁定单信息
			String tempSql = "SELECT T.ID FROM T_WMS_LOCKSTOCK_DETAIL T WHERE T.WLD_LOCK_DOC=? "
					+ "AND T.WLD_LOCK_STATUS='1' AND T.DATA_AUTH=? ";
			TableDataMapExt lockStock = new TableDataMapExt();
			lockStock.setTableName("T_WMS_LOCKSTOCK_DOC");
			// 修改库存信息表
			TableDataMapExt stockItem = new TableDataMapExt();
			stockItem.setTableName("T_WMS_STOCK_INFO");
			for (int i = 0; i < num; i++) {
				String docNum = strArray[i];
				// 修改锁定明细信息
				delwms.getColMap().clear();
				CommMethod.editSysDefCol(delwms.getColMap(), modelAction.getUser());
				delwms.setSqlWhere(" and WLD_LOCK_DOC=? and WLD_ITEM_CODE=? AND DATA_AUTH=? ");
				List<Object> wList2 = new ArrayList<Object>();
				wList2.add(docNum);
				wList2.add(itemCodeStrs[i]);
				wList2.add(dataAuth);
				delwms.setSqlWhereArgs(wList2);
				delwms.getColMap().put("WLD_LOCK_STATUS", "2");// 锁定状态
				modelService.edit(delwms);

				/*
				 * TableDataMapExt lockStock = new TableDataMapExt();
				 * lockStock.setTableName("T_WMS_LOCKSTOCK_DOC");
				 * CommMethod.editSysDefCol(lockStock.getColMap(), modelAction.getUser());
				 * lockStock.setSqlWhere(" and WLD_LOCK_DOC='" + docNum + "'");
				 * lockStock.getColMap().put("WLD_LOCK_STATUS", "2");// 锁定状态
				 * lockStock.getColMap().put("WLD_UNLOCK_MAN",
				 * CommMethod.getSessionUser().getId());// 锁定人
				 * lockStock.getColMap().put("WLD_UNLOCK_TIME", sdf.parse(sdf.format(new
				 * Date())));// 锁定时间 modelService.edit(lockStock);
				 */

				List<Map<String, Object>> tempList = modelService.listDataSql(tempSql,
						new Object[] { docNum, dataAuth });
				if (tempList == null || tempList.isEmpty()) {
					lockStock.getColMap().clear();
					CommMethod.editSysDefCol(lockStock.getColMap(), modelAction.getUser());
					lockStock.setSqlWhere(" and WLD_LOCK_DOC=? AND DATA_AUTH=? ");
					List<Object> wList = new ArrayList<Object>();
					wList.add(docNum);
					wList.add(dataAuth);
					lockStock.setSqlWhereArgs(wList);
					lockStock.getColMap().put("WLD_LOCK_STATUS", "2");// 锁定状态
					lockStock.getColMap().put("WLD_UNLOCK_MAN", CommMethod.getSessionUser().getId());// 锁定人
					lockStock.getColMap().put("WLD_UNLOCK_TIME", sdf.parse(sdf.format(new Date())));// 锁定时间
					modelService.edit(lockStock);
				}
				stockItem.getColMap().clear();
				CommMethod.editSysDefCol(stockItem.getColMap(), modelAction.getUser());
				stockItem.setSqlWhere(" and WSI_ITEM_CODE=? AND DATA_AUTH=? ");
				List<Object> wList = new ArrayList<Object>();
				wList.add(itemCodeStrs[i]);
				wList.add(dataAuth);
				stockItem.setSqlWhereArgs(wList);
				stockItem.getColMap().put("WSI_STOCK_FLAG", "2");// 物料状态
				modelService.edit(stockItem);
			}

		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("解锁失败"), e);
		}
		return BaseActionSupport.AJAX;
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
