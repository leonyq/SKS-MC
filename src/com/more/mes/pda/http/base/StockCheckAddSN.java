package com.more.mes.pda.http.base;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.pda.service.PdaBaseServiceUtils;
import com.more.mes.pda.service.oracle.PdaServiceUtils;

public class StockCheckAddSN   extends InterfaceLog implements IhttpServiceJosn{
	public ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");
	@Override
	public String exeFunc(HttpCoreService service) {
		// TODO Auto-generated method stub
		Map map = new HashMap<>();
		try {
			int CODE = 0;
			String strOrgCode = StringUtils.toString(service.getParamTo().get("strOrgCode"));
			String WSC_DOC_NUM = StringUtils.toString(service.getParamTo().get("WSC_DOC_NUM"));
			String ITEM_SN = StringUtils.toString(service.getParamTo().get("ITEM_SN"));
			String ITEM_TYPE = StringUtils.toString(service.getParamTo().get("ITEM_TYPE"));
			String ITEM_NUM = StringUtils.toString(service.getParamTo().get("ITEM_NUM"));
			String MSG = StringUtils.toString(service.getParamTo().get("MSG"));
			PdaServiceUtils serviceUtils=new PdaServiceUtils();
			ProFuncDto pf = new ProFuncDto();
			int[] inPlace = {1, 2, 3};
		    int[] outplace = {4,5,6,7};
		    List<Object> list2 = new ArrayList<Object>();
		    List<Object> outType = new ArrayList<Object>();
		    list2.add(strOrgCode);
		    list2.add(WSC_DOC_NUM);
		    list2.add(ITEM_SN);
		    outType.add("String");
		    outType.add("String");
		    outType.add("String");
		    outType.add("String");
		    pf.setClassName("P_W_INVENTORY_GET_INFO");//库存亮灯
		    pf.setInPlace(inPlace);//存储过程中in 
		    pf.setOutPlace(outplace); //存储过程中out
		    pf.setValArgs(list2);//存储过程中输入的参数
		    pf.setTotalLen(list2.size()+outType.size());//总个数
		    pf.setOutValType(outType);//输出的参数
		    List<Object> relist = modelService.procComm(pf);
		    String jsonStr = "";
			if (relist!=null&&relist.size()>0) {
				ITEM_TYPE = (String)relist.get(0);
			    ITEM_NUM = (String)relist.get(1);
			    CODE = (int)(Double.parseDouble((String)relist.get(2)));
			    MSG = (String)relist.get(3);
			    boolean flag = false;
			    if (CODE == 0)
	            {
	                flag = true;
	            }
				jsonStr = "\""+Boolean.toString(flag).toLowerCase() + ";" + ITEM_TYPE + ";" + ITEM_NUM + ";" + MSG+"\"";
				String temp = PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr);
				map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
				service.setResult(map);
			}
			else{
				jsonStr=PdaBaseServiceUtils.optError;
				map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), jsonStr));
			}
			return null;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), e.toString()));
			service.setResult(map);
	          return null;
		}
	}
}
