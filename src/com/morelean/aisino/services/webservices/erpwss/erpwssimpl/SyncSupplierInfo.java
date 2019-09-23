package com.morelean.aisino.services.webservices.erpwss.erpwssimpl;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import com.sun.jna.platform.win32.WinCrypt.DATA_BLOB;

/**
 * @ClassName:SaveSupplierinfServiceImpl
 * @Description: 供应商数据存储接口实现类 ，传入参数为XML字符串 返回参数 TRUE 或者 FALSE:信息
 * @author:mmz
 * @version:1.0
 * @see
 * @since 2018年3月28日上午12:55:42
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class SyncSupplierInfo implements IWebService {
	final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.more.fw.webservice.service.IWebService#excute(java.lang.Object[]) 
	 * 
	 * @param objs 值对,获取方式objs[n];参数 objs[0]String类型，xml格式。例：<?xml version=\"1.0\"asf  adf  encoding=\"GBK\"?><SUPPLIERS><SUPPLIER><SUPPLIER_CODE>供应商编码</SUPPLIER_CODE><SUPPLIER_NAME>供应商名称</SUPPLIER_NAME><SUPPLIER_SHORTNAME>供应商简称</SUPPLIER_SHORTNAME><REMARK1></REMARK1><REMARK2></REMARK2><REMARK3></REMARK3><REMARK4></REMARK4><REMARK5></REMARK5><DATA_STATUS></DATA_STATUS></SUPPLIER></SUPPLIERS>
	 * 
	 * @return Map 操作成功 或者 失败：失败信息
	 */
	
	public Map<String, Object> excute(Object... objs) {
//		Map<String, Object> map = new HashMap();// 存xml数据
		// map.put("name","this is say hellow :"+objs[0]);
		SAXReader saxReader = new SAXReader();
		Map<String, Object> resmap = new HashMap<String, Object>();// 存返回数据
//		Map<String, Object> validMap = new HashMap<String, Object>();// 存表单数据
		List<Map<String, String>> supList = new ArrayList<Map<String, String>>();// 存储各个供应商节点信息
		List<Map<String, String>> validList = new ArrayList<Map<String, String>>();// 存储供应商有效节点信息

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

			String xmlMsg = objs[0].toString();
			// String codRule = comp(xmlMsg);//截取编码规则

			document = reader.read(new ByteArrayInputStream(xmlMsg.getBytes("UTF-8")));// GBK
			// Element.asXML方法，获得包括该标签的所有XML数据
			// root.element("SUPPLIER").asXML();//查看信息

			// 得到xml的根节点(message)
			Element root = document.getRootElement();
			// 定义子循环体的变量
			Element obj = null;
			Iterator elems = null;
			List<Element> suppliers = root.elements();// 供应商list
			for (Element supplier : suppliers) {
				Map<String, String> elemap = new HashMap<String, String>();
				for (elems = supplier.elementIterator(); elems.hasNext();) {// 遍历获得xml内容
					obj = (Element) elems.next();
					elemap.put(obj.getName(), obj.getText());// 标签名 和 数据
				
				}
				supList.add(elemap);
			}

		} catch (UnsupportedEncodingException | DocumentException e) {
			resmap.put("MSG", "FALSE:XML数据解析失败，请核实数据格式__" + e.getMessage());// "FALSE:XML数据解析失败，请核实数据格式"
			return resmap;
			// e.printStackTrace();
		}

		// 获取XML中有效信息并键入数据值图 validList中

		int i =0;
		for (Map<String, String> supmap : supList) {// 存入validList
			int index = 0;
			Map<String, String> vMap = new HashMap<String, String>();
			for (Entry<String, String> m : supList.get(i++).entrySet()) {
				if ("DATA_STATUS".equals(m.getKey())) {
					if ("-1".equals(m.getValue())) {
						index = -1;
						break;
					}
				}
				if ("SUPPLIER_CODE".equals(m.getKey())) {
					vMap.put("SUPPLIER_CODE", m.getValue());
				} else if ("SUPPLIER_NAME".equals(m.getKey())) {
					vMap.put("SUPPLIER_NAME", m.getValue());
				} else if ("SUPPLIER_SHORTNAME".equals(m.getKey())) {
					vMap.put("SUPPLIER_SHORTNAME", m.getValue());
				}

			}
			if (index == 0) {// 信息状态为有效,在有效List中添加 Vmap
				// 非空判断
				if (!vMap.containsKey("SUPPLIER_CODE") || "".equals(vMap.get("SUPPLIER_CODE"))) {
					resmap.put("MSG", "FALSE:供应商代码为空");
					return resmap;
				}
				if (!vMap.containsKey("SUPPLIER_NAME") || "".equals(vMap.get("SUPPLIER_NAME"))) {
					resmap.put("MSG", "FALSE:供应商名字为空");
					return resmap;
				}
				validList.add(vMap);// 添加信息
			}

		}

		// 数据值图中插入数据
		/*
		 * 
		 * validMap.put("SUPPLIER_CODE", map.get("SUPPLIER_CODE"));//供应商代码
		 * validMap.put("SUPPLIER_NAME", map.get("SUPPLIER_NAME"));//名称
		 * validMap.put("SUPPLIER_SHORTNAME", map.get("SUPPLIER_SHORTNAME"));//简称
		 */
		
		// 开始进行数据更新或保存操作
		TableDataMapExt tdMap = new TableDataMapExt();// 数据操作类
		tdMap.setTableName("T_CO_SUPPLIER");// 设置表名
		try {
			int modifyinx = 0;
			int insertinx = 0;
			for (Map<String, String> vmap : validList) {
				inx = true;
				tdMap.setColMap(vmap);// 设置数据键值图
				String sql = "select id from T_CO_SUPPLIER where supplier_code =?";// 查询是否已存在
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				list = modelService.listDataSql(sql, new Object[] { vmap.get("SUPPLIER_CODE") });
				resmap.put(vmap.get("SUPPLIER_CODE")+":"+insertinx,"SUPPLIER_CODE");
				if (null != list && list.size() > 0&&list.get(0).containsKey("ID")) {// 存在
					inx = false;// 触发更新操作
				}
				if (inx) {// 添加
					vmap.put("id", StringUtils.getUUID());// CommMethod.addSysDefCol(testMap,
					tdMap.getColMap().put("edit_time", DateUtil.getCurDate());
					tdMap.getColMap().put("create_time", DateUtil.getCurDate());
					modelService.save(tdMap);
					resmap.put("INSERT",++insertinx);
				} else {// 更新
					tdMap.getColMap().put("edit_time", DateUtil.getCurDate());
					tdMap.setSqlWhere("  and SUPPLIER_CODE = ?");
					tdMap.getSqlWhereArgs().clear();//集合插入时候 清除残留参数释放占用资源
					tdMap.getSqlWhereArgs().add(vmap.get("SUPPLIER_CODE"));
					modelService.edit(tdMap);
					resmap.put("MODIFY",++modifyinx);
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

	public String comp(String str) {// 字符截取
		Pattern p = Pattern.compile("\t|\r|\n\\s");
		Matcher m = p.matcher(str);
		str = m.replaceAll("");
		// str = str.replaceAll(" +", " ");
		int a = str.indexOf("encoding=\"") + "encoding=\"".length();
		int b = str.indexOf("\"?>");
		return str.substring(a, b);
		
	}

}
