package com.more.mes.smt.labelhttp.http;

import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
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

import org.apache.commons.io.IOUtils;

import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.client.entity.GzipDecompressingEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import com.more.fw.core.cs.model.commu.DataInteraction;

import net.sf.json.JSONObject;

public class HttpUtils implements IJobx {

	// 接口工具
	public interface StatusCodeHandler<T> {
		T hadler(int statusCode);
	}

	/**
	 * httpclient自带维护cookie功能，前提是同一个进程共享一个httpclient对象，
	 * httpclient是线程安全的可直接定义为静态？或者维护一个连接池？
	 */
	public static CloseableHttpClient httpClient = HttpClients.createDefault();

	public HttpUtils() {
		super();
	}

	public static DataInteraction postObj(String url, DataInteraction data) {
		return postObj(url, data, null, false);
	}

	public static DataInteraction postObj(String url, DataInteraction data,
			StatusCodeHandler<DataInteraction> handler, boolean gzip) {
		HttpPost post = new HttpPost(url);
		post.addHeader("Content-Type", "obj");
		if (gzip) {
			post.addHeader("Accept-Encoding", "gzip");
		}
		try {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(baos);
			oos.writeObject(data);
			System.out.println(baos.toByteArray().length);
			ByteArrayEntity entity = new ByteArrayEntity(baos.toByteArray());

			System.out.println(entity.getContentLength());
			post.setEntity(entity);
			CloseableHttpResponse response = null;
			ObjectInputStream ois = null;
			try {
				response = httpClient.execute(post);
				int status = response.getStatusLine().getStatusCode();
				if (status >= 200 && status < 300) {
					if (response.getEntity() == null) {
						return null;
					}
					// 如果服务端对响应内容压缩
					if (response.getFirstHeader("Content-Encoding") != null
							&& response.getFirstHeader("Content-Encoding")
									.getValue().toLowerCase().contains("gzip")) {
						ois = new ObjectInputStream(
								new GzipDecompressingEntity(
										response.getEntity()).getContent());
					} else {
						ois = new ObjectInputStream(response.getEntity()
								.getContent());
					}

					return (DataInteraction) ois.readObject();
				} else {
					// 其他状态用户自己实现
					if (handler == null) {
						throw new RuntimeException("请求失败！状态码：" + status);
					}
					return null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e);
			} finally {
				oos.close();
				ois.close();
				response.close();
			}

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static String postJson(String url, String json,
			StatusCodeHandler<JSONObject> handler, boolean gzip) {
		HttpPost post = new HttpPost(url);
		if (gzip) {
			post.addHeader("Accept-Encoding", "gzip");
		}
		StringEntity entity = new StringEntity(json, ContentType.create(
				"application/json", Charset.forName("utf-8")));
		post.setEntity(entity);
		CloseableHttpResponse response = null;
		try {
			response = httpClient.execute(post);
			int status = response.getStatusLine().getStatusCode();
			if (status >= 200 && status < 300) {
				if (response.getEntity() == null) {
					return null;
				}
				String result = null;
				// 如果服务端对响应内容压缩
				if (response.getFirstHeader("Content-Encoding") != null
						&& response.getFirstHeader("Content-Encoding")
								.getValue().toLowerCase().contains("gzip")) {
					result = EntityUtils.toString(new GzipDecompressingEntity(
							response.getEntity()));
				} else {
					result = EntityUtils.toString(response.getEntity());
				}
				// return JSONObject.parseObject(result);
				return result;
			} else {
				// 其他状态用户自己实现
				if (handler == null) {
					throw new RuntimeException("请求失败！状态码：" + status);
				}
				return null;
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			try {
				response.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static String postJson(String url, JSONObject json) {
		return postJson(url, json.toString());
	}

	public static String postJson(String url, String json) {
		return postJson(url, json, null, false);
	}

	// json工具
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

	// 字符串转时间格式
	public static Date parseDateString(String dateStr) {
		DateFormat[] dateformat = new DateFormat[] {
				new SimpleDateFormat("yyyy-MM-dd"),
				new SimpleDateFormat("yyyy/MM/dd"),
				new SimpleDateFormat("yyyy年MM月dd日"),
				new SimpleDateFormat("yyyyMMdd") };
		for (DateFormat df : dateformat) {
			try {
				return df.parse(dateStr);

			} catch (ParseException e) {
			}
		}
		return null;

	}

	/**
	 * Args 参数设置类 Map<String,Object> params 传人参数 Object result 返回内容
	 */
	@Override
	public void exec(Args args) throws Exception {

		System.out.println("123");
		long dString = System.currentTimeMillis();

		String url = null;
		String json = null;
		String jsonObj = null;
		String username = "18606060606"; // 登入账号
		String password = "DNXC654321"; // 登入密码
		String LabelID = "f3e97d0e6f64427fb81bc9136c70f364"; // 标签ID
		// url =
		// "http://190.160.2.12:8099/morelabel/http/interface.ms?model=label&method=ValidateUser";
		url = "http://morelabel.cn/ml/http/interface.ms?model=label&method=ValidateUser";
		// json =
		// "{\"username\":\"17759069548\", \"password\":\"123456\", \"languagecode\":\"zh_TW\"}";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// map.put("username", "18105095158");
		map.put("username", username);
		map.put("password", password);
		map.put("languagecode", "zh_CN");
		json = map2json(map);
		System.out.println("json=" + json);

		jsonObj = postJson(url, json);
		System.out.println("输出的" + jsonObj);

		url = "http://morelabel.cn/ml/http/interface.ms?model=label&method=DownLoadLabel";

		// json =
		// "{\"LabelID\":\"a102e3843f834b5f860d522dcabbd5b4\", \"ITEMS\":[{\"EQUAL\":\"OR\",\"物料代码\":\"1\"}]}";
		// 转成json数据发送到添加标签打印
		// 获取开始取值时间

		SimpleDateFormat sdf0 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String printDateBegin;
		String printDateEnd = sdf0.format(new Date());
		String getSql = " select t.value 时间  from t_xc_sync_clound t where t.name = 'HTTP'  ";
		List<Map<String, String>> getTime = CommMethod.getBaseService()
				.listDataSql(getSql, new Object[] {});
		if (getTime.isEmpty()) {
			printDateBegin = sdf0.format(new Date());
		} else {
			printDateBegin = getTime.get(0).get("时间"); // 供应商代码
		}

		Map<String, Object> map2 = new LinkedHashMap<String, Object>();
		map2.put("EQUAL", "OR");
		map2.put("物料代码", "1");

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list.add(map2);
		// 1 a102e3843f834b5f860d522dcabbd5b4
		// 2 b3b2e5a127d54a8ea34fa953d50c0ee1
		// 81 37ee6c2498294ee893d8a270a6af67d3
		System.out.println("检索开始时间" + printDateBegin);
		System.out.println("检索结束时间" + printDateEnd);
		Map<String, Object> map3 = new LinkedHashMap<String, Object>();
		map3.put("LabelID", LabelID);
		map3.put("printDateBegin", printDateBegin);
		// map3.put("printDateEnd", printDateEnd);
		map3.put("Datas", list);

		json = map2json(map3);
		System.out.println(json);

		jsonObj = postJson(url, json);

		try {
			jsonObj = new String(jsonObj.getBytes("iso8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		System.out.println(jsonObj);
		// 返回值是否成功

		JSONObject jsonObject = JSONObject.fromObject(jsonObj); // 转成json格式
		String IsSuccess = jsonObject.getString("IsSuccess");
		if ("True".equals(IsSuccess)) {

			String Datas = jsonObject.getString("Datas");
			System.out.println("第一个Datas=" + Datas);

			JSONObject jsonObject2 = JSONObject.fromObject(Datas);

			String Datas2 = jsonObject2.getString("Datas");
			System.out.println("第二个Datas=" + Datas2);

			JSONArray jsonArray = JSONArray.fromObject(Datas2); // 把值转为json数组对象
			Object[] strs = jsonArray.toArray(); // json转为数组

			for (Object s2 : strs) {
				String a2 = s2.toString();
				JSONObject jsonObject3 = JSONObject.fromObject(a2); // 获取单条记录转成json

				String betime = jsonObject3.getString("PRINTING_TIME"); // 打印时间

				String wmi_item_ewm = jsonObject3.getString("二维码"); // 物料二维码

				int beginW = wmi_item_ewm.length() - 4;
				String wmi_item_lsh = wmi_item_ewm.substring(beginW,
						wmi_item_ewm.length()); // 流水号

				String wmi_doc_no = jsonObject3.getString("采购入库单"); // 关联单号

				String wmi_po = jsonObject3.getString("采购订单"); // 采购订单

				String num = jsonObject3.getString("数量");
				int wmi_sn_num = 0;
				if ("null".equals(num) || num.isEmpty()) {
					wmi_sn_num = 0;
				}
				if (!num.matches("[0-9]+")) {
					wmi_sn_num = 0;
				} else {
					wmi_sn_num = Integer.parseInt(num); // 数量
				}
				int wmi_item_seq = 1; // 项次 默认 1

				String wmi_lot_no = jsonObject3.getString("Lot No."); // 批号

				String wmi_item_code = jsonObject3.getString("物料代码"); // 物料料号

				String wmi_sup_code = jsonObject3.getString("供应商名称");

				String BIN = jsonObject3.getString("BIN段");
				if ("".equals(BIN)) {
					BIN = "0";
				}
				if ("null".equals(BIN)) {
					BIN = "0";
				}
				if ("Null".equals(BIN)) {
					BIN = "0";
				}

				String SupSql = "select decode(t.SUPPLIER_CODE,'','未知供应商代码',t.SUPPLIER_CODE) as 供应商代码   from t_co_supplier t where t.SUPPLIER_NAME = ? ";
				List<Map<String, String>> getSupName = CommMethod
						.getBaseService().listDataSql(SupSql,
								new Object[] { wmi_sup_code });
				if (getSupName.isEmpty()) {
					wmi_sup_code = "未知供应商代码";
				} else {
					wmi_sup_code = getSupName.get(0).get("供应商代码"); // 供应商代码
				}

				String wmi_produce_date = jsonObject3.getString("Day Code"); // 供应商生产日期
				System.out.println("生产日期时间长度" + wmi_produce_date.length());
				// wmi_produce_date = wmi_produce_date.replaceAll("年",
				// "").replaceAll("月", "").replaceAll("日", "");

				// String wmi_item_sn = wmi_sup_code+"_"+ wmi_item_code + "_" +
				// wmi_produce_date + "_" +wmi_item_lsh; //物料SN 供应商代号_物料号_日期_流水号
				String wmi_item_sn = jsonObject3.getString("二维码");
				// 插入数据库
				String uuids = StringUtils.getUUID();
				SimpleDateFormat sdf1 = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");

				TableDataMapExt wms = new TableDataMapExt();
				wms.setTableName("t_wms_mid_item"); // 插入中间表
				wms.getColMap().put("id", uuids);
				wms.getColMap().put("wmi_item_sn", wmi_item_sn); // 物料Sn
																	// 物料$数量$流水号
				wms.getColMap().put("wmi_doc_no", wmi_doc_no); // 采购入库单-关联单号
				wms.getColMap().put("wmi_po", wmi_po); // 采购订单
				wms.getColMap().put("wmi_sn_num", wmi_sn_num); // 数量
				wms.getColMap().put("wmi_item_seq", wmi_item_seq);
				wms.getColMap().put("wmi_lot_no", wmi_lot_no); // 批号
				wms.getColMap().put("wmi_item_code", wmi_item_code);
				wms.getColMap().put("wmi_sup_code", wmi_sup_code); // 供应商代码
				wms.getColMap().put("BIN", BIN); // BIN段

				SimpleDateFormat sdf4 = new SimpleDateFormat("yyyy-MM-dd");

				String sss = wmi_produce_date;
				String S1;
				String S2;
				int year; // 开始年份
				int week; // 开始周
				sss = sss.replaceAll("/", "");
				sss = sss.replaceAll("-", "");

				boolean isNum = sss.matches("[0-9]+");
				if (sss.length() > 3 && sss.length() < 7) {

					System.out.println(isNum);
					if (isNum) {
						S1 = "20" + sss.substring(0, 2);
						year = Integer.parseInt(S1);
						week = Integer.parseInt(sss.substring(2, 4));
						Calendar cal = Calendar.getInstance();
						cal.set(Calendar.YEAR, year); // 2016年
						cal.set(Calendar.WEEK_OF_YEAR, week); // 设置为2016年的第10周
						cal.set(Calendar.DAY_OF_WEEK, 2); // 1表示周日，2表示周一，7表示周六
						Date date = cal.getTime();
						String tm = sdf4.format(date);
						Date toDate = sdf4.parse(sdf4.format(date));
						wms.getColMap().put("wmi_produce_date", toDate);

					} else {
						wms.getColMap().put("wmi_produce_date",
								sdf4.parse(sdf4.format(new Date())));
					}
				} else if (wmi_produce_date.length() >= 7
						&& wmi_produce_date.length() <= 11
						&& wmi_produce_date != "null"
						&& "".equals(wmi_produce_date)) {
					wms.getColMap().put("wmi_produce_date",
							parseDateString(wmi_produce_date));
				} else {
					wms.getColMap().put("wmi_produce_date",
							sdf4.parse(sdf4.format(new Date())));
				}

				wms.getColMap().put("wmi_create_date", sdf1.parse(betime)); // 打印时间

				wms.getColMap().put("wmi_quality_status", 0); // 品质状态(0--未检验，1--检验合格，2--检验不合格)

				wms.getColMap().put("create_user", "admin"); // 创建人

				wms.getColMap().put("create_time",
						sdf1.parse(sdf1.format(new Date()))); // 创建时间

				wms.getColMap().put("edit_user", "admin"); // 修改人

				wms.getColMap().put("edit_time",
						sdf1.parse(sdf1.format(new Date()))); // 修改时间

				if (jsonObject3.containsKey("一级外包装")) {
					wms.getColMap().put("WMI_FIRST_SN",
							jsonObject3.getString("一级外包装"));
				}
				if (jsonObject3.containsKey("二级外包装")) {
					wms.getColMap().put("WMI_SECOND_SN",
							jsonObject3.getString("二级外包装"));
				}
				if (jsonObject3.containsKey("三级外包装")) {
					wms.getColMap().put("WMI_THIRD_SN",
							jsonObject3.getString("三级外包装"));
				}
				if (jsonObject3.containsKey("四级外包装")) {
					wms.getColMap().put("WMI_FOURTH_SN",
							jsonObject3.getString("四级外包装"));
				}
				if (jsonObject3.containsKey("是否打叉板")) {
					if ("1".equals(jsonObject3.getString("是否打叉板"))
							|| "是".equals(jsonObject3.getString("是否打叉板"))) {
						wms.getColMap().put("iscross", "1");
					}
				}

				CommMethod.getBaseService().save(wms);

				// 修改下次获取数据的开始时间
				// SimpleDateFormat sd1 = new
				// SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String ttime = sdf1.format(new Date());
				System.out.println("下次获取数据的开始时间" + ttime);

				TableDataMapExt xc = new TableDataMapExt();
				xc.setTableName("T_XC_SYNC_CLOUND"); // 插入中间表
				xc.setSqlWhere(" and NAME = 'HTTP' ");
				xc.getColMap().put("VALUE", betime);
				int s = CommMethod.getBaseService().edit(xc);
				System.out.println(s);

				// String updahql3 =
				// "update T_XC_SYNC_CLOUND set VALUE = ? where TYPE = '3' ";
				// CommMethod.getBaseService().execSql(updahql3, new Object
				// []{ttime});
			}
		} else {
			String uuidv2 = StringUtils.getUUID();
			String updahql3 = "insert into T_XC_SYNC_LOG (id,ERRORDATE,ERRORMESSAGE)values(?,sysdate,?)";
			CommMethod.getBaseService().execSql(updahql3,
					new Object[] { uuidv2, "获取标签打印失败" });

		}
	}

}
