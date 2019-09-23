package com.more.mes.smt.workshop;

import java.util.ArrayList;
import java.util.Arrays;
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
 * 车间建模----修改保存
 * 
 * @author Administrator
 */
public class WorkShopInfoUpdateSave implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		HttpSession session = request.getSession();
		// String iframeId = modelAction.getParaMap().get("iframeId");
		String iframeId = request.getParameter("iframeId");
		String wId = request.getParameter("dataId");// modelAction.getDataId();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String caEmpRole = "";
		String caGroup = "";
		String caType = request.getParameter("paraMapObj.CA_TYPE").trim();
		String caParentAreaId = request.getParameter("paraMapObj.CA_PARENTAREAID").trim();
		String caId = request.getParameter("paraMapObj.CA_ID").trim();
		if ("2".equals(caType)) {
			session.setAttribute("idd", caParentAreaId);
		} else {
			session.setAttribute("idd", caId);
		}
		String caName = request.getParameter("paraMapObj.CA_NAME").trim();
		String caTrack = null;
		if (caType.equals("2")) {
			caEmpRole = request.getParameter("paraMapObj.CA_EMP_ROLE").trim();
			caGroup = request.getParameter("paraMapObj.CA_GROUP").trim();
			caTrack = request.getParameter("paraMapObj.CA_TRACK");// 轨道
		}
		String caTrackFlag = null;
		if (caType.equals("1")) {
			caTrackFlag = request.getParameter("paraMapObj.CA_TRACK_FLAG");// 双轨标志
			if (caTrackFlag == null || caTrackFlag == "") { // 如果线别修改为单轨则需判断子级是否有双轨的工作中心
				String sql = "SELECT T.CA_ID FROM t_co_area t "
						+ "WHERE t.ca_parentareaid=? AND t.ca_track IN(?,?) and t.data_auth=? ";
				int count = modelService.countSql(sql, new Object[] { caId, "A", "B", auth });
				if (count != 0) {
					return modelAction.alertParentInfo(modelAction.getText("子级存在双轨工作中心，不允许修改为单轨"));
				}
				caTrackFlag = "N";
			}
		}
		String caStatus = request.getParameter("paraMapObj.CA_STATUS");
		String stopTime = request.getParameter("paraMapObj.CA_STOP_TIME");
		String caFeederFlag = request.getParameter("paraMapObj.CA_FEEDER_FLAG");
		String caStopFlag = request.getParameter("paraMapObj.CA_STOP_FLAG");
		String caPRrojectStep = request.getParameter("paraMapObj.CA_PROJECT_STEP");
		if (caStatus == null || caStatus == "") {
			caStatus = "N";
		}
		if (caFeederFlag == null || caFeederFlag == "") {
			caFeederFlag = "N";
		}
		if (caStopFlag == null || caStopFlag == "") {
			caStopFlag = "N";
		}

		// 负责人关联信息表的值(新增)
		String[] groups = request.getParameterValues("group");
		String[] chargeEmps = request.getParameterValues("chargeEmp");
		String[] chargeTechs = request.getParameterValues("chargeTech");
		String[] chargeDevices = request.getParameterValues("chargeDevice");
		String[] chargeQualitys = request.getParameterValues("chargeQuality");
		// 修改的值
		String[] cIds = request.getParameterValues("chargeId_n");
		String[] groups1 = request.getParameterValues("group_n");
		String[] chargeEms1 = request.getParameterValues("chargeEmp_n");
		String[] chargeTechs1 = request.getParameterValues("chargetech_n");
		String[] chargeDevices1 = request.getParameterValues("device_n");
		String[] chargeQualitys1 = request.getParameterValues("chargequality_n");
		// 设备信息关联表中的框的值(新增)
		String[] deeditseqs = request.getParameterValues("iptnewseqval");// 设备序号（iptnewseq）
		String[] deviceSeqs1 = request.getParameterValues("deviceSeq");// 设备序号（iptnewseq）
		String[] deviceNames1 = request.getParameterValues("deviceName");
		String[] deviceIds1 = request.getParameterValues("deviceName");
		String[] deviceClass = request.getParameterValues("DEVICE_CLASS");
		int deLength = 0;
		if (null != deviceClass) {
			deLength = deviceClass.length;
			List list = null;
			String[] str;
			if (null != deeditseqs) {
				list = new ArrayList(Arrays.asList(deeditseqs));
			} else {
				list = new ArrayList();
			}

			if (null != deviceSeqs1) {
				list.addAll(Arrays.asList(deviceSeqs1));
				str = new String[list.size()];
				list.toArray(str);
			} else {
				str = new String[list.size()];
				list.toArray(str);
			}

			// System.out.println(str.length);
			for (int i = 0; i < deLength; i++) {
				for (int k = i + 1; k < deLength; k++) {
					if (deviceClass[i].equals(deviceClass[k])) {
						if (str[i].equals(str[k])) {
							return modelAction.alertParentInfo(modelAction.getText("您输入的序号已经存在"));
						}
					}
				}
			}
		}

		// 设备关联信息修改
		String[] dIds = request.getParameterValues("deviceId_n");
		String[] editseqs = request.getParameterValues("iptnewseqval");// 设备序号（iptnewseq）

		// 指令集修改 station code id
		String[] stationIds = request.getParameterValues("orderStation");
		String[] orderCodes = request.getParameterValues("orderCode");

		String[] orderSeqs = request.getParameterValues("orderSeq");

		// if(1!=2){
		// throw new BussException("stop");
		// }

		// 表单验证
		// if(caType == null || caType.equals("")){
		// return modelAction.alertParentInfo(modelAction.getText("类别不能为空") );
		// }
		// if(caName == null || "".equals(caName)){
		// return modelAction.alertParentInfo(modelAction.getText("名称不能为空") );
		// }
		// if(caId == null || "".equals(caId)){
		// return modelAction.alertParentInfo(modelAction.getText("代码不能为空") );
		// }
		try { // 车间信息修改
			List lists = new ArrayList();
			TableDataMapExt workShop = new TableDataMapExt();
			workShop.setTableName("T_CO_AREA");
			workShop.setSqlWhere(" and ID=?");
			lists.add(wId);
			workShop.setSqlWhereArgs(lists);
			workShop.getColMap().put("CA_TYPE", caType);
			workShop.getColMap().put("CA_PARENTAREAID", caParentAreaId);
			workShop.getColMap().put("CA_ID", caId);
			workShop.getColMap().put("CA_NAME", caName);
			workShop.getColMap().put("CA_EMP_ROLE", caEmpRole);
			workShop.getColMap().put("CA_GROUP", caGroup);
			workShop.getColMap().put("CA_STATUS", caStatus);
			workShop.getColMap().put("CA_FEEDER_FLAG", caFeederFlag);
			workShop.getColMap().put("CA_STOP_FLAG", caStopFlag);
			if (StringUtils.isNotBlank(stopTime)) {
				workShop.getColMap().put("CA_STOP_TIME", Integer.valueOf(stopTime));
			}

			workShop.getColMap().put("CA_PROJECT_STEP", caPRrojectStep);
			if (caType.equals("1")) {
				workShop.getColMap().put("CA_TRACK_FLAG", caTrackFlag);
			}
			if (caType.equals("2") && StringUtils.isNotBlank(caTrack)) {
				workShop.getColMap().put("CA_TRACK", caTrack);
			}
			modelService.edit(workShop);
			// 工作中心信息修改
			if ("2".equals(caType)) {
				TableDataMapExt wkTable = new TableDataMapExt();
				wkTable.setTableName("T_WORKSTATION");
				wkTable.setSqlWhere(" and TW_STATIONSN=? and data_auth=? ");
				lists.clear();
				lists.add(caId);
				lists.add(auth);
				wkTable.setSqlWhereArgs(lists);
				wkTable.getColMap().put("TW_STATIONSN", caId);
				wkTable.getColMap().put("TW_STATIONNAME", caName);
				wkTable.getColMap().put("TW_LANGUAGE", "A");
				modelService.edit(wkTable);
			}

			// 设备关联信息新增
			if (deviceSeqs1 != null) {
				TableDataMapExt sbTable = new TableDataMapExt();
				CommMethod.addSysDefCol(sbTable.getColMap(), modelAction.getUser());
				Map sbMap = sbTable.getColMap();
				int dNum = deviceSeqs1.length;
				for (int i = 0; i < dNum; i++) {
					sbMap.put("CAD_DEVICE_SEQUENCE", deviceSeqs1[i]);
					sbMap.put("CA_ID", caId);
					sbMap.put("CAD_DEVICE_ID", deviceIds1[i]);
					sbMap.put("ID", StringUtils.getUUID());
					sbTable.setTableName("T_CO_AREA_DEVICE");
					modelService.save(sbTable);

				}
			}
			// 设备关联信息修改
			if (editseqs != null) {
				TableDataMapExt deviceEdit = new TableDataMapExt();
				int eNum = editseqs.length;
				for (int i = 0; i < eNum; i++) {
					lists.clear();
					deviceEdit.setTableName("T_CO_AREA_DEVICE");
					deviceEdit.setSqlWhere(" and ID=?");
					lists.add(dIds[i]);
					deviceEdit.setSqlWhereArgs(lists);
					deviceEdit.getColMap().put("CA_ID", caId);
					deviceEdit.getColMap().put("CAD_DEVICE_SEQUENCE", editseqs[i]);// CAD_DEVICE_SEQUENCE
					modelService.edit(deviceEdit);

				}
			}
			// 负责人关联信息新增
			if (groups != null && groups.length > 0) {
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
					fzMap.put("ID", StringUtils.getUUID());
					fzTable.setTableName("T_CO_AREA_CHARGE");
					modelService.save(fzTable);
				}
			}
			// 负责人信息关联修改
			if (cIds != null && cIds.length > 0) {
				TableDataMapExt charge = new TableDataMapExt();
				int cNum = cIds.length;
				for (int i = 0; i < cNum; i++) {
					charge.setTableName("T_CO_AREA_CHARGE");
					charge.setSqlWhere(" and ID=?");
					lists.clear();
					lists.add(cIds[i]);
					charge.setSqlWhereArgs(lists);
					charge.getColMap().put("CA_ID", caId);
					charge.getColMap().put("CAC_CHARGE_EMP", chargeEms1[i]);
					charge.getColMap().put("CAC_CHARGE_TECH", chargeTechs1[i]);
					charge.getColMap().put("CAC_CHARGE_DEVICE", chargeDevices1[i]);
					charge.getColMap().put("CAC_CHARGE_QUALITY", chargeQualitys1[i]);
					modelService.edit(charge);

				}
			}
			// 指令集新增
			if (orderSeqs != null) {
				TableDataMapExt orderTable = new TableDataMapExt();
				CommMethod.addSysDefCol(orderTable.getColMap(), modelAction.getUser());
				Map orMap = orderTable.getColMap();
				int oNum = orderSeqs.length;
				for (int i = 0; i < oNum; i++) {
					orMap.put("TW_STATIONSN", stationIds[i]);
					orMap.put("TCS_CODE", orderCodes[i]);
					orMap.put("ID", StringUtils.getUUID());
					orderTable.setTableName("t_Workstation_Cmd");
					modelService.save(orderTable);

				}

			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"));
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");

	}

}