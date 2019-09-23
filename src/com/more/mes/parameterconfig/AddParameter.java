package com.more.mes.parameterconfig;

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
 * @Description 新增参数配置信息
 * @ClassName DelParameter
 * @author WZY
 * 
 */
public class AddParameter implements FuncService {
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

		String prgName = request.getParameter("paraMap1@0#PRG_NAME");// 管控类别
		String vrType = request.getParameter("paraMap1@0#VR_TYPE");// 管控层级
		String vrClass = request.getParameter("paraMap1@0#VR_CLASS");// 项目编码
		String vrItem = request.getParameter("paraMap1@0#VR_ITEM");// 项目名称
		String vrDesc = request.getParameter("paraMap1@0#VR_DESC");// 项目描述
		String vrName = request.getParameter("paraMap1@0#VR_NAME");// 显示方式
		String vrValue = request.getParameter("paraMap1@0#VR_VALUE");// 默认值
		String vrFlag = request.getParameter("paraMap1@0#VR_FLAG");// 前台显示
		String delFlag = request.getParameter("paraMap1@0#DEL_FLAG");// 是否删除
		String vrMemo = request.getParameter("paraMap1@0#VR_MEMO");// 备注
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));// 组织机构
		String vrFunc = request.getParameter("paraMap1@0#VR_FUNC");// 关联功能
		String vrDefValue = request.getParameter("paraMap1@0#VR_DEF_VALUE");// 默认值
		String uuid = StringUtils.getUUID();// id
		if (StringUtils.isBlank(vrFlag)) {
			vrFlag = "N";
		}
		if (StringUtils.isBlank(delFlag)) {
			delFlag = "N";
		}

		try {
			int count = 0;
			String sql = "SELECT VR_CLASS AS COUNT FROM T_SYS_PARAMETER_INI WHERE VR_CLASS=? AND DATA_AUTH=? ";

			count = modelService.countSql(sql, new Object[] { vrClass, dataAuth });

			if (count > 0) {
				return modelAction.alertParentInfo(modelAction.getText("该项目编码已存在"));
			}

			TableDataMapExt device = new TableDataMapExt();
			device.setTableName("T_SYS_PARAMETER_INI");
			CommMethod.addSysDefCol(device.getColMap(), modelAction.getUser());
			device.getColMap().put("PRG_NAME", prgName);
			device.getColMap().put("VR_TYPE", vrType);
			device.getColMap().put("VR_CLASS", vrClass);
			device.getColMap().put("VR_ITEM", vrItem);
			device.getColMap().put("VR_DESC", vrDesc);
			device.getColMap().put("VR_NAME", vrName);
			device.getColMap().put("VR_VALUE", vrValue);
			device.getColMap().put("VR_FLAG", vrFlag);
			device.getColMap().put("DEL_FLAG", delFlag);
			device.getColMap().put("VR_MEMO", vrMemo);
			device.getColMap().put("VR_DEF_VALUE", vrDefValue);
			device.getColMap().put("VR_FUNC", vrFunc);
			// if (null!=dataAuth)
			// {
			// device.getColMap().put("DATA_AUTH", dataAuth);
			// }

			// device.getColMap().put("ID", uuid);
			modelService.save(device);

		} catch (Exception e) {
			// TODO: handle exception
			log.error(e);
			throw new BussException(modelAction.getText("新增失败"), e);
		}

		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}

}
