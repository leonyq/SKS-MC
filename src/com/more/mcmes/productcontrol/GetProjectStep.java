package com.more.mcmes.productcontrol;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import net.sf.json.JSONArray;
import com.more.mes.smt.getsnhttp.service.GetSnService;

import java.util.ArrayList;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.FuncCode;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.morelean.mes.smt.indicator.service.IndicatorTableService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;


/**
 * 制令单位信息查询
 * 
 * @author hjw
 */
public class GetProjectStep implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
	    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    String productLine =modelAction.getRequest().getParameter("productLine") ;
    	String sql = "select  t.CA_PROJECT_STEP CA_PROJECT_STEP  from t_co_area t where ca_type='1' and t.CA_ID=? and t.data_auth=?" ;
		
		List psList = modelService.listDataSql(sql, new Object[] {productLine,dataAuth });
		
		CommMethod.listToEscapeJs(psList);
		modelAction.setAjaxList(psList);
		return BaseActionSupport.AJAX;
	}
}
