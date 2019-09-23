package com.more.mes.smt.wmsreceivemanager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 修改页面根据入库单号获取对应物料信息
 * @author development
 *
 */
public class EditReceiveManager implements FuncService{

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String docNum = request.getParameter("docNum");//入库单号
			String dataauth=request.getParameter("trDataAuth");//查看修改传组织机构
		if(dataauth==null||dataauth==""){
		    dataauth = request.getSession().getAttribute("mcDataAuth").toString();
		}
		//String dataauth = request.getSession().getAttribute("mcDataAuth").toString();
		//String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		Map<String, String> map = new HashMap<String, String>();
		String sql = "SELECT t.*,a.ci_item_name,a.ci_item_spec," +
				"to_char(t.wri_delivery_date,'yyyy-mm-dd') delivery_date," +
				"to_char(t.wri_produce_date,'yyyy-mm-dd') produce_date," +
				"t1.WPD_PLAN_NUM " +
				"FROM T_WMS_RECEIVE_ITEM t " +
				"LEFT JOIN T_WMS_PO_DETAIL t1 ON t1.WPD_PO=t.WRI_CONNECT_DOC " +
				"and t1.WPD_ITEM_CODE=t.wri_item_code and t1.WPD_ITEM_SEQ=t.WRI_ITEM_SEQ and t1.DATA_AUTH=t.DATA_AUTH " +//
				"LEFT JOIN t_co_item a ON a.ci_item_code=t.wri_item_code  and a.DATA_AUTH=t.DATA_AUTH  ";// 
		String sqlWhere = " where 1=1 and t.wri_doc_num =:docNum     " ;// and t.DATA_AUTH=:dataAuth
		map.put("docNum", docNum);
		//map.put("dataAuth", dataAuth);
		
		List<Map<String, Object>> itemList = modelService.listSql(sql+sqlWhere, null, map, null,null);
		if(itemList!=null && itemList.size()>0){
			int num = itemList.size();
			String querySql = "SELECT SUM(t.wri_plan_num) ALREADY_NUM FROM T_WMS_RECEIVE_ITEM t " +
					"WHERE t.wri_item_seq=? AND t.wri_item_code=? AND t.wri_connect_doc=?    "; //and t.data_auth=? 
			List<Map<String,Object>> qList = null;
			for(int i=0;i<num;i++){
				qList = modelService.listDataSql(querySql, new Object[]{itemList.get(i).get("WRI_ITEM_SEQ"),itemList.get(i).get("WRI_ITEM_CODE"),itemList.get(i).get("WRI_CONNECT_DOC")});//,dataauth
				if(qList!=null && qList.size()>0){
					itemList.get(i).put("ALREADY_NUM", qList.get(0).get("ALREADY_NUM"));
					if(itemList.get(i).get("WPD_PLAN_NUM")!=null){
						itemList.get(i).put("SUR_NUM", Integer.parseInt(itemList.get(i).get("WPD_PLAN_NUM").toString())-Integer.parseInt(qList.get(0).get("ALREADY_NUM").toString()));
					}
				}
			}
		}
		CommMethod.listMapToEscapeJs(itemList);
		modelAction.setAjaxList(itemList);
		return BaseActionSupport.AJAX;
	}

}
