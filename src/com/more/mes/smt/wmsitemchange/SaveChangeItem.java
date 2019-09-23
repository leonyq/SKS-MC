package com.more.mes.smt.wmsitemchange;

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
 * 物料变更----新增保存
 * 
 * @author development
 */
public class SaveChangeItem implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			String itemSn = request.getParameter("paraMap1@0#WIC_ITEM_SN");// 设备SN
			String itemCodeStr = request.getParameter("itemCode");// 设备SN
			String itemNumStr = request.getParameter("itemNum");// 设备SN
			String lotNoStr = request.getParameter("lotNo");// 设备SN
			List<Map> list = null;

			String getStockInfoSql = "";
			getStockInfoSql = "SELECT T.WSI_ITEM_SN, T.WSI_ITEM_CODE, T.WSI_ITEM_NUM, T.WSI_LOT_NO "
					+ " FROM T_WMS_STOCK_INFO T " + " WHERE T.WSI_ITEM_SN = ? AND T.DATA_AUTH=? ";
			list = modelService.listDataSql(getStockInfoSql, new Object[] { itemSn, dataAuth });

			if (list == null || list.isEmpty()) {
				return modelAction.alertParentInfo(modelAction.getText("物料SN不存在"));
			}

			getStockInfoSql = "SELECT T.WSI_ITEM_SN, T.WSI_ITEM_CODE, T.WSI_ITEM_NUM, T.WSI_LOT_NO "
					+ " FROM T_WMS_STOCK_INFO T "
					+ " WHERE T.WSI_ITEM_SN = ? AND T.WSI_STOCK_FLAG = '2' AND T.DATA_AUTH=? ";
			list = modelService.listDataSql(getStockInfoSql, new Object[] { itemSn, dataAuth });

			if (list == null || list.isEmpty()) {
				return modelAction.alertParentInfo(modelAction.getText("物料不在库"));
			}

			String itemCode = StringUtils.toString(list.get(0).get("WSI_ITEM_CODE"));
			String itemNum = StringUtils.toString(list.get(0).get("WSI_ITEM_NUM"));
			String lotNo = StringUtils.toString(list.get(0).get("WSI_LOT_NO"));
			if (!itemCode.equals(itemCodeStr)) {
				TableDataMapExt itemMap = new TableDataMapExt();
				itemMap.setTableName("T_WMS_ITEM_CHANGE");
				CommMethod.addSysDefCol(itemMap.getColMap(), modelAction.getUser());
				itemMap.getColMap().put("WIC_ITEM_SN", itemSn);// 物料SN
				itemMap.getColMap().put("WIC_ORIGINAL_VALUE", itemCode);// 原有值
				itemMap.getColMap().put("WIC_EXISTING_VALUE", itemCodeStr);// 现有值
				itemMap.getColMap().put("WIC_CHANGE_TIME", sdf1.parse(sdf1.format(new Date())));// 变更时间
				itemMap.getColMap().put("WIC_CHANGE_EMP", CommMethod.getSessionUser().getId());// 变更人
				itemMap.getColMap().put("WIC_CHANGE_TYPE", "1");// 变更类型
				modelService.save(itemMap);

				// 修改库存数据
				TableDataMapExt stockInfo = new TableDataMapExt();
				stockInfo.setTableName("T_WMS_STOCK_INFO");
				CommMethod.editSysDefCol(stockInfo.getColMap(), modelAction.getUser());
				stockInfo.setSqlWhere(" and WSI_ITEM_SN=? AND DATA_AUTH=? ");
				List<Object> wList = new ArrayList<Object>();
				wList.add(itemSn);
				wList.add(dataAuth);
				stockInfo.setSqlWhereArgs(wList);
				stockInfo.getColMap().put("WSI_ITEM_CODE", itemCodeStr);
				if (dataAuth != null) {
					stockInfo.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.edit(stockInfo);
			}
			if (!itemNum.equals(itemNumStr)) {
				TableDataMapExt itemMap = new TableDataMapExt();
				itemMap.setTableName("T_WMS_ITEM_CHANGE");
				CommMethod.addSysDefCol(itemMap.getColMap(), modelAction.getUser());
				itemMap.getColMap().put("WIC_ITEM_SN", itemSn);// 物料SN
				itemMap.getColMap().put("WIC_ORIGINAL_VALUE", itemNum);// 原有值
				itemMap.getColMap().put("WIC_EXISTING_VALUE", itemNumStr);// 现有值
				itemMap.getColMap().put("WIC_CHANGE_TIME", sdf1.parse(sdf1.format(new Date())));// 变更时间
				itemMap.getColMap().put("WIC_CHANGE_EMP", CommMethod.getSessionUser().getId());// 变更人
				itemMap.getColMap().put("WIC_CHANGE_TYPE", "2");// 变更类型
				modelService.save(itemMap);

				// 修改库存数据
				TableDataMapExt stockInfo = new TableDataMapExt();
				stockInfo.setTableName("T_WMS_STOCK_INFO");
				CommMethod.editSysDefCol(stockInfo.getColMap(), modelAction.getUser());
				stockInfo.setSqlWhere(" and WSI_ITEM_SN=? AND DATA_AUTH=? ");
				List<Object> wList = new ArrayList<Object>();
				wList.add(itemSn);
				wList.add(dataAuth);
				stockInfo.setSqlWhereArgs(wList);
				stockInfo.getColMap().put("WSI_ITEM_NUM", Integer.parseInt(itemNumStr));
				if (dataAuth != null) {
					stockInfo.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.edit(stockInfo);
			}
			if (!lotNo.equals(lotNoStr)) {
				TableDataMapExt itemMap = new TableDataMapExt();
				itemMap.setTableName("T_WMS_ITEM_CHANGE");
				CommMethod.addSysDefCol(itemMap.getColMap(), modelAction.getUser());
				itemMap.getColMap().put("WIC_ITEM_SN", itemSn);// 物料SN
				itemMap.getColMap().put("WIC_ORIGINAL_VALUE", lotNo);// 原有值
				itemMap.getColMap().put("WIC_EXISTING_VALUE", lotNoStr);// 现有值
				itemMap.getColMap().put("WIC_CHANGE_TIME", sdf1.parse(sdf1.format(new Date())));// 变更时间
				itemMap.getColMap().put("WIC_CHANGE_EMP", CommMethod.getSessionUser().getId());// 变更人
				itemMap.getColMap().put("WIC_CHANGE_TYPE", "3");// 变更类型
				modelService.save(itemMap);

				// 修改库存数据
				TableDataMapExt stockInfo = new TableDataMapExt();
				stockInfo.setTableName("T_WMS_STOCK_INFO");
				CommMethod.editSysDefCol(stockInfo.getColMap(), modelAction.getUser());
				stockInfo.setSqlWhere(" and WSI_ITEM_SN=? AND DATA_AUTH=? ");
				List<Object> wList = new ArrayList<Object>();
				wList.add(itemSn);
				wList.add(dataAuth);
				stockInfo.setSqlWhereArgs(wList);
				stockInfo.getColMap().put("WSI_LOT_NO", lotNoStr);
				if (dataAuth != null) {
					stockInfo.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.edit(stockInfo);
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("新增失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}

}
