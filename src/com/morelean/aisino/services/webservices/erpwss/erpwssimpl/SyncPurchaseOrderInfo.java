package com.morelean.aisino.services.webservices.erpwss.erpwssimpl;

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
 * @Description: 用于采购单信息存储 接收参数 msg 采购单信息 返回 TRUE 或 FALSE：错误信息
 * @author:mmz
 * @version:1.0
 * @since 2018年3月29日下午8:10:01
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class SyncPurchaseOrderInfo implements IWebService {
	final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

	/*
	 * (non-Javadoc)
	 * 
	 * @param objs 值对,获取方式objs[n];参数 objs[0]String类型，xml格式。例：<?xml version="1.0" encoding="utf-8"?><PURCHASE_ORDERS><PURCHASE_ORDER><WIP_PO>MMZ_C01-PO-20171215003</WIP_PO><WPI_SUP_CODE>2589511212</WPI_SUP_CODE><WPI_STATUS>1</WPI_STATUS><WPD_DELIVERY_DATE>2017/12/15 11:05:18</WPD_DELIVERY_DATE><DEPART_NO>NULL</DEPART_NO><WPI_CUST></WPI_CUST><REMARK1></REMARK1><REMARK2></REMARK2><REMARK3></REMARK3><WPI_ITEM_LIST><WPD_ITEM><WPD_ITEM_SEQ>1</WPD_ITEM_SEQ><WPD_ITEM_CODE>01.30.4785</WPD_ITEM_CODE><WPD_PLAN_NUM>10</WPD_PLAN_NUM><WPD_OVERPLUS_NUM>NULL</WPD_OVERPLUS_NUM><DATA_STATUS>0</DATA_STATUS><WPD_SPECIAL>特性</WPD_SPECIAL><WPI_MEMO>NULL</WPI_MEMO><REMARK1></REMARK1><REMARK2></REMARK2><REMARK3></REMARK3></WPD_ITEM><WPD_ITEM><WPD_ITEM_SEQ>2</WPD_ITEM_SEQ><WPD_ITEM_CODE>01.30.4785</WPD_ITEM_CODE><WPD_PLAN_NUM>10</WPD_PLAN_NUM><WPD_OVERPLUS_NUM>NULL</WPD_OVERPLUS_NUM><DATA_STATUS>0</DATA_STATUS><WPD_SPECIAL>特性</WPD_SPECIAL><WPI_MEMO>NULL</WPI_MEMO><REMARK1></REMARK1><REMARK2></REMARK2><REMARK3></REMARK3></WPD_ITEM></WPI_ITEM_LIST></PURCHASE_ORDER><PURCHASE_ORDER><WIP_PO>MMZ_C01-PO-201712150031</WIP_PO><WPI_SUP_CODE>2589121214</WPI_SUP_CODE><WPI_STATUS>1</WPI_STATUS><WPD_DELIVERY_DATE>2017/12/15 11:05:18</WPD_DELIVERY_DATE><DEPART_NO>NULL</DEPART_NO><WPI_CUST></WPI_CUST><REMARK1></REMARK1><REMARK2></REMARK2><REMARK3></REMARK3><WPI_ITEM_LIST><WPD_ITEM><WPD_ITEM_SEQ>1</WPD_ITEM_SEQ><WPD_ITEM_CODE>01.30.4785</WPD_ITEM_CODE><WPD_PLAN_NUM>10</WPD_PLAN_NUM><WPD_OVERPLUS_NUM>NULL</WPD_OVERPLUS_NUM><DATA_STATUS>0</DATA_STATUS><WPD_SPECIAL>特性</WPD_SPECIAL><WPI_MEMO>NULL</WPI_MEMO><REMARK1></REMARK1><REMARK2></REMARK2><REMARK3></REMARK3></WPD_ITEM></WPI_ITEM_LIST></PURCHASE_ORDER></PURCHASE_ORDERS>
	 * 
	 * @return Map 操作成功 或者 失败：失败信息
	 */
	public Map<String, Object> excute(Object... objs) {

		SAXReader saxReader = new SAXReader();
		Map<String, Object> resmap = new HashMap<String, Object>();// 存返回数据
		List<Map<String, Object>> supList = new ArrayList<Map<String, Object>>();// 存储各个物料信息
		List<Map<String, Object>> validList = new ArrayList<Map<String, Object>>();// 存有效信息

		// 创建xml解析对象
		SAXReader reader = new SAXReader();
		// 定义一个文档
		Document document = null;
		boolean inx = true;// 操作依据 文档解析时，当false返回失败信息。 开始数据操作时，当 false进行更新操作
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
				if (obj.elements().size() > 0) {// 采购子list
					Map<String, Object> map;
					List<Map<String, Object>> elist = new ArrayList<Map<String, Object>>();
					List li = obj.elements();
					for (Object ob : li) {
						map = new HashMap<String, Object>();
						Element o = (Element) ob;
						for (Object e : o.elements()) {// #F5 采购详情表
							Element e1 = (Element) e;
							if ("WPD_ITEM_SEQ".equals(e1.getName()) // 项次
									|| "WPD_ITEM_CODE".equals(e1.getName())// 物料号
									|| "WPD_PLAN_NUM".equals(e1.getName())// 计划数量
									|| "WPD_OVERPLUS_NUM".equals(e1.getName())// 可接收数量
									|| "DATA_STATUS".equals(e1.getName())// 数据状态
									|| "WPD_SPECIAL".equals(e1.getName())// 是否客供
							) {
								map.put(e1.getName(), e1.getText());
							}
						}
						// 验证map
						if (!map.containsKey("WPD_ITEM_SEQ") || !map.containsKey("WPD_ITEM_CODE") || !map.containsKey("WPD_PLAN_NUM")
								|| !map.containsKey("DATA_STATUS") || !map.containsKey("WPD_SPECIAL") || "".equals(map.get("WPD_ITEM_SEQ"))
								|| "".equals(map.get("WPD_ITEM_CODE")) || "".equals(map.get("WPD_PLAN_NUM")) || "".equals(map.get("DATA_STATUS"))
								|| "".equals(map.get("WPD_SPECIAL"))) {
							resmap.put("MSG", "FALSE:物料单必填项缺失或为空，请核实");
							return resmap;
						}
						if (!isInteger(map.get("WPD_PLAN_NUM").toString())) {
							resmap.put("MSG", "FALSE:WPD_PLAN_NUM：【"+map.get("WPD_PLAN_NUM").toString()+"】必须为整数");
							return resmap;
						}
						if (!"".equals(map.get("WPD_OVERPLUS_NUM").toString()) && !isInteger(map.get("WPD_OVERPLUS_NUM").toString())) {
							resmap.put("MSG", "FALSE:WPD_OVERPLUS_NUM:【"+map.get("WPD_OVERPLUS_NUM").toString()+"】必须为整数");
							return resmap;
						}

						elist.add(map);
					}
					elemap.put(obj.getName(), elist);//主MAP添加采购详情表信息

				} else {// 采购主表
					if ("WPI_PO".equals(obj.getName()) // 采购单号
							|| "WPI_SUP_CODE".equals(obj.getName()) // 供应商代码
							|| "WPI_STATUS".equals(obj.getName())// 交货日期
							|| "WPD_DELIVERY_DATE".equals(obj.getName())// 交货日期
							|| "DEPART_NO".equals(obj.getName())// 组织机构
							|| "WPI_CUST".equals(obj.getName())// 是否客供
					// 注： WPI_ITEM_LIST 采购详情列表在 #f5处已保存
					)

						elemap.put(obj.getName(), obj.getText());// 标签名 和 数据

				}
			}
			// if (!"-1".equals(elemap.get("WPI_STATUS")))// 状态不为-1时候添加 --需求变更
			// 验证采购单
			if (!elemap.containsKey("WPI_PO") || !elemap.containsKey("WPI_SUP_CODE") || !elemap.containsKey("WPI_STATUS")
					|| !elemap.containsKey("WPD_DELIVERY_DATE") || !elemap.containsKey("DEPART_NO") || !elemap.containsKey("WPI_CUST")
					|| !elemap.containsKey("WPI_ITEM_LIST") 
					|| !elemap.containsKey("DEPART_NO") 
					|| "".equals(elemap.get("WPI_PO")) 
					|| "".equals(elemap.get("WPI_SUP_CODE"))
					|| "".equals(elemap.get("WPI_STATUS")) 
					|| "".equals(elemap.get("WPD_DELIVERY_DATE"))
					|| "".equals(elemap.get("DEPART_NO")) 
					|| "".equals(elemap.get("WPI_CUST")) 
					|| "".equals(elemap.get("WPI_ITEM_LIST"))
					|| "".equals(elemap.get("DEPART_NO"))
					) {
				resmap.put("MSG", "FALSE:采购单必填项缺失或为空，请核实");
				return resmap;
			}
			if (!matchDate(elemap.get("WPD_DELIVERY_DATE").toString()) || !isValidDate(elemap.get("WPD_DELIVERY_DATE").toString())) {
				resmap.put("MSG", "FALSE:采购单日期:【"+elemap.get("WPD_DELIVERY_DATE").toString()+"】格式有误，请核实");
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

		// 数据值图中插入数据 T_WMS_PO_INFO T_WMS_PO_DETAIL

		Date date = DateUtil.getCurDate();// 获得当前时间
		// 开始进行数据更新或保存操作
		try {
			int modifyinx = 0;
			int insertinx = 0;
			for (Map<String, Object> vmap : supList) {
				// 判断是否 在数据变更结束后更改采购单状态
				boolean ifchange = false;

				TableDataMapExt tdMap = new TableDataMapExt();// 数据操作类
				tdMap.setTableName("T_WMS_PO_INFO");// 当前操作表为 采购单
				inx = true;// 判断更新或则添加操作
				List<Map<String, Object>> mlist = new ArrayList<Map<String, Object>>();
				mlist = (List<Map<String, Object>>) vmap.get("WPI_ITEM_LIST");// 子表清单
				// tdMap.getColMap().clear();
				// Map<String,Object> dMap= tdMap.getColMap();// 设置数据键值图
				vmap.remove("WPI_ITEM_LIST");// 不一定会起到作用

				String sql = "SELECT ID FROM T_WMS_PO_INFO  WHERE WPI_PO  =?";// 查询是否已存在
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				list = modelService.listDataSql(sql, new Object[] { vmap.get("WPI_PO") });

				if (null != list && list.size() > 0 && list.get(0).containsKey("ID")) {// 存在
					inx = false;// 触发更新操作
				}

				Date wpdDeliveryDate = getTime(vmap.get("WPD_DELIVERY_DATE").toString());// 交货日期
				if (inx) {// 添加
					tdMap.getColMap().put("CREATE_TIME", date);
					tdMap.getColMap().put("EDIT_TIME", date);
					tdMap.getColMap().put("WPI_CREATE_TIME", date);// 创建清单时间
					tdMap.getColMap().put("WPI_PO", vmap.get("WPI_PO").toString());// 采购单号
					tdMap.getColMap().put("WPI_SUP_CODE", vmap.get("WPI_SUP_CODE").toString());// 供应商代码
					tdMap.getColMap().put("ID", StringUtils.getUUID());// 采购单表ID
					tdMap.getColMap().put("WPI_RECEIVE_TIME", wpdDeliveryDate);// erp填交货时间，mes对应更改到货日期
					tdMap.getColMap().put("WPI_CUST", vmap.get("WPI_CUST").toString());// 是否客供
					tdMap.getColMap().put("DATA_AUTH", vmap.get("DEPART_NO").toString());// 组织机构
					tdMap.getColMap().put("DEPT_ID", vmap.get("DEPART_NO").toString());// 组织机构

					erpChangeSta(date, vmap, tdMap);

					modelService.save(tdMap);// 存储

					// 物料list添加
					tdMap.setTableName("T_WMS_PO_DETAIL");
					for (Map<String, Object> detail : mlist) {
						ifchange = changeToExcute(ifchange, detail); // 判断是否执行中
						Map<String, Object> moMap = new HashMap<String, Object>();
						moMap.put("WPD_ITEM_SEQ", detail.get("WPD_ITEM_SEQ"));
						moMap.put("WPD_ITEM_CODE", detail.get("WPD_ITEM_CODE"));
						moMap.put("WPD_PLAN_NUM", detail.get("WPD_PLAN_NUM"));
						moMap.put("WPD_SPECIAL", detail.get("WPD_SPECIAL"));
						moMap.put("ID", StringUtils.getUUID());
						moMap.put("WPD_PO", vmap.get("WPI_PO"));
						moMap.put("WPD_RECEIVE_NUM", detail.get("WPD_RECEIVE_NUM"));
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
					// tdMap.getColMap().put("EDIT_TIME", date);
					// tdMap.getColMap().put("WPI_CREATE_TIME", date);// 创建清单时间
					tdMap.getColMap().put("WPI_PO", vmap.get("WPI_PO").toString());// 采购单号
					tdMap.getColMap().put("WPI_SUP_CODE", vmap.get("WPI_SUP_CODE").toString());// 供应商代码
					tdMap.getColMap().put("WPI_RECEIVE_TIME", wpdDeliveryDate);// erp填交货时间，mes对应更改到货日期
					tdMap.getColMap().put("WPI_CUST", vmap.get("WPI_CUST").toString());// 是否客供
					tdMap.getColMap().put("DATA_AUTH", vmap.get("DEPART_NO").toString());// 组织机构
					tdMap.getColMap().put("DEPT_ID", vmap.get("DEPART_NO").toString());// 组织机构

					// 更新状态
					erpChangeSta(date, vmap, tdMap);

					tdMap.setSqlWhere("  and WPI_PO = ?");
					tdMap.getSqlWhereArgs().clear();// 集合插入时候 清除残留参数释放占用资源
					tdMap.getSqlWhereArgs().add(vmap.get("WPI_PO"));
					modelService.edit(tdMap);
					tdMap.setSqlWhere("");

					// 物料list更新或添加
					tdMap.setTableName("T_WMS_PO_DETAIL");

					for (Map<String, Object> detail : mlist) {
						// 更新时候 以项次，采购单号 ，物料料号 为唯一验证 进行更新或者 添加操作
						String desql = "select ID FROM T_WMS_PO_DETAIL WHERE WPD_PO = ? and WPD_ITEM_CODE = ? AND WPD_ITEM_SEQ = ?";
						list = modelService.listDataSql(desql,
								new Object[] { vmap.get("WPI_PO"), detail.get("WPD_ITEM_CODE"), detail.get("WPD_ITEM_SEQ") });
                        inx = null == list || list.size() <= 0 || !list.get(0).containsKey("ID");
						// 根据WPD_OVERPLUS_NUM 可接收数量 WPD_PLAN_NUM 计划数量 更改采购订单状态
						ifchange = changeToExcute(ifchange, detail);
						Map<String, Object> moMap = new HashMap<String, Object>();
						moMap.put("WPD_RECEIVE_NUM", detail.get("WPD_RECEIVE_NUM"));
						moMap.put("WPD_ITEM_SEQ", detail.get("WPD_ITEM_SEQ"));
						moMap.put("WPD_ITEM_CODE", detail.get("WPD_ITEM_CODE"));
						moMap.put("WPD_PLAN_NUM", detail.get("WPD_PLAN_NUM"));
						moMap.put("WPD_SPECIAL", detail.get("WPD_SPECIAL"));
						moMap.put("DATA_AUTH", vmap.get("DEPART_NO").toString());// 组织机构
						moMap.put("DEPT_ID", vmap.get("DEPART_NO").toString());// 组织机构
						tdMap.setColMap(moMap);// 设置基础数据字段值
						tdMap.getColMap().put("EDIT_TIME", date);
						if (inx) {// 添加
							moMap.put("ID", StringUtils.getUUID());
							moMap.put("WPD_PO", vmap.get("WPI_PO"));
							tdMap.getColMap().put("CREATE_TIME", date);
							modelService.save(tdMap);

						} else {// 更新
							// 更新时候判断时候 物料状态是否为 -1
							if ("-1".equals(detail.get("DATA_STATUS"))) {

								String str = "select ID FROM T_WMS_RECEIVE_ITEM WHERE wri_connect_doc =?  AND wri_item_seq = ? and wri_item_code = ? ";
								List<Map<String, Object>> mmlist = new ArrayList<Map<String, Object>>();
								mmlist = modelService.listDataSql(str,
										new Object[] { vmap.get("WPI_PO"), detail.get("WPD_ITEM_SEQ"), detail.get("WPD_ITEM_CODE") });
								if (null != mmlist && mmlist.size() > 0 && mmlist.get(0).containsKey("ID")) {// 存在
									// 不做啥
								} else {// 无关联时候删除
									TableDataMapExt mmMap = new TableDataMapExt();// 数据操作类
									mmMap.setTableName("T_WMS_PO_DETAIL");// 当前操作表为 采购单
									Map<String, Object> ammMap = new HashMap<String, Object>();
									mmMap.setSqlWhere("  and WPD_PO = ? and WPD_ITEM_SEQ = ? and WPD_ITEM_CODE = ?");
									List<Object> delList = new ArrayList<Object>();// 未验证删除清单是否有效过
									delList.add(vmap.get("WPI_PO"));
									delList.add(detail.get("WPD_ITEM_SEQ"));
									delList.add(detail.get("WPD_ITEM_CODE"));
									mmMap.setSqlWhereArgs(delList);
									mmMap.setColMap(ammMap);
									modelService.del(mmMap);// 删除
									continue;// 进入下次循环
								}

							}
							// 此处曾忘记添加 更新条件
							// 本单元开始处已经添加好更新参数，设置更新条件后开始更新
							tdMap.setSqlWhere(" and WPD_PO = ? and WPD_ITEM_CODE = ? AND WPD_ITEM_SEQ = ?");
							List<Object> pieditList = new ArrayList<Object>();
							pieditList.add(vmap.get("WPI_PO"));
							pieditList.add(detail.get("WPD_ITEM_CODE"));
							pieditList.add(detail.get("WPD_ITEM_SEQ"));
							tdMap.setSqlWhereArgs(pieditList);
							modelService.edit(tdMap);
							tdMap.setSqlWhere("");
						}
					}// 采购单更新时候物料单的更新或添加结束

					resmap.put("MODIFY", ++modifyinx);
				}// 采购单更新结束

				if (ifchange) {// 更新采购单状态
					changeSta(vmap, tdMap);
					modelService.edit(tdMap);
					tdMap.setSqlWhere("");
				}

			}// 完成一项采购单的操作

		} catch (Exception e) {
			log.error(e);
			resmap.put("MSG", "FALSE:" + e);// "FALSE:信息解析失败"
			return resmap;
		}

		resmap.put("MSG", "TRUE");// 数据有效且操作顺利完成
		return resmap;

	}

	private boolean changeToExcute(boolean ifchange, Map<String, Object> detail) {

		if (null != detail.get("WPD_OVERPLUS_NUM") && !"".equals(detail.get("WPD_OVERPLUS_NUM"))) {
			String wpdOverNum = detail.get("WPD_OVERPLUS_NUM").toString();
			String wpdPlanNum = detail.get("WPD_PLAN_NUM").toString();
			int wpd_receive_num = Integer.parseInt(wpdPlanNum) - Integer.parseInt(wpdOverNum);
			detail.put("WPD_RECEIVE_NUM", wpd_receive_num);
			if (Integer.parseInt(wpdPlanNum) > Integer.parseInt(wpdOverNum)) {
				ifchange = true;
			}
		}
		return ifchange;
	}

	private void erpChangeSta(Date date, Map<String, Object> vmap, TableDataMapExt tdMap) {
		if ("-1".equals(vmap.get("WPI_STATUS"))) {// 数据-1时判断为关结。说明：采购单状态 1、开立 2、 操作
																							// 3、 关结
			// 修改关结时相关数据
			tdMap.getColMap().put("WPI_CLOSE_MAN", "ERP");
			// tdMap.getColMap().put("WPI_CLOSE_TIME", date);
			tdMap.getColMap().put("WPI_CLOSE_REASON", "ERP");
			tdMap.getColMap().put("WPI_STATUS", "3");
		} else
			// 开立
			tdMap.getColMap().put("WPI_STATUS", "1");
	}

	// 更改状态
	private void changeSta(Map<String, Object> vmap, TableDataMapExt tdMap) {
		tdMap.setTableName("T_WMS_PO_INFO");
		Map<String, Object> changeMap = new HashMap<String, Object>();
		changeMap.put("WPI_STATUS", "2");
		tdMap.setColMap(changeMap);
		tdMap.setSqlWhere("  and WPI_PO = ? and WPI_STATUS != '3' ");
		tdMap.getSqlWhereArgs().clear();// 集合插入时候 清除残留参数释放占用资源
		tdMap.getSqlWhereArgs().add(vmap.get("WPI_PO"));
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
