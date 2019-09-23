package com.more.mes.smt.outmoinfo;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 时序备料----开始
 * 
 * @author Administrator
 *
 */
public class StartOutMoInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modService) {
		HttpServletRequest request = modelAction.getRequest();
		String iframeId = request.getParameter("iframeid");
		String[] arr = request.getParameterValues("dc22be86e17d468fa1b1daffaab81702$ID");
		int num = arr.length;
		try {
			for (int i = 0; i < num; i++) {
				// 改变状态，通过id。
				ArrayList delWkList = new ArrayList();
				TableDataMapExt device = new TableDataMapExt();
				device.setTableName("T_WMS_OUT_MO_INFO");
				device.getColMap().put("WOM_STATUS", "1");
				device.setSqlWhere(" and id=?");
				delWkList.add(arr[i]);
				device.setSqlWhereArgs(delWkList);
				modService.edit(device);
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("操作失败"), e);
		}
		return modelAction.reloadIframeById(iframeId, modelAction.getText("操作成功"));
	}

}
