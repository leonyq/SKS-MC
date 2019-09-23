package com.more.mes.visual.http.pg;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import net.sf.json.JSONArray;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
/**
 * 前五大空置率
 * @author hzp
 *
 */
public class GetControlRate extends InterfaceLog implements IhttpServiceJosn {
	private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
	/**
	 * 前五大空置率
	 */
	@Override
	public String exeFunc(HttpCoreService service) {
		Map<String,Object> map = new HashMap<String,Object>();
		 String areaSn = "";//仓库编码
		 String setInfo="";//设置信息
		 if(service.getParamTo().get("areaSn")!=null){
			 areaSn = service.getParamTo().get("areaSn");
		 }
		
		 try{
		      String sql = "SELECT"+
						"	AA.WA_AREA_SN,"+
						"	ROUND("+
						"		(1 - AA.NUM / AA.CAPACITY) * 100,"+
						"		2"+
						"	) EMPTY"+
						"	FROM"+
						"	("+
						"		SELECT"+
						"			T .WA_AREA_SN,"+
						"			COUNT (A . ID) NUM,"+
						"			T .WA_STORAGE_CAPACITY CAPACITY,"+
						"				ROW_NUMBER () OVER () AS ROWNUM"+
						"		FROM"+
						"			t_wms_area T"+
						"		LEFT JOIN t_wms_stock_info A ON A .WSI_DISTRICT_CODE = T .WA_AREA_SN"+
						"		AND A .wsi_wh_code = T .WA_SUPERIOR_SN"+
						"		WHERE"+
						"			T .WA_SUPERIOR_SN =?"+
						"		AND T .WA_STORAGE_CAPACITY IS NOT NULL"+
						"		GROUP BY"+
						"			T .WA_AREA_SN,"+
						"			T .WA_STORAGE_CAPACITY"+
						"	) AA"+
						"	WHERE"+
						"	ROWNUM <= 5"+
						"	ORDER BY"+
						"	EMPTY DESC";
			  Map<String, String> sqlParaMap = new HashMap<String, String>();
		        sqlParaMap.put("areaSn", areaSn);
	            List list = modelService.listDataSql(sql, new Object[] {areaSn});
	            JSONArray json = new JSONArray();
                  if (list != null && !list.isEmpty())
                  {
                   json = JSONArray.fromObject(list);
                  }
                    map.put("json", json);
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
