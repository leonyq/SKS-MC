package com.more.mes.pda.http.base;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.pda.service.PdaBaseServiceUtils;
import com.more.mes.pda.service.base.PdaServiceUtils;

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
public class GetMoBase  extends InterfaceLog implements IhttpServiceJosn {
	public ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");
	  @Override
	  public String exeFunc(HttpCoreService service)
	  {
		  // TODO Auto-generated method stub
		  Map map = new HashMap();
		  try
	      {
			  String strLine = StringUtils.toString(service.getParamTo().get("strLine"));//线体
			  String strOrgCode  = StringUtils.toString(service.getParamTo().get("strOrgCode"));//组织机构
			  String sqlStr="SELECT T.PM_MO_NUMBER FROM T_PM_MO_BASE T\r\n" + 
						"WHERE T.PM_AREA_SN=?\r\n" + 
						"AND T.PM_STATUS NOT IN('4','5')\r\n" + 
						"AND T.DATA_AUTH=?";
			  PdaServiceUtils serviceUtils=new PdaServiceUtils();
			  Object[] params=new Object[] {
						strLine,
						strOrgCode
				};
			  List<Map> dataList =modelService.listDataSql(sqlStr,params);
			  String jsonStr="";
			  if(null==dataList || dataList.size()<=0){
				  jsonStr=PdaBaseServiceUtils.foundNoMonumberData;
				  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), jsonStr));
			  }
			  else {
				  jsonStr=serviceUtils.MapListToJson(dataList);
				  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaSuccessInfoTemp(), jsonStr));
			  }
			  service.setResult(map);
			  return null;
	      }
	      catch(Exception e)
	      {
	    	  map.put("json", PdaBaseServiceUtils.createSendMessage(PdaBaseServiceUtils.getPdaFaildInfoTemp(), e.toString()));
	    	  service.setResult(map);
	          return null;
	      }
	  }
}
