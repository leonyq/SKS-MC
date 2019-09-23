package com.more.mes.smt.wmscodereprint;

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

/**
 * 条码打印---条码重打---新增保存
 * 
 * @author development
 */
public class SaveReprintCodeInfo implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {//
		HttpServletRequest request = modelAction.getRequest();
		String itemSn = request.getParameter("itemSn");
		String itemCode = request.getParameter("itemCode");
		String itemNum = request.getParameter("itemNum");
		String addType = request.getParameter("addType");
		String labelId = request.getParameter("labelId");
		String memo = request.getParameter("paraMap1@0#WRC_MEMO");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String formId = request.getParameter("formId");
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		List<Map<String, Object>> tempList = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		String cldSql = "";
		String tableName = "";
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");

		try {

			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			TableDataMapExt wrcMap = new TableDataMapExt();
			wrcMap.setTableName("T_WMS_REPRINT_CODE");
			CommMethod.addSysDefCol(wrcMap.getColMap(), modelAction.getUser());
			if (dataAuth != null) {
				wrcMap.getColMap().put("DATA_AUTH", dataAuth);
			}
			wrcMap.getColMap().put("WRC_NEW_SN", itemSn);// 新物料SN
			wrcMap.getColMap().put("WRC_OLD_SN", itemSn);// 旧物料SN
			if ("3".equals(addType)) {
				wrcMap.getColMap().put("WRC_TYPE", "3");// 作业类型
			} else {
				wrcMap.getColMap().put("WRC_TYPE", "1");// 作业类型
			}
			int tempNum = 0;
			if (!StringUtils.isBlank(itemNum))
				;
			{
				tempNum = Integer.parseInt(itemNum);
			}
			wrcMap.getColMap().put("WRC_ITEM_CODE", itemCode);// 物料料号
			wrcMap.getColMap().put("WRC_OLD_NUM", tempNum);// 原数量
			wrcMap.getColMap().put("WRC_NEW_NUM", tempNum);// 新数量
			wrcMap.getColMap().put("WRC_REPRINT_EMP", CommMethod.getSessionUser().getId());// 打印人
			wrcMap.getColMap().put("WRC_REPRINT_TIME", sdf1.parse(sdf1.format(new Date())));// 打印时间
			wrcMap.getColMap().put("WRC_MEMO", memo);// 备注

			modelService.save(wrcMap);

			if ("2".equals(addType)) {
				// T_MID_SPOT_ITEM_INFO 生产物料中间信息表
				List listParam = new ArrayList();
				listParam.add(itemSn);
				listParam.add(dataAuth);
				TableDataMapExt msiiMap = new TableDataMapExt();
				msiiMap.setTableName("T_MID_SPOT_ITEM_INFO");
				CommMethod.editSysDefCol(msiiMap.getColMap(), modelAction.getUser());
				msiiMap.setSqlWhere(" and MSI_ITEM_SN=? AND DATA_AUTH=? ");
				msiiMap.setSqlWhereArgs(listParam);
				msiiMap.getColMap().put("MSI_ITEM_COUNT", itemNum);
				if (dataAuth != null) {
					msiiMap.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.edit(msiiMap);
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("打印失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("打印成功"), isCloseWin);
	}
}
