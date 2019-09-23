package com.more.mes.visual.http.oracle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
/**
 * 保存仓库配置信息
 * @author hzp
 *
 */
public class SaveAreaSetInfo extends InterfaceLog implements IhttpServiceJosn {
	private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
	/**
	 * 保存配置信息
	 */
	@Override
	public String exeFunc(HttpCoreService service) {
		Map<String,Object> map = new HashMap<String,Object>();
		 String areaSn = "";//仓库编码
		 String setInfo="";//设置信息
		 if(service.getParamTo().get("areaSn")!=null){
			 areaSn = service.getParamTo().get("areaSn");
		 }
		 if(service.getParamTo().get("setInfo")!=null){
			 setInfo= service.getParamTo().get("setInfo");
		 }
		 try{
			 TableDataMapExt wmsArea = new TableDataMapExt();
			 wmsArea.setTableName("t_wms_area");
			 wmsArea.setSqlWhere(" and WA_AREA_SN=? ");
			 wmsArea.getColMap().put("WA_SET_INFO", setInfo);
			 List list = new ArrayList<>();
			 list.add(areaSn);
			 wmsArea.setSqlWhereArgs(list);
			 modelService.edit(wmsArea);
			 map.put("json", "{\"result\":\""+"success"+"\"}");
			 service.setResult(map);
		 }catch(Exception e){
			 map.put("json", "{\"error\":\""+e.toString()+"\"}");
			  service.setResult(map);
		 }
		 service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
		 service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
		 service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
		 service.getResponse().setHeader("Content-type", "text/html;charset=UTF-8");
		return null;
	}

}
