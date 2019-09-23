package com.more.mes.smt.appmanage;

import java.io.File;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description APP功能---导航配置---默认图片
 * @ClassName AddFuncInfo
 * @author ht
 */
public class GetNavImg implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String path = modelAction.getRequest().getSession().getServletContext()
				.getRealPath("buss" + Constants.SEPARATOR + "images" + Constants.SEPARATOR + "app");
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

		modelAction.setDataList(list);
		return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面

	}
}
