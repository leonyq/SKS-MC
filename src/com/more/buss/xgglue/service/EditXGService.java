package com.more.buss.xgglue.service;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import java.util.List;
public class EditXGService implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		
		String info_id=modelAction.getDataId(); 
		String sql="select info.CTI_TIN_SN,info.CTI_TIN_STATUS,info.CTI_ROHS_FLAG,"+ 
       "info.CTI_LOT,"+
       "info.CTI_WEIGHT,"+
       "info.CTI_INSTOCK_DOC,"+
       "info.CTI_MEMO,"+
       "tool.ASSISTANTTOOLNO CTI_ITEM_CODE,"+
       "t1.value CTI_ASSISTANTTOOLTYPE,"+
       "tool.assistanttoolname CTI_ASSISTANTTOOLNAME,"+
       "tool.assistanttoolspec CTI_ASSISTANTTOOLSPEC,"+
       "tool.TIN_DISCARD_TIME CTI_QULITY_DATE,"+
       "tool.TIN_DURING_TIME CTI_REFLOW_TIME,"+
       "tool.TIN_BACK_TIME CTI_THAWING_CYCLE,"+
       "tool.TIN_OPEN_DISCARD_TIME CTI_QULITY_DATE_OPEN,"+
       "tool.TIN_BACK_TIME CTI_THAWING_TIME_MAX,"+
       "info.CTI_INSTOCK_TIME CTI_INSTOCK_TIME,"+
       "info.CTI_EXPIRE_DATE CTI_EXPIRE_DATE,"+
       "info.CTI_INSTOCK_MAN CTI_INSTOCK_MAN,"+
       "supplier.supplier_name CTI_SUPPLIER"+
  " from T_CO_TIN_INFO info,T_CO_SUPPLIER supplier,T_CO_ASSISTANTTOOL tool"+
       " left join sy_dict_val t1 on t1.code = tool.assistanttooltype"+
 " where info.id = ?"+
  "  and info.CTI_ITEM_CODE = tool.assistanttoolno"+
  "  and t1.dict_code='ASSISTANTTOOL_TYPE'"+
  " and supplier.supplier_code = info.cti_supplier_code";
		
         @SuppressWarnings("unchecked")
		 List<String> edit_data=modelService.listDataSql(sql,new Object[]{info_id});
         modelAction.setDataList(edit_data);
		//modelService.update(arg0)
		return null;
	}

}
