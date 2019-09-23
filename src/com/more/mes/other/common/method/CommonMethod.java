package com.more.mes.other.common.method;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.Types;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.PUT;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.dto.Smap;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.mes.other.common.method.CommonMethod.DataStruct.Condition;
import com.more.mes.other.common.method.CommonMethod.DataStruct.PageImpl;

/**
 * 数据操作同一方法类
 * 
 * @author Chaos
 * 
 */
public class CommonMethod {

	private static final Log log = LogFactory
			.getLog("com.more.mes.other.common.method.CommonMethod");

	private static final ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");

	private enum OperationType {
		insert, update, delete
	}// 数据操作类型

	// 变量
	private static final String TYPE_LANG_STRING = "java.lang.String";
	private static final String TYPE_LANG_INTEGER = "java.lang.Integer";
	private static final String TYPE_LANG_DOUBLE ="java.lang.Double";
	private static final String TYPE_LANG_BIG_DECIMAL = "java.math.BigDecimal";
	private static final String TABLE_REFERENCE_KEYS = "referenceKeys";

	/**
	 * class for common
	 * 
	 * @author Chaos
	 * 
	 */
	public static class Common {

		/**
		 * 数据操作函数
		 * 
		 * @param formId
		 * @param modelAction
		 * @param modelService
		 * @param opt
		 */
		public static String doOperation(String formId, Map dataMap,
				ModelAction modelAction, ModelService modelService,
				OperationType opt) {
			try {
				// 筛选所需要的表单map
				JSONArray array = JSONArray.fromObject(dataMap.get(formId));
				if (array.size() <= 0) {
					return ""; // 若表单记录数为0，则无需操作
				}
				// 获取数据库中实体表的结构(作为插入属性的依据，避免扩展字段)
				String tableName = array.getJSONObject(0).get("tableName")
						.toString();
				String strSql = "SELECT\r\n" + "A.column_name,\r\n"
						+ "A.data_type\r\n" + "FROM USER_TAB_COLS A\r\n"
						+ "WHERE A.table_name=?";
				List<Map> structList = modelService.listDataSql(strSql,
						new Object[] { tableName });
				if (structList == null || structList.size() <= 0) {
					return modelAction.getText("获取实体表结构异常");
				}
				List<String> struct = new ArrayList();
				Map structMap = new HashMap();
				for (Map map : structList) {
					String colName = map.get("column_name") == null ? "" : map
							.get("column_name").toString().toUpperCase();
					String colType = map.get("data_type") == null ? "" : map
							.get("data_type").toString();
					// 特殊处理(框架生产的数据
					// DATA_AUTH,新增的时候key="DATA_AUTH",修改的时候key="_DATA_AUTH",需要转换)
					if ("DATA_AUTH".equals(colName)
							&& opt.equals(OperationType.update)) {
						colName = "_" + colName;
					}
					// 放入列
					struct.add(colName);
					structMap.put(colName, colType);
				}
				// 处理数据
				TableDataMapExt tableExt = new TableDataMapExt();
				List<String> referenceKeys = dataMap.get(TABLE_REFERENCE_KEYS) == null ? null
						: (List) dataMap.get(TABLE_REFERENCE_KEYS);// 暂时只针对删除开发
				int len = array.size();
				Object val = null;
				for (int i = 0; i < len; i++) {
					tableExt = new TableDataMapExt();
					tableExt.setTableName(tableName);
					JSONObject jarray = array.getJSONObject(i);
					for (String str : struct) {
						val = validateType(str, structMap, jarray);
						// 特殊处理(框架生产的数据
						// DATA_AUTH,新增的时候key="DATA_AUTH",修改的时候key="_DATA_AUTH",需要转换)
						if ("_DATA_AUTH".equals(str)
								&& opt.equals(OperationType.update)) {
							str = "DATA_AUTH";
						}
						tableExt.getColMap().put(str, val);
						// 收集where条件
						if (opt.equals(OperationType.delete)
								&& referenceKeys != null
								&& referenceKeys.contains(str)) {
							tableExt.setSqlWhere((tableExt.getSqlWhere() == null ? ""
									: tableExt.getSqlWhere())
									+ String.format(" AND %s=?", str));
							tableExt.getSqlWhereArgs().add(val);
						}
					}
					doModelService(modelService, tableExt, opt);
				}
				return "";
			} catch (Exception ex) {
				log.error("doOperation:" ,ex);
				return modelAction.getText("执行异常");
			}
		}

		/**
		 * 数据操作函数
		 * 
		 * @param formId
		 * @param modelAction
		 * @param modelService
		 * @param opt
		 */
		public static String doOperation(String formId, Map dataMap,
				ModelAction modelAction, ModelService modelService,
				OperationType opt, Enums.dataBaseType dbType) {
			try {
				// 筛选所需要的表单map
				JSONArray array = JSONArray.fromObject(dataMap.get(formId));
				if (array.size() <= 0) {
					return ""; // 若表单记录数为0，则无需操作
				}
				// 获取数据库中实体表的结构(作为插入属性的依据，避免扩展字段)
				String tableName = array.getJSONObject(0).get("tableName")
						.toString();
				String strSql = null;
				// 根据数据库类型获取语句
				if (Enums.dataBaseType.base.equals(dbType)) {
					strSql = "SELECT\r\n" + "A.column_name,\r\n"
							+ "A.data_type\r\n" + "FROM USER_TAB_COLS A\r\n"
							+ "WHERE A.table_name=?";
				} else if (Enums.dataBaseType.oralce.equals(dbType)) {
					strSql = "SELECT\r\n" + "A.column_name,\r\n"
							+ "A.data_type\r\n" + "FROM USER_TAB_COLS A\r\n"
							+ "WHERE A.table_name=?";
				} else if (Enums.dataBaseType.pg.equals(dbType)) {
					strSql = "SELECT \r\n" + "column_name, \r\n"
							+ "data_type\r\n"
							+ "FROM information_schema.columns\r\n"
							+ "WHERE table_name=LOWER(?)";
				} else {
					strSql = "SELECT\r\n" + "A.column_name,\r\n"
							+ "A.data_type\r\n" + "FROM USER_TAB_COLS A\r\n"
							+ "WHERE A.table_name=?";
				}
				List<Map> structList = modelService.listDataSql(strSql,
						new Object[] { tableName });
				if (structList == null || structList.size() <= 0) {
					return modelAction.getText("获取实体表结构异常");
				}
				List<String> struct = new ArrayList();
				Map structMap = new HashMap();
				for (Map map : structList) {
					String colName = map.get("column_name") == null ? "" : map
							.get("column_name").toString().toUpperCase();
					String colType = map.get("data_type") == null ? "" : map
							.get("data_type").toString();
					// 特殊处理(框架生产的数据
					// DATA_AUTH,新增的时候key="DATA_AUTH",修改的时候key="_DATA_AUTH",需要转换)
					if ("DATA_AUTH".equals(colName)
							&& opt.equals(OperationType.update)) {
						colName = "_" + colName;
					}
					// 放入列
					struct.add(colName);
					structMap.put(colName, colType);
				}
				// 处理数据
				TableDataMapExt tableExt = new TableDataMapExt();
				List<String> referenceKeys = dataMap.get(TABLE_REFERENCE_KEYS) == null ? null
						: (List) dataMap.get(TABLE_REFERENCE_KEYS);// 暂时只针对删除开发
				int len = array.size();
				Object val = null;
				for (int i = 0; i < len; i++) {
					tableExt = new TableDataMapExt();
					tableExt.setTableName(tableName);
					JSONObject jarray = array.getJSONObject(i);
					for (String str : struct) {
						val = validateType(str, structMap, jarray);
						// 特殊处理(框架生产的数据
						// DATA_AUTH,新增的时候key="DATA_AUTH",修改的时候key="_DATA_AUTH",需要转换)
						if ("_DATA_AUTH".equals(str)
								&& opt.equals(OperationType.update)) {
							str = "DATA_AUTH";
						}
						tableExt.getColMap().put(str, val);
						// 收集where条件
						if (opt.equals(OperationType.delete)
								&& referenceKeys != null
								&& referenceKeys.contains(str)) {
							tableExt.setSqlWhere((tableExt.getSqlWhere() == null ? ""
									: tableExt.getSqlWhere())
									+ String.format(" AND %s=?", str));
							tableExt.getSqlWhereArgs().add(val);
						}
					}
					doModelService(modelService, tableExt, opt);
				}
				return "";
			} catch (Exception ex) {
				log.error("doOperation:" ,ex);
				return modelAction.getText("执行异常");
			}
		}

		/**
		 * 根据操作类型执行modelService
		 * 
		 * @param modelService
		 * @param tableExt
		 * @param opt
		 */
		public static void doModelService(ModelService modelService,
				TableDataMapExt tableExt, OperationType opt) {
			if (opt == OperationType.insert) {
				modelService.save(tableExt);
			} else if (opt == OperationType.update) {
				tableExt.setSqlWhere(" AND ID=?");
				tableExt.getSqlWhereArgs().add(tableExt.getColMap().get("ID"));
				modelService.edit(tableExt);
			} else if (opt == OperationType.delete) {
				modelService.del(tableExt);
			}
		}

		/**
		 * 根据对象类型转换数据
		 * 
		 * @param key
		 * @param structMap
		 * @param jsonObject
		 * @return
		 */
		public static Object validateType(String key,
				Map<String, String> structMap, JSONObject jsonObject) {
			String type = structMap.get(key).toLowerCase();
			Object value = jsonObject.get(key);
			if (value == null) {
				return value;
			}
			switch (type) {
			case "date":
			case "timestamp without time zone":
				return convertJsonToDate(value);
			default:
				return value;
			}
		}

		/**
		 * 转换json数据中的时间数据为 Date
		 * (格式：{"date":13,"day":2,"hours":10,"minutes":41,"month"
		 * :2,"seconds":23,
		 * "time":1520908883000,"timezoneOffset":-480,"year":118}) 只取 time 进行转换
		 * 
		 * @param jsonObject
		 * @return
		 */
		public static Date convertJsonToDate(Object jsonObject) {
			try {
				if (jsonObject == null) {
					return null;
				}
				JSONArray array = JSONArray.fromObject(jsonObject);
				Long time = new Long(array.getJSONObject(0).get("time")
						.toString().trim());
				SimpleDateFormat format = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				String strTime = format.format(time);
				return format.parse(strTime);

			} catch (Exception ex) {
				log.error("convertJsonToDate:" ,ex);
				return null;
			}
		}

		/**
		 * 转换dateObject数据为 Date
		 * 
		 * @param dateObject
		 * @return
		 */
		public static Date convertObject2Date(Object dateObject) {
			try {
				if (dateObject == null) {
					return null;
				}
				SimpleDateFormat format = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				String strTime = format.format(dateObject);
				return format.parse(strTime);

			} catch (Exception ex) {
				log.error("convertObject2Date:" ,ex);
				return null;
			}
		}

		/**
		 * 转换dateStr数据为 Date
		 * 
		 * @param dateStr
		 * @return
		 */
		public static Date convertStr2Date(String dateStr) {
			try {
				if (StringUtils.isEmpty(dateStr)) {
					return null;
				}
				SimpleDateFormat sFormat = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				return sFormat.parse(dateStr);

			} catch (Exception ex) {
				log.error("convertStr2Date:" ,ex);
				return null;
			}
		}

		/**
		 * 转换dateStr数据为 Date
		 * 
		 * @param dateStr
		 * @param format
		 * @return
		 */
		public static Date convertStr2Date(String dateStr, String format) {
			try {
				if (StringUtils.isEmpty(dateStr)) {
					return null;
				}
				SimpleDateFormat sFormat = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				if (null != format && StringUtils.isEmpty(format)) {
					sFormat = new SimpleDateFormat(format);
				}
				return sFormat.parse(dateStr);

			} catch (Exception ex) {
				log.error("convertStr2Date:" ,ex);
				return null;
			}
		}

		/**
		 * 转换dateObject数据为 Date
		 * 
		 * @param dateObject
		 * @param dateformat
		 *            转换格式
		 * @return
		 */
		public static Date convertObject2Date(Object dateObject,
				String dateformat) {
			try {
				if (dateObject == null) {
					return null;
				}
				SimpleDateFormat format = new SimpleDateFormat(dateformat);
				String strTime = format.format(dateObject);
				return format.parse(strTime);

			} catch (Exception ex) {
				log.error("convertObject2Date:" ,ex);
				return null;
			}
		}

		/**
		 * 比较两个时间,返回较大时间
		 * 
		 * @param fDate
		 * @param sDate
		 * @return
		 */
		public static Date compareDateMax(Object fDate, Object sDate,
				String dateformat) {
			try {
				Date comfDate = CommonMethod.Common.convertObject2Date(fDate,
						dateformat);
				if (null == comfDate && null != fDate) {
					comfDate = CommonMethod.Common.convertStr2Date(
							fDate.toString(), dateformat);
				}
				Date comsDate = CommonMethod.Common.convertObject2Date(sDate,
						dateformat);
				if (null == comsDate && null != sDate) {
					comsDate = CommonMethod.Common.convertStr2Date(
							sDate.toString(), dateformat);
				}

				if (null == comfDate || null == comsDate) {
					return null == comfDate ? comsDate : comfDate;
				} else {
					return comfDate.getTime() > comsDate.getTime() ? comfDate
							: comsDate;
				}
			} catch (Exception ex) {
				log.error("compareDateMax:" ,ex);
				return null;
			}
		}

		/**
		 * 比较两个时间,返回较小时间
		 * 
		 * @param fDate
		 * @param sDate
		 * @return
		 */
		public static Date compareDateMin(Object fDate, Object sDate,
				String dateformat) {
			try {
				Date comfDate = CommonMethod.Common.convertObject2Date(fDate,
						dateformat);
				if (null == comfDate && null != fDate) {
					comfDate = CommonMethod.Common.convertStr2Date(
							fDate.toString(), dateformat);
				}
				Date comsDate = CommonMethod.Common.convertObject2Date(sDate,
						dateformat);
				if (null == comsDate && null != sDate) {
					comsDate = CommonMethod.Common.convertStr2Date(
							sDate.toString(), dateformat);
				}

				if (null == comfDate || null == comsDate) {
					return null == comfDate ? comsDate : comfDate;
				} else {
					return comfDate.getTime() > comsDate.getTime() ? comsDate
							: comfDate;
				}
			} catch (Exception ex) {
				log.error("compareDateMin:" ,ex);
				return null;
			}
		}

		/**
		 * 比较两个时间,返回较大时间
		 * 
		 * @param fDate
		 * @param sDate
		 * @return
		 */
		public static Date compareDateMax(Object fDate, Object sDate) {
			try {
				Date comfDate = CommonMethod.Common.convertObject2Date(fDate);
				if (null == comfDate && null != fDate) {
					comfDate = CommonMethod.Common.convertStr2Date(fDate
							.toString());
				}
				Date comsDate = CommonMethod.Common.convertObject2Date(sDate);
				if (null == comsDate && null != sDate) {
					comsDate = CommonMethod.Common.convertStr2Date(sDate
							.toString());
				}

				if (null == comfDate || null == comsDate) {
					return null == comfDate ? comsDate : comfDate;
				} else {
					return comfDate.getTime() > comsDate.getTime() ? comfDate
							: comsDate;
				}
			} catch (Exception ex) {
				log.error("compareDateMax:" ,ex);
				return null;
			}
		}

		/**
		 * 比较两个时间,返回较小时间
		 * 
		 * @param fDate
		 * @param sDate
		 * @return
		 */
		public static Date compareDateMin(Object fDate, Object sDate) {
			try {
				Date comfDate = CommonMethod.Common.convertObject2Date(fDate);
				if (null == comfDate && null != fDate) {
					comfDate = CommonMethod.Common.convertStr2Date(fDate
							.toString());
				}
				Date comsDate = CommonMethod.Common.convertObject2Date(sDate);
				if (null == comsDate && null != sDate) {
					comsDate = CommonMethod.Common.convertStr2Date(sDate
							.toString());
				}

				if (null == comfDate || null == comsDate) {
					return null == comfDate ? comsDate : comfDate;
				} else {
					return comfDate.getTime() > comsDate.getTime() ? comsDate
							: comfDate;
				}
			} catch (Exception ex) {
				log.error("compareDateMin:" ,ex);
				return null;
			}
		}

		/**
		 * 将时间类型转换为对应格式的字符串
		 * 
		 * @param date
		 * @param format
		 * @return
		 */
		public static String date2String(Date date, String format) {
			try {
				SimpleDateFormat sFormat = new SimpleDateFormat(
						"yyyy-MM-dd-hh:mm:ss");
				if (!StringUtils.isEmpty(format)) {
					sFormat = new SimpleDateFormat(format);
				}
				return sFormat.format(date);
			} catch (Exception ex) {
				log.error("" ,ex);
				return null;
			}
		}

		/**
		 * 获取数据list (以占位符方式)
		 * 
		 * @param sqlStr
		 *            sqlStr 为数据库查询语句（必须包含 查询条件的占位符 %s）
		 * @param conditions
		 *            查询条件
		 * @param impl
		 *            分页变量
		 * @return
		 */
		public static List getDataList(String sqlStr,
				List<Condition> conditions, PageImpl ipml) {
			try {
				int len = conditions.size();
				Object[] paramObject = new Object[len];// 参数值
				int[] paramType = new int[len];// 参数类型
				// 解析参数
				Condition cdi = null;
				String conditionStr = "";
				for (int i = 0; i < len; i++) {
					cdi = conditions.get(i);
					if (Enums.conditionReference.custom.equals(cdi.reference)) {
						// 走自定义条件
						conditionStr += " AND " + cdi.customValue;
					} else {
						if (!StringUtils.isEmpty(cdi.colName)) {
							// 值
							paramObject[i] = cdi.colValue;
							// 类型
							if (cdi.type == Enums.conditionType.varchar) {
								paramType[i] = Types.VARCHAR;
							} else if (cdi.type == Enums.conditionType.number) {
								paramType[i] = Types.NUMERIC;
							} else if (cdi.type == Enums.conditionType.date) {
								paramType[i] = Types.DATE;
							}
							// 拼接参数
							conditionStr += " AND "
									+ (StringUtils.isEmpty(cdi.tableFlag) ? ""
											: cdi.tableFlag + ".")
									+ cdi.colName;
							if (cdi.reference == Enums.conditionReference.equal) {
								conditionStr += "=?";
							} else if (cdi.reference == Enums.conditionReference.less) {
								conditionStr += "<?";
							} else if (cdi.reference == Enums.conditionReference.lessEqual) {
								conditionStr += "<=?";
							} else if (cdi.reference == Enums.conditionReference.greater) {
								conditionStr += ">?";
							} else if (cdi.reference == Enums.conditionReference.greaterEqual) {
								conditionStr += ">=?";
							} else if (cdi.reference == Enums.conditionReference.like) {
								conditionStr += " LIKE '%'||?||'%'";
							} else if (cdi.reference == Enums.conditionReference.leftLike) {
								conditionStr += " LIKE '%'||?";
							} else if (cdi.reference == Enums.conditionReference.rightLike) {
								conditionStr += " LIKE ?||'%'";
							}
						}
					}
				}
				// 执行查询
				if (null != ipml) {
					return modelService.listSql(
							String.format(sqlStr, conditionStr), ipml.impl,
							null, paramObject, paramType, ipml.orderBy, null);
				} else {
					return modelService.listDataSql(
							String.format(sqlStr, conditionStr), paramObject);
				}
			} catch (Exception ex) {
				log.error("getDataList:" ,ex);
				return null;
			}
		}

		/**
		 * 为实体类赋值
		 * 
		 * @param <T>
		 * @param objModel
		 * @return
		 * @throws IllegalAccessException
		 * @throws InstantiationException
		 */
		public static <T> List<T> GetModelByField(Class<T> cModel,
				List<Map> mapList) {
			try {
				List<T> returnList = new ArrayList<>();// 返回值
				Method varMethod = null;
				Field[] fieldPorperies = null;

				for (Map map : mapList) {
					T varModel = cModel.newInstance();
					fieldPorperies = varModel.getClass().getDeclaredFields();
					for (int i = 0; i < fieldPorperies.length; i++) {
						String fieldName = fieldPorperies[i].getName();
						String fieldType = fieldPorperies[i].getGenericType()
								.toString();
						Object mapValue = map.get(fieldName);
						if (mapValue == null)
							continue; // 若map中找不到字段值跳过赋值
						switch (fieldType) {
						case "class java.lang.String":
							varMethod = varModel.getClass().getMethod(
									"set" + fieldName, String.class);// 获取Set方法
							varMethod.invoke(varModel, (String) mapValue);
							break;
						case "int":
							varMethod = varModel.getClass().getMethod(
									"set" + fieldName, int.class);// 获取Set方法
							varMethod.invoke(varModel,
									((Integer) mapValue).intValue());
							break;
						case "double":
							varMethod = varModel.getClass().getMethod(
									"set" + fieldName, double.class);// 获取Set方法
							varMethod.invoke(varModel,
									((Integer) mapValue).doubleValue());
							break;
						default:
							break;
						}
					}
					returnList.add(varModel);
				}

				return returnList;
			} catch (Exception ex) {
				log.error("GetModelByField:" ,ex);
				return null;
			}
		}

		/**
		 * Map 转 Json
		 * 
		 * @param map
		 * @return
		 */
		public static String MapToJson(List<Map> mapList) {
			try {
				JSONArray json = JSONArray.fromObject(mapList);
				return json.toString();
			} catch (Exception ex) {
				log.info("MapToJson:" ,ex);
				return null;
			}
		}

		/**
		 * jsonStr to List<Map>
		 * 
		 * @param jsonStr
		 * @return
		 * @throws ParseException
		 */
		public final static List<Map> jsonStr2Map(String jsonStr) {
			String a = "";
			JSONArray jsonArray = JSONArray.fromObject(jsonStr);
			List<Map> mapList = new ArrayList();
			for (int i = 0, len = jsonArray.size(); i < len; i++) {
				mapList.add(json2Map(jsonArray.getJSONObject(i)));
			}
			return mapList;
		}

		/**
		 * jsonObject 转Map
		 * 
		 * @param jsonObject
		 * @return
		 */
		public final static Map json2Map(JSONObject jsonObject) {
			Map resultMap = new HashMap();
			Iterator iterator = jsonObject.keys();

			while (iterator.hasNext()) {
				String key = (String) iterator.next();
				Object value = jsonObject.get(key);
				try {
					if (value instanceof JSONObject) {
						value = json2Map((JSONObject) value);
						resultMap.put(key, value);
					} else if (value instanceof JSONArray) {
						value = json2List((JSONArray) value);
						resultMap.put(key, value);
					} else {
						resultMap.put(key, jsonObject.getString(key));
					}
				} catch (Exception ex) {
					resultMap.put(key, null);
				}
			}
			return resultMap;
		}

		/**
		 * json 转 List
		 * 
		 * @param jsonArray
		 * @return
		 */
		public final static List json2List(JSONArray jsonArray) {
			List resultList = new ArrayList();
			for (int i = 0, len = jsonArray.size(); i < len; i++) {
				Object value = jsonArray.get(i);
				if (value instanceof JSONObject) {
					value = json2Map((JSONObject) value);
				} else if (value instanceof JSONArray) {
					value = json2List((JSONArray) value);
				}
				resultList.add(value);
			}
			return resultList;
		}

		/**
		 * 校验空值并转换
		 * 
		 * @param value
		 * @return
		 */
		public static <T> T validateValue(Object value) {
			try {
				String valueType = value.getClass().getName();
				switch (valueType) {
				case TYPE_LANG_STRING:
					return (T) (value == null || value.toString().equals("") ? ""
							: value);
				case TYPE_LANG_INTEGER:
					return (T) (value == null || value.toString().equals("") ? 0
							: value);
				case TYPE_LANG_BIG_DECIMAL:
					return (T) (value == null || value.toString().equals("") ? 0
							: value);
				case TYPE_LANG_DOUBLE:
					return (T) (value == null || value.toString().equals("") ? 0
							: value);
				}
				return null;
			} catch (Exception ex) {
				log.error("validateValue:" ,ex);
				return null;
			}
		}
		
		
		public static Object transformClass(Object value){
			try {
				String valueType = value.getClass().getName();
				switch (valueType) {
				case TYPE_LANG_STRING:
					return value;
				case TYPE_LANG_INTEGER:
					return value;
				case TYPE_LANG_BIG_DECIMAL:
					return value;
				case TYPE_LANG_DOUBLE:
					return value;
				}
				return null;
			} catch (Exception ex) {
				log.error("validateValue:" + ex.toString());
				return null;
			}
			
		}

		/**
		 * 对象转json
		 * 
		 * @param obj
		 * @return
		 */
		public static String formatObjectToJson(Object obj) {
			try {
				JSONObject json = JSONObject.fromObject(obj);
				return json.toString();
			} catch (Exception ex) {
				log.error("");
				return null;
			}
		}

		/**
		 * getuuid
		 * 
		 * @return
		 */
		public final static String getUUID() {
			return java.util.UUID.randomUUID().toString();
		}

		/**
		 * double保留小数
		 * 
		 * @param value
		 *            double原值
		 * @param roundNum
		 *            小数位数
		 * @return
		 */
		public final static double doubleMathRound(double value, int roundNum) {
			try {
				BigDecimal b = new BigDecimal(value);
				return b.setScale(roundNum, BigDecimal.ROUND_UP).doubleValue();
			} catch (Exception ex) {
				log.error("doubleMathRound:" ,ex);
				return -1;
			}
		}
	}

	/**
	 * class for validate (表单数据校验)
	 * 
	 * @author Chaos
	 * 
	 */
	public class Validate {

		private String formId = null;
		private Map dataMap = null;
		private JSONArray jsonArray;
		private ModelAction modelAction = null;
		private ModelService modelService = (ModelService) SpringContextUtil
				.getBean("modelService");

		/**
		 * 构造函数
		 * 
		 * @param formId
		 * @param dataMap
		 */
		public Validate(String formId, Map dataMap, ModelAction modelAction) {
			this.formId = formId;
			this.dataMap = dataMap;
			this.modelAction = modelAction;

			// 筛选所需要的表单map
			jsonArray = JSONArray.fromObject(dataMap.get(formId));
		}

		/**
		 * 抛出提示信息
		 * 
		 * @param msg
		 * @return
		 */
		public String pushErrorMessage(String msg) {
			return modelAction.alertParentInfo(CommMethod.getText(msg));
		}

		/**
		 * 抛出提示信息 (支持占位符)
		 * 
		 * @param msg
		 * @param param
		 * @return
		 */
		public String pushErrorMessage(String msg, String... param) {
			return modelAction.alertParentInfo(CommMethod.getText(msg, param));
		}

		/**
		 * 唯一值校验
		 * 
		 * @param colKeys
		 *            (参与校验的字段，允许多个)
		 * @param withoutSelf
		 *            是否排除自己 (默认校验字段为ID)
		 * @return
		 */
		public Boolean isUnique(List<String> colKeys, Boolean withoutSelf) {
			try {
				// 获取表名
				String tableName = jsonArray.getJSONObject(0).get("tableName")
						.toString();
				String templeStr = String.format("SELECT * FROM %s WHERE 1=1 ",
						tableName);

				Integer len = jsonArray.size();
				List<Object> paramObject = new ArrayList();
				String paramStr = null;
				for (int i = 0; i < len; i++) {
					paramObject = new ArrayList();
					paramStr = "";
					for (String str : colKeys) {
						paramStr += " AND " + str + "=?";
						paramObject.add(jsonArray.getJSONObject(i).get(str));
					}
					if (withoutSelf) {
						paramStr += " AND ID<>?";
						paramObject.add(jsonArray.getJSONObject(i).get("ID"));
					}
					if (modelService.listDataSql(templeStr + paramStr,
							paramObject.toArray()).size() > 0) {
						return false;
					}
				}

				return true;
			} catch (Exception ex) {
				log.error("isUnique:" ,ex);
				return false;
			}
		}

		/**
		 * 空值校验
		 * 
		 * @param colKey
		 *            字段名称
		 * @return
		 */
		public Boolean isEmpty(String colKey) {
			try {
				Object obj = null;
				Integer len = jsonArray.size();
				for (int i = 0; i < len; i++) {
					obj = jsonArray.getJSONObject(i).get(colKey);
					if (obj == null || StringUtils.isEmpty(obj.toString())) {
						return true;
					}
				}

				return false;
			} catch (Exception ex) {
				log.error("isEmpty:" ,ex);
				return false;
			}
		}

		/**
		 * 空值校验(批量校验)
		 * 
		 * @param colKeyList
		 *            字段名称
		 * @return
		 */
		public String isEmpty(List<String> colKeyList) {
			try {
				JSONObject jsonObject = null;
				Object obj = null;
				Integer len = jsonArray.size();

				for (int i = 0; i < len; i++) {
					jsonObject = jsonArray.getJSONObject(i);
					for (String str : colKeyList) {
						obj = jsonObject.get(str);
						if (obj == null || StringUtils.isEmpty(obj.toString())) {
							return str;
						}
					}
				}

				return "";
			} catch (Exception ex) {
				log.error("isEmpty:" ,ex);
				return "validate error";
			}
		}

		/**
		 * 数值校验
		 * 
		 * @param colKey
		 * @return
		 */
		public Boolean isNumber(String colKey) {
			try {
				Object obj = null;
				Integer len = jsonArray.size();
				for (int i = 0; i < len; i++) {
					obj = jsonArray.getJSONObject(i).get(colKey);
					if (!StringUtils.isNumeric(obj.toString())) {
						return false;
					}
				}

				return true;
			} catch (Exception ex) {
				log.error("isNumber:" ,ex);
				return false;
			}
		}

		/**
		 * 时间大小校验 (校验两个时间是否满足大小关系)
		 * 
		 * @param highColKey
		 *            值大 的时间字段
		 * @param lowColKey
		 *            值小的时间字段
		 * @param withEqual
		 *            是否包含等于
		 * @return
		 */
		public Boolean timeSize(String highColKey, String lowColKey,
				Boolean withEqual) {
			try {
				Object highTime = null;
				Object lowTime = null;
				Boolean varbool = true;
				Integer len = jsonArray.size();
				for (int i = 0; i < len; i++) {
					highTime = jsonArray.getJSONObject(i).get(highColKey);
					lowTime = jsonArray.getJSONObject(i).get(lowColKey);
					highTime = Common.convertJsonToDate(highTime);
					lowTime = Common.convertJsonToDate(lowTime);
					if (withEqual) {
						varbool = ((Date) highTime).getTime() >= ((Date) lowTime)
								.getTime();
					} else {
						varbool = ((Date) highTime).getTime() > ((Date) lowTime)
								.getTime();
					}
					if (!varbool) {
						return varbool;
					}
				}

				return varbool;
			} catch (Exception ex) {
				log.error("timeSize:" ,ex);
				return false;
			}
		}
	}

	/**
	 * class for dataOperation
	 * 
	 * @author Chaos
	 * 
	 */
	public static class DbOperation {
		/**
		 * class for Reference (针对主从表操作)(暂时只支持两级关系)
		 * 
		 * @author Chaos
		 * 
		 */
		public static class Reference {

			/**
			 * 新增 参数无dataMap
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String insert(String parentFormId,
					String childFormId, ModelAction modelAction,
					ModelService modelService) {
				try {
					// 获取Request对象
					HttpServletRequest request = modelAction.getRequest();
					// 获取数据map
					Map dataMap = modelService.getAddComm(request,
							modelAction.getCurrUser(), modelAction);
					// 执行主表操作
					String msg = CommonMethod.Common.doOperation(parentFormId,
							dataMap, modelAction, modelService,
							OperationType.insert);
					// 执行子表操作
					if (StringUtils.isEmpty(msg)) {
						msg = CommonMethod.Common.doOperation(childFormId,
								dataMap, modelAction, modelService,
								OperationType.insert);
					}
					return msg;
				} catch (Exception ex) {
					log.error("insert:" ,ex);
					return modelAction.getText("执行异常");
				}
			}

			/**
			 * 新增 参数有dataMap
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String insert(String parentFormId,
					String childFormId, Map dataMap, ModelAction modelAction,
					ModelService modelService) {
				try {
					// 执行主表操作
					String msg = CommonMethod.Common.doOperation(parentFormId,
							dataMap, modelAction, modelService,
							OperationType.insert);
					// 执行子表操作
					if (StringUtils.isEmpty(msg)) {
						msg = CommonMethod.Common.doOperation(childFormId,
								dataMap, modelAction, modelService,
								OperationType.insert);
					}
					return msg;
				} catch (Exception ex) {
					log.error("insert:" ,ex);
					return modelAction.getText("执行异常");
				}
			}

			/**
			 * 修改 参数无dataMap
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String update(String parentFormId,
					String childFormId, ModelAction modelAction,
					ModelService modelService) {
				try {
					// 获取Request对象
					HttpServletRequest request = modelAction.getRequest();
					// 获取数据map
					Smap smapTemp = modelAction.getParaMapObj();
					smapTemp.initParam();
					Map dataMap = modelService.getEditComm(request,
							CommMethod.getSessionUser(), smapTemp, modelAction);
					// 执行主表操作
					String msg = CommonMethod.Common.doOperation(parentFormId,
							dataMap, modelAction, modelService,
							OperationType.update);
					// 执行子表操作
					if (StringUtils.isEmpty(msg)) {
						msg = CommonMethod.Common.doOperation(childFormId,
								dataMap, modelAction, modelService,
								OperationType.update);
					}
					return msg;
				} catch (Exception ex) {
					log.error("update:" ,ex);
					return modelAction.getText("执行异常");
				}
			}

			/**
			 * 修改 参数有dataMap
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String update(String parentFormId,
					String childFormId, Map dataMap, ModelAction modelAction,
					ModelService modelService) {
				try {
					// 执行主表操作
					String msg = CommonMethod.Common.doOperation(parentFormId,
							dataMap, modelAction, modelService,
							OperationType.update);
					// 执行子表操作
					if (StringUtils.isEmpty(msg)) {
						msg = CommonMethod.Common.doOperation(childFormId,
								dataMap, modelAction, modelService,
								OperationType.update);
					}
					return msg;
				} catch (Exception ex) {
					log.error("update:" ,ex);
					return modelAction.getText("执行异常");
				}
			}

			/**
			 * 修改(主表修改，子表新增) 参数有dataMap
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String updateByChildInsert(String parentFormId,
					String childFormId, Map dataMap, ModelAction modelAction,
					ModelService modelService, List referenceKeys) {
				try {
					dataMap.put(TABLE_REFERENCE_KEYS, referenceKeys);// 放入主从表关联字段，删除用
					// 执行主表操作
					String msg = CommonMethod.Common.doOperation(parentFormId,
							dataMap, modelAction, modelService,
							OperationType.update);
					// 执行子表操作
					if (StringUtils.isEmpty(msg)) {
						msg = CommonMethod.Common.doOperation(childFormId,
								dataMap, modelAction, modelService,
								OperationType.delete);
						if (StringUtils.isEmpty(msg)) {
							msg = CommonMethod.Common.doOperation(childFormId,
									dataMap, modelAction, modelService,
									OperationType.insert);
						}
					}
					return msg;
				} catch (Exception ex) {
					log.error("update:" ,ex);
					return modelAction.getText("执行异常");
				}
			}

			/**
			 * 修改(主表修改，子表新增) 参数无dataMap
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String updateByChildInsert(String parentFormId,
					String childFormId, ModelAction modelAction,
					ModelService modelService, List referenceKeys) {
				try {
					// 获取Request对象
					HttpServletRequest request = modelAction.getRequest();
					// 获取数据map
					Smap smapTemp = modelAction.getParaMapObj();
					smapTemp.initParam();
					Map dataMap = modelService.getEditComm(request,
							CommMethod.getSessionUser(), smapTemp, modelAction);
					dataMap.put(TABLE_REFERENCE_KEYS, referenceKeys);// 放入主从表关联字段，删除用
					// 执行主表操作
					String msg = CommonMethod.Common.doOperation(parentFormId,
							dataMap, modelAction, modelService,
							OperationType.update);
					// 执行子表操作
					if (StringUtils.isEmpty(msg)) {
						msg = CommonMethod.Common.doOperation(childFormId,
								dataMap, modelAction, modelService,
								OperationType.delete);
						if (StringUtils.isEmpty(msg)) {
							msg = CommonMethod.Common.doOperation(childFormId,
									dataMap, modelAction, modelService,
									OperationType.insert);
						}
					}
					return msg;
				} catch (Exception ex) {
					log.error("update:" ,ex);
					return modelAction.getText("执行异常");
				}
			}
			
			//-------------------------------------------------------------- for multi database  start
			
			/**
			 * 新增 参数无dataMap
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String insert(String parentFormId,
					String childFormId, ModelAction modelAction,
					ModelService modelService,Enums.dataBaseType dbType) {
				try {
					// 获取Request对象
					HttpServletRequest request = modelAction.getRequest();
					// 获取数据map
					Map dataMap = modelService.getAddComm(request,
							modelAction.getCurrUser(), modelAction);
					// 执行主表操作
					String msg = CommonMethod.Common.doOperation(parentFormId,
							dataMap, modelAction, modelService,
							OperationType.insert,dbType);
					// 执行子表操作
					if (StringUtils.isEmpty(msg)) {
						msg = CommonMethod.Common.doOperation(childFormId,
								dataMap, modelAction, modelService,
								OperationType.insert,dbType);
					}
					return msg;
				} catch (Exception ex) {
					log.error("insert:" ,ex);
					return modelAction.getText("执行异常");
				}
			}

			/**
			 * 新增 参数有dataMap
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String insert(String parentFormId,
					String childFormId, Map dataMap, ModelAction modelAction,
					ModelService modelService,Enums.dataBaseType dbType) {
				try {
					// 执行主表操作
					String msg = CommonMethod.Common.doOperation(parentFormId,
							dataMap, modelAction, modelService,
							OperationType.insert,dbType);
					// 执行子表操作
					if (StringUtils.isEmpty(msg)) {
						msg = CommonMethod.Common.doOperation(childFormId,
								dataMap, modelAction, modelService,
								OperationType.insert,dbType);
					}
					return msg;
				} catch (Exception ex) {
					log.error("insert:" ,ex);
					return modelAction.getText("执行异常");
				}
			}

			/**
			 * 修改 参数无dataMap
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String update(String parentFormId,
					String childFormId, ModelAction modelAction,
					ModelService modelService,Enums.dataBaseType dbType) {
				try {
					// 获取Request对象
					HttpServletRequest request = modelAction.getRequest();
					// 获取数据map
					Smap smapTemp = modelAction.getParaMapObj();
					smapTemp.initParam();
					Map dataMap = modelService.getEditComm(request,
							CommMethod.getSessionUser(), smapTemp, modelAction);
					// 执行主表操作
					String msg = CommonMethod.Common.doOperation(parentFormId,
							dataMap, modelAction, modelService,
							OperationType.update,dbType);
					// 执行子表操作
					if (StringUtils.isEmpty(msg)) {
						msg = CommonMethod.Common.doOperation(childFormId,
								dataMap, modelAction, modelService,
								OperationType.update,dbType);
					}
					return msg;
				} catch (Exception ex) {
					log.error("update:" ,ex);
					return modelAction.getText("执行异常");
				}
			}

			/**
			 * 修改 参数有dataMap
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String update(String parentFormId,
					String childFormId, Map dataMap, ModelAction modelAction,
					ModelService modelService,Enums.dataBaseType dbType) {
				try {
					// 执行主表操作
					String msg = CommonMethod.Common.doOperation(parentFormId,
							dataMap, modelAction, modelService,
							OperationType.update,dbType);
					// 执行子表操作
					if (StringUtils.isEmpty(msg)) {
						msg = CommonMethod.Common.doOperation(childFormId,
								dataMap, modelAction, modelService,
								OperationType.update,dbType);
					}
					return msg;
				} catch (Exception ex) {
					log.error("update:" ,ex);
					return modelAction.getText("执行异常");
				}
			}

			/**
			 * 修改(主表修改，子表新增) 参数有dataMap
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String updateByChildInsert(String parentFormId,
					String childFormId, Map dataMap, ModelAction modelAction,
					ModelService modelService, List referenceKeys,Enums.dataBaseType dbType) {
				try {
					dataMap.put(TABLE_REFERENCE_KEYS, referenceKeys);// 放入主从表关联字段，删除用
					// 执行主表操作
					String msg = CommonMethod.Common.doOperation(parentFormId,
							dataMap, modelAction, modelService,
							OperationType.update,dbType);
					// 执行子表操作
					if (StringUtils.isEmpty(msg)) {
						msg = CommonMethod.Common.doOperation(childFormId,
								dataMap, modelAction, modelService,
								OperationType.delete,dbType);
						if (StringUtils.isEmpty(msg)) {
							msg = CommonMethod.Common.doOperation(childFormId,
									dataMap, modelAction, modelService,
									OperationType.insert,dbType);
						}
					}
					return msg;
				} catch (Exception ex) {
					log.error("update:" ,ex);
					return modelAction.getText("执行异常");
				}
			}

			/**
			 * 修改(主表修改，子表新增) 参数无dataMap
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String updateByChildInsert(String parentFormId,
					String childFormId, ModelAction modelAction,
					ModelService modelService, List referenceKeys,Enums.dataBaseType dbType) {
				try {
					// 获取Request对象
					HttpServletRequest request = modelAction.getRequest();
					// 获取数据map
					Smap smapTemp = modelAction.getParaMapObj();
					smapTemp.initParam();
					Map dataMap = modelService.getEditComm(request,
							CommMethod.getSessionUser(), smapTemp, modelAction);
					dataMap.put(TABLE_REFERENCE_KEYS, referenceKeys);// 放入主从表关联字段，删除用
					// 执行主表操作
					String msg = CommonMethod.Common.doOperation(parentFormId,
							dataMap, modelAction, modelService,
							OperationType.update,dbType);
					// 执行子表操作
					if (StringUtils.isEmpty(msg)) {
						msg = CommonMethod.Common.doOperation(childFormId,
								dataMap, modelAction, modelService,
								OperationType.delete,dbType);
						if (StringUtils.isEmpty(msg)) {
							msg = CommonMethod.Common.doOperation(childFormId,
									dataMap, modelAction, modelService,
									OperationType.insert,dbType);
						}
					}
					return msg;
				} catch (Exception ex) {
					log.error("update:" ,ex);
					return modelAction.getText("执行异常");
				}
			}
			
			//-------------------------------------------------------------- end
		}

		/**
		 * class for single (针对单表操作)
		 * 
		 * @author Chaos
		 * 
		 */
		public static class Single {

			/**
			 * 新增
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String insert(String formId, ModelAction modelAction,
					ModelService modelService) {
				try {
					// 获取Request对象
					HttpServletRequest request = modelAction.getRequest();
					// 获取数据map
					Map dataMap = modelService.getAddComm(request,
							modelAction.getCurrUser(), modelAction);
					return CommonMethod.Common.doOperation(formId, dataMap,
							modelAction, modelService, OperationType.insert);
				} catch (Exception ex) {
					log.error("Insert:" ,ex);
					return modelAction.getText("执行异常");
				}
			}

			/**
			 * 新增
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String insert(String formId, Map dataMap,
					ModelAction modelAction, ModelService modelService) {
				try {
					return CommonMethod.Common.doOperation(formId, dataMap,
							modelAction, modelService, OperationType.insert);
				} catch (Exception ex) {
					log.error("Insert:" ,ex);
					return modelAction.getText("执行异常");
				}
			}

			/**
			 * 修改
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String update(String formId, ModelAction modelAction,
					ModelService modelService) {
				try {
					// 获取Request对象
					HttpServletRequest request = modelAction.getRequest();
					// 获取数据map
					Map dataMap = modelService.getAddComm(request,
							modelAction.getCurrUser(), modelAction);
					return CommonMethod.Common.doOperation(formId, dataMap,
							modelAction, modelService, OperationType.update);
				} catch (Exception ex) {
					log.error("Insert:" ,ex);
					return modelAction.getText("执行异常");
				}
			}

			/**
			 * 修改
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String update(String formId, Map dataMap,
					ModelAction modelAction, ModelService modelService) {
				try {
					return CommonMethod.Common.doOperation(formId, dataMap,
							modelAction, modelService, OperationType.update);
				} catch (Exception ex) {
					log.error("Insert:" ,ex);
					return modelAction.getText("执行异常");
				}
			}
			
			//------------------------------------------------------ for multi database   start
			
			/**
			 * 新增
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String insert(String formId, ModelAction modelAction,
					ModelService modelService,Enums.dataBaseType dbType) {
				try {
					// 获取Request对象
					HttpServletRequest request = modelAction.getRequest();
					// 获取数据map
					Map dataMap = modelService.getAddComm(request,
							modelAction.getCurrUser(), modelAction);
					return CommonMethod.Common.doOperation(formId, dataMap,
							modelAction, modelService, OperationType.insert,dbType);
				} catch (Exception ex) {
					log.error("Insert:" ,ex);
					return modelAction.getText("执行异常");
				}
			}

			/**
			 * 新增
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String insert(String formId, Map dataMap,
					ModelAction modelAction, ModelService modelService,Enums.dataBaseType dbType) {
				try {
					return CommonMethod.Common.doOperation(formId, dataMap,
							modelAction, modelService, OperationType.insert,dbType);
				} catch (Exception ex) {
					log.error("Insert:" ,ex);
					return modelAction.getText("执行异常");
				}
			}

			/**
			 * 修改
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String update(String formId, ModelAction modelAction,
					ModelService modelService,Enums.dataBaseType dbType) {
				try {
					// 获取Request对象
					HttpServletRequest request = modelAction.getRequest();
					// 获取数据map
					Map dataMap = modelService.getAddComm(request,
							modelAction.getCurrUser(), modelAction);
					return CommonMethod.Common.doOperation(formId, dataMap,
							modelAction, modelService, OperationType.update,dbType);
				} catch (Exception ex) {
					log.error("Insert:" ,ex);
					return modelAction.getText("执行异常");
				}
			}

			/**
			 * 修改
			 * 
			 * @param formId
			 * @param modelAction
			 * @param modelService
			 * @return
			 */
			public static String update(String formId, Map dataMap,
					ModelAction modelAction, ModelService modelService,Enums.dataBaseType dbType) {
				try {
					return CommonMethod.Common.doOperation(formId, dataMap,
							modelAction, modelService, OperationType.update,dbType);
				} catch (Exception ex) {
					log.error("Insert:" ,ex);
					return modelAction.getText("执行异常");
				}
			}
			
			
			//------------------------------------------------------ end
		}
	}

	/**
	 * 枚举集合
	 * 
	 * @author Chaos
	 * 
	 */
	public static class Enums {

		/**
		 * 添加关联类型
		 * 
		 * @author Chaos
		 * 
		 */
		public enum conditionReference {
			equal, less, lessEqual, greater, greaterEqual, like, leftLike, rightLike, in, notIn, custom
		}

		/**
		 * 条件类型
		 * 
		 * @author Chaos
		 * 
		 */
		public enum conditionType {
			varchar, number, date
		}

		/**
		 * 数据库类型
		 * 
		 * @author Chaos
		 * 
		 */
		public enum dataBaseType {
			base, oralce, pg
		}
	}

	/**
	 * 数据结构体类
	 * 
	 * @author Chaos
	 * 
	 */
	public static class DataStruct {

		/**
		 * 查询条件结构
		 * 
		 * @author Chaos
		 * 
		 */
		public class Condition {

			public String tableFlag = null;// 字段所属表标识 如：A、B
			public Enums.conditionReference reference = Enums.conditionReference.equal;// 关联类型
			public Enums.conditionType type = Enums.conditionType.varchar;// 条件类型
			public String colName = null;// 字段名称
			public Object colValue = null;// 字段值
			public String customValue = null;// 自定义语句

			/**
			 * 条件对象
			 * 
			 * @param tableFlag
			 *            表标识
			 * @param reference
			 *            关联关系
			 * @param type
			 *            数据类型
			 * @param colName
			 *            字段名
			 * @param colValue
			 *            字段值
			 */
			public Condition(String tableFlag,
					Enums.conditionReference reference,
					Enums.conditionType type, String colName, Object colValue) {
				this.tableFlag = tableFlag;
				this.reference = reference;
				this.type = type;
				this.colName = colName;
				this.colValue = colValue;
			}

            /**
			 * 条件对象
			 * 
			 * @param reference
			 *            关联关系
			 * @param type
			 *            数据类型
			 * @param colName
			 *            字段名
			 * @param colValue
			 *            字段值
			 */
			public Condition(Enums.conditionReference reference,
					Enums.conditionType type, String colName, Object colValue) {
				this.reference = reference;
				this.type = type;
				this.colName = colName;
				this.colValue = colValue;
			}

            /**
			 * 条件对象
			 * 
			 * @param colValue
			 *            表标识
			 * @param reference
			 *            关联关系
			 * @param colName
			 *            字段名
			 * @param colValue
			 *            字段值
			 */
			public Condition(String tableFlag,
					Enums.conditionReference reference, String colName,
					Object colValue) {
				this.tableFlag = tableFlag;
				this.reference = reference;
				this.colName = colName;
				this.colValue = colValue;
			}

            /**
			 * 用于自定义
			 * 
			 * @param reference
			 *            关联关系
			 * @param colName
			 *            字段名
			 * @param colValue
			 *            字段值
			 */
			public Condition(Enums.conditionReference reference,
					String colName, Object colValue) {
				this.reference = reference;
				this.colName = colName;
				this.colValue = colValue;
			}

            /**
			 * 用于自定义
			 * 
			 * @param reference
			 *            关联关系
			 * @param customerValue
			 *            自定义条件
			 */
			public Condition(Enums.conditionReference reference,
					String customValue) {
				this.reference = reference;
				this.customValue = customValue;
			}

            /**
			 * 条件对象
			 * 
			 * @param tableFlag
			 *            表标识
			 * @param colName
			 *            字段名
			 * @param colValue
			 *            字段值
			 */
			public Condition(String tableFlag, String colName, Object colValue) {
				this.tableFlag = tableFlag;
				this.colName = colName;
				this.colValue = colValue;
			}

            /**
			 * 条件对象
			 * 
			 * @param colName
			 *            字段名
			 * @param colValue
			 *            字段值
			 */
			public Condition(String colName, Object colValue) {
				this.colName = colName;
				this.colValue = colValue;
			}
        }

		/**
		 * 分页对象
		 * 
		 * @author Chaos
		 * 
		 */
		public class PageImpl {
			public PaginationImpl impl = null;
			public String orderBy = null;

			public PageImpl(PaginationImpl impl, String orderBy) {
				this.impl = impl;
				this.orderBy = orderBy;
			}
		}
	}
}
