package com.more.buss.eis.bd.basedos.service;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.method.Constants;
/**
 * @Description 保存关联的内容
 * @ClassName SaveItemGroupAndItem
 * @author 
 */
public class SaveItemGroupAndItem  implements FuncService {
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		
		String formId = request.getParameter("formId");
        	if(StringUtils.isBlank(formId)){
          		formId = request.getParameter("formIds");
        	}
       	
        	String iframeId = request.getParameter("iframeId");
		/*try {
			String itemSn = request.getParameter("temp_cig_sn");
			String[] itemCodeList = request.getParameterValues("ci_item_code");
			//先把原先关联的数据记录删除
			TableDataMapExt cdl = new TableDataMapExt();
			if(itemCodeList!=null){
				cdl.setTableName("T_CO_ITEM_CONNECT");
		    	cdl.setSqlWhere(" and cig_sn='" + itemSn + "'");
		    	modelService.del(cdl);
			}
			TableDataMapExt itemTable = new TableDataMapExt();
			 String tempId = null;
			for(int i=0;i<itemCodeList.length;i++){
				tempId = StringUtils.getUUID();
				itemTable.setTableName("T_CO_ITEM_CONNECT");
				itemTable.getColMap().put("id", tempId);
				itemTable.getColMap().put("cig_sn", itemSn);
				itemTable.getColMap().put("cic_item_code", itemCodeList[i]);
				modelService.save(itemTable);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}*/
		//return modelAction.commAjaxFunClassLoadParent(formId,iframeId,Constants.SUCCESS,Constants.OPERATE_TYPE_EDIT);
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("操作成功"), "0");
		//return modelAction.reloadParent(modelAction.getText("操作成功"));
	}

}
