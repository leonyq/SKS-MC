package com.more.mes.smt.usermanager.employeereward;

import java.util.Map;

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
 * 保存新增的奖惩信息
 * 
 * @author development
 */
public class AjaxDelReward implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
	    HttpServletRequest request = modelAction.getRequest();
		String rewardId = modelAction.getParaMap().get("rewardId");
        String iframeId = request.getParameter("iframeId");
		if (StringUtils.isBlank(iframeId)) {
			iframeId = "iframe1";
		}
		
		String delSql = "DELETE FROM T_USER_REWARD WHERE ID=?";
		try {
			if (StringUtils.isNotBlank(rewardId)) {
				modelService.execSql(delSql, new Object[] {rewardId}) ;
			}

		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("删除失败"), e);
		}
		 return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}
}