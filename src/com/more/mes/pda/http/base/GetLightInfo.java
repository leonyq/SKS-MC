package com.more.mes.pda.http.base;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.pda.service.PdaBaseServiceUtils;
import com.more.mes.pda.service.base.PdaServiceUtils;

public class GetLightInfo  extends InterfaceLog implements IhttpServiceJosn{
	public ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");
	@Override
	public String exeFunc(HttpCoreService service) {
		// TODO Auto-generated method stub
		Map map = new HashMap<>();
		try {
			String DOC_NUMBER = StringUtils.toString(service.getParamTo().get("DOC_NUMBER"));
			String strOrgCode  = StringUtils.toString(service.getParamTo().get("strOrgCode"));//组织机构
			String sqlStr="SELECT T.WML_DOC_NUM,T.WML_ITEM_SN,T.WML_ITEM_CODE,\r\n" + 
					"T.WML_ITEM_NUM,A.WA_AREA_NAME,B.WA_AREA_NAME,C.WA_AREA_NAME\r\n" + 
					"FROM T_WMS_MID_LIGHT_INFO T\r\n" + 
					"LEFT JOIN T_WMS_AREA A ON T.WML_WH_CODE=A.WA_AREA_SN\r\n" + 
					"LEFT JOIN T_WMS_AREA B ON T.WML_DISTRICT_CODE=B.WA_AREA_SN\r\n" + 
					"LEFT JOIN T_WMS_AREA C ON T.WML_STORAGE_CODE=C.WA_AREA_SN\r\n" + 
					"WHERE T.WML_DOC_NUM=? and T.data_auth=?";
			PdaServiceUtils pdaServiceUtils = new PdaServiceUtils();
			Object[] params=new Object[] {
					DOC_NUMBER,
					strOrgCode
			};
			List<Map> list = modelService.listDataSql(sqlStr, params);
			String jsonStr = "";
			if (list!=null&&list.size()>0) {
				jsonStr = pdaServiceUtils.MapListToJson(list);
				map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
			}
			else{
				jsonStr= PdaBaseServiceUtils.foundNoLockItemData;
				map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), jsonStr));
			}
			service.setResult(map);
			return null;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), e.toString()));
	    	  service.setResult(map);
	          return null;
		}
	}
}
