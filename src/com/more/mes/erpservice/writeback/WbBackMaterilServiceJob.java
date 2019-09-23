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
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.mes.erpservice.writeback.util.WsServiceUtil;

import net.sf.json.JSONObject;
/**
 * 金碟u8ERP
 * 采购退料单回写
 * 业务逻辑说明
 * 1、获取需要回写的数据
 * 	  1.1单据类型DJ13
 * 	  1.2收发类型的回写标识为Y
      1.3交接人为不为空
	  1.4未回写过的数据
 * 2、根据接口报文格式回写erp
 * 3、回写成功后
 *   3.1修改detail的上传数据为Y
 *   3.2修改item的回写数量和最新回写时间
 *   3.3生成对应采购入库单 
 */
public class WbBackMaterilServiceJob  implements IJobx{
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
			String MethodName = "U8RdRecord";
			
			String WOD_DOC_NUM = DocTemp.get("WOD_DOC_NUM");
			String WOI_CONNECT_DOC = DocTemp.get("WOI_CONNECT_DOC");// 关联单号 采购入库单
			String WRD_ERP_NUM = DocTemp.get("CORDERCODE");// ERP工单号

			MsHTranMan tran = BussService.getHbTran();
			try {
				Map<String, String> map = WsServiceUtil.postServicelOGIN_NAME(MethodName, json, "采购退料单回写", 32,WOD_DOC_NUM,LOGIN_NAME);
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
						// 生成对应的采购入库单
						//createTable(WOI_CONNECT_DOC, temp.get("CINVCODE"), num, WRD_ERP_NUM);
					}
				} else {
					for(int i=0;i<Dealsize;i++){
						Map<String,String> temp=DealItemList.get(i);
						String ITEM_ID = temp.get("ITEM_ID");//
						String update = "UPDATE T_WMS_OUTSTOCK_ITEM SET WOI_WB_TIME=sysdate,WOI_WB_MSG='"+map.get("errmsg")+"' where ID='" + ITEM_ID + "'";
						modelService.execSql(update);
					}
					result.append("采购退料单：" + WOD_DOC_NUM + "、仓库:" + DocTemp.get("CWHCODE") + "回写失败,原因："+map.get("errmsg")+";");
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
				String DocKey=temp.get("WOD_DOC_NUM")+temp.get("CWHCODE")+temp.get("CACC")+temp.get("CVENCODE")+temp.get("CORDERCODE")+temp.get("WOI_CONNECT_DOC");
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
					
					OrderTemp.put("WOI_CONNECT_DOC", temp.get("WOI_CONNECT_DOC"));//关联单号
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
   * 生成对应的采购入库单
   * @param WOI_CONNECT_DOC 采购入库单（旧）
   * @param WRI_ITEM_CODE 物料料号
   * @param num 数量
   * @param WRD_ERP_NUM 采购订单号
   */
  @SuppressWarnings("unchecked")
private void createTable(String WRD_DOC_NUM_R,String WRI_ITEM_CODE,float num,String WRD_ERP_NUM) {
	  String sql="SELECT T2.* FROM T_WMS_RECEIVE_DOC T "+
              " INNER JOIN T_WMS_RECEIVE_ITEM T2 ON T.WRD_DOC_NUM=T2.WRI_DOC_NUM "+
               " WHERE T.WRD_ERP_NUM=? AND T2.WRI_ITEM_CODE=? AND T.WRD_STATUS<>3";
	  int count=modelService.countSql(sql, new Object[]{WRD_ERP_NUM,WRI_ITEM_CODE});
	  if(count>0){
		  String updateSql="UPDATE T_WMS_RECEIVE_ITEM T2 SET T2.WRI_PLAN_NUM=T2.WRI_PLAN_NUM+"+num+",WRI_IS_ADD='U'"+
				  " WHERE T2.WRI_ITEM_CODE='"+WRI_ITEM_CODE+"' AND T2.WRI_DOC_NUM IN(SELECT T.WRD_DOC_NUM FROM T_WMS_RECEIVE_DOC T WHERE T.WRD_ERP_NUM='"+WRD_ERP_NUM+"')";
		  modelService.execSql(updateSql);
	  }else{
		  sql="SELECT * FROM T_WMS_RECEIVE_DOC T WHERE T.WRD_ERP_NUM='"+WRD_ERP_NUM+"'";
		  List<Map<String, String>> list_temp =modelService.listDataSql(sql);
		  if(list_temp!=null&&list_temp.size()>0){
			  Map<String,String> temp2=list_temp.get(0);
			  //插入入库单物料信息
		        TableDataMapExt receive1 = new TableDataMapExt();
		        receive1.setTableName("T_WMS_RECEIVE_ITEM");
		        receive1.getColMap().put("ID", StringUtils.getUUID());
	            receive1.getColMap().put("WRI_DOC_NUM", temp2.get("WRD_DOC_NUM"));
	            receive1.getColMap().put("WRI_STATUS", "1"); //状态开立
	            receive1.getColMap().put("DEPT_ID", temp2.get("DATA_AUTH"));//部门
	            receive1.getColMap().put("CREATE_USER", temp2.get("CREATE_USER"));//创建人
	            receive1.getColMap().put("CREATE_TIME", new Date());//创建时间
	            receive1.getColMap().put("DATA_AUTH",temp2.get("DATA_AUTH"));//机构
	            receive1.getColMap().put("WRI_ITEM_CODE", WRI_ITEM_CODE);//料号
	            receive1.getColMap().put("WRI_ITEM_SEQ", "0");//项次

	            receive1.getColMap().put("WRI_PLAN_NUM", num);//计划数量
	            receive1.getColMap().put("WRI_PACK_NUM", 0);//最小包装数量
	            receive1.getColMap().put("WRI_GIFT_NUM", 0); //赠品数量
	            receive1.getColMap().put("WRI_CONNECT_DOC", WRD_ERP_NUM +"-"+ temp2.get("WPI_SOB") ); //关联单号 采购单号+账套

	            modelService.save(receive1);
		  }else{
			  //生成完整的采购入库单和入库明细和仓库单信息
			  String adddocsql="select * from T_WMS_RECEIVE_DOC where WRD_DOC_NUM='"+WRD_DOC_NUM_R+"'";
			  List<Map<String, String>> list =modelService.listDataSql(adddocsql);
			  if(list!=null&&list.size()>0){
				  Map<String,String> temp=list.get(0);
				  //String WRD_DOC_NUM = getReceiveNo(temp.get("DATA_AUTH"),"DJ02",temp.get("WRD_DISPATCH_SN"),modelService);//入库单号
				  String sql_gener="SELECT f_c_generate_sn('"+WRD_ERP_NUM+"-"+temp.get("WPI_SOB")+"',2) AS WRD_DOC_NUM FROM   dual";
				  Map<String,String> mapSql= modelService.queryForMap(sql_gener);
				  String WRD_DOC_NUM=mapSql.get("WRD_DOC_NUM");
					
				  //增加仓库单据信息表数据
				  TableDataMapExt wms = new TableDataMapExt();
				  wms.setTableName("T_WMS_DOC_INFO");
				  wms.getColMap().put("ID", StringUtils.getUUID());
				  wms.getColMap().put("WDI_DOC_NUM", WRD_DOC_NUM);//入库单号
				  wms.getColMap().put("WDI_STATUS", "1");//状态开立
				  wms.getColMap().put("WDI_URGENT_FLAG", temp.get("WRD_URGENT_FLAG"));//紧急标志
				  wms.getColMap().put("WDI_SUP_CODE", temp.get("WRD_SUP_CODE")); //供应商编号
				  wms.getColMap().put("WDI_DOC_TYPE", "DJ02");//单据类型
				  wms.getColMap().put("WDI_DISPATCH_TYPE", "CGTL");//收发类型
				  wms.getColMap().put("WDI_CREATE_MAN", temp.get("CREATE_USER"));
				  wms.getColMap().put("WDI_CREATE_TIME", new Date());
				  wms.getColMap().put("WDI_MEMO", "退料单重新生成采购单");//备注
				  wms.getColMap().put("DATA_AUTH", temp.get("DATA_AUTH"));
				  wms.getColMap().put("T_WMS_DOC_INFO", "Y");//ERP同步标志
				  modelService.save(wms);
			        
				//插入入库单信息
			        TableDataMapExt receive = new TableDataMapExt();
			        receive.setTableName("T_WMS_RECEIVE_DOC");

			        receive.getColMap().put("ID", StringUtils.getUUID());
			        receive.getColMap().put("DEPT_ID", temp.get("DATA_AUTH"));//部门
			        receive.getColMap().put("CREATE_USER", temp.get("CREATE_USER"));//创建人
			        receive.getColMap().put("CREATE_TIME", new Date());//创建时间
			        receive.getColMap().put("DATA_AUTH",temp.get("DATA_AUTH"));//机构
			        receive.getColMap().put("WRD_DOC_NUM", WRD_DOC_NUM);
			        receive.getColMap().put("WRD_DOC_TYPE", "DJ02");
			        receive.getColMap().put("WRD_STATUS", "1");
			        receive.getColMap().put("WRD_SUP_CODE", temp.get("WRD_SUP_CODE"));
//				 	if(!WPD_DELIVERY_DATE.equals("")){
//				 		receive.getColMap().put("WPD_DELIVERY_DATE", sdf2.parse(WPD_DELIVERY_DATE));
//				 	}
			        receive.getColMap().put("WRD_URGENT_FLAG", temp.get("WRD_URGENT_FLAG"));
			        receive.getColMap().put("WRD_DISPATCH_SN", temp.get("WRD_DISPATCH_SN"));
			        receive.getColMap().put("WRD_MEMO", "退料单重新生成采购单");
			        receive.getColMap().put("WRD_CREATE_MAN", temp.get("CREATE_USER"));
			        receive.getColMap().put("WRD_CREATE_TIME", new Date());
			        receive.getColMap().put("DATA_AUTH", temp.get("DATA_AUTH"));
			        receive.getColMap().put("WPI_SOB", temp.get("WPI_SOB"));//账套
			        receive.getColMap().put("WRD_ERP_FLAG", "Y");//ERP同步标志
			        
			        receive.getColMap().put("WRD_ERP_NUM", WRD_ERP_NUM);//ERP采购单号
			        modelService.save(receive);
			        
			        //插入入库单物料信息
			        TableDataMapExt receive1 = new TableDataMapExt();
			        receive1.setTableName("T_WMS_RECEIVE_ITEM");
			        receive1.getColMap().put("ID", StringUtils.getUUID());
		            receive1.getColMap().put("WRI_DOC_NUM", WRD_DOC_NUM);
		            receive1.getColMap().put("WRI_STATUS", "1"); //状态开立
		            receive1.getColMap().put("DEPT_ID", temp.get("DATA_AUTH"));//部门
		            receive1.getColMap().put("CREATE_USER", temp.get("CREATE_USER"));//创建人
		            receive1.getColMap().put("CREATE_TIME", new Date());//创建时间
		            receive1.getColMap().put("DATA_AUTH",temp.get("DATA_AUTH"));//机构
		            receive1.getColMap().put("WRI_ITEM_CODE", WRI_ITEM_CODE);//料号
		            receive1.getColMap().put("WRI_ITEM_SEQ", "0");//项次

		            receive1.getColMap().put("WRI_PLAN_NUM", num);//计划数量
		            receive1.getColMap().put("WRI_PACK_NUM", 0);//最小包装数量
		            receive1.getColMap().put("WRI_GIFT_NUM", 0); //赠品数量
		            receive1.getColMap().put("WRI_CONNECT_DOC", WRD_ERP_NUM +"-"+ temp.get("WPI_SOB") ); //关联单号 采购单号+账套

		            modelService.save(receive1);
				  
			  }
		  }
	  }
  }
  /**
   * 根据机构、单据类型（前缀）、收发类型
   * 调用存储过程 生产采购单号
   * @param dataAuth
   * @param prefix
   * @param dispatchSn
   * @param modelService
   * @return
   */
  @SuppressWarnings("unchecked")
  public String getReceiveNo(String dataAuth,String prefix,String dispatchSn,ModelService modelService){
      ProFuncDto pf = new ProFuncDto();
      int[] inPlace = {1, 2, 3};
      int[] outplace = {4, 5};
      List<Object> list = new ArrayList<Object>();
      List<Object> outType = new ArrayList<Object>();
      list.add(dataAuth);
      list.add(prefix);
      list.add(dispatchSn);
      outType.add("String");
      outType.add("String");
      pf.setClassName("P_C_GET_DOC_NO");//生成检验单号
      pf.setInPlace(inPlace);//存储过程中in
      pf.setOutPlace(outplace); //存储过程中out
      pf.setValArgs(list);//存储过程中输入的参数
      pf.setTotalLen(list.size()+outType.size());//总个数
      pf.setOutValType(outType);//输出的参数
      List<Object> relist = modelService.procComm(pf);//接收返回值
      String res = (String) relist.get(0);  //结果
      return res;
  }
  
  

/**
	 * 获取采购退料单的数据集合
	 * @param WRD_DOC_NUM
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, String>> getList(String WOD_DOC_NUM){
		String sql="SELECT distinct TO_CHAR(NVL(WOD_HANDOVER_TIME, T.WOD_OUTSTOCK_TIME),'YYYY-MM-DD') ddate,T8.WA_ERP_CODE cwhcode,'101' crdcode,"+
			        " '1' bredvouch,T4.ERP_CODE cacc,t3.Wod_Sup_Code cvencode,"+
			        " T6.WPI_ERP_NO cordercode,"+
			        " T.WOD_ITEM_CODE cinvcode,T2.WOI_ITEM_SEQ,to_char(T.WOD_OUTSTOCK_NUM) iquantity,"+
			        " T.ID,T2.ID ITEM_ID,T.WOD_DOC_NUM,T2.WOI_CONNECT_DOC  FROM"+
			        " T_WMS_OUTSTOCK_DETAIL T INNER JOIN T_WMS_OUTSTOCK_ITEM T2 ON T.WOD_ITEM_ID=T2.ID"+
			        " INNER JOIN T_WMS_OUTSTOCK_DOC T3 ON T2.WOI_DOC_NUM=T3.WOD_DOC_NUM"+
			        " INNER JOIN SY_DEPT T4 ON T.DATA_AUTH=T4.ID"+
			        " INNER JOIN T_WMS_RECEIVE_ITEM T5 ON T2.WOI_CONNECT_DOC=T5.WRI_DOC_NUM "+//关联采购入库单获取采购单号只需要一条就够了
			        " INNER JOIN T_WMS_PO_INFO T6 ON T5.WRI_CONNECT_DOC=T6.WPI_PO"+
			        " INNER JOIN T_WMS_DISPATCH_TYPE T7 ON T3.WOD_DOC_TYPE =T7.WDT_TYPE_SN AND T7.DATA_AUTH=T2.DATA_AUTH"+
			        				" AND T3.WOD_DISPATCH_SN=T7.WDO_DISPATCH_SN"+
			        " INNER JOIN T_WMS_AREA T8 ON T8.WA_AREA_SN=T.WOD_RECEIVE_WH_CODE"+//WOD_WH_CODE
			        " WHERE T3.WOD_DOC_TYPE='DJ13' AND T.WOD_UPLOAD_FLAG='N' AND T7.WDO_UPLOAD_FLAG='Y'";
		if(StringUtils.isNotBlank(WOD_DOC_NUM)){
			sql+=" AND T3.WOD_DOC_NUM='"+WOD_DOC_NUM+"'";
		}
		List<Map<String, String>> list =modelService.listDataSql(sql);
		return list;
	}
}
