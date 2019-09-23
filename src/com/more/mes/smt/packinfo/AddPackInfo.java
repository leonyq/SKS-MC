package com.more.mes.smt.packinfo;

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
 * 保存新增的包装策略信息
 * 
 * @author development
 *
 */
public class AddPackInfo implements FuncService {

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
			String ptiSn = request.getParameter("paraMap1@0#PTI_SN");// 策略编码
			String ptiName = request.getParameter("paraMap1@0#PTI_NAME");// 策略名称
			String ptiWeighWay = request.getParameter("paraMap1@0#PTI_WEIGH_WAY");// 称重方式
			String ptiDeviateRange = request.getParameter("paraMap1@0#PTI_DEVIATE_RANGE");// 偏差范围
			String mixFlag = request.getParameter("paraMap1@0#PTI_MIX_FLAG");// 混单包装
			String defaultFlag = request.getParameter("paraMap1@0#PTI_DEFAULT_FLAG");// 默认标识
			String routeCheck = request.getParameter("paraMap1@0#PTI_ROUTE_CHECK");// 流程校验
			String ptiMemo = request.getParameter("paraMap1@0#PTI_MEMO");// 备注
			String sql = "select PTI_SN from T_PACK_TACTICS_INFO where PTI_SN=? and data_auth=? ";
			int count = modelService.countSql(sql, new Object[] { ptiSn ,dataAuth});
			if (count != 0) {
				return modelAction.alertParentInfo(modelAction.getText("策略编码已存在"));
			}
			if (mixFlag == null) {
				mixFlag = "N";
			}
			if (routeCheck == null) {
				routeCheck = "N";
			}
			if (defaultFlag == null) {
				defaultFlag = "N";
			} else {
				String querySql = "select PTI_SN from T_PACK_TACTICS_INFO where PTI_DEFAULT_FLAG=? AND DATA_AUTH=? ";
				int count1 = modelService.countSql(querySql, new Object[] { "Y", dataAuth });
				if (count1 != 0) {
					return modelAction.alertParentInfo(modelAction.getText("只允许存在一条默认的包装策略"));
				}
			}
			String[] myPackLevels = request.getParameterValues("myPackLevel");// 包装层级
			String[] levelNames = request.getParameterValues("levelName");// 层级名称
			String[] capacitys = request.getParameterValues("capacity");// 容量
			String[] lablePrints = request.getParameterValues("lablePrint");// 标签打印
			String[] labelTemps = request.getParameterValues("labelTemp");// 标签模板
			String[] labelRules = request.getParameterValues("labelRule");// 条码规则
			String[] labelAddresss = request.getParameterValues("labelAddress");// 标签打印地址
			String[] isOnlines = request.getParameterValues("isOnline");// 在线打印
			String[] listPrints = request.getParameterValues("listPrint");// 清单打印
			String[] listTemps = request.getParameterValues("listTemp");// 清单模板
			String[] listAddresss = request.getParameterValues("listAddress");// 清单打印地址
			String[] createRule = request.getParameterValues("createRule");// 生成规则
			String[] titleFlagSel = request.getParameterValues("titleFlagSel");
			String[] memos = request.getParameterValues("memo");// 备注
			// 新增包装策略信息
			TableDataMapExt wms = new TableDataMapExt();
			wms.setTableName("T_PACK_TACTICS_INFO");
			CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
			wms.getColMap().put("PTI_SN", ptiSn);
			wms.getColMap().put("PTI_NAME", ptiName);
			wms.getColMap().put("PTI_WEIGH_WAY", ptiWeighWay);
			if (StringUtils.isNotBlank(ptiDeviateRange)) {
				wms.getColMap().put("PTI_DEVIATE_RANGE", Double.valueOf(ptiDeviateRange));
			}

			wms.getColMap().put("PTI_MIX_FLAG", mixFlag);
			wms.getColMap().put("PTI_ROUTE_CHECK", routeCheck);
			wms.getColMap().put("PTI_DEFAULT_FLAG", defaultFlag);
			wms.getColMap().put("PTI_MEMO", ptiMemo);
			wms.getColMap().put("PTI_EMP", modelAction.getSessionUser().getId());
			wms.getColMap().put("PTI_TIME", DateUtil.getCurDate());
			if (dataAuth != null) {
				wms.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.save(wms);
			// 新增包装策略明细信息
			TableDataMapExt pad = new TableDataMapExt();
			pad.setTableName("T_PACK_TACTICS_DETAIL");
			int num = myPackLevels.length;
			for (int i = 0; i < num; i++) {
				String lablePrint = lablePrints[i];
				String listPrint = listPrints[i];
				String isOnline = isOnlines[i];
				if (lablePrint.equals("undefined")) {
					lablePrint = "N";
				}
				if (listPrint.equals("undefined")) {
					listPrint = "N";
				}
				if (isOnline.equals("undefined")) {
					isOnline = "N";
				}
				pad.getColMap().clear();
				CommMethod.addSysDefCol(pad.getColMap(), modelAction.getUser());
				pad.getColMap().put("PTD_SN", ptiSn);
				pad.getColMap().put("PTD_LEVEL", myPackLevels[i]);
				pad.getColMap().put("PTD_LEVEL_NAME", levelNames[i]);
				if (StringUtils.isNotBlank(capacitys[i])) {
					pad.getColMap().put("PTD_CAPACITY", Integer.valueOf(capacitys[i]));
				}

				pad.getColMap().put("PTD_LABLE_PRINT", lablePrint);
				pad.getColMap().put("PTD_LABLE_TEMPLATE", labelTemps[i]);
				pad.getColMap().put("PTD_LABLE_RULE", labelRules[i]);
				pad.getColMap().put("PTD_LABLE_ADDRESS", labelAddresss[i]);
				pad.getColMap().put("PTD_IS_ONLINE", isOnline);
				pad.getColMap().put("PTD_LIST_PRINT", listPrint);
				pad.getColMap().put("PTD_LIST_TEMPLATE", listTemps[i]);
				pad.getColMap().put("PTD_LIST_ADDRESS2", listAddresss[i]);

				pad.getColMap().put("PTD_CREATE_RULE", createRule[i]);
				pad.getColMap().put("PTD_TITLE_FLAG", titleFlagSel[i]);

				pad.getColMap().put("PTD_MEMO", memos[i]);
				if (dataAuth != null) {
					pad.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.save(pad);
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("新增失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}

}
