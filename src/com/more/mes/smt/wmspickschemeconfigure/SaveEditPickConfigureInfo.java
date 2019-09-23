package com.more.mes.smt.wmspickschemeconfigure;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存修改的捡货方案配置信息
 * @author development
 *
 */
public class SaveEditPickConfigureInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
	    String formId = request.getParameter("formId");
	    if (StringUtils.isBlank(formId))
	    {
	      formId = request.getParameter("formIds");
	    }
	    String iframeId = request.getParameter("iframeId");
	    try {
	    	String id = request.getParameter("dataId");
	    	String WPC_PICK_VALUE = request.getParameter("PICK_VALUE");//管控值
	    	String WPC_SCHEME_SN = request.getParameter("paraMapObj.WPC_SCHEME_SN");//捡货方案
			String sql = "SELECT t.* FROM T_WMS_PICK_CONFIGURE t WHERE t.wpc_pick_value=? AND t.wpc_scheme_sn=? AND t.data_auth=? and t.id!=?";
		    int count = modelService.countSql(sql, new Object[] {WPC_PICK_VALUE,WPC_SCHEME_SN,dataAuth,id});
		    if (count != 0){
		        return modelAction.alertParentInfo(modelAction.getText("管控值对应的捡货方案只能存在一笔记录"));
		    }
		    // 修改捡货方案配置信息
		 	TableDataMapExt wms = new TableDataMapExt();
		 	List list = new ArrayList();
		 	wms.setTableName("T_WMS_PICK_CONFIGURE");
		 	CommMethod.editSysDefCol(wms.getColMap(), modelAction.getUser());
		 	wms.setSqlWhere(" and id = ?");
		 	list.add(id);
		 	wms.setSqlWhereArgs(list);
		 	wms.getColMap().put("WPC_SCHEME_SN", WPC_SCHEME_SN);
		 	if(dataAuth!=null){
				wms.getColMap().put("DATA_AUTH", dataAuth);
		    }
			modelService.edit(wms);
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("修改失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}

}
