package com.more.mes.smt.indicatorr;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * 生产指示单----生产指示单---检查--保存
 * 
 * @author development
 */
public class SaveIndicatorItemInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {//
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		String formId = request.getParameter("formId");
		String addFlag = "";
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

			// String addType = request.getParameter("addType");// 是否增加机种项目配置表数据 add edit
			addFlag = request.getParameter("addFlag");// confirm 确认 add 发起

			String indicatorSn = getIndicatorSn(dataAuth, "DJ28", "", modelService);// 指示单号.
			String templateName = request.getParameter("templateName");
			String itemCode = request.getParameter("modelCode");
			String state = request.getParameter("state");// 状态(1、待审核 2、已审核)
			String fileNum = request.getParameter("paraMap1@0#CO_ARCHIVAL_FILE_NUMBER");// 归档文件号
			String memo = request.getParameter("paraMap1@0#CO_MEMO");

			String[] proCode = request.getParameterValues("PROJECT_CODE");// 项目编码
			String[] states = request.getParameterValues("CO_MODEL_STATE");// 状态
			String[] deptId = request.getParameterValues("DEPT_ID");// 部门ID
			String[] confirmId = request.getParameterValues("CONFIRM_ID");// 确认人
			String[] checkId = request.getParameterValues("CHECK_ID");// 审核人

			String sql = "SELECT T.CO_INDICATORR_SN FROM T_CO_INDICATORR T WHERE T.CO_MODEL_CODE=? AND T.DATA_AUTH=? ";
			List<Map<String, Object>> result = modelService.listDataSql(sql, new Object[] { itemCode, dataAuth });
			if (!(result == null) && !result.isEmpty()) {
				// 机种已存在指示单 修改指示单
				List<Object> sqlList = new ArrayList<Object>();

				indicatorSn = StringUtils.toString(result.get(0).get("CO_INDICATORR_SN"));
				sqlList.add(indicatorSn);
				sqlList.add(dataAuth);
				TableDataMapExt tMap = new TableDataMapExt();
				tMap.setTableName("T_CO_INDICATORR");
				CommMethod.editSysDefCol(tMap.getColMap(), modelAction.getUser());
				tMap.setSqlWhere(" and CO_INDICATORR_SN=? AND DATA_AUTH=? ");
				tMap.setSqlWhereArgs(sqlList);
				tMap.getColMap().put("CO_STATE", state);
				tMap.getColMap().put("CO_TEMPLATE_NAME", templateName);
				tMap.getColMap().put("CO_ARCHIVAL_FILE_NUMBER", fileNum);
				tMap.getColMap().put("CO_MEMO", memo);
				if (dataAuth != null) {
					tMap.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.edit(tMap);

				TableDataMapExt delwms1 = new TableDataMapExt();
				delwms1.setTableName("T_CO_INDICATORR_PROJECT_INFO");
				delwms1.setSqlWhere(" and CO_INDICATORR_SN=? AND DATA_AUTH=? ");
				delwms1.setSqlWhereArgs(sqlList);
				modelService.del(delwms1);
			} else {
				// 机种不存在指示单 新增指示单
				TableDataMapExt tMap = new TableDataMapExt();
				tMap.setTableName("T_CO_INDICATORR");
				String infoId = StringUtils.getUUID();
				CommMethod.addSysDefCol(tMap.getColMap(), modelAction.getUser());
				tMap.getColMap().put("ID", infoId);
				tMap.getColMap().put("CO_INDICATORR_SN", indicatorSn);
				tMap.getColMap().put("CO_STATE", state);
				tMap.getColMap().put("CO_MODEL_CODE", itemCode);
				tMap.getColMap().put("CO_TEMPLATE_NAME", templateName);
				tMap.getColMap().put("CO_ARCHIVAL_FILE_NUMBER", fileNum);
				tMap.getColMap().put("CO_MEMO", memo);
				if (dataAuth != null) {
					tMap.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.save(tMap);

			}

			boolean flag = false;
			String sql3 = "SELECT T.CO_TEMPLATE_NAME FROM T_CO_ITEM_PROJECT T WHERE T.CO_ITEM_CODE = ? AND T.DATA_AUTH=? ";
			List<Map<String, Object>> result3 = modelService.listDataSql(sql3, new Object[] { itemCode, dataAuth });
			if (!(result3 == null) && !result3.isEmpty()) {
				// 存在判断 模板是否一致
				String tempTemplateName = StringUtils.toString(result3.get(0).get("CO_TEMPLATE_NAME"));
				if (templateName.equals(tempTemplateName)) {
					// 一致
					flag = true;
				} else {
					List<Object> sqlList2 = new ArrayList<Object>();
					sqlList2.add(itemCode);
					sqlList2.add(dataAuth);
					TableDataMapExt delwms1 = new TableDataMapExt();
					delwms1.setTableName("T_CO_ITEM_PROJECT");
					delwms1.setSqlWhere(" and CO_ITEM_CODE=? AND DATA_AUTH=? ");
					delwms1.setSqlWhereArgs(sqlList2);
					modelService.del(delwms1);
				}
			}
			// 增加指示单明细信息
			int num = proCode.length;
			for (int i = 0; i < num; i++) {
				TableDataMapExt detailMap = new TableDataMapExt();
				detailMap.setTableName("T_CO_INDICATORR_PROJECT_INFO");
				String detailInfoId = StringUtils.getUUID();
				detailMap.getColMap().clear();
				CommMethod.addSysDefCol(detailMap.getColMap(), modelAction.getUser());
				detailMap.getColMap().put("ID", detailInfoId);
				detailMap.getColMap().put("CO_INDICATORR_SN", indicatorSn);
				detailMap.getColMap().put("CO_PROJECT_CODE", proCode[i]);
				detailMap.getColMap().put("CO_STATE", states[i]);
				detailMap.getColMap().put("CO_CONFIRM_ID", confirmId[i]);
				detailMap.getColMap().put("CO_CHECK_ID", checkId[i]);
				detailMap.getColMap().put("CO_DEPT_ID", deptId[i]);
				if (dataAuth != null) {
					detailMap.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.save(detailMap);

				// 增加机种项目配置表数据 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!有多条项目编码重复的新增一条
				if (flag == false) {
					String sql4 = "SELECT T.ID FROM T_CO_ITEM_PROJECT T "
							+ "WHERE T.CO_ITEM_CODE = ? AND T.CO_TEMPLATE_NAME=? AND T.CO_PROJECT_CODE=? AND T.DATA_AUTH=? ";
					List<Map<String, Object>> result4 = modelService.listDataSql(sql4,
							new Object[] { itemCode, templateName, proCode[i], dataAuth });
					if (result4 == null || result4.isEmpty()) {
						TableDataMapExt tMap = new TableDataMapExt();
						tMap.setTableName("T_CO_ITEM_PROJECT");
						String infoId = StringUtils.getUUID();
						CommMethod.addSysDefCol(tMap.getColMap(), modelAction.getUser());
						tMap.getColMap().put("ID", infoId);
						tMap.getColMap().put("CO_ITEM_CODE", itemCode);
						tMap.getColMap().put("CO_TEMPLATE_NAME", templateName);
						tMap.getColMap().put("CO_PROJECT_CODE", proCode[i]);
						tMap.getColMap().put("CO_STATE", "1");
						if (dataAuth != null) {
							tMap.getColMap().put("DATA_AUTH", dataAuth);
						}
						modelService.save(tMap);
					}
				}
			}
			// 确认 修改指示单指示单明细状态为已审核
			if (!"add".equals(addFlag)) {
				List<Object> sqlList3 = new ArrayList<Object>();
				sqlList3.add(indicatorSn);
				sqlList3.add(dataAuth);
				TableDataMapExt detailMap = new TableDataMapExt();
				detailMap.setTableName("T_CO_INDICATORR_PROJECT_INFO");
				CommMethod.editSysDefCol(detailMap.getColMap(), modelAction.getUser());
				detailMap.setSqlWhere(" and CO_INDICATORR_SN=? AND DATA_AUTH=? ");
				detailMap.setSqlWhereArgs(sqlList3);
				detailMap.getColMap().put("CO_STATE", "3");
				detailMap.getColMap().put("CO_CONFIRM_TIME", DateUtil.getCurDate());
				detailMap.getColMap().put("CO_CHECK_TIME", DateUtil.getCurDate());
				if (dataAuth != null) {
					detailMap.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.edit(detailMap);
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("新增失败"), e);
		}
		if ("add".equals(addFlag)) {
			return modelAction.reloadIframeByIds(iframeId, modelAction.getText("发起成功"), isCloseWin);
		} else {
			return modelAction.reloadIframeByIds(iframeId, modelAction.getText("确认成功"), isCloseWin);
		}
	}

	@SuppressWarnings("unchecked")
	public String getIndicatorSn(String dataAuth, String prefix, String dispatchSn, ModelService modelService) {
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = { 1, 2, 3 };
		int[] outplace = { 4, 5 };
		List<Object> list = new ArrayList<Object>();
		List<Object> outType = new ArrayList<Object>();
		list.add(dataAuth);
		list.add(prefix);
		list.add(dispatchSn);
		outType.add("String");
		outType.add("String");
		pf.setClassName("P_C_GET_DOC_NO");// 生成检验单号
		pf.setInPlace(inPlace);// 存储过程中in
		pf.setOutPlace(outplace); // 存储过程中out
		pf.setValArgs(list);// 存储过程中输入的参数
		pf.setTotalLen(list.size() + outType.size());// 总个数
		pf.setOutValType(outType);// 输出的参数
		List<Object> relist = modelService.procComm(pf);// 接收返回值
		String res = (String) relist.get(0); // 结果
		return res;
	}
}
