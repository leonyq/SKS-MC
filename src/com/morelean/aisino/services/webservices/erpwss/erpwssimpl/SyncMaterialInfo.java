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

import com.more.fw.core.common.exception.AppException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.webservice.service.IWebService;
import com.sun.jna.platform.win32.WinCrypt.DATA_BLOB;

/**
 * @ClassName:SyncMaterialInfo
 * @Description: 将erp 传来的 物料信息存入 T_CO_ITEM
 * 
 *               1.T_CO_ITEM表不存在的字段需要新增 2.将获取到的信息存到T_CO_ITEM表，判断已存在ERP ID的依据ERP
 *               ID进行数据更新，空字段不更新，不存在ERP ID的数据依据CI_ITEM_CODE进行数据更新，都不存在的情况下进行数据插入
 *               3.物料大类写入数据字典CI_ITEM_TYPE项，物料中类写入数据字典CI_ITEM_GENRE项
 *               4.CI_MSD根据T_WMS_MSD_CONTROL_RULE表查询WHERE
 *               MCR_GRADE=CI_MSD，查出的MCR_ID填入T_CO_ITEM表的CI_MSD_ID字段
 *               ，并且CI_MSD_FLAG设置为Y 5.超收比率存数字 10=10% 6. CI_OVERCHANGE 关联表中字段
 *               ci_excess_receive 
 *               7.需添加字段 
 *               CI_MANUFACTURER --制造商
 *                CI_STOCK_PERIOD --存储天 
 *                CI_STOCK_PERIOD_KEEP --继续存储天 
 *               CI_MANUFACTURER --制造商
 *               CI_MANUFACTURER_MODEL --制造商型号
 *                CI_3C_FLAG 3C标志 
 *                SAMPLE_CODE 样品承认书编码
 *                 ABC_TYPE 物料A/B/C 类
 * 
 * @author:mmz
 * @version:1.0
 * @see
 * @since 2018年4月3日下午3:19:24
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */

public class SyncMaterialInfo implements IWebService {
	final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.more.fw.webservice.service.IWebService#excute(java.lang.Object[]) 
	 * 
	 * @param objs 值对,获取方式objs[n];参数 objs[0]String类型，xml格式。例：<?xml version="1.0" encoding="utf-8"?><MATERIALS><MATERIAL><CI_ITEM_ID>MMZ_ERP物料ID</CI_ITEM_ID><CI_ITEM_CODE>MMZ_物料编码</CI_ITEM_CODE><CI_ITEM_NAME>MMZ_物料名称</CI_ITEM_NAME><CI_ITEM_SPEC>MMZ_物料规格</CI_ITEM_SPEC><CI_ITEM_TYPE_CODE>MMZ_01</CI_ITEM_TYPE_CODE><CI_ITEM_TYPE_DESC>MMZ_01类型描述</CI_ITEM_TYPE_DESC><CI_ITEM_GENRE_CODE>MMZ_02</CI_ITEM_GENRE_CODE><CI_ITEM_GENRE_DESC>MMZ_02类别描述</CI_ITEM_GENRE_DESC><CI_MIN_PACK>1000</CI_MIN_PACK><CI_UNIT>kg</CI_UNIT><CI_STOCK_CYCLE>10</CI_STOCK_CYCLE><CI_STOCK_PERIOD>10</CI_STOCK_PERIOD><CI_STOCK_PERIOD_KEEP>10</CI_STOCK_PERIOD_KEEP><CI_IQC_FREE>Y</CI_IQC_FREE><CI_ROHS_FLAG>Y</CI_ROHS_FLAG><CI_SIZE>1000</CI_SIZE><CI_OVERCHANGE>Y</CI_OVERCHANGE><CI_OVERRATE>10</CI_OVERRATE><CI_MSD>MSD等级</CI_MSD><CI_MANUFACTURER>制造商</CI_MANUFACTURER><CI_MANUFACTURER_MODEL>制造商型号</CI_MANUFACTURER_MODEL><CI_3C_FLAG>3C标志</CI_3C_FLAG><SAMPLE_CODE>样品承认书编码</SAMPLE_CODE><ABC_TYPE>B</ABC_TYPE><REMARK1></REMARK1><REMARK2></REMARK2><REMARK3></REMARK3><REMARK4></REMARK4><REMARK5></REMARK5><DATA_STATUS></DATA_STATUS></MATERIAL></MATERIALS>
	 * 
	 * @return Map 操作成功 或者 失败：失败信息
	 */
	public Map<String, Object> excute(Object... objs) {
		SAXReader saxReader = new SAXReader();
		Map<String, Object> resmap = new HashMap<String, Object>();// 存返回数据
		List<Map<String, String>> supList = new ArrayList<Map<String, String>>();// 存储各个物料节点信息
		List<Map<String, String>> validList = new ArrayList<Map<String, String>>();// 存储物料有效节点信息
		List<Map<String, String>> typeList = new ArrayList<Map<String, String>>();// 类型信息
		List<Map<String, String>> genreList = new ArrayList<Map<String, String>>();// 类别信息

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

			// 得到xml的根节点(message)
			Element root = document.getRootElement();
			// 定义子循环体的变量
			Element obj = null;
			Iterator elems = null;
			List<Element> suppliers = root.elements();// 物料list
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
		}

		// 获取XML中有效信息并键入数据值图 validList中

		int i = 0;
		for (Map<String, String> supmap : supList) {// 存入validList
			int index = 0;
			Map<String, String> vMap = new HashMap<String, String>();// 存物料信息
			Map<String, String> typeMap = new HashMap<String, String>();// SY_DICT
																																	// 存物料类型/code
																																	// 和 描述/value
			Map<String, String> genreMap = new HashMap<String, String>();// SY_DICT_VAL
																																		// 存物料类别/code
																																		// 和
																																		// 描述/value
			for (Entry<String, String> m : supList.get(i++).entrySet()) {
				if ("DATA_STATUS".equals(m.getKey())) {
					if ("-1".equals(m.getValue())) {
						index = -1;// 该次循环字段不存入实值list
						break;
					}
				}

				if ("CI_ITEM_ID".equals(m.getKey())) {// 物料ID
					vMap.put("ID", m.getValue());
				} else if ("CI_ITEM_CODE".equals(m.getKey())) {// 物料代码
					vMap.put("CI_ITEM_CODE", m.getValue());
				} else if ("CI_ITEM_NAME".equals(m.getKey())) {// 物料名称
					vMap.put("CI_ITEM_NAME", m.getValue());
				} else if ("CI_ITEM_SPEC".equals(m.getKey())) {// 物料规格
					vMap.put("CI_ITEM_SPEC", m.getValue());
				} else if ("CI_ITEM_TYPE_CODE".equals(m.getKey())) {// 大类类型代码
																														// 对应CI_ITEM_TYPE
					vMap.put("CI_ITEM_TYPE", m.getValue());// 类型编码
					typeMap.put("CODE", m.getValue());// 类型编码
				} else if ("CI_ITEM_TYPE_DESC".equals(m.getKey())) {// 类型描述
					typeMap.put("VALUE", m.getValue());// 类型编码值
					typeMap.put("DICT_CODE", "CI_ITEM_TYPE");// 数据字典编码值
					typeMap.put("IS_DISP", "1");// 是否显示
					typeMap.put("IS_SELC", "1");// 是否可用
					
				} else if ("CI_ITEM_GENRE_CODE".equals(m.getKey())) {// 类别编码 对应
																															// CI_ITEM_GENRE
					vMap.put("CI_ITEM_GENRE", m.getValue());// 类别编码
					genreMap.put("CODE", m.getValue());// 类别编码
				} else if ("CI_ITEM_GENRE_DESC".equals(m.getKey())) {
					genreMap.put("VALUE", m.getValue());// 类别值
					genreMap.put("DICT_CODE", "CI_ITEM_GENRE");// 数据字典编码值
					genreMap.put("IS_DISP", "1");// 是否显示
					genreMap.put("IS_SELC", "1");// 是否可用

				} else if ("CI_MIN_PACK".equals(m.getKey())) {// 最小包装量
					vMap.put("CI_MIN_PACK", m.getValue());
				} else if ("CI_UNIT".equals(m.getKey())) {// 单位
					vMap.put("CI_UNIT", m.getValue());
				} else if ("CI_STOCK_CYCLE".equals(m.getKey())) {// 质保期
					vMap.put("CI_STOCK_CYCLE", m.getValue());
				} else if ("CI_STOCK_PERIOD".equals(m.getKey())) {// 存储期 需添加
					vMap.put("CI_STOCK_PERIOD", m.getValue());
				} else if ("CI_STOCK_PERIOD_KEEP".equals(m.getKey())) {// 继续存储期 需添加
					vMap.put("CI_STOCK_PERIOD_KEEP", m.getValue());
				} else if ("CI_IQC_FREE".equals(m.getKey())) {// 是否免检
					vMap.put("CI_IQC_FREE", m.getValue());
				} else if ("CI_ROHS_FLAG".equals(m.getKey())) {// RoHS标志
					vMap.put("CI_ROHS_FLAG", m.getValue());
				} else if ("CI_SIZE".equals(m.getKey())) {// 尺寸
					vMap.put("CI_SIZE", m.getValue());
				} else if ("CI_OVERCHANGE".equals(m.getKey())) {// 是否超收
																												// 对应ci_excess_receive
					vMap.put("CI_EXCESS_RECEIVE", m.getValue());
				} else if ("CI_OVERRATE".equals(m.getKey())) {// 超收比 需添加
					vMap.put("CI_OVERRATE", m.getValue());
				} else if ("CI_MSD".equals(m.getKey())) {// MSD等级
					// CI_MSD根据T_WMS_MSD_CONTROL_RULE表查询WHERE
					// MCR_GRADE=CI_MSD，查出的MCR_ID填入T_CO_ITEM
					// 表的CI_MSD_ID字段，并且CI_MSD_FLAG设置为Y
					Object o = getMcrId(modelService,m.getValue());
					if (null!=o){
						vMap.put("CI_MSD_ID", o.toString());
						vMap.put("CI_MSD_FLAG", "Y");						
					}else vMap.put("CI_MSD_ID", "NONONO");
					
				} else if ("CI_MANUFACTURER".equals(m.getKey())) {// 制造商，表中需添加
					vMap.put("CI_MANUFACTURER", m.getValue());
				} else if ("CI_MANUFACTURER_MODEL".equals(m.getKey())) {// 制造商型号 表中需添加
					vMap.put("CI_MANUFACTURER_MODEL", m.getValue());
				} else if ("CI_3C_FLAG".equals(m.getKey())) {// 3C标志 需添加
					vMap.put("CI_3C_FLAG", m.getValue());
				} else if ("SAMPLE_CODE".equals(m.getKey())) {// 样品承认书编码 需添加
					vMap.put("SAMPLE_CODE", m.getValue());
				} else if ("ABC_TYPE".equals(m.getKey())) {// 物料 A /B/ C 类 需添加
					vMap.put("ABC_TYPE", m.getValue());
				}

			}
			if (index == 0) {// 信息状态为有效,在有效List中添加 Vmap
				// 非空判断
				if (!vMap.containsKey("ID") || "".equals(vMap.get("ID"))) {
					resmap.put("MSG", "FALSE:物料ID为空");
					return resmap;
				}
				if (!vMap.containsKey("CI_ITEM_CODE") || "".equals(vMap.get("CI_ITEM_CODE"))) {
					resmap.put("MSG", "FALSE:物料代码为空");
					return resmap;
				}
				if (!vMap.containsKey("CI_ITEM_NAME") || "".equals(vMap.get("CI_ITEM_NAME"))) {
					resmap.put("MSG", "FALSE:物料名字为空");
					return resmap;
				}
				if (!vMap.containsKey("CI_ITEM_SPEC") || "".equals(vMap.get("CI_ITEM_SPEC"))) {
				//	resmap.put("MSG", "FALSE:物料规格为空");
				 vMap.put("CI_ITEM_SPEC", vMap.get("CI_ITEM_NAME"));
				 	//					return resmap;
				}
		
				validList.add(vMap);// 添加物料信息
				typeList.add(typeMap);// 添加类型信息
				genreList.add(genreMap);// 添加类别信息
			}
		}

		// 开始进行数据更新或保存操作
		TableDataMapExt tdMap = new TableDataMapExt();// 数据操作类
		try {
			tdMap.setTableName("T_CO_ITEM");// 物料表信息录入
			dataSolve(resmap, validList, tdMap);
			tdMap.setTableName("SY_DICT_VAL");// 物料类型表
			dataSolve2(resmap, typeList, tdMap);
			tdMap.setTableName("SY_DICT_VAL");// 物料类别表
			dataSolve3(resmap, genreList, tdMap);

		} catch (Exception e) {
			log.error("************MMZ_SyncMateria***********\n" + e);
	    throw new AppException(e.getMessage());
		}

		resmap.put("MSG", "TRUE");// 数据有效且操作顺利完成
		return resmap;

	}

	private void dataSolve(Map<String, Object> resmap, List<Map<String, String>> validList, TableDataMapExt tdMap) {
		boolean inx;
		int modifyinx = 0;
		
		int insertinx = 0;
		for (Map<String, String> vmap : validList) {
			inx = true;
			int index = 0;
			tdMap.setColMap(vmap);// 设置数据键值图
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			String sql = "select id from T_CO_ITEM where ID =?";// 查询是否已存在
			list = modelService.listDataSql(sql, new Object[] { vmap.get("ID") });
			if (null != list && list.size() > 0 && list.get(0).containsKey("ID")) {// 存在
				index = 1;
				inx = false;// 触发更新操作
			} else {
				sql = "select id from T_CO_ITEM where CI_ITEM_CODE =?";// 查询是否已存在
				list = modelService.listDataSql(sql, new Object[] { vmap.get("CI_ITEM_CODE") });
				if (null != list && list.size() > 0 && list.get(0).containsKey("ID")) {// 存在
					inx = false;// 触发更新操作
				}
			}
			tdMap.getColMap().put("edit_time", DateUtil.getCurDate());
			if (inx) {// 添加
			//	vmap.put("id", StringUtils.getUUID());// CommMethod.addSysDefCol(testMap,
				tdMap.getColMap().put("create_time", DateUtil.getCurDate());
   try{
				modelService.save(tdMap);
	
  }catch(Exception e){
	 Map m = vmap;
	 throw new AppException("错误发生在："+m.toString()+"\n"+"错误信息："+e.getMessage());
}
				resmap.put("INSERT", ++insertinx);

			} else {// 更新

				if (index == 0) {// 不存在该ID
					tdMap.setSqlWhere("  and CI_ITEM_CODE = ?");
					tdMap.getSqlWhereArgs().clear();// 集合插入时候 清除残留参数释放占用资源
					tdMap.getSqlWhereArgs().add(vmap.get("CI_ITEM_CODE"));
				} else {
					tdMap.setSqlWhere("  and ID= ?");
					tdMap.getSqlWhereArgs().clear();// 集合插入时候 清除残留参数释放占用资源
					tdMap.getSqlWhereArgs().add(vmap.get("ID"));
				}
				try{
					modelService.edit(tdMap);
				}catch(Exception e){
					Map m = vmap;
					throw new AppException("错误发生在："+m.toString()+"\n"+"错误信息："+e.getMessage());
				}
				resmap.put("MODIFY", ++modifyinx);
			}
		}
	}

	private void dataSolve2(Map<String, Object> resmap, List<Map<String, String>> validList, TableDataMapExt tdMap) {
		boolean inx;
		int modifyinx = 0;
		int insertinx = 0;
		for (Map<String, String> vmap : validList) {
			inx = true;
			tdMap.setColMap(vmap);// 设置数据键值图
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			String sql = "select DICT_VAL_ID from SY_DICT_VAL where DICT_CODE ='CI_ITEM_TYPE' AND CODE = ? ";// 查询是否已存在
			list = modelService.listDataSql(sql, new Object[] { vmap.get("CODE") });
			if (null != list && list.size() > 0 && list.get(0).containsKey("DICT_VAL_ID")) {// 存在
				inx = false;//不添加
			}
			if (inx) {// 添加
				
				sql = "select count(DICT_VAL_ID) CNT from SY_DICT_VAL where DICT_CODE='CI_ITEM_TYPE' ";
				list = modelService.listDataSql(sql);
				int size = Integer.parseInt(list.get(0).get("CNT").toString());
				vmap.put("disp_indx", String.valueOf(++size));
				vmap.put("DICT_VAL_ID", StringUtils.getUUID());
			try{
				modelService.save(tdMap);				
			}catch(Exception e){
				 Map m = vmap;
				 throw new AppException("错误发生在："+m.toString()+"\n"+"错误信息："+e.getMessage());

			}
				
				resmap.put("INSERT2", ++insertinx);

			} 
		}
	}

	private void dataSolve3(Map<String, Object> resmap, List<Map<String, String>> validList, TableDataMapExt tdMap) {
		boolean inx;
		int modifyinx = 0;
		int insertinx = 0;
		for (Map<String, String> vmap : validList) {
			inx = true;
			tdMap.setColMap(vmap);// 设置数据键值图
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			String sql = "select DICT_VAL_ID from SY_DICT_VAL where DICT_CODE='CI_ITEM_GENRE' AND CODE =?";// 查询是否已存在
			list = modelService.listDataSql(sql, new Object[] { vmap.get("CODE") });
			if (null != list && list.size() > 0 && list.get(0).containsKey("DICT_VAL_ID")) {// 存在
				inx = false;// 不添加
			} 
			if (inx) {// 添加
				
				sql = "select count(DICT_VAL_ID) CNT from SY_DICT_VAL where DICT_CODE='CI_ITEM_GENRE' ";
				list = modelService.listDataSql(sql);
				int size = Integer.parseInt(list.get(0).get("CNT").toString());
				
				vmap.put("DICT_VAL_ID", StringUtils.getUUID());
				vmap.put("disp_indx", String.valueOf(++size));
				try{
					 modelService.save(tdMap);
				}catch(Exception e){
					 Map m = vmap;
					throw new AppException("错误发生在："+m.toString()+"\n"+"错误信息："+e.getMessage());
				}
				resmap.put("INSERT3", ++insertinx);

			} 
		}
	}
	public Object getMcrId(ModelService ms , Object o){
		Object mcrId = null;
		String sql = "  SELECT WSR_RULE_SN FROM T_WMS_MSD_RULE WHERE WSR_RULE_NAME  =  ? ";
		List<Map<String,Object>> list= ms.listDataSql(sql,new Object[]{o});
		if(null!=list&&list.size()>0){
			mcrId =list.get(0).get("WSR_RULE_SN");
		}
		return mcrId;
	}
}
