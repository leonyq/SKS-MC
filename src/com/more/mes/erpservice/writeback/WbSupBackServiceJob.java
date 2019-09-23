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

public class WbSupBackServiceJob implements IJobx {
	/**
	 * 金碟u8ERP
	 * 供应商退料回写接口
	 */
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

	@Override
	public void exec(Args args) throws Exception {
		backMateril(null,null);
	}

	public String backMateril(String docnum,String LOGIN_NAME) {
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
			jsonMap.put("ddate", DocTemp.get("DDATE"));// 入库日期
			jsonMap.put("cwhcode", DocTemp.get("CWHCODE"));// 仓库
			jsonMap.put("crdcode", DocTemp.get("CRDCODE"));// 入库类别（固定值 101）
			jsonMap.put("bredvouch", DocTemp.get("BREDVOUCH"));// 红蓝标识(0 蓝，1 红)
			jsonMap.put("cacc", DocTemp.get("CACC"));// 账套号
			jsonMap.put("cvencode", DocTemp.get("CVENCODE"));// 供应商编码
			jsonMap.put("cordercode", DocTemp.get("CORDERCODE"));// 采购订单编号
			String DocKey=DocTemp.get("DOCKEY");
			
			int size = list.size();
			for (int i = 0; i < size; i++) {
				Map<String, String> temp = list.get(i);
				String ItemDocKey=temp.get("DOCKEY");
				if(DocKey.equals(ItemDocKey)){
					DealItemList.add(temp);//保存需要修改的表
					
					Map<String,String> ItemDetail=new HashMap<String,String>();
					ItemDetail.put("cinvcode", temp.get("CINVCODE"));//存货编码
					ItemDetail.put("iquantity", temp.get("IQUANTITY"));//数量
					ItemList.add(ItemDetail);
				}
			}
			jsonMap.put("list", ItemList);
			String json = JSONObject.fromObject(jsonMap).toString();
			String MethodName = "U8SupplierReturns";
			String WOD_DOC_NUM = DocTemp.get("WOD_DOC_NUM");

			MsHTranMan tran = BussService.getHbTran();
			try {
				Map<String, String> map = WsServiceUtil.postServicelOGIN_NAME(MethodName, json, "供应商退料单回写", 43,WOD_DOC_NUM,LOGIN_NAME);
				int Dealsize=DealItemList.size();
				if (map.get("errcode").equals(WsServiceUtil.RESULTCODE_SUCCESS)) {
					for(int i=0;i<Dealsize;i++){
						Map<String,String> temp=DealItemList.get(i);
						String ITEM_ID = temp.get("ITEM_ID");//
						String KEY=temp.get("KEY");
						float num = Float.parseFloat(temp.get("IQUANTITY"));
						
						String update = "UPDATE T_WMS_OUTSTOCK_ITEM SET WOI_WB_NUMBER=WOI_WB_NUMBER+" + num + ",WOI_WB_TIME=sysdate,WOI_WB_MSG='"+map.get("errmsg")+"' where ID='" + ITEM_ID + "'";
						modelService.execSql(update);
						
						TableDataMapExt detail = new TableDataMapExt();
						Map<String,String> itemMap=item.get(KEY);
						for(String mapKey:itemMap.keySet()){
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
					result.append("供应商退料单：" + WOD_DOC_NUM + "、仓库:" + DocTemp.get("CWHCODE") + "回写失败,原因："+map.get("errmsg")+";");
				}
				tran.commit();
			} catch (Exception e) {
				tran.rollback();
				e.printStackTrace();
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
				//单据号+仓库+账号+供应商编码+采购订单编号当做唯一标识
				String DocKey=temp.get("WOD_DOC_NUM")+temp.get("CWHCODE")+temp.get("CACC")+temp.get("CVENCODE")+temp.get("CORDERCODE");
				temp.put("DOCKEY", DocKey);
				
				boolean ckORDER=CKDOCKEY_SEQ.add(DocKey);
				if(ckORDER){
					Map<String,String> OrderTemp=new HashMap<String,String>();
					OrderTemp.put("WOD_DOC_NUM", temp.get("WOD_DOC_NUM"));//单据号
					OrderTemp.put("DDATE", temp.get("DDATE"));//入库日期 
					OrderTemp.put("CWHCODE", temp.get("CWHCODE"));//仓库
					OrderTemp.put("BREDVOUCH", temp.get("BREDVOUCH"));//红蓝标识(0 蓝，1 红)
					OrderTemp.put("CACC", temp.get("CACC"));//账套号
					OrderTemp.put("CVENCODE", temp.get("CVENCODE"));//供应商编码
					OrderTemp.put("CORDERCODE", temp.get("CORDERCODE"));//采购订单编号
					OrderTemp.put("CRDCODE", temp.get("CRDCODE"));//入库类别（固定值  101）
					
					//OrderTemp.put("WOI_CONNECT_DOC", temp.get("WOI_CONNECT_DOC"));//关联单号
					OrderTemp.put("DOCKEY", DocKey);
					listDoc.add(OrderTemp);
				}
				
				String key=temp.get("WOD_DOC_NUM")+temp.get("ITEM_ID")+temp.get("CINVCODE")+temp.get("COWHCODE");//单号+ITEM_ID+料号+仓库
				boolean ck=CKCODE_SEQ.add(key);
				if(!ck){
					for(int j=0;j<result.size();j++){
						Map<String,String> temp2=result.get(j);
						if(temp2.containsValue(key)){ //修改对应的数量
							String num=temp2.get("IQUANTITY");
							String num2=temp.get("IQUANTITY");
							
							temp2.put("IQUANTITY", String.valueOf(Float.parseFloat(num)+Float.parseFloat(num2)));
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
	 * 供应商退料的数据集合
	 * @param WRD_DOC_NUM
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, String>> getList(String WOD_DOC_NUM){
		String sql="SELECT TO_CHAR(NVL(T.WOD_HANDOVER_TIME, t.Wod_Outstock_Time),'YYYY-MM-DD') ddate,T8.WA_ERP_CODE cwhcode,'101' crdcode, "+
               "'1' bredvouch,T4.ERP_CODE cacc,t2.et_sup_code cvencode, "+
               "T9.Wpi_Erp_No cordercode, "+
               "T.WOD_ITEM_CODE cinvcode,T2.WOI_ITEM_SEQ,to_char(T.WOD_OUTSTOCK_NUM) iquantity, "+
               "T.ID,T2.ID ITEM_ID,T.WOD_DOC_NUM  FROM "+
               "T_WMS_OUTSTOCK_DETAIL T INNER JOIN T_WMS_OUTSTOCK_ITEM T2 ON T.WOD_ITEM_ID=T2.ID "+
               "INNER JOIN T_WMS_OUTSTOCK_DOC T3 ON T2.WOI_DOC_NUM=T3.WOD_DOC_NUM "+
               "INNER JOIN SY_DEPT T4 ON T.DATA_AUTH=T4.ID "+
               "INNER JOIN T_WMS_DISPATCH_TYPE T7 ON T3.WOD_DOC_TYPE =T7.WDT_TYPE_SN AND T7.DATA_AUTH=T2.DATA_AUTH "+
                       "AND T3.WOD_DISPATCH_SN=T7.WDO_DISPATCH_SN "+
               "INNER JOIN T_WMS_AREA T8 ON T8.WA_AREA_SN=T.WOD_WH_CODE "+
               "INNER JOIN T_WMS_PO_INFO T9 ON T9.WPI_PO=T2.WOI_CONNECT_DOC "+
               "WHERE T3.WOD_DOC_TYPE='DJ51' AND T.WOD_UPLOAD_FLAG='N' AND  T7.WDO_UPLOAD_FLAG='Y'" +
               "AND t2.et_sup_code IS NOT NULL ";
		if(StringUtils.isNotBlank(WOD_DOC_NUM)){
			sql+=" AND T3.WOD_DOC_NUM='"+WOD_DOC_NUM+"'";
		}
		List<Map<String, String>> list =modelService.listDataSql(sql);
		return list;
	}
}
