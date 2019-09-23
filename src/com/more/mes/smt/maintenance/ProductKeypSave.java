package com.more.mes.smt.maintenance;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

import net.sf.json.JSONArray;

/**
 * @Title 产品维修---替换主件
 * @Description 产品维修---替换主件保存
 * @ClassName ProductKeyp
 * @author Administrator
 * @version 1.0 developer 2017-9-15 created
 * @see ProductKeypSave
 * @since 2017-9-15
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class ProductKeypSave implements FuncService {
	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest t = modelAction.getRequest();
		// String weSn = t.getParameter("weSn");
		String modelCode = t.getParameter("modelCode");
		String componentSn = t.getParameter("componentSn");
		String componentArr = t.getParameter("componentArr");
		String workStation = t.getParameter("workStation");
		String auth = t.getSession().getAttribute("mcDataAuth").toString();
		String sql = "select 1 from T_WIP_KEYP_INFO a where a.WKI_KEYP_SN =? and a.DATA_AUTH=? ";
		List<Map> sList = modelService.listDataSql(sql, new Object[] { componentSn, auth });
		if (sList != null && !sList.isEmpty()) {
			return modelAction.alertParentInfo(modelAction.getText("输入的组件已被使用过"));

		}
		sql = "select CTI_ITEM_SOURCE from T_CO_TECH_ITEM t where t.cti_model_code= ? and t.DATA_AUTH=? ";
		sList = modelService.listDataSql(sql, new Object[] { modelCode, auth });
		if (sList == null || sList.isEmpty()) {
			return modelAction.alertParentInfo(modelAction.getText("当前机种对应物料管控类型不存在"));
		}
		String source = StringUtils.toString(sList.get(0).get("CTI_ITEM_SOURCE"));
		JSONArray component = JSONArray.fromObject(componentArr);

		Map dmap = (Map<String, Object>) component.get(0);
		String wkiItemCode = StringUtils.toString(dmap.get("WKI_ITEM_CODE"));
		String wkiId = StringUtils.toString(dmap.get("WKI_ID"));
		if ("0".equals(source)) {// 物料来源（0:自制，1:外购）
			sql = "select WT_ERROR_FLAG,WT_FINISH_FLAG,WT_MODEL_CODE from T_WIP_TRACKING where WT_SN=? and DATA_AUTH=?";
			sList = modelService.listDataSql(sql, new Object[] { componentSn, auth });
			if (sList == null || sList.isEmpty()) {
				return modelAction.alertParentInfo(modelAction.getText("产品在制信息不存在该组件条码"));
			}
			String errorFlag = StringUtils.toString(sList.get(0).get("WT_ERROR_FLAG"));
			if (!"0".equals(errorFlag)) {
				return modelAction.alertParentInfo(modelAction.getText("该组件条码产品状态非正常"));
			}
			String finishFlag = StringUtils.toString(sList.get(0).get("WT_FINISH_FLAG"));
			if ("N".equals(finishFlag)) {
				return modelAction.alertParentInfo(modelAction.getText("该组件条码流程未结束"));
			}
			String wtmodelCode = StringUtils.toString(sList.get(0).get("WT_MODEL_CODE"));
			if (StringUtils.isBlank(componentArr)) {
				return modelAction.alertParentInfo((modelAction.getText("请选择一条记录")));
			}

			if (!wtmodelCode.equals(wkiItemCode)) {
				return modelAction.alertParentInfo((modelAction.getText("替换组件物料信息与当前勾选的物料不一致")));
			}

		} else if ("1".equals(source)) {
			ProFuncDto pf = new ProFuncDto();
			int[] inPlace = { 1, 2, 3, 4 };
			int[] outplace = { 5, 6 };
			List<Object> list = new ArrayList<Object>();
			list.add(auth);
			list.add(1);
			list.add(wkiItemCode);
			list.add("");
			List outType = new ArrayList<Object>();
			outType.add("String");
			outType.add("String");
			pf.setClassName("P_C_GET_SN_RULEID");// 获取条码规则ID
			pf.setInPlace(inPlace);// 存储过程中in
			pf.setOutPlace(outplace); // 存储过程中out
			pf.setValArgs(list);// 存储过程中输入的参数
			pf.setTotalLen(list.size() + outType.size());// 总个数
			pf.setOutValType(outType);// 输出的参数
			List<Object> relist = modelService.procComm(pf);// 接收返回值
			String res = StringUtils.toString(relist.get(1));
			if (!"OK".equalsIgnoreCase(res)) {
				if (res.startsWith("NG:"))
					res = res.substring(3);
				return modelAction.alertParentInfo(res);
			}

			String M_SN_RULEID = StringUtils.toString(relist.get(0));// 条码规则ID

			pf = new ProFuncDto();
			int[] inPlace1 = { 1, 2, 3 };
			int[] outplace1 = { 4, 5, 6, 7, 8, 9, 10, 11 };
			list = new ArrayList<Object>();
			list.add(auth);
			list.add(componentSn);
			list.add(M_SN_RULEID);
			outType = new ArrayList<Object>();
			outType.add("String");
			outType.add("String");
			outType.add("String");
			outType.add("String");
			outType.add("String");
			outType.add("String");
			outType.add("String");
			outType.add("String");
			pf.setClassName("P_C_CHECK_SN_RULE");// 校验条码规则
			pf.setInPlace(inPlace1);// 存储过程中in
			pf.setOutPlace(outplace1); // 存储过程中out
			pf.setValArgs(list);// 存储过程中输入的参数
			pf.setTotalLen(list.size() + outType.size());// 总个数
			pf.setOutValType(outType);// 输出的参数
			relist = modelService.procComm(pf);// 接收返回值
			res = StringUtils.toString(relist.get(7));
			if (!"OK".equalsIgnoreCase(res)) {
				if (res.startsWith("NG:"))
					res = res.substring(3);
				return modelAction.alertParentInfo(res);
			}

		} else {// 混合的
			sql = "select WT_ERROR_FLAG,WT_FINISH_FLAG,WT_MODEL_CODE from T_WIP_TRACKING where WT_SN=? and DATA_AUTH=?";
			sList = modelService.listDataSql(sql, new Object[] { componentSn, auth });
			if (null == sList || sList.isEmpty()) {

				ProFuncDto pf = new ProFuncDto();
				int[] inPlace = { 1, 2, 3, 4 };
				int[] outplace = { 5, 6 };
				List<Object> list = new ArrayList<Object>();
				list.add(auth);
				list.add(1);
				list.add(wkiItemCode);
				list.add("");
				List outType = new ArrayList<Object>();
				outType.add("String");
				outType.add("String");
				pf.setClassName("P_C_GET_SN_RULEID");// 获取条码规则ID
				pf.setInPlace(inPlace);// 存储过程中in
				pf.setOutPlace(outplace); // 存储过程中out
				pf.setValArgs(list);// 存储过程中输入的参数
				pf.setTotalLen(list.size() + outType.size());// 总个数
				pf.setOutValType(outType);// 输出的参数
				List<Object> relist = modelService.procComm(pf);// 接收返回值
				String res = StringUtils.toString(relist.get(1));
				if (!"OK".equalsIgnoreCase(res)) {
					if (res.startsWith("NG:"))
						res = res.substring(3);
					return modelAction.alertParentInfo(res);
				}

				String M_SN_RULEID = StringUtils.toString(relist.get(0));// 条码规则ID

				pf = new ProFuncDto();
				int[] inPlace1 = { 1, 2, 3 };
				int[] outplace1 = { 4, 5, 6, 7, 8, 9, 10, 11 };
				list = new ArrayList<Object>();
				list.add(auth);
				list.add(componentSn);
				list.add(M_SN_RULEID);
				outType = new ArrayList<Object>();
				outType.add("String");
				outType.add("String");
				outType.add("String");
				outType.add("String");
				outType.add("String");
				outType.add("String");
				outType.add("String");
				outType.add("String");
				pf.setClassName("P_C_CHECK_SN_RULE");// 校验条码规则
				pf.setInPlace(inPlace1);// 存储过程中in
				pf.setOutPlace(outplace1); // 存储过程中out
				pf.setValArgs(list);// 存储过程中输入的参数
				pf.setTotalLen(list.size() + outType.size());// 总个数
				pf.setOutValType(outType);// 输出的参数
				relist = modelService.procComm(pf);// 接收返回值
				res = StringUtils.toString(relist.get(7));
				if (!"OK".equalsIgnoreCase(res)) {
					if (res.startsWith("NG:"))
						res = res.substring(3);
					return modelAction.alertParentInfo(res);
				}

			} else {
				String errorFlag = StringUtils.toString(sList.get(0).get("WT_ERROR_FLAG"));
				if (!"0".equals(errorFlag)) {
					return modelAction.alertParentInfo(modelAction.getText("该组件条码产品状态非正常"));
				}
				String finishFlag = StringUtils.toString(sList.get(0).get("WT_FINISH_FLAG"));
				if ("N".equals(finishFlag)) {
					return modelAction.alertParentInfo(modelAction.getText("该组件条码流程未结束"));
				}
				String wtmodelCode = StringUtils.toString(sList.get(0).get("WT_MODEL_CODE"));
				if (StringUtils.isBlank(componentArr)) {
					return modelAction.alertParentInfo((modelAction.getText("请选择一条记录")));
				}

				if (!wtmodelCode.equals(wkiItemCode)) {
					return modelAction.alertParentInfo((modelAction.getText("替换组件物料信息与当前勾选的物料不一致")));
				}
			}

		}
		sql = "select * from T_WIP_KEYP_INFO where wki_id=?";
		sList = modelService.listDataSql(sql, new Object[] { wkiId });
		TableDataMapExt tdMap = new TableDataMapExt();
		tdMap.setTableName("T_WIP_KEYP_INFO");
		Map<String, Object> map = tdMap.getColMap();
		map.putAll(sList.get(0));
		map.put("WKI_KEYP_SN", componentSn);
		map.put("WKI_ID", StringUtils.getUUID());
		map.put("WKI_WORK_STATION", workStation);
		map.put("WKI_EMP", CommMethod.getSessionUser().getLoginName());
		map.put("WKI_IN_TIME", DateUtil.getCurDate());
		sql = "select CA_GROUP from T_CO_AREA a where a.CA_ID=? and a.DATA_AUTH=?";
		sList = modelService.listDataSql(sql, new Object[] { workStation, auth });
		String caGroup = StringUtils.toString(sList.get(0).get("CA_GROUP"));
		map.put("WKI_GROUP_CODE", caGroup);
		modelService.save(tdMap);
		sql = "update T_WIP_KEYP_INFO s set WKI_FLAG='N', s.WKI_KEYP_SN='R'||s.WKI_KEYP_SN,s.WKI_ITEM_CODE='R'||s.WKI_ITEM_CODE where s.wki_id=? and s.DATA_AUTH=?";
		modelService.execSql(sql, new Object[] { wkiId, auth });
		/*
		 * TableDataMapExt errtdMap = new TableDataMapExt(); Map<String, Object> errmap
		 * = errtdMap.getColMap(); errtdMap.setTableName("T_WIP_KEYP_INFO");
		 * errtdMap.setSqlWhere("and WKI_ID = ? ");
		 * errtdMap.getSqlWhereArgs().add(wkiId); errmap = errtdMap.getColMap();
		 * CommMethod.editSysDefCol(errmap, modelAction.getUser());
		 * errmap.put("WE_REPAIR_FLAG", "1"); modelService.edit(errtdMap);
		 */
		String msg = modelAction.getDefinedMsg();
		if (StringUtils.isBlank(msg)) {
			msg = "保存成功";
		}
		String alertMsg = modelAction.getText(msg);
		return addParentData(modelAction, alertMsg);
	}

	private String addParentData(ModelAction modelAction, String alertMsg) {
		String title = ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
		title = modelAction.getText(title);
		String width = ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
		String height = ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
		String time = ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
		StringBuffer content = new StringBuffer();
		content.append("<script>");
		content.append("try{");
		content.append("window.parent.addParentData('");
		content.append(alertMsg + "','" + title + "','" + width + "','" + height + "','" + time);
		content.append("');");
		content.append("}catch(e){alert(\"");
        content.append("\");}");
		content.append("</script>");
		modelAction.outHtml(content.toString(), Constants.CHARACTER_ENCODING_UTF_8);
		return null;
	}
}