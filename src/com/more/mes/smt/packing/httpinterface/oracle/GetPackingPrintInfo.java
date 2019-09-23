package com.more.mes.smt.packing.httpinterface.oracle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.smt.packing.service.oracle.PackingPrintService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
/**
 * HttpCoreService 提供如下:
 *          Map result; 返回结果类型 key: json为json解析       xml 用xml解析     obj 返回对象
 *          Map<String, String> paramTo; 传递参数   service.getParamTo().get("name");
 *          Map resultDto; xml 解析时需要 对象的 .class：
 *                                      resultName.put("xmlBean", HttpConfigDto.class);
 *                                      service.setResultDto(resultName);
 *          DataInteraction dit;对象传输时用到：
 *                                      service.getDit().get("name");
 *                                      service.getDit().put("name", "test");  
 *          Map paramLog; log日志：
 *                          Map map = service.getParamLog();
 *                          map.put("message","用户自定义信息");
 *                          super.log(map);
 */
public class GetPackingPrintInfo extends InterfaceLog implements IhttpServiceJosn {
    private final Log log = LogFactory.getLog(this.getClass());
	@Override
	public String exeFunc(HttpCoreService service) {
		Map map = new HashMap();
		try{
		    String path = service.getRequest().getSession().getServletContext().getRealPath("/");    
			//log.error("+++++++++++++++++:"+path);
			String itemSn = String.valueOf(service.getDit().get("boxSn"));
		    String listId = String.valueOf(service.getDit().get("listId"));
		    String titleFlag = String.valueOf(service.getDit().get("titleFlag"));
		    PackingPrintService packingPrintService = new PackingPrintService();
		    List<Map> resultList = packingPrintService.getPrintHtml(itemSn, listId,titleFlag,path);
		    service.getDit().put("Result",resultList);
		    return null;
		}catch(Exception e){
		    log.error("-------------GetPackingPrintInfo error:",e);
			 service.getDit().put("Result", "interfaceExecError("+e.getMessage()+")");
			 return null;
		}
		
	}

}
