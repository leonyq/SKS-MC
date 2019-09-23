package com.more.mes.smt.packtactics;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
 * 保存修改的包装策略配置信息
 * 
 * @author development
 *
 */
public class SaveEidtPackTactics implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String formId = request.getParameter("formId");
		String dataId = request.getParameter("dataId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String projectId = request.getParameter("paraMapObj.PTC_PROJECT_ID");// 工单
			String modelCode = request.getParameter("paraMapObj.PTC_MODEL_CODE");// 机种
			String custCode = request.getParameter("paraMapObj.PTC_CUST_CODE");// 客户
			String ptcSn = request.getParameter("paraMapObj.PTC_SN");
			String storageCode = request.getParameter("STORAGE_CODE");// 策略编码
			int ptcType = Integer.parseInt(request.getParameter("paraMapObj.PTC_TYPE"));// 类型

			String sql = "select ID from T_PACK_TACTICS_CONNECT_INFO where ptc_sn = ? and data_auth = ? and id <> ? ";

			Map map = null;
			if (StringUtils.isNotBlank(projectId)) {
				sql += " and PTC_PROJECT_ID=?";
				map = modelService.queryForMap(sql, new Object[] { ptcSn, dataAuth, dataId, projectId });
			}
			if (StringUtils.isNotBlank(modelCode)) {
				sql += "and PTC_MODEL_CODE=?";
				map = modelService.queryForMap(sql, new Object[] { ptcSn, dataAuth, dataId, modelCode });
			}
			if (StringUtils.isNotBlank(custCode)) {
				sql += "and PTC_CUST_CODE=?";
				map = modelService.queryForMap(sql, new Object[] { ptcSn, dataAuth, dataId, custCode });
			}
			if (StringUtils.isNotBlank(storageCode)) {
				sql += "and PTC_AREA_SN=?";
				map = modelService.queryForMap(sql, new Object[] { ptcSn, dataAuth, dataId, storageCode });
			}

			if (map != null) {
				return modelAction.alertParentInfo(modelAction.getText("该包装策略配置已存在"));
			}

			// String sql = "select ID from T_PACK_TACTICS_CONNECT_INFO where
			// PTC_PROJECT_ID=? " +
			// "or PTC_MODEL_CODE=? or PTC_CUST_CODE=? or PTC_AREA_SN =?";
			// Map map =modelService.queryForMap(sql,new
			// Object[]{PTC_PROJECT_ID,PTC_MODEL_CODE,PTC_CUST_CODE,STORAGE_CODE});
			// if(map!=null){ //有数据则更新
			String querySql = "select PTI_NAME from T_PACK_TACTICS_INFO where PTI_SN=? and data_auth=? ";

			Map map1 = modelService.queryForMap(querySql, new Object[] { ptcSn, dataAuth });
			TableDataMapExt tactics = new TableDataMapExt();
			tactics.setTableName("T_PACK_TACTICS_CONNECT_INFO");
			CommMethod.editSysDefCol(tactics.getColMap(), modelAction.getUser());
			tactics.setSqlWhere(" and ID = ?");
			List list = new ArrayList();
			list.add(dataId);
			tactics.setSqlWhereArgs(list);
			tactics.getColMap().put("PTC_SN", ptcSn);
			tactics.getColMap().put("PTC_NAME", map1.get("PTI_NAME"));
			tactics.getColMap().put("PTC_TIME", sdf1.parse(sdf1.format(new Date())));
			tactics.getColMap().put("PTC_EMP", CommMethod.getSessionUser().getId());
			tactics.getColMap().put("PTC_PROJECT_ID", "");
			tactics.getColMap().put("PTC_MODEL_CODE", "");
			tactics.getColMap().put("PTC_CUST_CODE", "");
			tactics.getColMap().put("PTC_AREA_SN", "");
			switch (ptcType) {
			case 1:
				tactics.getColMap().put("PTC_PROJECT_ID", projectId);
				break;
			case 2:
				tactics.getColMap().put("PTC_MODEL_CODE", modelCode);
				break;
			case 3:
				tactics.getColMap().put("PTC_CUST_CODE", custCode);
				break;
			case 4:
				tactics.getColMap().put("PTC_AREA_SN", storageCode);
				break;
			}

			// tactics.getColMap().put("PTC_AREA_SN", STORAGE_CODE);
			// if(dataAuth!=null){
			// tactics.getColMap().put("DATA_AUTH", dataAuth);
			// }
			modelService.edit(tactics);
// 			}else{
// 				String querySql = "select PTI_NAME from T_PACK_TACTICS_INFO where PTI_SN=? and data_auth=? ";
// 				Map map1 =modelService.queryForMap(querySql,new Object[]{PTC_SN,dataAuth});
// 				TableDataMapExt tactics = new TableDataMapExt();
// 				tactics.setTableName("T_PACK_TACTICS_CONNECT_INFO");
// 			 	CommMethod.addSysDefCol(tactics.getColMap(), modelAction.getUser());
// 			 	tactics.getColMap().put("ID", StringUtils.getUUID());
// 			 	tactics.getColMap().put("PTC_SN", PTC_SN);
// 			 	tactics.getColMap().put("PTC_NAME", map1.get("PTI_NAME"));
// 			 	tactics.getColMap().put("PTC_PROJECT_ID", PTC_PROJECT_ID);
// 			 	tactics.getColMap().put("PTC_MODEL_CODE", PTC_MODEL_CODE);
// 			 	tactics.getColMap().put("PTC_CUST_CODE", PTC_CUST_CODE);
// 			 	tactics.getColMap().put("PTC_TIME", sdf1.parse(sdf1.format(new Date())));
// 			 	tactics.getColMap().put("PTC_EMP", CommMethod.getSessionUser().getId());
// 			 		tactics.getColMap().put("PTC_AREA_SN", STORAGE_CODE);
// 			 //	if(dataAuth!=null){
// 			// 		tactics.getColMap().put("DATA_AUTH", dataAuth);
// 			//    }
// 			 	modelService.save(tactics);
// 			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}

}
