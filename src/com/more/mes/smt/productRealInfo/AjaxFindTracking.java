package com.more.mes.smt.productRealInfo;

import java.util.ArrayList;
import java.util.List;


import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class AjaxFindTracking implements FuncService {
	
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String moNumber = modelAction.getParaMap().get("myMoNumber");
		String groupCode = modelAction.getParaMap().get("myGroupCode");
		String groupSeq = modelAction.getParaMap().get("myGroupSeq");
		String dataAuth = modelAction.getRequest().getParameter("dataAuth");
		//根据制令单，工序，工序顺序获取产品在制信息
        String querySql = "SELECT T.WT_FINISH_FLAG,ROWNUM,T.ID,T.WT_MO_NUMBER,T.WT_GROUP_CODE,T.WT_GROUP_SEQ,T.WT_AREA_SN,T.WT_SN,T.WT_NUM,T.WT_NG_NUM,T.WT_SCRAP_NUM," +
        		"T.WT_IN_TIME,T.WT_LOT,T.WT_ERROR_FLAG,a.NAME " +
        		"FROM T_WIP_TRACKING T "+
        		" left join sy_user a on (a.login_name = t.WT_EMP or a.id=t.WT_EMP)";
        String sqlWhere=" and T.WT_MO_NUMBER = ? AND T.WT_GROUP_CODE = ? AND T.WT_GROUP_SEQ = ? AND T.DATA_AUTH = ? ";
        List listParam = new ArrayList();
        listParam.add(moNumber);
        listParam.add(groupCode);
        listParam.add(groupSeq);
        listParam.add(dataAuth);
        String orderSql=" order by WT_IN_TIME";
        List itemList = modelService.listSql(querySql, modelAction.getPage(), sqlWhere, listParam, orderSql,null);
        modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}


}
