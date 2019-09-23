package com.more.mes.smt.passstation;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 照片采集---撤销，保存产品sn信息
 * @author Administrator
 *
 */
public class SaveRevokeSnInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String qualityNo = request.getParameter("quNo");
		String sns = request.getParameter("sns");
		String[] sn = sns.split(",");
		int num = sn.length;
		String str = "";
		Object[] obj = new Object[num+1];
		obj[0] = qualityNo;
		for(int i=0;i<num;i++){
			if(i==0){
				str = "?";
			}else{
				str = str + "," + "?";
			}
			obj[i+1] = sn[i];
		}
		String delSql = null;
		if(num==1&&!sn[0].equals("")){
			delSql = "delete from T_WIP_SN_PHOTO_INFO where WSP_QUALITY_NO=? and WSP_SN not in("+str+")";
			modelService.execSql(delSql, obj);
		}else{
			delSql = "delete from T_WIP_SN_PHOTO_INFO where WSP_QUALITY_NO=? ";
			modelService.execSql(delSql, new Object[]{qualityNo} );
		}
		
		return BaseActionSupport.AJAX;
	}

}
