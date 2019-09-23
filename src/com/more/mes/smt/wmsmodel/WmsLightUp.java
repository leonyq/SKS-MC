package com.more.mes.smt.wmsmodel;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.led.executor.Shelfexecutor;

/**
 * 仓库建模-亮灯
 * 
 * @author development
 *
 */
public class WmsLightUp implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		try {
			String whCode = request.getParameter("areaSn");
			String res = light(whCode, modelService, modelAction);
			if (!res.equals("OK")) {
				return modelAction.alertParentInfo(res);
			}
			String sql = "select T.CMD from T_WMS_BACKUP_MAT_CMD t WHERE T.DOC_NUM=? AND T.DATA_AUTH=? ";
			List<Map> cmdList = modelService.listDataSql(sql, new Object[] { whCode, dataAuth });
			String cmd = null;
			if (cmdList != null && cmdList.size() > 0) {
				int num = cmdList.size();
				String offCmd = "";// 灭灯
				String ligCmd = "";// 亮灯
				String flaCmd = "";// 闪灯
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
				}
				String lightCmd = offCmd + ligCmd + flaCmd;
				Shelfexecutor shel = new Shelfexecutor();
				shel.Execute(lightCmd);
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("亮灯失败"), e);
		}
		return modelAction.reloadParent(modelAction.getText("亮灯成功"));
	}

	@SuppressWarnings("unchecked")
	public String light(String whCode, ModelService modelService, ModelAction modelAction) {
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = { 1, 2, 3, 4, 5, 6, 7 };
		int[] outplace = { 8 };
		List<Object> list2 = new ArrayList<Object>();
		List<Object> outType = new ArrayList<Object>();
		list2.add(dataAuth);
		list2.add(null);
		list2.add(whCode);
		list2.add(null);
		list2.add(null);
		list2.add("1");
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
