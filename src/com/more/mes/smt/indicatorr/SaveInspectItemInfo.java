package com.more.mes.smt.indicatorr;

import java.text.SimpleDateFormat;
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
 * 生产指示单----检查项目---新增保存
 * 
 * @author development
 */
public class SaveInspectItemInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {//
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
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

			String proCode = request.getParameter("paraMap1@0#CO_PROJECT_CODE");// 项目编码
			String proName = request.getParameter("paraMap1@0#CO_PROJECT_NAME");// 项目名称
			String proType = request.getParameter("paraMap1@0#CO_PROJECT_TYPE");// 项目类型
			String coDefault = request.getParameter("paraMap1@0#CO_DEFAULT");// 默认标识
			String proStep = request.getParameter("paraMap1@0#CO_PRODUCT_STEP");// 生产阶别
			String affectInfo = request.getParameter("paraMap1@0#CO_AFFECT_INFO");// 影响因素
			String mome = request.getParameter("paraMap1@0#CO_REMARK");// 备注

			String[] deptIds = request.getParameterValues("DEPT_ID_VAL");// 部门ID
			String[] confirmIds = request.getParameterValues("CONFIRM_EMP_VAL");// 确认人ID
			String[] checkIds = request.getParameterValues("CHECK_EMP_VAL");// 审核人ID

			String sql1 = "SELECT T.ID FROM T_CO_INDICATORR_PROJECT T WHERE T.CO_PROJECT_CODE=? AND T.DATA_AUTH=? ";
			List<String> result = modelService.listDataSql(sql1, new Object[] { proCode, dataAuth });
			if (!(result == null) && !result.isEmpty()) {
				return modelAction.alertParentInfo(modelAction.getText("项目编码已存在，请更换"));
			}
			String sql2 = "SELECT T.ID FROM T_CO_INDICATORR_PROJECT T WHERE T.CO_PROJECT_NAME=? AND T.DATA_AUTH=? ";
			List<String> result2 = modelService.listDataSql(sql2, new Object[] { proName, dataAuth });
			if (!(result2 == null) && !result2.isEmpty()) {
				return modelAction.alertParentInfo(modelAction.getText("项目名称已存在，请更换"));
			}
			// 默认标识
			if ("Y".equals(coDefault)) {
				String sql3 = "SELECT T.ID FROM T_CO_INDICATORR_PROJECT T WHERE T.CO_DEFAULT='Y' AND T.DATA_AUTH=? ";
				List<String> result3 = modelService.listDataSql(sql3, new Object[] { dataAuth });
				if (!(result3 == null) && !result3.isEmpty()) {
					return modelAction.alertParentInfo(modelAction.getText("已存在默认的检查项目"));
				}
			}
			// String sql = "SELECT T.ID FROM T_CO_ITEM_FORBIDDEN T WHERE T.CF_ITEM_CODE =
			// ?";
			// List<String> result = modelService.listDataSql(sql, new Object[]
			// {itemCodes[i]});
			// if (!(result == null) && !result.isEmpty())
			// {
			// return modelAction.alertParentInfo(modelAction.getText("物料包含禁用料，请更换"));
			// }

			if (coDefault == null || coDefault == "" || coDefault.equals("")) {
				coDefault = "N";
			}
			// 增加指示单项目表
			TableDataMapExt tMap = new TableDataMapExt();
			tMap.setTableName("T_CO_INDICATORR_PROJECT");
			String infoId = StringUtils.getUUID();
			CommMethod.addSysDefCol(tMap.getColMap(), modelAction.getUser());
			tMap.getColMap().put("ID", infoId);
			tMap.getColMap().put("CO_PROJECT_CODE", proCode);
			tMap.getColMap().put("CO_PROJECT_NAME", proName);
			tMap.getColMap().put("CO_PROJECT_TYPE", proType);
			tMap.getColMap().put("CO_DEFAULT", coDefault);
			tMap.getColMap().put("CO_PRODUCT_STEP", proStep);
			tMap.getColMap().put("CO_AFFECT_INFO", affectInfo);
			tMap.getColMap().put("CO_REMARK", mome);
			if (dataAuth != null) {
				tMap.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.save(tMap);
			// 插入指示单项目责任人
			TableDataMapExt tMap2 = new TableDataMapExt();
			tMap2.setTableName("T_CO_INDICATORR_PERSONLIABLE");
			int num = deptIds.length;
			for (int i = 0; i < num; i++) {
				tMap2.getColMap().clear();
				CommMethod.addSysDefCol(tMap2.getColMap(), modelAction.getUser());
				tMap2.getColMap().put("CO_PROJECT_CODE", infoId);// 项目编码
				tMap2.getColMap().put("CO_DEPT_ID", deptIds[i]);// 部门ID
				tMap2.getColMap().put("CO_CONFIRM_ID", confirmIds[i]);// 确认人ID
				tMap2.getColMap().put("CO_CHECK_ID", checkIds[i]);// 审核人ID
				if (dataAuth != null) {
					tMap2.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.save(tMap2);
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("新增失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}

}
