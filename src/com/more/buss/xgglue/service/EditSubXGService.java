package com.more.buss.xgglue.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
public class EditSubXGService implements FuncService{
	private final Log log = LogFactory.getLog(this.getClass());
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request=modelAction.getRequest();
		TableDataMapExt td=new TableDataMapExt();
		String info_id=modelAction.getDataId();
		String CTI_INSTOCK_DOC=request.getParameter("CTI_INSTOCK_DOC");//入库单号
		String CTI_WEIGHT=request.getParameter("CTI_WEIGHT");//重量
		//状态
		String CTI_TIN_STATUS=request.getParameter("CTI_TIN_STATUS");
		//标志
		String CTI_ROHS_FLAG=request.getParameter("paraMapObj.CTI_ROHS_FLAG");
		
		String CTI_MEMO=request.getParameter("paraMapObj.CTI_MEMO");//备注 
		@SuppressWarnings("unchecked")
		Map<String, String> calmap=td.getColMap();
		try{
			td.setTableName("T_CO_TIN_INFO");
			td.setSqlWhere("and ID='"+info_id+"'");
			calmap.put("CTI_INSTOCK_DOC", CTI_INSTOCK_DOC);
			calmap.put("CTI_WEIGHT", CTI_WEIGHT);
			calmap.put("CTI_TIN_STATUS", CTI_TIN_STATUS);   
			if(CTI_MEMO.equals("")){
				calmap.put("CTI_MEMO", "");
			}else{
				calmap.put("CTI_MEMO", CTI_MEMO);
			}
			
			if(!"Y".equals(CTI_ROHS_FLAG)){
				calmap.put("CTI_ROHS_FLAG", "N");
			}else{
				calmap.put("CTI_ROHS_FLAG", CTI_ROHS_FLAG);
			}
			
			modelService.edit(td);
		}catch(Exception e){
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"),e);
		}
		
		return modelAction.reloadParent(modelAction.getText("修改成功"));
	}

}
