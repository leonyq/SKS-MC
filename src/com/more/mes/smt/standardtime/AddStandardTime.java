package com.more.mes.smt.standardtime;

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
 * 标准工时---新增保存
 * 
 * @author wzy
 */
public class AddStandardTime implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");// 是否关闭窗口
		String formId = request.getParameter("formId");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");

		try {
			String code = CommMethod.escapeJs(request.getParameter("paraMap1@0#CST_MODEL_CODE"));// 机种
			String cstStepCode = CommMethod.escapeJs(request.getParameter("paraMap1@0#CST_STEP_CODE"));// 生产阶别
			String cstStandardTime = CommMethod.escapeJs(request.getParameter("paraMap1@0#CST_STANDARD_TIME"));// 标准工时(S)
			String cstProcessFace = CommMethod.escapeJs(request.getParameter("paraMap1@0#CST_PROCESS_FACE"));// 加工面别
			String cstChangeTime = CommMethod.escapeJs(request.getParameter("paraMap1@0#CST_CHANGE_TIME"));// 换线时间(Min)
			String cstAreaSn = CommMethod.escapeJs(request.getParameter("paraMap1@0#CST_AREA_SN"));// 线别
			String cstItemName = CommMethod.escapeJs(request.getParameter("CST_ITEM_NAME"));
			String cstItemSpec = CommMethod.escapeJs(request.getParameter("paraMap1@0#CST_ITEM_SPEC"));
			String cstScheduleFlag = CommMethod.escapeJs(request.getParameter("paraMap1@0#CST_SCHEDULE_FLAG"));// 排程计算标志
			String cstTrack = CommMethod.escapeJs(request.getParameter("paraMap1@0#CST_TRACK"));// SMT轨道
			if (StringUtils.isBlank(cstScheduleFlag)) {
				cstScheduleFlag = "N";
			}
			// 20180627 同个机种下 单面 只能选择单面 阴阳面也是 正面反面可以选则正反
			String codeSql = "select CST_PROCESS_FACE from T_CO_STANDARD_TIME where CST_MODEL_CODE=? and DATA_AUTH=?  ";

			List<Map> listMa = modelService.listDataSql(codeSql, new Object[] { code, dataAuth });

			if (null != listMa && !listMa.isEmpty()) {
				String face = listMa.get(0).get("CST_PROCESS_FACE").toString();

				if (cstProcessFace.equals("0") || cstProcessFace.equals("3")) {
					if (!cstProcessFace.equals(face)) {
						return modelAction.alertParentInfo(modelAction.getText("请更改面别"));
					}
				}
				if (cstProcessFace.equals("1") || cstProcessFace.equals("2")) {
					if (face.equals("0") || face.equals("3")) {
						return modelAction.alertParentInfo(modelAction.getText("请更改面别"));
					}
				}

			}

			// 只能有一个计算排程
			if (cstScheduleFlag.equals("Y")) {

				String sql = "select * from T_CO_STANDARD_TIME where CST_MODEL_CODE=? and CST_STEP_CODE=?"
						+ " and CST_PROCESS_FACE=? and DATA_AUTH=? ";

				List<Map> listMaps = modelService.listDataSql(sql,
						new Object[] { code, cstStepCode, cstProcessFace, dataAuth });

				if (null != listMaps && !listMaps.isEmpty()) {
					int length = listMaps.size();
					for (int i = 0; i < length; i++) {
						if (listMaps.get(i).get("CST_SCHEDULE_FLAG").toString().equals("Y")) {
							return modelAction.alertParentInfo(modelAction.getText("同个机种,生产阶别,面别只允许存在一个排程计算标记"));
						}
					}
				}

			}
			// 标准工时同种情况下只能拥有一个
			String sql1 = "select * from T_CO_STANDARD_TIME where CST_MODEL_CODE=? and CST_STEP_CODE=?"
					+ " and CST_PROCESS_FACE=? and CST_AREA_SN=? and CST_TRACK=? and DATA_AUTH=? ";
			int count1 = modelService.countSql(sql1,
					new Object[] { code, cstStepCode, cstProcessFace, cstAreaSn, cstTrack, dataAuth });

			if (count1 != 0) {
				return modelAction.alertParentInfo(modelAction.getText("同个机种,生产阶别,面别,线别,SMT轨道只允许存在一个标准工时"));
			}

			TableDataMapExt cjMap = new TableDataMapExt();
			CommMethod.addSysDefCol(cjMap.getColMap(), modelAction.getUser());
			Map map = cjMap.getColMap();
			map.put("CST_MODEL_CODE", code);
			map.put("CST_STEP_CODE", cstStepCode);
			map.put("CST_PROCESS_FACE", cstProcessFace);
			map.put("CST_STANDARD_TIME", Double.parseDouble(cstStandardTime));
			map.put("CST_CHANGE_TIME", Integer.valueOf(cstChangeTime));
			map.put("CST_AREA_SN", cstAreaSn);
			map.put("CST_CT_ID", request.getParameter("paraMap1@0#CST_CT_ID"));
			map.put("CST_SCHEDULE_FLAG", cstScheduleFlag);
			map.put("CST_TRACK", cstTrack);

			cjMap.setTableName("T_CO_STANDARD_TIME");
			modelService.save(cjMap);
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e);
			throw new BussException(modelAction.getText("新增失败"));
		}

		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}

}
