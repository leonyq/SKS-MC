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
import com.more.mes.pda.service.base.PdaServiceUtils;

public class StockSaveData  extends InterfaceLog implements IhttpServiceJosn{
	public ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");
	@Override
	public String exeFunc(HttpCoreService service) {
		// TODO Auto-generated method stub
		Map map = new HashMap<>();
		try {
			int CODE = 0;
			String strOrgCode = StringUtils.toString(service.getParamTo().get("strOrgCode"));
			String ITEM_SN = StringUtils.toString(service.getParamTo().get("ITEM_SN"));
			String WSC_DOC_NUM = StringUtils.toString(service.getParamTo().get("WSC_DOC_NUM"));
			String INVENTOR_NUM = StringUtils.toString(service.getParamTo().get("INVENTOR_NUM"));
			String M_EMP = StringUtils.toString(service.getParamTo().get("M_EMP"));
			String MSG = StringUtils.toString(service.getParamTo().get("MSG"));
			PdaServiceUtils serviceUtils=new PdaServiceUtils();
			ProFuncDto pf = new ProFuncDto();
			int[] inPlace = {1, 2, 3,4,5};
		    int[] outplace = {6,7};
		    List<Object> list2 = new ArrayList<Object>();
		    List<Object> outType = new ArrayList<Object>();
		    list2.add(strOrgCode);
		    list2.add(WSC_DOC_NUM);
		    list2.add(ITEM_SN);
		    list2.add(INVENTOR_NUM);
		    list2.add(M_EMP);
		    outType.add("String");
		    outType.add("String");
		    pf.setClassName("P_W_INVENTORY_SAVE_INFO");//库存亮灯
		    pf.setInPlace(inPlace);//存储过程中in 
		    pf.setOutPlace(outplace); //存储过程中out
		    pf.setValArgs(list2);//存储过程中输入的参数
		    pf.setTotalLen(list2.size()+outType.size());//总个数
		    pf.setOutValType(outType);//输出的参数
		    List<Object> relist = modelService.procComm(pf);
		    String jsonStr = "";
			if (relist!=null&&relist.size()>0) {
			    CODE = (int)(Double.parseDouble((String)relist.get(0)));
			    MSG = (String)relist.get(1);
			    boolean flag = false;
			    String cmd = "";
                String print = "";
                if (CODE == 0)
                {
//            		/**
//            		 * 0-MSG
//            		 * 1-cmd
//            		 * 2-print
//            		 */
//            		String[] outInfo=new String[3];
//            		LogicCommunicate.getSplitInfo(CommonProperties.n2Url, outInfo);
//            		MSG=outInfo[0];
//            		cmd=outInfo[1];
//            		print=outInfo[2];
//            		try {
//            			outInfo=null;
//            			outInfo=new String[1];
//            			LogicCommunicate.getLedShelf(CommonProperties.n2Url, outInfo);
//            			cmd=outInfo[0];
//            		}
//            		catch (Exception e) {
//						// TODO: handle exception
//					}
                    flag = true;
                }
				jsonStr = "\""+Boolean.toString(flag).toLowerCase() + ";"+ MSG+"\"";
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
