package com.more.mes.smt.app.http;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
//import com.more.mes.smt.app.http.oracle.GetListInfo;
import com.opensymphony.xwork2.util.ResolverUtil.IsA;

import examples.mail;
import examples.newsgroups;

public class getInformations extends InterfaceLog implements IhttpServiceJosn {

	private ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");

	String judge;

	@SuppressWarnings({ "unchecked", "unused", "rawtypes" })
	@Override
	public String exeFunc(HttpCoreService service) {
		Map<String, Object> resmap = new HashMap<String, Object>();
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		String abc = null;
		// GetListInfo getListInfo = new GetListInfo();
		try {
			// String login_name = service.getParamTo().get("LOGIN_NAME");

			String n_emp_no = service.getParamTo().get("M_EMP_NO");
			// String n_dept_id = service.getParamTo().get("M_DEPT_ID");
			String tam_menu_id = service.getParamTo().get("TAM_MENU_ID");
			String[] nType = { "M_EMP_NO", "M_DEPT_ID", "M_AREA_CODE",
					"M_TEST_STEP", "M_WH_CODE", "M_AREA_SN" };

			/**
			 * 返回值：0——此模块ID无法查询到数据；1——返回模块ID查询到的数据
			 */
			int res = 0;
			List<String> listType = new ArrayList<String>();
			/*
			 * String Sql= "SELECT * FROM SY_USER A "+
			 * "LEFT JOIN T_APP_MOUDLE B ON B.DEPT_ID=A.DEPT_ID "+
			 * " WHERE A.LOGIN_NAME=? and  A.DEPT_ID=? and B.TAM_MENU_ID=?";
			 */
			/*
			 * String Sql = " SELECT * FROM  sy_data_auth A " +
			 * " LEFT JOIN sy_USER C ON C.ID=A.USER_ID " +
			 * " LEFT JOIN T_APP_MOUDLE B ON B.DEPT_ID=A.DEPT_ID " +
			 * " WHERE C.LOGIN_NAME=? and B.TAM_MENU_ID=? "; res =
			 * modelService.countSql(Sql, new Object[] {n_emp_no, tam_menu_id});
			 */
			res = 1;
			List<Map> date = new ArrayList<>();
			if (res != 0) {

				List<Map> listTitle = null;

				// 获取用户的功能细项
				listTitle = selectLustTile(n_emp_no, tam_menu_id);

				List<Map<String, Object>> listType1 = new ArrayList<>();

				String SqlType = "SELECT distinct TAS_SHOW_TYPE,TAM_SEQ,TAS_SEQ,a.ID FROM T_APP_SHOWMANAGE A "
						+ "LEFT JOIN T_APP_MOUDLE B ON A.TAS_MOUDLE_ID  = B.ID "
						+ " WHERE A.TAS_MENU_ID=? order by TAM_SEQ,TAS_SEQ";

				// 判断该菜单下的功能模块
				listType1 = modelService.listDataSql(SqlType,
						new Object[] { tam_menu_id });
				boolean checkDeviceCollectCode = false;
				boolean checkDeviceCollectCode2 = false;
				boolean checkDeviceCollectCode3 = false;
				boolean checkDeviceCollectCode4 = false;
				boolean checkDeviceCollectCode5 = false;
				boolean checkDeviceCollectCode6 = false;
				boolean checkDeviceCollectCode7 = false;
				int w = 0;
				for (int f = 0; f < listTitle.size(); f++) {
					if (listTitle.get(f).get("TAS_SHOW_TYPE").equals("1")) {


						List<Map> listContent = new ArrayList<>();
						List<Map> listContent1 = new ArrayList<>();
						
							
								HashMap<String, Object> resultHashMap = new HashMap<String, Object>();
								Map<String, String> map = (Map<String, String>) listTitle
										.get(f);

								int a = -1;
								if (null != date && date.size() > 0) {
									for (int j = 0; j < date.size(); j++) {
										if (map.get("TAM_MOUDLE_NAME")
												.equals(date.get(j)
														.get("title")
														.toString())) {
											a = j;
											break;
										}
									}
								}

								if (a != -1) {
									listContent1 = (List<Map>) date.get(a)
											.get("data");
								}
								resultHashMap.put("title",
										map.get("TAM_MOUDLE_NAME"));
								// resultHashMap.put("title",map.get("TAM_MOUDLE_NAME")
								// + "-" + map.get("TAS_FUN_NAME"));
								if (map.get("ID") != null) {
									String dateId = map.get("ID");
									// 获取功能细项、图片ID、数据内容
									String sqlContent = " select t1.TAS_FUN_NAME,t5.PIC_NAME,t1.TAS_PIC_ID, "
											+ " t1.TAS_DATA_CONTENT,t1.TAS_FUNCTION_LINK "
											+ " from T_APP_SHOWMANAGE t1 "
											+ " inner join T_APP_MOUDLE t3 on t3.id = t1.TAs_MOUDLE_ID"
											+ " LEFT JOIN SY_ADMIN_TARGET_PIC t5 ON t5.ID = t1.TAS_PIC_ID "

											+ " where t1.TAS_SHOW_TYPE =? "
											+ " and TAM_MENU_ID = ? "
											+ " and t1.id = ? "
											+ " order by t1.TAS_SEQ ";

									listContent = modelService.listDataSql(
											sqlContent,
											new Object[] {
													"1",
													tam_menu_id,
													listTitle.get(f).get(
															"ID") });//
									for (int i1 = 0; i1 < listContent
											.size(); i1++) {
										String competitive = listContent
												.get(i1)
												.get("TAS_DATA_CONTENT")
												.toString();
										String src;

										String a3 = CommMethod
												.toJsonObj(competitive)
												.get("oracle").toString();
										if (StringUtils.isBlank(a3)) {
											a3 = CommMethod
													.toJsonObj(competitive)
													.get("commql")
													.toString();
										}
										String selSql = null;
										String str = a3;

										String s = str.replaceAll("\\{\"",
												"{'");
										String strSql;

										ArrayList<String> word = new ArrayList<String>();
										int m = 0, n = 0;
										int count = 0;

										String labelwq;
										String tempSql;
										Map<String, Object> map3 = new HashMap<String, Object>();
										Map<String, Object> map4 = new HashMap<String, Object>();

										List<Map> list5 = this.getSelSql(
												a3, service, nType);

										// map4 = (Map<String,
										// Object>)selSqlMap.get(0);

										// / selSql =
										// (String)selSqlMap.get(0);

										if (StringUtils
												.isNotBlank(listContent
														.get(i1).get(
																"PIC_NAME"))) {
											src = listContent.get(i1)
													.get("PIC_NAME")
													.toString();
											listContent.get(i1)
													.put("PIC_NAME",
															"/plf/userPhoto/"
																	+ src);
										}
										/*
										 * List<Map> list5 = new
										 * ArrayList<>();
										 * 
										 * if (null != map4 && map4.size() >
										 * 0) { // list5= //
										 * modelService.listSql
										 * (selSql,null,map4,null,null);
										 * list5 =
										 * modelService.listSql(selSql,
										 * null, map4, null, null); } else {
										 * list5 =
										 * modelService.listDataSql(selSql);
										 * }
										 */
										if (null != list5
												&& list5.size() > 0) {
											for (Object key : list5.get(0)
													.keySet()) {

												a3 = String.valueOf(list5
														.get(0).get(key));
											}

										}
										listContent.get(i1).put(
												"TAS_DATA_CONTENT", a3);

									}
									List<Map> mapList = new ArrayList<>();
									if (a != -1) {

										for (int j = 0; j < listContent1
												.size(); j++) {
											mapList.add(listContent1.get(j));
											// listContent.add(listContent1.get(j));

										}
										mapList.add(listContent.get(0));
										listContent = mapList;
										listContent = this
												.delNull(listContent);
										resultHashMap.put("data",
												listContent);
									} else {
										listContent = this
												.delNull(listContent);
										resultHashMap.put("data",
												listContent);
									}

								}
								resultHashMap.put("Type",
										map.get("TAS_SHOW_TYPE"));
								if (a != -1) {
									date.remove(a);
									date.add(resultHashMap);
								} else {
									date.add(resultHashMap);
								}

							
						
					

					} else if (listTitle.get(f).get("TAS_SHOW_TYPE")
							.equals("2")) {
						

							List<Map> listContent = new ArrayList<>();
							// List date = new ArrayList<>();

							HashMap<String, Object> resultHashMap = new HashMap<String, Object>();
							Map<String, String> map = (Map<String, String>) listTitle
									.get(f);
							resultHashMap.put("title",
									map.get("TAM_MOUDLE_NAME") + "-"
											+ map.get("TAS_FUN_NAME"));
							if (map.get("ID") != null) {
								String dateId = map.get("ID");
								// 获取功能细项、图片ID、数据内容

								String sqlContent = " select t1.TAS_FUN_NAME, t1.TAS_DATA_CONTENT, t1.TAS_FUNCTION_LINK "
										+ " from T_APP_SHOWMANAGE t1 "
										+ " inner join T_APP_MOUDLE t3  on t3.id = t1.TAs_MOUDLE_ID "

										+ " where t1.TAS_SHOW_TYPE = ? "
										+ " and TAM_MENU_ID =? "
										+ " and t1.id = ? "
										+ " order by t1.TAS_SEQ ";

								List list = new ArrayList<>();
								listContent = modelService.listDataSql(
										sqlContent,
										new Object[] {
												"2",
												tam_menu_id,
												listTitle.get(f).get(
														"ID") });
								for (int i1 = 0; i1 < listContent
										.size(); i1++) {

									String competitive = listContent
											.get(i1)
											.get("TAS_DATA_CONTENT")
											.toString();
									String src;

									String a3 = CommMethod
											.toJsonObj(competitive)
											.get("oracle").toString();
									if (StringUtils.isBlank(a3)) {
										a3 = CommMethod
												.toJsonObj(competitive)
												.get("commql")
												.toString();
									}
									String selSql = null;
									String str = a3;

									String s = str.replaceAll("\\{\"",
											"{'");
									String strSql;

									ArrayList<String> word = new ArrayList<String>();
									int m = 0, n = 0;
									int count = 0;

									String labelwq;
									String tempSql;
									Map<String, Object> map3 = new HashMap<String, Object>();
									Map<String, Object> map4 = new HashMap<String, Object>();

									List<Map> list5 = this.getSelSql(
											a3, service, nType);

									// map4 = (Map<String,
									// Object>)selSqlMap.get(0);

									// selSql =
									// (String)selSqlMap.get(1);

									if (StringUtils
											.isNotBlank(listContent
													.get(i1).get(
															"PIC_NAME"))) {
										src = listContent.get(i1)
												.get("PIC_NAME")
												.toString();
										listContent.get(i1)
												.put("PIC_NAME",
														"/plf/userPhoto/"
																+ src);
									}
									/*
									 * List<Map> list5 = new
									 * ArrayList<>(); if (null != map4
									 * && map4.size() > 0) {
									 * 
									 * list5 =
									 * modelService.listSql(selSql,
									 * null, map4, null, null); } else {
									 * list5 =
									 * modelService.listDataSql(selSql);
									 * }
									 */
									Map map2 = null;
									int aa = 0;
									String mkey = null;
									String mkeys;

									Map<String, String> map31 = new HashMap<>();
									Map<String, Object> map41 = new HashMap<>();
									if (null != list5
											&& list5.size() > 0) {
										for (int j = 0; j < list5
												.size(); j++) {
											aa = 0;
											map2 = list5.get(j);
											int size = map2.size();
											int a = 0;
											map31 = new HashMap<>();
											for (Object key : map2
													.keySet()) {

												if (a == 0) {
													map31.put(
															"X_NAME",
															String.valueOf(map2
																	.get(key)));
												} else if (a == 1) {
													map31.put(
															"Y_NUMBER",
															String.valueOf(map2
																	.get(key)));
												} else if (a == 2) {
													map31.put(
															"Y_UNIT",
															String.valueOf(map2
																	.get(key)));
												}

												a++;

											}
											list.add(map31);
											aa = 0;

										}
									}

									list = this.delNull(list);
								}

								resultHashMap.put("data", list);
							}
							resultHashMap.put("Type",
									map.get("TAS_SHOW_TYPE"));
							if (StringUtils.isNotBlank(map
									.get("TAS_FUNCTION_LINK"))) {
								resultHashMap.put("TAS_FUNCTION_LINK",
										map.get("TAS_FUNCTION_LINK"));
							} else {
								resultHashMap.put("TAS_FUNCTION_LINK",
										"");
							}

							date.add(resultHashMap);
							
					} else if (listType1.get(f).get("TAS_SHOW_TYPE")
							.equals("3")) {
						
						List<Map> listContent = new ArrayList<>();

						HashMap<String, Object> resultHashMap = new HashMap<String, Object>();
						Map<String, String> map = (Map<String, String>) listTitle
								.get(f);
						resultHashMap.put("title",
								map.get("TAM_MOUDLE_NAME") + "-"
										+ map.get("TAS_FUN_NAME"));
						if (map.get("ID") != null) {
							String dateId = map.get("ID");

							String sqlContent = " select t1.TAS_DATA_CONTENT, t1.TAS_FUNCTION_LINK "
									+ "  from T_APP_SHOWMANAGE t1 "
									+ " inner join T_APP_MOUDLE t3 on t3.id = t1.TAs_MOUDLE_ID "

									+ " where t1.TAS_SHOW_TYPE = ? "
									+ " and TAM_MENU_ID = ? "
									+ " and t1.id =? "
									+ " order by t1.TAS_SEQ ";

							listContent = modelService.listDataSql(
									sqlContent,
									new Object[] {
											"3",
											tam_menu_id,
											listTitle.get(f).get(
													"ID") });
							for (int i1 = 0; i1 < listContent
									.size(); i1++) {

								String competitive = listContent
										.get(i1)
										.get("TAS_DATA_CONTENT")
										.toString();
								String src;
								String selSql = null;
								String a3 = CommMethod
										.toJsonObj(competitive)
										.get("oracle").toString();
								if (StringUtils.isBlank(a3)) {
									a3 = CommMethod
											.toJsonObj(competitive)
											.get("commql")
											.toString();
								}
								List list = new ArrayList<>();
								Map<String, Object> map3 = new HashMap<String, Object>();
								Map<String, Object> map4 = new HashMap<String, Object>();

								List<Map> list5 = this.getSelSql(
										a3, service, nType);
								/*
								 * map4 = (Map<String,
								 * Object>)selSqlMap.get(0);
								 * 
								 * selSql =
								 * (String)selSqlMap.get(1);
								 */
								if (StringUtils
										.isNotBlank(listContent
												.get(i1).get(
														"PIC_NAME"))) {
									src = listContent.get(i1)
											.get("PIC_NAME")
											.toString();
									listContent.get(i1)
											.put("PIC_NAME",
													"/plf/userPhoto/"
															+ src);
								}
								/*
								 * List<Map> list5 = new
								 * ArrayList<>(); if (null != map4
								 * && map4.size() > 0) { list5 =
								 * modelService.listSql(selSql,
								 * null, map4, null, null); } else {
								 * list5 =
								 * modelService.listDataSql(selSql);
								 * }
								 */
								List lists = new ArrayList<>();
								if (null != list5
										&& list5.size() > 0) {
									// 先用for 控制列表显示条数

									if (list5.size() > 10) {
										for (int j = 0; j < 11; j++) {
											lists.add(list5.get(j));
										}
									} else {
										lists = list5;
									}
								}

								lists = this.delNull(lists);
								resultHashMap.put("data", lists);

							}

						}
						resultHashMap.put("Type",
								map.get("TAS_SHOW_TYPE"));
						if (StringUtils.isNotBlank(map
								.get("TAS_FUNCTION_LINK"))) {
							resultHashMap.put("TAS_FUNCTION_LINK",
									map.get("TAS_FUNCTION_LINK"));
						} else {
							resultHashMap.put("TAS_FUNCTION_LINK",
									"");
						}
						resultHashMap.put("MINORITEMID",
								map.get("ID"));
						date.add(resultHashMap);
						
						
					} else if (listType1.get(f).get("TAS_SHOW_TYPE")
							.equals("4")) {
						

							List<Map> listContent = new ArrayList<>();
							// List date = new ArrayList<>();

							HashMap<String, Object> resultHashMap = new HashMap<String, Object>();
							Map<String, String> map = (Map<String, String>) listTitle
									.get(f);
							resultHashMap.put("title",
									map.get("TAM_MOUDLE_NAME") + "-"
											+ map.get("TAS_FUN_NAME"));
							if (map.get("ID") != null) {
								String dateId = map.get("ID");
								// 获取功能细项、图片ID、数据内容

								String sqlContent = " select t1.TAS_FUN_NAME, t1.TAS_DATA_CONTENT, t1.TAS_FUNCTION_LINK "
										+ " from T_APP_SHOWMANAGE t1 "
										+ " inner join T_APP_MOUDLE t3 on t3.id = t1.TAs_MOUDLE_ID "

										+ " where t1.TAS_SHOW_TYPE = ?"
										+ " and TAM_MENU_ID =?"
										+ " and t1.id = ? "
										+ " order by t1.TAS_SEQ ";

								List list = new ArrayList<>();
								listContent = modelService.listDataSql(
										sqlContent,
										new Object[] {
												"4",
												tam_menu_id,
												listTitle.get(f).get(
														"ID") });
								for (int i1 = 0; i1 < listContent
										.size(); i1++) {

									String competitive = listContent
											.get(i1)
											.get("TAS_DATA_CONTENT")
											.toString();
									String src;

									String a3 = CommMethod
											.toJsonObj(competitive)
											.get("oracle").toString();
									if (StringUtils.isBlank(a3)) {
										a3 = CommMethod
												.toJsonObj(competitive)
												.get("commql")
												.toString();
									}
									String selSql = null;
									String str = a3;

									String s = str.replaceAll("\\{\"",
											"{'");
									String strSql;

									ArrayList<String> word = new ArrayList<String>();
									int m = 0, n = 0;
									int count = 0;

									String labelwq;
									String tempSql;
									// Map<String, Object> map3 = new
									// HashMap<String, Object>();
									// Map<String, Object> map4 = new
									// HashMap<String, Object>();

									List<Map> list5 = this.getSelSql(
											a3, service, nType);

									/*
									 * map4 = (Map<String, Object>)
									 * selSqlMap .get(0);
									 * 
									 * selSql = (String)
									 * selSqlMap.get(1);
									 */
									if (StringUtils
											.isNotBlank(listContent
													.get(i1).get(
															"PIC_NAME"))) {
										src = listContent.get(i1)
												.get("PIC_NAME")
												.toString();
										listContent.get(i1)
												.put("PIC_NAME",
														"/plf/userPhoto/"
																+ src);
									}

									// = new ArrayList<>();
									/*
									 * if (null != map4 && map4.size() >
									 * 0) { // list5= //
									 * modelService.listSql
									 * (selSql,null,map4,null,null);
									 * list5 = modelService.listSql(
									 * selSql, null, map4, null, null);
									 * } else { list5 = modelService
									 * .listDataSql(selSql); }
									 */
									List list3 = new ArrayList<>();

									Map map2 = null;
									int aa = 0;
									String mkey = null;
									String mkeys;

									Map<String, String> map31 = new HashMap<>();
									Map<String, Object> map41 = new HashMap<>();
									// List list = new ArrayList<>();
									if (null != list5
											&& list5.size() > 0) {

										for (int j = 0; j < list5
												.size(); j++) {
											aa = 0;
											map2 = list5.get(j);
											int size = map2.size();
											int a = 0;
											map31 = new HashMap<>();
											for (Object key : map2
													.keySet()) {

												if (a == 0) {
													map31.put(
															"X_NAME",
															String.valueOf(map2
																	.get(key)));
												} else if (a == 1) {
													map31.put(
															"Y_NUMBER",
															String.valueOf(map2
																	.get(key)));
												} else if (a == 2) {
													map31.put(
															"Y_UNIT",
															String.valueOf(map2
																	.get(key)));
												}

												a++;

											}

											list.add(map31);
											aa = 0;

										}
									}
								}
								list = this.delNull(list);
								resultHashMap.put("data", list);
							}
							resultHashMap.put("Type",
									map.get("TAS_SHOW_TYPE"));
							if (StringUtils.isNotBlank(map
									.get("TAS_FUNCTION_LINK"))) {
								resultHashMap.put("TAS_FUNCTION_LINK",
										map.get("TAS_FUNCTION_LINK"));
							} else {
								resultHashMap.put("TAS_FUNCTION_LINK",
										"");
							}

							date.add(resultHashMap);
						
						
					} else if (listType1.get(f).get("TAS_SHOW_TYPE")
							.equals("5")) {
						

							List<Map> listContent = new ArrayList<>();
							// List date = new ArrayList<>();

							HashMap<String, Object> resultHashMap = new HashMap<String, Object>();
							Map<String, String> map = (Map<String, String>) listTitle
									.get(f);
							resultHashMap.put("title",
									map.get("TAM_MOUDLE_NAME") + "-"
											+ map.get("TAS_FUN_NAME"));
							if (map.get("ID") != null) {
								String dateId = map.get("ID");
								// 获取功能细项、图片ID、数据内容

								String sqlContent = " select t1.TAS_FUN_NAME, t1.TAS_DATA_CONTENT, t1.TAS_FUNCTION_LINK "
										+ " from T_APP_SHOWMANAGE t1 "
										+ " inner join T_APP_MOUDLE t3 on t3.id = t1.TAs_MOUDLE_ID "

										+ " where t1.TAS_SHOW_TYPE = ? "
										+ " and TAM_MENU_ID = ? "
										+ " and t1.id = ? "
										+ " order by t1.TAS_SEQ ";

								List list = new ArrayList<>();
								listContent = modelService.listDataSql(
										sqlContent,
										new Object[] {
												"5",
												tam_menu_id,
												listTitle.get(f).get(
														"ID") });
								for (int i1 = 0; i1 < listContent
										.size(); i1++) {

									String competitive = listContent
											.get(i1)
											.get("TAS_DATA_CONTENT")
											.toString();
									String src;

									String a3 = CommMethod
											.toJsonObj(competitive)
											.get("oracle").toString();
									if (StringUtils.isBlank(a3)) {
										a3 = CommMethod
												.toJsonObj(competitive)
												.get("commql")
												.toString();
									}
									String selSql = null;
									String str = a3;

									String s = str.replaceAll("\\{\"",
											"{'");
									String strSql;

									ArrayList<String> word = new ArrayList<String>();
									int m = 0, n = 0;
									int count = 0;

									String labelwq;
									String tempSql;
									Map<String, Object> map3 = new HashMap<String, Object>();
									Map<String, Object> map4 = new HashMap<String, Object>();

									List<Map> list5 = this.getSelSql(
											a3, service, nType);
									/*
									 * map4 = (Map<String, Object>)
									 * selSqlMap .get(0);
									 * 
									 * selSql = (String)
									 * selSqlMap.get(1);
									 */
									if (StringUtils
											.isNotBlank(listContent
													.get(i1).get(
															"PIC_NAME"))) {
										src = listContent.get(i1)
												.get("PIC_NAME")
												.toString();
										listContent.get(i1)
												.put("PIC_NAME",
														"/plf/userPhoto/"
																+ src);
									}

									// List<Map> list5 = new
									// ArrayList<>();
									/*
									 * if (null != map4 && map4.size() >
									 * 0) { // list5= //
									 * modelService.listSql
									 * (selSql,null,map4,null,null);
									 * list5 = modelService.listSql(
									 * selSql, null, map4, null, null);
									 * } else { list5 = modelService
									 * .listDataSql(selSql); }
									 */
									Map map2 = null;
									int aa = 0;
									String mkey = null;
									String mkeys;

									Map<String, String> map31 = new HashMap<>();
									Map<String, Object> map41 = new HashMap<>();
									// List list = new ArrayList<>();
									if (null != list5
											&& list5.size() > 0) {
										for (int j = 0; j < list5
												.size(); j++) {
											aa = 0;
											map2 = list5.get(j);
											int size = map2.size();
											int a = 0;
											map31 = new HashMap<>();
											for (Object key : map2
													.keySet()) {

												if (a == 0) {
													map31.put(
															"X_NAME",
															String.valueOf(map2
																	.get(key)));
												} else if (a == 1) {
													map31.put(
															"Y_NUMBER",
															String.valueOf(map2
																	.get(key)));
												} else if (a == 2) {
													map31.put(
															"Y_UNIT",
															String.valueOf(map2
																	.get(key)));
												}

												a++;

											}

											list.add(map31);
											aa = 0;

										}
									}

								}
								list = this.delNull(list);
								resultHashMap.put("data", list);
							}
							resultHashMap.put("Type",
									map.get("TAS_SHOW_TYPE"));
							if (StringUtils.isNotBlank(map
									.get("TAS_FUNCTION_LINK"))) {
								resultHashMap.put("TAS_FUNCTION_LINK",
										map.get("TAS_FUNCTION_LINK"));
							} else {
								resultHashMap.put("TAS_FUNCTION_LINK",
										"");
							}
							date.add(resultHashMap);
							
						
					} else if (listType1.get(f).get("TAS_SHOW_TYPE")
							.equals("6")) {
						

							List<Map> listContent = new ArrayList<>();
							// List date = new ArrayList<>();

							HashMap<String, Object> resultHashMap = new HashMap<String, Object>();
							Map<String, String> map = (Map<String, String>) listTitle
									.get(f);
							resultHashMap.put("title",
									map.get("TAM_MOUDLE_NAME") + "-"
											+ map.get("TAS_FUN_NAME"));
							if (map.get("ID") != null) {
								String dateId = map.get("ID");
								// 获取功能细项、图片ID、数据内容

								String sqlContent = " select t1.TAS_DATA_CONTENT "
										+ " from  T_APP_SHOWMANAGE t1  "
										+ " inner join T_APP_MOUDLE t3 "
										+ "  on t3.id = t1.TAs_MOUDLE_ID "
										+ "  where t1.TAS_SHOW_TYPE = ?  "
										+ " and TAM_MENU_ID =? "
										+ " and t1.id = ? "
										+ " order by  t1.TAS_SEQ ";

								List<Map> list2 = new ArrayList<>();
								List list = new ArrayList<>();
								listContent = modelService.listDataSql(
										sqlContent,
										new Object[] {
												"6",
												tam_menu_id,
												listTitle.get(f).get(
														"ID") });// ,listTitle.get(i).get("ID")

								for (int i1 = 0; i1 < listContent
										.size(); i1++) {

									String competitive = listContent
											.get(i1)
											.get("TAS_DATA_CONTENT")
											.toString();
									String src;

									String a3 = CommMethod
											.toJsonObj(competitive)
											.get("oracle").toString();
									if (StringUtils.isBlank(a3)) {
										a3 = CommMethod
												.toJsonObj(competitive)
												.get("commql")
												.toString();
									}
									String selSql = null;
									String str = a3;

									String s = str.replaceAll("\\{\"",
											"{'");
									String strSql;

									ArrayList<String> word = new ArrayList<String>();
									int m = 0, n = 0;
									int count = 0;

									String labelwq;
									String tempSql;
									Map<String, Object> map3 = new HashMap<String, Object>();
									Map<String, Object> map4 = new HashMap<String, Object>();

									List<Map> list5 = this.getSelSql(
											a3, service, nType);
									/*
									 * map4 = (Map<String, Object>)
									 * selSqlMap .get(0);
									 * 
									 * selSql = (String)
									 * selSqlMap.get(1);
									 */
									if (StringUtils
											.isNotBlank(listContent
													.get(i1).get(
															"PIC_NAME"))) {
										src = listContent.get(i1)
												.get("PIC_NAME")
												.toString();
										listContent.get(i1)
												.put("PIC_NAME",
														"/plf/userPhoto/"
																+ src);
									}

									// List<Map> list5 = new
									// ArrayList<>();
									/*
									 * if (null != map4 && map4.size() >
									 * 0) {
									 * 
									 * list5 = modelService.listSql(
									 * selSql, null, map4, null, null);
									 * } else { list5 = modelService
									 * .listDataSql(selSql); }
									 */
									List<Map> list51 = new ArrayList<Map>();
									list51 = modelService
											.listDataSql(a3);

									Map map2 = null;
									int aa = 0;
									String mkey = null;
									String mkeys;

									Map<String, String> map31 = new HashMap<>();
									Map<String, Object> map41 = new HashMap<>();
									Map<String, Object> map5 = new HashMap<>();
									// List list = new ArrayList<>();

									int count2 = 0;
									// int count1 = 0;
									int b = 1;
									int dCount = 1;
									List Datalist = new ArrayList();// 数据
									int tre = 0;
									List<Map> Datalist2 = new ArrayList<Map>();// 数据
									for (int j = 0; j < list51.size(); j++) {
										Datalist2 = new ArrayList<Map>();// 数据
										map2 = list51.get(j);
										String NOC = null;
										String DOLL = null;
										Map map7 = new HashMap();

										if (j == 0) {

											map3 = list51.get(0);
											for (Object key : map3
													.keySet()) {
												if (count2 == 0) {
												} else {
													tre++;
												}
												count2++;
											}

										}
										Map map6 = new HashMap();
										Map<String, Object> paraMap = new HashMap<String, Object>();

										int count1 = 0;
										count2 = 0;

										for (Object key : map2.keySet()) {
											if (count1 == 0) {
												NOC = key.toString();// 取国家对应的KEY

												String rNoc = map2.get(
														NOC).toString();// 具体国家名

												map6.put(
														"BAR_TITLE_NAME",
														rNoc);

											} else {
												Map<String, Object> whatMap = new HashMap<String, Object>();
												DOLL = key.toString();
												int dollCount = Integer
														.valueOf(String
																.valueOf(map2
																		.get(DOLL)));// 具体奖牌数
												whatMap.put(
														"BAR_VALUE",
														dollCount);

												whatMap.put("BAR_NAME",
														DOLL);
												Datalist2.add(whatMap);

											}
											count1++;
										}

										dCount++;
										map6.put("BAR_DATA_CONTENT",
												Datalist2);
										list2.add(map6);
									}

								}
								list2 = this.delNull(list2);
								resultHashMap.put("data", list2);
							}
							resultHashMap.put("Type",
									map.get("TAS_SHOW_TYPE"));
							if (StringUtils.isNotBlank(map
									.get("TAS_FUNCTION_LINK"))) {
								resultHashMap.put("TAS_FUNCTION_LINK",
										map.get("TAS_FUNCTION_LINK"));
							} else {
								resultHashMap.put("TAS_FUNCTION_LINK",
										"");
							}
							date.add(resultHashMap);
						
						
					} else if (listType1.get(f).get("TAS_SHOW_TYPE")
							.equals("7")) {
						

							List<Map> listContent = new ArrayList<>();

							HashMap<String, Object> resultHashMap = new HashMap<String, Object>();
							Map<String, String> map = (Map<String, String>) listTitle
									.get(f);
							resultHashMap.put("title",
									map.get("TAM_MOUDLE_NAME") + "-"
											+ map.get("TAS_FUN_NAME"));
							if (map.get("ID") != null) {
								String dateId = map.get("ID");
								// 获取功能细项、图片ID、数据内容
								String sqlContent = " select t1.TAS_DATA_CONTENT, t1.TAS_FUNCTION_LINK "
										+ " from T_APP_SHOWMANAGE t1 "
										+ " inner join T_APP_MOUDLE t3 "
										+ "  on t3.id = t1.TAs_MOUDLE_ID "

										+ " where t1.TAS_SHOW_TYPE =? "
										+ " and TAM_MENU_ID =? "
										+ " and t1.id =? "
										+ " order by t1.TAS_SEQ ";

								List list = new ArrayList<>();
								listContent = modelService.listDataSql(
										sqlContent,
										new Object[] {
												"7",
												tam_menu_id,
												listTitle.get(f).get(
														"ID") });
								for (int i1 = 0; i1 < listContent
										.size(); i1++) {

									String competitive = listContent
											.get(i1)
											.get("TAS_DATA_CONTENT")
											.toString();
									String src;

									String a3 = CommMethod
											.toJsonObj(competitive)
											.get("oracle").toString();
									if (StringUtils.isBlank(a3)) {
										a3 = CommMethod
												.toJsonObj(competitive)
												.get("commql")
												.toString();
									}
									String selSql = null;
									String str = a3;

									String s = str.replaceAll("\\{\"",
											"{'");
									String strSql;

									ArrayList<String> word = new ArrayList<String>();
									int m = 0, n = 0;
									int count = 0;
									String labelwq;
									String tempSql;
									Map<String, Object> map3 = new HashMap<String, Object>();
									Map<String, Object> map4 = new HashMap<String, Object>();
									List<Map> list5 = this.getSelSql(
											a3, service, nType);
									// map4 = (Map<String, Object>)
									// selSqlMap
									// .get(0);
									// selSql = (String)
									// selSqlMap.get(1);
									if (StringUtils
											.isNotBlank(listContent
													.get(i1).get(
															"PIC_NAME"))) {
										src = listContent.get(i1)
												.get("PIC_NAME")
												.toString();
										listContent.get(i1)
												.put("PIC_NAME",
														"/plf/userPhoto/"
																+ src);
									}
									// List<Map> list5 = new
									// ArrayList<>();
									/*
									 * if (null != map4 && map4.size() >
									 * 0) {
									 * 
									 * list5 = modelService.listSql(
									 * selSql, null, map4, null, null);
									 * } else { list5 = modelService
									 * .listDataSql(selSql); }
									 */
									// list5=this.delNull(list5);
									Map map2 = null;
									int aa = 0;
									String mkey = null;
									String mkeys;

									Map<String, String> map31 = new HashMap<>();
									Map<String, Object> map41 = new HashMap<>();
									if (null == list5
											&& list5.size() > 0) {
										for (int j = 0; j < list5
												.size(); j++) {
											aa = 0;
											map2 = list5.get(j);
											int size = map2.size();
											int a = 0;
											map31 = new HashMap<>();
											for (Object key : map2
													.keySet()) {

												if (a == 0) {
													map31.put(
															"T_X_NAME",
															String.valueOf(map2
																	.get(key)));
												} else if (a == 1) {
													map31.put(
															"T_Y1_BAR",
															String.valueOf(map2
																	.get(key)));
												}

												else if (a == 2) {
													map31.put(
															"T_Y1_UNIT",
															String.valueOf(map2
																	.get(key)));
												} else if (a == 3) {
													map31.put(
															"T_Y2_LINE",
															String.valueOf(map2
																	.get(key)));
												} else if (a == 4) {
													map31.put(
															"T_Y2_UNIT",
															String.valueOf(map2
																	.get(key)));
												}

												a++;

											}

											list.add(map31);
											aa = 0;

										}
									}

								}
								list = this.delNull(list);
								resultHashMap.put("data", list);

							}
							resultHashMap.put("Type",
									map.get("TAS_SHOW_TYPE"));
							if (StringUtils.isNotBlank(map
									.get("TAS_FUNCTION_LINK"))) {
								resultHashMap.put("TAS_FUNCTION_LINK",
										map.get("TAS_FUNCTION_LINK"));
							} else {
								resultHashMap.put("TAS_FUNCTION_LINK",
										"");
							}
							date.add(resultHashMap);
						
					} else {
						w++;
					}
				}
				if (w == listType1.size()) {
					jsonMap.put("chkLog", false);
					jsonMap.put("Content", "");
					jsonMap.put("msg", "数据异常");

				}
				jsonMap.put("chkLog", true);
				jsonMap.put("Content", date);
				jsonMap.put("msg", "");
			}
		}

		catch (Exception e) {
			// TODO: handle exception
			jsonMap.put("chkLog", false);
			List list = new ArrayList<>();

			jsonMap.put("Content", list);
			jsonMap.put("msg", e.toString());
			resmap.put("json", CommMethod.toJson(jsonMap));
			service.setResult(resmap);
			service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
			service.getResponse().setHeader("Access-Control-Allow-Methods",
					"POST");
			service.getResponse()
					.setHeader("Access-Control-Allow-Headers", "*");
			return null;
		}

		resmap.put("json", CommMethod.toJson(jsonMap));
		service.setResult(resmap);
		service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
		service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
		service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
		return null;

	}

	@SuppressWarnings({ "rawtypes", "unused" })
	public List getSelSql(String a3, HttpCoreService service, String[] nType) {
		a3 = a3.toUpperCase();
		// List<Map> resList = new ArrayList<Map>();
		List<String> resList = new ArrayList<String>();
		Pattern p = Pattern.compile("(\\{)([\\w]+)(\\})");
		Matcher m = p.matcher(a3);
		StringBuffer sb = new StringBuffer();
		StringBuffer sb2 = new StringBuffer();
		while (m.find()) {
			String group = m.group(2);// 参数
			// for(int i=0;i<nType.length;i++){
			if ("M_EMP_NO".equals(group)) {
				// if (service.getParamTo().get("M_EMP_NO") == null ||
				// service.getParamTo().get("M_EMP_NO").equals("\"\"")) {
				if (StringUtils.isBlank(service.getParamTo().get("M_EMP_NO"))) {
					m.appendReplacement(sb, "######");
				} else {
					m.appendReplacement(sb, "'"+service.getParamTo()
							.get("M_EMP_NO")+"'");
				}
			}
			if ("M_DEPT_ID".equals(group)) {
				// if (service.getParamTo().get("M_DEPT_ID") == null ||
				// service.getParamTo().get("M_DEPT_ID").equals("\"\"")) {
				if (StringUtils.isBlank(service.getParamTo().get("M_DEPT_ID"))) {
					m.appendReplacement(sb, "######");
				} else {
					m.appendReplacement(sb,
							"'"+service.getParamTo().get("M_DEPT_ID")+"'");
				}
			}
			if ("M_AREA_CODE".equals(group)) {
				// if (service.getParamTo().get("M_AREA_CODE") == null ||
				// service.getParamTo().get("M_AREA_CODE").equals("\"\"")) {
				if (StringUtils
						.isBlank(service.getParamTo().get("M_AREA_CODE"))) {
					m.appendReplacement(sb, "######");
				} else {
					m.appendReplacement(sb,
							"'"+service.getParamTo().get("M_AREA_CODE")+"'");
				}
			}
			if ("M_TEST_STEP".equals(group)) {
				// if (service.getParamTo().get("M_TEST_STEP") == null) {
				if (StringUtils
						.isBlank(service.getParamTo().get("M_TEST_STEP"))) {
					m.appendReplacement(sb, "######");
				} else {
					m.appendReplacement(sb,
							"'"+service.getParamTo().get("M_TEST_STEP")+"'");
				}
			}
			if ("M_WH_CODE".equals(group)) {

				// if (service.getParamTo().get("M_WH_CODE") == null ||
				// service.getParamTo().get("M_WH_CODE").equals("\"\"")) {
				if (StringUtils.isBlank(service.getParamTo().get("M_WH_CODE"))) {
					m.appendReplacement(sb, "######");
				} else {
					m.appendReplacement(sb,
							"'"+service.getParamTo().get("M_WH_CODE")+"'");
				}
			}
			if ("M_AREA_SN".equals(group)) {
				String a = service.getParamTo().get("M_AREA_SN");
				// service.getParamTo().get("M_AREA_SN") == null ||
				// service.getParamTo().get("M_AREA_SN").equals("\"\"")
				if (StringUtils.isBlank(service.getParamTo().get("M_AREA_SN"))) {
					m.appendReplacement(sb, "######");
				} else {
					m.appendReplacement(sb,
							"'"+service.getParamTo().get("M_AREA_SN")+"'");
				}

			}
			// }
			// 下一步是替换并且把替换好的值放到sb中
			//

		}
		// 把符合的数据追加到sb尾
		m.appendTail(sb);
		System.out.println(sb.toString());
		String lastSqlString = sb.toString().replace("= ######", " is null ")
				.replace("=######", " is null ");

		resList = modelService.listDataSql(lastSqlString);
		return resList;
	}

	// 判断是从角色还是用户 取功能细项，
	@SuppressWarnings({ "unused", "unchecked", "rawtypes" })
	private List<Map> selectLustTile(String n_emp_no, String tam_menu_id) {
		// TODO Auto-generated method stub
		List<Map> list = new ArrayList<>();

		String SqlTitle = "select * from( SELECT distinct t3.TAM_MOUDLE_NAME,t1.tas_fun_name,t1.ID,t1.TAS_SHOW_TYPE,t1.TAS_FUNCTION_LINK,t3.TAM_SEQ,t1.TAS_SEQ from T_APP_USER t "
				+ "left join T_APP_SHOWMANAGE t1 on t.TAU_FUN_ID =t1.ID  "
				+ " inner  join  T_APP_MOUDLE  t3  on  t3.id  =  t1.TAs_MOUDLE_ID   "
				+ " LEFT JOIN SY_USER t2 ON t.tau_user_id=t2.id  "
				+ " where t2.LOGIN_NAME=? "
				+ " and t3.TAM_MENU_ID=? ) "
				+ " order by TAM_SEQ,TAS_SEQ ";
		list = modelService.listDataSql(SqlTitle, new Object[] { n_emp_no,
				tam_menu_id });

		if (null != list && list.size() > 0) {
			judge = "user";
		} else {
			judge = "role";

			SqlTitle = "select * from( select distinct t3.TAM_MOUDLE_NAME,t1.tas_fun_name,t1.ID, "
					+ " t1.TAS_SHOW_TYPE,t1.TAS_FUNCTION_LINK,t3.TAM_SEQ,t1.TAS_SEQ from T_APP_ROLE t "
					+ " left join T_APP_SHOWMANAGE t1 "
					+ " on t.TAS_FUN_ID = t1.ID "
					+ " inner join T_APP_MOUDLE t3 "
					+ " on t3.id = t1.TAs_MOUDLE_ID "
					+ " where t3.TAM_MENU_ID = ? "
					+ " and t.TAR_ROLE_ID in "
					+ " (select ROLE_ID "
					+ "  from sy_user_role "
					+ " where USER_ID IN (select id from sy_user where login_name = ?)))  "
					+ " order by TAM_SEQ,TAS_SEQ ";
			list = modelService.listDataSql(SqlTitle, new Object[] {
					tam_menu_id, n_emp_no });
		}

		return list;
	}

	public List<Map> delNull(List<Map> list5) {
		// TODO Auto-generated method stub
		List<Map> list = new ArrayList<>();
		for (int j = 0; j < list5.size(); j++) {

			Map map2 = list5.get(j);
			int size = map2.size();

			Map map = new HashMap<>();
			for (Object key : map2.keySet()) {

				if (StringUtils.isNotBlank(map2.get(key))) {
					if (map2.get(key) instanceof Date) {
						map2.put(key, DateUtil.formatDate((Date) map2.get(key),
								"yyyy-MM-dd HH:mm:ss"));

					}
					if (map2.get(key) instanceof java.sql.Date) {

						map2.put(key, DateUtil.formatDate((Date) map2.get(key),
								"yyyy-MM-dd"));
					}

					if (StringUtils.isNotBlank(map2.get(key))) {
						map.put(key, map2.get(key));
					}

				} else {
					// map.put(key,"");
					// map.put(key, "");
					list5.get(j).put(key, "");
				}

			}

		}
		return list5;
	}

	public static Map<String, String> sortMapByKey(Map<String, String> map) {
		if (map == null || map.isEmpty()) {
			return null;
		}

		Map<String, String> sortMap = new TreeMap<String, String>(
				new MapKeyComparator());

		sortMap.putAll(map);

		return sortMap;
	}

}
