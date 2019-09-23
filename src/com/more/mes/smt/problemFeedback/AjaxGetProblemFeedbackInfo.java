package com.more.mes.smt.problemFeedback;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取问题编号对应的问题跟进信息
 * @author development
 *
 */
public class AjaxGetProblemFeedbackInfo implements FuncService{

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction  modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    String pronlemSn = request.getParameter("pronlemSn");//问题编号
	    String beReplyEmp = request.getParameter("beReplyEmp");//发帖人
	    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    List<Object> sqlwList = new ArrayList<Object>();
	    //获取发帖人信息
	    String userSql = "select t.photo_name from SY_USER t WHERE t.id=?";
	    Map<String, Object> map = modelService.queryForMap(userSql, new Object[] {beReplyEmp});
		String sql = "SELECT t.*,to_char(t.cpf_reply_date,'yyyy-mm-dd hh24:mi:ss') reply_date,t1.name reply_emp," +
				"t1.photo_name reply_photo,t2.name bereply_emp,t2.photo_name bereply_photo," +
				"to_char(t.CPF_BEREPLY_DATE,'yyyy-mm-dd hh24:mi:ss') bereply_date " +
				"FROM T_CO_PROBLEM_FOLLOW t " +
				"LEFT JOIN sy_user t1 ON t1.id = t.cpf_reply_emp " +
				"LEFT JOIN sy_user t2 ON t2.id = t.cpf_bereply_emp " +
				"WHERE t.cpf_sn = ? AND t.data_auth = ?   ";
		sqlwList.add(pronlemSn);
		sqlwList.add(dataAuth);
		List itemList = modelService.listSql(sql, modelAction.getPage(), null, sqlwList, " ORDER BY t.cpf_reply_date ",null);
		modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(itemList);
		modelAction.setAjaxMap(map);
		return BaseActionSupport.AJAX;
	}

}
