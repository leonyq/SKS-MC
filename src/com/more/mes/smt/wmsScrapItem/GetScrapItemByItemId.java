package com.more.mes.smt.wmsScrapItem;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 调拨单通过物料id获取物料详细信息
 * @author development
 *
 */
public class GetScrapItemByItemId implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String itemId = request.getParameter("itemId");//物料id
		String itemCode = request.getParameter("itemCode");
		String dataAuth = request.getParameter("dataAuth");
		String docNum = request.getParameter("docNum");//调拨单号
		String inWh = request.getParameter("inWh");//调入仓库
		String outWh = request.getParameter("outWh");//调出仓库
		String sql = "SELECT t.*,a.ci_item_name,a.ci_item_spec,b.wa_area_name in_wh_name," +
				"c.wa_area_name out_wh_name,d.name," +
				"to_char(t.wad_allot_time,'yyyy-mm-dd hh24:mi:ss') allot_time " +
				"FROM T_WMS_ALLOT_DETAIL t " +
				"LEFT JOIN t_co_item a ON a.ci_item_code=t.wad_item_code " +
				"LEFT JOIN T_WMS_AREA b ON b.WA_AREA_SN=t.wad_in_wh " +
				"LEFT JOIN T_WMS_AREA c ON c.WA_AREA_SN=t.wad_out_wh " +
				"LEFT JOIN SY_USER d ON d.LOGIN_NAME=t.wad_allot_emp ";
		String sqlWhere = "";
		if(StringUtils.isNotBlank(itemId)){
			sqlWhere += " and t.WAD_ITEM_ID = '"+itemId+"'";
		}
		if(StringUtils.isNotBlank(itemCode)){
			sqlWhere += " and t.wad_item_code = '"+itemCode+"'";
		}
		if(StringUtils.isNotBlank(dataAuth)){
			sqlWhere += " and t.DATA_AUTH = '"+dataAuth+"'";
		}
		if(StringUtils.isNotBlank(docNum)){
			sqlWhere += " and t.WAD_DOC_NUM like '%"+docNum+"%'";
		}
		if(StringUtils.isNotBlank(inWh)){
			sqlWhere += " and t.wad_in_wh = '"+inWh+"'";
		}
		if(StringUtils.isNotBlank(outWh)){
			sqlWhere += " and t.wad_out_wh like '%"+outWh+"%'";
		}
		List poList = modelService.listSql(sql, modelAction.getPage(), sqlWhere, null, null,null);
		modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(poList);
		return BaseActionSupport.AJAX;
	}

}
