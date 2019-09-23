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

import com.more.fw.core.common.exception.AppException;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.webservice.service.IWebService;
import com.morelean.aisino.common.Method;
import com.morelean.aisino.common.RuleFactory;

/**
 * @ClassName:SyncProductMaterialInfo
 * @Description: 物料信息 涉及表：T_PM_PROJECT_DETAIL（物料信息表）
 * 
 *               1.判断表是否有该号，没有的话报错FALSE:没有信息，请先同步信息
 *               2.将数据按表对应字段写入，需要新增字段工序序号，工序编码，工序描述，产出率等 3.物料信息与信息必须保持数据一致性
 *               4.产出率传数字格式，0.1 = 10%，产出率 = 1 - 损耗率 5.通过数据状态字段确定数据有效性
 *               6.生产领料时计算发料数量需将损耗率代入计算
 * @author:mmz
 * @version:1.0
 * @see
 * @since 2018年4月20日上午4:36:16
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class SyncProductMaterialInfo implements IWebService {
	final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

	/*
	 * (non-Javadoc)
	 * @param objs 值对,获取方式objs[n]; 参数 objs[0]String类型，xml格式。例：
	 * @return Map 操作成功 或者 失败：失败信息
	 */

	public Map<String, Object> excute(Object... objs) {
		Map<String, Object> resmap = new HashMap<String, Object>();// 存返回数据
		if (null == objs || null == objs[0] || "".equals(objs[0])) {
			resmap.put("MSG", "数据信息为空");
			return resmap;
		}
		SAXReader saxReader = new SAXReader();// XML解析
		List<Map<String, Object>> dataList = new ArrayList<Map<String, Object>>();// 存储各个物料单节点信息
//		List<String> snList = new ArrayList<String>();// 存储每个物料节点的出库单号，用于出库单状态的判断（详见类说明）
		List<Map<String, Object>> delList = null;// 需删除的物料
		List<Map<String, Object>> docList = new ArrayList<Map<String, Object>>();// 存储进行增/改操作的物料单信息
		String errorMsg = null;
		boolean inx = true;// 操作依据 文档解析时，当false返回失败信息。 开始数据操作时，当 false进行更新操作
				try {
			// 读取信息内容
			String xmlMsg = objs[0].toString();
			// 创建xml解析对象
		dataList =	Method.getDataList( xmlMsg);
		} catch (UnsupportedEncodingException | DocumentException e) {
			resmap.put("MSG", "FALSE:XML数据解析失败，请核实数据格式__" + e.getMessage());// "FALSE:XML数据解析失败，请核实数据格式"
			return resmap;
		}
			
		try {
			// 获得类映射关系规则
			Map<String, Map<String, String>> rulmap = Method.getRuleMap(this.getClass().getSimpleName());
		
			// 获取XML中有效信息并键入数据值图 docList中
			for (int i = 0; i < dataList.size(); i++) {// 分别存入snList，delList，docList
				errorMsg = String.valueOf(dataList.get(i));
				int index = 0;// 用于判断数据状态项
				Map<String, Object> vMap = new HashMap<String, Object>();
				for (Entry<String, Object> m : dataList.get(i).entrySet()) {
					Map<String, Object> map = Method.vtoRefMap(m.getKey(), m.getValue(), rulmap);
					if (null != map) {
						vMap.putAll(map);
					}
				}
				//必填项验证
				Method.checkEmpty(rulmap.get("reqMap"), vMap);
				/* 开始业务信息录入|需进行数据库操作项 *///
				initLists(delList, docList, vMap);
			}// 各清单数据添加完成

			 // 进行数据更新或保存或删除操作
			TableDataMapExt tdMap = new TableDataMapExt();// 数据操作类
			String delresponse = delItem(modelService, tdMap, delList, resmap);// 进行删除操作
			if (null != delresponse) {// 删除失败 返回失败信息
				resmap.put("MSG", delresponse);
				return resmap;
			}
			changeItem(modelService, tdMap, docList, resmap);// 进行增|改操作
		} catch (Exception e) {
			log.error("synproduceMaterial:"+e);
			throw new AppException(e.getMessage()+"错误发生在："+errorMsg);// "FALSE:信息解析失败"
		}
		resmap.put("MSG", "TRUE");// 数据有效且操作顺利完成
		return resmap;
	}


	private void initLists(List<Map<String, Object>> delList, List<Map<String, Object>> docList, Map<String, Object> vMap) {
		if ("-1".equals(vMap.get("DATA_STATUS"))) {// 需删除的物料
			vMap.remove("DATA_STATUS");
			delList.add(vMap);
		} else {// 增|改物料
			vMap.remove("DATA_STATUS");
			docList.add(vMap);
		}
	}


	/** 
	 * @Description: 删除物料
	 * @param modelService
	 * @param tdMap
	 * @param list
	 * @param resmap
	 * @return
	 * @author: mmz
	 * @Company:morelean     
	 */ 
	private String delItem(ModelService modelService, TableDataMapExt tdMap, List<Map<String, Object>> list,
			Map<String, Object> resmap) {
		String msg = null;

		// 获得物料id 数组
		String searchSql = " SELECT ID FROM T_PM_PROJECT_DETAIL WHERE CBD_ITEM_CODE   = ? ";//
		ArrayList<String> arl = new ArrayList<String>();// 存物料信息表的物料ID信息
		ArrayList<String> arlcod = new ArrayList<String>();// 存物料信息表的物料code信息
		List<Map<String, Object>> interimList = null;// 临时工
		for (int i = 0; i < list.size(); i++) {
			interimList = modelService.listDataSql(searchSql,
					new Object[] { list.get(i).get("CBD_ITEM_CODE")});
			if (null != interimList && interimList.size() > 0) {// 存在
				arl.add(interimList.get(0).get("ID").toString());
			} else {
				return "FALSE:工单为："+list.get(i).get("PROJECT_ID")+";物料Code为" + list.get(i).get("CBD_ITEM_CODE") + "的物料不存在物料信息表中，无法删除。";
			}
		}// 物料ID获得完毕

		// 删除物料信息
		tdMap.setTableName("T_PM_PROJECT_DETAIL");
		StringBuilder delStr = new StringBuilder();
		for (int i = 0; i < arl.size(); i++) {
			if(i!=0)
			  delStr.append(",").append(arl.get(i));
			else
				delStr.append(arl.get(i));
		}
		tdMap.setSqlWhere(" and ID in ('" + delStr.toString().replace(",","','")+ "')");
		modelService.del(tdMap);

	return msg;
	}

	/** 
	 * @Description: 增改操作
	 * @param modelService
	 * @param tdMap
	 * @param list
	 * @param resmap
	 * @return
	 * @author: mmz
	 * @Company:morelean     
	 */ 
	private String changeItem(ModelService modelService, TableDataMapExt tdMap, List<Map<String, Object>> list,
			Map<String, Object> resmap) {

		String msg = null;
		boolean inx;
		int modifyinx = 0;
		int insertinx = 0;

		for (Map<String, Object> vmap : list) {
			inx = true;

			String searchdocsql = "select id from T_PM_PROJECT_DETAIL where CBD_ITEM_CODE = ? ";
			List<Map<String, Object>> searchdocList = modelService.listDataSql(searchdocsql, new Object[] { vmap.get("CBD_ITEM_CODE")
					.toString() });
			if (null != searchdocList && searchdocList.size() > 0 && searchdocList.get(0).containsKey("ID")
					&& null != searchdocList.get(0).get("ID")) {// 存在
				inx = false;
			}
			if (inx) {// 添加
		
				tdMap.setTableName("T_PM_PROJECT_DETAIL");
				vmap.put("ID", StringUtils.getUUID());//
				vmap.put("EDIT_TIME", DateUtil.getCurDate());
				vmap.put("CREATE_TIME", DateUtil.getCurDate());
				tdMap.setColMap(vmap);
				modelService.save(tdMap);
				resmap.put("INSERT detil", ++insertinx);
			
			} else {// 更新
		
				tdMap.setTableName("T_PM_PROJECT_DETAIL");
				vmap.put("EDIT_TIME", DateUtil.getCurDate());
				tdMap.setColMap(vmap);
				tdMap.setSqlWhere("  AND CBD_ITEM_CODE = '" + vmap.get("CBD_ITEM_CODE") + "'");
				modelService.edit(tdMap);
				resmap.put("MODIFY doc", ++modifyinx);
			
			}
		}
		return msg;
	}
	//判断工单状态  注意：此方法比目前在用方法节约时间
//snList.add(vMap.get("PROJECT_ID").toString());// 加入出库单状态判断清单
//StringBuffer arraySn = new StringBuffer();
//for(int j = 0 ; j< snList.size(); j++){
//	if(j==0)
//		arraySn.append(snList.get(j));
//	else
//		arraySn.append(","+snList.get(j));
//}
// String snListSql = " select PROJECT_ID from T_PM_PROJECT_BASE where PROJECT_ID  in (?) and PROJECT_STATUS !='0' ";
// List<Map<String,Object>> statuslist194 = modelService.listDataSql(snListSql, new Object[]{arraySn});
// 	if(null!=statuslist194&&!"".equals(statuslist194)&&statuslist194.size()>0){
// 		StringBuffer stb = new StringBuffer();
// 		for(Map<String,Object> map196:statuslist194){
// 			 stb.append(map196.get("PROJECT_ID")+" , ");
// 		}
// 		resmap.put("MSG", "FALSE:工单（"+stb.toString()+")正在操作，或者已经关结");
// 		return resmap;
// 	}//工单状态判断结束


}
