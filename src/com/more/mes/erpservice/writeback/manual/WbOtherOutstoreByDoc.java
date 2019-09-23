package com.more.mes.erpservice.writeback.manual;

import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.ReentrantLock;
import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.mes.erpservice.writeback.WbOtherOutstoreServiceJob;
import com.more.mes.erpservice.writeback.WbProCollarServiceJob;
/**
 * 金碟u8ERP
 * 手动回写其他出库单
 * 
 */
public class WbOtherOutstoreByDoc implements FuncService {
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");
	private Log log = LogFactory.getLog(this.getClass());
	private static ReentrantLock lock = new ReentrantLock();
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		try {
			lock.lock();
			HttpServletRequest request = modelAction.getRequest();
			String wriDocNum = request.getParameter("wriDocNum");
			String LOGIN_NAME = CommMethod.getSessionUser().getLoginName();
			
			String result="";
			String WOD_DISPATCH_SN=this.getWOD_DISPATCH_SN(wriDocNum);
			
			if(StringUtils.isNotBlank(WOD_DISPATCH_SN)&& WOD_DISPATCH_SN.equals("OOZLDLL")){
				WbProCollarServiceJob proCollar=new WbProCollarServiceJob();
				result = proCollar.proCollar(wriDocNum,LOGIN_NAME);//回写结果，成功返回空
			}else{
				WbOtherOutstoreServiceJob outstore=new WbOtherOutstoreServiceJob();
				result = outstore.outstore(wriDocNum,LOGIN_NAME);//回写结果，成功返回空
			}
			
			if (StringUtils.isBlank(result)) {
				result = "回写成功";
			}
			modelAction.setAjaxString(result);
		} catch (Exception e) {
			log.error(e.toString());
			modelAction.setAjaxString(e.toString());
		} finally {
			lock.unlock();
		}
		return BaseActionSupport.AJAX;
	}
	
	private String getWOD_DISPATCH_SN(String docnum){
		String result="";
		String sql="select * from t_wms_outstock_doc t where WOD_DOC_NUM=?";
		List<Map<String,String>> list=modelService.listDataSql(sql, new Object[]{docnum});
		if(list!=null&&list.size()>0){
			result=list.get(0).get("WOD_DISPATCH_SN");
		}
		return result;
	}
}
