package com.more.buss.zhiju.service.base;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
 * 制具禁用
 * @author development
 *
 */
public class DisableFixtureInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		try {
			String delId = request.getParameter("delId");//需要禁用的id
			if(delId!=null&&!delId.equals("")) {
				String[] strArray = delId.split(",");
				int num = strArray.length;
				//改变制具状态
				List<Object> sqlWList = null;
				TableDataMapExt stock = new TableDataMapExt();
				stock.setTableName("T_CO_FIXTURE_INFO");
				for(int i=0;i<num;i++){
					sqlWList = new ArrayList<Object>();
					sqlWList.add(strArray[i]);
					stock.getColMap().clear();
					stock.setSqlWhereArgs(sqlWList);
					stock.setSqlWhere(" and ID=? ");
					stock.getColMap().put("CFI_FIX_STATUS", "5");
					modelService.edit(stock);
				}
			}else {
				return modelAction.alertParentInfo("需要禁用的id为空");
			}
			
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("禁用失败"), e);
		}
		return modelAction.reloadParent(modelAction.getText("禁用成功"));
	}

}
