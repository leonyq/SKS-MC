package com.more.mes.smt.wmsoutstock.etstock.editfp;

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
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @ClassName:EditOutStockInfo
 * @Description: 保存修改的委外发料信息
 * @author:mmz
 * @version:1.0
 * @see
 * @since 2018年5月1日下午3:52:52
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class EditOutStockInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		// String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
		String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		String formId = request.getParameter("formId");
		int l = 0;
		System.out.println(l);
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
			String delIds = request.getParameter("delIds");// 删除的id
			String[] doc_item_ids = request.getParameterValues("DOC_ITEM_ID");// 表单物料ID
			String wodDeliveryDate = request.getParameter("paraMap1@0#WOD_OUTSTOCK_DATE");// 出库日期 *
			String wodUrgentFlag = request.getParameter("paraMap1@0#WOD_URGENT_FLAG");// 紧急标志 *
			String wodMemo = request.getParameter("paraMap1@0#WOD_MEMO");// 备注 *
			String supCode = request.getParameter("paraMap1@0#WOD_SUP_CODE");// 委外供应商 *
			String[] itemCodes = request.getParameterValues("CBD_ITEM_CODE");// 物料料号 *
			String[] cbd_item_name = request.getParameterValues("CBD_ITEM_NAME");// 物料名称 *
			String[] cbd_item_sepc = request.getParameterValues("CBD_ITEM_SEPC");// 物料规格 *
			String planNum = request.getParameter("ET_FQC_COUNT");// 机种计划数量
			String[] cbdItemNum = request.getParameterValues("CBD_ITEM_NUM");// 需求比
			String[] wmsSelects = request.getParameterValues("wmsSelect");// 仓库
			String[] deliveryDate = request.getParameterValues("DELIVERY_DATE");// 出库日期
			String produceId = request.getParameter("paraMap1@0#WOD_PRODUCE_ID");// 工单
			String[] requestNums = request.getParameterValues("REQUEST_NUM");// 需求数量
			String[] wosReqNum = request.getParameterValues("WOS_REQUEST_NUM");// 使用委外库存
			String[] wositemrn = request.getParameterValues("WOS_ITEM_RN");// 委外库存
			String[] etnum = request.getParameterValues("etnum");// 物料计划数量
			String[] OUTPUT_RATE = request.getParameterValues("OUTPUT_RATE");// 物料成品率
			// String wodDocNum = request.getParameter("paraMap1_WOD_DOC_NUM");// 出库单号
			String wodDocNum = request.getParameter("MMZ_DOCNUM");// 出库单号

			if (wodUrgentFlag == null || wodUrgentFlag == "" || wodUrgentFlag.equals(""))// 紧急标志
			{
				wodUrgentFlag = "N";
			}

			// 如果是原本的物料 则判断计划数量是否大于入库数量
			String sql1 = "select WOI_OUT_NUM from T_WMS_OUTSTOCK_ITEM where id=? ";
			List<Map> pList = null;
			int num = doc_item_ids.length;
			for (int i = 0; i < num; i++) {
				if (!doc_item_ids[i].equals("")) {
					pList = modelService.listDataSql(sql1, new Object[] { doc_item_ids[i] });
					if (null != pList && pList.size() > 0 && pList.get(0).get("WOI_OUT_NUM") != null) {
						if (Integer.parseInt(etnum[i]) < Integer.parseInt(pList.get(0).get("WOI_OUT_NUM").toString())) {
							return modelAction.alertParentInfo(modelAction.getText("计划数量应大于出库数量"));
						}
					}
				}
			}

			// 修改仓库单据信息表数据
			TableDataMapExt wms = new TableDataMapExt();
			wms.setTableName("T_WMS_DOC_INFO");
			CommMethod.editSysDefCol(wms.getColMap(), modelAction.getUser());
			wms.setSqlWhere(" and WDI_DOC_NUM='" + wodDocNum + "' and DATA_AUTH='" + dataAuth + "' ");
			wms.getColMap().put("WDI_DISPATCH_TYPE", wodDispatchSn);
			wms.getColMap().put("WDI_MEMO", wodMemo);
			wms.getColMap().put("WDI_URGENT_FLAG", wodUrgentFlag);
			if (dataAuth != null) {
				wms.getColMap().put("DATA_AUTH", dataAuth);
			}

			modelService.edit(wms);
			// 修改出库单信息
			TableDataMapExt outStock = new TableDataMapExt();
			outStock.setTableName("T_WMS_OUTSTOCK_DOC");
			CommMethod.editSysDefCol(outStock.getColMap(), modelAction.getUser());
			outStock.setSqlWhere(" and WOD_DOC_NUM='" + wodDocNum + "'");
			// outStock.getColMap().put("WOD_DOC_TYPE", "DJ27");// 单据类型
			// outStock.getColMap().put("WOD_PICK_TYPE", pickType);// 备料类型
			outStock.getColMap().put("WOD_DISPATCH_SN", wodDispatchSn);// 收发类型代码
			if (!wodDeliveryDate.equals("")) {
				outStock.getColMap().put("WOD_OUTSTOCK_DATE", sdf2.parse(wodDeliveryDate));// 交货日期
			}
			outStock.getColMap().put("WOD_URGENT_FLAG", wodUrgentFlag);
			outStock.getColMap().put("WOD_MEMO", wodMemo);
			if (StringUtils.isNotBlank(planNum)) {
				outStock.getColMap().put("ET_FQC_COUNT", Integer.valueOf(planNum));// 发出套数
			}

			if (dataAuth != null) {
				outStock.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.edit(outStock);

			// 修改委外物料库存表信息表 T_WMS_OUTSOURCE_STOCK 注：先加回去 最后再减回去
			String moditysql1 = "   select woi_item_code , et_sup_code  ,sum(et_item_usernum ) et_item_usernum  from t_wms_outstock_item where  woi_doc_num = ? AND DATA_AUTH=? group by  woi_item_code ,et_sup_code ";
			List<Map<String, Object>> modityList1 = modelService.listDataSql(moditysql1,
					new Object[] { wodDocNum, dataAuth });
			if (checkList(modityList1)) {
				String rn = "0";
				String outdoc = "";
				String sql = null;
				int mNum = modityList1.size();
				for (int i = 0; i < mNum; i++) {
					sql = "  UPDATE  T_WMS_OUTSOURCE_STOCK SET WOS_ITEM_RN = WOS_ITEM_RN +  ?  WHERE  WOS_ITEM_CO = ? AND WOS_SUP_CO = ? AND DATA_AUTH=? ";
					modelService.execSql(sql, new Object[] { modityList1.get(i).get("ET_ITEM_USERNUM"),
							modityList1.get(i).get("WOI_ITEM_CODE"), supCode, dataAuth });
				}
			}

			// 插入|修改 出库单物料信息
			TableDataMapExt outStockItem = new TableDataMapExt();
			outStockItem.setTableName("T_WMS_OUTSTOCK_ITEM");
			List list = new ArrayList();
			for (int i = 0; i < num; i++) {

				// 判断是否是禁用料
				String sql = "SELECT T.ID FROM T_CO_ITEM_FORBIDDEN T WHERE T.CF_ITEM_CODE = ?";
				List<String> result = modelService.listDataSql(sql, new Object[] { itemCodes[i] });
				if (!(result == null) && !result.isEmpty()) {
					return modelAction.alertParentInfo(modelAction.getText("物料包含禁用料:" + itemCodes[i] + "，请更换"));
				}
				boolean inx = true;
				if (modelService.countSql(" SELECT ID FROM T_WMS_OUTSTOCK_ITEM WHERE ID = ? ",
						new Object[] { doc_item_ids[i] }) != 0) {// 判读是否存在
					inx = false;
				}

				if (inx) {// 新增
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
				} else {// 修改
					outStockItem.getColMap().clear();
					CommMethod.editSysDefCol(outStockItem.getColMap(), modelAction.getUser());
					// outStockItem.getColMap().put("WOI_DOC_NUM", wodDocNum);// 入库单号
					// outStockItem.getColMap().put("WOI_STATUS", "1");// 物料状态
					outStockItem.getColMap().put("WOI_PROCESS_FACE", proFace);// 面别
					outStockItem.getColMap().put("WOI_ITEM_CODE", itemCodes[i]);// 物料料号
					// outStockItem.getColMap().put("WOI_ITEM_NAME", cbd_item_name[i]);// 物料料号
					// outStockItem.getColMap().put("WOI_ITEM_SPEC", cbd_item_sepc[i]);// 物料料号
					outStockItem.getColMap().put("WOI_PLAN_NUM", Integer.parseInt(etnum[i]));// 计划数量
					outStockItem.getColMap().put("WOI_ITEM_SEQ", 0);// 项次
					// outStockItem.getColMap().put("WOI_CONNECT_DOC", produceId);// 关联单号
					outStockItem.getColMap().put("WOI_WH_CODE", wmsSelects[i]);// 仓库代码
					outStockItem.getColMap().put("WOI_MEMO", wodMemo);// 备注
					outStockItem.getColMap().put("WOI_REQUEST_NUM", Integer.parseInt(requestNums[i]));// 需求数量
					// outStockItem.getColMap().put("ET_SUP_CODE", supCode);//委外供应商
					outStockItem.getColMap().put("ET_ITEM_USERNUM", Integer.parseInt(wosReqNum[i]));// 委外使用量
					// outStockItem.getColMap().put("WOI_OUTPUT_RATE", OUTPUT_RATE[i]);// 产出率
					// outStockItem.getColMap().put("WOI_CBD_ITEM_NUM", cbdItemNum[i]);//
					// 物料用量比--与工单相关
					if (!deliveryDate[i].equals("")) {
						outStockItem.getColMap().put("WOI_DELIVERY_DATE", sdf2.parse(deliveryDate[i]));
					}
					if (dataAuth != null) {
						outStockItem.getColMap().put("DATA_AUTH", dataAuth);
					}
					outStockItem.setSqlWhere(" and ID =? ");
					list.clear();
					list.add(doc_item_ids[i]);
					wms.setSqlWhereArgs(list);
					modelService.edit(outStockItem);
					outStockItem.setSqlWhere("");

				}
			}

			// 删除应删物料信息
			if (StringUtils.isNotBlank(delIds)) {// T_WMS_OUTSTOCK_ITEM
				String delSql = "DELETE FROM  T_WMS_OUTSTOCK_ITEM WHERE ID IN ('" + delIds.replace(",", "','") + "')";
				int index = modelService.execSql(delSql);
			}

			// 修改委外物料库存表信息表 T_WMS_OUTSOURCE_STOCK 减法
			String moditysql = "   select woi_item_code , et_sup_code  ,sum(et_item_usernum ) et_item_usernum  from t_wms_outstock_item where  woi_doc_num = ? AND DATA_AUTH=? group by  woi_item_code ,et_sup_code ";
			List<Map<String, Object>> modityList = modelService.listDataSql(moditysql,
					new Object[] { wodDocNum, dataAuth });
			if (checkList(modityList)) {
				String rn = "0";
				String outdoc = "";
				String sql = null;
				int num1 = modityList.size();
				for (int i = 0; i < num1; i++) {
					sql = "  UPDATE  T_WMS_OUTSOURCE_STOCK SET WOS_ITEM_RN = WOS_ITEM_RN -  ?  WHERE  WOS_ITEM_CO = ? AND WOS_SUP_CO = ? AND DATA_AUTH=? ";
					modelService.execSql(sql, new Object[] { modityList.get(i).get("ET_ITEM_USERNUM"),
							modityList.get(i).get("WOI_ITEM_CODE"), supCode, dataAuth });
				}
			}

		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}

	private boolean checkList(List<Map<String, Object>> li) {
        return null != li && li.size() > 0;
    }
}
