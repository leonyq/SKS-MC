package com.more.mes.smt.wmsoutstock.etstock;

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
 * 委外发料---关结
 * 
 * @author development
 */
public class CloseEtStockDoc implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
			// 根据id获取单据号
			String sql1 = "SELECT T.WOI_DOC_NUM FROM T_WMS_OUTSTOCK_ITEM T WHERE T.ID = ?";
			List<Map> itemList = null;
			String docNum = null;
			TableDataMapExt delwms1 = new TableDataMapExt();
			delwms1.setTableName("T_WMS_OUTSTOCK_ITEM");
			TableDataMapExt receive = new TableDataMapExt();
			receive.setTableName("T_WMS_OUTSTOCK_DOC");
			TableDataMapExt wms = new TableDataMapExt();
			wms.setTableName("T_WMS_DOC_INFO");
			List list = new ArrayList<>();
			for (String id : listId) {
				list.clear();
				itemList = modelService.listDataSql(sql1, new Object[] { id });
				if (itemList != null && itemList.size() > 0) {
					if (StringUtils.isNotBlank(itemList.get(0).get("WOI_DOC_NUM"))) {
						docNum = (String) itemList.get(0).get("WOI_DOC_NUM");
					}
				}
				delwms1.setSqlWhere(" and WOI_DOC_NUM= ?");
				list.add(docNum);
				delwms1.getColMap().put("WOI_STATUS", "3");
				delwms1.setSqlWhereArgs(list);
				modelService.edit(delwms1);
				receive.setSqlWhere(" and WOD_DOC_NUM= ?");
				receive.setSqlWhereArgs(list);
				receive.getColMap().put("WOD_STATUS", "3");
				receive.getColMap().put("WOD_CLOSE_MAN", CommMethod.getSessionUser().getId());
				receive.getColMap().put("WOD_CLOSE_TIME", sdf.parse(sdf.format(new Date())));
				modelService.edit(receive);
				wms.setSqlWhere(" and WDI_DOC_NUM= ?");
				wms.setSqlWhereArgs(list);
				wms.getColMap().put("WDI_STATUS", "3");
				wms.getColMap().put("WDI_CLOSE_MAN", CommMethod.getSessionUser().getId());
				wms.getColMap().put("WDI_CLOSE_TIME", sdf.parse(sdf.format(new Date())));
				modelService.edit(wms);
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("关结失败"), e);
		}
		return modelAction.reloadParent(modelAction.getText("关结成功"));
	}

}
