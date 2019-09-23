package com.more.mes.smt.wmspoinfo;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 删除采购单信息
 * @author development
 *
 */
public class DelPoInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		try {
			String delId = request.getParameter("delId");//需要删除的id
			String[] strArray = delId.split(",");
			TableDataMapExt delwms1 = new TableDataMapExt();
			delwms1.setTableName("T_WMS_PO_DETAIL");
			for(int i=0;i<strArray.length;i++){
				delwms1.setSqlWhere(" and ID=? ");
				List<Object> wList = new ArrayList<Object>();
	            wList.add(strArray[i]);
	            delwms1.setSqlWhereArgs(wList);
			 	modelService.del(delwms1);
			}
			//删除没有关联的采购单信息
			String sql = "DELETE FROM T_WMS_PO_INFO WHERE wpi_po IN(" +
					"select t.wpi_po from T_WMS_PO_INFO t WHERE NOT exists" +
					"(SELECT 1 FROM T_WMS_PO_DETAIL a WHERE a.wpd_po=t.wpi_po))";
		    modelService.execSql(sql, null);
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("删除失败"), e);
		}
		
		return modelAction.reloadParent(modelAction.getText("删除成功"));
	}

}
