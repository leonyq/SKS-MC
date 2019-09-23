package com.more.mes.smt.wmsallot;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 关结调拨单
 * @author development
 *
 */
public class CloseAllotDoc implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		try {
			String delId = request.getParameter("delId");//需要删除的id
			String[] strArray = delId.split(","); 
			String handoverFlag=null;//交接标志
			String sql1="SELECT WDT_HANDOVER_FLAG FROM T_WMS_DOC_TYPE WHERE WDT_TYPE_SN=? AND DATA_AUTH=? AND ROWNUM=1";
			List<Map> itemList1 = modelService.listDataSql(sql1, new Object[] {"DJ16",auth });
			if(null!=itemList1 && itemList1.size()>0) {
			handoverFlag=(String) itemList1.get(0).get("WDT_HANDOVER_FLAG");
			}
			//根据id获取单据号
			 sql1 = "select t.WAI_DOC_NUM,t.WAI_STATUS from T_WMS_ALLOT_ITEM t where t.id = ?";
			List<Map> itemList = null;
			String docNum = null;
			String waiStatus = null;
			
			
			TableDataMapExt delwms1 = new TableDataMapExt();
			delwms1.setTableName("T_WMS_ALLOT_ITEM");
			TableDataMapExt receive = new TableDataMapExt();
		 	receive.setTableName("T_WMS_ALLOT_DOC");
		 	TableDataMapExt wms = new TableDataMapExt();
		 	wms.setTableName("T_WMS_DOC_INFO");
		 	String	sql2;
		 	int count =strArray.length;
			for(int i=0;i<count;i++){
				itemList = modelService.listDataSql(sql1, new Object[] { strArray[i] });
				if(null!=itemList && itemList.size()>0) {
					docNum = (String) itemList.get(0).get("WAI_DOC_NUM");
					waiStatus= (String) itemList.get(0).get("WAI_STATUS");
					
					if(waiStatus.equals("2")){
						if(handoverFlag.equals("Y")) {
							 return modelAction.alertParentInfo(modelAction.getText("单据未交接"));
						}
					}
					
					sql2=" UPDATE T_WMS_STOCK_INFO SET WSI_STOCK_FLAG = ? "
						+ " WHERE WSI_ITEM_SN IN ( "
						+ " SELECT WAD_ITEM_SN FROM  T_WMS_ALLOT_DETAIL "
						+ " WHERE WAD_DOC_NUM =?  AND DATA_AUTH=? ) "
						+ " AND DATA_AUTH=? ";
					modelService.execSql(sql2, new Object[] {"2",docNum,auth,auth });
					
					delwms1.setSqlWhere(" and WAI_DOC_NUM=? and DATA_AUTH=? ");
					List<Object> wList = new ArrayList<Object>();
	                wList.add(docNum);
	                wList.add(auth);
	                delwms1.setSqlWhereArgs(wList);
					delwms1.getColMap().put("WAI_STATUS", "3");
					modelService.edit(delwms1);
					receive.setSqlWhere(" and WAD_DOC_NUM=? and DATA_AUTH=? ");
					receive.setSqlWhereArgs(wList);
					receive.getColMap().put("WAD_STATUS", "3");
					modelService.edit(receive);
					wms.setSqlWhere(" and WDI_DOC_NUM=? and DATA_AUTH=? ");
					wms.setSqlWhereArgs(wList);
					wms.getColMap().put("WDI_STATUS", "3");
					modelService.edit(wms);
				}
				
				
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("关结失败"), e);
		}
		return modelAction.reloadParent(modelAction.getText("关结成功"));
	}

}
