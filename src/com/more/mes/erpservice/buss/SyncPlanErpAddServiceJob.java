package com.more.mes.erpservice.buss;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.erpservice.ErpServiceMethod;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 金碟u8ERP
 * 同步生产订单信息接口
 * 核心业务说明：
 * 1、关联关系一定在生产订单中
 * 2、生产订单+账套是唯一的
 * 3、关联关系和生产订单一致的数据生成工单信息
 */
public class SyncPlanErpAddServiceJob extends InterfaceLog implements IhttpServiceJosn {
	private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
	
	@Override
	public String exeFunc(HttpCoreService service) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String beginTime=format.format(new java.util.Date());//接口请求开始时间
		//返回结果
		Map<String, Object> map = new HashMap<String, Object>();
		String jsonStr="";
		//获取请求数据
		String requestString=ErpServiceMethod.getRequestJson(service);
		//验证默认正确
		String RS=ErpServiceMethod.OK;
		StringBuffer MSG=new StringBuffer();
		JSONObject jsonObject = null;
		try{
			jsonObject=JSONObject.fromObject(requestString);
		}catch(Exception e){
			RS=ErpServiceMethod.NG;
			MSG.append("请求报文JSON格式错误");
		}
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		if(RS.equals(ErpServiceMethod.OK)){
			try{
				String REQUEST_DATA=jsonObject.getString("REQUEST_DATA");
				JSONObject jsonData = JSONObject.fromObject(REQUEST_DATA);
				JSONArray jsonArray = JSONArray.fromObject(jsonData.getString("DATAS"));
				int size = jsonArray.size();
		       
		        String CREATE_USER=jsonObject.getString("USER_ID");//创建人ID
		        Map<String,Object> m=ErpServiceMethod.getUserID(CREATE_USER);
		        CREATE_USER=m.get("ID").toString();
				//添加数据的数组
				List<Map<String,String>> addDatas=new ArrayList<Map<String,String>>();
				if(size>1){
					 RS=ErpServiceMethod.NG;
	                 MSG.append("不支持接收多条数据;");
				}
				for (int i = 0; i < size; i++){
					Map<String,String> temp_data=new HashMap<String,String>();
		            JSONObject temp_json = jsonArray.getJSONObject(i);
		            String SOB=null;
		            String DATA_AUTH=null;//获取组织机构
		            
	            	SOB=temp_json.getString("PPE_SOB");
	            	String ISEXIST_PPE_RELATION="0"; //标记是否存在是否现有库 存在则为1 不存在为0
	            	String addOrderFlag="0";//标记是否生成工单信息默认不生成
	            	
	            	if(StringUtils.isBlank(SOB)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行账套为空;");
	                	continue;
	            	}else{
	            		 Map<String, Object> map_SOB= ErpServiceMethod.getDeptID(SOB);    //this.getDept(WPI_SOB);
	                     if(map_SOB!=null&&map_SOB.size()>0){
	                         DATA_AUTH=map_SOB.get("ID").toString();
	                     }else{
	                         RS=ErpServiceMethod.NG;
	                         MSG.append("第"+(i+1)+"行账套信息不存在，请维护对应的组织机构;");
	                         continue;
	                     }
	            	}
	            	
	            	//判断各个字段必填
	            	String PPE_PLAN_ORDER=temp_json.getString("PPE_PLAN_ORDER");//生产订单
	            	if(StringUtils.isBlank(PPE_PLAN_ORDER)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行生产订单为空;");
	                	continue;
	            	}else if(getCount(PPE_PLAN_ORDER,SOB)!=0){ //验证生产订单不能存在
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行生产订单("+PPE_PLAN_ORDER+")+账套("+SOB+")已存在;");
	                	continue;
	            	}
	            	
	            	String PPE_RELATION=temp_json.getString("PPE_RELATION");//验证关联关系
	            	if(StringUtils.isBlank(PPE_RELATION)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行关联关系为空;");
	                	continue;
	            	}else {
	            		//验证关联关系存在现有库存里面
	            		if(getRELATIONCount(PPE_RELATION,SOB)!=0){
	            			ISEXIST_PPE_RELATION="1";
	            		}
	            	}
	            	
	            	String PPE_PLATE=temp_json.getString("PPE_PLATE"); //板别
	            	if(StringUtils.isNotBlank(PPE_PLATE)){
	            		int count=getPPE_PLATECount(PPE_PLATE);
	            		if(count==0){
	            			RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行MES板别("+PPE_PLATE+")没有维护;");
		                	continue;
	            		}
	            	}
	            	
	            	//是否生成工单信息
	            	if(PPE_PLAN_ORDER.equals(PPE_RELATION)){
	            		addOrderFlag="1";
	            	}else{
	            		//验证关联关系和生产订单是否在系统里面
	            		int count =getEXITSPPE_RELATION(PPE_RELATION,SOB);
	            		if(count==0){
	            			RS=ErpServiceMethod.NG;
	                    	MSG.append("需要先同步生产订单和关联关系一致的数据;");
	                    	break;
	            		}
	            		//再次判断当前ERP生产订单的板别和已存在关联关系的板别是否一致
	    				//不一致则报错
	            		//验证修改，之前板别存在，则验证当前板别存在
	            		//        之前板别不存在，则验证当前板别也为不存在
	            		Map<String,Object> tempCK=this.getPpeInfo(PPE_RELATION, SOB);
	            		if(StringUtils.isNotBlank(tempCK.get("PPE_PLATE"))){
//	            			if(!tempCK.get("PPE_PLATE").toString().equals(PPE_PLATE)){
//		            			RS=ErpServiceMethod.NG;
//		                    	MSG.append("板别和已存在关联关系的板别不一致;");
//		            		}
	            			if(StringUtils.isBlank(PPE_PLATE)){
	            				RS=ErpServiceMethod.NG;
	            				MSG.append("已存在关联关系的板别存在，不能传空板别的数据;");
	            			}
	            		}else{
	            			if(StringUtils.isNotBlank(PPE_PLATE)){
	            				RS=ErpServiceMethod.NG;
		                    	MSG.append("已存在关联关系的板别不在，不能传有板别的数据;");
	            			}
	            		}
	            	}
	            	
	            	String PPE_MODEL_CODE=temp_json.getString("PPE_MODEL_CODE");//成品代码
	            	if(StringUtils.isBlank(PPE_MODEL_CODE)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行成品代码为空;");
	                	continue;
	            	}else if(getItemCount(PPE_MODEL_CODE,DATA_AUTH)==0){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行成品代码不存在;");
	                	continue;
	            	}
	            	
	            	String PPE_PLAN_QTY=temp_json.getString("PPE_PLAN_QTY");//数量
	            	if(StringUtils.isBlank(PPE_PLAN_QTY)){//
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行数量为空;");
	                	continue;
	            	}else {
	            		try{
	            			double DOUPPE_PLAN_QTY=Double.parseDouble(PPE_PLAN_QTY);
	            		}catch(Exception e){
	            			RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行数量必须为数字;");
		                	continue;
	            		}
	            	}
	            	String PPE_ITEM_CODE=temp_json.getString("PPE_ITEM_CODE");//产品代码
	            	if(StringUtils.isBlank(PPE_ITEM_CODE)){
	        			RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行产品代码为空;");
	                	continue;
	            	}
	            	
//	            	int cknum=getPmModelRelCount(PPE_MODEL_CODE,PPE_ITEM_CODE,DATA_AUTH);
//	            	if(cknum==0){
//	            		RS=ErpServiceMethod.NG;
//	                	MSG.append("第"+(i+1)+"行成品代码"+PPE_MODEL_CODE+"、产品代码("+PPE_ITEM_CODE+")、账套号("+SOB+")在系统成品料号关系表中不存在;");
//	                	continue;
//	            	}
	            	String PPE_ITEM_SEQ=temp_json.getString("PPE_ITEM_SEQ");//项次
	            	
	            	String PPE_START_DATE=temp_json.getString("PPE_START_DATE"); //计划开工日期
	            	if(!StringUtils.isBlank(PPE_START_DATE)){
	            		try{
	            			String test=formatter.format(formatter.parse(PPE_START_DATE));
	            		}catch(Exception e){
	            			RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行计划开工日期格式不对;");
		                	continue;
	            		}
	            	}
	            	
	            	String PPE_END_DATE=temp_json.getString("PPE_END_DATE"); //计划开工日期
	            	if(!StringUtils.isBlank(PPE_END_DATE)){
	            		try{
	            			String test=formatter.format(formatter.parse(PPE_END_DATE));
	            		}catch(Exception e){
	            			RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行计划开工日期格式不对;");
		                	continue;
	            		}
	            	}
	            	
	            	
	            	
	            	temp_data.put("PPE_PLAN_ORDER", PPE_PLAN_ORDER);//生产订单
	            	temp_data.put("PPE_MODEL_CODE", PPE_MODEL_CODE);//成品代码
	            	temp_data.put("PPE_PLAN_QTY", PPE_PLAN_QTY);//数量
	            	temp_data.put("PPE_ITEM_CODE", PPE_ITEM_CODE);//产品代码
	            	temp_data.put("PPE_ITEM_SEQ", PPE_ITEM_SEQ);//项次
	            	temp_data.put("PPE_SOB", SOB);//账套
	            	temp_data.put("PPE_START_DATE", PPE_START_DATE);//计划开工日期
	            	temp_data.put("PPE_END_DATE", PPE_END_DATE);//计划完工日期
	            	temp_data.put("PPE_RELATION", PPE_RELATION);//关联关系
	            	temp_data.put("ISEXIST_PPE_RELATION", ISEXIST_PPE_RELATION);//标记是否存在是否现有库 存在则为1 不存在为0
	            	temp_data.put("ADDORDERFLAG", addOrderFlag);
	            	temp_data.put("DATA_AUTH", DATA_AUTH);//组织机构
	            	temp_data.put("SEQ", String.valueOf(i));
	            	temp_data.put("PPE_PLATE", PPE_PLATE);
	            	addDatas.add(temp_data);
		        }
				
				
				//验证通过，将相关数据保存
				if(RS.equals("OK")){
					//集合里面再次验证  关联关系一定在生产订单中
					if(CKLIST(addDatas,MSG)){
						MsHTranMan tran=  BussService.getHbTran();
						try{
							AddData(CREATE_USER,addDatas,modelService);
							//添加完工入库单
							AddFinishData(CREATE_USER,addDatas,modelService);
							MSG.append("处理成功");
							tran.commit();
						}catch(Exception e){
							tran.rollback();
							RS=ErpServiceMethod.NG;
							MSG.append("同步生产订单信息接口处理失败，具体请查看日志");
							e.printStackTrace();
							ErpServiceMethod.writeLog("","同步生产订单信息接口处理失败错误："+e.getMessage());
						}
					}else{
						RS=ErpServiceMethod.NG;
					}
				}
			}catch(Exception e){
				RS=ErpServiceMethod.NG;
				MSG.append("同步生产订单信息接口处理失败，具体请查看日志2");
				e.printStackTrace();
				ErpServiceMethod.writeLog("","同步生产订单信息接口处理失败错误2："+e.getMessage());
			}
		}
		
		
		jsonStr=ErpServiceMethod.getResult(RS, MSG.toString());
		map.put("json", jsonStr);
		//保存日志信息 
      	ErpServiceMethod.AddIFLog(requestString, jsonStr, 10, "同步生产订单信息接口", RS, modelService);
      	
		String endTime=format.format(new java.util.Date());//接口请求结束时间
		
		ErpServiceMethod.writeLog("",  beginTime+"同步生产订单信息接口请求信息:"+requestString);
		ErpServiceMethod.writeLog("", endTime+ "同步生产订单信息接口返回信息:"+jsonStr);
		service.setResult(map);
		service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
		service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
		service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
		
		return null;
	}
	
	//添加完工入库单
	@SuppressWarnings("unchecked")
	private void AddFinishData(String cREATE_USER, List<Map<String, String>> addDatas, ModelService modelService2) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		int size=addDatas.size();
		for(int i=0;i<size;i++){
			Map<String, String> temp=addDatas.get(i);
			String WRI_CONNECT_DOC=temp.get("PPE_RELATION")+"-"+temp.get("PPE_SOB");//关联关系+账套
			String WRD_DOC_NUM = ErpServiceMethod.getReceiveNo(temp.get("DATA_AUTH"),"DJ05","SCWG",modelService);//入库单号
			//增加仓库单据信息表数据
			TableDataMapExt wms = new TableDataMapExt();
		 	wms.setTableName("T_WMS_DOC_INFO");
		 	wms.getColMap().put("ID", StringUtils.getUUID());
		 	wms.getColMap().put("CREATE_TIME", new Date());
		 	wms.getColMap().put("DATA_AUTH", temp.get("DATA_AUTH"));
		 	wms.getColMap().put("CREATE_USER", cREATE_USER);
		 	wms.getColMap().put("WDI_DOC_NUM", WRD_DOC_NUM);
		 	wms.getColMap().put("WDI_STATUS", "1");
		 	wms.getColMap().put("WDI_URGENT_FLAG", "N");//紧急标志
		 	//wms.getColMap().put("WDI_CUST_CODE", WRD_CUST_CODE);
		 	wms.getColMap().put("WDI_DOC_TYPE", "DJ05");
		 	wms.getColMap().put("WDI_DISPATCH_TYPE", "SCWG");
		 	wms.getColMap().put("WDI_CREATE_MAN", cREATE_USER);
		 	wms.getColMap().put("WDI_CREATE_TIME", new Date());
		 	wms.getColMap().put("WDI_MEMO", "");
		 	modelService.save(wms);
		 	
		 	//插入入库单信息
		 	TableDataMapExt receive = new TableDataMapExt();
		 	receive.setTableName("T_WMS_RECEIVE_DOC");
		 	receive.getColMap().put("ID", StringUtils.getUUID());
		 	receive.getColMap().put("CREATE_TIME", new Date());
		 	receive.getColMap().put("DATA_AUTH", temp.get("DATA_AUTH"));
		 	receive.getColMap().put("CREATE_USER", cREATE_USER);
		 	receive.getColMap().put("WRD_DOC_NUM", WRD_DOC_NUM);
		 	receive.getColMap().put("WRD_DOC_TYPE", "DJ05");
		 	receive.getColMap().put("WRD_STATUS", "1");
		 	//receive.getColMap().put("WRD_CUST_CODE", WRD_CUST_CODE);
		 	
		 	receive.getColMap().put("WRD_URGENT_FLAG", "N");//紧急标志
		 	receive.getColMap().put("WRD_DISPATCH_SN", "SCWG");
		 	receive.getColMap().put("WRD_MEMO", "ERP生产订单生成完工入库单");
		 	receive.getColMap().put("WRD_CREATE_MAN", cREATE_USER);
		 	receive.getColMap().put("WRD_CREATE_TIME", new Date());
		 	receive.getColMap().put("WPI_SOB", temp.get("PPE_SOB"));
		 	receive.getColMap().put("WRD_ERP_FLAG", "Y");//ERP同步标志
		 	receive.getColMap().put("WRD_ERP_NUM", temp.get("PPE_PLAN_ORDER"));//ERP生产订单
		 	modelService.save(receive);
		 	
		 	//插入入库单物料信息
		 	TableDataMapExt receive1 = new TableDataMapExt();
		 	receive1.setTableName("T_WMS_RECEIVE_ITEM");
			receive1.getColMap().put("ID", StringUtils.getUUID());
			receive1.getColMap().put("CREATE_TIME", new Date());
			receive1.getColMap().put("DATA_AUTH", temp.get("DATA_AUTH"));
			receive1.getColMap().put("CREATE_USER", cREATE_USER);
		 	
		 	receive1.getColMap().put("WRI_DOC_NUM", WRD_DOC_NUM);
		 	receive1.getColMap().put("WRI_STATUS", "1");
	 		receive1.getColMap().put("WRI_ITEM_CODE", temp.get("PPE_ITEM_CODE"));
	 		receive1.getColMap().put("WRI_ITEM_SEQ", temp.get("PPE_ITEM_SEQ"));
	 		receive1.getColMap().put("WRI_PLAN_NUM", temp.get("PPE_PLAN_QTY"));
	 		//receive1.getColMap().put("WRI_PACK_NUM", packNums[i]);
	 		receive1.getColMap().put("WRI_CONNECT_DOC", WRI_CONNECT_DOC);
	 		//receive1.getColMap().put("WRI_WH_CODE", wmsSelects[i]);
	 		//receive1.getColMap().put("WRI_LOT_NO", lotNos[i]);
	 		modelService.save(receive1);
		}
		
	}

	@SuppressWarnings("unchecked")
	private void AddData(String cREATE_USER, List<Map<String, String>> addDatas, ModelService modelService2) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		int size=addDatas.size();
		for(int i=0;i<size;i++){
			Map<String, String> temp=addDatas.get(i);
			TableDataMapExt object = new TableDataMapExt();
			object.setTableName("T_PM_PLAN_ERP"); // 
			object.getColMap().put("ID", StringUtils.getUUID());
			object.getColMap().put("DEPT_ID", temp.get("DATA_AUTH"));
			object.getColMap().put("CREATE_TIME", new Date());
			object.getColMap().put("DATA_AUTH", temp.get("DATA_AUTH"));
			object.getColMap().put("CREATE_USER", cREATE_USER);
			object.getColMap().put("PPE_PLAN_ORDER", temp.get("PPE_PLAN_ORDER"));//生产订单
			object.getColMap().put("PPE_MODEL_CODE", temp.get("PPE_MODEL_CODE"));//成品代码
			object.getColMap().put("PPE_PLAN_QTY", temp.get("PPE_PLAN_QTY"));//数量
			object.getColMap().put("PPE_ITEM_CODE", temp.get("PPE_ITEM_CODE"));//产品代码
			object.getColMap().put("PPE_ITEM_SEQ", temp.get("PPE_ITEM_SEQ"));//项次
			object.getColMap().put("PPE_SOB", temp.get("PPE_SOB"));//账套
			try{
				object.getColMap().put("PPE_START_DATE", formatter.parse(temp.get("PPE_START_DATE")));//计划开工日期
				object.getColMap().put("PPE_END_DATE", formatter.parse(temp.get("PPE_END_DATE")));//计划完工日期
			}catch(Exception e){
			}
			
			object.getColMap().put("PPE_RELATION", temp.get("PPE_RELATION"));//关联关系
			object.getColMap().put("PPE_STATUS", "Y");
			object.getColMap().put("PPE_PLATE", temp.get("PPE_PLATE"));//板别
			
			modelService.save(object);
			if(temp.get("PPE_RELATION").equals(temp.get("PPE_PLAN_ORDER"))){
				addOrder(temp,cREATE_USER);
			}
			
		}
	}

	/**
	 * 保存对应的工单信息
	 * @param temp
	 */
	@SuppressWarnings("unchecked")
	private void addOrder(Map<String, String> temp,String cREATE_USER) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String PROJECT_ID=temp.get("PPE_RELATION")+"-"+temp.get("PPE_SOB");
		String PRODUCT_MATERIAL=temp.get("PPE_MODEL_CODE");
		Map<String,Object> COINFO= getItemInfo(PRODUCT_MATERIAL,temp.get("DATA_AUTH"));//物料信息
		TableDataMapExt object = new TableDataMapExt();
		object.setTableName("T_PM_PROJECT_BASE"); // 
		object.getColMap().put("ID", StringUtils.getUUID());
		object.getColMap().put("PROJECT_ID", PROJECT_ID);
		object.getColMap().put("PRODUCT_MATERIAL", PRODUCT_MATERIAL);
		object.getColMap().put("PRODUCT_NAME", COINFO.get("CI_ITEM_NAME").toString());
		if(StringUtils.isNotBlank(COINFO.get("CI_ITEM_SPEC"))){
			object.getColMap().put("PRODUCT_STANDARD", COINFO.get("CI_ITEM_SPEC").toString());
		}
		object.getColMap().put("SCRAPPED_QTY", 0);//报废数量
		object.getColMap().put("PRODUCT_COUNT", temp.get("PPE_PLAN_QTY"));//计划数量
		object.getColMap().put("FQC_COUNT",0);//投入量
		object.getColMap().put("FINISH_COUNT",0);//产出量
		object.getColMap().put("PROJECT_STATUS",0);//状态
		object.getColMap().put("FAI_NUM", 0);//首件检测数量
		object.getColMap().put("PROJECT_OFONESELF", "N");//是否自动下达
		try{
			object.getColMap().put("PROLEPSIS_START_DATE", formatter.parse(temp.get("PPE_START_DATE")));//计划开工日期
			object.getColMap().put("PROLEPSIS_END_DATE", formatter.parse(temp.get("PPE_END_DATE")));//计划完工日期
		}catch(Exception e){}
		
		object.getColMap().put("DEPT_ID", temp.get("DATA_AUTH"));
		object.getColMap().put("CREATE_TIME", new Date());
		object.getColMap().put("DATA_AUTH", temp.get("DATA_AUTH"));
		object.getColMap().put("CREATE_USER", cREATE_USER);
		object.getColMap().put("ERP_PROJECT_ID", temp.get("PPE_RELATION"));//ERP关联关系
		modelService.save(object);
	}

	/**
	 * 集合里面再次验证  关联关系一定在生产订单中
	 * @param addDatas
	 * @return
	 */
	private boolean CKLIST(List<Map<String, String>> addDatas,StringBuffer MSG) {
		boolean result=true;
		int size=addDatas.size();
		for(int i=0;i<size;i++){
			Map<String, String> temp=addDatas.get(i);
			String PPE_RELATION=temp.get("PPE_RELATION");//关联关系
			//标记是否存在是否现有库 存在则为1 不存在为0
			String ISEXIST_PPE_RELATION=temp.get("ISEXIST_PPE_RELATION");
			if(ISEXIST_PPE_RELATION.equals("0")){
				for(int j=0;j<size;j++){
					Map<String, String> temp_compare=addDatas.get(j);
					String PPE_PLAN_ORDER=temp_compare.get("PPE_PLAN_ORDER");//生产订单
					if(PPE_RELATION.equals(PPE_PLAN_ORDER)){
						temp.put("ISEXIST_PPE_RELATION", "1");
						break;
					}
				}
				if(temp.get("ISEXIST_PPE_RELATION").equals("0")){
					result=false;
					MSG.append("第"+(i+1)+"行关联关系("+PPE_RELATION+")不存在生产订单中;");
				}
			}
		}
		return result;
	}

	/**
	 * 根据生产订单，账套获取条数
	 * @param CUST_CODE
	 * @return
	 */
	public static int getCount(String PPE_PLAN_ORDER,String PPE_SOB){
		int result=0;
		String sql="select * from T_PM_PLAN_ERP where PPE_PLAN_ORDER=? and PPE_SOB=? AND PPE_STATUS='Y'";
		Object[] param=new Object[2];
		param[0]=PPE_PLAN_ORDER;
		param[1]=PPE_SOB;
		
		result=CommMethod.getBaseService().countSql(sql, param);
		return result;
	}
	
	/**
	 * 根据生产订单，账套获取条数
	 * @param CUST_CODE
	 * @return
	 */
	public static int getRELATIONCount(String PPE_RELATION,String PPE_SOB){
		int result=0;
		String sql="select * from T_PM_PLAN_ERP where PPE_RELATION=? and PPE_SOB=? AND PPE_STATUS='Y'";
		Object[] param=new Object[2];
		param[0]=PPE_RELATION;
		param[1]=PPE_SOB;
		
		result=CommMethod.getBaseService().countSql(sql, param);
		return result;
	}
	/**
	 * 根据物料代码，账套获取条数
	 * @param CUST_CODE
	 * @return
	 */
	public static int getItemCount(String CI_ITEM_CODE,String DATA_AUTH){
		int result=0;
		String sql="select * from T_CO_ITEM where CI_ITEM_CODE=? and DATA_AUTH=? AND CI_STATUS='Y'";
		Object[] param=new Object[2];
		param[0]=CI_ITEM_CODE;
		param[1]=DATA_AUTH;
		
		result=CommMethod.getBaseService().countSql(sql, param);
		return result;
	}
	
	/**
	 * 根据成品料号，产品代码，组织机构获取记录数
	 * @param CUST_CODE
	 * @return
	 */
	public static int getPmModelRelCount(String MR_MODEL_CODE,String MR_ERP_PRODUCT_CODE,String DATA_AUTH){
		int result=0;
		String sql="select * from T_PM_MODEL_RELATION where MR_MODEL_CODE=? AND MR_ERP_PRODUCT_CODE=? and DATA_AUTH=? ";
		Object[] param=new Object[3];
		param[0]=MR_MODEL_CODE;
		param[1]=MR_ERP_PRODUCT_CODE;
		param[2]=DATA_AUTH;
		
		result=CommMethod.getBaseService().countSql(sql, param);
		return result;
	}
	
	/**
	 * 根据关联关系、生产订单、账套获取记录数
	 * 如果关联关系查看系统是否存在第一条数据，
	 * 
	 * @param CUST_CODE
	 * @return
	 */
	public static int getEXITSPPE_RELATION(String PPE_RELATION,String PPE_SOB){
		int result=0;
		String sql="SELECT * FROM T_PM_PLAN_ERP T1 WHERE T1.PPE_RELATION=? AND T1.PPE_PLAN_ORDER=? AND T1.PPE_SOB=? ";
		Object[] param=new Object[3];
		param[0]=PPE_RELATION;
		param[1]=PPE_RELATION;
		param[2]=PPE_SOB;
		result=CommMethod.getBaseService().countSql(sql, param);
		return result;
	}
	
	/**
	 * 根据板别判断填写的数据是否存在数据字典中
	 * 
	 * @param PPE_PLATE
	 * @return
	 */
	public static int getPPE_PLATECount(String PPE_PLATE){
		int result=0;
		String sql="SELECT * FROM sy_dict_val t WHERE t.dict_code='SMT_PLATE' AND VALUE=? ";
		Object[] param=new Object[1];
		param[0]=PPE_PLATE;
		
		result=CommMethod.getBaseService().countSql(sql, param);
		return result;
	}
	
	/**
	 * 根据物料代码，账套获取信息
	 * @param CI_ITEM_CODE
	 * @param DATA_AUTH
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> getItemInfo(String CI_ITEM_CODE,String DATA_AUTH){
		Map<String,Object> temp=null;
		String sql="select * from T_CO_ITEM where CI_ITEM_CODE=? and DATA_AUTH=? AND CI_STATUS='Y'";
		Object[] param=new Object[2];
		param[0]=CI_ITEM_CODE;
		param[1]=DATA_AUTH;
		
		List<Map<String, Object>> list=modelService.listDataSql(sql,new Object[]{CI_ITEM_CODE,DATA_AUTH});
		if(list!=null&&list.size()>0){
			temp=list.get(0);
		}
		return temp;
	}
	
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> getPpeInfo(String PPE_RELATION,String PPE_SOB){
		Map<String,Object> temp=null;
		String sql="select * from T_PM_PLAN_ERP where PPE_RELATION=? AND PPE_PLAN_ORDER=? and PPE_SOB=? ";
		Object[] param=new Object[3];
		param[0]=PPE_RELATION;
		param[1]=PPE_RELATION;
		param[2]=PPE_SOB;
		
		List<Map<String, Object>> list=modelService.listDataSql(sql,param);
		if(list!=null&&list.size()>0){
			temp=list.get(0);
		}
		return temp;
	}
	

}
