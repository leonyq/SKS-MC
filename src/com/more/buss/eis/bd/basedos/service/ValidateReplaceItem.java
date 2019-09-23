package com.more.buss.eis.bd.basedos.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;


public class ValidateReplaceItem implements ValidateFuncService {
    String sql1 = null;
	@Override
	public OperResult valJavaFun(String formId, Map paraMap,
			 ModelService modelService,ModelAction modelAction,Object... objs) {
		HttpServletRequest req = modelAction.getRequest();
		String file_type = req.getParameter("file_type").trim();//取视图类型，判断新增还是修改
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		
		//新增
		String cr_item_mian = req.getParameter("paraItemCode");//取主料号
		String cr_item_replay = req.getParameter("paraMap1@0#CR_ITEM_REPLACE");//取替代料号
		String type = req.getParameter("paraMap1@0#CR_TYPE");//取选择类型  0:全局 1:工单 2:物料
		String proId = req.getParameter("paraMap1@0#CR_PROJECT_ID");//取工单
		String modelCode = req.getParameter("paraMap1@0#CR_MODEL_CODE");//取物料
		//修改
		String cr_item_mian2 = req.getParameter("paraMapObj.CR_ITEM_MIAN");//取主料号
		String cr_item_replay2 = req.getParameter("paraMapObj.CR_ITEM_REPLACE");//取替代料号
		String type2 = req.getParameter("paraMapObj.CR_TYPE");//取选择类型  0:全局 1:工单 2:物料
		String proId2 = req.getParameter("paraMapObj.CR_PROJECT_ID");//取工单
		String modelCode2 = req.getParameter("paraMapObj.CR_MODEL_CODE");//取物料
		
//		if(1!=2){
//			throw new BussException("stop");
//		}
		String sql = "select count(1) as count from T_CO_ITEM_REPLACE where CR_ITEM_MIAN=? and DATA_AUTH=? ";
		String sql2 = "select id from T_CO_ITEM_REPLACE where CR_ITEM_MIAN=? and DATA_AUTH=? ";
		String sqlWhere1 = "and CR_ITEM_REPLACE =?  ";//替代料
		String sqlWhere2 = "and CR_PROJECT_ID =? ";//工单
		String sqlWhere3 = "and CR_MODEL_CODE =? ";//物料
		Object[] whereObj = null;
		if(("edit_file").equals(file_type)){
			if("0".equals(type2)){
				sql = sql + sqlWhere1;
				sql2 = sql2 + sqlWhere1;
				whereObj = new Object[]{cr_item_mian2,dataAuth,cr_item_replay2};
				}else if("1".equals(type2)){
				sql = sql + sqlWhere1 + sqlWhere2;
				sql2 = sql2 + sqlWhere1 + sqlWhere2;
				whereObj = new Object[]{cr_item_mian2,dataAuth,cr_item_replay2,proId2};
				}else if("2".equals(type2)){
				sql = sql + sqlWhere1 + sqlWhere3;
				sql2 = sql2 + sqlWhere1 + sqlWhere3;
				whereObj = new Object[]{cr_item_mian2,dataAuth,cr_item_replay2,modelCode2};
				}
		}else{
			if("0".equals(type)){
				sql = sql + sqlWhere1;
				sql2 = sql2 + sqlWhere1;
				whereObj = new Object[]{cr_item_mian,dataAuth,cr_item_replay};
				}else if("1".equals(type)){
				sql = sql + sqlWhere1 + sqlWhere2;
				sql2 = sql2 + sqlWhere1 + sqlWhere2;
				whereObj = new Object[]{cr_item_mian,dataAuth,cr_item_replay,proId};
				}else if("2".equals(type)){
				sql = sql + sqlWhere1 + sqlWhere3;
				sql2 = sql2 + sqlWhere1 + sqlWhere3;
				whereObj = new Object[]{cr_item_mian,dataAuth,cr_item_replay,modelCode};
				}
		}
		Map resultMap = modelService.queryForMap(sql,whereObj);
		int count = Integer.parseInt(resultMap.get("count").toString());
		if (count ==1) {
			if(("edit_file").equals(file_type)){
				//sql = "select CR_ITEM_MIAN from T_CO_ITEM_REPLACE where ID=?";
				//resultMap = modelService.queryForMap(sql,new Object[] {modelAction.getDataId()});//
				Map resultMap2 = modelService.queryForMap(sql2,whereObj);
				String id = modelAction.getDataId();
				String id2 = (String)resultMap2.get("ID");
				//String cr_item_mian_t = StringUtils.toString(resultMap.get("CR_ITEM_MIAN"));
				if((id).equals(id2)){
					return new OperResult(true);
				}else{
					return new OperResult(false, CommMethod.getText("该条记录已存在")+cr_item_mian2);
				}
			}else{
				return new OperResult(false, CommMethod.getText("该条记录已存在")+cr_item_mian);
			}
		}else if(count>1){
			return new OperResult(false, CommMethod.getText("该条记录在数据库中大于等于2条，旧有数据有错")+cr_item_mian);
		} else {
			return new OperResult(true);
		}
	}

}
