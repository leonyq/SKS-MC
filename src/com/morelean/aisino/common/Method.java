package com.morelean.aisino.common;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import net.sf.json.JSONObject;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.hibernate.Hibernate;

import com.more.fw.core.common.exception.AppException;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;


/**
 * 
 * @ClassName:Method
 * @Description:航天公用的方法集合
 * @author:mmz
 * @version:1.0
 * @since 2018年4月9日上午10:03:43
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
/**
 * @ClassName:Method
 * @Description:
 * @author:mmz 
 * @version:1.0.0
 * @see 
 * @since 2018年4月22日下午10:20:49
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
/**
 * @ClassName:Method
 * @Description:
 * @author:mmz
 * @version:1.0
 * @see 
 * @since 2018年4月22日下午10:20:51
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class Method {

	/** @Fields:modelService 数据库信息处理服务类 */
	public static ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

	/**
	 * 
	 * 1. 格式转换
	 * 
	 * /
	 * 
	 * /**  
	 * 
	 * @Description: Stirng转Date
	 * @param str
	 *          传入的时间
	 * @param match
	 *          时间的格式 如："yyyyMMdd hhmmss"
	 * @return
	 * @throws ParseException
	 * @author: mmz  @Company:morelean    
	 */
	public static Date parsetDate(String str, String match) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat(match);// 设置日期格式
		Date d = df.parse(str);
		return d;
	}

	/**
	 * 
	 * Clob c = new SerialClob(s1.toCharArray());//String 转 clob Blob b = new
	 * SerialBlob(s1.getBytes("GBK"));//String 转 blob 也可以这样不传字符集名称，默认使用系统的 Blob b
	 * = new SerialBlob(s1.getBytes()); String clobString = c.getSubString(1,
	 * (int) c.length());//clob 转 String String blobString = new
	 * String(b.getBytes(1, (int) b.length()),"GBK");//blob 转 String
	 */

	// Clob类型转换成String类型
	public static String clobToString(final Clob clob) {
		if (clob == null) {
			return null;
		}

		Reader is = null;
		try {
			is = clob.getCharacterStream();
		} catch (Exception e) {
			e.printStackTrace();
		}
		BufferedReader br = new BufferedReader(is);

		String str = null;
		try {
			str = br.readLine(); // 读取第一行
		} catch (Exception e) {
			e.printStackTrace();
		}

		StringBuffer sb = new StringBuffer();
		while (str != null) { // 如果没有到达流的末尾，则继续读取下一行
			sb.append(str);
			try {
				str = br.readLine();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		String returnString = sb.toString();

		return returnString;
	}

	// String类型转换成Clob类型
	public static Clob stringToClob(final String string) {

		if (null == string || string.trim().length() == 0) {
			return null;
		}
		return new org.hibernate.lob.ClobImpl(string);
	}

	/*
	 * String与blob互转
	 */
	public static String blobToString(Blob blob) throws SQLException {
		String str = null;
		str = new String(blob.getBytes((long) 1, (int) blob.length()));
		return str;
	}

	public static Blob stringToBlob(String str) {
		if (null == str) {
			return null;
		}
		Blob blob = null;
		blob = Hibernate.createBlob(str.getBytes());
		return blob;
	}

	/**
	 * 
	 * 2. 数据库操作
	 * 
	 */

	/**
	 * 
	 * @Description: 根据ERP传来的dep_sn 返回对应的部门ID
	 * @param dep_sn
	 * @return ID
	 * @author: mmz  @Company:morelean    
	 */
	public static String getDeptId(String dep_sn) {

		String sql = "select id , rownum rn from sy_dept where ERP_CODE =? and rownum = 1";
		List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] { dep_sn });
		if (null == list || "".equals(list) || list.size() < 1 || null == list.get(0).get("ID") || "".equals(list.get(0).get("ID"))) {
			return null;
		}
		return list.get(0).get("ID").toString();
	}
	
  /** 
   * @Description: 处理与List<Map<String,Object>>数据格式 吻合的xml数据  
   * @param xmlMsg
   * @return 返回 List<Map<String, Object>> list
   * @throws DocumentException
   * @throws UnsupportedEncodingException
   * @author: mmz
   * @Company:morelean     
   */ 
  public static List<Map<String, Object>> getDataList(String xmlMsg) throws DocumentException,UnsupportedEncodingException {
      List<Map<String, Object>> dataList = new ArrayList<Map<String, Object>>();        
      SAXReader reader = new SAXReader();                                               
      // 定义一个文档                                                                         
      Document document = null;                                                         
      document = reader.read(new ByteArrayInputStream(xmlMsg.getBytes("UTF-8")));       
      // 得到xml的根节点(message)                                                             
      Element root = document.getRootElement();                                         
      // 定义子循环体的变量                                                                      
      Element obj = null;                                                               
      Iterator elems = null;                                                            
      List<Element> items = root.elements();                                            
      for (Element item : items) {                                                      
      	Map<String, Object> elemap = new HashMap<String, Object>();                     
      	for (elems = item.elementIterator(); elems.hasNext();) {// 遍历获得xml内容            
      		obj = (Element) elems.next();                                                 
      		elemap.put(obj.getName(), obj.getText());// 标签名 和 数据                          
      	}                                                                               
      	dataList.add(elemap);                                                           
      }                                                                                 
      return dataList;                                                                  
   }
	

	/**
	 * 3. 业务处理
	 */
	
	
	/**
	 *  
	 * 
	 * @Description:
	 * 
	 *               根据传入的ORM(对象关系映射图)、 vto：参数, val： 值 获得数据库中对应的 字段 和 对应类型的值 注：
	 *               ORM: Map<vto,Map2<dto,type>> 其中Map2存 dto, type 和 nullable
	 *               ，'true'|'false' ， date ：type
	 * @author: mmz
	 * @return: Map<dto,value>  @Company:morelean    
	 * 
	 */
	
	@SuppressWarnings("unchecked")
	//TODO 验证 nb=y 和 ref 和 vail
	public static Map<String, Object> vtoRefMap(String vto, Object val, Map<String, Map<String, String>> rulmap) throws Exception {
		if (!rulmap.containsKey(vto)) {
			return null;
//			throw new Exception("非法字段【" + vto + "】");
		}
		Map<String, Object> dmap = new HashMap<String, Object>();//return dmap
		// 1.使用map来判断
		Map<String, String> map = rulmap.get(vto);//map中为具体规则
		String dto = map.get("key");//获得 vto对应 的 数据库字段 dto

		if (null == val || "".equals(val)) {// 空值处理
			if (map.containsKey("nullable")) {// 必填项认证 注：若vamp 中未包含'nullable' 则 默认可以为空
				if ("false".equals(map.get("nullable")))
					throw new Exception("必填字段【" + vto + "】不可为空");
			}

			if (map.containsKey("nb")) {// nb值作用同 nullable 注：当 nb 值 为 y 时触发清空字段值  
				if ("n".equals(map.get("nb")))
					throw new Exception("必填字段【" + vto + "】不可为空");
			  else if("y".equals("nb")){//清空数据库中对应的字段 
						dmap.put(dto, "");
						return dmap;
			  }else
					return null;
			}else{//'nb'	不存在时 返回null			
				return null;
			}
			
		}//空处理

	if (map.containsKey("type")) {// 若vmap中未包含'type' 则默认为'String'
		String type = map.get("type");
		switch (type) {// 根据类型附值
		case "string":// ...

			break;
		case "number":
			try {
				val = Integer.parseInt((String) val);
			} catch (Exception e) {
				try {
					val = Float.parseFloat((String) val);
				} catch (Exception o) {
					val = Double.parseDouble((String) val);// 让它报错
				}
			}
			break;
		case "date":// 根据 da te类型
			if (map.containsKey("dtype")) {
				String dtype = map.get("dtype");
				val = parsetDate(val.toString(), dtype);
			} else {
				val = parsetDate(val.toString(), "yyyyMMdd hhmmss");
			}

			break;
		case "blob":
			val = stringToBlob(val.toString());
			break;
		case "clob":
			val = stringToClob(val.toString());
			break;
		default:

			break;
		}//switch
	}
		
		if(map.containsKey("vaild")){//如果需要验证数据
			if (!"".equals(map.get("vaild"))){

					int count = 0;
					try{
						 count = modelService.execSql(map.get("vaild"), new Object[] {val});
					}catch(Exception e){
						throw new Exception("vtoRefMap方法中处理vaild时错误:"+vto+"="+val+";vaild="+map.get("vaild")+"\n"+e.getMessage());
					}
				if(count == 0){
					if(map.containsKey("emsg"))
						throw new Exception(map.get("emsg")+"__"+vto+"="+val);//错误信息
					else
						throw new Exception(vto+"="+val+"的数据不存在");
					
				}
			 }
		}//vaild
		
		//	 	String str = ((List<Map<String,String>>)((Object)map.get("PROJECT_ID").get("vailds"))).get(0).get("vaild");
		if(map.containsKey("vailds")){//如果需要验证多项数据
			if (!"".equals(map.get("vailds"))){
				List<Map<String,String>> vailds = null;
			  try{
			  	vailds =(List<Map<String,String>>)(Object)map.get("vailds");
			  }catch(Exception e){
			  	throw new Exception("对象关系json字符串配制错误："+vto+"项的 vailds 格式错误");
			  }
			for(int i = 0 ; i<vailds.size();i++){
				if(vailds.get(i).containsKey("vaild")){
					int count = 0;
					try{
						 count = modelService.execSql(vailds.get(i).get("vaild"), new Object[] {val});
					}catch(Exception e){
						throw new Exception("vtoRefMap方法中处理vailds["+i+"]时错误:"+vto+"="+val+";vaild="+vailds.get(i).get("vaild")+"\n"+e.getMessage());
					}
				if(count == 0){
					if(vailds.get(i).containsKey("emsg"))
						throw new Exception(vailds.get(i).get("emsg")+"__"+vto+"="+val);//错误信息
					else
						throw new Exception(vto+"="+val+"的数据不存在");
					
				}//vaild
			 }// ifhas vaild
			}//for 
		}// vailds not ""
	 }//ifhas vailds
		
		//当需要返回的不是或不只是 vto 时候  利用 ref 和 ref_bc来获得 返回值
		if(map.containsKey("ref")){
			 if(!map.containsKey("ref_cb"))
				 throw new Exception("对象关系json字符串配制错误：配制了ref 却末配制 ref_cb");
			 if("".equals(map.get("ref")))
				 throw new Exception("对象关系json字符串配制错误：ref 不可为空 ");
			 List<Map<String,Object>> list = null;
			 try{
				 list = modelService.listDataSql(map.get("ref"), new Object[]{val});
			 }catch(Exception e){
				 throw new Exception("vtoRefMap方法中处理ref时错误:"+vto+"="+val+";ref="+map.get("ref")+"\n"+e.getMessage());
			 }
			 if(null!=list&&list.size()>0){
				String cd[] = map.get("ref_cb").split("[|]");
				for(int i = 0;i<cd.length;i++){
					if(list.get(0).containsKey(cd[i]))
					  dmap.put(cd[i], list.get(0).get(cd[i]));
					else
						throw new Exception("对象关系json字符串配制错误：末找到ref_cb值【"+cd[i]+"】的对应关系————"+vto+"="+val);
				}
			
				return dmap;
			}else{
				if(map.containsKey("refmsg"))
					throw new Exception(map.get("refmsg")+":"+vto+"="+val);
				else
					return null;
			}
		}//ref
		
		dmap.put(dto, val);
		return dmap;

		// 2.使用迭代器
		/*
		 * Iterator<Entry<String, String>> itra = map.entrySet().iterator();
		 * Entry<String, String> dtoentry = itra.next(); if(itra.hasNext()){//必填项认证
		 * Entry<String, String> rulentry = itra.next();
		 * if(null==val||"".equals(val)){ if("false".equals(rulentry.getValue()))
		 * throw new Exception("必填字段【"+vto+"】不可为空");; } return null; } String dto =
		 * dtoentry.getKey(); String key = dtoentry.getValue();
		 */
	}
	
	
	/** 
	 * @Description: 用做空值验证 ———— 抛出所有必填而未填的项目
	 * @param elemap  当前获得的项目 <dto,value>
	 * @param reqmap  规定必填项  <dto,vto>  抛出vto
	 * @throws AppException
	 * @author: mmz
	 * @Company:morelean     
	 */ 
	public static void checkEmpty( Map<String, String> reqmap, Map<String, Object> elemap)throws AppException {
		Set<String> eleset = elemap.keySet();
		Set<String> set = new HashSet();
		set.addAll(reqmap.keySet());
		set.removeAll(eleset);
		Iterator<String> it = set.iterator();
		StringBuilder empty = new StringBuilder();
		while(it.hasNext()){
			empty.append(reqmap.get(it.next())).append(",");
		}
		if(empty.length()>0){
			throw new AppException("必填项目:"+empty+"缺失。");
		}
	}

	/** 
	 * @Description: 获得映射规则
	 * @param className
	 * @return
	 * @throws AppException
	 * @author: mmz
	 * @Company:morelean     
	 */ 
	public static  Map<String, Map<String, String>> getRuleMap(String className) throws AppException {
		try {
			return RuleFactory.getRuleFactory().getRuLe(className).getRuleMap();
		} catch (Exception e2) {
			throw new AppException(e2.getMessage() + "末找到关联rulmap");
		}
	}
	
	
	
	
	
	/**
	 * 
	 */

	/**
	 *  
	 * 
	 * @Description: 反射调用方法
	 * 									注：若参数从文件读取，配合定时器可做运行测试 
	 * 										例：调用本类中的votRefMap 方法 
	 *                         public static void run2(){
	 *                             Map<String,Map<String,String>> map = new            
	 *                             HashMap<String,Map<String,String>>();
	 *                             Object o = new Object(); 
	 *                            o =                                                           
	 *                             "{'custname':{'key':'name','type':'String','nb':'y'}" 
	 *                            +",'custsex':{'key':'sex','type':'number'}" 
	 *                            +",'cusbirthdate':{'key':'birthdate','type':'Date','dtype':'yyyyMMdd'}"  
	 *                            +",'curtime':{'key':'time','type':'Date','dtype':'yyyyMMdd'}}";
	 *                              map = jsonToMap(o);//转map方法 
	 *                               try { Map<String,Object> vmap =                   
	 *                                Method.vtoRefMap("custname", "", map); 
	 *                                Class[] cls = new Class[]{"".getClass(),Object.class,Map.class}; 
	 *                                Object[] objs= new Object[]{"custname","",map};
	 *                                Object m = common.Method.Reflection("common.Method","vtoRefMap",cls, objs);
	 *                                System.out.println(m); 
	 *                               }catch (Exception e) {                   
	 *                            			e.printStackTrace(); 
	 *                              	}
	 *                          }                                                
	 * @param cls
	 * @param method
	 * @return
	 * @throws Exception
	 * @author: mmz  @Company:morelean    
	 */
	public static Object Reflection(String path, String method, Class[] cls, Object[] params) throws Exception {
		Object o = null;
		Class oClass = Class.forName(path);
		java.lang.reflect.Method oMethod = oClass.getDeclaredMethod(method, cls);
		Object obj = oClass.getConstructor().newInstance();
		o = oMethod.invoke(obj, params);
		return o;
	}

	
	
	
	/**
  * @Title: getPropertiesValue
  * @Description:获取配置文件信息
  * @param configName
  * @param key
  * @return String
  * @throws
  */
 public static String getPropertiesValue(String configName,String key) {
     try {
         String value = "";
         InputStream path =Thread.currentThread().getContextClassLoader().getResourceAsStream(configName+".properties");
         Properties prop = new Properties();
         prop.load(path);
          value = prop.getProperty(key);
         return value;
     } catch (Exception e) {
         return "";
     }
 }
	
	
	

	/**
	 *  
	 * 
	 * @Description: 传入json字符串 例：
	 *               "{'custname':{'key':'name','type':'String','nullable':'false'}"
	 *               + ",'custsex':{'key':'sex','type':'number'}" +
	 *               ",'cusbirthdate':{'key':'birthdate','type':'date','dtype':'yyMMdd'}"
	 *               + ",'curtime':{'key':'time','type':'date'}}";
	 * @param o
	 * @return map
	 * @author: mmz  @Company:morelean    
	 */
	public static Map<String, Map<String, String>> jsonToMap(Object jsonObj) {
		JSONObject jsonObject = JSONObject.fromObject(jsonObj);
		Map<String, Map<String, String>> map = (Map<String, Map<String, String>>) jsonObject;
		return map;
	}

}
