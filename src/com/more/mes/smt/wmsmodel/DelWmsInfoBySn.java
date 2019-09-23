package com.more.mes.smt.wmsmodel;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;

import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 通过仓库编码删除仓库信息
 * @author development
 *
 */
public class DelWmsInfoBySn implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		try {
			String areaSn = request.getParameter("areaSn");//编码
			String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
			List list = new ArrayList();
			// 删除仓库建模信息     当前级别的
			TableDataMapExt wms = new TableDataMapExt();
			wms.setTableName("T_WMS_AREA");
			wms.setSqlWhere(" and WA_AREA_SN=? and DATA_AUTH=? ");
			list.add(areaSn);
			list.add(dataAuth);
			wms.setSqlWhereArgs(list);
			modelService.del(wms);
			// 删除仓库建模信息     当前级别及下面所有的
			TableDataMapExt wms1 = new TableDataMapExt();
			wms1.setTableName("T_WMS_AREA");
			wms1.setSqlWhere(" and WA_SUPERIOR_SN=? and DATA_AUTH=? ");
			wms1.setSqlWhereArgs(list);
			modelService.del(wms1);
			//删除工作中心  T_WORKSTATION
			TableDataMapExt work = new TableDataMapExt();
			work.setTableName("T_WORKSTATION");
			work.setSqlWhere(" and TW_STATIONSN=? and DATA_AUTH=? ");
			work.setSqlWhereArgs(list);
			modelService.del(work);
			//删除工作中心指令明细  T_WORKSTATION
			TableDataMapExt work1 = new TableDataMapExt();
			work1.setTableName("T_WORKSTATION_CMD");
			work1.setSqlWhere(" and TW_STATIONSN=? and DATA_AUTH=?  ");
			work1.setSqlWhereArgs(list);
			modelService.del(work1);
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("删除失败"), e);
		}
		return modelAction.reloadParent(modelAction.getText("删除成功"));
	}

}
