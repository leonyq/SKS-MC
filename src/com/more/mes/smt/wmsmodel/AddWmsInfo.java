package com.more.mes.smt.wmsmodel;

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
 * 新增仓库保存
 * 
 * @author development
 */
public class AddWmsInfo implements FuncService {

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
			String wmsAreaSn = request.getParameter("paraMap1@0#WA_AREA_SN");// 编码
			String wmsAreaName = request.getParameter("paraMap1@0#WA_AREA_NAME");// 名称
			String wmsStorageCapacity = request.getParameter("paraMap1@0#WA_STORAGE_CAPACITY");// 容量
			String wmsRelateOrderset = request.getParameter("paraMap1@0#WA_RELATE_ORDERSET");// 关联指令集
			// String WA_SHELF_SN = request.getParameter("paraMap1@0#WA_SHELF_SN");//货架硬体编码
			String wmsShelfIp = request.getParameter("paraMap1@0#WA_SHELF_IP");// 货架服务IP
			String wmsStorageFlag = request.getParameter("paraMap1@0#WA_STORAGE_FLAG");// 仓库标识
			// String WA_STAROGE_TYPE =
			// request.getParameter("paraMap1@0#WA_STAROGE_TYPE");//货架类别
			String wmsVolume = request.getParameter("paraMap1@0#WA_VOLUME");// 容积
			String wmsMemo = request.getParameter("paraMap1@0#WA_MEMO");// 备注
			// 20180620 CSJ 不良品仓标志
			String badFlag = request.getParameter("paraMap1@0#WA_BAD_FLAG");// 不良品仓标志
			if (badFlag == null || badFlag == "" || badFlag.equals("")) {
				badFlag = "N";
			}
			String sql = "select t.WA_AREA_SN from T_WMS_AREA t where t.WA_AREA_SN=? and t.DATA_AUTH=? ";
			// int count = modelService.execSql(sql, new Object[] {WA_AREA_SN});
			int counts = modelService.countSql(sql, new Object[] { wmsAreaSn, dataAuth });
			if (counts != 0) {
				return modelAction.alertParentInfo(modelAction.getText("编码已存在"));
			}

			// 插入仓库建模信息
			TableDataMapExt wms = new TableDataMapExt();
			wms.setTableName("T_WMS_AREA");
			CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
			wms.getColMap().put("ID", StringUtils.getUUID());
			wms.getColMap().put("WA_AREA_SN", wmsAreaSn);
			wms.getColMap().put("WA_AREA_NAME", wmsAreaName);
			wms.getColMap().put("WA_AREA_TYPE", "1");
			wms.getColMap().put("WA_SUPERIOR_SN", "-1");
			if (StringUtils.isNotBlank(wmsStorageCapacity)) {
				wms.getColMap().put("WA_STORAGE_CAPACITY", Integer.parseInt(wmsStorageCapacity));
			}

			wms.getColMap().put("WA_RELATE_ORDERSET", wmsRelateOrderset);
			// wms.getColMap().put("WA_SHELF_SN", WA_SHELF_SN);
			wms.getColMap().put("WA_SHELF_IP", wmsShelfIp);
			wms.getColMap().put("WA_STORAGE_FLAG", wmsStorageFlag);
			// wms.getColMap().put("WA_STAROGE_TYPE", WA_STAROGE_TYPE);

			if (StringUtils.isNotBlank(wmsVolume)) {
				wms.getColMap().put("WA_VOLUME", Integer.parseInt(wmsVolume));
			}

			wms.getColMap().put("WA_MEMO", wmsMemo);
			wms.getColMap().put("WA_BAD_FLAG", badFlag);
			modelService.save(wms);
			// 插入工作中心信息
			TableDataMapExt work = new TableDataMapExt();
			work.setTableName("T_WORKSTATION");
			CommMethod.addSysDefCol(work.getColMap(), modelAction.getUser());
			work.getColMap().put("ID", StringUtils.getUUID());
			work.getColMap().put("TW_STATIONID", wmsAreaSn);
			work.getColMap().put("TW_STATIONSN", wmsAreaSn);
			work.getColMap().put("TW_STATIONNAME", wmsAreaName);
			work.getColMap().put("TW_LANGUAGE", "A");
			modelService.save(work);
			// 插入工作中心指令明细
			TableDataMapExt work1 = new TableDataMapExt();
			work1.setTableName("T_WORKSTATION_CMD");
			CommMethod.addSysDefCol(work1.getColMap(), modelAction.getUser());
			work1.getColMap().put("ID", StringUtils.getUUID());
			work1.getColMap().put("TW_STATIONSN", wmsAreaSn);
			work1.getColMap().put("TCS_CODE", wmsRelateOrderset);
			modelService.save(work1);
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("新增失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}

}
