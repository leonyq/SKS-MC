package com.more.buss.eis.pt.itemmgr.bommgr.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 替代料--修改获取信息
 * @author fs
 *
 */
public class ItemReplaceSqlService2 implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		
		HttpServletRequest request = modelAction.getRequest();
		String type=request.getParameter("type");
		String sql=null;
		String viewId=null;
		String sqlWhere=" t.data_auth=:data_auth ";
		String projectId=request.getParameter("project_id");//取工单号
		String modeCode=request.getParameter("mode_code");//取机种号
		//String itemCode=request.getParameter("ITEM_CODE");//物料代码
		String itemCode=request.getParameter("paraMapObj.CR_ITEM_MIAN");//物料代码
		
		//String itemName=request.getParameter("ITEM_NAME");//物料名称 
		String itemName=request.getParameter("paraMapObj.CR_MAIN_NAME");//物料名称
		
		//String itemSpec=request.getParameter("ITEM_SPEC");//物料规格
		String itemSpec=request.getParameter("paraMapObj.CR_MAIN_TYPE");//物料规格
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		 Map<String, String> map = new HashMap<String, String>();
		PaginationImpl page=modelAction.getPage();
		map.put("data_auth", dataAuth);
		if(type.equals("0")){//物料
			sql="select * from t_co_item where  ";
			viewId="c4c7008b5649445ab42914ae672e5ec9";
			if(StringUtils.isNotBlank(itemCode)){
				sqlWhere+="and CI_ITEM_CODE LIKE '%' || :itemCode || '%'";
				map.put("itemCode", itemCode);
			}
			if(StringUtils.isNotBlank(itemName)){
				sqlWhere+="and CI_ITEM_NAME LIKE '%' || :itemName || '%'";
				map.put("itemName", itemName);
			}
			if(StringUtils.isNotBlank(itemSpec)){
				sqlWhere+="and CI_ITEM_SPEC LIKE '%' || :itemSpec || '%'";
				map.put("itemSpec", itemSpec);
			}
		}else if(type.equals("1")){//工单
			sql="select t.*,t2.ci_item_name as ITEM_NAME,t2.ci_item_spec as ITEM_SPEC,t2.ci_item_type as ITEM_TYPE "
		             +" from T_PM_PROJECT_DETAIL t left join t_co_item t2 on t.CBD_ITEM_CODE=t2.ci_item_code ";
			viewId="ab03e608f0ad46ec8fe1890e97e3b2ca";
			sqlWhere+="and PROJECT_ID = :projectId ";
			map.put("projectId", projectId);
			if(StringUtils.isNotBlank(itemCode)){
				sqlWhere+="and t.CBD_ITEM_CODE LIKE '%' || :itemCode || '%'";
				map.put("itemCode", itemCode);
			}
			if(StringUtils.isNotBlank(itemName)){
				sqlWhere+="and t2.ci_item_name LIKE '%' || :itemName || '%'";
				map.put("itemName", itemName);
			}
			if(StringUtils.isNotBlank(itemSpec)){
				sqlWhere+="and t2.ci_item_spec LIKE '%' || :itemSpec || '%'";
				map.put("itemSpec", itemSpec);
			}
		}else if(type.equals("2")){//机种
			sql="select t.*,t2.ci_item_name as ITEM_NAME,t2.ci_item_spec as ITEM_SPEC,t2.ci_item_type as ITEM_TYPE "
					+" from t_co_bom_detail t left join t_co_item t2 on t.cbd_item_code=t2.ci_item_code ";
			viewId="36e236999be547d5ad28c89d24282cf6";
			sqlWhere+="and CB_BOMID = :modeCode ";
			map.put("modeCode", modeCode);
			if(StringUtils.isNotBlank(itemCode)){
				sqlWhere+="and t.CBD_ITEM_CODE LIKE '%' || :itemCode || '%'";
				map.put("itemCode", itemCode);
			}
			if(StringUtils.isNotBlank(itemName)){
				sqlWhere+="and t2.ci_item_name LIKE '%' || :itemName || '%'";
				map.put("itemName", itemName);
			}
			if(StringUtils.isNotBlank(itemSpec)){
				sqlWhere+="and t2.ci_item_spec LIKE '%' || :itemSpec || '%'";
				map.put("itemSpec", itemSpec);
			}
		}
		
		List rplist =modelService.listSql(sql, page, sqlWhere,null,
                null, null);
		 CommMethod.listMapToEscapeJs(rplist);
		modelAction.setPage(page);
		return modelAction.ActionForwardExeid(viewId);// 方式1
	}

}
