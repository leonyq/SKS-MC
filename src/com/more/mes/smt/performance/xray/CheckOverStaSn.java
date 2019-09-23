package com.more.mes.smt.performance.xray;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * 检验过站SN号
 * @author development
 *
 */
public class CheckOverStaSn implements FuncService {

	public String exeFunc(ModelAction modelAction, ModelService modelService) {

		final Log log = LogFactory.getLog(this.getClass());
		HttpServletRequest request = modelAction.getRequest();
		String sn = request.getParameter("sn");
		String workStation = request.getParameter("workStation");
		String dataAuth = request.getParameter("_DATA_AUTH");
		 String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String res = "";
		Map<String, Object> map = new HashMap();
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.mapToEscapeJs(map);
		modelAction.setAjaxMap(map);
		String completeRepairFlag = request.getParameter("Flag");
		try {
			/*
			 * M_SN IN VARCHAR2, --产品SN
			 *  M_EC_STR IN OUT VARCHAR2, --不良代码（ALL）
			 * M_WORK_STATIONID IN VARCHAR2, 
			 * --工作中心SN RES OUT VARCHAR2 --返回值 ) AS
			 */

			// 获得不良信息
			String sql = "SELECT t.xray_cec_code , t.xray_cec_point FROM T_WIP_XRAY_CEC t " +
					" where XRAY_MO_NUMBER = ? and t.DATA_AUTH=? ";
			List<Map<String, Object>> list = new ArrayList();
			list = modelService.listDataSql(sql, new Object[] { sn,auth });// 不良信息
			List<Object> bill = new ArrayList();// 输入过站信息
			// 生成输入信息
			String mSn = sn;
			StringBuffer mEcStr = new StringBuffer();// 不良代码 --为空会怎样？
			String mWorkStationid = workStation;// 工作中心
			int i = 0;
			for (Map l : list) {
				if (0 != i++) {
					mEcStr.append("|" + l.get("xray_cec_code"));
				} else {
					mEcStr.append(l.get("xray_cec_code"));
				}
			}
			String ecStr = "";
			bill.add(auth);// sn
			bill.add(mSn);// sn
			
			bill.add(ecStr);// 不良代码
			bill.add(mWorkStationid);// 工作空间
			bill.add(res);
		 res = p_c_check_sn_route(bill, modelService);
		 map.put("msg", res);
			return BaseActionSupport.AJAX;
		} catch (Exception e) {
			map.put("error", e);
			log.error(e);
			return BaseActionSupport.AJAX;
		}

	}

	@SuppressWarnings("unchecked")
	public String p_c_check_sn_route(List<Object> bill, ModelService modelService) {
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = { 1,2,3,4 };
		int[] outplace = { 3,5 };
		List<Object> outType = new ArrayList<Object>();
		outType.add("String");
		outType.add("String");
		pf.setClassName("P_C_CHECK_SN_ROUTE");// 过站
		pf.setInPlace(inPlace);// 存储过程中in
		pf.setOutPlace(outplace); // 存储过程中out
		pf.setValArgs(bill.subList(0, 4));// 存储过程中输入的参数
		pf.setTotalLen(bill.size());// 总个数
		pf.setOutValType(outType);// 输出的参数
		List<Object> relist = modelService.procComm(pf);// 接收返回值
		String res = (String) relist.get(0); // 结果
		String res1 = (String) relist.get(1); // 结果
		return res1;
	}

}
