package com.more.mes.smt.processinfo;

import java.io.File;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title
 * @Description 工序信息-------选择默认图片
 * @ClassName GroupChoosePic
 * @author Administrator
 * @version 1.0 developer 2017-10-11 created
 * @see GroupChoosePic
 * @since 2017-10-11
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class GroupChoosePic implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("rawtypes")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String path = modelAction.getRequest().getSession().getServletContext().getRealPath("plf" + Constants.SEPARATOR
				+ "page" + Constants.SEPARATOR + "fp" + Constants.SEPARATOR + "img" + Constants.SEPARATOR + "process");
		// .getRealPath("plf/page/fp/img/process");
		File file = new File(path);
		File[] files = file.listFiles();
		LinkedList<Map> list = new LinkedList<Map>();
		Map map = null;
		if (files != null) {
			for (File file2 : files) {
				map = new HashMap<String, Object>();
				map.put("picName", file2.getName());
				list.add(map);
			}
		}
		CommMethod.listToEscapeJs(list);
		modelAction.setDataList(list);
		return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面

	}
}