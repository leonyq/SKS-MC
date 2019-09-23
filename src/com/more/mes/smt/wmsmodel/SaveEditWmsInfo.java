package com.more.mes.smt.wmsmodel;

import java.util.ArrayList;
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

/**
 * 保存修改的仓库信息
 * 
 * @author development
 *
 */
public class SaveEditWmsInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			String wmsAreaSn = request.getParameter("WA_AREA_SN");// 编码
			String wmsAreaType = request.getParameter("WA_AREA_TYPES");// 编码
			String wmsSuperiorSn = request.getParameter("WA_SUPERIOR_SN");// 上级编码
			String wmsAreaName = request.getParameter("paraMap1@0#WA_AREA_NAME");// 名称
			String wmsStorageCapacity = request.getParameter("paraMap1@0#WA_STORAGE_CAPACITY");// 容量
			String wmsRelateOrderset = request.getParameter("paraMap1@0#WA_RELATE_ORDERSET");// 关联指令集
			String wmsShelfSn = request.getParameter("paraMap1@0#WA_SHELF_SN");// 货架硬体编码
			String wmsShelfIp = request.getParameter("paraMap1@0#WA_SHELF_IP");// 货架服务IP
			String wmsStorageFlag = request.getParameter("paraMap1@0#WA_STORAGE_FLAG");// 仓库标识
			String wmsStorageType = request.getParameter("paraMap1@0#WA_STAROGE_TYPE");// 货架类别
			String wmsVolume = request.getParameter("paraMap1@0#WA_VOLUME");// 容积
			String wmsMemo = request.getParameter("paraMap1@0#WA_MEMO");// 备注
			String storeyNo = request.getParameter("paraMap1@0#WA_STOREY_NO");// 货位层数
			String wmsFace = request.getParameter("paraMap1@0#WA_FACE");// 面别
			String badFlag = request.getParameter("paraMap1@0#WA_BAD_FLAG");
			if (badFlag == null || badFlag == "" || badFlag.equals("")) {
				badFlag = "N";
			}
			// String WA_FACE = request.getParameter("face");//面别
			if (wmsStorageType != null && wmsStorageType.equals("1")) { // 如果为电子货架则校验货架硬体编码
				String querySql = "select t.WA_SHELF_SN from T_WMS_AREA t where t.WA_SHELF_SN=? and t.WA_SUPERIOR_SN=? and t.WA_AREA_SN!=? and t.DATA_AUTH=? ";
				// int count1 = modelService.execSql(querySql, new Object[]
				// {WA_SHELF_SN,WA_SUPERIOR_SN,WA_AREA_SN});
				int count1 = modelService.countSql(querySql,
						new Object[] { wmsShelfSn, wmsSuperiorSn, wmsAreaSn, dataAuth });
				if (count1 != 0) {
					return modelAction.alertParentInfo(modelAction.getText("货架硬体编码已存在"));
				}
			}

			// 修改仓库建模信息
			TableDataMapExt wms = new TableDataMapExt();
			List list = new ArrayList();
			wms.setTableName("T_WMS_AREA");
			CommMethod.editSysDefCol(wms.getColMap(), modelAction.getUser());
			wms.setSqlWhere(" and WA_AREA_SN=? and DATA_AUTH=? ");
			list.add(wmsAreaSn);
			list.add(dataAuth);
			wms.setSqlWhereArgs(list);
			wms.getColMap().put("WA_AREA_NAME", wmsAreaName);
			if (StringUtils.isNotBlank(wmsStorageCapacity)) {
				wms.getColMap().put("WA_STORAGE_CAPACITY", Integer.parseInt(wmsStorageCapacity));
			}
			if (wmsAreaType.equals("3")) {
				wms.getColMap().put("WA_STOREY_NO", Double.valueOf(storeyNo));
				wms.getColMap().put("WA_FACE", wmsFace);
			}
			wms.getColMap().put("WA_RELATE_ORDERSET", wmsRelateOrderset);
			wms.getColMap().put("WA_SHELF_SN", wmsShelfSn);
			wms.getColMap().put("WA_SHELF_IP", wmsShelfIp);
			wms.getColMap().put("WA_STORAGE_FLAG", wmsStorageFlag);
			wms.getColMap().put("WA_STAROGE_TYPE", wmsStorageType);
			if (StringUtils.isNotBlank(wmsVolume)) {
				wms.getColMap().put("WA_VOLUME", Integer.parseInt(wmsVolume));
			}
			wms.getColMap().put("WA_BAD_FLAG", badFlag);
			wms.getColMap().put("WA_MEMO", wmsMemo);
			modelService.edit(wms);
			// 修改工作中心信息
			TableDataMapExt work = new TableDataMapExt();
			work.setTableName("T_WORKSTATION");
			CommMethod.editSysDefCol(work.getColMap(), modelAction.getUser());
			work.setSqlWhere(" and TW_STATIONSN=? and DATA_AUTH=? ");
			list.clear();
			list.add(wmsAreaSn);
			list.add(dataAuth);
			work.setSqlWhereArgs(list);
			work.getColMap().put("TW_STATIONNAME", wmsAreaName);
			modelService.edit(work);
			// 修改工作中心指令明细
			TableDataMapExt work1 = new TableDataMapExt();
			work1.setTableName("T_WORKSTATION_CMD");
			CommMethod.editSysDefCol(work1.getColMap(), modelAction.getUser());
			work1.setSqlWhere(" and TW_STATIONSN=? and DATA_AUTH=? ");
			list.clear();
			list.add(wmsAreaSn);
			list.add(dataAuth);
			work1.setSqlWhereArgs(list);
			work1.getColMap().put("TCS_CODE", wmsRelateOrderset);

			modelService.edit(work1);
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");

	}

}
