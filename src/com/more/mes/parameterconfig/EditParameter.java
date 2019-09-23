package com.more.mes.parameterconfig;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 修改参数配置信息
 * @ClassName DelParameter
 * @author WZY
 * 
 */
public class EditParameter implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		/*
		 * String prgName =request.getParameter("paraMapObj.PRG_NAME"); String vrType
		 * =request.getParameter("paraMapObj.VR_TYPE"); String vrClass
		 * =request.getParameter("paraMapObj.VR_CLASS"); String vrItem
		 * =request.getParameter("paraMapObj.VR_ITEM"); String vrDesc
		 * =request.getParameter("paraMapObj.VR_DESC"); String VR_NAME
		 * =request.getParameter("paraMapObj.VR_NAME"); String VR_VALUE
		 * =request.getParameter("paraMapObj.VR_VALUE"); String VR_FLAG
		 * =request.getParameter("paraMapObj.VR_FLAG"); String DEL_FLAG
		 * =request.getParameter("paraMapObj.DEL_FLAG"); String VR_MEMO
		 * =request.getParameter("paraMapObj.VR_MEMO"); String DATA_AUTH =
		 * request.getParameter("paraMapObj._DATA_AUTH");
		 */
		String prgName = request.getParameter("paraMapObj.PRG_NAME");// 管控类别
		String vrType = request.getParameter("paraMapObj.VR_TYPE");// 管控层级
		String vrClass = request.getParameter("paraMapObj.VR_CLASS");// 项目编码
		String vrItem = request.getParameter("paraMapObj.VR_ITEM");// 项目名称
		String vrDesc = request.getParameter("paraMapObj.VR_DESC");// 项目描述
		String vrName = request.getParameter("paraMapObj.VR_NAME");// 显示方式
		String vrValue = request.getParameter("paraMapObj.VR_VALUE");// 默认值
		String vrFlag = request.getParameter("paraMapObj.VR_FLAG");// 前台显示
		String delFlag = request.getParameter("paraMapObj.DEL_FLAG");// 是否删除
		String vrMemo = request.getParameter("paraMapObj.VR_MEMO");// 备注
		String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");// 组织机构
		String vrFunc = request.getParameter("paraMapObj.VR_FUNC");// 关联功能
		String vrDefValue = request.getParameter("paraMapObj.VR_DEF_VALUE");// 默认值

		if (StringUtils.isBlank(vrFlag))// 为空不可显示
		{
			vrFlag = "N";
		}
		if (StringUtils.isBlank(delFlag))// 为空不可删除
		{
			delFlag = "N";
		}

		try {
			TableDataMapExt device = new TableDataMapExt();
			List<Object> sqlwList = new ArrayList<Object>();
			device.setTableName("T_SYS_PARAMETER_INI");
			// CommMethod.editSysDefCol(device.getColMap(), modelAction.getUser());
			device.setSqlWhere("and VR_CLASS = ? and DATA_AUTH = ? ");
			sqlwList.add(vrClass);
			sqlwList.add(dataAuth);
			device.setSqlWhereArgs(sqlwList);
			device.getColMap().put("PRG_NAME", prgName);
			device.getColMap().put("VR_TYPE", vrType);
			device.getColMap().put("VR_ITEM", vrItem);
			device.getColMap().put("VR_DESC", vrDesc);
			device.getColMap().put("VR_NAME", vrName);
			device.getColMap().put("VR_VALUE", vrValue);
			device.getColMap().put("VR_FLAG", vrFlag);
			device.getColMap().put("DEL_FLAG", delFlag);
			device.getColMap().put("VR_MEMO", vrMemo);
			device.getColMap().put("VR_FUNC", vrFunc);
			device.getColMap().put("VR_DEF_VALUE", vrDefValue);
			// if (dataAuth!=null)
			// {
			// device.getColMap().put("DATA_AUTH", dataAuth);
			// }

			modelService.edit(device);
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"), e);
		}

		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}

}
