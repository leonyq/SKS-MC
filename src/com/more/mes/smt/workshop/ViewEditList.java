package com.more.mes.smt.workshop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 车间建模---修改---修改前加载数据
 * 
 * @author Administrator
 *
 */
public class ViewEditList implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String flag = request.getParameter("flag");
		String dataId = modelAction.getDataId();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		Map paraMap = new HashMap();
		Map<String, String> listMap = new HashMap<String, String>();
		if (flag != null && !"".equals(flag)) {
			String sqlId = "select t.ID,t.CA_PARENTAREAID from T_CO_AREA t where t.CA_ID = ? and t.data_auth=?";
			List<Map> idList = modelService.listDataSql(sqlId, new Object[] { dataId, dataAuth });

			if (idList != null && !idList.isEmpty()) {
				listMap = idList.get(0);
				dataId = listMap.get("ID");
				String parantId = listMap.get("CA_PARENTAREAID");
				modelAction.setDataId(dataId);
				if ("-1".equals(parantId)) {
					paraMap.put("flag_disable", "0");// 修改车间或线别，此时的工种、工序不能更改。
					paraMap.put("parantname", modelAction.getText("无"));// 父类区域名称
				} else {
					String sqlPname = "select t.CA_NAME from T_CO_AREA t where t.CA_ID = ? and t.data_auth=? ";
					List<Map> pnameList = modelService.listDataSql(sqlPname, new Object[] { parantId, dataAuth });
					Map<String, String> listMap2 = new HashMap<String, String>();
					listMap2 = pnameList.get(0);
					String parantName = listMap2.get("CA_NAME");
					paraMap.put("flag_disable", "0");// 修改车间或线别，此时的工种、工序不能更改。
					paraMap.put("parantname", parantName);// 父类区域名称
				}

				modelAction.setDataMap(paraMap);
			}

		} else {
			String sqlPname = "select CA_NAME,CA_TRACK_FLAG,CA_ID "
					+ " from T_CO_AREA where CA_ID =(select t.CA_PARENTAREAID "
					+ " from T_CO_AREA t where t.ID = ? and t.data_auth=?) " + " and data_auth=?";
			List<Map> pnameList = modelService.listDataSql(sqlPname, new Object[] { dataId, dataAuth, dataAuth });
			Map<String, String> listMap2 = new HashMap<String, String>();

			if (pnameList != null && !pnameList.isEmpty()) {
				listMap2 = pnameList.get(0);
				String parantName = listMap2.get("CA_NAME");
				paraMap.put("flag_disable", "1");
				paraMap.put("parantType", "1"); // 父级区域类型
				paraMap.put("parantname", parantName);// 父类区域名称
				paraMap.put("parantId", listMap2.get("CA_ID"));// 父类区域
				paraMap.put("trackFlag", listMap2.get("CA_TRACK_FLAG"));// 父级双轨标志
			}

			modelAction.setDataMap(paraMap);
		}
		// 设备信息回填
		String sqlSb = "SELECT t1.ID,t1.CAD_DEVICE_SEQUENCE ,t2.CD_DEVICE_SN , "
				+ " t2.CD_DEVICE_CLASS,t2.CD_DEVICE_NAME FROM T_CO_AREA_DEVICE t1 "
				+ " LEFT JOIN T_CO_DEVICE t2 ON T1.CAD_DEVICE_ID=t2.id and t2.data_auth=t1.data_auth "
				+ " WHERE T1.CA_ID=(SELECT t3.CA_ID FROM T_CO_AREA t3 WHERE t3.id=? and t3.data_auth=? "
				+ " ) and t1.data_auth=? order by t1.CAD_DEVICE_SEQUENCE";
		List deviceList = modelService.listDataSql(sqlSb, new Object[] { dataId, dataAuth, dataAuth });
		if (deviceList != null && !deviceList.isEmpty()) {
			modelAction.setDataList0(deviceList);
		}
		// 用户信息回填
		/*
		 * String sqlFz =
		 * "SELECT t1. *FROM T_CO_AREA_CHARGE t1 WHERE T1.CA_ID=(SELECT t2.CA_ID FROM T_CO_AREA t2 where t2.id=?)"
		 * ;
		 */
		String sqlFz = "SELECT t1.*,t2.name as CHARGE_EMP,t3.name as CHARGE_TECH,t4.name as CHARGE_DEVICE,t5.name as CHARGE_QUALITY FROM T_CO_AREA_CHARGE t1 "
				+ " left join sy_user t2 on t1.CAC_CHARGE_EMP=t2.login_name"
				+ " left join sy_user t3 on t1.CAC_CHARGE_TECH=t3.login_name"
				+ " left join sy_user t4 on t1.CAC_CHARGE_DEVICE=t4.login_name"
				+ " left join sy_user t5 on t1.CAC_CHARGE_QUALITY=t5.login_name"
				+ " WHERE T1.CA_ID=(SELECT t6.CA_ID FROM T_CO_AREA t6 where t6.id=?) " + " and t1.data_auth=? ";
		List fzList = modelService.listDataSql(sqlFz, new Object[] { dataId, dataAuth });
		if (fzList != null && !fzList.isEmpty()) {
			modelAction.setDataList1(fzList);
		}
		// 指令集回填
		String sqlOrder = "SELECT t1.tw_stationsn,t1.tcs_code,t1.id,t2.tcs_name "
				+ "FROM t_workstation_cmd t1 left join t_command_set t2 on t1.tcs_code = t2.tcs_code "
				+ " where t1.tw_stationsn =(SELECT t3.CA_ID FROM T_CO_AREA t3 where t3.id=? and t3.data_auth=?) "
				+ " and t1.data_auth=? ";
		List orderList = modelService.listDataSql(sqlOrder, new Object[] { dataId, dataAuth, dataAuth });
		if (orderList != null && !orderList.isEmpty()) {
			modelAction.setDataList2(orderList);
		}
		modelAction.getRequest().setAttribute("iframeid", modelAction.getRequest().getParameter("iframeid"));
		return modelAction.ActionForwardExeid(modelAction.getExeid());
		// return modelAction.ActionForward("/plf/workShop/editList.jsp")
		// ;//转向本工程车间信息新增页面
	}

}
