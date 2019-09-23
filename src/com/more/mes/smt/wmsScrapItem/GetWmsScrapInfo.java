
package com.more.mes.smt.wmsScrapItem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.sawyer.SuperServer;
 /**
  *要根据对应的视图模型/基础信息：视图公用类的名称来替换继承类SuperServer
  *
  */
public class GetWmsScrapInfo extends SuperServer
{
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String docNum = request.getParameter("docNum");
		String dataAuth = request.getParameter("dataAuth");
		if(StringUtils.isEmpty(dataAuth)){
		    dataAuth = (String) request.getSession().getAttribute("mcDataAuth");
		}
		if(StringUtils.isNotEmpty(docNum)){
		    Map<String, String> sqlParaMap = new HashMap<String, String>();
		    String sql = "SELECT T2.WA_AREA_NAME,T3.NAME AS NAME1 FROM T_WMS_SCARP_DOC T1 "+
                            "LEFT JOIN T_WMS_AREA T2 ON T1.WAD_WH_CODE=T2.WA_AREA_SN "+
                            "AND T2.DATA_AUTH= T1.DATA_AUTH "+
                            "LEFT JOIN SY_DEPT T3 ON T3.ID = T1.WSD_DUTY_DEPT "+
                           " WHERE T1.WSD_DOC_NUM = :docNum AND T1.DATA_AUTH = :dataAuth";
            sqlParaMap.put("docNum",docNum);
            sqlParaMap.put("dataAuth",dataAuth);
            List list = modelService.listSql(sql, modelAction.getPage(), sqlParaMap, null,null);
    		modelAction.setAjaxPage(modelAction.getPage());
    		CommMethod.listMapToEscapeJs(list);
    		modelAction.getAjaxPage().setDataList(list);
            return BaseActionSupport.AJAX;
		}
		
		return null;
	}
}
