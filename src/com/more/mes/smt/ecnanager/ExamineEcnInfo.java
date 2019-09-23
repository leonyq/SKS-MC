package com.more.mes.smt.ecnanager;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
 * ECN审核
 * @author development
 *
 */
public class ExamineEcnInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		 String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    String iframeId = request.getParameter("iframeId");
	    try {
	    	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	String ecnSn = request.getParameter("ecnSn");
	    	String ceiEcnExamineEmp = request.getParameter("paraMapObj.CEI_ECN_EXAMINEEMP");//ECN审核人
	    	String ceiEcnApprovalEmp = request.getParameter("paraMapObj.CEI_ECN_APPROVALEMP");//批准人
	    	//修改ECN信息
	    	List<Object> sqlWList = new ArrayList<Object>();
	    	sqlWList.add(ecnSn);
	    	sqlWList.add(dataAuth);
			TableDataMapExt ecn = new TableDataMapExt();
			ecn.setTableName("T_CO_ECN_INFO");
		 	CommMethod.editSysDefCol(ecn.getColMap(), modelAction.getUser());
		 	ecn.setSqlWhere(" and CEI_ECN_SN=? and data_auth=? ");
		 	ecn.setSqlWhereArgs(sqlWList);
		 	ecn.getColMap().put("CEI_ECN_EXAMINEEMP", ceiEcnExamineEmp);
		 	ecn.getColMap().put("CEI_ECN_APPROVALEMP", ceiEcnApprovalEmp);
		 	ecn.getColMap().put("CEI_ECN_TYPE", "2");
		 	ecn.getColMap().put("CEI_ECN_EXAMINEDATE", sdf1.parse(sdf1.format(new Date())));
		 	if(dataAuth!=null){
		 		ecn.getColMap().put("DATA_AUTH", dataAuth);
		    }
		 	modelService.edit(ecn);
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("审核失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("审核成功"), "0");
	}

}
