package com.more.mes.smt.wmsoutstock;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.mes.smt.getsnhttp.service.GetSnService;

/**
 * 保存新增的生产领料信息
 * 
 * @author development
 */
public class SaveOutStockInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		// String dataAuth = request.getParameter("_DATA_AUTH");
		String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			String proFace = request.getParameter("WOD_PRO_FACE");// 面别
			if (proFace == null || proFace == "" || proFace.equals("")) {
				proFace = "";
			}
			String pickType = request.getParameter("paraMap1@0#WOD_PICK_TYPE");// 备料类型
			String wodDispatchSn = request.getParameter("paraMap1@0#T2#WOD_DISPATCH_SN");// 收发类型
			String wodDeliveryDate = request.getParameter("paraMap1@0#WOD_OUTSTOCK_DATE");// 出库日期
			String wodUrgentFlag = request.getParameter("paraMap1@0#WOD_URGENT_FLAG");// 紧急标志
			String wodMemo = request.getParameter("paraMap1@0#WOD_MEMO");// 备注
			String[] itemCodes = request.getParameterValues("ITEM_CODE");// 物料料号
			String[] planNums = request.getParameterValues("PLAN_NUM");// 计划数量
			String[] requestNums = request.getParameterValues("REQUEST_NUM");// 需求数量
			String[] wmsSelects = request.getParameterValues("wmsSelect");// 仓库
			String[] deliveryDate = request.getParameterValues("DELIVERY_DATE");// 出库日期
			String[] moNums = request.getParameterValues("MO_NUMBER");// 关联单号
			String[] minPacks = request.getParameterValues("MIN_PACK");// 物料料号
			String[] itemSeqs = request.getParameterValues("ITEM_SEQ");
			// String wodDocNum = getReceiveNo(dataAuth, "DJ10", wodDispatchSn,
			// modelService);// 出库单号

			String moNum = request.getParameter("moNum");
			// String dataAuth = request.getParameter("_DATA_AUTH");
			String outNum = request.getParameter("outNum");

			if (!"".equals(outNum) && !"0".equals(outNum)) {
				String womStatus = "";// 状态
				String womModelCode = "";// 机种
				String womProFace = "";// 面别
				int womMoNum = 0; // 计划数量
				String wompreInterval = ""; // 物料间隔
				String womStandardHours = "";// 标准工时
				int womOutNum = 0;// 累计发料套数
				int womCurrentNum = 0;// 当前发料套数
				int womNextNum = 0;// 下次备料套数
				Date womNextTime = null;// 下次备料时间
				// 保存仓库时序备料信息
				// 获取机种、面别、计划数量
				String moInfoSql = "SELECT T.* FROM T_PM_MO_BASE T WHERE T.PM_MO_NUMBER=? AND T.DATA_AUTH=?";
				List<Map<String, Object>> moInfoList = modelService.listDataSql(moInfoSql,
						new Object[] { moNum, dataAuth });
				if (moInfoList != null && moInfoList.size() > 0) {
					womModelCode = StringUtils.toString(moInfoList.get(0).get("PM_MODEL_CODE"));
					womProFace = StringUtils.toString(moInfoList.get(0).get("PM_PROCESS_FACE"));
					womMoNum = Integer.valueOf(StringUtils.toString(moInfoList.get(0).get("PM_TARGET_QTY")));
				}
				// 获取物料间隔
				String intervalSql = "SELECT T.VR_VALUE FROM T_SYS_PARAMETER_INI T WHERE T.VR_CLASS='WMS0016' AND T.DATA_AUTH=? ";
				List<Map<String, Object>> intervalList = modelService.listDataSql(intervalSql,
						new Object[] { dataAuth });
				wompreInterval = StringUtils.toString(intervalList.get(0).get("VR_VALUE"));
				// 获取标准工时
				String hoursSql = "SELECT T.CST_STANDARD_TIME FROM T_CO_STANDARD_TIME T WHERE T.CST_MODEL_CODE=? AND T.CST_PROCESS_FACE=? AND T.DATA_AUTH=?";
				List<Map<String, Object>> hoursList = modelService.listDataSql(hoursSql,
						new Object[] { womModelCode, womProFace, dataAuth });
				if (hoursList == null || hoursList.isEmpty()) {
					return modelAction.alertParentInfo(modelAction.getText("未维护标准工时"));
				} else {
					womStandardHours = StringUtils.toString(hoursList.get(0).get("CST_STANDARD_TIME"));
				}
				double tempNum = Math.floor(Double.parseDouble(wompreInterval) / Double.parseDouble(womStandardHours)); // 套数

				String sql = "SELECT * FROM T_WMS_OUT_MO_INFO T WHERE T.WOM_MO_NUMBER=? AND DATA_AUTH=?";
				List<Map<String, Object>> moList = modelService.listDataSql(sql, new Object[] { moNum, dataAuth });
				if (!(moList == null) && !moList.isEmpty()) {
					// 存在 累计发料套数
					if (Double.parseDouble(String.valueOf(womMoNum)) < 2 * tempNum) {
						// 若计划量< 2*（备料间隔/标准工时）时,则当前备料数 = 计划量，下次备料数 = 0 ，累积备料数 =计划量，下次备料时间为空，状态为关结，
						womCurrentNum = womMoNum;
						womOutNum = womMoNum;
						womNextNum = 0;
						womStatus = "3";
					}

					else if (Double.parseDouble(String.valueOf(womMoNum)) >= 2 * tempNum) {
						// 当前备料数 = 备料间隔/标准工时（取整），累积备料数 = 备料间隔/标准工时
						womCurrentNum = (int) tempNum;
						womOutNum = (int) (Integer.valueOf(StringUtils.toString(moList.get(0).get("WOM_OUT_NUM")))
								+ tempNum);

						double tempNum3 = womMoNum
								- Double.parseDouble(StringUtils.toString(moList.get(0).get("WOM_OUT_NUM")));
						if (tempNum3 <= 2 * tempNum) {
							womNextNum = (int) tempNum3;
							womStatus = "1";
							// womNextTime = new Date(new Date().getTime() + 3600000
							// * Integer.parseInt(wompreInterval));

							womNextTime = new Date(
									(long) (new Date().getTime() + 3600000 * Double.parseDouble(wompreInterval)));
						} else {
							womNextNum = (int) tempNum;
							womStatus = "1";
							// womNextTime = new Date(new Date().getTime() + 3600000
							// * Integer.parseInt(wompreInterval));
							womNextTime = new Date(
									(long) (new Date().getTime() + 3600000 * Double.parseDouble(wompreInterval)));
						}
					}
				} else {
					// 不存在 累计发料套数为当前发料套数
					// 存在 累计发料套数
					if (Double.parseDouble(String.valueOf(womMoNum)) < 2 * tempNum) {
						// 若计划量< 2*（备料间隔/标准工时）时,则当前备料数 = 计划量，下次备料数 = 0 ，累积备料数 =计划量，下次备料时间为空，状态为关结，
						womCurrentNum = womMoNum;
						womOutNum = womMoNum;
						womNextNum = 0;
						womStatus = "3";
					} else if (Double.parseDouble(String.valueOf(womMoNum)) >= 2 * tempNum) {
						// 当前备料数 = 备料间隔/标准工时（取整），累积备料数 = 备料间隔/标准工时
						womCurrentNum = (int) tempNum;
						womOutNum = (int) tempNum;
						double tempNum3 = Double.parseDouble(String.valueOf(womMoNum)) - tempNum;
						if (tempNum3 <= 2 * tempNum) {
							womNextNum = (int) tempNum3;
							womStatus = "1";
							// womNextTime = new Date(new Date().getTime() + 3600000
							// * Integer.parseInt(wompreInterval));
							womNextTime = new Date(
									(long) (new Date().getTime() + 3600000 * Double.parseDouble(wompreInterval)));
						} else {
							womNextNum = (int) tempNum;
							womStatus = "1";
							// womNextTime = new Date(new Date().getTime() + 3600000
							// * Integer.parseInt(wompreInterval));

							womNextTime = new Date(
									(long) (new Date().getTime() + 3600000 * Double.parseDouble(wompreInterval)));
						}
					}
				}

				TableDataMapExt moMap = new TableDataMapExt();
				moMap.setTableName("T_WMS_OUT_MO_INFO");
				CommMethod.addSysDefCol(moMap.getColMap(), modelAction.getUser());
				if (dataAuth != null) {
					moMap.getColMap().put("DATA_AUTH", dataAuth);
				}
				moMap.getColMap().put("WOM_MO_NUMBER", moNum);// 制令单号
				moMap.getColMap().put("WOM_STATUS", womStatus);// 状态
				moMap.getColMap().put("WOM_MODEL_CODE", womModelCode);// 机种
				moMap.getColMap().put("WOM_PROCESS_FACE", womProFace);// 生产面别
				moMap.getColMap().put("WOM_MO_NUM", Integer.valueOf(womMoNum));// 制令单数量
				moMap.getColMap().put("WOM_PREPARA_INTERVAL", Double.valueOf(wompreInterval));// 物料间隔
				moMap.getColMap().put("WOM_STANDARD_HOURS", Double.valueOf(womStandardHours));// 标准工时
				moMap.getColMap().put("WOM_OUT_NUM", Integer.valueOf(womOutNum));// 累积备料数
				moMap.getColMap().put("WOM_CURRENT_NUM", Integer.valueOf(womCurrentNum));// 当前备料数
				moMap.getColMap().put("WOM_NEXT_NUM", womNextNum);// 下次备料数
				if (womNextTime != null) {
					moMap.getColMap().put("WOM_NEXT_TIME", sdf1.parse(sdf1.format(womNextTime)));// 下次备料时间
				}
				moMap.getColMap().put("WOM_OPERATE_TIME", sdf1.parse(sdf1.format(new Date())));// 开立时间
				moMap.getColMap().put("WOM_OPERATE_EMP", CommMethod.getSessionUser().getId());// 作业员
				moMap.getColMap().put("WOM_MEMO", wodMemo);// 备注

				modelService.save(moMap);
			}

			GetSnService gss = new GetSnService();
			String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
			String wodDocNum = gss.getSnForDocNum("DJ10", wodDispatchSn, userId, dataAuth);
			if (wodDocNum.indexOf("NG") != -1) {
				return modelAction.alertParentInfo(wodDocNum);
			}
			if (wodUrgentFlag == null || wodUrgentFlag == "" || wodUrgentFlag.equals("")) {
				wodUrgentFlag = "N";
			}
			// 增加仓库单据信息表数据
			TableDataMapExt wms = new TableDataMapExt();
			wms.setTableName("T_WMS_DOC_INFO");
			CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
			wms.getColMap().put("WDI_DOC_NUM", wodDocNum);
			wms.getColMap().put("WDI_STATUS", "1");
			wms.getColMap().put("WDI_DOC_TYPE", "DJ10");
			wms.getColMap().put("WDI_DISPATCH_TYPE", wodDispatchSn);
			wms.getColMap().put("WDI_CREATE_MAN", CommMethod.getSessionUser().getId());
			wms.getColMap().put("WDI_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));
			wms.getColMap().put("WDI_MEMO", wodMemo);
			wms.getColMap().put("WDI_URGENT_FLAG", wodUrgentFlag);
			if (dataAuth != null) {
				wms.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.save(wms);
			// 插入出库单信息
			TableDataMapExt outStock = new TableDataMapExt();
			outStock.setTableName("T_WMS_OUTSTOCK_DOC");
			CommMethod.addSysDefCol(outStock.getColMap(), modelAction.getUser());
			outStock.getColMap().put("WOD_DOC_NUM", wodDocNum);// 入库单号
			outStock.getColMap().put("WOD_DOC_TYPE", "DJ10");// 单据类型
			outStock.getColMap().put("WOD_PICK_TYPE", pickType);// 备料类型
			outStock.getColMap().put("WOD_STATUS", "1");// 状态
			outStock.getColMap().put("WOD_DISPATCH_SN", wodDispatchSn);// 收发类型代码
			if (!wodDeliveryDate.equals("")) {
				outStock.getColMap().put("WOD_OUTSTOCK_DATE", sdf2.parse(wodDeliveryDate));// 交货日期
			}
			outStock.getColMap().put("WOD_URGENT_FLAG", wodUrgentFlag);
			outStock.getColMap().put("WOD_MEMO", wodMemo);
			outStock.getColMap().put("WOD_CREATE_MAN", CommMethod.getSessionUser().getId());// 开单人
			outStock.getColMap().put("WOD_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));// 开单时间
			if (dataAuth != null) {
				outStock.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.save(outStock);
			// 插入出库单物料信息
			TableDataMapExt outStockItem = new TableDataMapExt();
			outStockItem.setTableName("T_WMS_OUTSTOCK_ITEM");
			int num = itemCodes.length;
			for (int i = 0; i < num; i++) {
				// 判断是否是禁用料
				String sql = "SELECT T.ID FROM T_CO_ITEM_FORBIDDEN T WHERE T.CF_ITEM_CODE = ? AND T.DATA_AUTH=? ";
				List<String> result = modelService.listDataSql(sql, new Object[] { itemCodes[i], dataAuth });
				if (!(result == null) && !result.isEmpty()) {
					return modelAction.alertParentInfo(
							modelAction.getText("物料包含禁用料,") + itemCodes[i] + modelAction.getText("请更换"));
				}
				outStockItem.getColMap().clear();
				CommMethod.addSysDefCol(outStockItem.getColMap(), modelAction.getUser());
				outStockItem.getColMap().put("ID", StringUtils.getUUID());
				outStockItem.getColMap().put("WOI_DOC_NUM", wodDocNum);// 入库单号
				outStockItem.getColMap().put("WOI_STATUS", "1");// 物料状态
				outStockItem.getColMap().put("WOI_PROCESS_FACE", proFace);// 面别
				outStockItem.getColMap().put("WOI_ITEM_CODE", itemCodes[i]);// 物料料号
				outStockItem.getColMap().put("WOI_PLAN_NUM", Integer.valueOf(planNums[i]));// 计划数量
				outStockItem.getColMap().put("WOI_REQUEST_NUM", Integer.valueOf(requestNums[i]));// 需求数量
				outStockItem.getColMap().put("WOI_ITEM_SEQ", itemSeqs[i]);// 项次
				outStockItem.getColMap().put("WOI_CONNECT_DOC", moNums[i]);// 关联单号
				outStockItem.getColMap().put("WOI_WH_CODE", wmsSelects[i]);// 仓库代码
				outStockItem.getColMap().put("WOI_MEMO", wodMemo);// 备注
				outStockItem.getColMap().put("WOI_MIN_PACK", Integer.valueOf(minPacks[i]));// 用量

				if (!deliveryDate[i].equals("")) {
					outStockItem.getColMap().put("WOI_DELIVERY_DATE", sdf2.parse(deliveryDate[i]));
				}
				if (dataAuth != null) {
					outStockItem.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.save(outStockItem);
			}

		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("新增失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}

	@SuppressWarnings("unchecked")
	public String getReceiveNo(String dataAuth, String prefix, String dispatchSn, ModelService modelService) {
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
