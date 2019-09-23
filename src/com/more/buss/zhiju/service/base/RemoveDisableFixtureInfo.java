package com.more.buss.zhiju.service.base;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 制具解除禁用
 * @author development
 *
 */
public class RemoveDisableFixtureInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		try {
			String delId = request.getParameter("delId");//需要解禁的id
			if(delId!=null&&!delId.equals("")) {
				String[] strArray = delId.split(",");
				int num = strArray.length;
				List<Object> sqlWList = null;
				//改变制具状态
				TableDataMapExt stock = new TableDataMapExt();
				stock.setTableName("T_CO_FIXTURE_INFO");
				for(int i=0;i<num;i++){
					sqlWList = new ArrayList<Object>();
					sqlWList.add(strArray[i]);
					stock.getColMap().clear();
					stock.setSqlWhere(" and ID=? ");
					stock.setSqlWhereArgs(sqlWList);
					stock.getColMap().put("CFI_FIX_STATUS", "0");
					modelService.edit(stock);
				}
			}else {
				return modelAction.alertParentInfo("需要解禁的id为空");
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("解禁失败"), e);
		}
		return modelAction.reloadParent(modelAction.getText("解禁成功"));
	}

}
