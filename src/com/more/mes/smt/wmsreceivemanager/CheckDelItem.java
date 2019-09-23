package com.more.mes.smt.wmsreceivemanager;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 修改页面判断要删除的物料有没有明细信息
 * @author development
 *
 */
public class CheckDelItem implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String delId = request.getParameter("checkId");//需要删除的id
		String[] strArray=new String[] {};
        if(delId!=null && !delId.equals("")) {
    	  strArray = delId.split(",");
        }
		Map<String, String> map = new HashMap<String, String>();
		String sql = "select * from T_WMS_RECEIVE_DETAIL where WRD_ITEM_ID=? ";
		for(int i=0;i<strArray.length;i++){
			int count = modelService.countSql(sql,new Object[] {strArray[i]});
			if(count!=0){ //有明细信息
				map.put("returnMsg", "addSucc");
				break;
			}else{
				map.put("returnMsg", "addError");
			}
		}
		return modelAction.outJson(CommMethod.bean2Json(map),Constants.CHARACTER_ENCODING_UTF_8);
	}

}
