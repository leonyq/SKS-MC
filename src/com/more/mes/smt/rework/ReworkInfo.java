package com.more.mes.smt.rework;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.io.IOUtils;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

import net.sf.json.JSONArray;

/**
 * @Title 返工单信息---判定
 * @Description 返工单信息---判定功能类
 * @ClassName ReworkInfo
 * @author Administrator
 * @version 1.0 developer 2017-10-18 created
 * @see ReworkInfo
 * @since 2017-10-18
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class ReworkInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String type = request.getParameter("type");

		if ("nohad".equals(type)) {
			return searchTracking(request, modelAction, modelService);
		} else if ("had".equals(type)) {
			return searchHadTracking(request, modelAction, modelService);
		} else if ("queryGroup".equals(type)) {
			return queryGroup(request, modelAction, modelService);
		} else if ("saveRework".equals(type)) {
			return saveRework(request, modelAction, modelService);
		} else if ("editRework".equals(type)) {
			return editRework(request, modelAction, modelService);
		} else if ("fromNoToYes".equals(type)) {
			return fromNoToYes(request, modelAction, modelService);
		} else if ("fromYesToNo".equals(type)) {
			return fromYesToNo(request, modelAction, modelService);
		} else if ("reworkfill".equals(type)) {
			return reworkFill(request, modelAction, modelService);
		}

		return BaseActionSupport.AJAX;
	}

	@SuppressWarnings("unchecked")
	private String reworkFill(HttpServletRequest request, ModelAction modelAction, ModelService modelService) {
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		String id = request.getParameter("dataId");
		String crd_doc_number = request.getParameter("crd_doc_number");
		String auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		try {
			String sql = "select id from T_CO_REWORK_DETAIL t where t.crd_doc_number=? "
					+ " and t.crd_doc_status='1' and t.DATA_AUTH=? ";
			List list = modelService.listDataSql(sql, new Object[] { crd_doc_number, auth });
			if (list != null && !list.isEmpty()) {
				return modelAction.alertParentInfo(modelAction.getText("该单据明细中的产品SN还存在未返工"));
			}
			String CRI_AUDIT_MEMO = request.getParameter("paraMapObj.CRI_AUDIT_MEMO");
			String CRI_PROCESS_TIME = request.getParameter("paraMapObj.CRI_PROCESS_TIME");
			List<Object> sqlList = new ArrayList<Object>();
			sqlList.add(id);
			TableDataMapExt reworkTD = new TableDataMapExt();
			reworkTD.setTableName("T_CO_REWORK_INFO");
			Map reworkmap = reworkTD.getColMap();
			CommMethod.editSysDefCol(reworkmap, modelAction.getUser());
			reworkTD.setSqlWhere(" and ID=? ");
			reworkTD.setSqlWhereArgs(sqlList);
			reworkmap.put("CRI_DOC_STATUS", 3);
			reworkmap.put("CRI_AUDIT_MEMO", CRI_AUDIT_MEMO);
			reworkmap.put("CRI_PROCESS_TIME", Double.parseDouble(CRI_PROCESS_TIME));
			reworkmap.put("CRI_AUDIT_EMP", CommMethod.getSessionUser().getLoginName());
			reworkmap.put("CRI_AUDIT_TIME", DateUtil.getCurDate());

			modelService.edit(reworkTD);
		}

		catch (Exception e) {
			throw new BussException(modelAction.getText("填报失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("填报成功"), "0");

	}

	private String queryGroup(HttpServletRequest request, ModelAction modelAction, ModelService modelService) {
		String auth;
		String ctId = request.getParameter("routeId");
		String ID = request.getParameter("dataId");
		if (StringUtils.isNotBlank(ID)) {
			String sql1 = "select DATA_AUTH from T_CO_REWORK_INFO where id=?";
			Map<String, String> map = modelService.queryForMap(sql1, new Object[] { ID });
			auth = map.get("DATA_AUTH");
		} else {
			auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();

		}

		String sql = "select distinct t.CRC_STEP_SEQU, t.CRC_STEP_SEQU||'_'||t.CRC_GROUP_CODE  as CRC_GROUP_CODE from T_CO_ROUTE_CONTROL t "
				+ " join T_CO_TECHNICS A    on a.ct_route_code =t.cr_route_id and t.DATA_AUTH=a.DATA_AUTH "
				+ " where a.ct_id =? and t.DATA_AUTH=? order by t.CRC_STEP_SEQU";
		List sList = modelService.listDataSql(sql, new Object[] { ctId, auth });
		CommMethod.listToEscapeJs(sList);
		modelAction.setAjaxList(sList);
		return BaseActionSupport.AJAX;
	}

	@SuppressWarnings("unchecked")
	private String editRework(HttpServletRequest request, ModelAction modelAction, ModelService modelService) {
		String auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		String dataAuth = auth;
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		String id = request.getParameter("dataId");
		try {
			// String moNumber = request.getParameter("paraMapObj.CRI_MO_NUMBER");// 制令单
			// String reworkMo = request.getParameter("paraMapObj.CRI_REWORK_MO");// 返工制令单
			String modelCode = request.getParameter("paraMapObj.CRI_REWORK_MODEL");// 机种
			String CRI_REWORK_TECH = request.getParameter("paraMapObj.CRI_REWORK_TECH");// 返工工艺
			String group = request.getParameter("paraMapObj.CRI_REWORK_INPUT");// 投入工序
			String CRI_REWORK_INPUT = null;
			String CRI_INPUT_SEQ = null;
			if (StringUtils.isNotBlank(group)) {
				CRI_INPUT_SEQ = group.substring(0, group.indexOf("_"));
				CRI_REWORK_INPUT = group.substring(group.indexOf("_") + 1);
			}
			String CRI_ORIGINAL_FLAG = request.getParameter("paraMapObj.CRI_ORIGINAL_FLAG");
			if (StringUtils.isBlank(CRI_ORIGINAL_FLAG)) {
				CRI_ORIGINAL_FLAG = "N";
			}
			String CRI_INSPECT_NUM = request.getParameter("paraMapObj.CRI_INSPECT_NUM").equals("") ? "0"
					: request.getParameter("paraMapObj.CRI_INSPECT_NUM");// 计划数量
			String CRI_ERROR_NUM = request.getParameter("paraMapObj.CRI_ERROR_NUM").equals("") ? "0"
					: request.getParameter("paraMapObj.CRI_ERROR_NUM");//
			String CRI_MEMO = request.getParameter("paraMapObj.CRI_MEMO");//

			String fileName = null;
			String realName = null; // 文件原有名称
			String fileAddress = null;
			// float fileSize = 0;
			FileInputStream fis = null;
			FileOutputStream fos = null;

			if (modelAction.getUpFile() != null) {
				realName = modelAction.getUpFileFileName();
				fileName = realName.substring(realName.lastIndexOf(".") + 1);
				fileName = StringUtils.getUUID() + "." + fileName; // 文件存放名称
				fileAddress = "rework"; // 文件存放路径
				String realPath = request.getSession().getServletContext()
						.getRealPath("up_load" + Constants.SEPARATOR + "comm" + Constants.SEPARATOR + "rework");
				fis = new FileInputStream(modelAction.getUpFile());
				// fileSize = fis.available(); // 文件大小
				// 上传文件到服务器
				File file = modelAction.getUpFile();
				File file1 = new File(realPath);
				if (!file1.exists() && !file1.isDirectory()) { // 判断文件夹是否存在，不存在则创建
					file1.mkdir();
				}
				// 上传文件
				String savePath = request.getSession().getServletContext().getRealPath("up_load" + Constants.SEPARATOR
						+ "comm" + Constants.SEPARATOR + "rework" + Constants.SEPARATOR + fileName);
				fos = new FileOutputStream(savePath);
				IOUtils.copy(fis, fos);
			}
			String CRI_PROCESS_TIME = request.getParameter("paraMapObj.CRI_PROCESS_TIME");
			List<Object> sqlList = new ArrayList<Object>();
			sqlList.add(id);
			TableDataMapExt reworkTD = new TableDataMapExt();
			reworkTD.setTableName("T_CO_REWORK_INFO");
			Map reworkmap = reworkTD.getColMap();
			CommMethod.editSysDefCol(reworkmap, modelAction.getUser());
			reworkTD.setSqlWhere(" and ID=? ");
			reworkTD.setSqlWhereArgs(sqlList);
			// reworkmap.put("CRI_MO_NUMBER", moNumber);
			reworkmap.put("CRI_REWORK_MODEL", modelCode);
			// reworkmap.put("CRI_REWORK_MO", reworkMo);
			reworkmap.put("CRI_REWORK_TECH", CRI_REWORK_TECH);
			reworkmap.put("CRI_REWORK_INPUT", CRI_REWORK_INPUT);
			reworkmap.put("CRI_INPUT_SEQ", CRI_INPUT_SEQ);

			reworkmap.put("CRI_INSPECT_NUM", Integer.valueOf(CRI_INSPECT_NUM));
			reworkmap.put("CRI_ERROR_NUM", Integer.valueOf(CRI_ERROR_NUM));
			reworkmap.put("CRI_MEMO", CRI_MEMO);
			reworkmap.put("CRI_ORIGINAL_FLAG", CRI_ORIGINAL_FLAG);

			if (dataAuth != null) {
				reworkmap.put("DATA_AUTH", dataAuth);
			}
			if (realName != null) {
				reworkmap.put("CRI_SYS_NAME", realName);
				reworkmap.put("CRI_FILE_NAME", fileName);
				reworkmap.put("CRI_FILE_PATH", fileAddress);
			}
			modelService.edit(reworkTD);

			String docNumber = request.getParameter("paraMapObj.CRD_DOC_NUMBER");
			List<Object> sqlList2 = new ArrayList<Object>();
			sqlList2.add(docNumber);
			sqlList2.add(auth);
			TableDataMapExt reworkDetailTD = new TableDataMapExt();
			reworkDetailTD.setTableName("t_co_rework_detail");
			Map reworkDetailmap = reworkDetailTD.getColMap();
			CommMethod.editSysDefCol(reworkDetailmap, modelAction.getUser());
			reworkDetailTD.setSqlWhere(" and CRD_DOC_NUMBER=? and DATA_AUTH=? ");
			reworkDetailTD.setSqlWhereArgs(sqlList2);
			reworkDetailmap.put("CRD_REWORK_TECH", CRI_REWORK_TECH);
			reworkDetailmap.put("CRD_REWORK_INPUT", CRI_REWORK_INPUT);

			if (dataAuth != null) {
				reworkDetailmap.put("DATA_AUTH", dataAuth);
			}

			modelService.edit(reworkDetailTD);
		}

		catch (Exception e) {
			throw new BussException(modelAction.getText("修改失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");

	}

	/**
	 * @Description: 已选择产品移到未选择产品 @param request @param modelAction @param
	 *               modelService @return String @throws
	 */
	@SuppressWarnings("unchecked")
	private String fromYesToNo(HttpServletRequest request, ModelAction modelAction, ModelService modelService) {
		String docNumber = request.getParameter("paraMap.CRD_DOC_NUMBER");
		if (StringUtils.isBlank(docNumber)) {
			return modelAction.alertParentInfo((modelAction.getText("请生成返工单")));
		}
		String rework = request.getParameter("reArr");
		JSONArray reArr = JSONArray.fromObject(rework);
		Map<String, Object> dmap = new HashMap<String, Object>();
		Map map = null;
		String auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		int num = reArr.size();
		for (int i = 0; i < num; i++) {
			dmap = (Map<String, Object>) reArr.get(i);
			String sql1 = "SELECT * FROM T_WIP_TRACKING T "
					+ " WHERE T.WT_SN=? AND T.WT_REWORK_FLAG='Y' AND T.DATA_AUTH=?";

			int count = modelService.countSql(sql1, new Object[] { dmap.get("WT_SN"), auth });

			if (count == 0) {

				modelAction.setAjaxString(modelAction.getText("该产品已投入返工工序"));
				return BaseActionSupport.AJAX;
			}
			String sql = "select * from T_CO_REWORK_DETAIL t where t.crd_sn=? "
					+ " and t.crd_doc_number=? and t.DATA_AUTH=? ";
			List<Map> slist = modelService.listDataSql(sql, new Object[] { dmap.get("WT_SN"), docNumber, auth });
			map = slist.get(0);
			List<Object> sqlList = new ArrayList<Object>();
			sqlList.add(dmap.get("WT_SN"));
			sqlList.add(auth);
			TableDataMapExt tdm = new TableDataMapExt();
			tdm.setTableName("T_WIP_TRACKING");
			Map reworkmap = tdm.getColMap();
			tdm.setSqlWhere(" and WT_SN=? and DATA_AUTH=? ");
			tdm.setSqlWhereArgs(sqlList);
			reworkmap.put("WT_TECH_SN", map.get("CRD_BEFORE_TECH"));
			reworkmap.put("WT_MO_NUMBER", map.get("CRD_BEFORE_MO"));
			reworkmap.put("WT_PROJECT_ID", map.get("CRD_BEFORE_PO"));
			reworkmap.put("WT_ERROR_FLAG", map.get("CRD_BEFORE_FLAG"));
			reworkmap.put("WT_GROUP_CODE", map.get("CRD_BEFORE_GROUP"));
			reworkmap.put("WT_GROUP_SEQ", map.get("CRD_BEFORE_SEQ"));
			reworkmap.put("WT_REFLUX_FLAG", map.get("CRD_BEFORE_REFLUX"));
			reworkmap.put("WT_FINISH_FLAG", map.get("CRD_BEFORE_FINISH"));
			reworkmap.put("WT_SC_FINISH_FLAG", map.get("CRD_BEFORE_SC_FINISH"));
			reworkmap.put("WT_MODEL_CODE", map.get("CRD_BEFORE_MODEL"));
			reworkmap.put("WT_BACK_GROUP", "");
			reworkmap.put("WT_BACK_SEQ", null);
			reworkmap.put("WT_REWORK_FLAG", "N");
			modelService.edit(tdm);

			sql = "delete from T_CO_REWORK_DETAIL t where t.crd_sn=? and t.crd_doc_number=? and t.DATA_AUTH=? ";
			modelService.execSql(sql, new Object[] { dmap.get("WT_SN"), docNumber, auth });

			String sql2 = "select * from T_CO_REWORK_DETAIL t where t.crd_doc_number=? and t.DATA_AUTH=? ";
			int count2 = modelService.countSql(sql2, new Object[] { docNumber, auth });
			if (count2 == 0) {
				List<Object> sqlList2 = new ArrayList<Object>();
				sqlList2.add(docNumber);
				sqlList2.add(auth);
				TableDataMapExt tdm2 = new TableDataMapExt();
				tdm2.setTableName("T_CO_REWORK_INFO");
				Map reworkmap2 = tdm2.getColMap();
				tdm2.setSqlWhere(" and CRI_DOC_NUMBER=? and DATA_AUTH=? ");
				tdm2.setSqlWhereArgs(sqlList2);
				reworkmap2.put("CRI_DOC_STATUS", "1");
				modelService.edit(tdm2);
			}
		}
		String alertMsg1 = modelAction.getText("取消判定成功");
		CommMethod.mapToEscapeJs(msgPopData(modelAction, alertMsg1));
		modelAction.setAjaxMap(msgPopData(modelAction, alertMsg1));
		return BaseActionSupport.AJAX;

	}

	/**
	 * @Description: 未选择移动到已选择 @param request @param modelAction @param
	 *               modelService @return String @throws
	 */
	@SuppressWarnings("unchecked")
	private String fromNoToYes(HttpServletRequest request, ModelAction modelAction, ModelService modelService) {
		String rework = request.getParameter("reArr");
		String docNumber = request.getParameter("paraMap.CRD_DOC_NUMBER");
		if (StringUtils.isBlank(docNumber)) {
			return modelAction.alertParentInfo((modelAction.getText("请生成返工单")));
		}
		String auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		String sql = "select * from t_co_rework_info t where t.cri_doc_number=? and t.DATA_AUTH=? ";
		List<Map> slist = modelService.listDataSql(sql, new Object[] { docNumber, auth });
		Map smap = slist.get(0);
		TableDataMapExt reworkTD = new TableDataMapExt();
		reworkTD.setTableName("t_co_rework_detail");
		Map reworkmap = reworkTD.getColMap();
		reworkmap.put("CRD_DOC_NUMBER", docNumber);
		reworkmap.put("CRD_REWORK_MO", smap.get("CRI_REWORK_MO"));
		reworkmap.put("CRD_REWORK_MODEL", smap.get("CRI_REWORK_MODEL"));
		reworkmap.put("CRD_REWORK_TECH", smap.get("CRI_REWORK_TECH"));
		reworkmap.put("CRD_REWORK_INPUT", smap.get("CRI_REWORK_INPUT"));
		reworkmap.put("CRD_INPUT_SEQ", smap.get("CRI_INPUT_SEQ"));

		reworkmap.put("CRD_DOC_STATUS", 1);
		reworkmap.put("CRD_JUDGE_EMP", CommMethod.getSessionUser().getLoginName());
		reworkmap.put("CRD_JUDGE_TIME", DateUtil.getCurDate());
		BigDecimal hadNumDecimal = new BigDecimal("0");
		BigDecimal errNumDecimal = new BigDecimal("0");

		String hadNum = StringUtils.toString(smap.get("CRI_HAD_NUM"));
		String errNum = StringUtils.toString(smap.get("CRI_ERROR_NUM"));
		if (StringUtils.isNotBlank(errNum)) {
			errNumDecimal = new BigDecimal(errNum);
		}
		if (StringUtils.isNotBlank(hadNum)) {
			hadNumDecimal = new BigDecimal(hadNum);
		}
		BigDecimal num = errNumDecimal.subtract(hadNumDecimal);
		JSONArray reArr = JSONArray.fromObject(rework);
		Map<String, Object> dmap = new HashMap<String, Object>();
		BigDecimal wtNumDecimal = new BigDecimal("0");
		String wtNumStr = null;
		int rNum = reArr.size();
		for (int i = 0; i < rNum; i++) {
			dmap = (Map<String, Object>) reArr.get(i);
			wtNumStr = StringUtils.toString(dmap.get("WT_NUM"));
			if (StringUtils.isNotBlank(wtNumStr)) {
				wtNumDecimal = wtNumDecimal.add(new BigDecimal(wtNumStr));
			}

		}
		if (wtNumDecimal.compareTo(num) > 0) {
			modelAction.setAjaxString(modelAction.getText("超出返工数量"));
			return BaseActionSupport.AJAX;
		}
		String wtSn = null;

		for (int i = 0; i < rNum; i++) {
			dmap = (Map<String, Object>) reArr.get(i);
			wtSn = StringUtils.toString(dmap.get("WT_SN"));
			sql = "select WT_TECH_SN, WT_MO_NUMBER, WT_PROJECT_ID, WT_ERROR_FLAG,WT_GROUP_CODE,   WT_GROUP_SEQ, "
					+ "  WT_REFLUX_FLAG,WT_FINISH_FLAG, WT_SC_FINISH_FLAG,WT_MODEL_CODE"
					+ "  from T_WIP_TRACKING t where t.wt_sn=? and t.DATA_AUTH=? ";
			slist = modelService.listDataSql(sql, new Object[] { wtSn, auth });
			reworkmap.put("CRD_BEFORE_TECH", slist.get(0).get("WT_TECH_SN"));
			reworkmap.put("CRD_BEFORE_MO", slist.get(0).get("WT_MO_NUMBER"));
			reworkmap.put("CRD_BEFORE_PO", slist.get(0).get("WT_PROJECT_ID"));

			reworkmap.put("CRD_BEFORE_FLAG", slist.get(0).get("WT_ERROR_FLAG"));
			reworkmap.put("CRD_BEFORE_GROUP", slist.get(0).get("WT_GROUP_CODE"));
			reworkmap.put("CRD_BEFORE_SEQ", slist.get(0).get("WT_GROUP_SEQ"));
			reworkmap.put("CRD_BEFORE_REFLUX", slist.get(0).get("WT_REFLUX_FLAG"));
			reworkmap.put("CRD_BEFORE_FINISH", slist.get(0).get("WT_FINISH_FLAG"));
			reworkmap.put("CRD_BEFORE_SC_FINISH", slist.get(0).get("WT_SC_FINISH_FLAG"));
			reworkmap.put("CRD_BEFORE_MODEL", slist.get(0).get("WT_MODEL_CODE"));
			CommMethod.addSysDefCol(reworkmap, modelAction.getUser());
			reworkmap.put("CRD_SN", dmap.get("WT_SN"));
			reworkmap.put("CRD_ITEM_NUM", String.valueOf(dmap.get("WT_NUM")).equals("") ? 0
					: Integer.valueOf(String.valueOf(dmap.get("WT_NUM"))));
			reworkmap.put("CRD_MO_NUMBER", dmap.get("WT_MO_NUMBER"));
			if (StringUtils.isNotBlank(auth)) {
				reworkmap.put("DATA_AUTH", auth);
			}
			modelService.save(reworkTD);
		}
		// String auth = request.getSession().getAttribute("mcDataAuth").toString();
		for (int i = 0; i < rNum; i++) {
			dmap = (Map<String, Object>) reArr.get(i);
			ProFuncDto pf = new ProFuncDto();
			int[] inPlace = { 1, 2, 3, 4 };
			int[] outplace = { 5 };
			List<Object> list = new ArrayList<Object>();
			List outType = new ArrayList<Object>();
			list.add(auth);
			list.add(docNumber);
			list.add(StringUtils.toString(dmap.get("WT_SN")));
			list.add(CommMethod.getSessionUser().getLoginName());
			outType.add("String");
			pf.setClassName("P_C_REWORK_SAVE_INFO");// 存储过程的名字
			pf.setInPlace(inPlace);// 存储过程中in
			pf.setOutPlace(outplace); // 存储过程中out
			pf.setValArgs(list);// 存储过程中输入的参数
			pf.setTotalLen(list.size() + outType.size());// 总个数
			pf.setOutValType(outType);// 输出的参数
			List<Object> relist = modelService.procComm(pf);// 接收返回值
			String res = StringUtils.toString(relist.get(0));
			if (!"OK".equalsIgnoreCase(res)) {
				if (res.startsWith("NG:"))
					res = res.substring(3);
				modelAction.setAjaxString(res);
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				// throw new BussException(res);
				return BaseActionSupport.AJAX;
			}
		}
		if (!"2".equals(smap.get("CRI_DOC_STATUS"))) {
			sql = "update t_co_rework_info t set cri_doc_status='2' where t.cri_doc_number=? and t.DATA_AUTH=? ";
			modelService.execSql(sql, new Object[] { docNumber, auth });
		}
		String alertMsg1 = modelAction.getText("判定成功");
		CommMethod.mapToEscapeJs(msgPopData(modelAction, alertMsg1));
		modelAction.setAjaxMap(msgPopData(modelAction, alertMsg1));

		return BaseActionSupport.AJAX;
	}

	private Map msgPopData(ModelAction modelAction, String alertMsg) {
		Map map = new HashMap<String, Object>();
		String title = ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
		title = modelAction.getText(title);
		String width = ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
		String height = ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
		String time = ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
		map.put("title", title);
		map.put("width", width);
		map.put("height", height);
		map.put("time", time);
		map.put("alertMsg", alertMsg);
		return map;
	}

	/**
	 * @Description: 生成返工单 @param request @param modelAction @param
	 *               modelService @return String @throws
	 */
	@SuppressWarnings("unchecked")
	private String saveRework(HttpServletRequest request, ModelAction modelAction, ModelService modelService) {
		String dataAuth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		String docNumber = getReworkNo(modelService, modelAction);
		try {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			// String moNumber = request.getParameter("paraMap1@0#CRI_MO_NUMBER");// 制令单
			String reworkMo = request.getParameter("paraMap1@0#CRI_REWORK_MO");// 制令单
			String modelCode = request.getParameter("paraMap1@0#CRI_REWORK_MODEL");// 机种
			String CRI_REWORK_TECH = request.getParameter("paraMap1@0#CRI_REWORK_TECH");// 返工工艺
			String group = request.getParameter("paraMap1@0#CRI_REWORK_INPUT");// 投入工序+序号
			String CRI_ORIGINAL_FLAG = request.getParameter("paraMap1@0#CRI_ORIGINAL_FLAG");// 投入工序
			String CRI_INSPECT_NUM = request.getParameter("paraMap1@0#CRI_INSPECT_NUM").equals("") ? "0"
					: request.getParameter("paraMap1@0#CRI_INSPECT_NUM");// 计划数量
			String CRI_ERROR_NUM = request.getParameter("paraMap1@0#CRI_ERROR_NUM").equals("") ? "0"
					: request.getParameter("paraMap1@0#CRI_ERROR_NUM");//
			String CRI_MEMO = request.getParameter("paraMap1@0#CRI_MEMO");//
			String CRI_REWORK_INPUT = null;
			String CRI_INPUT_SEQ = null;
			if (StringUtils.isNotBlank(group)) {
				CRI_INPUT_SEQ = group.substring(0, group.indexOf("_"));
				CRI_REWORK_INPUT = group.substring(group.indexOf("_") + 1);
			}
			String fileName = null;
			String realName = null; // 文件原有名称
			String fileAddress = null;
			// float fileSize = 0;
			FileInputStream fis = null;
			FileOutputStream fos = null;

			if (modelAction.getUpFile() != null) {
				realName = modelAction.getUpFileFileName(); // 文件原始名称
				fileName = realName.substring(realName.lastIndexOf(".") + 1);
				fileName = StringUtils.getUUID() + "." + fileName; // 文件存放名称
				fileAddress = "rework"; // 文件存放路径
				String realPath = request.getSession().getServletContext()
						.getRealPath("up_load" + Constants.SEPARATOR + "comm" + Constants.SEPARATOR + "rework");
				fis = new FileInputStream(modelAction.getUpFile());
				// fileSize = fis.available(); // 文件大小
				// 上传文件到服务器
				File file = modelAction.getUpFile();
				File file1 = new File(realPath);
				if (!file1.exists() && !file1.isDirectory()) { // 判断文件夹是否存在，不存在则创建
					file1.mkdirs();
				}
				// 上传文件
				String savePath = request.getSession().getServletContext().getRealPath("up_load" + Constants.SEPARATOR
						+ "comm" + Constants.SEPARATOR + "rework" + Constants.SEPARATOR + fileName);
				fos = new FileOutputStream(savePath);
				IOUtils.copy(fis, fos);
			}
			TableDataMapExt reworkTD = new TableDataMapExt();
			reworkTD.setTableName("T_CO_REWORK_INFO");
			Map reworkmap = reworkTD.getColMap();
			CommMethod.addSysDefCol(reworkmap, modelAction.getUser());
			// reworkmap.put("ID", StringUtils.getUUID());
			reworkmap.put("CRI_DOC_NUMBER", docNumber);
			// reworkmap.put("CRI_MO_NUMBER", moNumber);
			reworkmap.put("CRI_DOC_STATUS", 1);
			reworkmap.put("CRI_REWORK_MODEL", modelCode);
			reworkmap.put("CRI_REWORK_MO", reworkMo);
			reworkmap.put("CRI_REWORK_TECH", CRI_REWORK_TECH);
			reworkmap.put("CRI_REWORK_INPUT", CRI_REWORK_INPUT);
			reworkmap.put("CRI_INPUT_SEQ", CRI_INPUT_SEQ);
			reworkmap.put("CRI_INSPECT_NUM", Integer.valueOf(CRI_INSPECT_NUM));
			reworkmap.put("CRI_ERROR_NUM", Integer.valueOf(CRI_ERROR_NUM));
			reworkmap.put("CRI_MEMO", CRI_MEMO);
			reworkmap.put("CRI_ORIGINAL_FLAG", CRI_ORIGINAL_FLAG);
			reworkmap.put("CRI_START_TIME", DateUtil.getCurDate());
			if (dataAuth != null) {
				reworkmap.put("DATA_AUTH", dataAuth);
			}
			if (realName != null) {
				reworkmap.put("CRI_SYS_NAME", realName);
				reworkmap.put("CRI_FILE_NAME", fileName);
				reworkmap.put("CRI_FILE_PATH", fileAddress);
			}
			modelService.save(reworkTD);
		}

		catch (Exception e) {
			throw new BussException(modelAction.getText("新增失败"), e);
		}
		String alertMsg1 = modelAction.getText("生成返工单成功");
		return addParentData(modelAction, alertMsg1, docNumber);
		// return modelAction.reloadIframeByIds(iframeId,
		// modelAction.getText("生成返工单成功"), isCloseWin);

	}

	private String addParentData(ModelAction modelAction, String alertMsg, String docNumber) {
		String title = ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
		title = modelAction.getText(title);
		String width = ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
		String height = ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
		String time = ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
		StringBuffer content = new StringBuffer();
		content.append("<script>");
		content.append("try{");
		content.append("window.parent.addParentData('");
		content.append(alertMsg + "','" + title + "','" + width + "','" + height + "','" + time + "','" + docNumber);
		content.append("');");
		content.append("}catch(e){alert(\"");
        content.append("\");}");
		content.append("</script>");
		modelAction.outHtml(content.toString(), Constants.CHARACTER_ENCODING_UTF_8);
		return null;
	}

	@SuppressWarnings("unchecked")
	private String getReworkNo(ModelService modelService, ModelAction modelAction) {
		String auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String nowDate = sdf.format(new Date());
		String querySql = "select CRI_DOC_NUMBER from t_co_rework_info where  DATA_AUTH=? and "
				+ " CRI_DOC_NUMBER like 'RMA-' || ? || '%'";
		List<Map> noList = modelService.listDataSql(querySql, new Object[] { auth, nowDate });
		String number = null;
		if (noList != null && noList.size() > 0) {
			List<String> lotNo = new ArrayList<String>();
			int noNum = noList.size();
			for (int i = 0; i < noNum; i++) {
				number = (String) noList.get(i).get("CRI_DOC_NUMBER");
				lotNo.add(number.substring(number.length() - 3));// 取出当天的流水号
			}
			int maxNo = Integer.parseInt(Collections.max(lotNo)) + 1;// 取出最大的流水号然后加1
			String maxNoStr = String.valueOf(maxNo);
			if (maxNoStr.length() == 1) {
				maxNoStr = "00" + maxNoStr;
			}
			if (maxNoStr.length() == 2) {
				maxNoStr = "0" + maxNoStr;
			}
			number = "RMA-" + nowDate + maxNoStr; // 重新计算流水号

		} else {
			number = "RMA-" + nowDate + "001";

		}
		return number;
	}

	/**
	 * @Description: 已选择产品查询 @param request @param modelAction @param
	 *               modelService @return String @throws
	 */
	@SuppressWarnings("unchecked")
	private String searchHadTracking(HttpServletRequest request, ModelAction modelAction, ModelService modelService) {

		String moNumber = request.getParameter("moNumber");
		String docNumber = request.getParameter("docNumber");
		String auth;
		String modelCode = request.getParameter("modelCode");
		String rqsn = request.getParameter("rqsn");
		String jyph = request.getParameter("jyph");
		String wtSn = request.getParameter("wtSn");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// List<Object> param = new ArrayList<Object>();
		PaginationImpl page = modelAction.getPage();
		String ID = request.getParameter("dataId");
		if (StringUtils.isNotBlank(ID)) {
			String sql1 = "select DATA_AUTH from T_CO_REWORK_INFO where id=?";
			Map<String, String> map = modelService.queryForMap(sql1, new Object[] { ID });
			auth = map.get("DATA_AUTH");
		} else {
			auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		}

		String sql = "SELECT T.CRD_SN,T.CRD_MO_NUMBER, T.CRD_DOC_STATUS FROM T_CO_REWORK_DETAIL T "
				+ " WHERE 1=1 and T.DATA_AUTH=:auth ";
		paramMap.put("auth", auth);
		String sqlWhere = " ";

		sqlWhere += " and t.CRD_DOC_NUMBER = :CRD_DOC_NUMBER ";
		// param.add(docNumber);
		paramMap.put("CRD_DOC_NUMBER", docNumber);
		List trackingList = modelService.listSql(sql + sqlWhere, page, paramMap, "order by t.CRD_JUDGE_TIME desc",
				null);
		modelAction.setAjaxPage(page);
		CommMethod.listMapToEscapeJs(trackingList);
		modelAction.getAjaxPage().setDataList(trackingList);
		return BaseActionSupport.AJAX;

	}

	/**
	 * @Description: 已选择产品 @param request @param modelAction @param
	 *               modelService @return String @throws
	 */
	private String searchTracking(HttpServletRequest request, ModelAction modelAction, ModelService modelService) {
		String moNumber = request.getParameter("moNumber");
		String modelCode = request.getParameter("modelCode");
		String rqsn = request.getParameter("rqsn");
		String jyph = request.getParameter("jyph");
		String wtSn = request.getParameter("wtSn");
		String auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();

		// List<Object> param = new ArrayList<Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		PaginationImpl page = modelAction.getPage();
		String sql = "SELECT T.WT_SN,T.WT_NUM,T.WT_MO_NUMBER,t.WT_ERROR_FLAG,t.WT_GROUP_CODE,t1.PSI_CONTAINER_SN,t.WT_LOT "
				+ "from T_WIP_TRACKING t "
				+ "left join t_pack_sn_info t1 ON t1.psi_sn = T .WT_SN and t.DATA_AUTH = t1.DATA_AUTH " + " where 1=1 ";
		String sqlWhere = " and not exists(select 1 from T_CO_REWORK_DETAIL s "
				+ " where s.CRD_SN=t.WT_SN AND s.CRD_DOC_STATUS='1' and s.DATA_AUTH=:auth1 ) and t.DATA_AUTH=:auth ";

		paramMap.put("auth1", auth);
		paramMap.put("auth", auth);

		if (StringUtils.isNotBlank(moNumber)) {
			sqlWhere += " and t.WT_MO_NUMBER = :WT_MO_NUMBER ";
			// param.add(moNumber);
			paramMap.put("WT_MO_NUMBER", moNumber);
		}

		if (StringUtils.isNotBlank(modelCode)) {
			sqlWhere += " and t.WT_MODEL_CODE = :WT_MODEL_CODE ";
			// param.add(modelCode);
			paramMap.put("WT_MODEL_CODE", modelCode);
		}

		if (StringUtils.isNotBlank(jyph)) {
			sqlWhere += " and t.WT_LOT = :WT_LOT ";
			// param.add(jyph);
			paramMap.put("WT_LOT", jyph);
		}

		if (StringUtils.isNotBlank(rqsn)) {
			sqlWhere += " and t1.PSI_CONTAINER_SN = :PSI_CONTAINER_SN ";
			paramMap.put("PSI_CONTAINER_SN", rqsn);
		}

		if (StringUtils.isNotBlank(wtSn)) {
			sqlWhere += " and t.WT_SN = :WT_SN ";
			// param.add(wtSn);
			paramMap.put("WT_SN", wtSn);
		}
		List trackingList = modelService.listSql(sql + sqlWhere, page, paramMap, "order by t.WT_GROUP_CODE,WT_SN",
				null);
		modelAction.setAjaxPage(page);
		CommMethod.listToEscapeJs(trackingList);
		modelAction.getAjaxPage().setDataList(trackingList);
		return BaseActionSupport.AJAX;
	}

}
