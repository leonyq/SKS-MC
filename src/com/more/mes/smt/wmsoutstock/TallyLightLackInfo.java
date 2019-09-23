package com.more.mes.smt.wmsoutstock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 理货单-单据亮灯 缺料信息
 * 
 * @author development
 *
 */
public class TallyLightLackInfo implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String docNum = request.getParameter("docNum");
		String sql = "select T.CMD from T_WMS_BACKUP_MAT_CMD t WHERE T.DOC_NUM= ?";
		List<Map> cmdList = modelService.listDataSql(sql, new Object[] { docNum });
		String cmd = null;
		List<Map> lackList = new ArrayList<Map>();
		if (cmdList != null && cmdList.size() > 0) {
			int num = cmdList.size();
			String lack = "";// 缺料信息
			for (int i = 0; i < num; i++) {
				cmd = (String) cmdList.get(i).get("CMD");
				if (cmd.indexOf("@@LACK") != -1) { // 有缺料信息
					String[] cmdStr = cmd.split("@@LACK");
					lack += cmdStr[1].substring(cmdStr[1].indexOf("[") + 1, cmdStr[1].indexOf("]"));
				}
			}
			String repStr = lack.replaceAll("\\{", "");
			String[] spStr = repStr.split("}");// 有多少料缺料
			int sNum = spStr.length;
			for (int i = 0; i < sNum; i++) {
				String[] firLack = spStr[i].split(",");
				Map<String, String> map = new HashMap<String, String>();
				map.put("itemCode", firLack[0]);
				map.put("needNum", firLack[1]);
				map.put("eleNum", firLack[2]);
				map.put("comNum", firLack[3]);
				map.put("lackNum", firLack[4]);
				lackList.add(map);
			}
		}
		modelAction.setAjaxList(lackList);
		return BaseActionSupport.AJAX;
	}

}
