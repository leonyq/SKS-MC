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

public class GetDocTypeInfo extends InterfaceLog implements IhttpServiceJosn{
	public ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");
	@Override
	public String exeFunc(HttpCoreService service) {
		// TODO Auto-generated method stub
		Map map = new HashMap<>();
		try {
			String strOrgCode = StringUtils.toString(service.getParamTo().get("strOrgCode"));
			String sqlStr="SELECT T.ID AS WDC_ID,\r\n" + 
					"T.WDT_TYPE_NAME AS WDC_NAME,\r\n" + 
					"'' AS WDC_COMMANDSET_ID,\r\n" + 
					"T.WDT_OPERATE_TYPE AS DT_FLAG,\r\n" + 
					"T.WDT_TYPE_SN AS DT_CODE,\r\n" + 
					"T.DATA_AUTH AS O_CODE,\r\n" + 
					"'' AS DT_REMARK,\r\n" + 
					"T.WDT_EXCESS_PICK AS OUT_SEND_FLAG,\r\n" + 
					"T.WDT_EXCESS_RECEIVE AS IN_RECEIVE_FLAG,\r\n" + 
					"T.WDT_HANDOVER_FLAG AS TAKE_FLAG,\r\n" + 
					"'' AS CREATE_DT_CODE\r\n" + 
					"FROM T_WMS_DOC_TYPE T \r\n" + 
					"WHERE T.WDT_PDA_FLAG='Y'\r\n" + 
					"AND T.DATA_AUTH=?";
			PdaServiceUtils pdaServiceUtils = new PdaServiceUtils();
			Object[] params=new Object[] {
					strOrgCode
			};
			List<Map> list = modelService.listDataSql(sqlStr, params);
			String jsonStr = "";
			if (list!=null&&list.size()>0) {
				jsonStr = pdaServiceUtils.MapListToJson(list);
				map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
			}
			else{
				jsonStr= PdaBaseServiceUtils.foundNoDocTypeData;
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
