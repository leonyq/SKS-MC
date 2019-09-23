package com.more.buss.eis.pt.itemmgr.bommgr.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class BomLookDetailService implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		
		HttpServletRequest request = modelAction.getRequest();
		String dataId=modelAction.getDataId();
		//BOM
		/*String sql="select * from t_co_bom where rownum=1 and id=?";
		Map pMap = modelService.queryForMap(sql, new Object[] {dataId});
		if(pMap!=null){
			modelAction.setDataMap(pMap);
		}*/
		//BOM_DETAIL
		String sql="select t.*,t2.ci_item_name as CBD_ITEM_NAME,t2.ci_item_spec as CBD_ITEM_SPEC "
				+" from t_co_bom_detail t left join t_co_item t2 on t.cbd_item_code=t2.ci_item_code where cb_bomid=?";
		List list=modelService.listDataSql(sql, new Object[] {dataId});
		if(list.size()>0){
			modelAction.setDataList(list);
		}
		//替代料
		sql="select t.*,t2.ci_item_name,t3.ci_item_name as cr_item_replace_name,"
			+"t3.ci_item_spec as cr_item_replace_spec,t.CR_STATUS from T_CO_ITEM_REPLACE t "
			+"left join t_co_item t2 on t.cr_item_mian=t2.ci_item_code " 
			+"left join t_co_item t3 on t.cr_item_replace=t3.ci_item_code "
			+"where t.cr_item_mian in( select CBD_ITEM_CODE from T_CO_BOM_DETAIL where cb_bomid=? )";
		List rplist=modelService.listDataSql(sql, new Object[] {dataId});
		if(rplist.size()>0){
			modelAction.setDataList1(rplist);
		}
		return modelAction.ActionForward("/buss/bussModel.ms?exeid=" + modelAction.getJSP_VIEW_ID());// 方式1
	}

}
