package com.more.mes.smt.workshop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
 * 
 * 车间建模----新增保存
 * 
 * @author hys
 *
 */
public class SaveWorkInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		HttpSession session = request.getSession();
		// String iframeId = modelAction.getParaMap().get("iframeId");
		String iframeId = request.getParameter("paraMap.iframeId");
		String isCloseWin = request.getParameter("isCloseWin");// 判断是否关闭窗口所需的参数
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String caEmpRole = null;
		String caGroup = null;
		String caType = request.getParameter("paraMap1@0#CA_TYPE").trim();
		String caParentAreaId = request.getParameter("paraMap1@0#CA_PARENTAREAID").trim();
		String caId = request.getParameter("paraMap1@0#CA_ID").trim();
		String caFeederFlag = request.getParameter("paraMap1@0#CA_FEEDER_FLAG");
		String caProjectStep = request.getParameter("paraMap1@0#CA_PROJECT_STEP");// 生产阶别
		String caStopFlag = null;
		String caStopTime = null;
		String caTrackFlag = null;
		String caTrack = null;
		String caIsTrack = request.getParameter("trackFlag");// 上级是否为双轨
		Map paraMapc = new HashMap();
		paraMapc.put("isCloseWin", isCloseWin);

		if (caFeederFlag == null || caFeederFlag == "") {
			caFeederFlag = "N";
		}
		if ("-1".equals(caParentAreaId)) {// 判断子区域还是新增工厂
			session.setAttribute("idd", caId);
		} else {
			session.setAttribute("idd", caParentAreaId);
		}
		String caName = request.getParameter("paraMap1@0#CA_NAME").trim();
		if (caType.equals("2")) {
			caEmpRole = request.getParameter("paraMap1@0#CA_EMP_ROLE").trim();
			caGroup = request.getParameter("paraMap1@0#CA_GROUP").trim();
			if (caIsTrack.equals("Y")) { // 线别为双轨
				caTrack = request.getParameter("paraMap1@0#CA_TRACK");
			} else {
				caTrack = "S"; // 单轨
			}
		} else if (caType.equals("1")) {
			caStopFlag = request.getParameter("paraMap1@0#CA_STOP_FLAG");
			caStopTime = request.getParameter("paraMap1@0#CA_STOP_TIME");// 生产阶别
			if (caStopFlag == null || caStopFlag == "") {
				caFeederFlag = "N";
			}
			caTrackFlag = request.getParameter("paraMap1@0#CA_TRACK_FLAG");
			if (caTrackFlag == null || caTrackFlag == "") {
				caTrackFlag = "N";
			}
		}
		String caStatus = request.getParameter("paraMap1@0#CA_STATUS");
		if (caStatus == null || caStatus == "") {
			caStatus = "N";
		}
		// 负责人关联信息表的值
		String[] groups = request.getParameterValues("group");
		String[] chargeEmps = request.getParameterValues("chargeEmp");
		String[] chargeTechs = request.getParameterValues("chargeTech");
		String[] chargeDevices = request.getParameterValues("chargeDevice");
		String[] chargeQualitys = request.getParameterValues("chargeQuality");
		// 设备信息关联表中的框的值
		String[] deviceSeqs = request.getParameterValues("deviceSeq");

		String[] deviceNames = request.getParameterValues("deviceName");

		String[] deviceClass = request.getParameterValues("DEVICE_CLASS");
		int deLength;
		if (null != deviceClass) {
			deLength = deviceClass.length;
			for (int i = 0; i < deLength; i++) {
				for (int k = i + 1; k < deLength; k++) {
					if (deviceClass[i].equals(deviceClass[k])) {
						if (deviceSeqs[i].equals(deviceSeqs[k])) {
							return modelAction.alertParentInfo(modelAction.getText("您输入的序号已经存在"));
						}
					}
				}
			}
		}

		// 指令集数据获取 orderSeq
		String[] orderSeqs = request.getParameterValues("orderSeq");
		String[] gzzxCodes = request.getParameterValues("gzzxCode");
		String[] orderCodes = request.getParameterValues("orderCode");
		String[] orderNames = request.getParameterValues("orderName");
		// String msg=null;
		// 页面table选择
		// String tableState= request.getParameter("tableState");
		// int state= Integer.parseInt(tableState);
		// 表单验证
//	    	if(caType == null || caType.equals("")){
//	    		return modelAction.alertParentInfo(modelAction.getText("类别不能为空") );
//	    	}
//	    	if(caName == null || "".equals(caName)){
//	    		return modelAction.alertParentInfo(modelAction.getText("名称不能为空") );
//	    	}
//	    	if(caId == null || "".equals(caId)){
//	    		return modelAction.alertParentInfo(modelAction.getText("代码不能为空") );
//	    	}
		String sql1 = "select ID from T_CO_AREA where CA_ID=? ";
		List subList1 = modelService.listDataSql(sql1, new Object[] { caId });
		if (subList1 != null && !subList1.isEmpty()) {
			return modelAction.alertParentInfo(modelAction.getText("您输入的代码已经存在"));
		}
		// 保存车间信息
		try {
			TableDataMapExt cjMap = new TableDataMapExt();
			CommMethod.addSysDefCol(cjMap.getColMap(), modelAction.getUser());
			Map map = cjMap.getColMap();
			map.put("CA_TYPE", caType);
			map.put("CA_PARENTAREAID", caParentAreaId);
			map.put("CA_ID", caId);
			map.put("CA_FEEDER_FLAG", caFeederFlag);
			map.put("CA_NAME", caName);
			map.put("CA_EMP_ROLE", caEmpRole);
			map.put("CA_GROUP", caGroup);
			map.put("CA_STATUS", caStatus);
			if (caType.equals("1")) {
				map.put("CA_STOP_FLAG", caStopFlag);
				if (StringUtils.isNotBlank(caStopTime)) {
					map.put("CA_STOP_TIME", Integer.valueOf(caStopTime));
				}

				map.put("CA_TRACK_FLAG", caTrackFlag);
			}
			if (caType.equals("2")) {
				map.put("CA_TRACK", caTrack);
			}
			if (StringUtils.isNotBlank(caProjectStep)) {
				map.put("CA_PROJECT_STEP", caProjectStep);
			}
			map.put("DATA_AUTH", auth);
			map.put("ID", StringUtils.getUUID());
			cjMap.setTableName("T_CO_AREA");
			modelService.save(cjMap);

			// 往工作中心表插入数据
			if ("2".equals(caType)) {
				String sql2 = "select ID from t_workstation where TW_STATIONSN=? and data_auth=? ";
				List subList2 = modelService.listDataSql(sql2, new Object[] { caId, auth });
				if (subList2 != null && !subList2.isEmpty()) {
					return modelAction.alertParentInfo(modelAction.getText("您输入的工作中心已经存在"));
				}
				TableDataMapExt wkTable = new TableDataMapExt();
				CommMethod.addSysDefCol(wkTable.getColMap(), modelAction.getUser());

				Map wkMap = wkTable.getColMap();
				wkMap.put("TW_STATIONSN", caId);
				wkMap.put("TW_STATIONID", caId);
				wkMap.put("TW_STATIONNAME", caName);
				wkMap.put("TW_LANGUAGE", "A");
				wkMap.put("ID", StringUtils.getUUID());
				wkMap.put("TW_REMARK", null);
				wkMap.put("DATA_AUTH", auth);
				wkTable.setTableName("T_WORKSTATION");

				modelService.save(wkTable);

			}
			// 保存设备关联信息
			if (deviceSeqs != null) {
				TableDataMapExt sbTable = new TableDataMapExt();
				CommMethod.addSysDefCol(sbTable.getColMap(), modelAction.getUser());
				Map sbMap = sbTable.getColMap();
				int dNum = deviceSeqs.length;
				for (int i = 0; i < dNum; i++) {
					sbMap.put("CAD_DEVICE_SEQUENCE", deviceSeqs[i]);
					sbMap.put("CA_ID", caId);
					sbMap.put("CAD_DEVICE_ID", deviceNames[i]);
					sbMap.put("ID", StringUtils.getUUID());
					sbTable.setTableName("T_CO_AREA_DEVICE");
					sbTable.put("DATA_AUTH", auth);
					modelService.save(sbTable);

				}
			}
			// 插入指令关联表 T_WORKSTATION_CMD
			if ("2".equals(caType)) {
				if (orderSeqs != null) {
					TableDataMapExt cmdTable = new TableDataMapExt();
					CommMethod.addSysDefCol(cmdTable.getColMap(), modelAction.getUser());
					Map cmdMap = cmdTable.getColMap();
					int oNum = orderSeqs.length;
					for (int i = 0; i < oNum; i++) {
						cmdMap.put("TW_STATIONSN", gzzxCodes[i]);
						cmdMap.put("TCS_CODE", orderCodes[i]);
						cmdMap.put("ID", StringUtils.getUUID());
						cmdMap.put("DATA_AUTH", auth);
						cmdTable.setTableName("T_WORKSTATION_CMD");
						modelService.save(cmdTable);

					}

				}
			}
			// 保存负责人关联信息表
			if (groups != null) {
				TableDataMapExt fzTable = new TableDataMapExt();
				CommMethod.addSysDefCol(fzTable.getColMap(), modelAction.getUser());
				Map fzMap = fzTable.getColMap();
				int gNum = groups.length;
				for (int i = 0; i < gNum; i++) {
					fzMap.put("CAC_GROUP", groups[i]);
					fzMap.put("CA_ID", caId);
					fzMap.put("CAC_CHARGE_EMP", chargeEmps[i]);
					fzMap.put("CAC_CHARGE_TECH", chargeTechs[i]);
					fzMap.put("CAC_CHARGE_DEVICE", chargeDevices[i]);
					fzMap.put("CAC_CHARGE_QUALITY", chargeQualitys[i]);
					fzMap.put("DATA_AUTH", auth);
					fzMap.put("ID", StringUtils.getUUID());
					fzTable.setTableName("T_CO_AREA_CHARGE");
					modelService.save(fzTable);

				}
			}
		} catch (Exception e) {
			log.error("", e);
			throw new BussException(modelAction.getText("新增失败"));
		}
		modelAction.setDataMap(paraMapc);
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}

}
