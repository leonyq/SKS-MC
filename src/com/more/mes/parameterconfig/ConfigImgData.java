package com.more.mes.parameterconfig;

import java.util.List;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 参数配置---管控配置----获取图片信息
 * 
 * @author development
 *
 */
public class ConfigImgData implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		try {

			String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
			String sql = "select t.id ,t.cfi_func_name,t.cfi_photo,t.cfi_path from T_CO_FUNC_INFO t where data_auth = ? ";
			List listData = modelService.listDataSql(sql, new Object[] { dataAuth });
			modelAction.setAjaxList(listData);
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("查询失败"), e);
		}
		return BaseActionSupport.AJAX;
	}

}
