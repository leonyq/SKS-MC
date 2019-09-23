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
	 * @ClassName:SyncInStockDocInfo
	 * @Description: 出库单接口实现类
	 *  接收xml格式数据（出库物料信息清单），进行信息处理。当前处理策略是:  
	 *  1. 首先判断所有传入数据的出库单是否存在于已有表单中，同时查询该出库单状态。如果发现 WDI_STATUS（出库单状态） 不为1 （开立）
	 *     则进行返回 false：出库单号XXX正在处理中，不可进行操作。
	 *      ———— 操作方法：将出库单号统一存入 ，出库单 snList(java.util.List) 统一判断
	 *  2. 然后处理data_status 为 -1 的数据  进行物料删除操作，若删除后 单据，出库单信息下无物料信息则同时进行两者的删除工作
	 *   	  ———— 操作方法：存入delList 进行逐条判断删除
	 *  3. 进行数据添加，修改操作。分别对 （出库单表 T_WMS_OUTSTOCK_DOC   出库单据信息表 T_WMS_DOC_INFO  出庫料号详情表 T_WMS_OUTSTOCK_ITEM ）进行存入/修改 操作
	 *      ———— 操作方法：存入docList 遍历 List 对每条数据进行单独的插入，修改（效率低）
	 * @author:mmz
	 * @version:1.0
	 * @since 2018年4月17日上午0:19:30
	 * @Copyright: Copyright (c) 2018
	 * @Company: morelean
	 */
	public class SyncOutStockDocInfo implements IWebService {
		final Log log = LogFactory.getLog(this.getClass());
		private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

		 /*
		 * (non-Javadoc)
		 * @param objs 值对,获取方式objs[n]; 参数 objs[0]String类型，xml格式。例：<?xml version="1.0" encoding="utf-8"?><items><item><CUST_CODE>客户编号001</CUST_CODE><item>名称1</item><CUST_ABBREVIATION>客户简称1</CUST_ABBREVIATION><MEMO></MEMO><CUST_ADDRESS>客户地址1</CUST_ADDRESS><REMARK1></REMARK1><REMARK2></REMARK2><REMARK3></REMARK3><REMARK4></REMARK4><REMARK5></REMARK5><DATA_STATUS>数据状态</DATA_STATUS></item><item><CUST_CODE>客户编号002</CUST_CODE><item>名称2</item><CUST_ABBREVIATION>客户简称2</CUST_ABBREVIATION><MEMO></MEMO><CUST_ADDRESS>客户地址2</CUST_ADDRESS><REMARK1></REMARK1><REMARK2></REMARK2><REMARK3></REMARK3><REMARK4></REMARK4><REMARK5></REMARK5><DATA_STATUS>数据状态</DATA_STATUS></item></items>
		 * @return Map 操作成功 或者 失败：失败信息
		 *
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

			for (int i = 0 ;i < dataList.size(); i++) {// 分别存入snList，delList，docList
				int index = 0;//用于判断数据状态项
				Map<String, Object> vMap = new HashMap<String, Object>();
				for (Entry<String, Object> m : dataList.get(i).entrySet()) {
					if ("DATA_STATUS".equals(m.getKey())) {
						if ("-1".equals(m.getValue())) {
							index = -1;// 进行删除操作
						}else{
							index = 1;
						}
					}
					if ("WOD_DOC_NUM".equals(m.getKey())) {// 单号
						vMap.put("WOD_DOC_NUM", m.getValue());
					} else if ("WOD_DOC_TYPE".equals(m.getKey())) {// 出库类型
						vMap.put("WOD_DOC_TYPE", m.getValue());
					} else if ("WOD_CUST_CODE".equals(m.getKey())) {// 客户代码
						vMap.put("WOD_CUST_CODE", m.getValue());
					} else if ("WOI_ITEM_SEQ".equals(m.getKey())) {// 项次
						vMap.put("WOI_ITEM_SEQ", m.getValue());
					} else if ("WOI_ITEM_CODE".equals(m.getKey())) {// 物料料号
						vMap.put("WOI_ITEM_CODE", m.getValue());
					} else if ("WOI_PLAN_NUM".equals(m.getKey())) {// 计划数量
						vMap.put("WOI_PLAN_NUM", m.getValue());
					} else if ("WOI_DELIVERY_DATE".equals(m.getKey())) {// 出庫日期
						Date date = null;
						try {
							date = Method.parsetDate(m.getValue().toString(), "yyyyMMdd hhmmss");
						} catch (ParseException e) {
							resmap.put("MSG", "FALSE:"+e.getMessage());
							return resmap;
						} 
						vMap.put("WOD_OUTSTOCK_DATE", date);
					} else if ("WOI_CONNECT_DOC".equals(m.getKey())) {// 关联单号
						vMap.put("WOI_CONNECT_DOC", m.getValue());
					} else if ("WOI_WH_CODE".equals(m.getKey())) {//仓库代码 
						vMap.put("WOI_WH_CODE", m.getValue());
					} else if ("WOI_MEMO".equals(m.getKey())) {// 物料备注
						vMap.put("WOI_MEMO", m.getValue());
					} else if ("WOD_DATE".equals(m.getKey())) {// 开单时间
						Date date = null;
						try {
							date = Method.parsetDate(m.getValue().toString(), "yyyyMMdd hhmmss");
						} catch (ParseException e) {
							resmap.put("MSG", "FALSE:"+e.getMessage());
							return resmap;
						} 
						vMap.put("WOD_CREATE_TIME", date);
					} else if ("WOD_DISPATCH_SN".equals(m.getKey())) {// 收发类型代码
						vMap.put("WOD_DISPATCH_SN", m.getValue());
					} else if ("LOGISTICS_ID".equals(m.getKey())) {// 物流信息
						vMap.put("LOGISTICS_ID", m.getValue());
					} else if ("CUST_ADDRESS".equals(m.getKey())) {// 收货地址
						vMap.put("CUST_ADDRESS", m.getValue());
					} else if ("WOD_URGENT_FLAG".equals(m.getKey())) {// 加急标志
						vMap.put("WOD_URGENT_FLAG", m.getValue());
					} else if ("DEPART_NO".equals(m.getKey())) {// 倉庫組織代码
						String dept_id = Method.getDeptId( m.getValue().toString());
						if (dept_id==null){
							resmap.put("MSG", "FALSE:组织机构代码【"+m.getValue()+"】错误");
							return resmap;
						}
						vMap.put("DATA_AUTH", dept_id);
					}

				}
				
					if(index==0){
						resmap.put("MSG", "FALSE:第"+i+"条数据的状态项为空");
					}
					// 必填项非空判断
					if (!vMap.containsKey("WOD_DOC_NUM") || "".equals(vMap.get("WOD_DOC_NUM"))) {
						resmap.put("MSG", "FALSE:出库单号为空");
						return resmap;
					}
					if (!vMap.containsKey("WOD_DOC_TYPE") || "".equals(vMap.get("WOD_DOC_TYPE"))) {
						resmap.put("MSG", "FALSE:出库单类型为空");
						return resmap;
					}
					if (!vMap.containsKey("WOI_ITEM_SEQ") || "".equals(vMap.get("WOI_ITEM_SEQ"))) {
						resmap.put("MSG", "FALSE:物料项次为空");
						return resmap;
					}
					if (!vMap.containsKey("WOI_ITEM_CODE") || "".equals(vMap.get("WOI_ITEM_CODE"))) {
						resmap.put("MSG", "FALSE:物料料号为空");
						return resmap;
					}
					if (!vMap.containsKey("WOI_PLAN_NUM") || "".equals(vMap.get("WOI_PLAN_NUM"))) {
						resmap.put("MSG", "FALSE:计划数量为空");
						return resmap;
					}
//					if (!vMap.containsKey("WOI_CONNECT_DOC") || "".equals(vMap.get("WOI_CONNECT_DOC"))) {
//						resmap.put("MSG", "FALSE:关联单号为空");
//						return resmap;
//					}
					if (!vMap.containsKey("WOI_WH_CODE") || "".equals(vMap.get("WOI_WH_CODE"))) {
						resmap.put("MSG", "FALSE:仓库代码为空");
						return resmap;
					}
			
			/*开始业务信息录入|需进行数据库操作项*/
			snList.add(vMap.get("WOD_DOC_NUM").toString());//加入出库单状态判断清单
			if (index == -1) {// 需删除的物料
				    delList.add(vMap);
				}else{//增|改物料
					  docList.add(vMap);
				}
			}//各清单数据添加完成
			
			/*数据库层的逻辑处理开始*/
	 try {
			//判断出库单状态
			StringBuffer arraySn = new StringBuffer();
			for(int j = 0 ; j< snList.size(); j++){
				if(j==0)
					arraySn.append(snList.get(j));
				else
					arraySn.append(","+snList.get(j));
			}
			 String snListSql = " select WOD_DOC_NUM from T_WMS_OUTSTOCK_DOC where WOD_DOC_NUM  in (?) and WOD_STATUS !='1' ";
			 List<Map<String,Object>> statuslist194 = modelService.listDataSql(snListSql, new Object[]{arraySn});
			 	if(null!=statuslist194&&!"".equals(statuslist194)&&statuslist194.size()>0){
			 		StringBuffer stb = new StringBuffer();
			 		for(Map<String,Object> map196:statuslist194){//生成反馈信息
			 			 stb.append(map196.get("WOD_DOC_NUM")+" , ");
			 		}
			 		
			 		resmap.put("MSG", "FALSE:出库单（"+stb.toString()+")正在操作，或者已经关结");
			 		return resmap;
			 	}//出库单状态判断结束
		
			 /*
			 *  开始进行数据更新或保存或删除操作
			 * 
			 */
			TableDataMapExt tdMap = new TableDataMapExt();// 数据操作类
			String delresponse = delItem(modelService,tdMap,delList,resmap);//进行删除操作
			if (null != delresponse ){//删除失败 返回失败信息
				resmap.put("MSG", delresponse);
				return resmap;
			}
			
			changeItem(modelService,tdMap,docList ,resmap);//进行增|改操作
			
			} catch (Exception e) {
				log.error(e);
				resmap.put("MSG", "FALSE:" + e.getMessage());// "FALSE:信息解析失败"
				return resmap;
			} 

			resmap.put("MSG", "TRUE");// 数据有效且操作顺利完成
			return resmap;

		}

		
		private String delItem(ModelService modelService , TableDataMapExt tdMap , List<Map<String,Object>> list ,Map<String,Object> resmap) {
			String msg = null;
			
			/*判断该物料是否存在于 物料总明细单(T_WMS_RECEIVE_DETAIL)中。如果有，@return  FALSE:不能删除有出库总明细的物料*/
			//获得物料id 数组
			String searchSql = " SELECT ID FROM T_WMS_OUTSTOCK_ITEM WHERE WOI_ITEM_SEQ   = ? AND WOI_DOC_NUM  = ? ";//WOI_ITEM_CODE  = ? AND 
			ArrayList<String> arl = new ArrayList<String>();//存物料信息表的物料ID信息
			ArrayList<String> arlcod = new ArrayList<String>();//存物料信息表的物料code信息
			List<Map<String,Object>> interimList = null;//临时工				
			for(int i = 0 ; i<list.size() ; i++){
				interimList = modelService.listDataSql(searchSql
						, new Object[]{list.get(i).get("WOI_ITEM_SEQ"),list.get(i).get("WOD_DOC_NUM")});//list.get(i).get("WOI_ITEM_CODE"),
				if (null != interimList && interimList.size() > 0) {// 存在
					arl.add(interimList.get(0).get("ID").toString());
					arlcod.add(list.get(i).get("WOI_ITEM_CODE").toString());
				}else{
					return "FALSE:出库单为："+list.get(i).get("WOD_DOC_NUM")+",项次为:"+list.get(i).get("WOI_ITEM_SEQ")+",物料料号为："+list.get(i).get("WOI_ITEM_CODE")
							+"的物料不存在物料信息表中，无法删除。";
				}
			}//物料ID获得完毕

			//判断删除的id有没有明细
      String delsql = "SELECT T.WOD_ITEM_CODE " + " FROM T_WMS_OUTSTOCK_DETAIL T "
          + " LEFT JOIN T_WMS_OUTSTOCK_ITEM T1 " + " ON T.WOD_DOC_NUM = T1.WOI_DOC_NUM "
          + " AND T.WOD_ITEM_CODE = T1.WOI_ITEM_CODE " + " WHERE T.WOD_ITEM_CODE = ? "
          + " AND T1.ID = ? ";
		//	String delsql = "SELECT t.wrd_item_code FROM T_WMS_RECEIVE_DETAIL t WHERE t.WOD_ITEM_ID = ?";
			for(int i=0;i<arl.size();i++){
				int count = modelService.execSql(delsql, new Object[] {arl.get(i),arlcod.get(i)});
			    if (count != 0){
			        return ("FALSE:不能删除有出库总明细的物料");
			    }
			}
			
			//删除物料信息
			tdMap.setTableName("T_WMS_OUTSTOCK_ITEM");
			for(int i=0;i<arl.size();i++){
				tdMap.setSqlWhere(" and ID='" + arl.get(i) + "'");
			 	modelService.del(tdMap);
			}
			
		  // 删除没有关联的采购单信息 即当该单号所关联的物料全部被删除时删除采购信息
      String sql = "DELETE FROM T_WMS_DOC_INFO T " + " WHERE T.WDI_DOC_NUM IN "
                   + " (SELECT T1.WOD_DOC_NUM " + " FROM T_WMS_OUTSTOCK_DOC T1 "
                   + " WHERE NOT EXISTS (SELECT T2.WOI_DOC_NUM " + " FROM T_WMS_OUTSTOCK_ITEM T2 "
                   + " WHERE T1.WOD_DOC_NUM = T2.WOI_DOC_NUM) AND T1.WOD_DOC_TYPE='DJ11') ";
      modelService.execSql(sql, null);
      // 删除没有关联的仓库单据信息表数据息 即当该单号所关联的物料全部被删除时删除仓库单据信息表数据
      String sql3 = "DELETE FROM T_WMS_OUTSTOCK_DOC T " + " WHERE T.WOD_DOC_NUM IN "
                    + " (SELECT T1.WOD_DOC_NUM " + " FROM T_WMS_OUTSTOCK_DOC T1 "
                    + " WHERE NOT EXISTS (SELECT T2.WOI_DOC_NUM "
                    + " FROM T_WMS_OUTSTOCK_ITEM T2 "
                    + " WHERE T1.WOD_DOC_NUM = T2.WOI_DOC_NUM) AND T1.WOD_DOC_TYPE='DJ11')";
      modelService.execSql(sql3, null);

			return msg;
		}

		private String changeItem(ModelService modelService , TableDataMapExt tdMap , List<Map<String,Object>> list ,Map<String,Object> resmap) {
		
			String msg = null;
			boolean inx;
			String itemId = null;
			String docId = null;
			int modifyinx = 0;
			int insertinx = 0;
			Map<String,Object> validmap = null;
			
			for (Map<String, Object> vmap : list) {
					inx = true;
					
					String searchdocsql = "select id from T_WMS_OUTSTOCK_DOC where WOD_DOC_NUM = ? ";
					List<Map<String,Object>> searchdocList = modelService.listDataSql(searchdocsql, new Object[]{vmap.get("WOD_DOC_NUM").toString()});
					if(null != searchdocList && searchdocList.size() > 0 && searchdocList.get(0).containsKey("ID")&&null!=searchdocList.get(0).get("ID")) {// 存在
							inx = false;
							docId = searchdocList.get(0).get("ID").toString();
					}
					if (inx) {// 添加
						//添加出库单
						validmap = new HashMap<String,Object>();
						tdMap.setTableName("T_WMS_OUTSTOCK_DOC");
						validmap.put("ID", StringUtils.getUUID());// 
						validmap.put("WOD_DOC_NUM", vmap.get("WOD_DOC_NUM"));//出库单号
						validmap.put("WOD_DOC_TYPE", vmap.get("WOD_DOC_TYPE"));//单号类型
						if(vmap.containsKey("WOD_CUST_CODE"))//客户
						 validmap.put("WOD_CUST_CODE", vmap.get("WOD_CUST_CODE"));
						validmap.put("WOD_STATUS", "1");//状态 1 开立  2，操作中 3 关结
						if(vmap.containsKey("WOD_OUTSTOCK_DATE"))//出库日期 
							validmap.put("WOD_OUTSTOCK_DATE", vmap.get("WOD_OUTSTOCK_DATE"));
						if(vmap.containsKey("WOD_CREATE_TIME"))//开单时间
							validmap.put("WOD_CREATE_TIME", vmap.get("WOD_CREATE_TIME"));
						if(vmap.containsKey("DATA_AUTH")){//组织机构代码
							validmap.put("DATA_AUTH", vmap.get("DATA_AUTH"));
							validmap.put("DEPT_ID", vmap.get("DATA_AUTH"));
						}
						if(vmap.containsKey("WOD_DISPATCH_SN"))//收发标志
							validmap.put("WOD_DISPATCH_SN", vmap.get("WOD_DISPATCH_SN"));
						if(vmap.containsKey("WOD_URGENT_FLAG"))//加急标志
							validmap.put("WOD_URGENT_FLAG", vmap.get("WOD_URGENT_FLAG"));
						if(vmap.containsKey("LOGISTICS_ID"))//物流信息
							validmap.put("LOGISTICS_ID", vmap.get("LOGISTICS_ID"));
						if(vmap.containsKey("CUST_ADDRESS"))//收货地址
							validmap.put("CUST_ADDRESS", vmap.get("CUST_ADDRESS"));
						tdMap.setColMap(validmap);
						tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
						tdMap.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
						
						modelService.save(tdMap);
						resmap.put("INSERT doc", ++insertinx);
						
						//添加单据信息
						validmap = new HashMap<String,Object>();
						tdMap.setTableName("T_WMS_DOC_INFO");
						validmap.put("ID", StringUtils.getUUID());
					 	validmap.put("WDI_DOC_NUM", vmap.get("WOD_DOC_NUM"));//单据号
					 	validmap.put("WDI_STATUS", "1");/*1*/
						if(vmap.containsKey("WOD_URGENT_FLAG"))//加急标志
							validmap.put("WDI_URGENT_FLAG", vmap.get("WOD_URGENT_FLAG"));//加紧标识   
						validmap.put("T_WMS_DOC_INFO", "N");/*需加T_WMS_DOC_INFO---ERP同步标识 N*/
						if(vmap.containsKey("WOD_CUST_CODE"))//客户
							validmap.put("WDI_CUST_CODE", vmap.get("WOD_CUST_CODE"));
					 	validmap.put("WDI_DOC_TYPE", vmap.get("WOD_DOC_TYPE"));//单号类型
						if(vmap.containsKey("WOD_DISPATCH_SN"))//收发类型
							validmap.put("WDI_DISPATCH_TYPE", vmap.get("WOD_DISPATCH_SN"));
						if(vmap.containsKey("WDI_CREATE_TIME"))//开单时间
							validmap.put("WDI_CREATE_TIME", vmap.get("WOD_CREATE_TIME"));
						if(vmap.containsKey("DATA_AUTH"))//组织机构代码
						{
							validmap.put("DATA_AUTH", vmap.get("DATA_AUTH"));
							validmap.put("DEPT_ID", vmap.get("DATA_AUTH"));
						}
					 	tdMap.setColMap(validmap);
						tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
						tdMap.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
					 	modelService.save(tdMap);
					 	
					 	//添加出库单物料信息
						validmap = new HashMap<String,Object>();
						tdMap.setTableName("T_WMS_OUTSTOCK_ITEM");
					 	validmap.put("ID", StringUtils.getUUID());
					 	validmap.put("WOI_DOC_NUM",vmap.get("WOD_DOC_NUM"));//单据号
					 	validmap.put("WOI_STATUS", "1");/**/
				 		validmap.put("WOI_ITEM_CODE", vmap.get("WOI_ITEM_CODE"));
				 		validmap.put("WOI_ITEM_SEQ", vmap.get("WOI_ITEM_SEQ"));/**/
				 		validmap.put("WOI_PLAN_NUM", vmap.get("WOI_PLAN_NUM"));/**/
				 		validmap.put("WOI_WH_CODE", vmap.get("WOI_WH_CODE"));/**/
						if(vmap.containsKey("DATA_AUTH"))//组织机构代码
						{
							validmap.put("DATA_AUTH", vmap.get("DATA_AUTH"));
							validmap.put("DEPT_ID", vmap.get("DATA_AUTH"));
						}
				 		//validmap.put("WOI_PACK_NUM", packNums[i]);/**/
				 		//validmap.put("WOI_GIFT_NUM", giftNums[i]);/**/
				 		if(vmap.containsKey("WOI_CONNECT_DOC"))
				 			vmap.put("WOI_CONNECT_DOC", vmap.get("WOI_CONNECT_DOC"));/**/
				 		if(vmap.containsKey("WOI_MEMO"))
				 			vmap.put("WOI_MEMO", vmap.get("WOI_MEMO"));/**/
				 		
						tdMap.setColMap(validmap);
						tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
						tdMap.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
						modelService.save(tdMap);
				 		
					} else {// 更新
					//更新出库单
						validmap = new HashMap<String,Object>();
						tdMap.setTableName("T_WMS_OUTSTOCK_DOC");
						validmap.put("WOD_DOC_TYPE", vmap.get("WOD_DOC_TYPE"));//单号类型
						if(vmap.containsKey("WOD_SUP_CODE"))//供应商
						 validmap.put("WOD_SUP_CODE", vmap.get("WOD_SUP_CODE"));
						if(vmap.containsKey("WOD_CUST_CODE"))//客户
						 validmap.put("WOD_CUST_CODE", vmap.get("WOD_CUST_CODE"));
						validmap.put("WOD_STATUS", "1");//状态 1 开立  2，操作中 3 关结
						if(vmap.containsKey("WOD_OUTSTOCK_DATE"))//出库日期 
							validmap.put("WOD_OUTSTOCK_DATE", vmap.get("WOD_OUTSTOCK_DATE"));
						if(vmap.containsKey("WOD_CREATE_TIME"))//开单时间
							validmap.put("WOD_CREATE_TIME", vmap.get("WOD_CREATE_TIME"));
						if(vmap.containsKey("DATA_AUTH"))//组织机构代码
						{
							validmap.put("DATA_AUTH", vmap.get("DATA_AUTH"));
							validmap.put("DEPT_ID", vmap.get("DATA_AUTH"));
						}
						if(vmap.containsKey("WOD_DISPATCH_SN"))//收发标志
							validmap.put("WOD_DISPATCH_SN", vmap.get("WOD_DISPATCH_SN"));
						if(vmap.containsKey("WOD_URGENT_FLAG"))//加急标志
							validmap.put("WOD_URGENT_FLAG", vmap.get("WOD_URGENT_FLAG"));
						if(vmap.containsKey("LOGISTICS_ID"))//物流信息
							validmap.put("LOGISTICS_ID", vmap.get("LOGISTICS_ID"));
						if(vmap.containsKey("CUST_ADDRESS"))//收货地址
							validmap.put("CUST_ADDRESS", vmap.get("CUST_ADDRESS"));
						tdMap.setColMap(validmap);
						tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
						tdMap.setSqlWhere("  AND id = '"+docId+"'");
						modelService.edit(tdMap);
						resmap.put("MODIFY doc", ++modifyinx);
						
						//更新单据信息
						validmap = new HashMap<String,Object>();
						tdMap.setTableName("T_WMS_DOC_INFO");
					 	validmap.put("WDI_STATUS", "1");
						if(vmap.containsKey("WOD_URGENT_FLAG"))//加急标志
							validmap.put("WDI_URGENT_FLAG", vmap.get("WOD_URGENT_FLAG"));//加紧标识   
						validmap.put("T_WMS_DOC_INFO", "N");/*需加T_WMS_DOC_INFO---ERP同步标识 N*/
						if(vmap.containsKey("WOD_CUST_CODE"))//客户
							validmap.put("WDI_CUST_CODE", vmap.get("WOD_CUST_CODE"));
					 	validmap.put("WDI_DOC_TYPE", vmap.get("WOD_DOC_TYPE"));//单号类型
						if(vmap.containsKey("WOD_DISPATCH_SN"))//收发类型
							validmap.put("WDI_DISPATCH_TYPE", vmap.get("WOD_DISPATCH_SN"));
						if(vmap.containsKey("WDI_CREATE_TIME"))//开单时间
							validmap.put("WDI_CREATE_TIME", vmap.get("WOD_CREATE_TIME"));
						if(vmap.containsKey("DATA_AUTH"))//组织机构代码
						{
							validmap.put("DATA_AUTH", vmap.get("DATA_AUTH"));
							validmap.put("DEPT_ID", vmap.get("DATA_AUTH"));
						}
					 	tdMap.setColMap(validmap);
						tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
						tdMap.setSqlWhere("  AND WDI_DOC_NUM = '"+vmap.get("WOD_DOC_NUM")+"' ");//单据号
					 	modelService.edit(tdMap);
						resmap.put("MODIFY doc", ++modifyinx);
					 
						inx = true;
					//判断物料信息是否存在
						String searchSql = " SELECT ID FROM T_WMS_OUTSTOCK_ITEM WHERE  WOI_ITEM_SEQ   = ? AND WOI_DOC_NUM  = ? ";//wri_item_code  = ? AND 不做code判断
						List<Map<String, Object>> searchlist = new ArrayList<Map<String, Object>>();
						searchlist = modelService.listDataSql(searchSql
								, new Object[]{vmap.get("WOI_ITEM_SEQ"),vmap.get("WOD_DOC_NUM")});//vmap.get("WOI_ITEM_CODE"),
						if (null != searchlist && searchlist.size() > 0 && searchlist.get(0).containsKey("ID")&&null!=searchlist.get(0).get("ID")) {// 存在
							inx = false;// 触发更新操作
							itemId = searchlist.get(0).get("ID").toString();
						}
						
						if(inx){//添加物料
						 	
						 	//添加出库单物料信息
							validmap = new HashMap<String,Object>();
							tdMap.setTableName("T_WMS_OUTSTOCK_ITEM");
						 	validmap.put("ID", StringUtils.getUUID());
						 	validmap.put("WOI_DOC_NUM",vmap.get("WOD_DOC_NUM"));//单据号
						 	validmap.put("WOI_STATUS", "1");/**/
					 		validmap.put("WOI_ITEM_CODE", vmap.get("WOI_ITEM_CODE"));
					 		validmap.put("WOI_ITEM_SEQ", vmap.get("WOI_ITEM_SEQ"));/**/
					 		validmap.put("WOI_PLAN_NUM", vmap.get("WOI_PLAN_NUM"));/**/
					 		//validmap.put("WOI_PACK_NUM", packNums[i]);/**/
					 		//validmap.put("WOI_GIFT_NUM", giftNums[i]);/**/
					 		if(vmap.containsKey("WOI_CONNECT_DOC"))
					 			vmap.put("WOI_CONNECT_DOC", vmap.get("WOI_CONNECT_DOC"));/**/
					 		if(vmap.containsKey("WOI_MEMO"))
					 			vmap.put("WOI_MEMO", vmap.get("WOI_MEMO"));/**/
					 		validmap.put("WOI_WH_CODE", vmap.get("WOI_WH_CODE"));/**/
							if(vmap.containsKey("DATA_AUTH"))//组织机构代码
							{
								validmap.put("DATA_AUTH", vmap.get("DATA_AUTH"));
								validmap.put("DEPT_ID", vmap.get("DATA_AUTH"));
							}
							tdMap.setColMap(validmap);
							tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
							tdMap.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
							modelService.save(tdMap);
							
						}else{//修改物料  //当前未接收 出库数量 未进行出库数量和计划数量比较  
						 	
						 	//修改出库单物料信息
							validmap = new HashMap<String,Object>();
							tdMap.setTableName("T_WMS_OUTSTOCK_ITEM");
						 	validmap.put("WOI_DOC_NUM",vmap.get("WOD_DOC_NUM"));//单据号
						 	validmap.put("WOI_STATUS", "1");/**/
					 		validmap.put("WOI_ITEM_CODE", vmap.get("WOI_ITEM_CODE"));
					 		validmap.put("WOI_ITEM_SEQ", vmap.get("WOI_ITEM_SEQ"));/**/
					 		validmap.put("WOI_PLAN_NUM", vmap.get("WOI_PLAN_NUM"));/**/
					 		//validmap.put("WOI_PACK_NUM", packNums[i]);/**/
					 		//validmap.put("WOI_GIFT_NUM", giftNums[i]);/**/
					 		if(vmap.containsKey("WOI_CONNECT_DOC"))
					 			vmap.put("WOI_CONNECT_DOC", vmap.get("WOI_CONNECT_DOC"));/**/
					 		if(vmap.containsKey("WOI_MEMO"))
					 			vmap.put("WOI_MEMO", vmap.get("WOI_MEMO"));/**/
					 		
					 		validmap.put("WOI_WH_CODE", vmap.get("WOI_WH_CODE"));/**/
							if(vmap.containsKey("DATA_AUTH"))//组织机构代码
							{
								validmap.put("DATA_AUTH", vmap.get("DATA_AUTH"));
								validmap.put("DEPT_ID", vmap.get("DATA_AUTH"));
							}
							tdMap.setSqlWhere(" AND ID ='"+itemId+"' ");
					 		tdMap.setColMap(validmap);
					 		tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
							
					 		modelService.edit(tdMap);
						}
						
						
					}
				}
			return msg;
		}
		

	}
