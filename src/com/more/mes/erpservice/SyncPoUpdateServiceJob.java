package com.more.mes.erpservice;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 金碟u8ERP
 * 同步erp采购信息接口(修改)（service）
 */
public class SyncPoUpdateServiceJob extends InterfaceLog implements IhttpServiceJosn {
	private final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
	
	@Override
	public String exeFunc(HttpCoreService service) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		SimpleDateFormat format2 = new SimpleDateFormat("yyyyMMdd");
		String beginTime=format.format(new java.util.Date());//接口请求开始时间
		//返回结果
		Map<String, Object> map = new HashMap<String, Object>();
		//验证默认正确
		String RS=ErpServiceMethod.OK;
		StringBuffer MSG=new StringBuffer();
		String jsonStr=null;
		//获取请求数据
		String requestString = ErpServiceMethod.getRequestJson(service);
		JSONObject jsonObject = null;
		try {
			jsonObject = JSONObject.fromObject(requestString);
		} catch (Exception e) {
			RS = ErpServiceMethod.NG;
			MSG.append("请求报文JSON格式错误");
		}
		String WPI_PO="";//采购单号
		if(RS.equals(ErpServiceMethod.OK)){
			try{
				String REQUEST_DATA=jsonObject.getString("REQUEST_DATA");//请求详细信息
				JSONObject jsonData = JSONObject.fromObject(REQUEST_DATA);//转为json对象
				
				WPI_PO=jsonData.getString("WPI_PO");//采购订单
				String WPI_SUP_CODE=jsonData.getString("WPI_SUP_CODE");//供应商编码
				String ERP_DRAWER=jsonData.getString("ERP_DRAWER");//制单人
				String WPI_CREATE_TIME=jsonData.getString("WPI_CREATE_TIME");//制单时间
				String WPI_SOB=jsonData.getString("WPI_SOB");//账套
				String WRI_WH_CODE=jsonData.getString("WRI_WH_CODE");//ERP仓库编码
				String DATAS=jsonData.getString("DATAS");//采购订单明细JSON
				
				String WPI_PO_MES=WPI_PO+"-"+WPI_SOB;//mes采购订单
				
				Date time=null; //验证时间格式
				String DATA_AUTH=null;//获取组织机构
				String CREATE_USER=null;//创建人ID
				//boolean exitsPO=false;//验证采购单号是否存在
				//boolean CKNEGATIVE=true;//验证联系负数
				Map<String,Object> POINFO=null;//采购单信息
				try{
					if(StringUtils.isBlank(WPI_SOB)){
						RS=ErpServiceMethod.NG;
						MSG.append("账套为空;");
					}else{
						Map<String, Object> map_SOB=ErpServiceMethod.getDeptID(WPI_SOB); //this.getDept(WPI_SOB);
						if(map_SOB!=null&&map_SOB.size()>0){
							DATA_AUTH=map_SOB.get("ID").toString();
						}else{
							RS=ErpServiceMethod.NG;
							MSG.append("账套信息不存在;");
						}
					}
					
					if(StringUtils.isBlank(WRI_WH_CODE)){
                    	RS=ErpServiceMethod.NG;
                        MSG.append("仓库为空;");
                    }else{
                    	 Map<String, Object> mapArea= ErpServiceMethod.getAreaCode(WRI_WH_CODE,DATA_AUTH);
                    	 if(mapArea!=null&&mapArea.size()>0){
                    		 WRI_WH_CODE=mapArea.get("WA_AREA_SN").toString();
                    	 }else{
                    		 RS=ErpServiceMethod.NG;
                             MSG.append("MES中不存在该账套的仓库信息("+WRI_WH_CODE+");");
                    	 }
                    }
					
					if(StringUtils.isBlank(WPI_PO)){
						RS=ErpServiceMethod.NG;
						MSG.append("采购订单为空;");
					}else{
						POINFO = getPOInfo(WPI_PO_MES);
						if(POINFO!=null&&POINFO.size()>0){
							if(!POINFO.get("WPI_STATUS").toString().equals("1")){
								RS=ErpServiceMethod.NG;
								MSG.append("采购订单的状态不是开立;");
							}
						}else{
							RS=ErpServiceMethod.NG;
							MSG.append("采购订单不存在;");
						}
					}
					
					if(StringUtils.isBlank(WPI_SUP_CODE)){
						RS=ErpServiceMethod.NG;
						MSG.append("供应商编码为空;");
					}else{
	                	if(getSupCount(WPI_SUP_CODE,DATA_AUTH)>0){}
	                	else{
	                		RS=ErpServiceMethod.NG;
	                        MSG.append("系统中不存在供应商信息;");
	                	}
	                }
					if(StringUtils.isBlank(ERP_DRAWER)){
						RS=ErpServiceMethod.NG;
						MSG.append("制单人为空;");
					}else{
						Map<String, Object> map_User=ErpServiceMethod.getUserID(ERP_DRAWER);//this.getUser(ERP_DRAWER);
						if(map_User!=null&&StringUtils.isBlank(map_User)){
							RS=ErpServiceMethod.NG;
							MSG.append("制单人不存在;");
						}else{
							CREATE_USER=map_User.get("ID").toString();
						}
					}
					if(StringUtils.isBlank(WPI_CREATE_TIME)){
						RS=ErpServiceMethod.NG;
						MSG.append("制单时间为空;");
					}else{
						try{
							time= format2.parse(WPI_CREATE_TIME);
						}catch(Exception e){
							RS=ErpServiceMethod.NG;
							MSG.append("制单时间格式不对;");
						}
					}
					
					JSONArray jsonArray = JSONArray.fromObject(DATAS);//采购订单明细JSON
					int size = jsonArray.size();
					if(size==0){
						RS=ErpServiceMethod.NG;
						MSG.append("该采购单没有明细;");
					}
					List<Map<String ,Object>> list_detail=new ArrayList<Map<String ,Object>>();
					for (int i = 0; i < size; i++){
						Map<String,Object> temp_data=new HashMap<String,Object>();
						
						JSONObject temp_json = jsonArray.getJSONObject(i);
						String WPD_ITEM_CODE=temp_json.getString("WPD_ITEM_CODE");//物料料号
						int WPD_ITEM_SEQ=temp_json.getInt("WPD_ITEM_SEQ");
						String WPD_PLAN_NUM=temp_json.getString("WPD_PLAN_NUM");
						
						if(StringUtils.isBlank(WPD_ITEM_CODE)){
							RS=ErpServiceMethod.NG;
							MSG.append("物料料号不能为空;");
						}else{
							Map<String, Object> map_ITEM_CODE=ErpServiceMethod.getItemCode(WPD_ITEM_CODE,DATA_AUTH);//this.getCOItem(WPD_ITEM_CODE);
							if(StringUtils.isBlank(map_ITEM_CODE)){
								RS=ErpServiceMethod.NG;
								MSG.append("物料料号("+WPD_ITEM_CODE+")在物料表中不存在;");
							}
						}
						temp_data.put("WPD_ITEM_CODE", WPD_ITEM_CODE);
						temp_data.put("WPD_ITEM_SEQ", WPD_ITEM_SEQ);
						temp_data.put("WPD_PLAN_NUM", WPD_PLAN_NUM);
						list_detail.add(temp_data);
					}
					
					//验证通过，将相关数据保存
					if(RS.equals("OK")){
						MsHTranMan tran = BussService.getHbTran();
						try{
							//String WRD_MEMO="更新采购单和采购入库单";//采购入库单备注
							//if(!exitsPO){
								//变更采购单
								TableDataMapExt object = new TableDataMapExt();
								object.setTableName("T_WMS_PO_INFO");
								object.setSqlWhere(" AND ID='"+POINFO.get("ID").toString()+"'");
								
								//object.getColMap().put("WPI_PO",WPI_PO);
								//object.getColMap().put("WPI_STATUS","1");
								object.getColMap().put("WPI_SUP_CODE",WPI_SUP_CODE);//供应商编码
								object.getColMap().put("WPI_CREATE_MAN",CREATE_USER);//制单人
								//object.getColMap().put("WPI_CREATE_TIME", time);//制单时间
								//object.getColMap().put("WPI_CUST","N");//是否客户提供 默认N
								object.getColMap().put("WPI_SOB",WPI_SOB);//账套
								modelService.edit(object);
								
								//添加采购明细
								for(int i=0;i<size;i++){
									Map<String,Object> temp_data=list_detail.get(i);
									boolean exists=this.ckPoInfo(WPI_PO_MES, temp_data.get("WPD_ITEM_CODE").toString(), temp_data.get("WPD_ITEM_SEQ").toString());
									if(exists){
										TableDataMapExt object_detail = new TableDataMapExt();
										object_detail.clear();
										object_detail.setTableName("T_WMS_PO_DETAIL");
										object_detail.setSqlWhere(" AND WPD_PO='"+WPI_PO_MES+"' AND WPD_ITEM_CODE='"+temp_data.get("WPD_ITEM_CODE").toString()+"' AND WPD_ITEM_SEQ='"+temp_data.get("WPD_ITEM_SEQ").toString()+"'");
										
										//object_detail.getColMap().put("WPD_PO",WPI_PO);//工单号
										//object_detail.getColMap().put("WPD_ITEM_SEQ",temp_data.get("WPD_ITEM_SEQ").toString());
										
										//object_detail.getColMap().put("WPD_ITEM_CODE",temp_data.get("WPD_ITEM_CODE").toString());
										//object_detail.getColMap().put("WPD_RECEIVE_NUM","0");//
										object_detail.getColMap().put("WPD_PLAN_NUM",temp_data.get("WPD_PLAN_NUM").toString());
										
										object_detail.getColMap().put("WPD_SOB",WPI_SOB);//账套
										object_detail.getColMap().put("WPD_WH_CODE",WRI_WH_CODE);//仓库
										
										modelService.edit(object_detail);
									}else{
										//Map<String,Object> temp_data=list_detail.get(i);
										TableDataMapExt object_detail = new TableDataMapExt();
										object_detail.clear();
										object_detail.setTableName("T_WMS_PO_DETAIL");
										object_detail.getColMap().put("ID", StringUtils.getUUID());
										object_detail.getColMap().put("DEPT_ID",  DATA_AUTH);//部门
										object_detail.getColMap().put("CREATE_USER", CREATE_USER);//创建人
										object_detail.getColMap().put("CREATE_TIME", new Date());//创建时间
										object_detail.getColMap().put("DATA_AUTH",DATA_AUTH);//机构
										object_detail.getColMap().put("WPD_PO",WPI_PO_MES);//工单号
										object_detail.getColMap().put("WPD_ITEM_SEQ",temp_data.get("WPD_ITEM_SEQ").toString());
										object_detail.getColMap().put("WPD_SEQ",temp_data.get("WPD_ITEM_SEQ").toString()); //erp项次
										
										object_detail.getColMap().put("WPD_ITEM_CODE",temp_data.get("WPD_ITEM_CODE").toString());
										object_detail.getColMap().put("WPD_RECEIVE_NUM","0");//接收数量默认为0
										object_detail.getColMap().put("WPD_PLAN_NUM",temp_data.get("WPD_PLAN_NUM").toString());//计划数量
										object_detail.getColMap().put("WPD_SOB",WPI_SOB);//账套
										object_detail.getColMap().put("WPD_WH_CODE",WRI_WH_CODE);//仓库
										
										modelService.save(object_detail);
									}
									
									
								}
								//modify(DATA_AUTH,WPI_SUP_CODE,CREATE_USER,WRD_MEMO,list_detail, WPI_PO_MES,ERP_DRAWER);
								//添加对应的采购单和采购明细
//							}else{
//								WRD_MEMO="添加采购入库单，不添加采购单";
//								//添加对应的采购单和采购明细
//								add(DATA_AUTH,WPI_SUP_CODE,CREATE_USER,WRD_MEMO,list_detail, WPI_PO);
//							}
							
							MSG.append("处理成功");
							tran.commit();
						}catch(Exception e){
							tran.rollback();
							ErpServiceMethod.writeLog("","更新采购订单接口处理失败错误："+e.getMessage());
							RS=ErpServiceMethod.NG;
							MSG.append("获取采购订单接口处理失败："+e.getMessage());
							e.printStackTrace();
							log.error(e);
						}
					}
					
				}catch(Exception e){
					ErpServiceMethod.writeLog("","更新采购订单接口处理失败错误2："+e.getMessage());
					RS=ErpServiceMethod.NG;
					MSG.append("更新采购订单接口处理失败2："+e.getMessage());
					e.printStackTrace();
					log.error(e);
				}
			}catch(Exception e){
				ErpServiceMethod.writeLog("","更新采购订单接口处理失败错误3："+e.getMessage());
				RS=ErpServiceMethod.NG;
				MSG.append("更新采购订单接口处理失败3："+e.getMessage());
				e.printStackTrace();
				log.error(e);
			}
		}
		
		jsonStr=ErpServiceMethod.getResult(RS, MSG.toString());
		map.put("json", jsonStr);
		//保存日志信息 
		ErpServiceMethod.AddIFLog(WPI_PO,requestString, jsonStr, 5, "更新采购订单接口", RS, modelService);
				
		String endTime=format.format(new java.util.Date());//接口请求结束时间
		ErpServiceMethod.writeLog("",  beginTime+"更新采购订单接口请求信息:"+requestString);
		ErpServiceMethod.writeLog("", endTime+ "更新采购订单接口返回信息:"+jsonStr);
		service.setResult(map);
		service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
		service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
		service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
		
		return null;
	}
		
//
//		/**
//		 * 获取用户信息
//		 * @param LOGIN_NAME
//		 * @return
//		 */
//		@SuppressWarnings("unchecked")
//		public Map<String,Object> getUser(String LOGIN_NAME){
//			Map<String, Object> map = new HashMap<String, Object>();
//			String sql="SELECT * FROM SY_USER WHERE LOGIN_NAME=?";
//			//map = modelService.queryForMap(sql, new Object[] {LOGIN_NAME});
//			List<Map<String, Object>> list= modelService.listDataSql(sql, new Object[] {LOGIN_NAME});
//			if(list!=null&&list.size()>0){
//				map=list.get(0);
//			}
//			return map;
//		}
//		
//		/**
//		 * 根据账套获取部门ID
//		 * @param DEP_SOB
//		 * @return
//		 */
//		@SuppressWarnings("unchecked")
//		public Map<String,Object> getDept(String DEP_SOB){
//			Map<String, Object> map = new HashMap<String, Object>();
//			String sql="select * from sy_dept t where DEP_SOB=?";
//			//map = modelService.queryForMap(sql, new Object[] {DEP_SOB});
//			List<Map<String, Object>> list= modelService.listDataSql(sql, new Object[] {DEP_SOB});
//			if(list!=null&&list.size()>0){
//				map=list.get(0);
//			}
//			return map;
//		}
//		/**
//		 * 根据物料料号判断存在
//		 * @param CI_ITEM_CODE
//		 * @return
//		 */
//		@SuppressWarnings("unchecked")
//		public Map<String,Object> getCOItem(String CI_ITEM_CODE){
//			Map<String, Object> map = new HashMap<String, Object>();
//			String sql="select * from t_co_item t where CI_ITEM_CODE=?";
//			//map = modelService.queryForMap(sql, new Object[] {CI_ITEM_CODE});
//			List<Map<String, Object>> list= modelService.listDataSql(sql, new Object[] {CI_ITEM_CODE});
//			if(list!=null&&list.size()>0){
//				map=list.get(0);
//			}
//			return map;
//		}
//		
		/**
		 * 查询采购单信息
		 * @param CI_ITEM_CODE
		 * @return
		 */
		@SuppressWarnings("unchecked")
		public Map<String,Object> getPOInfo(String WPI_PO_MES){
			Map<String, Object> map = new HashMap<String, Object>();
			String sql="select * from T_WMS_PO_INFO t where WPI_PO=?";
			//map = modelService.queryForMap(sql, new Object[] {WPI_PO});
			List<Map<String, Object>> list= modelService.listDataSql(sql, new Object[] {WPI_PO_MES});
			if(list!=null&&list.size()>0){
				map=list.get(0);
			}
			return map;
		}
		
		/**
		 * 根据料号和项次 判断采购单明细是否存在
		 * @return
		 */
		public boolean ckPoInfo(String WPD_PO,String WPD_ITEM_CODE,String WPD_ITEM_SEQ){
			boolean exists=false;
			String sql="select *　from t_wms_po_detail t where WPD_PO = ? and t.wpd_item_code =? and t.wpd_item_seq =?";
			int count=modelService.countSql(sql, new Object[]{WPD_PO,WPD_ITEM_CODE,WPD_ITEM_SEQ});
			if(count>0){
				exists=true;
			}
			return exists;
		}
		
		/**
		 * 根据料号和项次 判断采购入库单明细是否存在
		 * @return
		 */
		public boolean ckRDInfo(String WRD_DOC_NUM ,String WRD_ITEM_CODE,String WRD_ITEM_SEQ){
			boolean exists=false;
			String sql="select * from T_WMS_RECEIVE_ITEM t where WRI_DOC_NUM =? and t.wri_item_code =? and t.wri_item_seq=?";
			int count=modelService.countSql(sql, new Object[]{WRD_DOC_NUM,WRD_ITEM_CODE,WRD_ITEM_SEQ});
			if(count>0){
				exists=true;
			}
			return exists;
		}
		
		/**
		 * 根据采购单号获取对应的采购入库单
		 * @param WPD_PO
		 * @return
		 */
		public String getWRD_DOC_NUM(String WPD_PO){
			String WRD_DOC_NUM=null;
			String sql="select *from t_wms_receive_item  t where t.wri_connect_doc= ?";
			List<Map<String, Object>> list= modelService.listDataSql(sql, new Object[] {WPD_PO});
			if(list!=null&&list.size()>0){
				WRD_DOC_NUM=list.get(0).get("WRI_DOC_NUM").toString();
			}
			return WRD_DOC_NUM;
		}
		
		/**
		 * 更新对应的采购入库单
		 * @param DATA_AUTH 机构
		 * @param WRD_SUP_CODE 供应商编号
		 */
		@SuppressWarnings("unchecked")
		public void modify(String DATA_AUTH,String WRD_SUP_CODE,String CREATE_USER,String WRD_MEMO
				,List<Map<String ,Object>> list_detail,String WPI_PO_MES,String WRD_ERP_CREATE_MAN){
			String WRD_DOC_NUM=this.getWRD_DOC_NUM(WPI_PO_MES);
			
			//String WRD_DISPATCH_SN = "CGRK";//收发类型
			//String WRD_DOC_NUM = getReceiveNo(DATA_AUTH,"DJ02",WRD_DISPATCH_SN,modelService);//入库单号
			//String WRD_URGENT_FLAG = "N";//紧急标志
			//增加仓库单据信息表数据
			if(StringUtils.isNotBlank(WRD_DOC_NUM)){
				
			 	//插入入库单信息
			 	TableDataMapExt receive = new TableDataMapExt();
			 	receive.setTableName("T_WMS_RECEIVE_DOC");
			 	receive.setSqlWhere("AND WRD_DOC_NUM='"+WRD_DOC_NUM+"'");
			 	receive.getColMap().put("EDIT_USER", CREATE_USER); //修改人
			 	receive.getColMap().put("EDIT_TIME", new Date()); //修改时间
			 	receive.getColMap().put("WRD_SUP_CODE", WRD_SUP_CODE);//供应商编号
			 	receive.getColMap().put("WRD_ERP_CREATE_MAN", WRD_ERP_CREATE_MAN);//ERP制单人
			 	modelService.edit(receive);
			 	
			 	for(int i=0;i<list_detail.size();i++){
			 		Map<String ,Object> temp=list_detail.get(i);
			 		boolean exists=this.ckRDInfo(WRD_DOC_NUM, temp.get("WPD_ITEM_CODE").toString(), temp.get("WPD_ITEM_SEQ").toString());
			 		if(exists){
			 			//更新入库单物料信息
					 	TableDataMapExt receive1 = new TableDataMapExt();
					 	receive1.setTableName("T_WMS_RECEIVE_ITEM");
			 			receive1.getColMap().clear();
				 		receive1.setSqlWhere("AND WRI_DOC_NUM='"+WRD_DOC_NUM+"' AND WRI_ITEM_CODE='"+temp.get("WPD_ITEM_CODE").toString()+"' AND WRI_ITEM_SEQ="+temp.get("WPD_ITEM_SEQ").toString() );
				 		receive1.getColMap().put("EDIT_USER", CREATE_USER);//创建人
				 		receive1.getColMap().put("EDIT_TIME", new Date());//修改时间
				 		receive1.getColMap().put("WRI_ITEM_SEQ", temp.get("WPD_ITEM_SEQ").toString());//项次
				 		receive1.getColMap().put("WRI_PLAN_NUM", temp.get("WPD_PLAN_NUM").toString());//计划数量
				 		
				 		receive1.getColMap().put("WRI_IS_ADD","U");//同步标识改为更新
				 		modelService.edit(receive1);
			 		}else{
			 			//插入入库单物料信息
					 	TableDataMapExt receive1 = new TableDataMapExt();
					 	receive1.setTableName("T_WMS_RECEIVE_ITEM");
					 	receive1.getColMap().clear();
				 		
				 		receive1.getColMap().put("ID", StringUtils.getUUID());
					 	receive1.getColMap().put("WRI_DOC_NUM", WRD_DOC_NUM);
					 	receive1.getColMap().put("WRI_STATUS", "1"); //状态开立
					 	receive1.getColMap().put("DEPT_ID", DATA_AUTH);//部门
					 	receive1.getColMap().put("CREATE_USER", CREATE_USER);//创建人
					 	receive1.getColMap().put("CREATE_TIME", new Date());//创建时间
					 	receive1.getColMap().put("DATA_AUTH",DATA_AUTH);//机构
				 		receive1.getColMap().put("WRI_ITEM_CODE", temp.get("WPD_ITEM_CODE").toString());//料号
				 		receive1.getColMap().put("WRI_ITEM_SEQ", temp.get("WPD_ITEM_SEQ").toString());//项次
				 		//receive1.getColMap().put("WRD_SEQ", temp.get("WPD_ITEM_SEQ").toString());//采购项次
				 		receive1.getColMap().put("WRI_PLAN_NUM", temp.get("WPD_PLAN_NUM").toString());//计划数量
				 		receive1.getColMap().put("WRI_PACK_NUM", 0);//最小包装数量
				 		receive1.getColMap().put("WRI_GIFT_NUM", 0); //赠品数量
				 		receive1.getColMap().put("WRI_CONNECT_DOC", WPI_PO_MES); //关联单号 采购单号
				 		//receive1.getColMap().put("WRI_WH_CODE", wmsSelects[i]);//仓库
//				 		if(!deliverDates[i].equals("")){
//				 			receive1.getColMap().put("WRI_DELIVERY_DATE", sdf2.parse(deliverDates[i])); //交货日期
//				 		}
				 		//receive1.getColMap().put("WRI_LOT_NO", lotNos[i]); //批次
//				 		if(!productDates[i].equals("")){
//				 			receive1.getColMap().put("WRI_PRODUCE_DATE", sdf2.parse(productDates[i])); //生产日期
//				 		}
				 		receive1.getColMap().put("DATA_AUTH", DATA_AUTH);
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
		    pf.setClassName("P_C_GET_DOC_NO");//生成采购入库单
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
		 * 根供应商编码账套获取条数
		 * @param CUST_CODE
		 * @return
		 */
		public static int getSupCount(String SUPPLIER_CODE,String DATA_AUTH){
			int result=0;
			String sql="";
			Object[] param=new Object[2];
		
			sql="select * from t_co_supplier where SUPPLIER_CODE=? and DATA_AUTH=?  ";
			param[0]=SUPPLIER_CODE;
			param[1]=DATA_AUTH;
			
			result=CommMethod.getBaseService().countSql(sql, param);
			return result;
		}

}
