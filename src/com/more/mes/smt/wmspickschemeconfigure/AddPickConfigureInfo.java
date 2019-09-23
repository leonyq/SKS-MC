package com.more.mes.smt.wmspickschemeconfigure;

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
 * 保存新增的捡货方案配置信息
 * @author development
 *
 */
public class AddPickConfigureInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
	    String formId = request.getParameter("formId");
	    if (StringUtils.isBlank(formId))
	    {
	      formId = request.getParameter("formIds");
	    }
	    String iframeId = request.getParameter("iframeId");
	    try {
			String WPC_PICK_TYPE = request.getParameter("paraMap1@0#WPC_PICK_TYPE");//管控类型
			String WPC_PICK_VALUE = null;//管控值
			if(WPC_PICK_TYPE.equals("1")){  //仓库单据
				WPC_PICK_VALUE = request.getParameter("paraMap1@0#WPC_DOC");
			}else if(WPC_PICK_TYPE.equals("2")){  //机种/物料
				WPC_PICK_VALUE = request.getParameter("paraMap1@0#WPC_ITEM_CODE");
			}else if(WPC_PICK_TYPE.equals("3")){  //客户
				WPC_PICK_VALUE = request.getParameter("paraMap1@0#WPC_CUST_CODE");
			}
			String WPC_SCHEME_SN = request.getParameter("paraMap1@0#WPC_SCHEME_SN");//捡货方案
			String sql = "SELECT t.* FROM T_WMS_PICK_CONFIGURE t WHERE t.wpc_pick_value=? AND t.data_auth=? AND t.wpc_scheme_sn=?";
		    int count = modelService.countSql(sql, new Object[] {WPC_PICK_VALUE,dataAuth,WPC_SCHEME_SN});
		    if (count != 0){
		        return modelAction.alertParentInfo(modelAction.getText("管控值对应的捡货方案只能存在一笔记录"));
		    }
		    // 插入捡货方案配置信息
		 	TableDataMapExt wms = new TableDataMapExt();
		 	wms.setTableName("T_WMS_PICK_CONFIGURE");
		 	CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
		 	wms.getColMap().put("ID", StringUtils.getUUID());
		 	wms.getColMap().put("WPC_PICK_TYPE", WPC_PICK_TYPE);
		 	wms.getColMap().put("WPC_PICK_VALUE", WPC_PICK_VALUE);
		 	wms.getColMap().put("WPC_SCHEME_SN", WPC_SCHEME_SN);
		 	if(dataAuth!=null){
				wms.getColMap().put("DATA_AUTH", dataAuth);
		    }
			modelService.save(wms);
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("新增失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}

}
