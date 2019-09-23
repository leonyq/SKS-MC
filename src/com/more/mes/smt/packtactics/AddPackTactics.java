package com.more.mes.smt.packtactics;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
 * 保存新增的包装策略配置信息
 * 
 * @author development
 *
 */
public class AddPackTactics implements FuncService {

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
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String projectId = request.getParameter("paraMapObj.PTC_PROJECT_ID");// 工单
			String modelCode = request.getParameter("paraMapObj.PTC_MODEL_CODE");// 机种
			String custCode = request.getParameter("paraMapObj.PTC_CUST_CODE");// 客户
			String ptcSn = request.getParameter("paraMapObj.PTC_SN");// 策略编码
			String storageCode = request.getParameter("STORAGE_CODE");// 线别
			Map<String, String> maps = new HashMap<String, String>();
			String sql = "select ID from T_PACK_TACTICS_CONNECT_INFO where 1=1 and PTC_SN = ? and data_auth = ? and  ";
			Map map = null;
			if (StringUtils.isNotBlank(projectId)) {
				sql += " PTC_PROJECT_ID=?";
				map = modelService.queryForMap(sql, new Object[] { ptcSn, dataAuth, projectId });
			}
			if (StringUtils.isNotBlank(modelCode)) {
				sql += " PTC_MODEL_CODE=?";
				map = modelService.queryForMap(sql, new Object[] { ptcSn, dataAuth, modelCode });
			}
			if (StringUtils.isNotBlank(custCode)) {
				sql += " PTC_CUST_CODE=?";
				map = modelService.queryForMap(sql, new Object[] { ptcSn, dataAuth, custCode });
			}
			if (StringUtils.isNotBlank(storageCode)) {
				sql += " PTC_AREA_SN=?";
				map = modelService.queryForMap(sql, new Object[] { ptcSn, dataAuth, storageCode });
			}

			// sql = "select ID from T_PACK_TACTICS_CONNECT_INFO where (PTC_PROJECT_ID=? " +
			// "or PTC_MODEL_CODE=? or PTC_CUST_CODE=? or PTC_AREA_SN =?)";
			// map =modelService.queryForMap(sql,new
			// Object[]{PTC_PROJECT_ID,PTC_MODEL_CODE,PTC_CUST_CODE,STORAGE_CODE});

			if (map != null && !map.isEmpty()) { // 有数据提示已存在
				return modelAction.alertParentInfo(modelAction.getText("该包装策略配置已存在"));
			} else {
				String querySql = "select PTI_NAME from T_PACK_TACTICS_INFO where PTI_SN=? and data_auth=? ";
				Map map1 = modelService.queryForMap(querySql, new Object[] { ptcSn, dataAuth });
				TableDataMapExt tactics = new TableDataMapExt();
				tactics.setTableName("T_PACK_TACTICS_CONNECT_INFO");
				CommMethod.addSysDefCol(tactics.getColMap(), modelAction.getUser());
				tactics.getColMap().put("ID", StringUtils.getUUID());
				tactics.getColMap().put("PTC_SN", ptcSn);
				tactics.getColMap().put("PTC_NAME", map1.get("PTI_NAME"));
				tactics.getColMap().put("PTC_PROJECT_ID", projectId);
				tactics.getColMap().put("PTC_MODEL_CODE", modelCode);
				tactics.getColMap().put("PTC_CUST_CODE", custCode);
				tactics.getColMap().put("PTC_TIME", sdf1.parse(sdf1.format(new Date())));
				tactics.getColMap().put("PTC_EMP", CommMethod.getSessionUser().getId());
				tactics.getColMap().put("PTC_AREA_SN", storageCode);
				// if(dataAuth!=null){
				// tactics.getColMap().put("DATA_AUTH", dataAuth);
				// }
				modelService.save(tactics);
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("新增失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), "0");
	}

}
