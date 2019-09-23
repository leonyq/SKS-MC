package com.more.mes.smt.indicatorr;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 生产指示单----生产指示单---部门确认--保存
 * 
 * @author development
 */
public class EditConfirmItemInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {//
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

			String infoId = modelAction.getDataId();
			String memo = request.getParameter("paraMapObj.CO_MEMO");
			List<Object> sqlList = new ArrayList<Object>();
			sqlList.add(infoId);
			TableDataMapExt tMap = new TableDataMapExt();
			tMap.setTableName("T_CO_INDICATORR");
			CommMethod.editSysDefCol(tMap.getColMap(), modelAction.getUser());
			tMap.setSqlWhere(" and ID=? ");
			tMap.setSqlWhereArgs(sqlList);
			tMap.getColMap().put("CO_MEMO", memo);
			if (dataAuth != null) {
				tMap.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.edit(tMap);

			String infoIdStr = request.getParameter("infoIdStr");
			String[] infoIds = infoIdStr.split(",", -1);
			List<Object> sqlList2 = null;
			int num = infoIds.length;
			for (int i = 0; i < num; i++) {
				sqlList2 = new ArrayList<Object>();
				sqlList2.add(infoIds[i]);
				TableDataMapExt detailMap = new TableDataMapExt();
				detailMap.setTableName("T_CO_INDICATORR_PROJECT_INFO");
				CommMethod.editSysDefCol(detailMap.getColMap(), modelAction.getUser());
				detailMap.setSqlWhere(" and ID=? ");
				detailMap.setSqlWhereArgs(sqlList2);
				detailMap.getColMap().put("CO_STATE", "2");
				detailMap.getColMap().put("CO_CONFIRM_TIME", DateUtil.getCurDate());
				if (dataAuth != null) {
					detailMap.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.edit(detailMap);
			}

		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("确认失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("确认成功"), "0");
	}
}
