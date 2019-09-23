package com.more.mes.smt.wmsoutstock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 其他出库---删除
 * 
 * @author development
 */
public class DelOtherStockDoc implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		try {
			String delId = request.getParameter("delId");// 需要删除的id
			String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();

			String[] strArray0 = delId.split(",");
			String sql00 = "SELECT ID FROM T_WMS_OUTSTOCK_ITEM WHERE WOI_DOC_NUM = ? AND DATA_AUTH=?";
			int num0 = strArray0.length;
			for (int i = 0; i < num0; i++) {
				List<Map> docList = modelService.listDataSql(sql00, new Object[] { strArray0[i], dataAuth });
				Map<String, String> docMap = new HashMap<String, String>();
				int dNum = docList.size();
				for (int j = 0; j < dNum; j++) {
					docMap = docList.get(j);
					if (i == 0 && j == 0) {
						delId = docMap.get("ID");
					} else {
						delId = delId + "," + docMap.get("ID");
					}
				}
			}
			String[] strArray = delId.split(",");
			// 判断删除的id有没有明细
			String sql1 = "SELECT T.WOI_ITEM_CODE,T.WOI_DOC_NUM FROM T_WMS_OUTSTOCK_ITEM T WHERE T.ID = ? and T.DATA_AUTH=?";
			String sql2 = "SELECT T.WOD_ITEM_CODE " + " FROM T_WMS_OUTSTOCK_DETAIL T "
					+ " LEFT JOIN T_WMS_OUTSTOCK_ITEM T1 " + " ON T.WOD_DOC_NUM = T1.WOI_DOC_NUM "
					+ " AND T.WOD_ITEM_CODE = T1.WOI_ITEM_CODE " + " WHERE T.WOD_ITEM_CODE = ?  "
					+ " AND T1.ID = ? AND T.DATA_AUTH = ? ";
			List list = new ArrayList();
			List<Map> itemList = null;
			String itemCode = null;
			int num = strArray.length;
			for (int i = 0; i < num; i++) {
				itemList = modelService.listDataSql(sql1, new Object[] { strArray[i], dataAuth });
				if (itemList != null && !itemList.isEmpty()) {
					itemCode = (String) itemList.get(0).get("WOI_ITEM_CODE");
					int count = modelService.countSql(sql2, new Object[] { itemCode, strArray[i], dataAuth });
					if (count != 0) {
						return modelAction.alertParentInfo(modelAction.getText("不能删除有出库总明细的出库单"));
					}
				}
			}
			TableDataMapExt delwms1 = new TableDataMapExt();
			delwms1.setTableName("T_WMS_OUTSTOCK_ITEM");
			for (int i = 0; i < num; i++) {
				delwms1.setSqlWhere(" and ID=?");
				list.clear();
				list.add(strArray[i]);
				delwms1.setSqlWhereArgs(list);
				modelService.del(delwms1);
			}
			// 删除关联信息表---仓库单据信息表
			String sql = "DELETE FROM T_WMS_DOC_INFO T " + " WHERE T.WDI_DOC_NUM IN " + " (SELECT T1.WOD_DOC_NUM "
					+ " FROM T_WMS_OUTSTOCK_DOC T1 " + " WHERE NOT EXISTS (SELECT T2.WOI_DOC_NUM "
					+ " FROM T_WMS_OUTSTOCK_ITEM T2 "
					+ " WHERE T1.WOD_DOC_NUM = T2.WOI_DOC_NUM) AND T1.WOD_DOC_TYPE=? AND T1.DATA_AUTH=?) ";
			modelService.execSql(sql, new Object[] { "DJ14", dataAuth });
			// 删除关联信息表---出库单信息表
			String sql3 = "DELETE FROM T_WMS_OUTSTOCK_DOC T " + " WHERE T.WOD_DOC_NUM IN " + " (SELECT T1.WOD_DOC_NUM "
					+ " FROM T_WMS_OUTSTOCK_DOC T1 " + " WHERE NOT EXISTS (SELECT T2.WOI_DOC_NUM "
					+ " FROM T_WMS_OUTSTOCK_ITEM T2 "
					+ " WHERE T1.WOD_DOC_NUM = T2.WOI_DOC_NUM)) AND T.WOD_DOC_TYPE=? AND T.DATA_AUTH=? ";
			modelService.execSql(sql3, new Object[] { "DJ14", dataAuth });
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("删除失败"), e);
		}
		return modelAction.reloadParent(modelAction.getText("删除成功"));
	}

}
