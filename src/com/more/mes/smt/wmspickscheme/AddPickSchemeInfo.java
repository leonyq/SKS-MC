package com.more.mes.smt.wmspickscheme;

import java.util.List;
import java.util.Map;

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
 * 保存新增的捡货方案信息
 * @author development
 *
 */
public class AddPickSchemeInfo implements FuncService{
	
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
			String ids = request.getParameter("packIds");
			String orderBys = request.getParameter("orderBys");
			String WPS_SCHEME_SN = request.getParameter("paraMap1@0#WPS_SCHEME_SN");//方案代码
			String WPS_SCHEME_NAME =request.getParameter("paraMap1@0#WPS_SCHEME_NAME");//方案名称
			String WPS_DEFAULT_FLAG = request.getParameter("paraMap1@0#WPS_DEFAULT_FLAG");//默认标志
			String WPS_MEMO = request.getParameter("paraMap1@0#WPS_MEMO");//方案描述
			
			String sql = "select t.WPS_SCHEME_SN from T_WMS_PICK_SCHEME t where t.WPS_SCHEME_SN=? and t.data_auth=?";
		    int count = modelService.countSql(sql, new Object[] {WPS_SCHEME_SN,dataAuth});
		    if (count != 0){
		        return modelAction.alertParentInfo(modelAction.getText("方案代码已存在"));
		    }
		    String sql3 = "select t.WPS_SCHEME_SN from T_WMS_PICK_SCHEME t where t.WPS_SCHEME_NAME=? and t.data_auth=?";
		    int count3 = modelService.countSql(sql3, new Object[] {WPS_SCHEME_NAME,dataAuth});
		    if (count3 != 0){
		        return modelAction.alertParentInfo(modelAction.getText("方案名称已存在"));
		    }
		    if(WPS_DEFAULT_FLAG == null || WPS_DEFAULT_FLAG == "" || WPS_DEFAULT_FLAG.equals("")){
		    	WPS_DEFAULT_FLAG = "N";
		    }else{
		    	String sql1 = "select t.WPS_DEFAULT_FLAG from T_WMS_PICK_SCHEME t where t.WPS_DEFAULT_FLAG=? and t.data_auth=?";
			    int count1 = modelService.countSql(sql1, new Object[] {"Y",dataAuth});
			    if (count1 != 0){
			        return modelAction.alertParentInfo(modelAction.getText("只允许存在一笔默认的数据"));
			    }
		    }
		    // 插入捡货方案信息
		 	TableDataMapExt wms = new TableDataMapExt();
		 	wms.setTableName("T_WMS_PICK_SCHEME");
		 	CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
		 	wms.getColMap().put("ID", StringUtils.getUUID());
		 	wms.getColMap().put("WPS_SCHEME_SN", WPS_SCHEME_SN);
		 	wms.getColMap().put("WPS_SCHEME_NAME", WPS_SCHEME_NAME);
		 	wms.getColMap().put("WPS_DEFAULT_FLAG", WPS_DEFAULT_FLAG);
		 	wms.getColMap().put("WPS_MEMO", WPS_MEMO);
		 	if(dataAuth!=null){
				wms.getColMap().put("DATA_AUTH", dataAuth);
		    }
			modelService.save(wms);
			//根据策略信息id保存捡货方案明细信息
			String querySql = "SELECT t.* FROM T_WMS_PICK_TACTICS t WHERE t.id=?";
			if(ids!=null && !ids.equals("")) {
				String[] id = ids.split(",");
				String[] ord = orderBys.split(",");
				TableDataMapExt wms1 = new TableDataMapExt();
			 	wms1.setTableName("T_WMS_PICK_SCHEME_DETAIL");
				for(int i=0;i<id.length;i++){
					List<Map> qList = modelService.listDataSql(querySql, new Object[] { id[i]});
					CommMethod.addSysDefCol(wms1.getColMap(), modelAction.getUser());
					wms1.getColMap().put("ID", StringUtils.getUUID());
				 	wms1.getColMap().put("PCD_SCHEME_SN", WPS_SCHEME_SN);
				 	wms1.getColMap().put("PCD_TACTICS_SN", qList.get(0).get("WPT_TACTICS_SN"));
				 	wms1.getColMap().put("PCD_TACTICS_NAME", qList.get(0).get("WPT_TACTICS_NAME"));
				 	wms1.getColMap().put("PCD_MEMO", qList.get(0).get("WPT_DESC"));
				 	if (StringUtils.isNotBlank( ord[i]))
				 	{
				 	 wms1.getColMap().put("PCD_ORDER_BY", Integer.valueOf(ord[i]));
				 	}
				 	//wms1.getColMap().put("PCD_ORDER_BY", CommMethod.escapeJs(ord[i]));
				 	if(dataAuth!=null){
						wms1.getColMap().put("DATA_AUTH", dataAuth);
				    }
					modelService.save(wms1);
				}
			}
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("新增失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}

}
