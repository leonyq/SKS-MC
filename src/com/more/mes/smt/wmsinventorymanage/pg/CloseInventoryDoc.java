package com.more.mes.smt.wmsinventorymanage.pg;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.led.executor.Shelfexecutor;

/**
 * 盘点管理单据关结
 * 
 * @author development
 *
 */
public class CloseInventoryDoc implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		MsHTranMan hbtran = BussService.getHbTran();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		try {
			String delId = request.getParameter("delId");// 需要关结的id
			String[] strArray = delId.split(",");

			// 根据id获取单据号
			String sql1 = "select t.WII_DOC_NUM from T_WMS_INVENTORY_ITEM t where t.id = ?";
			List<Map> itemList = null;
			String docNum = null;
			int strNum = strArray.length;
			TableDataMapExt doc = new TableDataMapExt();
			doc.setTableName("T_WMS_INVENTORY_DOC");
			TableDataMapExt wms = new TableDataMapExt();
			wms.setTableName("T_WMS_DOC_INFO");
			LinkedHashSet<String> linkSet = new LinkedHashSet<String>();
			for (int i = 0; i < strNum; i++) {
				itemList = modelService.listDataSql(sql1, new Object[] { strArray[i] });
				docNum = (String) itemList.get(0).get("WII_DOC_NUM");
				linkSet.add(docNum);// 去重
			}
			TableDataMapExt detail1 = new TableDataMapExt();
			detail1.setTableName("T_WMS_INVENTORY_DETAIL");
			for (String docNo : linkSet) { // 去重后循环
				// 灭灯
				String res = light(docNo, modelService);// 5s
				if (!res.equals("OK")) {
					hbtran.rollback();
					return modelAction.alertParentInfo(res);
				}
				String sql = "select T.CMD from T_WMS_BACKUP_MAT_CMD t WHERE T.DOC_NUM=? ";
				List<Map> cmdList = modelService.listDataSql(sql, new Object[] { docNo });
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

				doc.setSqlWhere(" and WID_DOC_NUM=? and DATA_AUTH=? ");
				List<Object> wList = new ArrayList<Object>();
				wList.add(docNo);
				wList.add(auth);
				doc.setSqlWhereArgs(wList);
				doc.getColMap().put("WID_STATUS", "4");
				modelService.edit(doc);
				wms.setSqlWhere(" and WDI_DOC_NUM=?  and DATA_AUTH=? ");
				wms.setSqlWhereArgs(wList);
				wms.getColMap().put("WDI_STATUS", "3");
				modelService.edit(wms);
				// 将盘点物料明细移至盘点单明细日志表内
				String inSql = "insert into T_WMS_INVENTORY_DETAIL_L(ID,DEPT_ID,CREATE_USER,CREATE_TIME,"
						+ "DATA_AUTH,WID_ITEM_ID,WID_ITEM_SN,WID_SUP_CODE,WID_CUST_CODE,WID_WH_CODE,"
						+ "WID_DISTRICT_CODE,WID_STORAGE_CODE,WID_DOC_NUM,WID_ITEM_CODE,WID_STOCK_NUM,"
						+ "WID_INVENTORY_NUM,WID_PROFIT_NUM,WID_ITEM_STATUS,WID_UPLOAD_FLAG,"
						+ "WID_UPLOAD_TIME,WID_INVENTORY_TIME,WID_INVENTORY_EMP,WID_MEMO) "
						+ "SELECT F_C_GETNEWID(),?,?,now(),?,WID_ITEM_ID,WID_ITEM_SN,WID_SUP_CODE,"
						+ "WID_CUST_CODE,WID_WH_CODE,WID_DISTRICT_CODE,WID_STORAGE_CODE,WID_DOC_NUM,"
						+ "WID_ITEM_CODE,WID_STOCK_NUM,WID_INVENTORY_NUM,WID_PROFIT_NUM,WID_ITEM_STATUS,"
						+ "WID_UPLOAD_FLAG,WID_UPLOAD_TIME,WID_INVENTORY_TIME,WID_INVENTORY_EMP,WID_MEMO"
						+ " from T_WMS_INVENTORY_DETAIL where WID_DOC_NUM=? and DATA_AUTH=? ";
				modelService.execSql(inSql, new Object[] { CommMethod.getSessionUser().getDeptId(),
						CommMethod.getSessionUser().getId(), CommMethod.getSessionUser().getDeptId(), docNo, auth });
				// 审核/单据关结/删除，则修改库存表状态为之前状态
				String upSql = "update t_wms_stock_info as t1 " + "set wsi_stock_flag = t2.wid_storage_status "
						+ "from (select coalesce(b.wid_storage_status,'2') wid_storage_status,b.wid_item_sn "
						+ "from T_WMS_INVENTORY_DETAIL b where b.WID_DOC_NUM =?  and b.DATA_AUTH=? ) as t2 "
						+ "where t1.wsi_item_sn = t2.wid_item_sn";
				modelService.execSql(upSql, new Object[] { docNo, auth });
				// 删除盘点单明细表数据
				detail1.getColMap().clear();
				detail1.setSqlWhere(" and WID_DOC_NUM=? and DATA_AUTH=? ");
				detail1.setSqlWhereArgs(wList);
				modelService.del(detail1);
			}
		} catch (Exception e) {
			log.error(e);
			hbtran.rollback();
			throw new BussException(modelAction.getText("关结失败"), e);
		}
		hbtran.commit();
		return modelAction.reloadParent(modelAction.getText("关结成功"));
	}

	@SuppressWarnings("unchecked")
	public String light(String docNum, ModelService modelService) {
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = { 1, 2, 3, 4, 5, 6 };
		int[] outplace = { 7 };
		List<Object> list2 = new ArrayList<Object>();
		List<Object> outType = new ArrayList<Object>();
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

}
