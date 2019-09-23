package com.more.mes.smt.wmsinventorymanage.pg;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 删除盘点单相关信息
 * 
 * @author development
 *
 */
public class DelInventoryDoc implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		MsHTranMan hbtran = BussService.getHbTran();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		try {
			String delId = request.getParameter("delId");// 需要删除的id
			String[] strArray = delId.split(",");
			// 查询有没有盘0状态的物料
			String sql = "select WID_DOC_NUM,WID_ITEM_SN from T_WMS_INVENTORY_DETAIL "
					+ " where WID_ITEM_ID=? and WID_ITEM_STATUS=? " + " and DATA_AUTH=? ";
			List<Map> itemList = null;
			int num = strArray.length;
			for (int i = 0; i < num; i++) {
				itemList = modelService.listDataSql(sql, new Object[] { strArray[i], "3", auth });
				if (itemList != null && itemList.size() > 0) { // 如果有盘0物料则删除盘0物料信息
					String delSql = "delete from T_WMS_INVENTORY_LOSS_INFO " + "where WIL_DOC_NUM=? "
							+ "and WIL_ITEM_SN=? and DATA_AUTH=?  ";
					modelService.execSql(delSql, new Object[] { itemList.get(0).get("WID_DOC_NUM"),
							itemList.get(0).get("WID_ITEM_SN"), auth });
				}
			}
			// 审核/单据关结/删除，则修改库存表状态为之前状态
			String upWhere = null;
			Object[] parobj = new Object[num];
			for (int i = 0; i < num; i++) {
				parobj[i] = strArray[i];
				if (upWhere == null) {
					upWhere = "?";
				} else {
					upWhere = upWhere + "," + "?";
				}
			}
			String upSql = "update t_wms_stock_info as t1 " + "set wsi_stock_flag = t2.wid_storage_status "
					+ "from (select coalesce(b.wid_storage_status,'2') wid_storage_status,b.wid_item_sn "
					+ "from T_WMS_INVENTORY_DETAIL b where b.wid_item_id in(" + upWhere + ")) as t2 "
					+ "where t1.wsi_item_sn = t2.wid_item_sn";
			modelService.execSql(upSql, parobj);
			// 删除仓库盘点单明细信息
			TableDataMapExt delwms1 = new TableDataMapExt();
			delwms1.setTableName("T_WMS_INVENTORY_DETAIL");
			for (int i = 0; i < num; i++) {
				delwms1.setSqlWhere(" and WID_ITEM_ID=? and DATA_AUTH=?   ");
				List<Object> wList = new ArrayList<Object>();
				wList.add(strArray[i]);
				wList.add(auth);
				delwms1.setSqlWhereArgs(wList);
				modelService.del(delwms1);
			}
			// 删除仓库盘点单物料信息
			TableDataMapExt delItem = new TableDataMapExt();
			delItem.setTableName("T_WMS_INVENTORY_ITEM");
			for (int i = 0; i < num; i++) {
				delItem.setSqlWhere(" and ID=? ");
				List<Object> wList = new ArrayList<Object>();
				wList.add(strArray[i]);
				delItem.setSqlWhereArgs(wList);
				modelService.del(delItem);
			}
			// 删除没有关联的仓库单据信息表数据息 即当该单号所关联的物料全部被删除时删除仓库单据信息表数据
			String sql1 = "DELETE FROM T_WMS_DOC_INFO WHERE WDI_DOC_NUM IN("
					+ "select t.WID_DOC_NUM from T_WMS_INVENTORY_DOC t WHERE NOT exists"
					+ "(SELECT 1 FROM T_WMS_INVENTORY_ITEM a WHERE a.WII_DOC_NUM=t.WID_DOC_NUM "
					+ " and a.DATA_AUTH=? ) and t.DATA_AUTH=? ) and DATA_AUTH=? ";
			modelService.execSql(sql1, new Object[] { auth, auth, auth });
			// 删除没有关联的盘点单信息 即当该单号所关联的物料全部被删除时删除盘点信息
			String sql2 = "DELETE FROM T_WMS_INVENTORY_DOC WHERE WID_DOC_NUM IN("
					+ "select t.WID_DOC_NUM from T_WMS_INVENTORY_DOC t WHERE NOT exists"
					+ "(SELECT 1 FROM T_WMS_INVENTORY_ITEM a WHERE a.WII_DOC_NUM=t.WID_DOC_NUM "
					+ " and a.DATA_AUTH=? ) and t.DATA_AUTH=? ) and DATA_AUTH=? ";
			modelService.execSql(sql2, new Object[] { auth, auth, auth });
		} catch (Exception e) {
			hbtran.rollback();
			log.error(e);
			throw new BussException(modelAction.getText("删除失败"), e);
		}
		hbtran.commit();
		return modelAction.reloadParent(modelAction.getText("删除成功"));
	}

}
