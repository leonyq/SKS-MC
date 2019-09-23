package com.more.mes.smt.wmsStockInfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.led.executor.Shelfexecutor;

/**
 * 仓库库存亮灯
 * @author development
 *
 */
public class AjaxStockLight implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		Map<String, String> map = new HashMap<String, String>();
		try {
		   
			String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
			String itemCode = request.getParameter("itemCode");
			String itemName = request.getParameter("itemName");
			String supCode = request.getParameter("supCode");//供应商
			String itemSn = request.getParameter("itemSn");//物料SN
			String containerSn = request.getParameter("containerSn");//容器SN
			String custCode = request.getParameter("custCode");//客户
			String docNum = request.getParameter("docNum");//仓库单据号
			String connectDoc = request.getParameter("connectDoc");//关联单号
			String whCode = request.getParameter("whCode");//仓库
			String districtCode = request.getParameter("districtCode");//库区
			String storageCode = request.getParameter("storageCode");//库位
			String itemState = request.getParameter("itemState");//物料状态
			String inspectFlag = request.getParameter("inspectFlag");//检验标志
			String freezeFlag = request.getParameter("freezeFlag");//冻结标志
			String receiveBegin = request.getParameter("receiveBegin");//入库时间
			String receiveEnd = request.getParameter("receiveEnd");
			String invalidBegin = request.getParameter("invalidBegin");//保质期
			String invalidEnd = request.getParameter("invalidEnd");
			ProFuncDto pf = new ProFuncDto();
			int[] inPlace = {1, 2, 3, 4, 5, 6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
		    int[] outplace = {21};
		    List<Object> list2 = new ArrayList<Object>();
		    List<Object> outType = new ArrayList<Object>();
		    list2.add("1");
		    list2.add(dataAuth);
		    list2.add(itemCode);
		    list2.add(itemName);
		    list2.add(supCode);
		    list2.add(itemSn);
		    list2.add(containerSn);
		    list2.add(custCode);
		    list2.add(docNum);
		    list2.add(connectDoc);
		    list2.add(whCode);
		    list2.add(districtCode);
		    list2.add(storageCode);
		    list2.add(itemState);
		    list2.add(inspectFlag);
		    list2.add(freezeFlag);
		    list2.add(receiveBegin);
		    list2.add(receiveEnd);
		    list2.add(invalidBegin);
		    list2.add(invalidEnd);
		    outType.add("String");
		    pf.setClassName("P_W_STOCK_LIGHT_PAGE");//库存亮灯
		    pf.setInPlace(inPlace);//存储过程中in 
		    pf.setOutPlace(outplace); //存储过程中out
		    pf.setValArgs(list2);//存储过程中输入的参数
		    pf.setTotalLen(list2.size()+outType.size());//总个数
		    pf.setOutValType(outType);//输出的参数
		    List<Object> relist = modelService.procComm(pf);//接收返回值
		    String res = (String) relist.get(0);  //结果
		    if(!res.equals("OK")){
				map.put("returnMsg", "addError2");
				map.put("res", res);
		    }else{
		    	String sql = "select T.CMD from T_WMS_BACKUP_MAT_CMD t WHERE T.DOC_NUM='00000000' AND T.DATA_AUTH=? ";
				List<Map> cmdList = modelService.listDataSql(sql, new Object[]{dataAuth});
				String cmd = null;
				if(cmdList!=null&&cmdList.size()>0){
					int num = cmdList.size();
					String offCmd = "";//灭灯
					String ligCmd = "";//亮灯
					String flaCmd = "";//闪灯
					for(int i=0;i<num;i++){
						cmd = (String) cmdList.get(i).get("CMD");
						if(cmd.indexOf("@@OFF")!=-1){ //有灭灯指令
							String[] cmdStr = cmd.split("@@OFF");
							offCmd += cmdStr[1].substring(cmdStr[1].indexOf("[")+1, cmdStr[1].indexOf("]"));
						}
						if(cmd.indexOf("@@LIGHT")!=-1){ //有亮灯指令
							String[] cmdStr = cmd.split("@@LIGHT");
							ligCmd += cmdStr[1].substring(cmdStr[1].indexOf("[")+1, cmdStr[1].indexOf("]"));
						}
						if(cmd.indexOf("@@FLASH")!=-1){ //有闪灯指令
							String[] cmdStr = cmd.split("@@FLASH");
							flaCmd += cmdStr[1].substring(cmdStr[1].indexOf("[")+1, cmdStr[1].indexOf("]"));
						}
					}
					String lightCmd = offCmd + ligCmd + flaCmd;
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
		    }
		    modelAction.setAjaxMap(map);
		} catch (Exception e) {
			log.error(e);
			map.put("returnMsg", "addError");
			modelAction.setAjaxMap(map);
		}
		
		return BaseActionSupport.AJAX;
	}
	
	@SuppressWarnings("unchecked")
	private Map msgPopData(ModelAction modelAction, String alertMsg)
	  {
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
	
}
