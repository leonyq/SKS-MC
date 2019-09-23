
package com.more.mes.smt.labelhttp.http;


import org.apache.commons.httpclient.HttpClient;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream; 
import java.io.OutputStreamWriter;
import java.net.URL; 
import java.net.URLConnection;
import java.net.HttpURLConnection;
import java.util.HashMap;
import java.util.Map;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.Random;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;



import org.apache.commons.io.IOUtils;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class CloudLabelInf implements IJobx
{
  /**
   * Args 参数设置类
   *  Map<String,Object> params 传人参数
   *  Object result 返回内容
  */
    private static final Log log = LogFactory.getLog(CloudLabelInf.class);
    public static String JSESSIONID;
    public static String jsonPost(String strURL, String a) {

		try {
			URL url = new URL(strURL);
			HttpURLConnection connection = (HttpURLConnection) url
					.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setUseCaches(false);
			connection.setInstanceFollowRedirects(true);
			connection.setRequestMethod("POST"); // 设置请求方式
			connection.setRequestProperty("Accept", "application/json"); // 接收到的格式
			connection.setRequestProperty("Content-Type", "application/json"); // 转换的格式
			connection.setRequestProperty("Cookie",
					"cookUserName=18606060606;morelabel_lang=zh_TW;JSESSIONID="
							+ JSESSIONID + ";");

			connection.connect();
			OutputStreamWriter out = new OutputStreamWriter(
					connection.getOutputStream(), "UTF-8");
			out.append(a);// 写出
			out.flush();
			out.close();

			int code = connection.getResponseCode();
			InputStream is = null;
			if (code == 200) {
				is = connection.getInputStream();
			} else {
				is = connection.getErrorStream();
			}

			// 读取响应  
			int length = connection.getContentLength();
			if (length != -1) {
				byte[] data = new byte[length];
				byte[] temp = new byte[512];
				int readLen = 0;
				int destPos = 0;
				while ((readLen = is.read(temp)) > 0) {
					System.arraycopy(temp, 0, data, destPos, readLen);
					destPos += readLen;
				}
				String result = new String(data, "UTF-8"); 
				return result;
			}

		} catch (IOException e) {
                log.error("云标签上传下载"+e);
		}
		return "error";
	}
  
  @Override
  public void exec(Args args) throws Exception
  {
//       try{
// 	// TODO
        /////////////////////////////////////////////////////////////////////////////
	    //String bb = CookieTest.getCookie();
		//JSESSIONID = bb.substring(11, bb.length());

		// ------------------------------------------------------------------------------
		// 1.登录验证
		String url = "http://morelabel.cn/ml/http/interface.ms?model=label&method=ValidateUser";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", "18606060606");
		map.put("password", "DNXC654321");
		map.put("languagecode", "zh_TW");
		String map2json = map2json(map);
		String jsonPost = jsonPost(url, map2json);
		String loginResult=jsonPost.split("\"")[3];
		
	//		-------------------------------------------------------------------------------------------------

	//	2.标签信息
		String labelInforUrl = "http://morelabel.cn/ml/http/interface.ms?model=label&method=LabelInfor";
		Map<String, Object> mapTwo = new HashMap<String, Object>();
		mapTwo.put("LabelName", "");
		String labelInf = mapConversionJson(mapTwo);

		// 获取标签信息
		String labelINF = jsonPost(labelInforUrl, labelInf);
		
		// -----------------------------------------------------------------------
		// 3.上传物料信息
		if("1".equals(loginResult)){
		String updahql = "update T_XC_SYNC_LOG set errordate = sysdate, errormessage = ? where ID = '90cc4af7cfe8433483c16e3c07dd7ced'";
	    //CommMethod.getBaseService().execSql(updahql, new Object []{"成功了"});   

         //上传物料的接口url
		String addItemInforUrl = "http://morelabel.cn/ml/http/interface.ms?model=label&method=AddItemInfor";
		Map<String, Object> mapAddItemInfor = new LinkedHashMap<String, Object>();
 		//获取所有的物料信息
		String sqlMaterial = "select * from VIEW_ITEMINFOR ";
		List<Map<String, String>> materialList = CommMethod.getBaseService().listDataSql(sqlMaterial);
		int infLength=materialList.size();

		
		int i = 0;
	
		if(materialList!=null||!materialList.isEmpty()){
		for (int s = 0; s <infLength; s++) {
		   i++;
		String itemCode = 	materialList.get(s).get("CI_ITEM_CODE");
		String itemName = 	materialList.get(s).get("CI_ITEM_NAME");
		String itemSpec = 	materialList.get(s).get("CI_ITEM_SPEC");
		String minimumPacking = materialList.get(s).get("CI_MIN_PACK");	
		if(itemName==null||itemName==""){
		    itemName=" ";
		}
		if(itemSpec==null||itemSpec==""){
		    itemSpec=" ";
		}
		
		if(minimumPacking==null||minimumPacking==""){
		    minimumPacking=" ";
		}
		if("0".equals(minimumPacking)){
		 
		    minimumPacking="1";
		  //  String updahql9 = "update T_XC_SYNC_LOG set errordate = sysdate, errormessage = ? where ID = 'e267375a96da47dc8681795647bb7d1a'";
	   //     CommMethod.getBaseService().execSql(updahql9, new Object []{String.valueOf(test11)});
		}
		mapAddItemInfor.put("SEQ", i);
		mapAddItemInfor.put("ItemCode", itemCode);// 物料料号
		mapAddItemInfor.put("ItemName", itemName);// 物料名称
		mapAddItemInfor.put("ItemSpec", itemSpec);// 规格
		mapAddItemInfor.put("MinimumPacking", minimumPacking);// 最小包装量
		//mapAddItemInfor.put("ClassA_QTY", "2");// 一级装箱量
		//mapAddItemInfor.put("ClassB_QTY", "1");// 二级装箱量
		List<Map<String, Object>> listAddItemInfor = new ArrayList<Map<String, Object>>();
		listAddItemInfor.add(mapAddItemInfor);
		Map<String, Object> mapAddItemInfor2 = new LinkedHashMap<String, Object>();
		mapAddItemInfor2.put("ReplaceFlag", "Y");
		mapAddItemInfor2.put("Datas", listAddItemInfor);
		String parameterItem = map2json(mapAddItemInfor2);
		String addSupplyInforRusult = jsonPost(addItemInforUrl,parameterItem);
		
// 		String updahq2 = "insert into T_XC_SYNC_LOG t1 (t1.id, t1.create_time ,t1.data_auth,t1.errormessage)values (?,sysdate,'2',?)";
// 	    CommMethod.getBaseService().execSql(updahq2, new Object []{String.valueOf(i),addSupplyInforRusult});

		}
		}
	
		
// --------------------------------------------------------------------------
		// 5.上传供应商信息，并自动创建供应商的系统帐号，默认供应商编码为系统登录用户，默认密码：123456
		String addSupplyInforUrl = "http://morelabel.cn/ml/http/interface.ms?model=label&method=AddSupplyInfor";
		Map<String, Object> mapAddSupplyInfor = new LinkedHashMap<String, Object>();
		// 供应商的所有信息
		String sqlAddSupplyInfor = "select * from t_co_supplier ";
		List<Map<String, String>> addSupplyInforList = CommMethod.getBaseService().listDataSql(sqlAddSupplyInfor);
		int num = 0;
		String number = "135";//定义电话号码以135开头
		if(addSupplyInforList!=null||!addSupplyInforList.isEmpty()){
		for (Map<String, String> list : addSupplyInforList) {
			num++;
			Random random = new Random();//定义random，产生随机数
	        for (int j = 0; j < 8; j++) {
	                //生成0~9 随机数
	                number += random.nextInt(9);
	            }
			String supplyCode = list.get("SUPPLIER_CODE");// 供应商编码
			String supplyName = list.get("SUPPLIER_NAME");// 供应商名称
			String abbreviation = list.get("SUPPLIER_SHORTNAME");// 简称
			mapAddSupplyInfor.put("SEQ", num);
			mapAddSupplyInfor.put("SupplyCode", supplyCode);// 供应商代号
			mapAddSupplyInfor.put("SupplyName", supplyName);// 供应商名称
			mapAddSupplyInfor.put("Abbreviation", abbreviation);// 简称
			mapAddSupplyInfor.put("Contacts", "");// 联系人
			mapAddSupplyInfor.put("MobileNumber", "");
			mapAddSupplyInfor.put("E-mail", "");
			mapAddSupplyInfor.put("Address", "");
			List<Map<String, Object>> listSupply = new ArrayList<Map<String, Object>>();
			listSupply.add(mapAddSupplyInfor);
			Map<String, Object> mapAddSupplyInfor2 = new LinkedHashMap<String, Object>();
			mapAddSupplyInfor2.put("ReplaceFlag", "Y");
			mapAddSupplyInfor2.put("Datas", listSupply);
		    String parameter = map2json(mapAddSupplyInfor2);
			String addSupplyInforRusult = jsonPost(addSupplyInforUrl,parameter);
			number="135";

		}
		}
		}else{
		String updahql = "update T_XC_SYNC_LOG set errordate = sysdate, errormessage = ? where ID = 'e267375a96da47dc8681795647bb7d1a'";
	    CommMethod.getBaseService().execSql(updahql, new Object []{"标签上传下载登入失败"});
		    
		}	
		
  }
  
   //转json工具类
 	public static String object2json(Object obj) {
		StringBuilder json = new StringBuilder();
		if (obj == null) {
			json.append("\"\"");
		} else if (obj instanceof String || obj instanceof Integer
				|| obj instanceof Float || obj instanceof Boolean
				|| obj instanceof Short || obj instanceof Double
				|| obj instanceof Long || obj instanceof BigDecimal
				|| obj instanceof BigInteger || obj instanceof Byte) {
			json.append("\"").append(string2json(obj.toString())).append("\"");
		} else if (obj instanceof Object[]) {
			json.append(array2json((Object[]) obj));
		} else if (obj instanceof List) {
			json.append(list2json((List<?>) obj));
		} else if (obj instanceof Map) {
			json.append(map2json((Map<?, ?>) obj));
		} else if (obj instanceof Set) {
			json.append(set2json((Set<?>) obj));
		} else {
			json.append(bean2json(obj));
		}
		return json.toString();
	}
	public static void main(String[] args) {
		
	}

	public static String bean2json(Object bean) {
		StringBuilder json = new StringBuilder();
		json.append("{");
		PropertyDescriptor[] props = null;
		try {
			props = Introspector.getBeanInfo(bean.getClass(), Object.class)
					.getPropertyDescriptors();
		} catch (IntrospectionException e) {
		}
		if (props != null) {
			for (int i = 0; i < props.length; i++) {
				try {
					String name = object2json(props[i].getName());
					String value = object2json(props[i].getReadMethod().invoke(
							bean));
					json.append(name);
					json.append(":");
					json.append(value);
					json.append(",");
				} catch (Exception e) {
				}
			}
			json.setCharAt(json.length() - 1, '}');
		} else {
			json.append("}");
		}
		return json.toString();
	}

	public static String list2json(List<?> list) {
		StringBuilder json = new StringBuilder();
		json.append("[");
		if (list != null && list.size() > 0) {
			for (Object obj : list) {
				json.append(object2json(obj));
				json.append(",");
			}
			json.setCharAt(json.length() - 1, ']');
		} else {
			json.append("]");
		}
		return json.toString();
	}

	public static String array2json(Object[] array) {
		StringBuilder json = new StringBuilder();
		json.append("[");
		if (array != null && array.length > 0) {
			for (Object obj : array) {
				json.append(object2json(obj));
				json.append(",");
			}
			json.setCharAt(json.length() - 1, ']');
		} else {
			json.append("]");
		}
		return json.toString();
	}

	public static String map2json(Map<?, ?> map) {
		StringBuilder json = new StringBuilder();
		json.append("{");
		if (map != null && map.size() > 0) {
			for (Object key : map.keySet()) {
				json.append(object2json(key));
				json.append(":");
				json.append(object2json(map.get(key)));
				json.append(",");
			}
			json.setCharAt(json.length() - 1, '}');
		} else {
			json.append("}");
		}
		return json.toString();
	}

	public static String set2json(Set<?> set) {
		StringBuilder json = new StringBuilder();
		json.append("[");
		if (set != null && set.size() > 0) {
			for (Object obj : set) {
				json.append(object2json(obj));
				json.append(",");
			}
			json.setCharAt(json.length() - 1, ']');
		} else {
			json.append("]");
		}
		return json.toString();
	}

	public static String string2json(String s) {
		if (s == null)
			return "";
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < s.length(); i++) {
			char ch = s.charAt(i);
			switch (ch) {
			case '"':
				sb.append("\\\"");
				break;
			case '\\':
				sb.append("\\\\");
				break;
			case '\b':
				sb.append("\\b");
				break;
			case '\f':
				sb.append("\\f");
				break;
			case '\n':
				sb.append("\\n");
				break;
			case '\r':
				sb.append("\\r");
				break;
			case '\t':
				sb.append("\\t");
				break;
			case '/':
				sb.append("\\/");
				break;
			default:
				if (ch >= '\u0000' && ch <= '\u001F') {
					String ss = Integer.toHexString(ch);
					sb.append("\\u");
					for (int k = 0; k < 4 - ss.length(); k++) {
						sb.append('0');
					}
					sb.append(ss.toUpperCase());
				} else {
					sb.append(ch);
				}
			}
		}
		return sb.toString();
	}

	public static <T> T json2Object(String jsonString, Class<T> pojoCalss) {
		if (pojoCalss == null || jsonString == null || jsonString.trim().isEmpty()){
			return null;
		}
		try {
			T pojo = pojoCalss.newInstance();
			Field[] fields = pojo.getClass().getDeclaredFields();
			
			String simpleName = "";
			for (Field f : fields) {
				try{
					if (f.getName() == null) {
						continue;
					}
					if (f.getModifiers() > 2) {
						continue;
					}
					f.setAccessible(true);
					simpleName = f.getType().getSimpleName();
					
					String propName = "\"" + f.getName() + "\":";
					Integer idx = jsonString.indexOf(propName);
					if (idx == -1){
						continue;
					}
					Integer idxStart = idx + propName.length();
					if (jsonString.length() < idxStart){
						continue;
					}
					
					String valStart = jsonString.substring(idxStart, idxStart+1);
					if (valStart.equals("[")){
						valStart = "]"; 
					}else if (valStart.equals("{")){
						valStart = "}";
					}else{
						if (!valStart.equals("\"")){
							valStart = ","; 
						}
					}
					String propValue = null;
					Integer idxEnd = -1;
					if (valStart.equals(",")){
						idxEnd = jsonString.indexOf(valStart, idxStart);
						if (idxEnd == -1){
							continue;
						}
						propValue = jsonString.substring(idxStart, idxEnd);
					}else{
						idxEnd = jsonString.indexOf(valStart, idxStart + 1);
						if (idxEnd == -1){
							continue;
						}
						propValue = jsonString.substring(idxStart + 1, idxEnd);
					}
					
					if (propValue == null){
						continue;
					}
					if (simpleName.equals("String") || simpleName.equals("Object")) {
						f.set(pojo, propValue);
						continue;
					}
					if (simpleName.equals("Long") || simpleName.equals("long")) {
						f.set(pojo, getLong(propValue));
						continue;
					}
					if (simpleName.equals("Integer") || simpleName.equals("int")) {
						f.set(pojo, getInteger(propValue));
						continue;
					}
					if (simpleName.equals("Boolean")) {
						f.set(pojo, getBoolean(propValue));
						continue;
					}
					if (simpleName.equals("Double")) {
						f.set(pojo, getDouble(propValue));
						continue;
					}
					if (simpleName.equals("Float")) {
						f.set(pojo, getFloat(propValue));
						continue;
					}
					if (simpleName.equals("Byte")) {
						f.set(pojo, getByte(propValue));
						continue;
					}
					if (simpleName.equals("List")) {
						f.set(pojo, getList(propValue));
						continue;
					}
				}catch(Exception ex){
					ex.printStackTrace();
				}
			}
			return pojo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static Long getLong(String propValue){
		Long val = 0L;
		try{
			val = Long.parseLong(propValue);
		}catch(Exception el){}
		return val;
	}
	
	public static Integer getInteger(String propValue){
		Integer val = 0;
		try{
			val = Integer.parseInt(propValue);
		}catch(Exception el){}
		return val;
	}
	
	public static Boolean getBoolean(String propValue){
		Boolean val = ("1".equals(propValue) || "true".equalsIgnoreCase(propValue));
		return val;
	}
	
	public static Double getDouble(String propValue){
		Double val = 0D;
		try{
			val = Double.parseDouble(propValue);
		}catch(Exception el){}
		return val;
	}
	
	public static Float getFloat(String propValue){
		Float val = 0F;
		try{
			val = Float.parseFloat(propValue);
		}catch(Exception el){}
		return val;
	}
	
	public static Byte getByte(String propValue){
		Byte val = 0;
		try{
			val = Byte.parseByte(propValue);
		}catch(Exception el){}
		return val;
	}

	public static List<String> getList(String propValue){
		List<String> valList = new ArrayList<String>();
		if (propValue != null && !propValue.trim().isEmpty()){
			try{
				String[] aptEvents = propValue.replace("\"", "").toLowerCase().split(",");
				valList = java.util.Arrays.asList(aptEvents);
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		return valList;
	}
	
		public static String mapConversionJson(Map<?, ?> map) {
		StringBuilder json = new StringBuilder();
		json.append("{");
		if (map != null && map.size() > 0) {
			for (Object key : map.keySet()) {
				json.append(object2json(key));
				System.out.println(object2json(key));
				json.append(":");

				json.append(object2json(map.get(key)));
				json.append("\"");
			}
			json.setCharAt(json.length() - 1, '}');
		} else {
			json.append("}");
		}
		return json.toString();
	}
  
}
