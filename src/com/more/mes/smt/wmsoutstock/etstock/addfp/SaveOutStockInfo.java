package com.more.mes.smt.wmsoutstock.etstock.addfp;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.mes.smt.getsnhttp.service.GetSnService;

/**
 * @ClassName:SaveOutStockInfo
 * @Description: 委外发料---新增保存
 * @author:mmz
 * @version:1.0
 * @see
 * @since 2018年4月27日上午10:55:12
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
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
			// String pickType = request.getParameter("paraMap1@0#WOD_PICK_TYPE");// 备料类型
			String wodDispatchSn = "ETCK";// 收发类型 *
			String wodDeliveryDate = request.getParameter("paraMap1@0#WOD_OUTSTOCK_DATE");// 出库日期 *
			String wodUrgentFlag = request.getParameter("paraMap1@0#WOD_URGENT_FLAG");// 紧急标志 *
			String wodMemo = request.getParameter("paraMap1@0#WOD_MEMO");// 备注 *
			String supCode = request.getParameter("paraMap1@0#WOD_SUP_CODE");// 委外供应商 *
			String[] itemCodes = request.getParameterValues("CBD_ITEM_CODE");// 物料料号 *
			String planNum = request.getParameter("ET_FQC_COUNT");// 机种计划数量
			String[] cbdItemNum = request.getParameterValues("CBD_ITEM_NUM");// 需求比
			String[] wmsSelects = request.getParameterValues("wmsSelect");// 仓库
			String[] deliveryDate = request.getParameterValues("DELIVERY_DATE");// 出库日期
			String produceId = request.getParameter("paraMap1@0#WOD_PRODUCE_ID");// 工单
			String[] requestNums = request.getParameterValues("REQUEST_NUM");// 需求数量
			String[] wosReqNum = request.getParameterValues("WOS_REQUEST_NUM");// 使用委外库存
			String[] wositemrn = request.getParameterValues("WOS_ITEM_RN");// 委外库存
			String[] etnum = request.getParameterValues("etnum");// 物料计划数量
			String[] OUTPUT_RATE = request.getParameterValues("OUTPUT_RATE");// 物料计划数量

			GetSnService gss = new GetSnService();
			String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
			String wodDocNum = gss.getSnForDocNum("DJ27", wodDispatchSn, userId, dataAuth);
			if (wodDocNum.indexOf("NG") != -1) {
				return modelAction.alertParentInfo(wodDocNum);
			}
			if (wodUrgentFlag == null || wodUrgentFlag == "" || wodUrgentFlag.equals(""))// 紧急标志
			{
				wodUrgentFlag = "N";
			}
			// 增加仓库单据信息表数据
			TableDataMapExt wms = new TableDataMapExt();
			wms.setTableName("T_WMS_DOC_INFO");
			CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
			wms.getColMap().put("WDI_DOC_NUM", wodDocNum);
			wms.getColMap().put("WDI_STATUS", "1");
			wms.getColMap().put("WDI_DOC_TYPE", "DJ27");
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
			outStock.getColMap().put("WOD_DOC_TYPE", "DJ27");// 单据类型
			// outStock.getColMap().put("WOD_PICK_TYPE", pickType);// 备料类型
			outStock.getColMap().put("WOD_STATUS", "1");// 状态
			outStock.getColMap().put("WOD_DISPATCH_SN", wodDispatchSn);// 收发类型代码
			if (!wodDeliveryDate.equals("")) {
				outStock.getColMap().put("WOD_OUTSTOCK_DATE", sdf2.parse(wodDeliveryDate));// 交货日期
			}
			outStock.getColMap().put("WOD_URGENT_FLAG", wodUrgentFlag);
			outStock.getColMap().put("WOD_MEMO", wodMemo);
			outStock.getColMap().put("WOD_CREATE_MAN", CommMethod.getSessionUser().getId());// 开单人
			outStock.getColMap().put("WOD_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));// 开单时间
			outStock.getColMap().put("ET_CONECT_PROJECT_ID", produceId);// 工单
			outStock.getColMap().put("WOD_SUP_CODE", supCode);// 委外供应商
			outStock.getColMap().put("ET_FQC_COUNT", Integer.parseInt(planNum));// 发出套数

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
				String sql = "SELECT T.ID FROM T_CO_ITEM_FORBIDDEN T WHERE T.CF_ITEM_CODE = ?";
				List<String> result = modelService.listDataSql(sql, new Object[] { itemCodes[i] });
				if (!(result == null) && !result.isEmpty()) {
					return modelAction.alertParentInfo(modelAction.getText("物料包含禁用料,请更换"));
				}
				outStockItem.getColMap().clear();
				CommMethod.addSysDefCol(outStockItem.getColMap(), modelAction.getUser());
				outStockItem.getColMap().put("ID", StringUtils.getUUID());
				outStockItem.getColMap().put("WOI_DOC_NUM", wodDocNum);// 入库单号
				outStockItem.getColMap().put("WOI_STATUS", "1");// 物料状态
				outStockItem.getColMap().put("WOI_PROCESS_FACE", proFace);// 面别
				outStockItem.getColMap().put("WOI_ITEM_CODE", itemCodes[i]);// 物料料号
				// outStockItem.getColMap().put("WOI_ITEM_NAME", cbd_item_name[i]);// 物料料号
				// outStockItem.getColMap().put("WOI_ITEM_SPEC", cbd_item_sepc[i]);// 物料料号
				outStockItem.getColMap().put("WOI_PLAN_NUM", Integer.parseInt(etnum[i]));// 计划数量
				outStockItem.getColMap().put("WOI_ITEM_SEQ", 0);// 项次
				outStockItem.getColMap().put("WOI_CONNECT_DOC", produceId);// 关联单号
				outStockItem.getColMap().put("WOI_WH_CODE", wmsSelects[i]);// 仓库代码
				outStockItem.getColMap().put("WOI_MEMO", wodMemo);// 备注
				outStockItem.getColMap().put("WOI_REQUEST_NUM", Integer.parseInt(requestNums[i]));// 需求数量
				outStockItem.getColMap().put("ET_SUP_CODE", supCode);// 委外供应商
				outStockItem.getColMap().put("ET_ITEM_USERNUM", Integer.parseInt(wosReqNum[i]));// 委外使用量
				outStockItem.getColMap().put("WOI_OUTPUT_RATE", Integer.parseInt(OUTPUT_RATE[i]));// 产出率
				outStockItem.getColMap().put("WOI_CBD_ITEM_NUM", Integer.parseInt(cbdItemNum[i]));// 物料用量比--与工单相关
				if (!deliveryDate[i].equals("")) {
					outStockItem.getColMap().put("WOI_DELIVERY_DATE", sdf2.parse(deliveryDate[i]));
				}
				if (dataAuth != null) {
					outStockItem.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.save(outStockItem);
			}
			// 修改委外物料库存表信息表 T_WMS_OUTSOURCE_STOCK
			TableDataMapExt stockExt = new TableDataMapExt();
			stockExt.setTableName("T_WMS_OUTSOURCE_STOCK");
			for (int i = 0; i < num; i++) {

				stockExt.setSqlWhere(" AND WOS_SUP_CO = ? AND WOS_ITEM_CO = ? ");
				stockExt.getSqlWhereArgs().clear();
				stockExt.getSqlWhereArgs().add(supCode);
				stockExt.getSqlWhereArgs().add(itemCodes[i]);
				stockExt.getColMap().put("WOS_ITEM_RN",
						Integer.parseInt(wositemrn[i]) - Integer.parseInt(wosReqNum[i]));
				modelService.edit(stockExt);
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
