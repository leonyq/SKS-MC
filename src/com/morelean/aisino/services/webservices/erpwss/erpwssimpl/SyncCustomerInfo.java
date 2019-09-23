package com.morelean.aisino.services.webservices.erpwss.erpwssimpl;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.webservice.service.IWebService;

/**
 * @ClassName:SyncCustomerInfo
 * @Description:客服信息存储接口实现类
 * @author:mmz
 * @version:1.0
 * @since 2018年4月3日上午4:30:05
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class SyncCustomerInfo implements IWebService {
	final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.more.fw.webservice.service.IWebService#excute(java.lang.Object[]) 
	 * 
	 * @param objs 值对,获取方式objs[n]; 参数 objs[0]String类型，xml格式。例：<?xml version="1.0" encoding="utf-8"?><CUSTOMERS><CUSTOMER><CUST_CODE>客户编号001</CUST_CODE><CUSTOMER>名称1</CUSTOMER><CUST_ABBREVIATION>客户简称1</CUST_ABBREVIATION><MEMO></MEMO><CUST_ADDRESS>客户地址1</CUST_ADDRESS><REMARK1></REMARK1><REMARK2></REMARK2><REMARK3></REMARK3><REMARK4></REMARK4><REMARK5></REMARK5><DATA_STATUS>数据状态</DATA_STATUS></CUSTOMER><CUSTOMER><CUST_CODE>客户编号002</CUST_CODE><CUSTOMER>名称2</CUSTOMER><CUST_ABBREVIATION>客户简称2</CUST_ABBREVIATION><MEMO></MEMO><CUST_ADDRESS>客户地址2</CUST_ADDRESS><REMARK1></REMARK1><REMARK2></REMARK2><REMARK3></REMARK3><REMARK4></REMARK4><REMARK5></REMARK5><DATA_STATUS>数据状态</DATA_STATUS></CUSTOMER></CUSTOMERS>
	 * 
	 * @return Map 操作成功 或者 失败：失败信息
	 */
	public Map<String, Object> excute(Object... objs) {
		SAXReader saxReader = new SAXReader();// XML解析者
		Map<String, Object> resmap = new HashMap<String, Object>();// 存返回数据
		List<Map<String, String>> custList = new ArrayList<Map<String, String>>();// 存储各个用户节点信息
		List<Map<String, String>> validList = new ArrayList<Map<String, String>>();// 存储用户节点中有效信息

		// 创建xml解析对象
		SAXReader reader = new SAXReader();
		// 定义一个文档
		Document document = null;
		boolean inx = true;// 操作依据 文档解析时，当false返回失败信息。 开始数据操作时，当 false进行更新操作
		// 将字符串转换为
		try {
			// 获取数据编码方式 encoding="  "?>
			if (null == objs || null == objs[0] || "".equals(objs[0])) {
				resmap.put("MSG", "数据信息为空");
				return resmap;
			}

			// 读取信息内容
			String xmlMsg = objs[0].toString();
			document = reader.read(new ByteArrayInputStream(xmlMsg.getBytes("UTF-8")));

			// 得到xml的根节点(message)
			Element root = document.getRootElement();
			// 定义子循环体的变量
			Element obj = null;
			Iterator elems = null;
			List<Element> customers = root.elements();
			for (Element customer : customers) {
				Map<String, String> elemap = new HashMap<String, String>();
				for (elems = customer.elementIterator(); elems.hasNext();) {// 遍历获得xml内容
					obj = (Element) elems.next();
					elemap.put(obj.getName(), obj.getText());// 标签名 和 数据

				}
				custList.add(elemap);
			}

		} catch (UnsupportedEncodingException | DocumentException e) {
			resmap.put("MSG", "FALSE:XML数据解析失败，请核实数据格式__" + e.getMessage());// "FALSE:XML数据解析失败，请核实数据格式"
			return resmap;
			// e.printStackTrace();
		}

		// 获取XML中有效信息并键入数据值图 validList中

		int i = 0;
		for (Map<String, String> supmap : custList) {// 存入validList
			int index = 0;
			Map<String, String> vMap = new HashMap<String, String>();
			for (Entry<String, String> m : custList.get(i++).entrySet()) {
				if ("DATA_STATUS".equals(m.getKey())) {
					if ("-1".equals(m.getValue())) {
						vMap.put("DATA_STATUS", "N");
					}else{
						vMap.put("DATA_STATUS", "Y");
					}
					continue;
				}
				if ("CUST_CODE".equals(m.getKey())) {// 客户代码
					vMap.put("CUST_CODE", m.getValue());
				} else if ("CUSTOMER".equals(m.getKey())) {// 客户
					vMap.put("CUSTOMER", m.getValue());
				} else if ("CUST_ABBREVIATION".equals(m.getKey())) {// 简称
					vMap.put("CUST_ABBREVIATION", m.getValue());
				} else if ("MEMO".equals(m.getKey())) {// 备注
					vMap.put("MEMO", m.getValue());
				} else if ("CUST_ADDRESS".equals(m.getKey())) {// 地址
					vMap.put("CUST_ADDRESS", m.getValue());
				}

			}
			if (index == 0) {// 信息状态为有效,在有效List中添加 Vmap
				// 非空判断
				if (!vMap.containsKey("CUST_CODE") || "".equals(vMap.get("CUST_CODE"))) {
					resmap.put("MSG", "FALSE:客户代码为空");
					return resmap;
				}
				if (!vMap.containsKey("CUSTOMER") || "".equals(vMap.get("CUSTOMER"))) {
					resmap.put("MSG", "FALSE:客户名字为空");
					return resmap;
				}
				validList.add(vMap);// 添加信息
			}

		}

		// 开始进行数据更新或保存操作
		TableDataMapExt tdMap = new TableDataMapExt();// 数据操作类
		tdMap.setTableName("T_CO_CUSTOMER");// 设置表名
		try {
			int modifyinx = 0;
			int insertinx = 0;
			for (Map<String, String> vmap : validList) {
				inx = true;
				tdMap.setColMap(vmap);// ***设置数据键值图****
				String sql = "select id from T_CO_CUSTOMER where CUST_CODE =?";// 查询是否已存在
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				list = modelService.listDataSql(sql, new Object[] { vmap.get("CUST_CODE") });
				resmap.put(vmap.get("CUST_CODE") + ":" + insertinx, "CUST_CODE");
				if (null != list && list.size() > 0 && list.get(0).containsKey("ID")) {// 存在
					inx = false;// 触发更新操作
				}
				if (inx) {// 添加
					vmap.put("id", StringUtils.getUUID());// CommMethod.addSysDefCol(testMap,
					tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
					tdMap.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
					modelService.save(tdMap);
					resmap.put("INSERT", ++insertinx);
				} else {// 更新
					tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
					tdMap.setSqlWhere("  AND CUST_CODE = ?");
					tdMap.getSqlWhereArgs().clear();// 集合插入时候 清除残留参数释放占用资源
					tdMap.getSqlWhereArgs().add(vmap.get("CUST_CODE"));
					modelService.edit(tdMap);
					resmap.put("MODIFY", ++modifyinx);
				}
			}
		} catch (Exception e) {
			log.error(e);
			resmap.put("MSG", "FALSE:" + e.getMessage());// "FALSE:信息解析失败"
			return resmap;
		}

		resmap.put("MSG", "TRUE");// 数据有效且操作顺利完成
		return resmap;

	}

}
