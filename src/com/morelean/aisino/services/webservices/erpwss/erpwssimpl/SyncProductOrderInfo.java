package com.morelean.aisino.services.webservices.erpwss.erpwssimpl;
	/**
	 *  备注： 数据状态项需确认
	 *        工单type项 
	 * 				机种关联
	 * 				入库单回传的工序问题
	 * 				
	 */
	import java.io.ByteArrayInputStream;
	import java.io.UnsupportedEncodingException;
	import java.text.ParseException;
	import java.text.SimpleDateFormat;
	import java.util.ArrayList;
	import java.util.Date;
	import java.util.HashMap;
	import java.util.Iterator;
	import java.util.List;
	import java.util.Map;
	import java.util.Map.Entry;
	import java.util.regex.Matcher;
	import java.util.regex.Pattern;

	import net.sf.json.JSON;
	import net.sf.json.JSONSerializer;
	import net.sf.json.xml.XMLSerializer;

	import org.apache.commons.logging.Log;
	import org.apache.commons.logging.LogFactory;
	import org.dom4j.Document;
	import org.dom4j.DocumentException;
	import org.dom4j.Element;
	import org.dom4j.io.SAXReader;

	import com.more.fw.core.common.method.CommMethod;
	import com.more.fw.core.common.method.DateUtil;
	import com.more.fw.core.common.method.SpringContextUtil;
	import com.more.fw.core.common.method.StringUtils;
	import com.more.fw.core.dbo.model.dto.TableDataMapExt;
	import com.more.fw.core.dbo.model.service.ModelService;
	import com.more.fw.webservice.service.IWebService;
	import com.morelean.aisino.common.Method;
	import com.sun.jna.platform.win32.WinCrypt.DATA_BLOB;

	/**
	 * @ClassName:SyncPurchaseOrderInfo
	 * @Description: 用于工单信息存储 接收参数 msg 工单信息 返回 TRUE 或 FALSE：错误信息
	 * @author:mmz
	 * @version:1.0
	 * @since 2018年4月18日下午2:33:20
	 * @Copyright: Copyright (c) 2018
	 * @Company: morelean
	 */
	public class SyncProductOrderInfo implements IWebService {
		final Log log = LogFactory.getLog(this.getClass());
		private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

		/*
		 * (non-Javadoc)
		 * 
		 * @param objs 值对,获取方式objs[n];参数 objs[0]String类型，xml格式。例：
		 * 
		 * @return Map 添加成功 或者 失败：失败信息
		 */
		public Map<String, Object> excute(Object... objs) {

			SAXReader saxReader = new SAXReader();
			Map<String, Object> resmap = new HashMap<String, Object>();// 存返回数据
			List<Map<String, Object>> supList = new ArrayList<Map<String, Object>>();// 存储各个工序信息
			List<Map<String, Object>> validList = new ArrayList<Map<String, Object>>();// 存有效信息

			// 创建xml解析对象
			SAXReader reader = new SAXReader();
			// 定义一个文档
			Document document = null;
			boolean inx = true;// 投产依据 文档解析时，当false返回失败信息。 开始数据投产时，当 false进行更新投产
			// 将字符串转换为

			String xmlMsg = objs[0].toString();

			try {
				document = reader.read(new ByteArrayInputStream(xmlMsg.getBytes("UTF-8")));
			} catch (UnsupportedEncodingException | DocumentException e) {
				resmap.put("MSG", "FALSE:XML数据解析失败，请核实数据格式__" + e);// "FALSE:XML数据解析失败，请核实数据格式"
				return resmap;
				// e.printStackTrace();
			}
			// 得到xml的根节点(message)
			Element root = document.getRootElement();
			// 定义子循环体的变量
			Element obj = null;
			Iterator elems = null;
			List<Element> purchaseOrders = root.elements();// 采购list
			Map<String, Object> elemap;
			for (Element supplier : purchaseOrders) {
				elemap = new HashMap<String, Object>();
				for (elems = supplier.elementIterator(); elems.hasNext();) {// 遍历获得xml内容
					obj = (Element) elems.next();
					if (obj.elements().size() > 0) {// 工单子list
						Map<String, Object> map;
						List<Map<String, Object>> elist = new ArrayList<Map<String, Object>>();
						List li = obj.elements();
						for (Object ob : li) {
							map = new HashMap<String, Object>();
							Element o = (Element) ob;
							for (Object e : o.elements()) {// #F5 采购详情表
								Element e1 = (Element) e;
								if ("WORKCENTER_SEQ".equals(e1.getName()) // 工序序号
										|| "WORKCENTER_NO".equals(e1.getName())// 工序编码
										|| "WORKCENTER".equals(e1.getName())// 工序描述
									//	|| "DATA_STATUS".equals(e1.getName())// 数据状态
								) {
									map.put(e1.getName(), e1.getText());
								}
							}
							// 验证map
							if (!map.containsKey("WORKCENTER_SEQ")
									|| !map.containsKey("WORKCENTER_NO")
									|| !map.containsKey("WORKCENTER")
								//	|| !map.containsKey("DATA_STATUS") 
									|| "".equals(map.get("WORKCENTER_SEQ"))
									|| "".equals(map.get("WORKCENTER_NO"))
									|| "".equals(map.get("WORKCENTER")) 
									//|| "".equals(map.get("DATA_STATUS"))
									) {
								resmap.put("MSG", "FALSE:工序单必填项缺失或为空，请核实");
								return resmap;
							}



							elist.add(map);
						}
						elemap.put(obj.getName(), elist);//主MAP添加工序表信息

					} else {// 工单主表
						if ("PROJECT_ID".equals(obj.getName()) // 工单ID *
								|| "PRODUCT_MATERIAL".equals(obj.getName()) // 机种 *
								|| "PROJECT_TYPE".equals(obj.getName())// 传入 0，标准 1，非标  *
								|| "PRODUCT_COUNT".equals(obj.getName())// 计划数量 *
								|| "PROLEPSIS_START_DATE".equals(obj.getName())// 预计开工日期 *
								|| "PROLEPSIS_END_DATE".equals(obj.getName())// 预计完工日期
								|| "LOT_NUMBER".equals(obj.getName())// 批次号 *
								|| "PM_MEMO".equals(obj.getName())// 备注 
								|| "DEPART_NO".equals(obj.getName())// 组织机构
								|| "DATA_STATUS".equals(obj.getName())// 数据状态
						// 注： WORKCENTER_LIST 工序列表在 #f5处已保存
						)

							elemap.put(obj.getName(), obj.getText());// 标签名 和 数据

					}
				}
				// 验证工单
				if (!elemap.containsKey("PROJECT_ID") 
						|| !elemap.containsKey("PRODUCT_MATERIAL")
						|| !elemap.containsKey("PROJECT_TYPE")
						|| !elemap.containsKey("PROLEPSIS_START_DATE") 
						|| !elemap.containsKey("DEPART_NO")
						|| !elemap.containsKey("PRODUCT_COUNT")
						|| !elemap.containsKey("LOT_NUMBER")
						|| !elemap.containsKey("WORKCENTER_LIST") 
						|| !elemap.containsKey("DEPART_NO") 
						|| !elemap.containsKey("DATA_STATUS") 
						|| "".equals(elemap.get("PROJECT_ID")) 
						|| "".equals(elemap.get("PRODUCT_MATERIAL"))
						
						|| "".equals(elemap.get("PROJECT_TYPE")) 
						|| "".equals(elemap.get("PROLEPSIS_START_DATE"))
						|| "".equals(elemap.get("DEPART_NO")) 
						|| "".equals(elemap.get("PRODUCT_COUNT")) 
						|| "".equals(elemap.get("LOT_NUMBER")) 
						|| "".equals(elemap.get("WORKCENTER_LIST"))
						|| "".equals(elemap.get("DEPART_NO"))
						|| "".equals(elemap.get("DATA_STATUS"))
						) {
					resmap.put("MSG", "FALSE:工单必填项缺失或为空，请核实");
					return resmap;
				}
				if (!matchDate(elemap.get("PROLEPSIS_START_DATE").toString()) || !isValidDate(elemap.get("PROLEPSIS_START_DATE").toString())) {
					resmap.put("MSG", "FALSE:预计开工日期【"+elemap.get("PROLEPSIS_START_DATE").toString()+"】格式有误，请核实");
					return resmap;
				}
				if (elemap.containsKey("PROLEPSIS_END_DATE")&&!"".equals(elemap.get("PROLEPSIS_END_DATE"))&&(!matchDate(elemap.get("PROLEPSIS_END_DATE").toString()) || !isValidDate(elemap.get("PROLEPSIS_END_DATE").toString()))) {
					resmap.put("MSG", "FALSE:预计完工日期【"+matchDate(elemap.get("PROLEPSIS_END_DATE").toString())+"】格式有误，请核实");
					return resmap;
				}
				//组织机构信息的转化 供应商传来 depart_no(对应dep_sn) 转化为 id 存入表 DATA_AUTH
				String auth = Method.getDeptId(elemap.get("DEPART_NO").toString());
				if (auth == null){
					resmap.put("MSG", "组织积机构代码【"+elemap.get("DEPART_NO").toString()+"】错误");
					return resmap;
				}
				elemap.put("DEPART_NO",auth);
				supList.add(elemap);
			}

			// 数据值图中插入数据 T_PM_PROJECT_BASE T_PM_PROJECT_WORKCENTER

			Date date = DateUtil.getCurDate();// 获得当前时间
			// 开始进行数据更新或保存
			try {
				int modifyinx = 0;
				int insertinx = 0;
				for (Map<String, Object> vmap : supList) {
					
					TableDataMapExt tdMap = new TableDataMapExt();// 数据投产类
					//判断是否工单 DATA_STATUS 为 -1
					if(vmap.containsKey("DATA_STATUS")&&!"".equals("DATA_STATUS")){
								if("-1".equals(vmap.get("DATA_STATUS"))){
									tdMap.setTableName("T_PM_PROJECT_WORKCENTER");// 工序单
									tdMap.setSqlWhere(" and  PROJECT_ID = ? ");
									tdMap.getSqlWhereArgs().add(vmap.get("PROJECT_ID"));
									modelService.del(tdMap);
									tdMap.setTableName("T_PM_PROJECT_BASE");// 工单
									modelService.del(tdMap);
									tdMap.setSqlWhere("");
									continue;
								}//  T_PM_PROJECT_WORKCENTER T_PM_PROJECT_BASE
					}
					// 判断是否 在数据变更结束后更改工单状态
//					boolean ifchange = false;
					
					tdMap.setTableName("T_PM_PROJECT_BASE");// 工单

					inx = true;// 判断更新或则添加投产
					List<Map<String, Object>> mlist = new ArrayList<Map<String, Object>>();
					mlist = (List<Map<String, Object>>) vmap.get("WORKCENTER_LIST");// 子表单
					// tdMap.getColMap().clear();
					// Map<String,Object> dMap= tdMap.getColMap();// 设置数据键值图
					vmap.remove("WORKCENTER_LIST");

					String sql = "SELECT ID FROM T_PM_PROJECT_BASE  WHERE PROJECT_ID  =?";// 查询是否已存在
					List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
					list = modelService.listDataSql(sql, new Object[] { vmap.get("PROJECT_ID") });

					if (null != list && list.size() > 0 && list.get(0).containsKey("ID")) {// 存在
						inx = false;// 触发更新
					}

					Date prolepsisStartDate = getTime(vmap.get("PROLEPSIS_START_DATE").toString());// 预计开工日期
					Date prolepsisEndDate  = null;
					if(vmap.containsKey("PROLEPSIS_END_DATE")&&!"".equals(vmap.get("PROLEPSIS_END_DATE"))){
						prolepsisEndDate = getTime(vmap.get("PROLEPSIS_END_DATE").toString());// 预计完工日期
					}
					if (inx) {// 添加
						tdMap.getColMap().put("CREATE_TIME", date);
						tdMap.getColMap().put("EDIT_TIME", date);
						tdMap.getColMap().put("PROJECT_ID", vmap.get("PROJECT_ID").toString());// 工单号
						tdMap.getColMap().put("PRODUCT_MATERIAL", vmap.get("PRODUCT_MATERIAL").toString());// 机种
						tdMap.getColMap().put("ID", StringUtils.getUUID());// 工单表ID
						tdMap.getColMap().put("PROLEPSIS_START_DATE", prolepsisStartDate);
						if(null!=prolepsisEndDate)
						  tdMap.getColMap().put("PROLEPSIS_END_DATE", prolepsisEndDate);
						tdMap.getColMap().put("PRODUCT_COUNT", vmap.get("PRODUCT_COUNT").toString());// 计划数量
						tdMap.getColMap().put("PROJECT_TYPE", vmap.get("PROJECT_TYPE").toString());// 类型
						tdMap.getColMap().put("LOT_NUMBER", vmap.get("LOT_NUMBER").toString());// 批次号
						if(vmap.containsKey("PM_MEMO"))
							tdMap.getColMap().put("PM_MEMO", vmap.get("PM_MEMO").toString());// 备注
						tdMap.getColMap().put("DATA_AUTH", vmap.get("DEPART_NO").toString());// 组织机构
						tdMap.getColMap().put("DEPT_ID", vmap.get("DEPART_NO").toString());// 组织机构

						modelService.save(tdMap);// 存储

						// 工序list添加
						tdMap.setTableName("T_PM_PROJECT_WORKCENTER");
						for (Map<String, Object> detail : mlist) {
							Map<String, Object> moMap = new HashMap<String, Object>();
							moMap.put("WORKCENTER_SEQ", detail.get("WORKCENTER_SEQ"));
							moMap.put("WORKCENTER_NO", detail.get("WORKCENTER_NO"));
							moMap.put("WORKCENTER", detail.get("WORKCENTER"));
							moMap.put("ID", StringUtils.getUUID());
							moMap.put("PROJECT_ID", vmap.get("PROJECT_ID"));
							moMap.put("DATA_AUTH", vmap.get("DEPART_NO").toString());// 组织机构
							moMap.put("DEPT_ID", vmap.get("DEPART_NO").toString());// 组织机构
							tdMap.setColMap(moMap);// 设置基础数据字段值
							tdMap.getColMap().put("CREATE_TIME", date);
							tdMap.getColMap().put("EDIT_TIME", date);
							modelService.save(tdMap);

						}
						// mlist
						resmap.put("INSERT", ++insertinx);
					} else {// 更新
						tdMap.getColMap().put("EDIT_TIME", date);
						tdMap.getColMap().put("PROJECT_ID", vmap.get("PROJECT_ID").toString());// 工单号
						tdMap.getColMap().put("PRODUCT_MATERIAL", vmap.get("PRODUCT_MATERIAL").toString());// 机种
						tdMap.getColMap().put("PROLEPSIS_START_DATE", prolepsisStartDate);
						if(null!=prolepsisEndDate)
						tdMap.getColMap().put("PROLEPSIS_END_DATE", prolepsisEndDate);
						tdMap.getColMap().put("PRODUCT_COUNT", vmap.get("PRODUCT_COUNT").toString());// 计划数量
						tdMap.getColMap().put("PROJECT_TYPE", vmap.get("PROJECT_TYPE").toString());// 类型
						tdMap.getColMap().put("LOT_NUMBER", vmap.get("LOT_NUMBER").toString());// 批次号
						if(vmap.containsKey("PM_MEMO"))
							tdMap.getColMap().put("PM_MEMO", vmap.get("PM_MEMO").toString());// 备注

						tdMap.getColMap().put("DATA_AUTH", vmap.get("DEPART_NO").toString());// 组织机构
						tdMap.getColMap().put("DEPT_ID", vmap.get("DEPART_NO").toString());// 组织机构


						tdMap.setSqlWhere("  and PROJECT_ID = ?");
						tdMap.getSqlWhereArgs().clear();// 集合插入时候 清除残留参数释放占用资源
						tdMap.getSqlWhereArgs().add(vmap.get("PROJECT_ID"));
						modelService.edit(tdMap);
						tdMap.setSqlWhere("");

						// 工序list更新或添加
						tdMap.setTableName("T_PM_PROJECT_WORKCENTER");
						//方案一 ： 全删后添加	
						//删除
						tdMap.getSqlWhereArgs().clear();// 集合插入时候 清除残留参数释放占用资源
						tdMap.setSqlWhere("  and PROJECT_ID = ?");
						tdMap.getSqlWhereArgs().add(vmap.get("PROJECT_ID"));
						modelService.del(tdMap);
						tdMap.setSqlWhere("");
						//添加
						for (Map<String, Object> detail : mlist) {
							Map<String, Object> moMap = new HashMap<String, Object>();
							moMap.put("WORKCENTER_SEQ", detail.get("WORKCENTER_SEQ"));
							moMap.put("WORKCENTER_NO", detail.get("WORKCENTER_NO"));
							moMap.put("WORKCENTER", detail.get("WORKCENTER"));
							moMap.put("ID", StringUtils.getUUID());
							moMap.put("PROJECT_ID", vmap.get("PROJECT_ID"));
							moMap.put("DATA_AUTH", vmap.get("DEPART_NO").toString());// 组织机构
							moMap.put("DEPT_ID", vmap.get("DEPART_NO").toString());// 组织机构
							tdMap.setColMap(moMap);// 设置基础数据字段值
							tdMap.getColMap().put("CREATE_TIME", date);
							tdMap.getColMap().put("EDIT_TIME", date);
							modelService.save(tdMap);

						}
						
						//方案二 ：逐条判断
						/*
						for (Map<String, Object> detail : mlist) {
							// 工单号为唯一验证 进行更新或者 添加
							String desql = "select ID FROM T_PM_PROJECT_WORKCENTER WHERE PROJECT_ID= ? and WORKCENTER_NO = ? AND WORKCENTER_SEQ = ?";
							list = modelService.listDataSql(desql,
									new Object[] { vmap.get("PROJECT_ID"), detail.get("WORKCENTER_NO"), detail.get("WORKCENTER_SEQ") });
							if (null != list && list.size() > 0 && list.get(0).containsKey("ID")) {// 存在
								inx = false;// 触发更新
							} else {
								inx = true;
							}
							Map<String, Object> moMap = new HashMap<String, Object>();
							moMap.put("WORKCENTER_SEQ", detail.get("WORKCENTER_SEQ"));
							moMap.put("WORKCENTER_NO", detail.get("WORKCENTER_NO"));
							moMap.put("WORKCENTER", detail.get("WORKCENTER"));
							moMap.put("DATA_AUTH", vmap.get("DEPART_NO").toString());// 组织机构
							moMap.put("DEPT_ID", vmap.get("DEPART_NO").toString());// 组织机构
							tdMap.setColMap(moMap);// 设置基础数据字段值
							tdMap.getColMap().put("EDIT_TIME", date);
							if (inx) {// 添加
								moMap.put("ID", StringUtils.getUUID());
								moMap.put("PROJECT_ID", vmap.get("PROJECT_ID"));
								tdMap.getColMap().put("CREATE_TIME", date);
								modelService.save(tdMap);

							} else {// 更新
								// 更新时候判断时候 工序状态是否为 -1
								if ("-1".equals(detail.get("DATA_STATUS"))) {

										TableDataMapExt mmMap = new TableDataMapExt();
										mmMap.setTableName("T_PM_PROJECT_WORKCENTER");//  工单
										Map<String, Object> ammMap = new HashMap<String, Object>();
										mmMap.setSqlWhere("  and PROJECT_ID = ? and WORKCENTER_SEQ = ? and WORKCENTER_NO = ?");
										List<Object> delList = new ArrayList<Object>();
										delList.add(vmap.get("PROJECT_ID"));
										delList.add(detail.get("WORKCENTER_SEQ"));
										delList.add(detail.get("WORKCENTER_NO"));
										mmMap.setSqlWhereArgs(delList);
										mmMap.setColMap(ammMap);
										modelService.del(mmMap);// 删除
										continue;// 进入下次循环   *

								}
								// 此处曾忘记添加 更新条件
								// 本单元开始处已经添加好更新参数，设置更新条件后开始更新
								tdMap.setSqlWhere(" and PROJECT_ID = ? and WORKCENTER_NO = ? AND WORKCENTER_SEQ = ?");
								List<Object> pieditList = new ArrayList<Object>();
								pieditList.add(vmap.get("PROJECT_ID"));
								pieditList.add(detail.get("WORKCENTER_NO"));
								pieditList.add(detail.get("WORKCENTER_SEQ"));
								tdMap.setSqlWhereArgs(pieditList);
								modelService.edit(tdMap);
								tdMap.setSqlWhere("");
							}
						}// 工单更新时候工序单的更新或添加结束
					*/
						resmap.put("MODIFY", ++modifyinx);
					}// 工单更新结束
/*
					if (ifchange) {// 更新工单状态
						changeSta(vmap, tdMap);
						modelService.edit(tdMap);
						tdMap.setSqlWhere("");
					}
*/
				}// 完成一项工单的投产

			} catch (Exception e) {
				log.error(e);
				resmap.put("MSG", "FALSE:" + e);// "FALSE:信息解析失败"
				return resmap;
			}

			resmap.put("MSG", "TRUE");// 数据有效且投产顺利完成
			return resmap;

		}

		

		// 更改状态
		private void changeSta(Map<String, Object> vmap, TableDataMapExt tdMap) {
			tdMap.setTableName("T_PM_PROJECT_BASE");
			Map<String, Object> changeMap = new HashMap<String, Object>();
			changeMap.put("PROJECT_TYPE", "2");
			tdMap.setColMap(changeMap);
			tdMap.setSqlWhere("  and PROJECT_ID = ? and PROJECT_TYPE != '3' ");
			tdMap.getSqlWhereArgs().clear();// 集合插入时候 清除残留参数释放占用资源
			tdMap.getSqlWhereArgs().add(vmap.get("PROJECT_ID"));
		}

		// 转化时间
		private Date getTime(String str) throws ParseException {
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd hhmmss");// 设置日期格式
			Date d = df.parse(str);
			return d;
		}

		public boolean isInteger(String str) {
			Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
			return pattern.matcher(str).matches();
		}

		/**
		 *  
		 * 
		 * @Description: TODO
		 * @param str
		 * @return
		 * @author: mmz  @Company:morelean    
		 */
		public boolean matchDate(String str) {
			Pattern patn_sclh = Pattern.compile("^[0-9]{8}[\\s]{1}[0-9]{6}$");
			boolean b = patn_sclh.matcher(str).matches();
			return b;
			
		}

		// 日期校验
		private int[] DAYS = { 0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

		/**
		 *  
		 * 
		 * @Description: 抄袭的，稍做修改 已符合接口需求
		 * @param date
		 *          yyyyMMdd HHmmss
		 * @return
		 * @author: chen_yongkai FROM ITOYO 2012/08/30
		 */
		public boolean isValidDate(String date) {
			try {
				int year = Integer.parseInt(date.substring(0, 4));
				if (year <= 0)
					return false;
				int month = Integer.parseInt(date.substring(4, 6));
				if (month <= 0 || month > 12)
					return false;
				int day = Integer.parseInt(date.substring(6, 8));
				if (day <= 0 || day > DAYS[month])
					return false;
				if (month == 2 && day == 29 && !isGregorianLeapYear(year)) {
					return false;
				}
				int hour = Integer.parseInt(date.substring(9, 11));
				if (hour < 0 || hour > 23)
					return false;
				int minute = Integer.parseInt(date.substring(11, 13));
				if (minute < 0 || minute > 59)
					return false;
				int second = Integer.parseInt(date.substring(13, 15));
				if (second < 0 || second > 59)
					return false;

			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
			return true;
		}

		public final boolean isGregorianLeapYear(int year) {
			return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
		}

	}
