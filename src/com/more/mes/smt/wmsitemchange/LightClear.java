package com.more.mes.smt.wmsitemchange;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import bsh.This;

/**
 * @Description 物料锁定---解锁
 * @ClassName LightClear
 * @author WZY
 * 
 */
public class LightClear implements FuncService {

	private final Log log = LogFactory.getLog(This.class);

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		String snStr = request.getParameter("snStr");
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String[] snArray = snStr.split(",");
		try {
			int num = snArray.length;
			for (int i = 0; i < num; i++) {
				String wmlItemSn = snArray[i];
				// 修改T_WMS_STOCK_INFO（仓库库存信息表）的状态
				TableDataMapExt tableDataMapExt = new TableDataMapExt();
				tableDataMapExt.setTableName("T_WMS_STOCK_INFO");
				tableDataMapExt.setSqlWhere("and WSI_ITEM_SN = ? and DATA_AUTH=? ");
				List<Object> wList = new ArrayList<Object>();
				wList.add(wmlItemSn);
				wList.add(auth);
				tableDataMapExt.setSqlWhereArgs(wList);
				tableDataMapExt.getColMap().put("WSI_STOCK_FLAG", "2");
				modelService.edit(tableDataMapExt);

				// 删除 仓库备料亮灯中间信息表（T_WMS_MID_LIGHT_INFO）的信息
				TableDataMapExt delLight = new TableDataMapExt();
				delLight.setTableName("T_WMS_MID_LIGHT_INFO");
				delLight.setSqlWhere("and WML_ITEM_SN = ? and DATA_AUTH=? ");
				delLight.setSqlWhereArgs(wList);
				modelService.del(delLight);

			}

		} catch (Exception e) {
			// TODO: handle exception
			log.error(e);
			throw new BussException(modelAction.getText("解锁失败"), e);
		}

		return BaseActionSupport.AJAX;
	}

}
