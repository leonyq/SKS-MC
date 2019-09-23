package com.more.mes.smt.processinfo;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.FileCopyUtils;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.Smap;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 工序信息----新增修改保存
 * @Description 工序信息---新增修改保存
 * @ClassName SaveMTService
 * @author Administrator
 * @version 1.0 developer 2017-10-12 created
 * @see GroupSave
 * @since 2017-10-12
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class GroupSave implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String type = request.getParameter("type");
		OperResult res = null;

		if ("add".equals(type)) {
			res = modelService.addComm(request, modelAction.getUser(), modelAction);

		} else if ("edit".equals(type)) {
			Smap smapTemp = modelAction.getParaMapObj();
			smapTemp.initParam();
			res = modelService.editComm(request, modelAction.getCurrUser(), smapTemp, modelAction);

		}
		if (res.isSuccess()) {
			String saveName = null;
			File file = null;
			byte[] b = null;
			String serverfileName = request.getParameter("serverfileName");
			if (StringUtils.isNotBlank(serverfileName)) {
				String path = modelAction.getRequest().getSession().getServletContext()
						.getRealPath("plf" + Constants.SEPARATOR + "page" + Constants.SEPARATOR + "fp"
								+ Constants.SEPARATOR + "img" + Constants.SEPARATOR + "process");
				file = new File(path + Constants.SEPARATOR + serverfileName);
				saveName = StringUtils.getUUID() + "." + CommMethod.getFileExtName(serverfileName);
				File savefile = new File(
						new StringBuilder().append(Constants.getWEB_ROOT_PATH()).append(Constants.BUSS_FILE_ROOT_PATH)
								.append(Constants.SEPARATOR).append(Constants.SEPARATOR).append(saveName).toString());

				try {
					if (!savefile.getParentFile().exists())
						savefile.getParentFile().mkdirs();
					FileCopyUtils.copy(file, savefile);
					b = FileCopyUtils.copyToByteArray(file);
				} catch (IOException e) {
					return modelAction.alertParentInfo(e.getMessage());
				}
				TableDataMapExt tdMap = new TableDataMapExt();
				tdMap.setTableName("T_CO_GROUP");
				tdMap.setSqlWhere("and id = ? ");
				if ("add".equals(type)) {
					tdMap.getSqlWhereArgs().add(res.getInfoMap().get("ID"));

				}
				if ("edit".equals(type)) {
					tdMap.getSqlWhereArgs().add(modelAction.getDataId());

				}
				Map map = tdMap.getColMap();

				map.put("PHOTO_NAME", serverfileName);
				map.put("PHOTO_PATH", saveName);
				map.put("PHOTO_SIZE", file.length());
				map.put("GROUP_PHOTO", b);

				modelService.edit(tdMap);
			}

		} else {
			return modelAction.alertParentInfo(res.getInfo());
		}
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口

		// 保存并关闭窗口
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		if ("edit".equals(type)) {
			return modelAction.commAjaxFunClassLoadParent(formId, iframeId, Constants.SUCCESS,
					Constants.OPERATE_TYPE_EDIT);
		} else {
			return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);

		}

	}
}
