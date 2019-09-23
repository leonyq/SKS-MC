package com.more.mes.smt.wmsConfigManager;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 删除其他入库信息
 * @author development
 *
 */
public class ConfigImg implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		try {
			String delId = request.getParameter("delId");//需要删除的id
			String[] strArray = delId.split(",");
			//判断删除的id有没有明细
			String sql2 = "SELECT t.wrd_item_code FROM T_WMS_RECEIVE_DETAIL t WHERE t.WRD_ITEM_ID = ?";
			for(int i=0;i<strArray.length;i++){
				int count = modelService.execSql(sql2, new Object[] {strArray[i]});
			    if (count != 0){
			        return modelAction.alertParentInfo(modelAction.getText("不能删除有入库总明细的入库单"));
			    }
			}
			TableDataMapExt delwms1 = new TableDataMapExt();
			delwms1.setTableName("T_WMS_RECEIVE_ITEM");
			for(int i=0;i<strArray.length;i++){
				delwms1.setSqlWhere(" and ID='" + strArray[i] + "'");
			 	modelService.del(delwms1);
			}
			//删除没有关联的仓库单据信息表数据息  即当该单号所关联的物料全部被删除时删除仓库单据信息表数据
			String sql = "DELETE FROM T_WMS_DOC_INFO WHERE WDI_DOC_NUM IN(" +
					"select t.WRD_DOC_NUM from T_WMS_RECEIVE_DOC t WHERE NOT exists" +
					"(SELECT 1 FROM T_WMS_RECEIVE_ITEM a WHERE a.WRI_DOC_NUM=t.WRD_DOC_NUM))";
		    modelService.execSql(sql, null);
		  //删除没有关联的采购单信息  即当该单号所关联的物料全部被删除时删除采购信息
			String sql3 = "DELETE FROM T_WMS_RECEIVE_DOC WHERE WRD_DOC_NUM IN(" +
					"select t.WRD_DOC_NUM from T_WMS_RECEIVE_DOC t WHERE NOT exists" +
					"(SELECT 1 FROM T_WMS_RECEIVE_ITEM a WHERE a.WRI_DOC_NUM=t.WRD_DOC_NUM))";
		    modelService.execSql(sql3, null);
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("删除失败"), e);
		}
		return modelAction.reloadParent(modelAction.getText("删除成功"));
	}

}