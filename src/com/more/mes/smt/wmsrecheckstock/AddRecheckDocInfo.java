package com.more.mes.smt.wmsrecheckstock;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.mes.smt.getsnhttp.service.GetSnService;

/**
 * 保存新增的复检单信息
 * 
 * @author development
 */
public class AddRecheckDocInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
		// String dataAuth = request.getParameter("_DATA_AUTH");
		String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		String formId = request.getParameter("formId");
		String WRD_TEST_STEP = request.getParameter("paraMap1@0#WRD_TEST_STEP");// 检测阶别
		String WRD_SAMPLE_TYPE = request.getParameter("paraMap1@0#WRD_SAMPLE_TYPE");// 检验类型
		String WRD_ITEM_CODE = request.getParameter("paraMap1@0#WRD_ITEM_CODE");// 物料料号
		String WRD_MEMO = request.getParameter("paraMap1@0#WRD_MEMO");// 备注
		String WRD_DOC_NUM = null;
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			String[] itemSns = request.getParameterValues("WSI_ITEM_SN");
			String[] itemNums = request.getParameterValues("WSI_ITEM_NUM");// 物料数量
			String[] itemLots = request.getParameterValues("WSI_LOT_NO");// 物料批次
			String[] supCodes = request.getParameterValues("WSI_SUP_CODE");// 供应商
			String[] custCodes = request.getParameterValues("WSI_CUST_CODE");// 客户
			String[] whCodes = request.getParameterValues("WSI_WH_CODE");// 仓库
			String[] disCodes = request.getParameterValues("WSI_DISTRICT_CODE");// 库区
			String[] stoCodes = request.getParameterValues("WSI_STORAGE_CODE");// 库位

			// WRD_DOC_NUM = getRecheckNo(dataAuth, "DJ19", "", modelService);// 复检单号
			GetSnService gss = new GetSnService();
			String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
			WRD_DOC_NUM = gss.getSnForDocNum("DJ19", "", userId, dataAuth);
			if (WRD_DOC_NUM.indexOf("NG") != -1) {
				return modelAction.alertParentInfo(WRD_DOC_NUM);
			}
			// 技术物料总数量
			int itemSum = 0;
			int num = itemNums.length;
			for (int i = 0; i < num; i++) {
				itemSum += Integer.parseInt(itemNums[i]);
			}
			// 增加仓库单据信息表数据
			TableDataMapExt wms = new TableDataMapExt();
			wms.setTableName("T_WMS_DOC_INFO");
			CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
			wms.getColMap().put("WDI_DOC_NUM", WRD_DOC_NUM);
			wms.getColMap().put("WDI_STATUS", "1");
			wms.getColMap().put("WDI_DOC_TYPE", "DJ19");
			wms.getColMap().put("WDI_CREATE_MAN", CommMethod.getSessionUser().getId());
			wms.getColMap().put("WDI_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));
			wms.getColMap().put("WDI_MEMO", WRD_MEMO);
			if (dataAuth != null) {
				wms.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.save(wms);
			// 新增复检单信息
			TableDataMapExt recheck = new TableDataMapExt();
			recheck.setTableName("T_WMS_RECHECK_DOC");
			CommMethod.addSysDefCol(recheck.getColMap(), modelAction.getUser());
			recheck.getColMap().put("WRD_DOC_NUM", WRD_DOC_NUM);
			recheck.getColMap().put("WRD_DOC_TYPE", "DJ19");
			// recheck.getColMap().put("WRD_TEST_DOC", reList.get(0));
			recheck.getColMap().put("WRD_TEST_STEP", WRD_TEST_STEP);
			recheck.getColMap().put("WRD_SAMPLE_TYPE", WRD_SAMPLE_TYPE);
			recheck.getColMap().put("WRD_ITEM_CODE", WRD_ITEM_CODE);
			recheck.getColMap().put("WRD_ITEM_NUM", itemSum);
			recheck.getColMap().put("WRD_CREATE_MAN", CommMethod.getSessionUser().getId());
			recheck.getColMap().put("WRD_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));
			recheck.getColMap().put("WRD_MEMO", WRD_MEMO);
			if (dataAuth != null) {
				recheck.getColMap().put("DATA_AUTH", dataAuth);
			}
			int res1 = modelService.save(recheck);
			if (res1 < 1) {
				hbtran.rollback();// 错误时，回滚数据
				throw new BussException(modelAction.getText("新增失败"));
			}
			// 新增复检单明细信息
			TableDataMapExt recheckDet = new TableDataMapExt();
			recheckDet.setTableName("T_WMS_RECHECK_DETAIL");

			TableDataMapExt stock = new TableDataMapExt();
			stock.setTableName("T_WMS_STOCK_INFO");
			int iNum = itemSns.length;
			for (int i = 0; i < iNum; i++) {
				recheckDet.getColMap().clear();
				CommMethod.addSysDefCol(recheckDet.getColMap(), modelAction.getUser());
				recheckDet.getColMap().put("WRD_DOC_NUM", WRD_DOC_NUM);
				recheckDet.getColMap().put("WRD_ITEM_SN", itemSns[i]);
				recheckDet.getColMap().put("WRD_ITEM_CODE", WRD_ITEM_CODE);
				if (itemNums[i] == null || itemNums[i].equals("") || itemNums[i].equals("null")) {
					itemNums[i] = "0";
				}
				recheckDet.getColMap().put("WRD_ITEM_NUM", Integer.parseInt(itemNums[i]));
				recheckDet.getColMap().put("WRD_LOT_NO", itemLots[i]);
				recheckDet.getColMap().put("WRD_SUP_CODE", supCodes[i]);
				recheckDet.getColMap().put("WRD_CUST_CODE", custCodes[i]);
				recheckDet.getColMap().put("WRD_WH_CODE", whCodes[i]);
				recheckDet.getColMap().put("WRD_DISTRICT_CODE", disCodes[i]);
				recheckDet.getColMap().put("WRD_STORAGE_CODE", stoCodes[i]);
				if (dataAuth != null) {
					recheckDet.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.save(recheckDet);

				// 修改库存表物料sn状态
				stock.getColMap().clear();
				stock.setSqlWhere(" and WSI_ITEM_SN=? ");
				List<Object> wList = new ArrayList<Object>();
				wList.add(itemSns[i]);
				stock.setSqlWhereArgs(wList);
				stock.getColMap().put("WSI_STOCK_FLAG", "6");
				modelService.edit(stock);
			}
		} catch (Exception e) {
			hbtran.rollback();// 错误时，回滚数据
			log.error(e);
			throw new BussException(modelAction.getText("新增失败"), e);
		}
		List<Object> reList = getBatchNo(WRD_TEST_STEP, WRD_SAMPLE_TYPE, dataAuth, WRD_DOC_NUM, modelService);
		if (!reList.get(1).equals("OK")) {
			hbtran.rollback();// 错误时，回滚数据
			return modelAction.alertParentInfo(modelAction.getText(reList.get(1)));
		}
		TableDataMapExt recheck1 = new TableDataMapExt();
		recheck1.setTableName("T_WMS_RECHECK_DOC");
		recheck1.setSqlWhere(" and WRD_DOC_NUM=?");
		List<Object> wList = new ArrayList<Object>();
		wList.add(WRD_DOC_NUM);
		recheck1.setSqlWhereArgs(wList);
		recheck1.getColMap().put("WRD_TEST_DOC", reList.get(0));
		modelService.edit(recheck1);

		hbtran.commit();// 提交数据
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}

	@SuppressWarnings("unchecked")
	public String getRecheckNo(String dataAuth, String prefix, String dispatchSn, ModelService modelService) {
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

	@SuppressWarnings("unchecked")
	public List<Object> getBatchNo(String testStep, String sampleType, String dataAuth, String RecheckNo,
			ModelService modelService) {
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = { 1, 2, 3, 4, 5, 6 };
		int[] outplace = { 7, 8 };
		List<Object> list = new ArrayList<Object>();
		List<Object> outType = new ArrayList<Object>();
		list.add(testStep);
		list.add(sampleType);
		list.add(dataAuth);
		list.add(RecheckNo);
		list.add(CommMethod.getSessionUser().getLoginName());
		list.add(dataAuth);
		outType.add("String");
		outType.add("String");
		pf.setClassName("P_C_SAVE_DOC_BATCH");// 生成检验单号
		pf.setInPlace(inPlace);// 存储过程中in
		pf.setOutPlace(outplace); // 存储过程中out
		pf.setValArgs(list);// 存储过程中输入的参数
		pf.setTotalLen(list.size() + outType.size());// 总个数
		pf.setOutValType(outType);// 输出的参数
		List<Object> relist = modelService.procComm(pf);// 接收返回值
		// String res = (String) relist.get(0); //结果
		return relist;
	}

}
