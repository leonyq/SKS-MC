package com.morelean.aisino.services.webservices.erpwss.erpwssimpl;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.more.fw.core.common.exception.AppException;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.webservice.service.IWebService;
import com.morelean.aisino.common.Method;

/**
 * @ClassName:SyncBomInfo
 * @Description: 用于Bom清单单信息存储 接收参数 msg Bom清单单信息 返回 TRUE 或 FALSE：错误信息
 * @author:mmz
 * @version:1.0
 * @since 2018年4月21日下午8:10:01
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class SyncBomInfo implements IWebService {
	final Log log = LogFactory.getLog(this.getClass());

	private ModelService modelService = com.morelean.aisino.common.Method.modelService;

	/*
	 * (non-Javadoc)
	 * 
	 * @param objs 值对,获取方式objs[n];参数 objs[0]String类型，xml格式。例：
	 * 
	 * @return Map 操作成功 或者 失败：失败信息
	 */
	public Map<String, Object> excute(Object... objs) {
		SAXReader saxReader = new SAXReader();
		Map<String, Object> resmap = new HashMap<String, Object>();// 存返回数据
		List<Map<String, Object>> supList = new ArrayList<Map<String, Object>>();// 存储各个物料信息
		List<Map<String, Object>> validList = new ArrayList<Map<String, Object>>();// 存有效信息
		List<Map<String, Object>> delList = new ArrayList<Map<String, Object>>();// 需删除项目
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
			resmap.put("MSG", "FALSE:XML数据解析失败，请核实数据格式__" + e);
			return resmap;
		}
		// 得到xml的根节点(message)
		Element root = document.getRootElement();
		// 定义子循环体的变量
		Element obj = null;
		List<Element> purchaseOrders = root.elements();// Bom清单list
		// 获得类映射关系规则
		Map<String, Map<String, String>> rulmap = Method.getRuleMap(this.getClass().getSimpleName());
		Map<String, Object> childmap = null;
		String errorMsg = null;
		try {
			Map<String, Object> elemap;
			for (Element supplier : purchaseOrders) {
				elemap = new HashMap<String, Object>();// 存储数据项
				errorMsg = supplier.asXML();
				int index = 0;// 用于判断数据状态项
				getEleMap(rulmap, elemap, supplier);// 获得elemap
				// 必填项验证
				Method.checkEmpty(rulmap.get("reqMap"), elemap);
				initList(supList, delList, elemap);// 将elemap分别存入 suplist delList
			}
			TableDataMapExt tdMap = new TableDataMapExt();// 数据操作类
			List<Object> argsList = new ArrayList<Object>();// 存匹配参数
			// 删除
			del(delList, tdMap, modelService, argsList);
			// 曾改操作
			errorMsg = change(resmap, supList, tdMap, argsList);

		} catch (Exception e) {
			log.error("SynBomInfo:" + e);
			if (null != errorMsg)
				throw new AppException(e.getMessage() + "错误发生在：" + errorMsg);
			else
				throw new AppException(e.getMessage());
		}
		resmap.put("MSG", "TRUE");// 数据有效且操作顺利完成
		return resmap;

	}

	// 根据数据状态分别存入 删除list 和曾改list
	private void initList(List<Map<String, Object>> supList, List<Map<String, Object>> delList, Map<String, Object> elemap) {
		if ("-1".equals(elemap.get("DATA_STATUS"))) {// 需删除的物料
			elemap.remove("DATA_STATUS");
			delList.add(elemap);
		} else {// 增|改物料
			elemap.remove("DATA_STATUS");
			supList.add(elemap);
		}
	}

	/**
	 *  
	 * 
	 * @Description: 根据sulmap中定义规则从supplier(xml解析的原始数据项 )中获得 elemap
	 *               (可进行一次曾改操作的完整的有效的数据体 )，
	 * @param rulmap
	 *          封装了数据处理规则
	 * @param elemap
	 *          封装处理后胡数据
	 * @param supplier
	 *          原始数据
	 * @return
	 * @throws Exception
	 * @author: mmz  @Company:morelean    
	 */
	private void getEleMap(Map<String, Map<String, String>> rulmap, Map<String, Object> elemap, Element supplier) throws Exception {
		Element obj;
		Map<String, Object> childmap;
		for (Iterator elems = supplier.elementIterator(); elems.hasNext();) {// 遍历获得xml内容
			obj = (Element) elems.next();
			if (obj.elements().size() > 0) {// Bom清单子list
				Map<String, Object> map;
				List<Map<String, Object>> elist = new ArrayList<Map<String, Object>>();
				List li = obj.elements();
				for (Object ob : li) {
					map = new HashMap<String, Object>();
					Element o = (Element) ob;
					for (Object e : o.elements()) {// Bom清单详情表
						Element e1 = (Element) e;
						childmap = Method.vtoRefMap(e1.getName(), e1.getText(), rulmap);
						if (null != childmap)
							map.putAll(childmap);
					}
					map.put("CR_TYPE", "2");// 规定类型为 2：机种
					Method.checkEmpty(rulmap.get("reqmap"), map);// 必填项验证
					elist.add(map);
				}
				elemap.put(obj.getName(), elist);// 主MAP添加Bom清单详情表信息
			} else {// Bom清单主表
				childmap = Method.vtoRefMap(obj.getName(), obj.getText(), rulmap);
				if (null != childmap)
					elemap.putAll(childmap);
			}
		}
	}

	/**
	 *  
	 * 
	 * @Description: 增改方法
	 * @param resmap
	 * @param supList
	 * @param tdMap
	 * @param argsList
	 * @return
	 * @throws Exception
	 * @author: mmz  @Company:morelean    
	 */
	private String change(Map<String, Object> resmap, List<Map<String, Object>> supList, TableDataMapExt tdMap,
			List<Object> argsList) throws Exception {
		boolean inx;
		String errorMsg;
		errorMsg = null;// 解析阶段无错 ---设置为null 控制报错时候不添加当行的xml解析
		Date date = DateUtil.getCurDate();// 获得当前时间
		// 开始进行数据更新或保存操作
		int modifyinx = 0;
		int insertinx = 0;
		for (Map<String, Object> vmap : supList) {

			tdMap.setTableName("T_CO_BOM_DETAIL");// Bom物料详情表
			inx = true;// 判断更新或则添加操作
			List<Map<String, Object>> mlist = new ArrayList<Map<String, Object>>();
			mlist = (List<Map<String, Object>>) vmap.get("CBD_ITEM_REPLACES");// 替换料清单
			vmap.remove("CBD_ITEM_REPLACES");
			String sql = "SELECT ID FROM T_CO_BOM_DETAIL  WHERE CB_BOMID = ? and  CBD_ITEM_CODE  = ? ";// 查询是否已存在
			int num = modelService.execSql(sql, new Object[] { vmap.get("CB_BOMID"), vmap.get("CBD_ITEM_CODE") });
			if (num != 0) {// 存在
				inx = false;// 触发更新操作
			}
			if (inx) {// 添加
				vmap.put("ID", StringUtils.getUUID());
				vmap.put("CREATE_TIME", date);
				vmap.put("EDIT_TIME", date);
				tdMap.setColMap(vmap);
				modelService.save(tdMap);// 存储

				// 物料list添加
				tdMap.setTableName("T_CO_ITEM_REPLACE");
				addDetail(tdMap, date, vmap, mlist);
				resmap.put("INSERT", ++insertinx);
			} else {// 更新
				tdMap.setColMap(vmap);
				tdMap.getColMap().put("EDIT_TIME", date);
				tdMap.setSqlWhere("  and CB_BOMID = ? and  CBD_ITEM_CODE  = ?");
				tdMap.getSqlWhereArgs().clear();// 集合插入时候 清除残留参数释放占用资源
				argsList.clear();
				argsList.add(vmap.get("CB_BOMID"));
				argsList.add(vmap.get("CBD_ITEM_CODE"));
				tdMap.setSqlWhereArgs(argsList);
				modelService.edit(tdMap);
				tdMap.setSqlWhere("");

				// 物料list删除后添加
				tdMap.setTableName("T_CO_ITEM_REPLACE");
				String delsql = "delete from T_CO_ITEM_REPLACE where CR_ITEM_MIAN = ? and   cr_type = '2' ";
				int num2 = modelService.execSql(delsql, new Object[] { vmap.get("CBD_ITEM_CODE") });
				if (num2 == -1) {
					throw new AppException("未能成功进行删除物料操作，更新物料信息失败");
				}

				// 添加
				addDetail(tdMap, date, vmap, mlist);
				resmap.put("MODIFY", ++modifyinx);
			}
		}
		return errorMsg;
	}

	/**
	 *  
	 * 
	 * @Description: 添加替代物料
	 * @param tdMap
	 * @param date
	 * @param vmap
	 * @param mlist
	 * @author: mmz  @Company:morelean    
	 */
	private void addDetail(TableDataMapExt tdMap, Date date, Map<String, Object> vmap, List<Map<String, Object>> mlist) {
		for (Map<String, Object> detail : mlist) {
			detail.put("ID", StringUtils.getUUID());
			detail.put("CR_ITEM_MIAN", vmap.get("CBD_ITEM_CODE"));
			detail.put("DEPT_ID", vmap.get("DEPT_ID"));
			detail.put("DATA_AUTH", vmap.get("DATA_AUTH"));
			tdMap.setColMap(detail);
			tdMap.getColMap().put("CREATE_TIME", date);
			tdMap.getColMap().put("EDIT_TIME", date);
			modelService.save(tdMap);

		}
	}

	/**
	 *  
	 * 
	 * @Description: 删除方法
	 * @param delList
	 * @param tdMap
	 * @param modelservice
	 * @param argsList
	 * @throws AppException
	 * @author: mmz  @Company:morelean    
	 */
	public void del(List<Map<String, Object>> delList, TableDataMapExt tdMap, ModelService modelservice, List<Object> argsList)
			throws AppException {
		for (Map<String, Object> vmap : delList) {

			// 删除替代物料
			tdMap.setTableName("T_CO_ITEM_REPLACE");
			tdMap.setSqlWhere(" and  CR_ITEM_MIAN = ? and   cr_type = '2' ");
			tdMap.getSqlWhereArgs().clear();
			tdMap.getSqlWhereArgs().add(vmap.get("CBD_ITEM_CODE"));
			int num = modelService.del(tdMap);
			if (num == -1) {
				throw new AppException("未能成功进行删除物料操作，更新物料信息失败:vamp=" + vmap.toString());
			}
			tdMap.setSqlWhere("");

			// 删除Bom明细单
			tdMap.setTableName("T_CO_BOM_DETAIL");
			tdMap.setSqlWhere("  and CB_BOMID = ? and  CBD_ITEM_CODE  = ?");
			tdMap.getSqlWhereArgs().clear();// 集合插入时候 清除残留参数释放占用资源
			argsList.clear();
			argsList.add(vmap.get("CB_BOMID"));
			argsList.add(vmap.get("CBD_ITEM_CODE"));
			tdMap.setSqlWhereArgs(argsList);
			num = modelService.del(tdMap);
			if (num == -1) {
				throw new AppException("未能成功进行删除物料操作，更新物料信息失败:vmap=" + vmap.toString());
			}
			tdMap.setSqlWhere("");

		}
	}

}
