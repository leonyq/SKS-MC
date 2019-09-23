package com.more.mes.smt.wmsoutstock.etstock.oracle;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 委外发料---删除
 * 
 * @author development
 */
public class DelEtStockDoc implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		try {
			String delId = request.getParameter("delId");// 需要删除的id
			String[] strArray = delId.split(",");

			String querySql = "SELECT T.ID AS ID FROM T_WMS_OUTSTOCK_ITEM T LEFT JOIN T_WMS_OUTSTOCK_DOC T1 ON T.woi_doc_num  = T1.wod_doc_num WHERE T1.ID = ?";
			List<Map> ids = null;
			List<String> listId = new ArrayList<>();
			int num = strArray.length;
			for (int i = 0; i < num; i++) {
				ids = modelService.listDataSql(querySql, new Object[] { strArray[i] });
				if (ids != null && ids.size() > 0) {
					for (Map idMap : ids) {
						listId.add(String.valueOf(idMap.get("id")));
					}
				}
			}
			// 判断删除的id有没有明细
			String sql1 = "SELECT T.WOI_ITEM_CODE,T.WOI_DOC_NUM FROM T_WMS_OUTSTOCK_ITEM T WHERE T.ID = ?";
			String sql2 = "SELECT T.WOD_ITEM_CODE " + " FROM T_WMS_OUTSTOCK_DETAIL T "
					+ " LEFT JOIN T_WMS_OUTSTOCK_ITEM T1 " + " ON T.WOD_DOC_NUM = T1.WOI_DOC_NUM "
					+ " AND T.WOD_ITEM_CODE = T1.WOI_ITEM_CODE " + " WHERE T.WOD_ITEM_CODE = ? " + " AND T1.ID = ? ";
			List<Map> itemList = null;
			String itemCode = null;
			String wodDocNum = "";
			for (String id : listId) {
				itemList = modelService.listDataSql(sql1, new Object[] { id });

				if (itemList != null && !itemList.isEmpty()) {
					if (StringUtils.isNotBlank(itemList.get(0).get("WOI_ITEM_CODE"))) {
						itemCode = (String) itemList.get(0).get("WOI_ITEM_CODE");
					}
					if (StringUtils.isNotBlank(itemList.get(0).get("WOI_ITEM_CODE"))) {
						wodDocNum = StringUtils.toString(itemList.get(0).get("WOI_DOC_NUM"));
					}
					int count = modelService.countSql(sql2, new Object[] { itemCode, id });
					if (count != 0) {
						return modelAction.alertParentInfo(modelAction.getText("不能删除有出库总明细的出库单"));
					}
				}
				// 修改超发物料信息表
				String tempSql2 = " select nvl(et_item_usernum,0)  , et_sup_code ,  woi_item_code  from T_WMS_OUTSTOCK_item where id = ? ";
				List<Map<String, Object>> tempResult = modelService.listDataSql(tempSql2, new Object[] { id });
				int etItemUserNum;
				if (StringUtils.isEmpty(tempResult.get(0).get("ET_ITEM_USERNUM"))) {
					etItemUserNum = 0;
				} else {
					etItemUserNum = Integer.parseInt(StringUtils.toString(tempResult.get(0).get("ET_ITEM_USERNUM")));
				}
				String et_sup_code = StringUtils.toString(tempResult.get(0).get("ET_SUP_CODE"));
				String woi_item_code = StringUtils.toString(tempResult.get(0).get("WOI_ITEM_CODE"));

				String tempSql3 = "update T_WMS_OUTSOURCE_STOCK  set wos_item_rn = wos_item_rn + ?  where  wos_item_co = ? and  wos_sup_co = ?  ";
				modelService.execSql(tempSql3, new Object[] { etItemUserNum, woi_item_code, et_sup_code });
			}
			/*
			 * wodDocNum = StringUtils.toString(itemList.get(0).get("WOI_DOC_NUM")); //
			 * 修改超发物料信息表 String tempSql2 =
			 * "SELECT T.WOI_ITEM_CODE,SUM(T.WOI_EXCEED_NUM) WOI_EXCEED_NUM" +
			 * " FROM T_WMS_OUTSTOCK_ITEM T " +
			 * " WHERE T.WOI_DOC_NUM = ? GROUP BY T.WOI_ITEM_CODE "; List<Map<String,
			 * Object>> tempResult = modelService.listDataSql(tempSql2, new Object[]
			 * {wodDocNum}); for (int i = 0; i < tempResult.size(); i++ ) { String itemCode2
			 * = StringUtils.toString(tempResult.get(i).get("WOI_ITEM_CODE")); int exceedNum
			 * = Integer.parseInt(StringUtils.toString(tempResult.get(i).get(
			 * "WOI_EXCEED_NUM"))); String tempSql3 = "UPDATE T_MID_EXCEED_ITEM_INFO T " +
			 * " SET T.MEI_ITEM_COUNT = T.MEI_ITEM_COUNT +? " + " WHERE T.MEI_ITEM_CODE=? ";
			 * modelService.execSql(tempSql3, new Object[] {exceedNum, itemCode2}); }
			 */
			TableDataMapExt delwms1 = new TableDataMapExt();
			delwms1.setTableName("T_WMS_OUTSTOCK_ITEM");
			for (String id : listId) {
				delwms1.setSqlWhere(" and ID= ?");
				List list = new ArrayList<>();
				list.add(id);
				delwms1.setSqlWhereArgs(list);
				modelService.del(delwms1);
			}
			// 删除关联信息表---仓库单据信息表
			String sql = "DELETE FROM T_WMS_DOC_INFO T " + " WHERE T.WDI_DOC_NUM IN " + " (SELECT T1.WOD_DOC_NUM "
					+ " FROM T_WMS_OUTSTOCK_DOC T1 " + " WHERE NOT EXISTS (SELECT T2.WOI_DOC_NUM "
					+ " FROM T_WMS_OUTSTOCK_ITEM T2 "
					+ " WHERE T1.WOD_DOC_NUM = T2.WOI_DOC_NUM) AND T1.WOD_DOC_TYPE='DJ27') ";
			modelService.execSql(sql, null);
			// 删除关联信息表---出库单信息表
			String sql3 = "DELETE FROM T_WMS_OUTSTOCK_DOC T " + " WHERE T.WOD_DOC_NUM IN " + " (SELECT T1.WOD_DOC_NUM "
					+ " FROM T_WMS_OUTSTOCK_DOC T1 " + " WHERE NOT EXISTS (SELECT T2.WOI_DOC_NUM "
					+ " FROM T_WMS_OUTSTOCK_ITEM T2 "
					+ " WHERE T1.WOD_DOC_NUM = T2.WOI_DOC_NUM)) AND T.WOD_DOC_TYPE='DJ27'";
			modelService.execSql(sql3, null);
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("删除失败"), e);
		}
		return modelAction.reloadParent(modelAction.getText("删除成功"));
	}

}
