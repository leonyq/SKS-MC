package com.more.mes.smt.wmsoutstock;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import com.more.mes.visual.service.EditStockInfo;

/**
 * 采购退料---关结
 * 
 * @author development
 */
public class CloseReturnStockDoc implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings({ "unchecked" })
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		boolean comp = false;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String delDoc = request.getParameter("delId");// 需要删除的单号
			String[] strArray0 = delDoc.split(",");
			String sql00 = "SELECT ID FROM T_WMS_OUTSTOCK_ITEM WHERE WOI_DOC_NUM = ?";
			String delId = "";// 需要删除的id
			int num0 = strArray0.length;
			for (int i = 0; i < num0; i++) {
				List<Map> docList = modelService.listDataSql(sql00, new Object[] { strArray0[i] });
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
			// 根据id获取单据号
			String sql1 = "SELECT T.WOI_DOC_NUM FROM T_WMS_OUTSTOCK_ITEM T WHERE T.ID = ?";
			// 获取单据信息
			String querySql = "SELECT t.wod_dispatch_sn,t.wod_doc_type "
					+ "FROM t_wms_outstock_doc t WHERE t.wod_doc_num = ?";
			// 查询收发类型是否交接
			String disSql = "select t.WDO_HANDOVER_FLAG from T_WMS_DISPATCH_TYPE t where t.WDO_DISPATCH_SN = ?";
			// 单据类型是否交接
			String docSql = "select t.WDT_HANDOVER_FLAG from T_WMS_DOC_TYPE t where t.WDT_TYPE_SN = ? ";
			List<Map> itemList = null;
			List<Map> docList = null;
			List<Map> disList = null; // 收发类型是否交接
			List<Map> dList = null; // 单据类型是否交接
			String docNum = null;
			String isHandover = "N";
			// 判断是否交接
			int sNum = strArray.length;
			for (int i = 0; i < sNum; i++) {
				itemList = modelService.listDataSql(sql1, new Object[] { strArray[i] });
				if (itemList != null && itemList.size() > 0) {
					if (StringUtils.isNotBlank(itemList.get(0).get("WOI_DOC_NUM"))) {
						docNum = (String) itemList.get(0).get("WOI_DOC_NUM");
					}
				}
				docList = modelService.listDataSql(querySql, new Object[] { docNum });
				if (docList != null && docList.size() > 0) {
					if (StringUtils.isNotBlank(docList.get(0).get("WOD_DISPATCH_SN"))) { // 有收发类型
						disList = modelService.listDataSql(disSql,
								new Object[] { docList.get(0).get("WOD_DISPATCH_SN") });
						if (disList != null && disList.size() > 0) {
							if (StringUtils.isNotBlank(disList.get(0).get("WDO_HANDOVER_FLAG"))) {
								if (disList.get(0).get("WDO_HANDOVER_FLAG").equals("Y")) { // 收发类型交接
									isHandover = "Y";
									break;
								}
							}
						}
					} else { // 没有收发类型
						dList = modelService.listDataSql(docSql, new Object[] { docList.get(0).get("WOD_DOC_TYPE") });
						if (dList != null && dList.size() > 0) {
							if (dList.get(0).get("WDT_HANDOVER_FLAG").equals("Y")) { // 单据类型交接
								isHandover = "Y";
								break;
							}
						}
					}
				}
			}
			// 如果交接则判断当前单据的物料是否还在库存中，若存在则提示“物料未交接，不允许关结”
			if (isHandover.equals("Y")) {
				String hanSql = "SELECT COUNT(1) as cNum FROM t_wms_stock_info t WHERE EXISTS ("
						+ "SELECT 1 FROM T_WMS_OUTSTOCK_ITEM t1 WHERE t1.woi_doc_num = ? "
						+ "AND t.wsi_item_code = t1.woi_item_code AND t.wsi_doc_num = ? ) ";
				Map<String, Object> map = modelService.queryForMap(hanSql, new Object[] { docNum, docNum });
				if (map.get("CNUM").equals("0")) {
					return modelAction.alertParentInfo(modelAction.getText("物料未交接，不允许关结"));
				}
			}
			TableDataMapExt delwms1 = new TableDataMapExt();
			delwms1.setTableName("T_WMS_OUTSTOCK_ITEM");
			TableDataMapExt receive = new TableDataMapExt();
			receive.setTableName("T_WMS_OUTSTOCK_DOC");
			TableDataMapExt wms = new TableDataMapExt();
			wms.setTableName("T_WMS_DOC_INFO");
			List list = new ArrayList();
			for (int i = 0; i < sNum; i++) {
				itemList = modelService.listDataSql(sql1, new Object[] { strArray[i] });
				if (itemList != null && itemList.size() > 0) {
					if (StringUtils.isNotBlank(itemList.get(0).get("WOI_DOC_NUM"))) {
						docNum = (String) itemList.get(0).get("WOI_DOC_NUM");
					}
				}
				delwms1.setSqlWhere(" and WOI_DOC_NUM=? ");
				list.clear();
				list.add(docNum);
				delwms1.setSqlWhereArgs(list);
				delwms1.getColMap().put("WOI_STATUS", "3");
				modelService.edit(delwms1);
				receive.setSqlWhere(" and WOD_DOC_NUM=? ");
				receive.setSqlWhereArgs(list);
				receive.getColMap().put("WOD_STATUS", "3");
				receive.getColMap().put("WOD_CLOSE_MAN", CommMethod.getSessionUser().getId());
				receive.getColMap().put("WOD_CLOSE_TIME", sdf.parse(sdf.format(new Date())));
				modelService.edit(receive);
				wms.setSqlWhere(" and WDI_DOC_NUM=? ");
				wms.setSqlWhereArgs(list);
				wms.getColMap().put("WDI_STATUS", "3");
				wms.getColMap().put("WDI_CLOSE_MAN", CommMethod.getSessionUser().getId());
				wms.getColMap().put("WDI_CLOSE_TIME", sdf.parse(sdf.format(new Date())));
				modelService.edit(wms);
				EditStockInfo eInfo = new EditStockInfo();

				comp = eInfo.getDullStock(strArray[i], "2", modelAction);

				if (!comp) {
					break;
				}
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("关结失败"), e);
		}
		if (!comp) {
			return modelAction.reloadParent(modelAction.getText("关结失败"));
		}
		return modelAction.reloadParent(modelAction.getText("关结成功"));
	}

}
