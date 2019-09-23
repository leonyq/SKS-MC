package com.more.mes.smt.storeitemmanager;

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

import examples.newsgroups;
/**
 * @Description 删除物料管控信息
 * @ClassName DelMaterialMssage
 * @author WZY
 * 
 */
public class DelMaterialMssage implements FuncService
{
	
	private final Log log = LogFactory.getLog(this.getClass());
	
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) 
	{
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		
		try 
		{
			String emp=request.getParameter("delId");
			//String dataAuth=request.getParameter("dataAuth");
			String dataAuth = String.valueOf(request.getSession().getAttribute("mcDataAuth"));
			if(emp!=null && !emp.equals("")) {
				String[] wicCtrlEmp =emp.split(",");//员工号
				//String[] dataAuthArr =dataAuth.split(",");//员工号
				TableDataMapExt tabe= new TableDataMapExt();
				tabe.setTableName("T_WMS_ITEM_CONTRAL");
				List list = new ArrayList();
				for (int i = 0; i < wicCtrlEmp.length; i++) 
				{
					tabe.setSqlWhere(" and WIC_CTRL_EMP=? and DATA_AUTH=? ");//
					list.clear();
					list.add(wicCtrlEmp[i]);
					list.add(dataAuth);
					tabe.setSqlWhereArgs(list);
					modelService.del(tabe);
				}
			}
		} catch (Exception e) 
		{
			// TODO: handle exception
			log.error(e);
			throw new BussException(modelAction.getText("删除失败"));
		}
		return modelAction.reloadParent(modelAction.getText("删除成功"));
	}

}
