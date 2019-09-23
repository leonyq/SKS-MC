package com.more.mes.smt.wmsmsdinfo;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description MSD信息--放行
 * @ClassName SaveDischarged
 * @author WZY
 */
public class SaveDischarged implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		// String DATA_AUTH = request.getParameter("paraMapObj._DATA_AUTH");
		String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
		String fromId = request.getParameter("formId");
		if (fromId == null) {
			fromId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");

		try {
			String WMI_ITEM_SN = request.getParameter("paraMapObj.WMI_ITEM_SN");
			String WMI_ITEM_CODE = request.getParameter("WMI_ITEM_CODE");
			String WMI_PASS_MEMO = request.getParameter("paraMapObj.WMI_PASS_MEMO");

			TableDataMapExt tab = new TableDataMapExt();
			tab.setTableName("T_WMS_MSD_INFO");
			tab.setSqlWhere(" and WMI_ITEM_SN =? and WMI_ITEM_CODE=?  and DATA_AUTH =? ");
			List<Object> wList = new ArrayList<Object>();
			wList.add(WMI_ITEM_SN);
			wList.add(WMI_ITEM_CODE);
			wList.add(dataAuth);
			tab.setSqlWhereArgs(wList);
			tab.getColMap().put("WMI_PASS_FLAG", "Y");
			tab.getColMap().put("WMI_PASS_MEMO", WMI_PASS_MEMO);
			modelService.edit(tab);

		} catch (Exception e) {
			// TODO: handle exception
			log.error(e);
			throw new BussException(modelAction.getText("放行失败"), e);
		}

		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("放行成功"), "0");
	}

}
