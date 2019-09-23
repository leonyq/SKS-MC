package com.morelean.aisino.services.webservices.erpwss.erpwssimpl;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
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
import com.morelean.aisino.common.Method;

/**
 * @ClassName:SyncAllotDocInfo
 * @Description: 1.挑库单对应MES中的调拨单 2.销售发货挑库的情况下关联单号需填写销售单号
 *               3.单据类型(销售发货单：DJ11，调拨单：DJ16) 4.调拨单关结后调用ERP接口同步调拨单物料信息
 * @author:mmz
 * @version:1.0
 * @since 2018年4月18日上午1:05:21
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class SyncAllotDocInfo implements IWebService {
	final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

	/*
	 * (non-Javadoc)
	 * @param objs 
	 * @return Map 操作成功 或者 失败：失败信息
	 */
	public Map<String, Object> excute(Object... objs) {
		SAXReader saxReader = new SAXReader();// XML解析
		Map<String, Object> resmap = new HashMap<String, Object>();// 存返回数据
		List<Map<String, Object>> dataList = new ArrayList<Map<String, Object>>();// 存储各个物料单节点信息
		List<String> snList = new ArrayList<String>();// 存储每个物料节点的出库单号，用于出库单状态的判断（详见类说明）
		List<Map<String, Object>> delList = new ArrayList<Map<String, Object>>();// 需删除的物料
		List<Map<String, Object>> docList = new ArrayList<Map<String, Object>>();// 存储进行增/改操作的物料单信息

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
			List<Element> items = root.elements();
			for (Element item : items) {
				Map<String, Object> elemap = new HashMap<String, Object>();
				for (elems = item.elementIterator(); elems.hasNext();) {// 遍历获得xml内容
					obj = (Element) elems.next();
					elemap.put(obj.getName(), obj.getText());// 标签名 和 数据
				}
				dataList.add(elemap);
			}

		} catch (UnsupportedEncodingException | DocumentException e) {
			resmap.put("MSG", "FALSE:XML数据解析失败，请核实数据格式__" + e.getMessage());// "FALSE:XML数据解析失败，请核实数据格式"
			return resmap;
			// e.printStackTrace();
		}

		// 获取XML中有效信息并键入数据值图 docList中

		for (int i = 0; i < dataList.size(); i++) {// 分别存入snList，delList，docList
			int index = 0;// 用于判断数据状态项
			Map<String, Object> vMap = new HashMap<String, Object>();
			for (Entry<String, Object> m : dataList.get(i).entrySet()) {
				if ("DATA_STATUS".equals(m.getKey())) {
					if ("-1".equals(m.getValue())) {
						index = -1;// 进行删除操作
					} else {
						index = 1;
					}
				}
				if ("WAD_DOC_NUM".equals(m.getKey())) {// 单号 
					vMap.put("WAD_DOC_NUM", m.getValue());
				} else if ("WAD_DOC_TYPE".equals(m.getKey())) {// 单号类型
					vMap.put("WAD_DOC_TYPE", m.getValue());
				} else if ("WAD_CUST_CODE".equals(m.getKey())) {// 客户代码
					vMap.put("WAD_CUST_CODE", m.getValue());
				} else if ("WAI_ITEM_SEQ".equals(m.getKey())) {// 项次
					vMap.put("WAI_ITEM_SEQ", m.getValue());
				} else if ("WAI_ITEM_CODE".equals(m.getKey())) {// 物料料号
					vMap.put("WAI_ITEM_CODE", m.getValue());
				} else if ("WAI_PLAN_NUM".equals(m.getKey())) {// 计划数量
					vMap.put("WAI_PLAN_NUM", m.getValue());
				} else if ("WAI_CONNECT_DOC".equals(m.getKey())) {// 关联单号
					vMap.put("WAI_CONNECT_DOC", m.getValue());
				} else if ("WAI_IN_WH".equals(m.getKey())) {// 调入仓库
					vMap.put("WAI_IN_WH", m.getValue());
				} else if ("WAI_OUT_WH".equals(m.getKey())) {// 调入仓库
					vMap.put("WAI_OUT_WH", m.getValue());
				} else if ("WAI_MEMO".equals(m.getKey())) {// 物料备注
					vMap.put("WAI_MEMO", m.getValue());
				} else if ("WAD_DATE".equals(m.getKey())) {// 开单时间
					Date date = null;
					try {
						date = Method.parsetDate(m.getValue().toString(), "yyyyMMdd hhmmss");
					} catch (ParseException e) {
						resmap.put("MSG", "FALSE:" + e.getMessage());
						return resmap;
					}
					vMap.put("WAD_CREATE_TIME", date);
				} else if ("WAD_DISPATCH_SN".equals(m.getKey())) {// 收发类型代码
					vMap.put("WAD_DISPATCH_SN", m.getValue());
				} else if ("LOGISTICS_ID".equals(m.getKey())) {// 物流信息
					vMap.put("LOGISTICS_ID", m.getValue());
				} else if ("CUST_ADDRESS".equals(m.getKey())) {// 收货地址
					vMap.put("CUST_ADDRESS", m.getValue());
				} else if ("WAD_URGENT_FLAG".equals(m.getKey())) {// 加急标志
					vMap.put("WAD_URGENT_FLAG", m.getValue());
				} else if ("DEPART_NO".equals(m.getKey())) {// 倉庫組織代码
					String dept_id = Method.getDeptId(m.getValue().toString());
					if (dept_id == null) {
						resmap.put("MSG", "FALSE:组织机构代码【"+m.getValue()+"】错误");
						return resmap;
					}
					vMap.put("DATA_AUTH", dept_id);
				}

			}

			if (index == 0) {
				resmap.put("MSG", "FALSE:第" + i + "条数据的状态项为空");
			}
			// 必填项非空判断
			if (!vMap.containsKey("WAD_DOC_NUM") || "".equals(vMap.get("WAD_DOC_NUM"))) {
				resmap.put("MSG", "FALSE:出库单号为空");
				return resmap;
			}
			if (!vMap.containsKey("WAD_DOC_TYPE") || "".equals(vMap.get("WAD_DOC_TYPE"))) {
				resmap.put("MSG", "FALSE:出库单类型为空");
				return resmap;
			}
			if (!vMap.containsKey("WAI_ITEM_SEQ") || "".equals(vMap.get("WAI_ITEM_SEQ"))) {
				resmap.put("MSG", "FALSE:物料项次为空");
				return resmap;
			}
			if (!vMap.containsKey("WAI_ITEM_CODE") || "".equals(vMap.get("WAI_ITEM_CODE"))) {
				resmap.put("MSG", "FALSE:物料料号为空");
				return resmap;
			}
			if (!vMap.containsKey("WAI_PLAN_NUM") || "".equals(vMap.get("WAI_PLAN_NUM"))) {
				resmap.put("MSG", "FALSE:计划数量为空");
				return resmap;
			}
			// if (!vMap.containsKey("WAI_CONNECT_DOC") ||
			// "".equals(vMap.get("WAI_CONNECT_DOC"))) {
			// resmap.put("MSG", "FALSE:关联单号为空");
			// return resmap;
			// }
			if (!vMap.containsKey("WAI_IN_WH") || "".equals(vMap.get("WAI_IN_WH"))) {
				resmap.put("MSG", "FALSE:调入仓库为空");
				return resmap;
			}
			if (!vMap.containsKey("WAI_OUT_WH") || "".equals(vMap.get("WAI_OUT_WH"))) {
				resmap.put("MSG", "FALSE:调出仓库为空");
				return resmap;
			}

			/* 开始业务信息录入|需进行数据库操作项 */
			snList.add(vMap.get("WAD_DOC_NUM").toString());// 加入出库单状态判断清单
			if (index == -1) {// 需删除的物料
				delList.add(vMap);
			} else {// 增|改物料
				docList.add(vMap);
			}
		}// 各清单数据添加完成

		/* 数据库层的逻辑处理开始 */
		try {
			// 判断出库单状态
			StringBuffer arraySn = new StringBuffer();
			for (int j = 0; j < snList.size(); j++) {
				if (j == 0)
					arraySn.append(snList.get(j));
				else
					arraySn.append("," + snList.get(j));
			}
			String snListSql = " select WAD_DOC_NUM from T_WMS_ALLOT_DOC where WAD_DOC_NUM  in (?) and WAD_STATUS !='1' ";
			List<Map<String, Object>> statuslist194 = modelService.listDataSql(snListSql, new Object[] { arraySn });
			if (null != statuslist194 && !"".equals(statuslist194) && statuslist194.size() > 0) {
				StringBuffer stb = new StringBuffer();
				for (Map<String, Object> map196 : statuslist194) {// 生成反馈信息
					stb.append(map196.get("WAD_DOC_NUM") + " , ");
				}

				resmap.put("MSG", "FALSE:出库单（" + stb.toString() + ")正在操作，或者已经关结");
				return resmap;
			}// 出库单状态判断结束

			/*
			 * 开始进行数据更新或保存或删除操作
			 */
			TableDataMapExt tdMap = new TableDataMapExt();// 数据操作类
			String delresponse = delItem(modelService, tdMap, delList, resmap);// 进行删除操作
			if (null != delresponse) {// 删除失败 返回失败信息
				resmap.put("MSG", delresponse);
				return resmap;
			}

			changeItem(modelService, tdMap, docList, resmap);// 进行增|改操作

		} catch (Exception e) {
			log.error(e);
			resmap.put("MSG", "FALSE:" + e.getMessage());// "FALSE:信息解析失败"
			return resmap;
		}

		resmap.put("MSG", "TRUE");// 数据有效且操作顺利完成
		return resmap;

	}

	private String delItem(ModelService modelService, TableDataMapExt tdMap, List<Map<String, Object>> list,
			Map<String, Object> resmap) {
		String msg = null;

		/* 判断该物料是否存在于 物料总明细单(T_WMS_RECEIVE_DETAIL)中。如果有，@return FALSE:不能删除有出库总明细的物料 */
		// 获得物料id 数组
		String searchSql = " SELECT ID FROM T_WMS_ALLOT_ITEM WHERE WAI_ITEM_SEQ   = ? AND WAI_DOC_NUM  = ? ";// WAI_ITEM_CODE
																																																						// =
																																																						// ?
																																																						// AND
		ArrayList<String> arl = new ArrayList<String>();// 存物料信息表的物料ID信息
		ArrayList<String> arlcod = new ArrayList<String>();// 存物料信息表的物料code信息
		List<Map<String, Object>> interimList = null;// 临时工
		for (int i = 0; i < list.size(); i++) {
			interimList = modelService.listDataSql(searchSql,
					new Object[] { list.get(i).get("WAI_ITEM_SEQ"), list.get(i).get("WAD_DOC_NUM") });// list.get(i).get("WAI_ITEM_CODE"),
			if (null != interimList && interimList.size() > 0) {// 存在
				arl.add(interimList.get(0).get("ID").toString());
				arlcod.add(list.get(i).get("WAI_ITEM_CODE").toString());
			} else {
				return "FALSE:出库单为：" + list.get(i).get("WAD_DOC_NUM") + ",项次为:" + list.get(i).get("WAI_ITEM_SEQ") + ",物料料号为："
						+ list.get(i).get("WAI_ITEM_CODE") + "的物料不存在物料信息表中，无法删除。";
			}
		}// 物料ID获得完毕

	//判断删除的id有没有明细
		String delsql = "SELECT T.WAD_ITEM_CODE FROM T_WMS_ALLOT_DETAIL  T WHERE T.WAD_ITEM_ID = ?";
		for(int i=0;i<arl.size();i++){
			int count = modelService.execSql(delsql, new Object[] {arl.get(i)});
		    if (count != 0){
		        return ("FALSE:不能删除有入库总明细的物料");
		    }
		}

		// 删除物料信息
		tdMap.setTableName("T_WMS_ALLOT_ITEM");
		for (int i = 0; i < arl.size(); i++) {
			tdMap.setSqlWhere(" and ID='" + arl.get(i) + "'");
			modelService.del(tdMap);
		}
		
		//删除没有关联的仓库单据信息表数据息  即当该单号所关联的物料全部被删除时删除仓库单据信息表数据
		String sql = "DELETE FROM T_WMS_DOC_INFO WHERE WDI_DOC_NUM IN(" +
				"select t.WAD_DOC_NUM from T_WMS_ALLOT_DOC t WHERE NOT exists" +
				"(SELECT 1 FROM T_WMS_ALLOT_ITEM a WHERE a.WAI_DOC_NUM=t.WAD_DOC_NUM))";
	    modelService.execSql(sql, null);
	  //删除没有关联的调拨单信息  即当该单号所关联的物料全部被删除时删除调拨信息
		String sql3 = "DELETE FROM T_WMS_ALLOT_DOC WHERE WAD_DOC_NUM IN(" +
				"select t.WAD_DOC_NUM from T_WMS_ALLOT_DOC t WHERE NOT exists" +
				"(SELECT 1 FROM T_WMS_ALLOT_ITEM a WHERE a.WAI_DOC_NUM=t.WAD_DOC_NUM))";
	    modelService.execSql(sql3, null);
	    
		return msg;
	}

	private String changeItem(ModelService modelService, TableDataMapExt tdMap, List<Map<String, Object>> list,
			Map<String, Object> resmap) {

		String msg = null;
		boolean inx;
		String itemId = null;
		String docId = null;
		int modifyinx = 0;
		int insertinx = 0;
		Map<String, Object> validmap = null;

		for (Map<String, Object> vmap : list) {
			inx = true;

			String searchdocsql = "select id from T_WMS_ALLOT_DOC where WAD_DOC_NUM = ? ";
			List<Map<String, Object>> searchdocList = modelService.listDataSql(searchdocsql, new Object[] { vmap.get("WAD_DOC_NUM")
					.toString() });
			if (null != searchdocList && searchdocList.size() > 0 && searchdocList.get(0).containsKey("ID")
					&& null != searchdocList.get(0).get("ID")) {// 存在
				inx = false;
				docId = searchdocList.get(0).get("ID").toString();
			}
			if (inx) {// 添加
				// 添加出库单
				validmap = new HashMap<String, Object>();
				tdMap.setTableName("T_WMS_ALLOT_DOC");
				validmap.put("ID", StringUtils.getUUID());//
				validmap.put("WAD_DOC_NUM", vmap.get("WAD_DOC_NUM"));// 出库单号
				validmap.put("WAD_DOC_TYPE", vmap.get("WAD_DOC_TYPE"));// 单号类型
				if (vmap.containsKey("WAD_CUST_CODE"))// 客户
					validmap.put("WAD_CUST_CODE", vmap.get("WAD_CUST_CODE"));
				validmap.put("WAD_STATUS", "1");// 状态 1 开立 2，操作中 3 关结
				if (vmap.containsKey("WAD_CREATE_TIME"))// 开单时间
					validmap.put("WAD_CREATE_TIME", vmap.get("WAD_CREATE_TIME"));
				if (vmap.containsKey("DATA_AUTH")) {// 组织机构代码
					validmap.put("DATA_AUTH", vmap.get("DATA_AUTH"));
					validmap.put("DEPT_ID", vmap.get("DATA_AUTH"));
				}
				if (vmap.containsKey("WAD_DISPATCH_SN"))// 收发标志
					validmap.put("WAD_DISPATCH_SN", vmap.get("WAD_DISPATCH_SN"));
				if (vmap.containsKey("WAD_URGENT_FLAG"))// 加急标志
					validmap.put("WAD_URGENT_FLAG", vmap.get("WAD_URGENT_FLAG"));
				if (vmap.containsKey("LOGISTICS_ID"))// 物流信息
					validmap.put("LOGISTICS_ID", vmap.get("LOGISTICS_ID"));
				if (vmap.containsKey("CUST_ADDRESS"))// 收货地址
					validmap.put("CUST_ADDRESS", vmap.get("CUST_ADDRESS"));
				tdMap.setColMap(validmap);
				tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
				tdMap.getColMap().put("CREATE_TIME", DateUtil.getCurDate());

				modelService.save(tdMap);
				resmap.put("INSERT doc", ++insertinx);

				// 添加单据信息
				validmap = new HashMap<String, Object>();
				tdMap.setTableName("T_WMS_DOC_INFO");
				validmap.put("ID", StringUtils.getUUID());
				validmap.put("WDI_DOC_NUM", vmap.get("WAD_DOC_NUM"));// 单据号
				validmap.put("WDI_STATUS", "1");/* 1 */
				if (vmap.containsKey("WAD_URGENT_FLAG"))// 加急标志
					validmap.put("WDI_URGENT_FLAG", vmap.get("WAD_URGENT_FLAG"));// 加紧标识
				validmap.put("T_WMS_DOC_INFO", "N");/* 需加T_WMS_DOC_INFO---ERP同步标识 N */
				if (vmap.containsKey("WAD_CUST_CODE"))// 客户
					validmap.put("WDI_CUST_CODE", vmap.get("WAD_CUST_CODE"));
				validmap.put("WDI_DOC_TYPE", vmap.get("WAD_DOC_TYPE"));// 单号类型
				if (vmap.containsKey("WAD_DISPATCH_SN"))// 收发类型
					validmap.put("WDI_DISPATCH_TYPE", vmap.get("WAD_DISPATCH_SN"));
				if (vmap.containsKey("WDI_CREATE_TIME"))// 开单时间
					validmap.put("WDI_CREATE_TIME", vmap.get("WAD_CREATE_TIME"));
				if (vmap.containsKey("DATA_AUTH"))// 组织机构代码
				{
					validmap.put("DATA_AUTH", vmap.get("DATA_AUTH"));
					validmap.put("DEPT_ID", vmap.get("DATA_AUTH"));
				}
				tdMap.setColMap(validmap);
				tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
				tdMap.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
				modelService.save(tdMap);

				// 添加出库单物料信息
				validmap = new HashMap<String, Object>();
				tdMap.setTableName("T_WMS_ALLOT_ITEM");
				validmap.put("ID", StringUtils.getUUID());
				validmap.put("WAI_DOC_NUM", vmap.get("WAD_DOC_NUM"));// 单据号
				validmap.put("WAI_STATUS", "1");/**/
				validmap.put("WAI_ITEM_CODE", vmap.get("WAI_ITEM_CODE"));
				validmap.put("WAI_ITEM_SEQ", vmap.get("WAI_ITEM_SEQ"));/**/
				validmap.put("WAI_PLAN_NUM", vmap.get("WAI_PLAN_NUM"));/**/
				validmap.put("WAI_IN_WH", vmap.get("WAI_IN_WH"));/**/
				validmap.put("WAI_OUT_WH", vmap.get("WAI_OUT_WH"));/**/
				if (vmap.containsKey("DATA_AUTH"))// 组织机构代码
				{
					validmap.put("DATA_AUTH", vmap.get("DATA_AUTH"));
					validmap.put("DEPT_ID", vmap.get("DATA_AUTH"));
				}
				// validmap.put("WAI_PACK_NUM", packNums[i]);/**/
				// validmap.put("WAI_GIFT_NUM", giftNums[i]);/**/
				if (vmap.containsKey("WAI_CONNECT_DOC"))
					vmap.put("WAI_CONNECT_DOC", vmap.get("WAI_CONNECT_DOC"));/**/
				if (vmap.containsKey("WAI_MEMO"))
					vmap.put("WAI_MEMO", vmap.get("WAI_MEMO"));/**/

				tdMap.setColMap(validmap);
				tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
				tdMap.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
				modelService.save(tdMap);

			} else {// 更新
				// 更新出库单
				validmap = new HashMap<String, Object>();
				tdMap.setTableName("T_WMS_ALLOT_DOC");
				validmap.put("WAD_DOC_TYPE", vmap.get("WAD_DOC_TYPE"));// 单号类型
				if (vmap.containsKey("WAD_SUP_CODE"))// 供应商
					validmap.put("WAD_SUP_CODE", vmap.get("WAD_SUP_CODE"));
				if (vmap.containsKey("WAD_CUST_CODE"))// 客户
					validmap.put("WAD_CUST_CODE", vmap.get("WAD_CUST_CODE"));
				validmap.put("WAD_STATUS", "1");// 状态 1 开立 2，操作中 3 关结
				if (vmap.containsKey("WAD_CREATE_TIME"))// 开单时间
					validmap.put("WAD_CREATE_TIME", vmap.get("WAD_CREATE_TIME"));
				if (vmap.containsKey("DATA_AUTH"))// 组织机构代码
				{
					validmap.put("DATA_AUTH", vmap.get("DATA_AUTH"));
					validmap.put("DEPT_ID", vmap.get("DATA_AUTH"));
				}
				if (vmap.containsKey("WAD_DISPATCH_SN"))// 收发标志
					validmap.put("WAD_DISPATCH_SN", vmap.get("WAD_DISPATCH_SN"));
				if (vmap.containsKey("WAD_URGENT_FLAG"))// 加急标志
					validmap.put("WAD_URGENT_FLAG", vmap.get("WAD_URGENT_FLAG"));
				if (vmap.containsKey("LOGISTICS_ID"))// 物流信息
					validmap.put("LOGISTICS_ID", vmap.get("LOGISTICS_ID"));
				if (vmap.containsKey("CUST_ADDRESS"))// 收货地址
					validmap.put("CUST_ADDRESS", vmap.get("CUST_ADDRESS"));
				tdMap.setColMap(validmap);
				tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
				tdMap.setSqlWhere("  AND id = '" + docId + "'");
				modelService.edit(tdMap);
				resmap.put("MODIFY doc", ++modifyinx);

				// 更新单据信息
				validmap = new HashMap<String, Object>();
				tdMap.setTableName("T_WMS_DOC_INFO");
				validmap.put("WDI_STATUS", "1");
				if (vmap.containsKey("WAD_URGENT_FLAG"))// 加急标志
					validmap.put("WDI_URGENT_FLAG", vmap.get("WAD_URGENT_FLAG"));// 加紧标识
				validmap.put("T_WMS_DOC_INFO", "N");/* 需加T_WMS_DOC_INFO---ERP同步标识 N */
				if (vmap.containsKey("WAD_CUST_CODE"))// 客户
					validmap.put("WDI_CUST_CODE", vmap.get("WAD_CUST_CODE"));
				validmap.put("WDI_DOC_TYPE", vmap.get("WAD_DOC_TYPE"));// 单号类型
				if (vmap.containsKey("WAD_DISPATCH_SN"))// 收发类型
					validmap.put("WDI_DISPATCH_TYPE", vmap.get("WAD_DISPATCH_SN"));
				if (vmap.containsKey("WDI_CREATE_TIME"))// 开单时间
					validmap.put("WDI_CREATE_TIME", vmap.get("WAD_CREATE_TIME"));
				if (vmap.containsKey("DATA_AUTH"))// 组织机构代码
				{
					validmap.put("DATA_AUTH", vmap.get("DATA_AUTH"));
					validmap.put("DEPT_ID", vmap.get("DATA_AUTH"));
				}
				tdMap.setColMap(validmap);
				tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
				tdMap.setSqlWhere("  AND WDI_DOC_NUM = '" + vmap.get("WAD_DOC_NUM") + "' ");// 单据号
				modelService.edit(tdMap);
				resmap.put("MODIFY doc", ++modifyinx);

				inx = true;
				// 判断物料信息是否存在
				String searchSql = " SELECT ID FROM T_WMS_ALLOT_ITEM WHERE  WAI_ITEM_SEQ   = ? AND WAI_DOC_NUM  = ? ";// wri_item_code
																																																									// =
																																																									// ?
																																																									// AND
																																																									// 不做code判断
				List<Map<String, Object>> searchlist = new ArrayList<Map<String, Object>>();
				searchlist = modelService.listDataSql(searchSql, new Object[] { vmap.get("WAI_ITEM_SEQ"), vmap.get("WAD_DOC_NUM") });// vmap.get("WAI_ITEM_CODE"),
				if (null != searchlist && searchlist.size() > 0 && searchlist.get(0).containsKey("ID")
						&& null != searchlist.get(0).get("ID")) {// 存在
					inx = false;// 触发更新操作
					itemId = searchlist.get(0).get("ID").toString();
				}

				if (inx) {// 添加物料

					// 添加出库单物料信息
					validmap = new HashMap<String, Object>();
					tdMap.setTableName("T_WMS_ALLOT_ITEM");
					validmap.put("ID", StringUtils.getUUID());
					validmap.put("WAI_DOC_NUM", vmap.get("WAD_DOC_NUM"));// 单据号
					validmap.put("WAI_STATUS", "1");/**/
					validmap.put("WAI_ITEM_CODE", vmap.get("WAI_ITEM_CODE"));
					validmap.put("WAI_ITEM_SEQ", vmap.get("WAI_ITEM_SEQ"));/**/
					validmap.put("WAI_PLAN_NUM", vmap.get("WAI_PLAN_NUM"));/**/
					// validmap.put("WAI_PACK_NUM", packNums[i]);/**/
					// validmap.put("WAI_GIFT_NUM", giftNums[i]);/**/
					if (vmap.containsKey("WAI_CONNECT_DOC"))
						vmap.put("WAI_CONNECT_DOC", vmap.get("WAI_CONNECT_DOC"));/**/
					if (vmap.containsKey("WAI_MEMO"))
						vmap.put("WAI_MEMO", vmap.get("WAI_MEMO"));/**/
					validmap.put("WAI_IN_WH", vmap.get("WAI_IN_WH"));/**/
					validmap.put("WAI_OUT_WH", vmap.get("WAI_OUT_WH"));/**/
					if (vmap.containsKey("DATA_AUTH"))// 组织机构代码
					{
						validmap.put("DATA_AUTH", vmap.get("DATA_AUTH"));
						validmap.put("DEPT_ID", vmap.get("DATA_AUTH"));
					}
					tdMap.setColMap(validmap);
					tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
					tdMap.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
					modelService.save(tdMap);

				} else {// 修改物料 //当前未接收 出库数量 未进行出库数量和计划数量比较

					// 修改出库单物料信息
					validmap = new HashMap<String, Object>();
					tdMap.setTableName("T_WMS_ALLOT_ITEM");
					validmap.put("WAI_DOC_NUM", vmap.get("WAD_DOC_NUM"));// 单据号
					validmap.put("WAI_STATUS", "1");/**/
					validmap.put("WAI_ITEM_CODE", vmap.get("WAI_ITEM_CODE"));
					validmap.put("WAI_ITEM_SEQ", vmap.get("WAI_ITEM_SEQ"));/**/
					validmap.put("WAI_PLAN_NUM", vmap.get("WAI_PLAN_NUM"));/**/
					// validmap.put("WAI_PACK_NUM", packNums[i]);/**/
					// validmap.put("WAI_GIFT_NUM", giftNums[i]);/**/
					if (vmap.containsKey("WAI_CONNECT_DOC"))
						vmap.put("WAI_CONNECT_DOC", vmap.get("WAI_CONNECT_DOC"));/**/
					if (vmap.containsKey("WAI_MEMO"))
						vmap.put("WAI_MEMO", vmap.get("WAI_MEMO"));/**/

					validmap.put("WAI_IN_WH", vmap.get("WAI_IN_WH"));/**/
					validmap.put("WAI_OUT_WH", vmap.get("WAI_OUT_WH"));/**/
					if (vmap.containsKey("DATA_AUTH"))// 组织机构代码
					{
						validmap.put("DATA_AUTH", vmap.get("DATA_AUTH"));
						validmap.put("DEPT_ID", vmap.get("DATA_AUTH"));
					}
					tdMap.setSqlWhere(" AND ID ='" + itemId + "' ");
					tdMap.setColMap(validmap);
					tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());

					modelService.edit(tdMap);
				}

			}
		}
		return msg;
	}

}
