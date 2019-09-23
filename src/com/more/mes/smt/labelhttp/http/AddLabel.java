package com.more.mes.smt.labelhttp.http;

import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Iterator;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.cookie.CookiePolicy;
import org.apache.commons.httpclient.methods.PostMethod;

import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.base.login.model.UserDto;
import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 云标签-上传标签打印信息
 */
public class AddLabel implements IJobx {
	private static final Log log = LogFactory.getLog(AddLabel.class);
	private ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");
	// 全局cookieID
	public static String JSESSIONID;
	public static String username = "18606060606"; // 登入账号
	public static String password = "DNXC654321"; // 登入密码
	public static String LabelID = "f3e97d0e6f64427fb81bc9136c70f364"; // 标签ID

	// 获取
	public static String jsonPostxx() {
		StringBuffer tmpcookies = new StringBuffer();
		String cokie = null;
		// 登陆 Url
		String loginUrl = "http://morelabel.cn/ml/http/interface.ms?model=label&method=ValidateUser";

		HttpClient httpClient = new HttpClient();

		// 模拟登陆，按实际服务器端要求选用 Post 或 Get 请求方式
		PostMethod postMethod = new PostMethod(loginUrl);

		// 设置登陆时要求的信息，用户名和密码
		NameValuePair[] data = { new NameValuePair("username", username),
				new NameValuePair("password", password),
				new NameValuePair("languagecode", "zh_CN") };

		postMethod.setRequestBody(data);
		try {
			// 设置 HttpClient 接收 Cookie,用与浏览器一样的策略
			httpClient.getParams().setCookiePolicy(
					CookiePolicy.BROWSER_COMPATIBILITY);
			httpClient.executeMethod(postMethod);
			// 获得登陆后的 Cookie
			Cookie[] cookies = httpClient.getState().getCookies();

			for (Cookie c : cookies) {
				tmpcookies.append(c.toString() + ";");
				cokie = tmpcookies.toString();
				JSESSIONID = cokie.substring(11, cokie.length());

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSESSIONID;
	}

	/**
	 * 发送HttpPost请求
	 * 
	 * @param strURL
	 *            服务地址
	 * @param a
	 * 
	 * @return 成功:返回json字符串<br/>
	 */
	public static String jsonPost(String strURL, String a) {
		try {
			URL url = new URL(strURL);// 创建连接
			HttpURLConnection connection = (HttpURLConnection) url
					.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setUseCaches(false);
			connection.setInstanceFollowRedirects(true);
			connection.setRequestMethod("POST"); // 设置请求方式
			connection.setRequestProperty("Accept", "application/json"); // 设置接收数据的格式
			connection.setRequestProperty("Content-Type", "application/json"); // 设置发送数据的格式
			connection.setRequestProperty("Cookie",
					"cookUserName=17759069549;morelabel_lang=zh_CN;JSESSIONID="
							+ JSESSIONID + ";");

			connection.connect();
			OutputStreamWriter out = new OutputStreamWriter(
					connection.getOutputStream(), "UTF-8"); // utf-8编码
			out.append(a);// 设置参数
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
			int length = connection.getContentLength();// 获取长度
			if (length != -1) {
				byte[] data = new byte[length];
				byte[] temp = new byte[512];
				int readLen = 0;
				int destPos = 0;
				while ((readLen = is.read(temp)) > 0) {
					System.arraycopy(temp, 0, data, destPos, readLen);
					destPos += readLen;
				}
				String result = new String(data, "UTF-8"); // utf-8编码
				return result;
			}

		} catch (IOException e) {
			log.error("发送http请求出错", e);
		}
		return "jsonPost：error"; // 自定义错误信息
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

	// 转map
	public static Map<String, String> toMap(Object object) {
		Map<String, String> data = new HashMap<String, String>();
		// 将json字符串转换成jsonObject
		JSONObject jsonObject = JSONObject.fromObject(object);
		Iterator ite = jsonObject.keys();
		// 遍历jsonObject数据,添加到Map对象
		while (ite.hasNext()) {
			String key = ite.next().toString();
			String value = jsonObject.get(key).toString();
			data.put(key, value);
		}
		// 或者直接将 jsonObject赋值给Map
		// data = jsonObject;
		return data;
	}

	/**
	 * Args 参数设置类 Map<String,Object> params 传人参数 Object result 返回内容
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void exec(Args args) throws Exception {

		// 登入连接
		String url = "http://morelabel.cn/ml/http/interface.ms?model=label&method=ValidateUser";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		map.put("password", password);
		map.put("languagecode", "zh_CN");
		String map2json = map2json(map);
		// 获取cookie
		jsonPostxx();
		String jsonPost = jsonPost(url, map2json);
		Map<String, String> paMaps = toMap(jsonPost);

		// 插入登入信息表T_XC_SYNC_LOG 1=成功
		if ("1".equals(paMaps.get("LoginResult"))) {
			String updahql = "update T_XC_SYNC_LOG set errordate = sysdate, errormessage = ? where ID = '90cc4af7cfe8433483c16e3c07dd7ced'";
			CommMethod.getBaseService()
					.execSql(updahql, new Object[] { "成功了" });

			String Selehql = "  select t1.id as ID, t3.ci_item_code 物料代码 , t3.ci_item_name as 物料品名,t3.Ci_Item_Spec 物料型号 ,t1.wpd_plan_num 数量 ,decode(t4.supplier_name,'','未知供应商',t4.supplier_name) as 供应商名称 , t2.WPI_PO 采购订单 , t4.SUPPLIER_CODE 供应商代码 ,'5' BIN "
					+ "  from t_wms_po_detail t1 "
					+ " left join t_wms_po_info t2 on t1.wpd_po = t2.wpi_po  "
					+ " left join t_co_item  t3 on t1.wpd_item_code = t3.ci_item_code  "
					+ " left join t_co_supplier t4 on t4.SUPPLIER_CODE = t2.wpi_sup_code  "
					+ "  where t1.WRI_IS_ADD = 'N' ";

			List<Map<String, String>> snLis = CommMethod.getBaseService()
					.listDataSql(Selehql);

			// 判断list是否有值
			String uuidv = StringUtils.getUUID();
			String updahql2 = "insert into T_XC_SYNC_LOG (id,DATA_AUTH,ERRORDATE,ERRORMESSAGE)values(?,?,sysdate,?)";
			if (snLis.isEmpty()) {

			} else {
				// 取list的值
				String json4 = JSONArray.fromObject(snLis).toString();
				JSONArray jsonArray = JSONArray.fromObject(json4); // 把值转为json数组对象
				Object[] strs = jsonArray.toArray(); // json转为数组

				int i = 1;

				for (Object s : strs) {
					i++;
					String a = s.toString();
					// String uuid = StringUtils.getUUID();
					JSONObject jsonObject2 = JSONObject.fromObject(a); // 获取单条记录转成json
					// String IDS= jsonObject2.getString("物料品名"); //获取单独字段
					String updahql4 = "update T_XC_SYNC_LOG set errordate = sysdate, errormessage = ? where ID = 'fe77a922ee85489cad16085c61b44c12'";
					CommMethod.getBaseService().execSql(updahql4,
							new Object[] { a });
					// 获取当前时间
					Date day = new Date();
					SimpleDateFormat df = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");
					String nowtime = df.format(day);

					// 转成json数据发送到添加标签打印
					Map<String, Object> map2 = new LinkedHashMap<String, Object>();
					map2.put("SEQ", i);
					map2.put("VendorCode", jsonObject2.getString("供应商代码"));
					map2.put("DeliveryDate", nowtime);
					map2.put("物料代码", jsonObject2.getString("物料代码"));
					map2.put("物料品名", jsonObject2.getString("物料品名"));
					map2.put("物料型号", jsonObject2.getString("物料型号"));
					// map2.put("批次号", jsonObject2.getString("批次号"));
					// map2.put("生产日期", "");
					map2.put("MSD等级", "");
					map2.put("供应商名称", jsonObject2.getString("供应商名称"));
					map2.put("采购订单", jsonObject2.getString("采购订单"));
					map2.put("数量", jsonObject2.getString("数量"));
					// map2.put("BIN段", jsonObject2.getString("BIN"));
					map2.put("BIN段", "");
					map2.put("供应商代码", jsonObject2.getString("供应商代码"));
					// map2.put("采购入库单", jsonObject2.getString("采购入库单"));

					List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
					list.add(map2);

					Map<String, Object> map3 = new LinkedHashMap<String, Object>();
					map3.put("LabelID", LabelID);
					map3.put("Datas", list);

					String ress = map2json(map3);
					System.out.println("上传标签字段" + ress);

					// 插入标签信息
					String Url3 = "http://morelabel.cn/ml/http/interface.ms?model=label&method=AddLabelTask";

					String labelINF3 = jsonPost(Url3, ress);
					System.out.println("返回值信息" + labelINF3);

					JSONObject jsonObject3 = JSONObject.fromObject(labelINF3); // 转成json格式

					// 如果返回值错误就不更新字段的Y值
					if (labelINF3.contains("Message")) {

						// 更新上传标签后的返回值信息
						String updahql3 = "update T_XC_SYNC_CLOUND set EDIT_TIME = sysdate, VALUE = ? where ID = 'd04bedcf9dd44753a0c70f1abf9cde94'";
						CommMethod.getBaseService().execSql(updahql3,
								new Object[] { labelINF3 });
					} else {

						String updaIsAdd = "update T_WMS_PO_DETAIL set wri_is_add = 'Y',WRI_PRODUCE_DATE = SYSDATE where ID = ? ";
						CommMethod.getBaseService().execSql(updaIsAdd,
								new Object[] { jsonObject2.getString("ID") });

					}

				}

			}

		} else {

			String updahql = "update T_XC_SYNC_LOG set errordate = sysdate, errormessage = ? where ID = 'e267375a96da47dc8681795647bb7d1a'";
			CommMethod.getBaseService().execSql(updahql,
					new Object[] { "登入失败" });
		}

	}
}
