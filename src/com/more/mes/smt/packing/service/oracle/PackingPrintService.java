package com.more.mes.smt.packing.service.oracle;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.mes.common.method.JbarcodeUtil;

public class PackingPrintService {
	
	
	static private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
	private final Log log = LogFactory.getLog(this.getClass());
	private String resStr = "OK";//返回状态
	
	
	private List<JSONObject> topSourceArray = new ArrayList<JSONObject>();
	private List<JSONObject> buttomSourceArray = new ArrayList<JSONObject>();
	private List<JSONObject> displayWayArray = new ArrayList<JSONObject>();
	private JSONObject displayWayData = null;
	private double paperWidth = 0;
	private double paperWidthNext = 0;
	private double paperHeight = 0;
	private double paperHeightNext = 0;
	private double buttomMaxHeight = 40;
	private double topMaxHeight = 0;

	/**
	 * 获取打印数据
	 * @param itemSn
	 * @param labelId
	 * @return
	 */
	private List<Map<String, Object>> getPrintData(String itemSn,String labelId){
		
	    Map<String, Object> map = new HashMap<String, Object>();
	    List<Map<String, Object>> labelList = new ArrayList<Map<String, Object>>();
	    List<Map<String, Object>> stockList = new ArrayList<Map<String, Object>>();
	    List<Map<String, Object>> resList = new ArrayList<Map<String, Object>>();
	    String cldSql = "";
	    boolean paramError = false;
	    boolean paramError2 = false;
	    try{
	    	 // 获取标签数据项信息
	    	 String sql = " SELECT DISTINCT T.CLD_ITEM_ALIAS, T1.DATA_ITEMS_NAME,T.CLD_COLUMN_NAME "
	                   + " FROM T_CO_LABEL_DATACONFIGURE T " + " LEFT JOIN ML_DATA_ITEMS T1 "
	                   + " ON T.CLD_LABEL_ID = T1.TEMPLATE_ID "
	                   + " AND T.CLD_ITEM_ALIAS = T1.DATA_ITEMS_ALIAS " + " WHERE T.CLD_LABEL_ID = ? ";
	        labelList = modelService.listDataSql(sql, new Object[] {labelId});

	        String sql2 = "SELECT T.CLD_SQL,T.CLD_CODE_ALIAS,T.CLD_NUM_ALIAS  FROM T_CO_LABEL_DATASOURCE T WHERE T.CLD_LABEL_ID=?";
	        map = modelService.queryForMap(sql2, new Object[] {labelId});

	        Map<String, Object> tempMap2 = new HashMap<String, Object>();
	        String sql3 = "SELECT T.MSS_MAX_NUM FROM T_WMS_MID_SPLIT_SN T WHERE T.MSS_ITEM_SN=?";
	        tempMap2 = modelService.queryForMap(sql3, new Object[] {itemSn});
	        if (tempMap2 != null && tempMap2.size() != 0)
	        {
	          map.put("MSS_MAX_NUM", tempMap2.get("MSS_MAX_NUM"));
	        }
	        else
	        {
	          map.put("MSS_MAX_NUM", "0");
	        }
	        Map<String, Object> tempMap3 = new HashMap<String, Object>();
	        String sql4 = "SELECT T.DATA_ITEMS_NAME FROM ML_DATA_ITEMS T WHERE T.TEMPLATE_ID=? AND T.LABEL_COUNT ='Y'";
	        tempMap3 = modelService.queryForMap(sql4, new Object[] {labelId});
	        if (tempMap3 != null && tempMap3.size() != 0)
	        {
	          map.put("DATA_ITEMS_NUM", tempMap3.get("DATA_ITEMS_NAME"));
	        }
	        else
	        {
	          map.put("DATA_ITEMS_NUM", "数量");
	        }

	        String tempSql = StringUtils.toString(map.get("CLD_SQL"));
	        cldSql = StringUtils.toString(map.get("CLD_SQL"));
	        // String[] tempSql = cldSql.toUpperCase().split(":");
	        cldSql = cldSql.replaceAll(";", "");
	        cldSql = cldSql.replaceAll("\\{[^{}]+\\}", "?");
	        String[] tempSqls = cldSql.split("\\?", -1);
	        int tempLen = tempSqls.length - 1;
	        // 20180710 判断多个参数是否一致的情况
	        List<String> paramList = new ArrayList<String>();
	        Pattern pattern = Pattern.compile("(?<=\\{)(.+?)(?=\\})");
	        Matcher matcher = pattern.matcher(tempSql);
	        while (matcher.find())
	        {
	          paramList.add(matcher.group(1));
	        }
	        if (tempLen != 1)
	        {
	          boolean tempFlag = false;
	          String tempStr = paramList.get(0);
	          for (int i = 1; i < paramList.size(); i++ )
	          {
	            String tempStr2 = paramList.get(i);
	            if (!tempStr.equals(tempStr2))
	            {
	              tempFlag = true;
	            }
	          }
	          if (tempFlag == true)
	          {
	            paramError = true;
	          }
	        }
	        Object[] params = new Object[tempLen];
	        params[0] = itemSn;
	        for (int i = 1; i < tempLen; i++ )
	        {
	          params[i] = itemSn;
	        }
	        stockList = modelService.listDataSql(cldSql, params);
      if (stockList != null && !stockList.isEmpty()){
		  // 清单打印
    	  for (int i = 0; i < labelList.size(); i++ ){
            String dataItemName = StringUtils.toString(labelList.get(i).get("DATA_ITEMS_NAME"));
            String colName = StringUtils.toString(labelList.get(i).get("CLD_COLUMN_NAME"));
            String otherName = StringUtils.toString(labelList.get(i).get("CLD_ITEM_ALIAS"));
            Map<String, Object> resMap = new HashMap<String, Object>();

            for (int j = 0; j < stockList.size(); j++ ){
              Map<String, Object> tempMap = stockList.get(j);
              for (String key : tempMap.keySet()){
                String value = StringUtils.toString(tempMap.get(key));
                if (key.equals(colName)){
                  resMap.put("CLD_ITEM_ALIAS", otherName);
                  resMap.put("CLD_ITEM_VALUE", value);
                  resMap.put("CLD_COLUMN_NAME", dataItemName);

                }
              }
            }

            String itemSql = "SELECT T.* FROM T_CO_LABEL_ITEM_DATASOURCE T WHERE T.CLD_LABEL_ID = ? AND T.CLD_ITEM_ALIAS=?";
            List<Map<String, Object>> itemList = modelService.listDataSql(itemSql, new Object[] {
              labelId, otherName});
            if (!itemList.isEmpty())
            {
              paramError2 = false;
              String tempSql2 = "SELECT T.* FROM T_CO_LABEL_DATACONFIGURE T WHERE T.CLD_LABEL_ID=? AND T.CLD_ITEM_ALIAS=?";
              List<Map<String, Object>> tempList2 = modelService.listDataSql(tempSql2,
                new Object[] {labelId, otherName});
              String itemSql2 = StringUtils.toString(tempList2.get(0).get("CLD_SQL"));
              resMap.put("CLD_DISPLAY_WAY", itemList.get(0).get("CLD_DISPLAY_WAY"));
              resMap.put("CLD_COLUMN_NAME", dataItemName);
              // String[] tempSql = cldSql.toUpperCase().split(":");
              itemSql2 = itemSql2.replaceAll(";", "");
              itemSql2 = itemSql2.replaceAll("\\{[^{}]+\\}", "?");
              String[] itemSql2s = cldSql.split("\\?", -1);
              int tempLen2 = itemSql2s.length - 1;
              // 20180710 判断多个参数是否一致的情况
              List<String> paramList2 = new ArrayList<String>();
              Pattern pattern2 = Pattern.compile("(?<=\\{)(.+?)(?=\\})");
              Matcher matcher2 = pattern.matcher(tempSql);
              while (matcher.find())
              {
                paramList.add(matcher.group(1));
              }
              if (tempLen != 1)
              {
                boolean tempFlag = false;
                String tempStr = paramList.get(0);
                for (int k = 1; k < paramList.size(); k++ )
                {
                  String tempStr2 = paramList.get(k);
                  if (!tempStr.equals(tempStr2))
                  {
                    tempFlag = true;
                  }
                }
                if (tempFlag == true)
                {
                  paramError2 = true;
                }
              }
              Object[] params2 = new Object[tempLen];
              params2[0] = itemSn;
              for (int k = 1; k < tempLen; k++ )
              {
                params2[k] = itemSn;
              }
              List<Map<String, Object>> stockList2 = new ArrayList<Map<String, Object>>();
              stockList2 = modelService.listDataSql(itemSql2, params2);
              if (stockList2 != null && !stockList2.isEmpty())
              {
                resMap.put("CLD_TITLE_INFO", itemList);
                resMap.put("CLD_ITEM_INFO", stockList2);
              }
            }
            else
            {
              resMap.put("CLD_DISPLAY_WAY", "0");
              resMap.put("CLD_TITLE_INFO", null);
              resMap.put("CLD_ITEM_INFO", null);
            }

            resList.add(resMap);
          }
      }else{
        resStr = "FALSE";
      }
    } catch (Exception e) {
      //log.error(e);
      resStr = "ERROR";
    }
    if ("".equals(cldSql) || cldSql == null){
      resStr = "SQLFALSE";
    }
    if (stockList == null || stockList.isEmpty()){
      if (!"".equals(cldSql) && cldSql != null){
        // 拆分打印 数据源配置错误
        resStr = "SQLFALSE2";
      }
    }
    if (paramError == true || paramError2 == true){
      // 参数个数错误
      resStr = "SQLFALSE3";
    }
	return resList;
  }
	  /**
	   * 获取打印样式
	 * @param labelId
	 * @return
	 */
	private List<Map<String, Object>> getPrintLableCss(String labelId){
		  List<Map<String, Object>> resList = new ArrayList<Map<String, Object>>();
		  try{
		     String sql = " SELECT T.ID LABEL_ID,T.LABEL_NAME LABEL_NAME,T.LABELCSS LABELCSS FROM ML_TEMPLATE T WHERE T.ID = ?";
		     resList = modelService.listDataSql(sql, new Object[] {labelId});
		  }catch(Exception e){
			  log.error(e);
		      resStr = "ERROR";
		  }
		  return resList;
	}

	public List<Map> getPrintHtml(String itemSn,String labelId,String titleFlag,String path){
		Document html = getDocument(path);
		try{
			List<Map<String, Object>> itemInfo = getPrintData(itemSn,labelId);//打印数据
			if(!resStr.equals("OK")){
				return null;
			}
			List<Map<String, Object>> lableCssList = getPrintLableCss(labelId);
			String lableCssStr = String.valueOf(lableCssList.get(0).get("LABELCSS"));
			JSONObject lableCss = JSONObject.fromObject(lableCssStr);//打印样式
			Map<String, Object> pageInfo = (Map<String, Object>) lableCss.get("page");
			paperWidth = Double.parseDouble(String.valueOf(pageInfo.get("paperWidth")));//宽度
			paperHeight = Double.parseDouble(String.valueOf(pageInfo.get("paperHeight")));//高度
			paperWidthNext = paperWidth*794/210;
			paperHeightNext = paperHeight*1123/297;
			
			String bodyWidth=paperWidthNext+"px";//设置纸张打印内容宽度
			html.getElementsByTag("body").attr("width", bodyWidth);
			
			if("Y".equals(titleFlag)){
				html.getElementById("footInformation").attr("width", bodyWidth);
				html.getElementById("bodyInformation").attr("width", bodyWidth);
				html.getElementById("headInformation").attr("width", bodyWidth);
			}
			
			List<JSONObject> sourceArray = (List<JSONObject>)lableCss.get("sourceArray");
			List<JSONObject> noSourceArray = (List<JSONObject>)lableCss.get("noSourceArray");
			noSourceArray.addAll(sourceArray);  
			orderNodeInfo(noSourceArray,itemInfo);
			double nodeYTemp = topSourceArray.get(0).getDouble("nodeY");
			double nodeHeightTemp = topSourceArray.get(0).getDouble("nodeHeight");
			double maxHeight = (nodeYTemp/(5*paperHeight))*paperHeightNext+(nodeHeightTemp/(5*paperHeight))*paperHeightNext;//设置非数据高度
			for(int i=0;i<topSourceArray.size();i++){
				JSONObject obj = topSourceArray.get(i);
				if(!"middle".equals(obj.getString("nodeType"))){
					double nodeX = obj.getDouble("nodeX");
					nodeX = (nodeX/(5*paperWidth))*paperWidthNext+40;
					double nodeY = obj.getDouble("nodeY");
					nodeY = (nodeY/(5*paperHeight))*paperHeightNext;
					double nodeWidth = obj.getDouble("nodeWidth");
					nodeWidth=(nodeWidth/(5*paperWidth))*paperWidthNext*1+30;
					double nodeHeight = 0;
					String nodeHeightTemp2 = obj.getString("nodeHeight");
					if(!nodeHeightTemp2.equals("null")){ 
						nodeHeight =  obj.getDouble("nodeHeight");
					}
					nodeHeight=((nodeHeight+10)/(5*paperHeight))*paperHeightNext;
					double tempMaxHeight=nodeY+40;
					if(tempMaxHeight>maxHeight){
						maxHeight=tempMaxHeight;
					}
					String classStyle="";
					String dataSource="";
					Object dataSourceTemp = obj.get("dataSource");
					if(dataSourceTemp!=null){
						classStyle=obj.getString("dataSource");
					}else{
						dataSource=obj.getString("fontText");
					}
					topMaxHeight = maxHeight;
					if("imgType".equals(obj.getString("nodeType"))){
						String imgUrl=obj.getString("imgUrl");
						imgUrl="up_load/comm/dataItemPic/"+imgUrl.substring(imgUrl.length()-36, imgUrl.length());
						String img="<img  src='"+imgUrl+"' style='position:absolute;left:"+nodeX+"px;top:"+nodeY+"px;width:"+nodeWidth+"px;height:"+nodeHeight+"px;'>";
						html.getElementById("headInformation").append(img);
					}else if("imgNode".equals(obj.getString("nodeType"))){
						if(StringUtils.isBlank(classStyle)){
							String imgJsonStr="[{'codeId':"+1+",'value':"+obj.get("fontText")+",'codeType':'"+obj.get("barcode")+"','width':"+(int)nodeWidth+",'height':"+(int)nodeHeight+"}]";
							Map<String, Object> srcResult = getenerateCode(imgJsonStr);
							String imgUrl=String.valueOf(srcResult.get("fileUrl")).replace("/\\/g","/");
							String img="<img class='"+classStyle+"' src='"+imgUrl+"' style='position:absolute;left:"+nodeX+"px;top:"+nodeY+"px;width:"+srcResult.get("width")+"px;height:"+srcResult.get("height")+"px;'>";
							html.getElementById("headInformation").append(img);
						}else{
							String img ="<img class='"+classStyle+"' src='"+obj.get("barcode")+"' style='position:absolute;left:"+nodeX+"px;top:"+nodeY+"px;' width='"+nodeWidth+"' height='"+nodeHeight+"'>";
							html.getElementById("headInformation").append(img);
						}	
					}
					else{
						String fontSize=obj.get("fontSize")+"px";
						String fontItalic="";
						String fontBold="";
						if(obj.get("italic")!=null && "Italic".equals(obj.getString("italic"))){
							fontItalic="font-style: italic";
						}
						if(obj.get("bold")!=null && "Bold".equals(obj.getString("bold"))){
							fontBold="font-weight: bold";
						}
						if("Y".equals(titleFlag)){
							if(obj.get("dataSource")!=null){
								classStyle=(String)obj.get("dataSource");
							}else{
								dataSource=(String)obj.get("fontText");
							}
						}
						String div="<div class='"+classStyle+"' style='position:absolute;word-wrap: break-word;"+fontItalic+";"+fontBold+";left:"+nodeX+"px;top:"+nodeY+"px;font-size:"+fontSize+";width:"+nodeWidth+"px;height:"+nodeHeight+"px;'>"+dataSource+"</div>";
						html.getElementById("headInformation").append(div);
					}
				}
			}
			
			for(int i=0;i<topSourceArray.size();i++){
				if(topSourceArray.get(i).getString("fontText").indexOf("TABLE")>-1){
					String table ="<table style='position:absolute;top:"+maxHeight+"px;border: 1px solid;';><tr><td>table"+i+"</td></tr></table>";
					html.getElementsByTag("body").append(table);
					maxHeight+=maxHeight;
				}
			}
			addButtomInfo(maxHeight,html,titleFlag);
			addSourceInfo(itemInfo,maxHeight,html,titleFlag);
			//System.out.println(html.html()); 
		  }catch(Exception e){
			  log.error("error_________",e);
		      resStr = "ERROR";
		  }
		
		  List<Map> resultList = new ArrayList<Map>();
		  Map statusMap = new HashMap();
		  statusMap.put("status", resStr);
		  resultList.add(statusMap);
		  if(resStr.equals("OK")){
	    	  Map htmlMap = new HashMap();
	    	  htmlMap.put("paperWidth", String.valueOf(paperWidth));
	    	  htmlMap.put("paperHeight",String.valueOf(paperHeight));
	    	  if(!"Y".equals(titleFlag)){//分页不带表头
	    		  htmlMap.put("html", html.html());
	    	  }else{
	    		  htmlMap.put("buttomMaxHeight",String.valueOf((int)buttomMaxHeight));
		    	  htmlMap.put("topMaxHeight",String.valueOf((int)topMaxHeight));
		    	  String headInformation = html.getElementById("headInformation").toString();
		    	  String bodyInformation = html.getElementById("bodyInformation").toString();
		    	  String footInformation = html.getElementById("footInformation").toString();
		    	  htmlMap.put("headInformation", headInformation);
		    	  htmlMap.put("bodyInformation", bodyInformation);
		    	  htmlMap.put("footInformation", footInformation);
	    	  }
	    	  resultList.add(htmlMap);
		  }
		  return resultList;
		
	} 

	/**
	* 添加数据项信息
	*/
	private void addSourceInfo(List<Map<String, Object>> itemInfo,double maxHeight,Document html,String titleFlag){
		int maxValue=1;
		for(int i=0;i<itemInfo.size();i++){
			Map<String,Object> item = itemInfo.get(i);
			String displayWay=String.valueOf(item.get("CLD_DISPLAY_WAY"));
			if("0".equals(displayWay)){ 
				String columnName = String.valueOf(item.get("CLD_COLUMN_NAME"));
				Elements columns = html.getElementsByClass(columnName);
//				if("Y".equals(titleFlag)){
//					columns.html(String.valueOf(item.get("CLD_ITEM_VALUE")));
//				}
				for(int j=0;j<columns.size();j++){
					Element column = columns.get(j);
					if("Y".equals(titleFlag) && !column.tagName().equals("img")){
						column.html(String.valueOf(item.get("CLD_ITEM_VALUE")));
					}
					String src = column.attr("src");
					if(StringUtils.isNotBlank(src)){
						double nodeWidth = Double.valueOf(column.attr("width"));
						double nodeHeight = Double.valueOf(column.attr("height"));
						String imgJsonStr = "[{'codeId':"+1+",'value':'"+item.get("CLD_ITEM_VALUE")+"','codeType':'"+src+"','width':"+(int)nodeWidth+",'height':"+(int)nodeHeight+"}]";
						Map<String, Object> srcResult = getenerateCode(imgJsonStr);
						List<Map<String, Object>> results = (List<Map<String,Object>>)srcResult.get("result");
						Map<String, Object> result = results.get(0);
						column.attr("src",String.valueOf(result.get("fileUrl")).replace("/\\/g","/"));
						column.attr("width",String.valueOf(result.get("width")));
						column.attr("height",String.valueOf(result.get("height")));
					}else{
						column.text(String.valueOf(item.get("CLD_ITEM_VALUE")));
					}	
				}
			}else if("1".equals(displayWay)){
				List<Map<String, Object>> cldInfo = (List<Map<String, Object>>)item.get("CLD_ITEM_INFO");
				addValueInfo(cldInfo,maxHeight,maxValue,(List<Map<String, Object>>)item.get("CLD_TITLE_INFO"),html,titleFlag);
				maxValue++;
			}else if("2".equals(displayWay)){
				List<Map<String, Object>> cldInfo = (List<Map<String, Object>>)item.get("CLD_ITEM_INFO");
				addValueInfoSecond(cldInfo,maxHeight,maxValue,(List<Map<String, Object>>)item.get("CLD_TITLE_INFO"),html);
				maxValue++;
			}
		}	
	}
	
	private Map<String, Object> getenerateCode(String codeValue){
		//获取项目路径存放临时图片
		String codeImgUrl=Constants.getWEB_ROOT_PATH()+Constants.SEPARATOR+"buss"+Constants.SEPARATOR+"codeImg";
		//获取项目路径存放临时图片相对位置
		String relativeUrl="buss"+Constants.SEPARATOR+"codeImg";
		File file = new File(relativeUrl);
		if(!file.exists()){
		    file.mkdir();
		}
		JSONArray jsonArray = JSONArray.fromObject(codeValue);   
		Map<String, Object> result=  generateCode(jsonArray,codeImgUrl,relativeUrl);//解析数据
		return result;
	}
	
	 /**
	   * 生成条形码方法
	   * @param jsonArray
	   * @return
	   */
	public Map<String, Object> generateCode(JSONArray jsonArray,String codeImgUrl,String relativeUrl ){
		File file = new File(codeImgUrl);
		if(!file.exists()){
			file.mkdir();
		}
		Date day=new Date();    
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd"); 
		codeImgUrl=codeImgUrl+Constants.SEPARATOR+df.format(day);
		relativeUrl=relativeUrl+Constants.SEPARATOR+df.format(day);
		File codeImg = new File(codeImgUrl);
		if(!codeImg.exists()){
			codeImg.mkdir();
		}
		List<Map<String, Object>> codeList=new ArrayList<Map<String, Object>>();
		int jsonArrayLength=jsonArray.size();
		  /**
		   * 解析当前数据
		   */
		for(int i=0;i<jsonArrayLength;i++){
			Map<String, Object> map=new HashMap<String,Object>();
			JSONObject entity=jsonArray.optJSONObject(i);
			if(entity.get("codeId")!=null){
				map.put("codeId",entity.get("codeId").toString() );
			}else{
				map.put("codeId",0);
			}  
			if(entity.get("value")!=null){
				map.put("value",entity.get("value").toString() );
			}else{
				map.put("value",0);
			}
			  
			if(entity.get("codeType")!=null){
				map.put("codeType",entity.get("codeType").toString() );
			}else{
				map.put("codeType","qrcode");
			}
			  
			if(entity.get("width")!=null){
				map.put("width",entity.get("width").toString() );
			}else{
				map.put("width",100);
			}
			  
			if(entity.get("height")!=null){
				map.put("height",entity.get("height").toString() );
			}else{
				map.put("height",100);
			}
			codeList.add(map);
		}
			  //获取返回结果
		Map<String, Object> result=JbarcodeUtil.createBarcodeValue(codeList, codeImgUrl+Constants.SEPARATOR,relativeUrl+Constants.SEPARATOR);
		return result;
				  
		}
	
	private void addValueInfo(List<Map<String, Object>> resultList,double topValue,int maxValue,List<Map<String, Object>> columnData,Document html,String titleFlag){
		double allColumn=0;
		String tableIdNext="table"+maxValue; 
		Map<String, Object> resultListValue=resultList.get(0);
		String div="";
		topValue=topValue-15;
		double nodeWidth=0;
		String fontSize="12px";
		if(displayWayData!=null){
			nodeWidth = (displayWayData.getDouble("nodeX")/(5*paperWidth))*paperWidthNext*1+40;
			fontSize = displayWayData.get("fontSize")+"px";
		}
		if(maxValue==1){
			if("Y".equals(titleFlag)){
				div="<table style='margin-top:"+topValue+"px;margin-left:"+nodeWidth+"px; font-size:"+fontSize+" ;table-layout: fixed' id='"+tableIdNext+"'><thead><tr>";
			}else{
				div="<div style='width:100%'><table style='margin-top:"+topValue+"px;margin-left:"+nodeWidth+"px;font-size:"+fontSize+" ;border:1;cellspacing:0;table-layout: fixed' id='"+tableIdNext+"'><tr>";
			}
			
		}else{
			if("Y".equals(titleFlag)){
				div="<table style=style='margin-top:"+10+"px;margin-left:"+nodeWidth+"px;font-size:"+fontSize+" ;border:1;cellspacing:0;table-layout: fixed' id='"+tableIdNext+"'><tr>";
			}else{
				div="<div style='width:100%'><table style='margin-top:"+10+"px;margin-left:"+nodeWidth+"px;font-size:"+fontSize+" ;border:1;cellspacing:0;table-layout: fixed' id='"+tableIdNext+"'><thead><tr>";
			}
			
		}
		
		
		List<String> keyName=new ArrayList<String>();
		for(Object key : resultListValue.keySet()){
			keyName.add(String.valueOf(key));
		}
		 
		 
		 for(int i=0;i<keyName.size();i++){ 
			    Map<String,Object> result = getColumnProperty(columnData,keyName.get(i));
			 	double width = Double.parseDouble(String.valueOf(result.get("CLD_COLUMN_WIDTH")));
				div+="<td style='word-break: break-all;width:"+width+"px'>"+keyName.get(i)+"</td>";
				allColumn+=width;
			}
		 if("Y".equals(titleFlag)){
			 div+="</tr></thead>";
		 }else{
			 div+="</thead></tr>";
		 }
			
		for(int i=0;i<resultList.size();i++){
			div+="<tr>";
			Map<String, Object> result=resultList.get(i);
			for(int j=0;j<keyName.size();j++){
				String name = keyName.get(j);
				div+="<td>"+result.get(name)+"</td>";
			}
			div+="</tr>";
		}
		 if("Y".equals(titleFlag)){
			 div+="</table>";
		 }else{
			 div+="</table></div>";
		 }
		html.getElementById("bodyInformation").append(div);
		html.getElementById(tableIdNext).attr("width", String.valueOf(allColumn));
		
	}
	
	private void addValueInfoSecond(List<Map<String, Object>> resultList,double topValue,int maxValue,List<Map<String, Object>> columnData,Document html){
		String tableIdNext="table"+maxValue;
		double allColumn=0;
		Map<String, Object> resultListValue=resultList.get(0);
		String div="";
		topValue=topValue-15;
		double leftMargin=0;
		if(displayWayData==null){
			leftMargin=80;
		}else{
			leftMargin=(displayWayData.getDouble("nodeX")/(5*paperWidth))*paperWidthNext*1+40;
		}
		if(maxValue==1){
			div="<table style='margin-top:"+topValue+"px;margin-left:"+leftMargin+"px; border:1;cellspacing:0;table-layout: fixed' id='"+tableIdNext+"'><tr>";
		}else{
			double height=topValue;
			div="<table style='top:"+height+"px;border:1;margin-left:"+leftMargin+"px;cellspacing:0;table-layout: fixed' id='"+tableIdNext+"'><tr>";
		}
		
		
		List<String> keyName=new ArrayList<String>();
		for(Object key : resultListValue.keySet()){
			keyName.add(String.valueOf(key));
		}
	    Map<String,Object> columnProperty = getColumnProperty(columnData,keyName.get(0)); 
		int addValue=0;
		int column= Integer.parseInt(String.valueOf(columnProperty.get("CLD_COLUMN")));
		String name = keyName.get(0);
		for(int i=0;i<resultList.size();i++){
			Map<String,Object> result = resultList.get(i);
			if(addValue<column){
				div+="<td>"+result.get(name)+"</td>";
				addValue++;
			}else{
				div+="</tr>";
				div+="<td>"+result.get(name)+"</td>";
				addValue=0;
				addValue++;
			}
		}
		div+="</tr></table>";
		html.getElementById("bodyInformation").append(div);	
	}
	
	/**
	 *获取列宽度
	 */
	private Map<String, Object> getColumnProperty(List<Map<String, Object>> columnData,String columnName){
		Map<String, Object> columnProperty = null;
		for(int i=0;i<columnData.size();i++){
			if(columnName.equals(columnData.get(i).get("CLD_COLUMN_NAME"))){
				columnProperty=columnData.get(i);
				break;
			}
		}
		return columnProperty;
	}

 	/**
 	 * 重新排序节点位置
 	 * @param noSourceArray
 	 * @param itemInfo
 	 * @return
 	 */
 	private void orderNodeInfo(List<JSONObject> noSourceArray,List<Map<String, Object>> itemInfo){
 		for(int i=0;i<noSourceArray.size();i++){
 			for(int j=0;j<itemInfo.size();j++){
 				Object dataSource = noSourceArray.get(i).get("dataSource");
 				if(dataSource!=null && (String.valueOf(dataSource)).equals(String.valueOf(itemInfo.get(j).get("CLD_COLUMN_NAME")))
 						&&("1".equals(itemInfo.get(j).get("CLD_DISPLAY_WAY")) || "2".equals(itemInfo.get(j).get("CLD_DISPLAY_WAY")))){
					if (displayWayData==null){
						displayWayData=noSourceArray.get(i);
					}
					displayWayArray.add(noSourceArray.get(i));
				}
 			}
 		}
 		if(displayWayData!=null){
 			for(int i=0;i<noSourceArray.size();i++){
 				JSONObject noSource = noSourceArray.get(i);
 				float f1 = Float.parseFloat(noSource.getString("nodeY"));
 				float f2 = Float.parseFloat(displayWayData.getString("nodeY"));
				if(f1>=f2 && noSource.get("dataSource")!=null &&!noSource.get("dataSource").equals(displayWayData.get("dataSource"))){
					buttomSourceArray.add(noSource);
				}else if(f1>=f2 && noSource.get("dataSource")==null){
					buttomSourceArray.add(noSource);
				}
				else if(!validateDisplayWay(displayWayArray,noSource)){
					topSourceArray.add(noSource);
				}
			}
 		}else{
			topSourceArray=noSourceArray;
		}
 	}
 	
 	 //获取项目部署的目录到WEB—INF的上一级
//   private String getClassPath(){ 
//        String strClassName = getClass().getName(); 
//        
//        log.info("___________"+strClassName);
//        String strPackageName = ""; 
//        if(getClass().getPackage() != null) { 
//            strPackageName = getClass().getPackage().getName(); 
//        } 
//        log.info("___________"+strPackageName);
//        String strClassFileName = ""; 
//        if(!"".equals(strPackageName)){
//            strClassFileName = strClassName.substring(strPackageName.length() + 1,strClassName.length()); 
//        } 
//        else { 
//            strClassFileName = strClassName; 
//        } 
//        
//        log.info("___________"+strClassFileName);
//        URL url = null; 
//        url = getClass().getResource(strClassFileName + ".class"); 
//        String strURL = url.toString();
//        strURL = strURL.substring(strURL.indexOf( "/" ) + 1,strURL.lastIndexOf( "WEB-INF" ));
//        return strURL; 
//    }

 	
 	/**
 	 * 获取打印模板
 	 * @return
 	 */
 	private Document getDocument(String path){
 		String realPath = path+"/buss/template/printList.html";
		File input = new File(realPath);
		Document doc = null;
		try {
			doc = Jsoup.parse(input, "UTF-8");
		} catch (IOException e) {
			log.error(e);
		}
		return doc;
 	}
 	
 	private boolean validateDisplayWay(List<JSONObject> displayWayArray,JSONObject currentNode){
 		boolean tempResult=false;
		for(int i=0;i<displayWayArray.size();i++){
			if(displayWayArray.get(i)==currentNode){
				tempResult=true;
				break;
			}
		}
		return tempResult;
 	}
 	
 	private void addButtomInfo(double maxHeight,Document html,String titleFlag){
 		if(buttomSourceArray==null || buttomSourceArray.size()==0){
			return;
		}
		double buttomMargin = gainMinimumNode();
		for(int i=0;i<buttomSourceArray.size();i++){
			JSONObject buttomSource = buttomSourceArray.get(i);
			String div = "";
			if(!"middle".equals(buttomSource.get("nodeType"))){
				double nodeX=(buttomSource.getDouble("nodeX")/(5*paperWidth))*paperWidthNext+40;
				double nodeYTemp = buttomSource.getDouble("nodeY");
				double nodeY=((nodeYTemp-buttomMargin)/(5*paperHeight))*paperHeightNext;
				double nodeWidth=(buttomSource.getDouble("nodeWidth")/(5*paperWidth))*paperWidthNext*1+30;
				double nodeHeight=(40/(5*paperHeight))*paperHeightNext;
				double tempMaxHeight=nodeY+40;
				if(tempMaxHeight>maxHeight){
					maxHeight = tempMaxHeight;
				}
				String classStyle="";
				String dataSource="";
				if(buttomSource.get("dataSource")!=null){
					classStyle=buttomSource.getString("dataSource");
				}else{
					dataSource=buttomSource.getString("fontText");
				}
				if("Y".equals(titleFlag)){
					if((nodeYTemp-buttomMargin)>buttomMaxHeight){
						buttomMaxHeight=nodeYTemp-buttomMargin;
					}
				}
				
				String fontSize=buttomSource.get("fontSize")+"px";
				String fontItalic="";
				String fontBold="";
				if(buttomSource.get("italic")!=null && "Italic".equals(buttomSource.getString("italic"))){
					fontItalic="font-style: italic";
				}
				if(buttomSource.get("bold")!=null && "Bold".equals(buttomSource.getString("bold"))){
					fontBold="font-weight: bold";
				}
				div="<div class='"+classStyle+"' style='position:absolute;"+fontItalic+";"+fontBold+";left:"+nodeX+"px;top:"+nodeY+"px;font-size:"+fontSize+";width:"+nodeWidth+"px;height:"+nodeHeight+"px;'>"+dataSource+"</div>";
			    if("imgNode".equals(buttomSource.get("nodeType"))){
		        	div="<img class='"+classStyle+"' src='"+buttomSource.get("barcode")+"' style='position:absolute;left:"+nodeX+"px;top:"+nodeY+"px;width:"+nodeWidth+"px;height:"+nodeHeight+"px;'>";
			    }
			    
			}
			html.getElementById("footInformation").append(div);
		}
 	}
 	
	
	/**
	 *重新排序底部节点位置
	 */
	private double gainMinimumNode(){
		if((buttomSourceArray.size()==0)){
			return 0;
		}
		JSONObject beginNode=buttomSourceArray.get(0);
		for(int i=0;i<buttomSourceArray.size();i++){
			JSONObject buttomSource = buttomSourceArray.get(i);
			if(buttomSource.getDouble("nodeY")<=beginNode.getDouble("nodeY")){
				beginNode=buttomSource;
			}
		}
		return beginNode.getDouble("nodeY");
	}
	
}
