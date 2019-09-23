package com.more.mes.parameterconfig;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import bsh.This;

/**
 * @Description 删除参数配置信息
 * @ClassName DelParameter
 * @author WZY
 */
public class DelParameter implements FuncService {
	private final Log log = LogFactory.getLog(This.class);

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modAction.getRequest();
		String iframeId = request.getParameter("iframeid");
		String arryid = request.getParameter("arryid");
		String arr[] = arryid.split(",");// 项目编码
		String dataAuth = String.valueOf(modAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String sql = "SELECT VR_CLASS,DEL_FLAG FROM T_SYS_PARAMETER_INI WHERE id=? ";

		try {
			int num = arr.length;
			for (int i = 0; i < num; i++) {
				String crClass = arr[i];

				if (i == 0) {
					for (int j = 0; j < num; j++) {

						String ids = arr[j];
						List<Map> caIdLists = modelService.listDataSql(sql, new Object[] { ids });
						Map<String, String> countMaps = caIdLists.get(0);
						String delFlag;// 判断可删除标志是否为是
						String vrClass = countMaps.get("VR_CLASS");
						if (caIdLists.size() < 1) {
							delFlag = "Y";
						} else {

							delFlag = countMaps.get("DEL_FLAG");

						}

						if (delFlag.equals("N")) {
							return modAction.alertParentInfo(vrClass + modAction.getText("该项目编码不可删除"));
						}
					}

				}

				ArrayList delWkList = new ArrayList();
				TableDataMapExt wkTable = new TableDataMapExt();
				wkTable.setTableName("T_SYS_PARAMETER_INI");
				wkTable.setSqlWhere(" and id=? ");
				delWkList.add(crClass);
				wkTable.setSqlWhereArgs(delWkList);
				modelService.del(wkTable);
			}
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e);
			throw new BussException("删除失败");
		}

		return modAction.reloadIframeById(iframeId, modAction.getText("删除成功"));
	}

}
