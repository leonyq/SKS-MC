package com.more.mes.smt.performance.xray;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 验证制令单
 * @author development
 *
 */
	public class SerachMoNum implements FuncService {

		public String exeFunc(ModelAction modelAction, ModelService modelService) {

			final Log log = LogFactory.getLog(this.getClass());
			HttpServletRequest request = modelAction.getRequest();
			String sn = request.getParameter("sn");
			String dataAuth = request.getParameter("_DATA_AUTH");
			Map<String, Object> map = new HashMap();
			modelAction.setAjaxPage(modelAction.getPage());
			CommMethod.mapToEscapeJs(map);
			modelAction.setAjaxMap(map);
			String completeRepairFlag = request.getParameter("Flag");
			try{
					String sql = "select wt_mo_number from T_WIP_TRACKING where  wt_sn = ?";
			List<Map<String,Object>> list =	modelService.listDataSql(sql, new Object[] { sn });
			if(null!=list&&list.size()>0){
				map.put("sn", list.get(0).get("wt_mo_number"));
			}
			else {
			    map.put("sn","");
			}
			return BaseActionSupport.AJAX;
			} catch (Exception e) {
				map.put("error", e);
				log.error(e);
				return BaseActionSupport.AJAX;
			}

		}
	}
