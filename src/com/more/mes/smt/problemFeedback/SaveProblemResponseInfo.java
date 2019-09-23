package com.more.mes.smt.problemFeedback;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存问题回复信息
 * @author development
 *
 */
public class SaveProblemResponseInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		Map<String, String> map = new HashMap<String, String>();
		try {
			String pronlemSn = request.getParameter("pronlemSn"); //问题sn
			String beReplyEmp = request.getParameter("beReplyEmp");//被回复人
			String beReplyId = request.getParameter("beReplyId");//被回复id
			String repContent = request.getParameter("repContent");//回复内容
			String sql = "select * from T_CO_PROBLEM_FOLLOW where id=?";
			List<Map<String, Object>> sList = modelService.listDataSql(sql, new Object[] {beReplyId});
			String sql1 = "SELECT MAX(t.cpf_floor_num) max_floor FROM T_CO_PROBLEM_FOLLOW t WHERE t.cpf_sn =?";
			List<Map<String, Object>> pList = modelService.listDataSql(sql1, new Object[] {pronlemSn});
			//插入问题回复信息
			TableDataMapExt pro = new TableDataMapExt();
			pro.setTableName("T_CO_PROBLEM_FOLLOW");
		    CommMethod.addSysDefCol(pro.getColMap(), modelAction.getUser());
		    pro.getColMap().put("CPF_SN", pronlemSn);
		    pro.getColMap().put("CPF_BEREPLY_EMP", beReplyEmp);
		    pro.getColMap().put("CPF_REPLY_CONTENT", repContent);
		    if(!beReplyId.equals("")){
		    	pro.getColMap().put("CPF_BEREPLY_CONTENT", sList.get(0).get("CPF_REPLY_CONTENT"));
		    	pro.getColMap().put("CPF_BEREPLY_DATE", sList.get(0).get("CPF_REPLY_DATE"));
		    	pro.getColMap().put("CPF_BEFLOOR_NUM", sList.get(0).get("CPF_FLOOR_NUM"));
		    }
		    if(pList!=null&&pList.get(0).get("MAX_FLOOR")!=null){
		    	pro.getColMap().put("CPF_FLOOR_NUM", Integer.parseInt(pList.get(0).get("MAX_FLOOR").toString())+1);
		    }else{
		    	pro.getColMap().put("CPF_FLOOR_NUM", 2);
		    }
		    pro.getColMap().put("CPF_REPLY_EMP", CommMethod.getSessionUser().getId());
		    pro.getColMap().put("CPF_REPLY_DATE", DateUtil.getCurDate());
		    modelService.save(pro);
		    map.put("returnMsg", "addSucc");
			String alertMsg1 = modelAction.getText("回复成功");
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
