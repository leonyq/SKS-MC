package com.more.mes.smt.appmanage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 删除勾选的功能配置信息
 * @author Administrator
 *
 */
public class DelAppManageInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		try {
			String[] manageId = request.getParameterValues("selectName");//ID
			int count = manageId.length;
			TableDataMapExt appMan = new TableDataMapExt();
			appMan.setTableName("T_APP_SHOWMANAGE");//功能配置
			TableDataMapExt appUser = new TableDataMapExt();
			appUser.setTableName("T_APP_USER");//用户APP配置
			TableDataMapExt appRole = new TableDataMapExt();
			appRole.setTableName("T_APP_ROLE");//APP角色
			for(int i=0;i<count;i++){
				appMan.getColMap().clear();
				appMan.setSqlWhere(" and id=? ");
				List<Object> wList = new ArrayList<Object>();
	            wList.add(manageId[i]);
	            appMan.setSqlWhereArgs(wList);
				modelService.del(appMan);
				appUser.getColMap().clear();
				appUser.setSqlWhere(" and TAU_MOUDLE_ID=? ");
				appUser.setSqlWhereArgs(wList);
				modelService.del(appUser);
				appRole.getColMap().clear();
				appRole.setSqlWhere(" and TAR_MOUDLE_ID=? ");
				appRole.setSqlWhereArgs(wList);
				modelService.del(appRole);
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("删除失败"), e);
		}
		return modelAction.reloadParent(modelAction.getText("删除成功"));
	}

}
