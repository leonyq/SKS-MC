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
 * 调拨单回写
 *  * 业务逻辑说明
 * 1、获取需要回写的数据
      1.1交接人为不为空
	  1.2未回写过的数据
 * 2、根据接口报文格式回写erp
 * 3、回写成功后
 *   3.1修改detail的上传数据为Y和上传时间
 *   3.2修改item的回写数量和最新回写时间
 * @author wxw
 *
 */
public class WbAllotServiceJob implements IJobx {
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");
	
	@Override
	public void exec(Args args) throws Exception {
		allot(null,null);
	}
	
	public String allot(String docnum,String LOGIN_NAME) {
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
			jsonMap.put("code", DocTemp.get("CODE"));//调拨单号(Mes)
			jsonMap.put("dtvdate", DocTemp.get("DTVDATE"));//单据日期
			jsonMap.put("cowhcode", DocTemp.get("COWHCODE"));//转出仓库编码
			jsonMap.put("ciwhcode", DocTemp.get("CIWHCODE"));//转入仓库编码
			jsonMap.put("cacc", DocTemp.get("CACC"));//账套号
			
			String DocKey=DocTemp.get("DOCKEY");
			String DOCNUM=DocTemp.get("CODE");//单据号
			
			int size=list.size();
			for(int i=0;i<size;i++){
				Map<String,String> temp=list.get(i);
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
			String json=JSONObject.fromObject(jsonMap).toString();
			String MethodName="U8Requisition";
			
			MsHTranMan tran=  BussService.getHbTran();
			try{
				Map<String, String> map=WsServiceUtil.postServicelOGIN_NAME(MethodName, json, "调拨单回写", 39,DOCNUM,LOGIN_NAME);
				int Dealsize=DealItemList.size();
				if(map.get("errcode").equals(WsServiceUtil.RESULTCODE_SUCCESS)){
					for(int i=0;i<Dealsize;i++){
						Map<String,String> temp=DealItemList.get(i);
						String ITVQUANTITY= temp.get("ITVQUANTITY");
						float num=Float.valueOf(ITVQUANTITY);
						String ITEM_ID=temp.get("ITEM_ID");//
						String KEY=temp.get("KEY");
						
						String update="UPDATE T_WMS_ALLOT_ITEM SET WAI_WB_NUMBER=nvl(WAI_WB_NUMBER,0)+"+num+",WAI_WB_TIME=sysdate,WAI_WB_MSG='"+map.get("errmsg")+"' where ID='"+ITEM_ID+"'";
						modelService.execSql(update);
						
						TableDataMapExt detail = new TableDataMapExt();
						Map<String,String> itemMap=item.get(KEY);
						for(String mapKey:itemMap.keySet()){
							detail.clear();
							detail.setTableName("T_WMS_ALLOT_DETAIL");
							detail.setSqlWhere(" AND ID='"+mapKey+"'");
							detail.getColMap().put("WAD_UPLOAD_FLAG", "Y");
							detail.getColMap().put("WAD_UPLOAD_TIME", new Date());
							modelService.edit(detail);
						}
					}
				}else{
					for(int i=0;i<Dealsize;i++){
						Map<String,String> temp=DealItemList.get(i);
						String ITEM_ID=temp.get("ITEM_ID");
						String update="UPDATE T_WMS_ALLOT_ITEM SET WAI_WB_TIME=sysdate,WAI_WB_MSG='"+map.get("errmsg")+"' where ID='"+ITEM_ID+"'";
						modelService.execSql(update);
					}
					
					result.append("调拨单：" + DOCNUM  + "回写失败,原因："+map.get("errmsg")+";");
				}
				tran.commit();
			}catch(Exception e){
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
				//单据号+转出仓库+转入仓库+账号当做唯一标识
				String DocKey=temp.get("CODE")+temp.get("COWHCODE")+temp.get("CIWHCODE")+temp.get("CACC");
				temp.put("DOCKEY", DocKey);
				boolean ckORDER=CKDOCKEY_SEQ.add(DocKey);
				if(ckORDER){
					Map<String,String> OrderTemp=new HashMap<String,String>();
					OrderTemp.put("CODE", temp.get("CODE"));//领料单号（Mes）
					OrderTemp.put("DTVDATE", temp.get("DTVDATE"));//单据日期
					OrderTemp.put("COWHCODE", temp.get("COWHCODE"));//转出仓库编码
					OrderTemp.put("CIWHCODE", temp.get("CIWHCODE"));//转入仓库编码
					OrderTemp.put("CACC", temp.get("CACC"));//账套号
					
					OrderTemp.put("DOCKEY", DocKey);
					listDoc.add(OrderTemp);
				}
				
				String key=temp.get("CODE")+temp.get("ITEM_ID")+temp.get("CINVCODE")+temp.get("COWHCODE")+temp.get("CIWHCODE");//单号+ITEM_ID+料号+出仓库+入仓库
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
	 * 获取调拨单未回写的数据集合
	 * @param WRD_DOC_NUM
	 * @return
	 */
	private List<Map<String, String>> getList(String WAD_DOC_NUM){
		String sql="SELECT T.WAD_DOC_NUM code,TO_CHAR(NVL(T.WAD_HANDOVER_TIME,T.WAD_ALLOT_TIME),'YYYY-MM-DD') dtvdate,T4.WA_ERP_CODE cowhcode, "+
			       "T5.WA_ERP_CODE ciwhcode,T6.ERP_CODE cacc,T.WAD_ITEM_CODE cinvcode "+
			       ",to_char(T.WAD_ALLOT_NUM) itvquantity,T.ID,T2.ID ITEM_ID "+
			        "FROM T_WMS_ALLOT_DETAIL T  "+
			       "INNER JOIN T_WMS_ALLOT_ITEM T2 ON T.WAD_ITEM_ID=T2.ID "+
			       "INNER JOIN T_WMS_ALLOT_DOC T3 ON T3.WAD_DOC_NUM=T2.WAI_DOC_NUM "+
			       "INNER JOIN T_WMS_AREA T4 ON T2.WAI_OUT_WH=T4.WA_AREA_SN "+
			       "INNER JOIN T_WMS_AREA T5 ON T2.WAI_IN_WH=T5.WA_AREA_SN "+
			       "INNER JOIN SY_DEPT T6 ON T6.ID=T3.DATA_AUTH "+
			       "WHERE T.WAD_UPLOAD_FLAG='N' AND T.WAD_HANDOVER_EMP IS NOT NULL";
		if(StringUtils.isNotBlank(WAD_DOC_NUM)){
			sql+=" AND T3.WAD_DOC_NUM='"+WAD_DOC_NUM+"'";
		}
		@SuppressWarnings("unchecked")
		List<Map<String, String>> list =modelService.listDataSql(sql);
		return list;
	}
}
