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
 * 回写生产退料单
 * 业务逻辑说明
 * 业务逻辑说明
 * 1、获取需要回写的数据
 * 	  1.1单据类型DJ03
 * 	  1.2收发类型的回写标识为Y
      1.3交接人为不为空
	  1.4未回写过的数据
 * 2、根据接口报文格式回写erp
 * 3、回写成功后
 *   3.1修改detail的上传数据为Y和上传时间
 *   3.2修改item的回写数量和最新回写时间
 * @author wxw
 *
 */
public class WbProBackCollarServiceJob implements IJobx {
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

	/**
	 * 生产退料单回写DJ03
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
			jsonMap.put("code", DocTemp.get("CODE"));// 退料单号（Mes）
			jsonMap.put("dtvdate", DocTemp.get("DTVDATE"));// 单据日期
			//jsonMap.put("cowhcode", temp.get("COWHCODE"));// 转出仓库编码
			 jsonMap.put("ciwhcode", DocTemp.get("CIWHCODE"));//转入仓库编码
			// jsonMap.put("cirdcode", temp.get("CIRDCODE"));//入库类别编码（固定值）
			// jsonMap.put("cordcode", temp.get("CORDCODE"));//出库类别编码（固定值）
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
			String MethodName = "U8Material";
			
			MsHTranMan tran = BussService.getHbTran();
			try {
				Map<String, String> map = WsServiceUtil.postServicelOGIN_NAME(MethodName, json, "生产退料单回写", 34,DOCNUM,LOGIN_NAME);
//				Map<String, String> map=new HashMap<String,String>();
//				map.put("errcode", "0");
//				map.put("errmsg", "测试采购入库回写");
				int Dealsize=DealItemList.size();
				
				if (map.get("errcode").equals(WsServiceUtil.RESULTCODE_SUCCESS)) {
					for(int i=0;i<Dealsize;i++){
						Map<String,String> temp=DealItemList.get(i);
						float num = Float.parseFloat(temp.get("ITVQUANTITY"));
						String ITEM_ID = temp.get("ITEM_ID");
						String KEY=temp.get("KEY");
						String update = "UPDATE T_WMS_RECEIVE_ITEM SET WRI_WB_NUMBER=nvl(WRI_WB_NUMBER,0)+" + num + ",WRI_WB_TIME=sysdate,WRI_WB_MSG='"+map.get("errmsg")+"' where ID='" + ITEM_ID + "'";
						modelService.execSql(update);
						
						TableDataMapExt detail = new TableDataMapExt();
						Map<String,String> itemMap=item.get(KEY);
						for(String mapKey:itemMap.keySet()){
							detail.clear();
							detail.setTableName("T_WMS_RECEIVE_DETAIL");
							detail.setSqlWhere(" AND ID='" + mapKey + "'");
							detail.getColMap().put("WRD_UPLOAD_FLAG", "Y");
							detail.getColMap().put("WRD_UPLOAD_TIME", new Date());
							modelService.edit(detail);
						}
					}
					
				} else {
					for(int i=0;i<Dealsize;i++){
						Map<String,String> temp=DealItemList.get(i);
						String ITEM_ID = temp.get("ITEM_ID");//
						String update="UPDATE T_WMS_RECEIVE_ITEM SET WRI_WB_TIME=sysdate,WRI_WB_MSG='"+map.get("errmsg")+"' where ID='"+ITEM_ID+"'";
						modelService.execSql(update);
					}
					
					result.append("生产退料单：" + DOCNUM + "、仓库:" + DocTemp.get("CIWHCODE") + "回写失败,原因："+map.get("errmsg")+";");
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
				Map<String,String> temp=null;
				temp=list.get(i);
				//单据号+仓库+账号+生产订单号(关联关系)+板别当做唯一标识
				String DocKey=temp.get("CODE")+temp.get("COWHCODE")+temp.get("CACC")+temp.get("CMPOCODE")+temp.get("DEFINE10");
				temp.put("DOCKEY", DocKey);
				boolean ckORDER=CKDOCKEY_SEQ.add(DocKey);
				if(ckORDER){
					Map<String,String> OrderTemp=new HashMap<String,String>();
					OrderTemp.put("CODE", temp.get("CODE"));//领料单号（Mes）
					OrderTemp.put("DTVDATE", temp.get("DTVDATE"));//单据日期
					OrderTemp.put("CIWHCODE", temp.get("CIWHCODE"));//转入仓库编码
					OrderTemp.put("DEFINE10", temp.get("DEFINE10"));//板别
					OrderTemp.put("CACC", temp.get("CACC"));//账套号
					OrderTemp.put("CMPOCODE", temp.get("CMPOCODE"));//生产订单号(关联关系)
					
					OrderTemp.put("DOCKEY", DocKey);
					listDoc.add(OrderTemp);
				}
				
				String key=temp.get("WRD_DOC_NUM")+temp.get("ITEM_ID")+temp.get("CINVCODE")+temp.get("COWHCODE");//单号+ITEM_ID+料号+仓库
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
	 * 获取生产退料单未回写的数据集合
	 * @param WRD_DOC_NUM
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, String>> getList(String WRD_DOC_NUM){
		String sql="SELECT T.* FROM ( "+
				"SELECT DISTINCT T.WRD_DOC_NUM CODE,TO_CHAR(NVL(T.WRD_HANDOVER_TIME, T.WRD_RECEIVE_TIME),'YYYY-MM-DD')DTVDATE, "+
		       "T4.WA_ERP_CODE CIWHCODE,T5.ERP_CODE CACC,  "+
		       "CASE WHEN (T11.WOD_PICK_TYPE=1 or (T11.WOD_PICK_TYPE IS NULL AND T11.WOD_DOC_TYPE='DJ14')) THEN T15.ERP_PROJECT_ID WHEN T11.WOD_PICK_TYPE=3 THEN T13.ERP_PROJECT_ID  END CMPOCODE,"+
		       " CASE WHEN T16.PPE_PLATE IS NULL THEN '' ELSE  T14.PM_SMT_PLATE END  PPE_PLATE, "+
		       "T.WRD_ITEM_CODE CINVCODE,TO_CHAR(T.WRD_SPLIT_NUM) ITVQUANTITY,T2.ID ITEM_ID,T.ID,T.WRD_DOC_NUM,T.DATA_AUTH "+
		        "FROM T_WMS_RECEIVE_DETAIL T  "+
		              "INNER JOIN T_WMS_RECEIVE_ITEM T2 ON T.WRD_ITEM_ID=T2.ID "+
		              "INNER JOIN T_WMS_RECEIVE_DOC T3 ON T.WRD_DOC_NUM=T3.WRD_DOC_NUM "+
		              "INNER JOIN T_WMS_AREA T4 ON T.WRD_WH_CODE=T4.WA_AREA_SN "+
		              "INNER JOIN SY_DEPT T5 ON T5.ID=T.DATA_AUTH "+
		              "LEFT JOIN T_WMS_DISPATCH_TYPE T8 ON T8.WDT_TYPE_SN=T3.WRD_DOC_TYPE AND T8.DATA_AUTH=T3.DATA_AUTH "+
		              
		              //--查询ERP工单号  制令单板别
		              "INNER JOIN T_WMS_OUTSTOCK_DOC T11 ON T11.WOD_DOC_NUM=T2.WRI_CONNECT_DOC "+
		              "INNER JOIN T_WMS_OUTSTOCK_ITEM T12 ON T12.WOI_DOC_NUM=T11.WOD_DOC_NUM "+
		              //--备料类型 1制令单 3机种BOM
		              "LEFT JOIN T_PM_PROJECT_BASE T13 ON T12.WOI_PROJECT_ID=T13.PROJECT_ID AND T11.WOD_PICK_TYPE=3  "+
		              //--备料类型 1制令单 3机种BOM  或者其他出库单 收发类型为制令单领料的退料
		              "LEFT JOIN T_PM_MO_BASE T14 ON T12.WOI_CONNECT_DOC=T14.PM_MO_NUMBER AND (T11.WOD_PICK_TYPE=1 or (T11.WOD_PICK_TYPE IS NULL AND T11.WOD_DOC_TYPE='DJ14'))  "+
		              "LEFT JOIN T_PM_PROJECT_BASE T15 ON T14.PM_PROJECT_ID=T15.PROJECT_ID "+
		              "LEFT JOIN T_PM_PLAN_ERP T16 ON T16.PPE_PLAN_ORDER=T15.ERP_PROJECT_ID AND T16.PPE_RELATION=T15.ERP_PROJECT_ID "+
		              "WHERE T3.WRD_DOC_TYPE='DJ03' AND T.WRD_HANDOVER_EMP IS NOT NULL AND T.WRD_UPLOAD_FLAG='N' "+
		              ") T "+
		              " WHERE 1=1 AND CMPOCODE IS NOT NULL"; 
		if(StringUtils.isNotBlank(WRD_DOC_NUM)){
			sql+=" AND CODE='"+WRD_DOC_NUM+"'";
		}
		List<Map<String, String>> list =modelService.listDataSql(sql);
		return list;
	}
}
