package com.more.mes.smt.problemFeedback;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 删除回复信息内容
 * @author development
 *
 */
public class AjaxDelRepInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction  modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		Map<String, String> map = new HashMap<String, String>();
	    String delId = request.getParameter("delId");//要删除的回复信息id
	    try {
	    	TableDataMapExt pro = new TableDataMapExt();
			pro.setTableName("T_CO_PROBLEM_FOLLOW");
			pro.setSqlWhere(" and id='"+delId+"' ");
			modelService.del(pro);
			map.put("returnMsg", "addSucc");
			String alertMsg1 = modelAction.getText("删除成功");
		    map.put("alertMsg", (String) msgPopData(modelAction, alertMsg1).get("alertMsg"));
		    map.put("title", (String) msgPopData(modelAction, alertMsg1).get("title"));
		    map.put("width", (String) msgPopData(modelAction, alertMsg1).get("width"));
		    map.put("height", (String) msgPopData(modelAction, alertMsg1).get("height"));
		    map.put("time", (String) msgPopData(modelAction, alertMsg1).get("time"));
		    modelAction.setAjaxMap(map);
		} catch (Exception e) {
			log.error(e);
			map.put("returnMsg", "addError");
			modelAction.setAjaxMap(map);
		}
		return BaseActionSupport.AJAX;
	}
	
	@SuppressWarnings("unchecked")
	private Map msgPopData(ModelAction modelAction, String alertMsg)
	  {
	    Map map = new HashMap<String, Object>();
	    String title = ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
	    title = modelAction.getText(title);
	    String width = ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
	    String height = ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
	    String time = ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
	    map.put("title", title);
	    map.put("width", width);
	    map.put("height", height);
	    map.put("time", time);
	    map.put("alertMsg", alertMsg);
	    return map;
	  }

}
