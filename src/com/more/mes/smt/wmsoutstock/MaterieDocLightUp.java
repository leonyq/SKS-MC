package com.more.mes.smt.wmsoutstock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.led.executor.Shelfexecutor;

/**
 * 生产领料-单据亮灯
 * 
 * @author development
 *
 */
public class MaterieDocLightUp implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		Map<String, String> map = new HashMap<String, String>();
		try {
			String docNum = request.getParameter("docNum");
			// String dataAuth = request.getParameter("dataAuth");
			String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
			String res = light(docNum, dataAuth, modelService);
			if (!res.equals("OK")) {
				map.put("returnMsg", "addError2");
				map.put("res", res);
			} else {
				String sql = "select T.CMD from T_WMS_BACKUP_MAT_CMD t WHERE T.DOC_NUM= ? AND T.DATA_AUTH=?";
				List<Map> cmdList = modelService.listDataSql(sql, new Object[] { docNum, dataAuth });
				String cmd = null;
				if (cmdList != null && cmdList.size() > 0) {
					int num = cmdList.size();
					String offCmd = "";// 灭灯
					String ligCmd = "";// 亮灯
					String flaCmd = "";// 闪灯
					String lack = "";// 缺料信息
					for (int i = 0; i < num; i++) {
						cmd = (String) cmdList.get(i).get("CMD");
						if (cmd.indexOf("@@OFF") != -1) { // 有灭灯指令
							String[] cmdStr = cmd.split("@@OFF");
							offCmd += cmdStr[1].substring(cmdStr[1].indexOf("[") + 1, cmdStr[1].indexOf("]"));
						}
						if (cmd.indexOf("@@LIGHT") != -1) { // 有亮灯指令
							String[] cmdStr = cmd.split("@@LIGHT");
							ligCmd += cmdStr[1].substring(cmdStr[1].indexOf("[") + 1, cmdStr[1].indexOf("]"));
						}
						if (cmd.indexOf("@@FLASH") != -1) { // 有闪灯指令
							String[] cmdStr = cmd.split("@@FLASH");
							flaCmd += cmdStr[1].substring(cmdStr[1].indexOf("[") + 1, cmdStr[1].indexOf("]"));
						}
						if (cmd.indexOf("@@LACK") != -1) { // 有缺料信息
							String[] cmdStr = cmd.split("@@LACK");
							lack += cmdStr[1].substring(cmdStr[1].indexOf("[") + 1, cmdStr[1].indexOf("]"));
						}
					}
					String lightCmd = offCmd + ligCmd + flaCmd;
					if (!lack.equals("")) { // 有缺料信息
						if (!lightCmd.equals("")) { // 有命令
							map.put("returnMsg", "addSucc1");
							String alertMsg1 = modelAction.getText("亮灯成功");
							map.put("alertMsg", (String) msgPopData(modelAction, alertMsg1).get("alertMsg"));
							map.put("title", (String) msgPopData(modelAction, alertMsg1).get("title"));
							map.put("width", (String) msgPopData(modelAction, alertMsg1).get("width"));
							map.put("height", (String) msgPopData(modelAction, alertMsg1).get("height"));
							map.put("time", (String) msgPopData(modelAction, alertMsg1).get("time"));
							Shelfexecutor shel = new Shelfexecutor();
							shel.Execute(lightCmd);
						} else {
							map.put("returnMsg", "addError");
						}
					} else {
						map.put("returnMsg", "addSucc");
						String alertMsg1 = modelAction.getText("亮灯成功");
						map.put("alertMsg", (String) msgPopData(modelAction, alertMsg1).get("alertMsg"));
						map.put("title", (String) msgPopData(modelAction, alertMsg1).get("title"));
						map.put("width", (String) msgPopData(modelAction, alertMsg1).get("width"));
						map.put("height", (String) msgPopData(modelAction, alertMsg1).get("height"));
						map.put("time", (String) msgPopData(modelAction, alertMsg1).get("time"));
						Shelfexecutor shel = new Shelfexecutor();
						shel.Execute(lightCmd);
					}
				} else {
					map.put("returnMsg", docNum);
				}
			}
			modelAction.setAjaxMap(map);
		} catch (Exception e) {
			log.error(e);
			map.put("returnMsg", "addError");
		}
		return BaseActionSupport.AJAX;
	}

	@SuppressWarnings("unchecked")
	private Map msgPopData(ModelAction modelAction, String alertMsg) {
		Map map = new HashMap<String, Object>();
		String title = ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
		title = modelAction.getText(title);
		String width = ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
		String height = ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
		String time = ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
		map.put("title", title);
		map.put("width", width);
		map.put("height", height);
		map.put("time", time);
		map.put("alertMsg", alertMsg);
		return map;
	}

	@SuppressWarnings("unchecked")
	public String light(String docNum, String dataAuth, ModelService modelService) {
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = { 1, 2, 3, 4, 5, 6, 7 };
		int[] outplace = { 8 };
		List<Object> list2 = new ArrayList<Object>();
		List<Object> outType = new ArrayList<Object>();
		list2.add(dataAuth);
		list2.add(docNum);
		list2.add(null);
		list2.add(null);
		list2.add(null);
		list2.add("14");
		list2.add(CommMethod.getSessionUser().getLoginName());
		outType.add("String");
		pf.setClassName("P_W_STOCK_LIGHT");// 货架亮灯
		pf.setInPlace(inPlace);// 存储过程中in
		pf.setOutPlace(outplace); // 存储过程中out
		pf.setValArgs(list2);// 存储过程中输入的参数
		pf.setTotalLen(list2.size() + outType.size());// 总个数
		pf.setOutValType(outType);// 输出的参数
		List<Object> relist = modelService.procComm(pf);// 接收返回值
		String res = (String) relist.get(0); // 结果
		return res;
	}

}
