package com.more.mes.parameterconfig;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 参数配置---管控配置----保存
 * 
 * @author development
 *
 */
public class ConfigDataDetail implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		Map<String, Object> map = new HashMap<String, Object>();
		String dataAuth = modelAction.getRequest().getParameter("dataAuth");
		String userId = modelAction.getSessionUser().getId();
		try {
			String editType = request.getParameter("editType");
			if ("1".equals(editType)) {

				String sql = "select t.id,t.config_data from T_CO_CONFIG_DATA t where t.DATA_AUTH = ? ";
				List listData = modelService.listDataSql(sql, new Object[] { dataAuth });
				modelAction.setAjaxList(listData);

			} else {
				List listData = new ArrayList<>();

				String sql = "select t.id,t.config_data from T_CO_CONFIG_DATA t where t.DATA_AUTH = ? ";
				listData = modelService.listDataSql(sql, new Object[] { dataAuth });

				String dataInfo = request.getParameter("dataInfo");
				TableDataMapExt config = new TableDataMapExt();
				config.setTableName("T_CO_CONFIG_DATA");
				config.getColMap().put("DATA_AUTH", dataAuth);
				if (listData.size() == 0) {
					config.getColMap().put("ID", com.more.fw.core.common.method.StringUtils.getUUID());
					config.getColMap().put("CONFIG_DATA", dataInfo);
					modelService.save(config);
				} else {
					config.setSqlWhere(" and 1=1 and DATA_AUTH=? ");
					config.getSqlWhereArgs().add(dataAuth);
					config.getColMap().put("CONFIG_DATA", dataInfo);
					modelService.edit(config);
				}

				map.put("json", "{\"result\":\"" + "success" + "\"}");
				modelAction.setAjaxMap(map);

			}

		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("查询失败"), e);
		}
		return BaseActionSupport.AJAX;
	}

}
