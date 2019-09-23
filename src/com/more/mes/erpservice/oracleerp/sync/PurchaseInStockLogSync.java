
package com.more.mes.erpservice.oracleerp.sync;


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
import java.util.regex.Pattern;

import com.alibaba.fastjson.JSON;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.webservice.service.IWebService;

/**
 * ORACLE ERP
 * @ClassName:SyncPurchaseOrderInfo
 * @Description: 采购入库单日志信息存储 接收参数 msg 
 * @author:mmz
 * @version:1.0
 * @since 2018年3月29日下午8:10:01
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */

public class PurchaseInStockLogSync implements IWebService {
	final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");
	
	public Map<String, Object> excute(Object... objs) {

		  String Only = StringUtils.getUUID();
			Map<String, Object> resmap = new HashMap<String, Object>();// 存返回数据
			List<Map<String, Object>> supList = new ArrayList<Map<String, Object>>();// 存储各个物料信息
			List<Map<String, Object>> validList = new ArrayList<Map<String, Object>>();// 存储用户节点中有效信息

			// 创建xml解析对象
			SAXReader reader = new SAXReader();
			// 定义一个文档
			Document document = null;
			boolean inx = true;// 操作依据 文档解析时，当false返回失败信息。 开始数据操作时，当 false进行更新操作
			// 将字符串转换为

			String xmlMsg = objs[0].toString();

			try {
				TableDataMapExt tdMap3 = new TableDataMapExt();
				tdMap3.setTableName("T_CO_ERPLOG");// 设置表名
				//tdMap3.getColMap().put("MESJASON", JSON.toJSON(xmlMsg));
				tdMap3.getColMap().put("ERPJASON", xmlMsg);
				tdMap3.getColMap().put("ID", Only);// ID
				modelService.save(tdMap3);
				
				   document = reader.read(new ByteArrayInputStream(xmlMsg.getBytes("UTF-8")));
				
			} catch (UnsupportedEncodingException | DocumentException e) {
				   resmap.put("MSG", "NG:XML数据解析失败，请核实数据格式__" + e);// "FALSE:XML数据解析失败，请核实数据格式"
				   return resmap;
			}
			
			try {

				int i = 0;
				for (Map<String, Object> supmap : supList) {// 存入validList
					int index = 0;
					Map<String, Object> vMap = new HashMap<String, Object>();
					for (Entry<String, Object> m : supList.get(i++).entrySet()) {
						
						if ("ERP_DOC".equals(m.getKey())) {// 员工号
							vMap.put("ERP_DOC", m.getValue());
						} else if ("LOT_NUMBER".equals(m.getKey())) {// 姓名
							vMap.put("LOT_NUMBER", m.getValue());
						}  else if ("PRODUCTCOUNT".equals(m.getKey())) {// 邮箱
							vMap.put("PRODUCTCOUNT", m.getValue());
						}else if ("PRODUCTDATE".equals(m.getKey())) {// 电话
							vMap.put("PRODUCTDATE", m.getValue());
						} 
					}
					validList.add(vMap);			
					

				}
				
				// 开始进行数据更新或保存操作
				TableDataMapExt tdMap = new TableDataMapExt();// 数据操作类
				tdMap.setTableName("SY_USER");// 设置表名
					int modifyinx = 0;
					int insertinx = 0;
					for (Map<String, Object> vmap : validList) {
						inx = true;
						tdMap.setColMap(vmap);// ***设置数据键值图****
						String sql = "select id from SY_USER where LOGIN_NAME =?";// 查询是否已存在
						List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
						list = modelService.listDataSql(sql, new Object[] { vmap.get("LOGIN_NAME") });
						if (null != list && list.size() > 0 && list.get(0).containsKey("ID")) {// 存在
							inx = false;// 触发更新操作
						}
						if (inx) {// 添加
							vmap.put("id", StringUtils.getUUID());
							tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
							tdMap.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
							modelService.save(tdMap);
							resmap.put("INSERT", ++insertinx);
						} else {// 更新
							tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
							tdMap.setSqlWhere("  AND LOGIN_NAME = ?");
							tdMap.getSqlWhereArgs().clear();// 集合插入时候 清除残留参数释放占用资源
							tdMap.getSqlWhereArgs().add(vmap.get("LOGIN_NAME"));
							modelService.edit(tdMap);
							resmap.put("MODIFY", ++modifyinx);
						}
					}
				} catch (Exception e) {
					log.error(e);
					resmap.put("MSG", "NG:" + e.getMessage());// "FALSE:信息解析失败"
					TableDataMapExt tdMap2 = new TableDataMapExt();
					tdMap2.setTableName("T_CO_ERPLOG");// 设置表名
					tdMap2.getColMap().put("ERPJASON", JSON.toJSON(resmap));
					modelService.save(tdMap2);
					return resmap;
				}

				TableDataMapExt tdMap3 = new TableDataMapExt();
				tdMap3.setTableName("T_CO_ERPLOG");// 设置表名
				tdMap3.getColMap().put("ERPJASON", JSON.toJSON(resmap));
				modelService.save(tdMap3);
			
				resmap.put("MSG", "OK");// 数据有效且操作顺利完成
				return resmap;
	}	

}
