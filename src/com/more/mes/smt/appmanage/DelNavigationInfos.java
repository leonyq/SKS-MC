package com.more.mes.smt.appmanage;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.sun.corba.se.spi.orb.StringPair;


public class DelNavigationInfos implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		String delId = request.getParameter("delId");
		String iframeId = request.getParameter("iframeId");
		Map resultMap = new HashMap<>();
		if (StringUtils.isBlank(delId)) {
			resultMap.put("code", "error");
			resultMap.put("msg", modelAction.getText("ID为空"));
			CommMethod.mapToEscapeJs(resultMap);
			modelAction.setAjaxMap(resultMap);
			return BaseActionSupport.AJAX;
		}
		String[] delIds = delId.split(",");
		for(String id:delIds){
			String querySql = "SELECT\n" +
					"	TAM_MENU_PHOTO,\n" +
					"	TAM_MENU_PHOTO2,\n" +
					"	ID\n" +
					"FROM\n" +
					"	T_APP_MENU\n" +
					"WHERE\n" +
					"	ID = ?";
			List<Map<String,Object>> queryList = modelService.listDataSql(querySql, new Object[]{id});
			if (queryList==null||queryList.size()<1) {
				resultMap.put("code", "error");
				resultMap.put("msg", "id:"+id+" "+modelAction.getText("无记录"));
				CommMethod.mapToEscapeJs(resultMap);
				modelAction.setAjaxMap(resultMap);
				return BaseActionSupport.AJAX;
			}
			Map<String,Object> queryMap = queryList.get(0);
			String path1 = request.getSession().getServletContext().getRealPath(
					queryMap.get("TAM_MENU_PHOTO").toString());
			String path2 = request.getSession().getServletContext().getRealPath(
					queryMap.get("TAM_MENU_PHOTO2").toString());
			File file1 = new File(path1);
			File file2 = new File(path2);
			if (file1.exists()) {
				file1.delete();
			}
			if(file2.exists()){
				file2.delete();
			}
			
			TableDataMapExt device = new TableDataMapExt();
			device.setTableName("T_APP_MENU");
			device.setSqlWhere(" and ID='" + id + "'");
			modelService.del(device);
		}
		resultMap.put("code", "success");
		CommMethod.mapToEscapeJs(resultMap);
		modelAction.setAjaxMap(resultMap);
		return BaseActionSupport.AJAX;
	}

}
