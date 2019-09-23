package com.more.mes.smt.planquotiety;

import java.util.ArrayList;
import java.util.List;

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
 * 影响系数---修改保存
 * 
 * @author Administrator
 *
 */
public class EditProductStep implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			String step = request.getParameter("PPQ_PRODUCT_STEP");
			String ppqAreaSn = request.getParameter("paraMapObj.PPQ_AREA_SN");
			String ppqDeviceQuotiety = request.getParameter("paraMapObj.PPQ_DEVICE_QUOTIETY");
			String ppqManpowerQuotiety = request.getParameter("paraMapObj.PPQ_MANPOWER_QUOTIETY");
			String ppqEfficiencyQuotiety = request.getParameter("paraMapObj.PPQ_EFFICIENCY_QUOTIETY");
			String ppqQualityQuotiety = request.getParameter("paraMapObj.PPQ_QUALITY_QUOTIETY");
			String ppqDualQuotiety = request.getParameter("paraMapObj.PPQ_DUAL_QUOTIETY");
			String id = request.getParameter("id");// id
			String sql = "select * from T_PM_PLAN_QUOTIETY where PPQ_PRODUCT_STEP=? "
					+ " and PPQ_AREA_SN=? and id not in(?) AND DATA_AUTH=? ";

			int count = modService.countSql(sql, new Object[] { step, ppqAreaSn, id, dataAuth });

			if (count != 0) {
				return modelAction.alertParentInfo(modelAction.getText("该阶别下已存在该线别"));
			}
			List list = new ArrayList();
			TableDataMapExt tExt = new TableDataMapExt();
			tExt.setTableName("T_PM_PLAN_QUOTIETY");

			CommMethod.editSysDefCol(tExt.getColMap(), modelAction.getUser());
			tExt.getColMap().put("PPQ_PRODUCT_STEP", step);
			tExt.getColMap().put("PPQ_AREA_SN", ppqAreaSn);
			tExt.getColMap().put("PPQ_DEVICE_QUOTIETY", Double.valueOf(ppqDeviceQuotiety));
			tExt.getColMap().put("PPQ_MANPOWER_QUOTIETY", Double.valueOf(ppqManpowerQuotiety));
			tExt.getColMap().put("PPQ_EFFICIENCY_QUOTIETY", Double.valueOf(ppqEfficiencyQuotiety));
			tExt.getColMap().put("PPQ_QUALITY_QUOTIETY", Double.valueOf(ppqQualityQuotiety));
			tExt.getColMap().put("PPQ_DUAL_QUOTIETY", Double.valueOf(ppqDualQuotiety));
			if (StringUtils.isNotBlank(dataAuth)) {
				tExt.getColMap().put("DATA_AUTH", dataAuth);
			}
			tExt.setSqlWhere(" and id =?");
			list.add(id);
			tExt.setSqlWhereArgs(list);
			modService.edit(tExt);

		} catch (Exception e) {
			// TODO: handle exception
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}
}