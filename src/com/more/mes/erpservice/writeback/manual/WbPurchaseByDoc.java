package com.more.mes.erpservice.writeback.manual;

import java.util.concurrent.locks.ReentrantLock;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.mes.erpservice.writeback.WbPurchaseServiceJob;

/**
 * 金碟u8ERP
 * 采购入库单手动回写
 * 
 */
public class WbPurchaseByDoc implements FuncService {
	private Log log = LogFactory.getLog(this.getClass());
	private static ReentrantLock lock = new ReentrantLock();

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		try {
			lock.lock();
			HttpServletRequest request = modelAction.getRequest();
			String wriDocNum = request.getParameter("wriDocNum");
			String loginName = CommMethod.getSessionUser().getLoginName();

			WbPurchaseServiceJob purchase = new WbPurchaseServiceJob();
			String result = purchase.purchase(wriDocNum,loginName);//回写结果，成功返回空
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
}
