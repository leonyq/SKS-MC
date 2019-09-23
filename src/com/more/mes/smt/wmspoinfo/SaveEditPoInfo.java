package com.more.mes.smt.wmspoinfo;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ArrayList;

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
 * 保存修改的采购单以及采购单明细信息
 * @author development
 *
 */
public class SaveEditPoInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
	    String formId = request.getParameter("formId");
	    if (StringUtils.isBlank(formId))
	    {
	      formId = request.getParameter("formIds");
	    }
	    String iframeId = request.getParameter("iframeId");
	    try {
	    	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
	    	String poNo = request.getParameter("poNo");//采购单号
	    	String wpiReceiveTime = request.getParameter("paraMapObj.WPI_RECEIVE_TIME");//到货时间
			String wpiSupCode = request.getParameter("paraMapObj.WPI_SUP_CODE");//供应商
			String wpiMemo = request.getParameter("paraMapObj.WPI_MEMO");//备注
			String[] itemCodes = request.getParameterValues("CI_ITEM_CODE");//物料料号
			String[] itemSeqs = request.getParameterValues("WPD_ITEM_SEQ");//项次
			String[] deliveryDates = request.getParameterValues("WPD_DELIVERY_DATE");//交货日期
			String[] planNums = request.getParameterValues("WPD_PLAN_NUM");//计划数量
			//String[] receiveNums = request.getParameterValues("WPD_RECEIVE_NUM");//计划数量
			String[] memos = request.getParameterValues("WPI_MEMO");//备注
			//判断物料料号是否有相同的
			for(int i=0;i<itemCodes.length;i++){
				for(int j=i+1;j<itemCodes.length;j++){
					if(itemCodes[i].equals(itemCodes[j])){ //如果物料料号相同则判断项次
						if(itemSeqs[i].equals(itemSeqs[j])){
							return modelAction.alertParentInfo(modelAction.getText("相同物料料号,项次需不同"));
						}
					}
				}
			}
			// 修改采购单信息
		 	TableDataMapExt wms = new TableDataMapExt();
		 	wms.setTableName("T_WMS_PO_INFO");
		 	CommMethod.editSysDefCol(wms.getColMap(), modelAction.getUser());
		 	wms.setSqlWhere(" and WPI_PO = ? and DATA_AUTH=? ");
		 	List<Object> wList = new ArrayList<Object>();
            wList.add(poNo);
            wList.add(dataAuth);
            wms.setSqlWhereArgs(wList);
		 	wms.getColMap().put("WPI_RECEIVE_TIME", sdf1.parse(wpiReceiveTime));
		 	wms.getColMap().put("WPI_SUP_CODE", wpiSupCode);
		 	wms.getColMap().put("WPI_MEMO", wpiMemo);
		 	if(dataAuth!=null){
				wms.getColMap().put("DATA_AUTH", dataAuth);
		    }
			modelService.edit(wms);
			//先删除对应明细信息
			TableDataMapExt delwms1 = new TableDataMapExt();
			delwms1.setTableName("T_WMS_PO_DETAIL");
			delwms1.setSqlWhere(" and WPD_PO= ? and DATA_AUTH=? ");
			List<Object> wList1 = new ArrayList<Object>();
            wList1.add(poNo);
            wList1.add(dataAuth);
            delwms1.setSqlWhereArgs(wList1);
		 	modelService.del(delwms1);
		    // 插入采购单明细信息
		 	TableDataMapExt wms1 = new TableDataMapExt();
		 	wms1.setTableName("T_WMS_PO_DETAIL");
		 	for(int i=0;i<itemCodes.length;i++){
		 		wms1.getColMap().clear();
		 		CommMethod.addSysDefCol(wms1.getColMap(), modelAction.getUser());
		 		wms1.getColMap().put("WPD_PO", poNo);
			 	wms1.getColMap().put("WPD_ITEM_CODE", itemCodes[i]);
			 	wms1.getColMap().put("WPD_ITEM_SEQ", Integer.parseInt(itemSeqs[i]));
			 	if(!deliveryDates[i].equals("")){
			 		wms1.getColMap().put("WPD_DELIVERY_DATE", sdf2.parse(deliveryDates[i]));
			 	}
			 	wms1.getColMap().put("WPD_PLAN_NUM", Integer.parseInt(planNums[i]));
			 	//wms1.getColMap().put("WPD_RECEIVE_NUM", Integer.parseInt(receiveNums[i]));
			 	wms1.getColMap().put("WPD_MEMO", memos[i]);
			 	if(dataAuth!=null){
					wms1.getColMap().put("DATA_AUTH", dataAuth);
			    }
			 	modelService.save(wms1);
		 	}
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("修改失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}

}
