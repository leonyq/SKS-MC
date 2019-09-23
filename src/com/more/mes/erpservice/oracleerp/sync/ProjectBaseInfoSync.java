
package com.more.mes.erpservice.oracleerp.sync;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.fw.webservice.service.IWebService;

/**
 * ORACLE ERP
 * @ClassName:SyncPurchaseOrderInfo
 * @Description: 工单信息存储 接收参数 msg
 * @author:mmz
 * @version:1.0
 * @since 2018年3月29日下午8:10:01
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */

public class ProjectBaseInfoSync implements IWebService {
	final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");
	private MsHTranMan hbtran = BussService.getHbTran();

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Map<String, Object> excute(Object... objs) {
		// 定义表单修改的的对象
		TableDataMapExt update;
		// 定义表单存储的的对象
		TableDataMapExt save = null;

		String sql = null;

		List<Map> list;

		String returnErrorMsg = "";

		Map<String, Object> resmap = new HashMap<String, Object>();// 存返回数据

		Map<String, Object> poBaseMap;

		Map<String, Object> poDetailMap;

		// 表头数据集合
		List<Map> poBaseList = new ArrayList<Map>();
		// 表身数据集合数据集合
		List<Map> poDetailList = new ArrayList<Map>();
		// 表身所有Item集合
		List<List<Map>> poItemDetailList = new ArrayList<List<Map>>();
		// 定义一个文档
		Document document = null;
		// 将字符串转换为
		String xmlMsg = objs[0].toString();

		try {
			document = DocumentHelper.parseText(xmlMsg);
			Element bookStore = document.getRootElement();
			Iterator it = bookStore.elementIterator();
			while (it.hasNext()) {
				Element book = (Element) it.next();
				Iterator itt = book.elementIterator();

				// 节点名称
				String elDateName = book.getName();
				// DATE节点，为采购入库单的当头数据
				if (elDateName.equals("DATA")) {

					poBaseMap = new HashMap<String, Object>();

					while (itt.hasNext()) {
						Element bookChild = (Element) itt.next();

						Iterator ittes = bookChild.elementIterator();

						// 节点名称
						String elName = bookChild.getName();

						// 节点值
						String dataStr = bookChild.getStringValue();

						// ITEM_LIST节点，为采购入库单的明细
						if (elName.equals("ITEM_LIST")) {
							poDetailList = new ArrayList<Map>();
							while (ittes.hasNext()) {

								Element book2 = (Element) ittes.next();

								Iterator ittes2 = book2.elementIterator();
								// 节点名称
								String elItemName = book2.getName();
								// ITEM节点，明细数据
								if (elItemName.equals("ITEM")) {
									poDetailMap = new HashMap<String, Object>();

									boolean flag;
									while (true) {
										flag = ittes2.hasNext();
										if (flag) {
											flag = ittes2.hasNext();
											int a = ittes2.hashCode();

											Element book3 = (Element) ittes2
													.next();

											Iterator ittes3 = book3
													.elementIterator();

											// 节点名称
											String elItemDetailName = book3
													.getName();

											// 节点值
											String itemDataStr = book3
													.getStringValue();

											poDetailMap.put(elItemDetailName,
													itemDataStr);
										} else {
											poDetailList.add(poDetailMap);
											break;
										}
									}
								}
							}
						} else {
							poBaseMap.put(elName, dataStr);
						}
						// 到达ITEM_LIST节点，保存数据
						if (elName.equals("ITEM_LIST")) {
							poBaseList.add(poBaseMap);
							poItemDetailList.add(poDetailList);
						}
					}
				}
			}

			/**
			 * 定义工单标准信息(base)
			 */

			Object erpDoc;
			Object erpdocname;
			Object fatherpdocname;
			Object productmaterial;
			Object productcount;
			Object stardate;
			Object enddate;
			Object createuser;
			Object createtime;
			Object edituser;
			Object edittime;
			Object custcode;
			Object destroyno;
			Object workstation;
			Object dataauth;
			Object comment1;
			Object comment2;
			Object comment3;
			Object comment4;
			Object comment5;
			Object comment6;
			Object statustype;
			Object flag;
			Object itemvertion;
			Object supcode;
			Object projecttype;
			/**
			 * 定义工单信息(detail)
			 */

			Object itemcode;
			Object unit;
			Object itemnum;
			Object vertion;

			String errorMsg = "";
            List zlist = new ArrayList();
			for (int i = 0; i < poBaseList.size(); i++) {
				erpDoc = poBaseList.get(i).get("ERP_DOC");
				erpdocname = poBaseList.get(i).get("ERP_DOCNAME");
				fatherpdocname = poBaseList.get(i).get("WIP_ENTITY_NAME_H");
				productmaterial = poBaseList.get(i).get("PRODUCT_MATERIAL");
				productcount = poBaseList.get(i).get("PRODUCT_COUNT");
				stardate = poBaseList.get(i).get("PROLEPSIS_START_DATE");
				enddate = poBaseList.get(i).get("PROLEPSIS_END_DATE");
				createuser = poBaseList.get(i).get("CREATE_USER");

				createtime = poBaseList.get(i).get("CREATE_TIME");
				edituser = poBaseList.get(i).get("EDIT_USER");
				edittime = poBaseList.get(i).get("EDIT_TIME");
				custcode = poBaseList.get(i).get("CUSTCODE");
				destroyno = poBaseList.get(i).get("DESTROY_NO");
				workstation = poBaseList.get(i).get("WORKSTATION");
				dataauth = poBaseList.get(i).get("DATA_AUTH");

				comment1 = poBaseList.get(i).get("COMMENT1");
				comment2 = poBaseList.get(i).get("COMMENT2");
				comment3 = poBaseList.get(i).get("COMMENT3");
				comment4 = poBaseList.get(i).get("COMMENT4");
				comment5 = poBaseList.get(i).get("COMMENT5");
				comment6 = poBaseList.get(i).get("COMMENT6");

				statustype = poBaseList.get(i).get("STATUS_TYPE");
				flag = poBaseList.get(i).get("OUTSOURCING_FLAG");
				itemvertion = poBaseList.get(i).get("ITEM_VERSION");
				supcode = poBaseList.get(i).get("SUP_CODE");
				projecttype = poBaseList.get(i).get("PROJECT_TYPE");
				// 如果存在一个节点异常(无已上任意一节点)
				if (erpDoc == null || erpdocname == null
						|| productmaterial == null || productcount == null
						|| stardate == null || enddate == null
						|| createuser == null || createtime == null
						|| edituser == null || edittime == null
						|| custcode == null || destroyno == null
						|| workstation == null || dataauth == null
						|| comment1 == null || comment2 == null
						|| comment3 == null || comment4 == null
						|| comment5 == null || comment6 == null
						|| statustype == null || flag == null
						|| itemvertion == null || supcode == null||projecttype==null) {
					if ("".equals(errorMsg)) {
						errorMsg = "该PO无以下节点";

					}
					if (erpDoc == null) {
						errorMsg += "ERP_DOC,";
					}
					if (erpdocname == null) {
						errorMsg += "ERP_DOCNAME,";
					}
					if (fatherpdocname == null) {
						errorMsg += "WIP_ENTITY_NAME_H,";
					}
					if (productmaterial == null) {
						errorMsg += "PRODUCT_MATERIAL,";
					}
					if (productcount == null) {
						errorMsg += "PRODUCT_COUNT,";
					}
					if (stardate == null) {
						errorMsg += "PROLEPSIS_START_DATE,";
					}
					if (enddate == null) {
						errorMsg += "PROLEPSIS_END_DATE,";
					}
					if (createuser == null) {
						errorMsg += "CREATE_USER,";
					}
					if (edituser == null) {
						errorMsg += "EDIT_USER,";
					}
					if (edittime == null) {
						errorMsg += "EDIT_TIME,";
					}
					if (custcode == null) {
						errorMsg += "CUSTCODE,";
					}
					if (destroyno == null) {
						errorMsg += "DESTROY_NO,";
					}
					if (workstation == null) {
						errorMsg += "WORKSTATION,";
					}
					if (dataauth == null) {
						errorMsg += "DATA_AUTH,";
					}
					if (comment1 == null) {
						errorMsg += "COMMENT1,";
					}
					if (comment2 == null) {
						errorMsg += "COMMENT2,";
					}
					if (comment3 == null) {
						errorMsg += "COMMENT3,";
					}
					if (comment4 == null) {
						errorMsg += "COMMENT4,";
					}
					if (comment5 == null) {
						errorMsg += "COMMENT5,";
					}
					if (comment6 == null) {
						errorMsg += "COMMENT6,";
					}
					if (statustype == null) {
						errorMsg += "STATUS_TYPE,";
					}
					if (flag == null) {
						errorMsg += "OUTSOURCING_FLAG,";
					}
					if (itemvertion == null) {
						errorMsg += "ITEM_VERSION,";
					}
					if (supcode == null) {
						errorMsg += "SUP_CODE,";
					}
					if (projecttype == null) {
						errorMsg += "PROJECT_TYPE,";
					}

				} else {

					if (createtime.equals("")) {
						createtime = DateUtil.getCurDateStr();
					} else {
						if (DateUtil.parseDate(String.valueOf(createtime),
								"yyyy-MM-dd") == null) {

							errorMsg += "此poCREATE_TIME时间格式有误";
						}
					}
					if (edittime.equals("")) {
						edittime = DateUtil.getCurDateStr();
					} else {
						if (DateUtil.parseDate(String.valueOf(edittime),
								"yyyy-MM-dd") == null) {

							errorMsg += "此EDIT_TIME时间格式有误";
						}
					}
					if (stardate.equals("")) {
						stardate = DateUtil.getCurDateStr();
					} else {
						if (DateUtil.parseDate(String.valueOf(stardate),
								"yyyy-MM-dd") == null) {

							errorMsg += "此PROLEPSIS_START_DATE时间格式有误";
						}
					}
					if (enddate.equals("")) {
						enddate = DateUtil.getCurDateStr();
					} else {
						if (DateUtil.parseDate(String.valueOf(enddate),
								"yyyy-MM-dd") == null) {

							errorMsg += "此PROLEPSIS_END_DATE时间格式有误";
						}
					}
				}
				for (int j = 0; j < poItemDetailList.get(i).size(); j++) {

					itemcode = poItemDetailList.get(i).get(j)
							.get("CBD_ITEM_CODE");

					unit = poItemDetailList.get(i).get(j).get("CBD_UNITS");

					itemnum = poItemDetailList.get(i).get(j)
							.get("CBD_ITEM_NUM");

					vertion = poItemDetailList.get(i).get(j)
							.get("ITEM_VERSION");
					if (itemcode == null || unit == null || itemnum == null
							|| vertion == null) {

						if ("".equals(errorMsg)) {
							errorMsg = "该PO无以下节点";

						}
						if (itemcode == null) {
							errorMsg += " CBD_ITEM_CODE,";
						}
						if (unit == null) {
							errorMsg += "CBD_UNITS,";
						}
						if (itemnum == null) {
							errorMsg += "CBD_ITEM_NUM,";
						}
						if (vertion == null) {
							errorMsg += "ITEM_VERSION,";
						}
						break;
					}
				}
				String dataAuth = getDataId(dataauth).toString();
				// 无任何异常
				if ("".equals(errorMsg)) {

					if (zlist.contains(erpDoc))
					{
						returnErrorMsg+= toErrorStr(erpDoc,dataauth,"erpDoc");
				// 		addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),erpDoc);
						continue;
					}
					// erpDoc是否存在
					sql = "SELECT ID FROM T_PM_PROJECT_BASE  WHERE ERP_DOC  =?";

					list = modelService.listDataSql(sql,new Object[] { erpDoc });//

					if (list.size() > 0) {
					   // returnErrorMsg+= toErrorStr(new Object[]{erpDoc,dataauth,"erpDoc"});
						update = new TableDataMapExt();
						update.setTableName("T_PM_PROJECT_BASE");
						//生产领料物料状态
						String sql006 ="select t1.wod_status from t_wms_outstock_doc t1 "+ 
                                " left join t_wms_outstock_item t2 on t2.woi_doc_num=t1.wod_doc_num "+
                                " where t1.wod_doc_type='DJ10' and t2.woi_connect_doc='"+erpDoc+"'";
						
						List<Map<Object,Object>> list006 = modelService.listDataSql(sql006);
 						//查询制令单
 						String sql1 ="select *  from t_pm_mo_base t " +
 								"left join T_PM_PROJECT_BASE t1 on t.PM_PROJECT_ID = t1.PROJECT_ID" +
 								" where t1.PROJECT_ID='"+erpDoc+"'";
 						//
 						String sql4 ="select (sum (t.PM_TARGET_QTY)) target  from t_pm_mo_base t " + 								"left join T_PM_PROJECT_BASE t1 on t.PM_PROJECT_ID = t1.PROJECT_ID" +
								" where t1.PROJECT_ID='"+erpDoc+"' group by t1.PROJECT_ID";
 						List<Map<Object,Object>> list001 = modelService.listDataSql(sql1);
						List<Map<Object,Object>> list004 = modelService.listDataSql(sql4);
						
						
						
						
 						//查询生产领料单
 						//查询生产退料
						String sql3 ="SELECT T.project_id,T.cbd_item_code , "+
 				                  "T.cbd_item_num cbd_item_num,NVL(T3.WOI_OUT_NUM,0)-nvl(T4.Wri_Receive_Num,0) num001 "+
 				                  ",NVL(T3.WOI_OUT_NUM,0) WOI_OUT_NUM,nvl(T4.Wri_Receive_Num,0) Wri_Receive_Num "+
 				                   "FROM (select t.project_id,t2.cbd_item_code,t2.cbd_item_num from t_pm_project_base t  "+
 				                  "left join t_pm_project_detail t2 on t.project_id=t2.project_id  "+
 				                  "where t.project_id=?  )t  "+
 				                  "left join (select PM_PROJECT_ID, woi_item_code,WOI_OUT_NUM "+
 				                       "from (select PM_PROJECT_ID ,woi_item_code,sum(WOI_OUT_NUM) WOI_OUT_NUM "+
				                        "from (select T4.PM_PROJECT_ID,T2.WOI_PLAN_NUM WOI_OUT_NUM, t2.WOI_MIN_PACK,t2.woi_item_code "+
 				                                "from t_wms_outstock_doc t "+
 				                               "INNER JOIN T_WMS_OUTSTOCK_ITEM T2 ON T.WOD_DOC_NUM = T2.WOI_DOC_NUM AND T.WOD_DOC_TYPE='DJ10'"+
 				                               "inner join t_pm_mo_base T4 ON T2.WOI_CONNECT_DOC = T4.PM_MO_NUMBER  where T2.woi_sourceno<>'3' "+
 				                              "union all "+
				                              "select T4.project_id, T2.WOI_PLAN_NUM WOI_OUT_NUM, t2.WOI_MIN_PACK, t2.woi_item_code "+
 				                                "from t_wms_outstock_doc t "+
 				                               "INNER JOIN T_WMS_OUTSTOCK_ITEM T2 ON T.WOD_DOC_NUM = T2.WOI_DOC_NUM AND T.WOD_DOC_TYPE='DJ10'"+
 				                               "inner join t_pm_project_base T4 ON T2.WOI_CONNECT_DOC = T4.project_id where T2.woi_sourceno<>'3' ) T "+
 				                        "group by PM_PROJECT_ID ,woi_item_code) ) T3  "+
				                  "ON T.project_id=T3.PM_PROJECT_ID AND T.cbd_item_code=T3.woi_item_code  "+
 				                  //--已退的数量
				                  
 				                  "left join (select  (case when t4.pm_project_id is null then t6.project_id else t4.pm_project_id end) pm_project_id,t2.wri_item_code,sum(t2.Wri_Receive_Num) Wri_Receive_Num  "+
 				                  "from t_wms_receive_doc t INNER join t_wms_receive_item t2 on t.wrd_doc_num=t2.wri_doc_num  "+
 				                  "left join  t_pm_mo_base t4 on t2.wri_connect_doc=t4.pm_mo_number  "+
 				                  "left join t_pm_project_base t6 on t6.project_id = t2.wri_connect_doc "+
				                  "where t.wrd_doc_type='DJ03' GROUP BY (case when t4.pm_project_id is null then t6.project_id else t4.pm_project_id end),t2.wri_item_code)T4  "+
 				                  "ON T.project_id=T4.pm_project_id AND T.cbd_item_code=T4.wri_item_code "+
 				                  "where T.cbd_item_code is not null ";
 						List<Map<String,Object>> list003 = modelService.listDataSql(sql3,new Object[]{erpDoc});
 						String sql023 = "select t.erp_docname from t_pm_project_base t where t.project_id='"+erpDoc+"'";
						List<Map<String,Object>> list023 = modelService.listDataSql(sql023);
						String erpname= list023.get(0).get("ERP_DOCNAME").toString();
 						boolean ck=true; //标识是否变更
 						//制令单存在
 						if((list001!=null)&&list001.size()>0){//制令单信息
 							Integer target = toInteger(list004.get(0).get("target"));//下达制令单数量
 							double productcount1 = Double.parseDouble(productcount.toString());//工单erp修改数量   修改工单erp报文>制令单数量
 //							Integer productcount1 = toInteger((productcount));
 							if(target<=productcount1){//erp变更数量大于制令单下达数量
 								boolean cknumber=true; //判断是否需要继续循环
 								if(list003!=null&&list003.size()>0){//判断是否有生产领料
 	 								int size=list003.size();
 	 								for(int kk=0;kk<size;kk++){
 	 									if(cknumber){
 	 										//获取工单、料号 已领的数量
 	 										Map<String,Object> temp=list003.get(kk);
 	 										double WOI_MIN_PACK=Double.parseDouble(temp.get("NUM001").toString()); //实际出库数量
 	 										String CBD_ITEM_CODE=temp.get("CBD_ITEM_CODE").toString();
 	 										double c2 = Math.ceil(WOI_MIN_PACK);
 	 										int LLSIZE=poItemDetailList.get(i).size();
 	 										for(int LL=0;LL<LLSIZE;LL++){
// 	 											String erpname =  poBaseList.get(i).get(LL).get("ERP_DOCNAME").toString();
 	 											
 	 											String CBD_ITEM_CODE2=poItemDetailList.get(i).get(LL).get("CBD_ITEM_CODE").toString();
 	 											double CBD_ITEM_NUM = Double.parseDouble(poItemDetailList.get(i).get(LL).get("CBD_ITEM_NUM").toString())*Double.parseDouble(productcount.toString());
 	 											double c1 = Math.ceil(CBD_ITEM_NUM);
 	 											if(CBD_ITEM_CODE.equals(CBD_ITEM_CODE2)){
 	 												//如果实际领料数量小于变更数量（物料单位用量*计划数量）
 	 												if(c2>c1){
 	 												 	returnErrorMsg+= toErrorStr(erpDoc,dataauth,"生产领料数计划数量大于erp变更数量",CBD_ITEM_CODE2,erpname);
 	 												 	ck=false;
 	 												 	cknumber=false;
 	 												 	break;
 	 												//ck=false;
 	 												}
 	 											}
 	 										}
 	 									}
 	 								}
 	 							}else{
 	 								ck=true;
 	 							}
 								
 							}else {
 								ck=false;
 								returnErrorMsg+= toErrorStr(erpDoc,dataauth,"制令单下达数量大于erp变更数量","","");
// 								addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),erpDoc);
 							    break;
							    
 							}
 							
 					   }else if((list003!=null)&&list003.size()>0){//生产领料//物料单位用量
 						   
 						   boolean cknumber=true; //判断是否需要继续循环
 							if(list003!=null&&list003.size()>0){
 								int size=list003.size();
 								for(int kk=0;kk<size;kk++){
 									if(cknumber){
 										//获取工单、料号 已领的数量
 										Map<String,Object> temp=list003.get(kk);
 										double WOI_MIN_PACK=Double.parseDouble(temp.get("NUM001").toString()); //实际出库数量
 										double c2 = Math.ceil(WOI_MIN_PACK);
 										String CBD_ITEM_CODE=temp.get("CBD_ITEM_CODE").toString();
 										int LLSIZE=poItemDetailList.get(i).size();
 										for(int LL=0;LL<LLSIZE;LL++){
 											String CBD_ITEM_CODE2=poItemDetailList.get(i).get(LL).get("CBD_ITEM_CODE").toString();
 											double CBD_ITEM_NUM = Double.parseDouble(poItemDetailList.get(i).get(LL).get("CBD_ITEM_NUM").toString())
 													*Double.parseDouble(productcount.toString());
 											double c1 = Math.ceil(CBD_ITEM_NUM);
 											if(CBD_ITEM_CODE.equals(CBD_ITEM_CODE2)){
 												//如果实际领料数量小于变更数量（物料单位用量*计划数量）
 												if(c2>c1){
 												 	returnErrorMsg+= toErrorStr(erpDoc,dataauth,"生产领料计划数量大于erp变更数量",CBD_ITEM_CODE2,erpname);
// 												 	addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),erpDoc);
 												 	ck=false;
 												 	cknumber=false;
 												 	break;
 												       // ck=true;
 												}
 											}
 										}
 									}
 								}
 							}
 					       }else{
 					    	   ck=true;
 					       }
 					   if(ck){
					    	   update.setSqlWhere(" and PROJECT_ID = '"+erpDoc+"'and erp_doc = '"+erpDoc+"' ");//如何取值待测试
								update.getColMap().put("CREATE_TIME", DateUtil.parseDate(String.valueOf(createtime), "yyyy-MM-dd"));
								update.getColMap().put("EDIT_TIME", DateUtil.parseDate(String.valueOf(edittime), "yyyy-MM-dd"));
								update.getColMap().put("ERP_DOCNAME",erpdocname);// 供应商代码
								update.getColMap().put("WIP_ENTITY_NAME_H", fatherpdocname);
								update.getColMap().put("PRODUCT_MATERIAL", productmaterial);// erp填交货时间，mes对应更改到货日期
								update.getColMap().put("PRODUCT_COUNT", productcount);//
								update.getColMap().put("PROLEPSIS_START_DATE", DateUtil.parseDate(String.valueOf(stardate), "yyyy-MM-dd"));// 组织机构
								update.getColMap().put("PROLEPSIS_END_DATE", DateUtil.parseDate(String.valueOf(enddate), "yyyy-MM-dd"));// 备注
								update.getColMap().put("CREATE_USER", createuser);// 
								update.getColMap().put("EDIT_USER", edituser);// 
								update.getColMap().put("CUST_CODE", custcode);// 
								update.getColMap().put("DESTROY_NO", destroyno);//
								//品名
//								sql = "SELECT t.CI_ITEM_NAME FROM T_CO_ITEM t  WHERE CI_ITEM_CODE  =?";//这是必然事件
//								list = modelService.listDataSql(sql, new Object[] {productmaterial});
//								String qwe = list.get(0).get("CI_ITEM_NAME").toString();
//								update.getColMap().put("PRODUCT_NAME", qwe);//品名
								//
								update.getColMap().put("WORKSTATION", workstation);// 
								update.getColMap().put("DATA_AUTH", dataAuth);// 
								update.getColMap().put("COMMENT1", comment1);// 
								update.getColMap().put("COMMENT2", comment2);// 
								update.getColMap().put("COMMENT3", comment3);// 
								update.getColMap().put("COMMENT4", comment4);// 
								update.getColMap().put("COMMENT5", comment5);// 
								update.getColMap().put("COMMENT6", comment6);// 
	 	 						//判断制令单状态和生产领料状态是否开立
								//||(list006!=null&&list006.size()>0)    ||(wod_status!=null&&!wod_status.equals(""))
								if(list001!=null&&list001.size()>0){
									//
									String PM_STATUS = list001.get(0).get("PM_STATUS").toString();
								
	 	 						if(PM_STATUS!=null&&!PM_STATUS.equals("")){
	 	 							returnErrorMsg+= toErrorStr(erpDoc,dataauth,"","",erpdocname);
	 	 							}else{
	 	 								update.getColMap().put("ERP_STUATE", statustype);
	 	 							}
								}else if(list006!=null&&list006.size()>0){
									String wod_status = list006.get(0).get("WOD_STATUS").toString();
									if(wod_status!=null&&!wod_status.equals("")){
										returnErrorMsg+= toErrorStr(erpDoc,dataauth,"","",erpdocname);
									}else{
										update.getColMap().put("ERP_STUATE", statustype);
									}
								}else{
									update.getColMap().put("ERP_STUATE", statustype);
								}
								if(statustype.equals("7")&&statustype=="7"){
									update.getColMap().put("PROJECT_STATUS", "3");
								}else{
									update.getColMap().put("PROJECT_STATUS", "1");
								}
								//
								update.getColMap().put("ERP_STUATE", statustype);
								update.getColMap().put("OUTSOURCING_FLAG", flag);// 
								update.getColMap().put("ITEM_VERSION", itemvertion);
								String zw001="select PM_IS_ADD from T_PM_PROJECT_BASE where PROJECT_ID = '"+erpDoc+"'and erp_doc = '"+erpDoc+"'";
					    	       List<Map<Object,Object>> list009 = modelService.listDataSql(zw001);
					    	       String zw = list009.get(0).get("PM_IS_ADD").toString();
					    	       if(zw.equals("N")){
					    	    	   update.getColMap().put("PM_IS_ADD", "N");
					    	       }else if(zw.equals("Y")){
					    	    	   update.getColMap().put("PM_IS_ADD", "U");
					    	       }else{
					    	    	   update.getColMap().put("PM_IS_ADD", "U");
					    	       }
//								update.getColMap().put("PM_IS_ADD", "U");
								update.getColMap().put("SUP_CODE", supcode);
								update.getColMap().put("PROJECT_TYPE", projecttype);
								modelService.edit(update);// 存储
//								addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),erpDoc);
					     
					

						for (int j = 0; j < poItemDetailList.get(i).size(); j++) {
							itemcode = poItemDetailList.get(i).get(j).get("CBD_ITEM_CODE");
							unit = poItemDetailList.get(i).get(j).get("CBD_UNITS");
							itemnum = poItemDetailList.get(i).get(j).get("CBD_ITEM_NUM");
							vertion = poItemDetailList.get(i).get(j).get("ITEM_VERSION");
											String sql001 = " select t.PROJECT_ID from T_PM_PROJECT_DETAIL t " +
													" where t.CBD_ITEM_CODE='"+ itemcode+ "' and t.PROJECT_ID ='"+ erpDoc + "'";
											List<Map<Object,Object>> list002=CommMethod.getBaseService().listDataSql(sql001);
											if (list002!=null&&list002.size()>0) {
												update = new TableDataMapExt();
												update.setTableName("T_PM_PROJECT_DETAIL");
												update.setSqlWhere("and CBD_ITEM_CODE='"+ itemcode+ "' and PROJECT_ID ='"+ erpDoc + "' ");
												update.getColMap().put("CBD_UNITS",unit);// toInteger(wpdPlanNum)
												update.getColMap().put("CBD_ITEM_NUM", itemnum);// ERP传过来的数量
												update.getColMap().put("ITEM_VERSION", vertion);// DateUtil.parseDate(String.valueOf(createTime),
												// "yyyy-MM-dd")
												update.getColMap().put("DATA_AUTH",dataAuth);// 组织机构
												update.getColMap().put("EDIT_TIME",DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()),"yyyy-MM-dd"));
												modelService.edit(update);
												// addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),erpDoc);
											} else {
												save = new TableDataMapExt();
												save.setTableName("T_PM_PROJECT_DETAIL");
												save.getColMap().put("CBD_ITEM_CODE", itemcode);
												save.getColMap().put("CBD_UNITS",unit);// toInteger(wpdPlanNum)
//												if (itemnum.toString().equals("")) {
//													System.out.println(itemnum);
//												}
												//double temp1 = Double.parseDouble(itemnum.toString());// ERP传过来的单位用量
												//int c1 = (int) Math.ceil(temp1);
												save.getColMap().put("CBD_ITEM_NUM", itemnum);
												save.getColMap().put("PROJECT_ID",erpDoc);
												save.getColMap().put("ITEM_VERSION", vertion);// DateUtil.parseDate(String.valueOf(createTime),// "yyyy-MM-dd")
												save.getColMap().put("DATA_AUTH",dataAuth);// 组织机构
												save.getColMap().put("ID",StringUtils.getUUID());
												save.getColMap().put("CREATE_TIME",DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()),"yyyy-MM-dd"));
												modelService.save(save);
												// addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),erpDoc);
											}
						               }
					   }
 					   
					 //新增
					} else {
						// 保存base信息
						save = new TableDataMapExt();
						save.setTableName("T_PM_PROJECT_BASE");
						save.getColMap().put("CREATE_TIME",DateUtil.parseDate(String.valueOf(createtime),"yyyy-MM-dd"));
						save.getColMap().put("EDIT_TIME",DateUtil.parseDate(String.valueOf(edittime),"yyyy-MM-dd"));
						save.getColMap().put("ERP_DOC", erpDoc);//
						save.getColMap().put("PROJECT_ID", erpDoc);
						save.getColMap().put("ERP_DOCNAME", erpdocname);//
						save.getColMap().put("WIP_ENTITY_NAME_H", fatherpdocname);
						save.getColMap().put("PRODUCT_MATERIAL",productmaterial);//
						save.getColMap().put("PRODUCT_COUNT", productcount);//
						save.getColMap().put("ACTUAL_START_DATE",DateUtil.parseDate(String.valueOf(stardate),"yyyy-MM-dd"));// 组织机构
						save.getColMap().put("ACTUAL_END_DATE",DateUtil.parseDate(String.valueOf(enddate),"yyyy-MM-dd"));// 备注
						save.getColMap().put("CREATE_USER", createuser);//
						save.getColMap().put("EDIT_USER", edituser);//
						save.getColMap().put("CUST_CODE", custcode);//
						save.getColMap().put("ID", StringUtils.getUUID());//
						save.getColMap().put("DESTROY_NO", destroyno);//
						save.getColMap().put("WORKSTATION", workstation);//

						// 品名
						sql = "SELECT t.CI_ITEM_NAME FROM T_CO_ITEM t  WHERE CI_ITEM_CODE  =?";
						list = modelService.listDataSql(sql,new Object[] { productmaterial });
				 		if(list!=null&&list.size()>0){
							String qwe = list.get(0).get("CI_ITEM_NAME").toString();
							save.getColMap().put("PRODUCT_NAME", qwe);// 品名
				 		}else{
				 			save.getColMap().put("PRODUCT_NAME", null);// 品名
				 		}
						
							//
							save.getColMap().put("DATA_AUTH", dataAuth);//
							save.getColMap().put("COMMENT1", comment1);//
							save.getColMap().put("COMMENT2", comment2);//
							save.getColMap().put("COMMENT3", comment3);//
							save.getColMap().put("COMMENT4", comment4);//
							save.getColMap().put("COMMENT5", comment5);//
							save.getColMap().put("COMMENT6", comment6);//
							save.getColMap().put("ERP_STUATE", statustype);//
							save.getColMap().put("OUTSOURCING_FLAG", flag);//
							save.getColMap().put("ITEM_VERSION", itemvertion);
							save.getColMap().put("SUP_CODE", supcode);
							save.getColMap().put("PROJECT_TYPE", projecttype);
							modelService.save(save);// 存储
				 		
				// 		}else{
				// 			returnErrorMsg += toErrorStr(new Object[] { erpDoc,dataauth, "物料编码不存在" });
				// 		}
						for (int j = 0; j < poItemDetailList.get(i).size(); j++) {
							itemcode = poItemDetailList.get(i).get(j).get("CBD_ITEM_CODE");
							unit = poItemDetailList.get(i).get(j).get("CBD_UNITS");
							itemnum = poItemDetailList.get(i).get(j).get("CBD_ITEM_NUM");
							vertion = poItemDetailList.get(i).get(j).get("ITEM_VERSION");

							save = new TableDataMapExt();
							save.setTableName("T_PM_PROJECT_DETAIL");
							save.getColMap().put("CBD_ITEM_CODE", itemcode);
							save.getColMap().put("CBD_UNITS", unit);// toInteger(wpdPlanNum)
//							if (itemnum.toString().equals("")) {
//								System.out.println(itemnum);
//							}
							//double temp = Double.parseDouble(itemnum.toString());// ERP传过来的单位用量
							//int c = (int) Math.ceil(temp);
							save.getColMap().put("CBD_ITEM_NUM", itemnum);
							save.getColMap().put("PROJECT_ID", erpDoc);
							save.getColMap().put("ITEM_VERSION", vertion);// DateUtil.parseDate(String.valueOf(createTime),// "yyyy-MM-dd")
							save.getColMap().put("DATA_AUTH", dataAuth);// 组织机构
							save.getColMap().put("ID", StringUtils.getUUID());
							save.getColMap().put("CREATE_TIME",DateUtil.parseDate(String.valueOf(DateUtil.getCurDateStr()), "yyyy-MM-dd"));
							modelService.save(save);
				// 			addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),erpDoc);
						}
					}
				} else {
					returnErrorMsg += toErrorStr(erpDoc,dataauth, errorMsg,"","");
				}

				errorMsg = "";
                addErrorDate(save, xmlMsg, toErrorXml(returnErrorMsg),erpDoc);
			}

			if (returnErrorMsg.equals("")) {

				resmap.put("isSuccess", "Y");
				resmap.put("errorMsg", "OK");

			} else {
				resmap.put("isSuccess", "N");
				resmap.put("errorMsg", toErrorXml(returnErrorMsg));
			}

		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
			hbtran.rollback();
			resmap.put("isSuccess", "N");
			resmap.put("errorMsg", toErrorXml(toErrorStr("", "",e.toString(),"","")));
			addErrorDate(save, xmlMsg, toErrorXml(toErrorStr("","", e.toString(),"","")),null);
			return resmap;

		}
		
		hbtran.commit();
		return resmap;

	}

	public boolean isInteger(String str) {
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		return pattern.matcher(str).matches();
	}

	@SuppressWarnings("unchecked")
	public String getReceiveNo(String ids, String prefix, String dispatchSn,
			ModelService modelService) {
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = { 1, 2, 3 };
		int[] outplace = { 4, 5 };
		List<Object> list = new ArrayList<Object>();
		List<Object> outType = new ArrayList<Object>();
		list.add(ids);
		list.add(prefix);
		list.add(dispatchSn);
		outType.add("String");
		outType.add("String");
		pf.setClassName("P_C_GET_DOC_NO");// 生成检验单号
		pf.setInPlace(inPlace);// 存储过程中in
		pf.setOutPlace(outplace); // 存储过程中out
		pf.setValArgs(list);// 存储过程中输入的参数
		pf.setTotalLen(list.size() + outType.size());// 总个数
		pf.setOutValType(outType);// 输出的参数
		List<Object> relist = modelService.procComm(pf);// 接收返回值
		String res = (String) relist.get(0); // 结果
		return res;
	}

	String toErrorStr(Object... objects) {

		String xmlStr = "<DATA>\n" + "<ERP_DOC>" + String.valueOf(objects[0])
				+ "</ERP_DOC>\n" + "<DATA_AUTH>" + String.valueOf(objects[1])
				+ "</DATA_AUTH>\n" + "<ERROR_MSG>" + String.valueOf(objects[2])
				+ "</ERROR_MSG>\n" + "<CBD_ITEM_CODE>" + String.valueOf(objects[3])
				+ "</CBD_ITEM_CODE>\n" + "<ERP_DOCNAME>" + String.valueOf(objects[4])
				+ "</ERP_DOCNAME>\n" + "</DATA>\n";

		return xmlStr;
	}

	String toErrorXml(String string) {

		String xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
				+ "<MESDATAS>\n" + string + "</MESDATAS>";
		return xml;
	}

	// 数值装换
	Integer toInteger(Object object) {
		if (object != null && !"".equals(object) && !"null".equals(object)) {
			return Integer.parseInt(String.valueOf(object));
		} else {
			return 0;
		}

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	Object getDataId(Object object) {
		String data = "select ID from sy_dept t where T.dep_sn = ?";

		List<Map> list = modelService
				.listDataSql(data, new Object[] { object });

		if (list.size() > 0) {

			return String.valueOf(list.get(0).get("ID"));

		} else {

			return "";
		}

	}

	@SuppressWarnings("unchecked")
	int addErrorDate(TableDataMapExt save,Object erpJson,Object mesJson,Object erpno){
		 save=new TableDataMapExt();
//		 TableDataMapExt update=new TableDataMapExt();
//		 String sql="select * from t_co_erplog t where t.erpno='"+erpno+"' and t.OBJECTNAME='PRODTASK'";
//		 List listzw = modelService.listDataSql(sql);
//		 if(listzw.size()>0){
//			 update.setTableName("T_CO_ERPLOG");
////			 update.getColMap().put("ID", StringUtils.getUUID());
//			 update.setSqlWhere("and erpno='"+ erpno+ "' and OBJECTNAME ='PRODTASK' ");
//			 update.getColMap().put("ERPJASON", erpJson);
//			 update.getColMap().put("MESJASON", mesJson);
//			 update.getColMap().put("OPERATEDATE", DateUtil.getCurDate());
////			 update.getColMap().put("OBJECTNAME", "PRODTASK");
//			 update.getColMap().put("SYNCDIRECTION", "1");
////			 update.getColMap().put("ERPNO", erpno);
//			 return modelService.edit(update);
//		 }
		 save.setTableName("T_CO_ERPLOG");
		 save.getColMap().put("ID", StringUtils.getUUID());
		 save.getColMap().put("ERPJASON", erpJson);
		 save.getColMap().put("MESJASON", mesJson);
		 save.getColMap().put("OPERATEDATE", DateUtil.getCurDate());
		 save.getColMap().put("OBJECTNAME", "PRODTASK");
		 save.getColMap().put("SYNCDIRECTION", "1");
		 save.getColMap().put("ERPNO", erpno);
		 return modelService.save(save);
	 }

}
