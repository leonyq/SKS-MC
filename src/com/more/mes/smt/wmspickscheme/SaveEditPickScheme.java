package com.more.mes.smt.wmspickscheme;

import java.util.ArrayList;
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
 * 保存修改的捡货方案信息
 * @author development
 *
 */
public class SaveEditPickScheme implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
	    //String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    String formId = request.getParameter("formId");
	    if (StringUtils.isBlank(formId))
	    {
	      formId = request.getParameter("formIds");
	    }
	    String iframeId = request.getParameter("iframeId");
	    try {
	    	String dataId = request.getParameter("dataId");
	    	String ids = request.getParameter("packIds");
	    	String orderBys = request.getParameter("orderBys");
			String WPS_SCHEME_SN = request.getParameter("schemeSn");//方案代码
			String WPS_SCHEME_NAME = request.getParameter("paraMapObj.WPS_SCHEME_NAME");//方案名称
			String WPS_DEFAULT_FLAG = request.getParameter("paraMapObj.WPS_DEFAULT_FLAG");//默认标志
			String WPS_MEMO =request.getParameter("paraMapObj.WPS_MEMO");//方案描述
			String sql3 = "select t.WPS_SCHEME_SN from T_WMS_PICK_SCHEME t where t.WPS_SCHEME_NAME=? and t.data_auth=? and t.id!=?";
		    int count3 = modelService.countSql(sql3, new Object[] {WPS_SCHEME_NAME,dataAuth,dataId});
		    if (count3 != 0){
		        return modelAction.alertParentInfo(modelAction.getText("方案名称已存在"));
		    }
		    if(WPS_DEFAULT_FLAG == null || WPS_DEFAULT_FLAG == "" || WPS_DEFAULT_FLAG.equals("")){
		    	WPS_DEFAULT_FLAG = "N";
		    }else{
		    	String sql1 = "select t.WPS_DEFAULT_FLAG from T_WMS_PICK_SCHEME t where t.WPS_DEFAULT_FLAG='Y' and t.data_auth=?  and t.id!=?";
			    int count1 = modelService.countSql(sql1, new Object[] { dataAuth,dataId });
			    if (count1 != 0){
			        return modelAction.alertParentInfo(modelAction.getText("只允许存在一笔默认的数据"));
			    }
		    }
		    // 修改捡货方案信息
		    List list = new ArrayList();
		 	TableDataMapExt wms = new TableDataMapExt();
		 	wms.setTableName("T_WMS_PICK_SCHEME");
		 	CommMethod.editSysDefCol(wms.getColMap(), modelAction.getUser());
		 	list.add(dataId);
		 	wms.setSqlWhereArgs(list);
		 	wms.setSqlWhere(" and id = ?");
		 	wms.getColMap().put("WPS_SCHEME_NAME", WPS_SCHEME_NAME);
		 	wms.getColMap().put("WPS_DEFAULT_FLAG", WPS_DEFAULT_FLAG);
		 	wms.getColMap().put("WPS_MEMO", WPS_MEMO);
		 	if(dataAuth!=null){
				wms.getColMap().put("DATA_AUTH", dataAuth);
		    }
			modelService.edit(wms);
			//先删除已关联的策略信息
			TableDataMapExt wms1 = new TableDataMapExt();
		 	wms1.setTableName("T_WMS_PICK_SCHEME_DETAIL");
		 	wms1.setSqlWhere(" and PCD_SCHEME_SN= ? and data_auth= ? ");
		 	list.clear();
		 	list.add(WPS_SCHEME_SN);
		 	list.add(dataAuth);
		 	wms1.setSqlWhereArgs(list);
		 	modelService.del(wms1);
		 	//根据策略信息id保存捡货方案明细信息
			String querySql = "SELECT t.* FROM T_WMS_PICK_TACTICS t WHERE t.id=?";
			if(ids!=null && !ids.equals("")) {
				String[] id = ids.split(",");
				String[] ord = orderBys.split(",");
				TableDataMapExt wms2 = new TableDataMapExt();
			 	wms2.setTableName("T_WMS_PICK_SCHEME_DETAIL");
				for(int i=0;i<id.length;i++){
					List<Map> qList = modelService.listDataSql(querySql, new Object[] { id[i]});
					CommMethod.addSysDefCol(wms2.getColMap(), modelAction.getUser());
					wms2.getColMap().put("ID", StringUtils.getUUID());
				 	wms2.getColMap().put("PCD_SCHEME_SN", WPS_SCHEME_SN);
				 	wms2.getColMap().put("PCD_TACTICS_SN", qList.get(0).get("WPT_TACTICS_SN"));
				 	wms2.getColMap().put("PCD_TACTICS_NAME", qList.get(0).get("WPT_TACTICS_NAME"));
				 	wms2.getColMap().put("PCD_MEMO", qList.get(0).get("WPT_DESC"));
				 	wms2.getColMap().put("PCD_ORDER_BY", Integer.valueOf(ord[i]));
				 	if(dataAuth!=null){
						wms2.getColMap().put("DATA_AUTH", dataAuth);
				    }
					modelService.save(wms2);
				}
			}
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("修改失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}

}
