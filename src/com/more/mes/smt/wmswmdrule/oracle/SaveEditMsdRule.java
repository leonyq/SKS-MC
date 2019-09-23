package com.more.mes.smt.wmswmdrule.oracle;

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
 * 保存修改的规则信息
 * @author development
 *
 */
public class SaveEditMsdRule implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    String dataAuth =  String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    String formId = request.getParameter("formId");
	    if (StringUtils.isBlank(formId))
	    {
	      formId = request.getParameter("formIds");
	    }
	    String iframeId = request.getParameter("iframeId");
	    try { 
	    	String dataId = request.getParameter("dataId");
	    	String ruleSn = request.getParameter("ruleSn");
			String WSR_RULE_NAME = request.getParameter("paraMapObj.WSR_RULE_NAME");//规则名称
			String WSR_EXPOSE_LIMIT = request.getParameter("paraMapObj.WSR_EXPOSE_LIMIT");//暴露时限(H)
			String WSR_BAKE_LIMIT = request.getParameter("paraMapObj.WSR_BAKE_LIMIT");//烘烤时限(H)
			String WSR_BAKE_TIMES = request.getParameter("paraMapObj.WSR_BAKE_TIMES");//烘烤次数上限
			String WSR_BAKE_DECAY = request.getParameter("paraMapObj.WSR_BAKE_DECAY");//烘烤衰减
			if(StringUtils.isBlank(WSR_BAKE_DECAY)){
			    WSR_BAKE_DECAY="0";
			}
			String WSR_DEFAULT_FLAG = request.getParameter("paraMapObj.WSR_DEFAULT_FLAG");//默认标志
			String WSR_MEMO = request.getParameter("paraMapObj.WSR_MEMO");//备注
			String[] backTemps = request.getParameterValues("BAKE_TEMP");//烘烤温度(℃)
			String[] backTimes = request.getParameterValues("BAKE_TIME");//烘烤时长(H)
			String[] backMax = request.getParameterValues("BAKE_MAX");//烘烤上限(H)
			String[] tempDeps = request.getParameterValues("TEMP_DEPARTURE");//偏差温度(℃)
			
			if(WSR_DEFAULT_FLAG == null || WSR_DEFAULT_FLAG == "" || WSR_DEFAULT_FLAG.equals("")){
				WSR_DEFAULT_FLAG = "N";
		    }else{
		    	String sql1 = "select * from T_WMS_MSD_RULE where WSR_DEFAULT_FLAG=? and DATA_AUTH=? and id !=? ";
				int count1 = modelService.countSql(sql1, new Object[] {"Y",dataAuth,dataId});
				if(count1!=0){
					return modelAction.alertParentInfo(modelAction.getText("只允许存在一笔默认的数据"));
				}
		    }
			//修改MSD物料管控规则
			List list = new ArrayList();
			TableDataMapExt msd = new TableDataMapExt();
			msd.setTableName("T_WMS_MSD_RULE");
		 	CommMethod.editSysDefCol(msd.getColMap(), modelAction.getUser());
		 	msd.setSqlWhere(" and id= ?");
		 	list.add(dataId);
		 	msd.setSqlWhereArgs(list);
		 	msd.getColMap().put("WSR_RULE_NAME", WSR_RULE_NAME);
		 	msd.getColMap().put("WSR_MEMO", WSR_MEMO);
		 	msd.getColMap().put("WSR_EXPOSE_LIMIT", WSR_EXPOSE_LIMIT);
		 	msd.getColMap().put("WSR_BAKE_DECAY", WSR_BAKE_DECAY);
		 	msd.getColMap().put("WSR_DEFAULT_FLAG", WSR_DEFAULT_FLAG);
		 	msd.getColMap().put("WSR_BAKE_TIMES", WSR_BAKE_TIMES);
		 	msd.getColMap().put("WSR_BAKE_LIMIT", WSR_BAKE_LIMIT);
		 	if(dataAuth!=null){
		 		msd.getColMap().put("DATA_AUTH", dataAuth);
		    }
		 	modelService.edit(msd);
		 	//先删除对应明细信息
		 	TableDataMapExt delMsd = new TableDataMapExt();
		 	delMsd.setTableName("T_WMS_MSD_RULE_DETAIL");
		 	delMsd.setSqlWhere(" and WSRD_RULE_SN=? and DATA_AUTH=? ");
		 	list.clear();
		 	list.add(ruleSn);
		 	list.add(dataAuth);
		 	delMsd.setSqlWhereArgs(list);
		 	modelService.del(delMsd);
		 	//插入MSD物料管控规则明细
		 	TableDataMapExt msd1 = new TableDataMapExt();
		 	msd1.setTableName("T_WMS_MSD_RULE_DETAIL");
		 	for(int i=0;i<backTemps.length;i++){
		 		msd1.getColMap().clear();
		 		CommMethod.addSysDefCol(msd1.getColMap(), modelAction.getUser());
		 		msd1.getColMap().put("ID", StringUtils.getUUID());
		 		msd1.getColMap().put("WSRD_RULE_SN", ruleSn);
		 		msd1.getColMap().put("WSRD_BAKE_TEMP", backTemps[i]);
		 		msd1.getColMap().put("WSRD_BAKE_TIME", backTimes[i]);
		 		msd1.getColMap().put("WSRD_BAKE_MAX", backMax[i]);
		 		msd1.getColMap().put("WSRD_TEMP_DEPARTURE", tempDeps[i]);
		 		if(dataAuth!=null){
		 			msd1.getColMap().put("DATA_AUTH", dataAuth);
			    }
		 		modelService.save(msd1);
		 	}
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("修改失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}

}
