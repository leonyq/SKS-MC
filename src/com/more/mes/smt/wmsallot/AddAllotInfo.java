package com.more.mes.smt.wmsallot;

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
 * 保存新增的调拨单信息
 * 
 * @author development
 */
public class AddAllotInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
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
			String WAD_DISPATCH_SN = request.getParameter("paraMap1@0#WAD_DISPATCH_SN");// 收发类型
			String WAD_ALLOT_DATE = request.getParameter("paraMap1@0#WAD_ALLOT_DATE");// 调拨日期
			String WAD_URGENT_FLAG = request.getParameter("paraMap1@0#WAD_URGENT_FLAG");// 紧急标志
			String WAD_OUTSTOCK_FLAG = request.getParameter("paraMap1@0#WAD_OUTSTOCK_FLAG");// 出库标志
			String WAD_MEMO = request.getParameter("paraMap1@0#WAD_MEMO");// 备注
			String[] itemCodes = request.getParameterValues("CI_ITEM_CODE");// 物料料号
			String[] planNums = request.getParameterValues("PLAN_NUM");// 计划数量
			String[] packNums = request.getParameterValues("MIN_PACK");// 标准包装数量
			String[] wmsSelects = request.getParameterValues("wmsSelect");// 调入仓库
			String[] outSelects = request.getParameterValues("outSelect");// 调出仓库
			String[] allotDates = request.getParameterValues("ALLOT_DATE");// 调拨日期
			// 判断调入/调出仓库是否一致
			int num = itemCodes.length;
			for (int i = 0; i < num; i++) {
				if (wmsSelects[i].equals(outSelects[i])) {
					return modelAction.alertParentInfo(modelAction.getText("调入/调出仓库必须不一致"));
				}
			}
			// String WAD_DOC_NUM = getReceiveNo(dataAuth, "DJ16", WAD_DISPATCH_SN,
			// modelService);// 调拨单号
			GetSnService gss = new GetSnService();
			String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
			String WAD_DOC_NUM = gss.getSnForDocNum("DJ16", WAD_DISPATCH_SN, userId, dataAuth);
			if (WAD_DOC_NUM.indexOf("NG") != -1) {
				return modelAction.alertParentInfo(WAD_DOC_NUM);
			}
			if (WAD_URGENT_FLAG == null || WAD_URGENT_FLAG == "" || WAD_URGENT_FLAG.equals("")) {
				WAD_URGENT_FLAG = "N";
			}
			if (WAD_OUTSTOCK_FLAG == null || WAD_OUTSTOCK_FLAG == "" || WAD_OUTSTOCK_FLAG.equals("")) {
				WAD_OUTSTOCK_FLAG = "N";
			}
			// 增加仓库单据信息表数据
			TableDataMapExt wms = new TableDataMapExt();
			wms.setTableName("T_WMS_DOC_INFO");
			CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
			wms.getColMap().put("ID", StringUtils.getUUID());
			wms.getColMap().put("WDI_DOC_NUM", WAD_DOC_NUM);
			wms.getColMap().put("WDI_STATUS", "1");
			wms.getColMap().put("WDI_URGENT_FLAG", WAD_URGENT_FLAG);
			wms.getColMap().put("WDI_DOC_TYPE", "DJ16");
			wms.getColMap().put("WDI_DISPATCH_TYPE", WAD_DISPATCH_SN);
			wms.getColMap().put("WDI_CREATE_MAN", CommMethod.getSessionUser().getId());
			wms.getColMap().put("WDI_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));
			wms.getColMap().put("WDI_MEMO", WAD_MEMO);
			if (dataAuth != null) {
				wms.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.save(wms);
			// 插入调拨单信息
			TableDataMapExt receive = new TableDataMapExt();
			receive.setTableName("T_WMS_ALLOT_DOC");
			CommMethod.addSysDefCol(receive.getColMap(), modelAction.getUser());
			receive.getColMap().put("ID", StringUtils.getUUID());
			receive.getColMap().put("WAD_DOC_NUM", WAD_DOC_NUM);
			receive.getColMap().put("WAD_OUTSTOCK_FLAG", WAD_OUTSTOCK_FLAG);
			receive.getColMap().put("WAD_DOC_TYPE", "DJ16");
			receive.getColMap().put("WAD_STATUS", "1");
			if (!WAD_ALLOT_DATE.equals("")) {
				receive.getColMap().put("WAD_ALLOT_DATE", sdf2.parse(WAD_ALLOT_DATE));
			}
			receive.getColMap().put("WAD_URGENT_FLAG", WAD_URGENT_FLAG);
			receive.getColMap().put("WAD_DISPATCH_SN", WAD_DISPATCH_SN);
			receive.getColMap().put("WAD_MEMO", WAD_MEMO);
			receive.getColMap().put("WAD_CREATE_MAN", CommMethod.getSessionUser().getId());
			receive.getColMap().put("WAD_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));
			if (dataAuth != null) {
				receive.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.save(receive);
			// 插入调拨单物料信息
			TableDataMapExt receive1 = new TableDataMapExt();
			receive1.setTableName("T_WMS_ALLOT_ITEM");
			CommMethod.addSysDefCol(receive1.getColMap(), modelAction.getUser());
			for (int i = 0; i < num; i++) {
				receive1.getColMap().clear();
				receive1.getColMap().put("ID", StringUtils.getUUID());
				receive1.getColMap().put("WAI_DOC_NUM", WAD_DOC_NUM);
				receive1.getColMap().put("WAI_STATUS", "1");
				receive1.getColMap().put("WAI_ITEM_CODE", itemCodes[i]);
				receive1.getColMap().put("WAI_PLAN_NUM", Integer.parseInt(planNums[i]));
				receive1.getColMap().put("WAI_PACK_NUM", Integer.parseInt(packNums[i]));
				receive1.getColMap().put("WAI_IN_WH", wmsSelects[i]);
				receive1.getColMap().put("WAI_OUT_WH", outSelects[i]);
				if (!allotDates[i].equals("")) {
					receive1.getColMap().put("WAI_ALLOT_DATE", sdf2.parse(allotDates[i]));
				}
				if (dataAuth != null) {
					receive1.getColMap().put("DATA_AUTH", dataAuth);
				}
				modelService.save(receive1);
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
