package com.more.mes.erpservice.writeback;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.mes.erpservice.writeback.util.WsServiceUtil;

import net.sf.json.JSONObject;
/**
 * 金碟u8ERP
 * 回写生产领料单
 * 业务逻辑说明
 * 业务逻辑说明
 * 1、获取需要回写的数据
 * 	  1.1单据类型DJ10
 * 	  1.2收发类型的回写标识为Y
      1.3交接人为不为空
	  1.4未回写过的数据
 * 2、根据接口报文格式回写erp
 * 3、回写成功后
 *   3.1修改detail的上传数据为Y和上传时间
 *   3.2修改item的回写数量和最新回写时间
 * @author wxw
 */
public class WbProCollarServiceJob implements IJobx {
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

	/**
	 * 生产领料单回写DJ10
	 */
	@Override
	public void exec(Args args) throws Exception {
		proCollar(null,null);
	}

	public String proCollar(String docnum,String LOGIN_NAME) {
		String result = "";
		List<Map<String, String>> list = this.getList(docnum);
		if (list != null && list.size() > 0) {
			Map<String,Map<String,String>> item=new HashMap<String,Map<String,String>>();
			List<Map<String,String>> listDoc=new ArrayList<Map<String,String>>();
			List<Map<String, String>> newlist=getresult(list,item,listDoc);
			result = deal(newlist,item,listDoc,LOGIN_NAME);
		}else{
			result="没有回写数据";
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	private String deal(List<Map<String, String>> list,Map<String,Map<String,String>> item
			,List<Map<String,String>> listDoc,String LOGIN_NAME) {
		StringBuilder result = new StringBuilder();
		int docsize=listDoc.size();
		for(int j=0;j<docsize;j++){
			Map<String,Object> jsonMap=new HashMap<String,Object>();//每一单回写erp的报文
			List<Map<String,String>> ItemList=new ArrayList<Map<String,String>>();//每单对应回写erp报文的表身
			List<Map<String,String>> DealItemList=new ArrayList<Map<String,String>>();//保存回写成功后修改的表
			
			Map<String,String> DocTemp=listDoc.get(j);
			jsonMap.put("code", DocTemp.get("CODE"));// 领料单号（Mes）
			jsonMap.put("dtvdate", DocTemp.get("DTVDATE"));// 单据日期
			jsonMap.put("cowhcode", DocTemp.get("COWHCODE"));// 转出仓库编码
			jsonMap.put("cacc", DocTemp.get("CACC"));// 账套号
			jsonMap.put("cmpocode", DocTemp.get("CMPOCODE"));// 生产订单号
			jsonMap.put("define10", DocTemp.get("PPE_PLATE"));// 板别
			String DocKey=DocTemp.get("DOCKEY");
			String DOCNUM=DocTemp.get("CODE");//单据号
			
			int size = list.size();
			for (int i = 0; i < size; i++) {
				Map<String, String> temp = list.get(i);
				String ItemDocKey=temp.get("DOCKEY");
				if(DocKey.equals(ItemDocKey)){
					DealItemList.add(temp);//保存需要修改的表
					Map<String,String> ItemDetail=new HashMap<String,String>();
					ItemDetail.put("cinvcode", temp.get("CINVCODE"));// 存货编码
					ItemDetail.put("itvquantity", temp.get("ITVQUANTITY"));// 数量
					ItemList.add(ItemDetail);
				}
			}
			jsonMap.put("list", ItemList);
			String json = JSONObject.fromObject(jsonMap).toString();
			String MethodName = "U8cwRequistion";
			
			MsHTranMan tran = BussService.getHbTran();
			try {
				Map<String, String> map = WsServiceUtil.postServicelOGIN_NAME(MethodName, json, "生产领料单回写", 33,DOCNUM,LOGIN_NAME);
//				Map<String, String> map=new HashMap<String,String>();
//				map.put("errcode", "0");
//				map.put("errmsg", "测试采购入库回写");
				int Dealsize=DealItemList.size();
				
				if (map.get("errcode").equals(WsServiceUtil.RESULTCODE_SUCCESS)) {
					for(int i=0;i<Dealsize;i++){
						Map<String,String> temp=DealItemList.get(i);
						String ITEM_ID = temp.get("ITEM_ID");//
						String KEY=temp.get("KEY");
						float num = Float.parseFloat(temp.get("ITVQUANTITY"));
						String update = "UPDATE T_WMS_OUTSTOCK_ITEM SET WOI_WB_NUMBER=WOI_WB_NUMBER+" + num + ",WOI_WB_TIME=sysdate,WOI_WB_MSG='"+map.get("errmsg")+"' where ID='" + ITEM_ID + "'";
						modelService.execSql(update);
						
						TableDataMapExt detail = new TableDataMapExt();
						Map<String,String> itemMap=item.get(KEY);
						for(String mapKey:itemMap.keySet()){
							detail.clear();
							detail.setTableName("T_WMS_OUTSTOCK_DETAIL");
							detail.setSqlWhere(" AND ID='" + mapKey + "'");
							detail.getColMap().put("WOD_UPLOAD_FLAG", "Y");
							detail.getColMap().put("WOD_UPLOAD_TIME", new Date());
							modelService.edit(detail);
						}
					}
				} else {
					for(int i=0;i<Dealsize;i++){
						Map<String,String> temp=DealItemList.get(i);
						String ITEM_ID = temp.get("ITEM_ID");//
						String update = "UPDATE T_WMS_OUTSTOCK_ITEM SET WOI_WB_TIME=sysdate,WOI_WB_MSG='"+map.get("errmsg")+"' where ID='" + ITEM_ID + "'";
						modelService.execSql(update);
					}
					result.append("生产领料单：" + DOCNUM + "、仓库:" + DocTemp.get("COWHCODE") + "回写失败,原因："+map.get("errmsg")+";");
				}
				tran.commit();
			} catch (Exception e) {
				tran.rollback();
			}
			
		}
		
		return result.toString();
	}
	
	/**
	 * 对查询的结果的明细 做整合处理 
	 * 同一 单号+ITEM_ID+料号+仓库相同的数量是累加，并回写给ERP
	 * @param list
	 * @param item
	 * @return
	 */
	private static List<Map<String,String>> getresult(List<Map<String,String>> list
			,Map<String,Map<String,String>> item,List<Map<String,String>> listDoc){
		List<Map<String,String>> result=new ArrayList<Map<String,String>>();
		Set<String> CKCODE_SEQ = new HashSet<String>(); //判断key是否重复
		Set<String> CKDOCKEY_SEQ = new HashSet<String>();//单据号的唯一标识
		
		if(list!=null&&list.size()>0){
			int size=list.size();
			for(int i=0;i<size;i++){
				Map<String,String> temp=list.get(i);
				//单据号+仓库+账号+生产订单号(关联关系)+板别当做唯一标识
				String DocKey=temp.get("CODE")+temp.get("COWHCODE")+temp.get("CACC")+temp.get("CMPOCODE")+temp.get("DEFINE10");
				temp.put("DOCKEY", DocKey);
				boolean ckORDER=CKDOCKEY_SEQ.add(DocKey);
				if(ckORDER){
					Map<String,String> OrderTemp=new HashMap<String,String>();
					OrderTemp.put("CODE", temp.get("CODE"));//领料单号（Mes）
					OrderTemp.put("DTVDATE", temp.get("DTVDATE"));//单据日期
					OrderTemp.put("COWHCODE", temp.get("COWHCODE"));//转出仓库编码
					OrderTemp.put("DEFINE10", temp.get("DEFINE10"));//板别
					OrderTemp.put("CACC", temp.get("CACC"));//账套号
					OrderTemp.put("CMPOCODE", temp.get("CMPOCODE"));//生产订单号(关联关系)
					
					OrderTemp.put("DOCKEY", DocKey);
					listDoc.add(OrderTemp);
				}
				
				String key=temp.get("CODE")+temp.get("ITEM_ID")+temp.get("CINVCODE")+temp.get("COWHCODE");//单号+ITEM_ID+料号+仓库
				boolean ck=CKCODE_SEQ.add(key);
				if(!ck){
					for(int j=0;j<result.size();j++){
						Map<String,String> temp2=result.get(j);
						if(temp2.containsValue(key)){ //修改对应的数量
							String num=temp2.get("ITVQUANTITY");
							String num2=temp.get("ITVQUANTITY");
							
							temp2.put("ITVQUANTITY", String.valueOf(Float.parseFloat(num)+Float.parseFloat(num2)));
							Map<String,String> itemMap=item.get(key);
							itemMap.put(temp.get("ID"), temp.get("ID"));
							break;
						}
					}
				}else{
					temp.put("KEY", key);
					result.add(temp);
					
					Map<String,String> itemMap=new HashMap<String,String>();
					itemMap.put(temp.get("ID"), temp.get("ID"));
					item.put(key, itemMap);
				}
			}
		}
		return result;
	}

	/**
	 * 获取生产领料单未回写的数据集合
	 * @param WRD_DOC_NUM
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, String>> getList(String WOD_DOC_NUM){
		String sql="SELECT TT.* FROM ( "+
						"select wod_doc_type,T.WOD_DOC_NUM CODE,to_char(NVL(T.WOD_HANDOVER_TIME, t.Wod_Outstock_Time),'YYYY-MM-DD') dTVDate, "+
						        "T3.WA_ERP_CODE cOWhCode,''cIWhCode,'' cIRdCode ,'' cORdCode,T4.ERP_CODE cAcc, "+
						        "t9.woi_item_code cInvCode,to_char(t.wod_outstock_num) iTVQuantity, "+
						         "CASE WHEN T2.WOD_PICK_TYPE=1 THEN T7.ERP_PROJECT_ID WHEN T2.WOD_PICK_TYPE=3 THEN T5.ERP_PROJECT_ID  END cmpocode, " +
						         "CASE WHEN T2.WOD_PICK_TYPE=1 THEN CASE WHEN T11.PPE_PLATE IS NULL THEN '' ELSE T12.VALUE END ELSE '' END PPE_PLATE, "+
						        "T.ID,T9.ID ITEM_ID,T.DATA_AUTH "+
						         "from T_WMS_OUTSTOCK_DETAIL T "+
						               "inner join t_wms_outstock_doc t2 on t.wod_doc_num=t2.wod_doc_num "+
						               "INNER JOIN T_WMS_OUTSTOCK_ITEM T9 ON T.WOD_ITEM_ID=T9.ID "+
						              "INNER JOIN T_WMS_AREA T3 ON T.WOD_WH_CODE=T3.WA_AREA_SN "+
						              "INNER JOIN SY_DEPT T4 ON T4.ID=T.DATA_AUTH  "+
						              "LEFT JOIN T_PM_PROJECT_BASE T5 ON T9.WOI_PROJECT_ID=T5.PROJECT_ID AND T2.WOD_PICK_TYPE=3 "+
						              "LEFT JOIN T_PM_MO_BASE T6 ON T9.WOI_CONNECT_DOC=T6.PM_MO_NUMBER AND T2.WOD_PICK_TYPE=1 "+
						              "LEFT JOIN SY_DICT_VAL T12 ON T12.DICT_CODE='SMT_PLATE' AND T12.CODE=T6.PM_SMT_PLATE "+
						              "LEFT JOIN T_PM_PROJECT_BASE T7 ON T6.PM_PROJECT_ID=T7.PROJECT_ID "+
						              "LEFT JOIN T_WMS_DISPATCH_TYPE T8 ON T8.WDT_TYPE_SN=T2.WOD_DOC_TYPE AND T8.DATA_AUTH=T2.DATA_AUTH "+
						              "LEFT JOIN T_PM_PLAN_ERP T11 ON T11.PPE_PLAN_ORDER=T5.ERP_PROJECT_ID AND T11.PPE_RELATION=T5.ERP_PROJECT_ID "+
						              "where t2.wod_doc_type='DJ10' AND T.WOD_HANDOVER_EMP IS NOT NULL AND T.WOD_UPLOAD_FLAG='N' "+
						 "UNION ALL "+
						 "select wod_doc_type,T.WOD_DOC_NUM CODE,to_char(t.wod_outstock_time,'YYYY-MM-DD') dTVDate, "+ 
		                    "T3.WA_ERP_CODE cOWhCode,''cIWhCode,'' cIRdCode ,'' cORdCode,T4.ERP_CODE cAcc,  "+
		                    "t9.woi_item_code cInvCode,to_char(t.wod_outstock_num) iTVQuantity,  "+
		                     " T5.ERP_PROJECT_ID   cmpocode, CASE WHEN T11.PPE_PLATE IS NULL THEN '' ELSE  T7.VALUE END PPE_PLATE, "+
		                    "T.ID,T9.ID ITEM_ID,T.DATA_AUTH  "+
		                     "from T_WMS_OUTSTOCK_DETAIL T  "+
		                           "inner join t_wms_outstock_doc t2 on t.wod_doc_num=t2.wod_doc_num  "+
		                          " INNER JOIN T_WMS_OUTSTOCK_ITEM T9 ON T.WOD_ITEM_ID=T9.ID  "+
		                          "INNER JOIN T_WMS_AREA T3 ON T.WOD_WH_CODE=T3.WA_AREA_SN  "+
		                         " INNER JOIN SY_DEPT T4 ON T4.ID=T.DATA_AUTH   "+
		                         " LEFT JOIN T_PM_PROJECT_BASE T5 ON T9.WOI_PROJECT_ID=T5.PROJECT_ID  "+
		                         " LEFT JOIN T_PM_MO_BASE T6 ON T6.PM_MO_NUMBER=T9.WOI_CONNECT_DOC "+
		                         " LEFT JOIN SY_DICT_VAL T7 ON T7.DICT_CODE='SMT_PLATE' AND T7.CODE=T6.PM_SMT_PLATE"+
		                         " LEFT JOIN T_PM_PLAN_ERP T11 ON T11.PPE_PLAN_ORDER=T5.ERP_PROJECT_ID AND T11.PPE_RELATION=T5.ERP_PROJECT_ID "+
		                          "where t2.wod_doc_type='DJ14' AND T.WOD_HANDOVER_EMP IS NOT NULL AND T.WOD_UPLOAD_FLAG='N' "+
		                         " AND T2.WOD_DISPATCH_SN='OOZLDLL' "+ //--制令单领料
						              ")TT  WHERE cmpocode IS not NULL ";
		if(StringUtils.isNotBlank(WOD_DOC_NUM)){
			sql+=" AND CODE='"+WOD_DOC_NUM+"'";
		}
		List<Map<String, String>> list =modelService.listDataSql(sql);
		return list;
	}
}
