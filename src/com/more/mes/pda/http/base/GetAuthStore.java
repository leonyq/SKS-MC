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

/**
 * 仓库获取仓库数据
 * @author Administrator
 *
 */
public class GetAuthStore extends InterfaceLog implements IhttpServiceJosn{
	public ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");
	@Override
	public String exeFunc(HttpCoreService service) {
		// TODO Auto-generated method stub
		Map map = new HashMap<>();
		try {
			String strOrgCode = StringUtils.toString(service.getParamTo().get("strOrgCode"));
			String sqlStr="SELECT T.WA_AREA_SN,T.WA_AREA_NAME\r\n" + 
					"FROM T_WMS_AREA T\r\n" + 
					"WHERE T.WA_AREA_TYPE='1'\r\n" + 
					"AND T.DATA_AUTH=? AND T.WA_VALID_FLAG='Y' \r\n" + 
					"ORDER BY T.WA_AREA_SN";
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
				jsonStr=PdaBaseServiceUtils.foundNoAreaData;
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
