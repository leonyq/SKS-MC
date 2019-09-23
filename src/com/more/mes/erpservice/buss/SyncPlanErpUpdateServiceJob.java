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
 * 变更生产订单信息接口
 *  * 核心业务说明：
 * 1、根据关联关系、生产订单、账套三个字段判断唯一性
 * 不存在直接提示ERP生产订单不存在
 * 存在则继续判断 对应的工单信息的状态是否是开立
 *  是开立则允许变更信息
 *  否则不允许
 */
public class SyncPlanErpUpdateServiceJob extends InterfaceLog implements IhttpServiceJosn {
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
		        Map<String,Object> userMap=ErpServiceMethod.getUserID(CREATE_USER);
		        CREATE_USER=userMap.get("ID").toString();
				//添加数据的数组
				List<Map<String,String>> modDatas=new ArrayList<Map<String,String>>();
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
	            	String modOrderFlag="0";//标记是否生成工单信息默认不生成
	            	
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
	            	String PPE_RELATION=temp_json.getString("PPE_RELATION");//验证关联关系
	            	if(StringUtils.isBlank(PPE_RELATION)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行关联关系为空;");
	                	continue;
	            	}
	            	
	            	String PPE_PLATE=temp_json.getString("PPE_PLATE"); //板别
	            	if(StringUtils.isNotBlank(PPE_PLATE)){
	            		int count=getPPE_PLATECount(PPE_PLATE);
	            		if(count==0){
	            			RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行板别("+PPE_PLATE+")数据不对;");
		                	continue;
	            		}
	            	}
	            	
	            	String PPE_PLAN_ORDER=temp_json.getString("PPE_PLAN_ORDER");//生产订单
	            	if(StringUtils.isBlank(PPE_PLAN_ORDER)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行生产订单为空;");
	                	continue;
	            	}else { //验证关联关系、生产订单、账套是否存在
	            		Map<String,Object> mapERP= getERO_ORDERINFO(PPE_RELATION,PPE_PLAN_ORDER,SOB,PPE_PLATE);
	            		if(mapERP!=null&&mapERP.size()>0){
	            			
	            		}else{
	            			RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行关联关系("+PPE_RELATION+")、生产订单("+PPE_PLAN_ORDER+")、账套("+SOB+")、板别("+PPE_PLATE+")不存在;");
		                	continue;
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
	            	//关联关系和生产订单一致
	            	if(PPE_RELATION.equals(PPE_PLAN_ORDER)){
	            		//判断是否更新工单信息
	                	String PROJECT_ID=PPE_RELATION+"-"+SOB;
	                	Map<String,Object> temp=getPM_PROJECT_BASEInfo(PROJECT_ID);
	                	if(temp!=null&&!temp.get("PROJECT_STATUS").equals("")){
	                		//
	                		if(temp.get("PROJECT_STATUS").equals("0")){
	                			modOrderFlag="1";//标识为1
	                		}else{
	                			RS=ErpServiceMethod.NG;
	    	                	MSG.append("第"+(i+1)+"行对应的工单("+PROJECT_ID+")不是在开立状态，不能更新;");
	    	                	continue;
	                		}
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
	            	temp_data.put("modOrderFlag", modOrderFlag);
	            	temp_data.put("DATA_AUTH", DATA_AUTH);//组织机构
	            	temp_data.put("PPE_PLATE", PPE_PLATE);//板别
	            	temp_data.put("SEQ", String.valueOf(i));
	            	modDatas.add(temp_data);
		        }
				
				//验证通过，将相关数据保存
				if(RS.equals("OK")){
					MsHTranMan tran=  BussService.getHbTran();
					try{
						ModData(CREATE_USER,modDatas,modelService);
						ModFinishData(CREATE_USER,modDatas,modelService);
						tran.commit();
						MSG.append("处理成功");
					}catch(Exception e){
						tran.rollback();
						RS=ErpServiceMethod.NG;
						MSG.append("同步生产订单信息接口处理失败，具体请查看日志");
						e.printStackTrace();
						ErpServiceMethod.writeLog("","同步生产订单信息接口处理失败错误："+e.getMessage());
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
      	ErpServiceMethod.AddIFLog(requestString, jsonStr, 10, "更新生产订单信息接口", RS, modelService);
      	
		String endTime=format.format(new java.util.Date());//接口请求结束时间
		
		ErpServiceMethod.writeLog("",  beginTime+"同步生产订单信息接口请求信息:"+requestString);
		ErpServiceMethod.writeLog("", endTime+ "同步生产订单信息接口返回信息:"+jsonStr);
		service.setResult(map);
		service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
		service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
		service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
		
		return null;
	}
	
	@SuppressWarnings("unchecked")
	private void ModFinishData(String cREATE_USER, List<Map<String, String>> modDatas, ModelService modelService2) {
		int size=modDatas.size();
		for(int i=0;i<size;i++){
			Map<String, String> temp=modDatas.get(i);
			String WRI_CONNECT_DOC=temp.get("PPE_RELATION")+"-"+temp.get("PPE_SOB"); //关联关系+账套
			TableDataMapExt object = new TableDataMapExt();
			object.setTableName("T_WMS_RECEIVE_ITEM"); // 
			object.setSqlWhere(" AND WRI_CONNECT_DOC='"+WRI_CONNECT_DOC+"'");
			
			object.getColMap().put("WRI_ITEM_CODE", temp.get("PPE_ITEM_CODE"));
			object.getColMap().put("WRI_ITEM_SEQ", temp.get("PPE_ITEM_SEQ"));
			object.getColMap().put("WRI_PLAN_NUM", temp.get("PPE_PLAN_QTY"));
			object.getColMap().put("EDIT_TIME", new Date()); //更新时间
			object.getColMap().put("EDIT_USER", cREATE_USER); //更新人
			modelService.edit(object);
		}
	}

	@SuppressWarnings("unchecked")
	private void ModData(String cREATE_USER, List<Map<String, String>> modDatas, ModelService modelService2) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		int size=modDatas.size();
		for(int i=0;i<size;i++){
			Map<String, String> temp=modDatas.get(i);
			TableDataMapExt object = new TableDataMapExt();
			object.setTableName("T_PM_PLAN_ERP"); // 
			
			object.setSqlWhere("AND PPE_PLAN_ORDER='"+temp.get("PPE_PLAN_ORDER")+"' AND PPE_SOB='"+temp.get("PPE_SOB")
					+"' AND PPE_RELATION='"+temp.get("PPE_RELATION")+"' AND PPE_PLATE='"+temp.get("PPE_PLATE")+"'");
			//object.getColMap().put("DEPT_ID", temp.get("DATA_AUTH"));
			//object.getColMap().put("DATA_AUTH", temp.get("DATA_AUTH"));
			object.getColMap().put("EDIT_TIME", new Date());//编辑时间
			object.getColMap().put("EDIT_USER", cREATE_USER);//编辑人
			
			object.getColMap().put("PPE_MODEL_CODE", temp.get("PPE_MODEL_CODE"));//成品代码
			object.getColMap().put("PPE_PLAN_QTY", temp.get("PPE_PLAN_QTY"));//数量
			object.getColMap().put("PPE_ITEM_CODE", temp.get("PPE_ITEM_CODE"));//产品代码
			object.getColMap().put("PPE_ITEM_SEQ", temp.get("PPE_ITEM_SEQ"));//项次
			try{
				object.getColMap().put("PPE_START_DATE", formatter.parse(temp.get("PPE_START_DATE")));//计划开工日期
				object.getColMap().put("PPE_END_DATE", formatter.parse(temp.get("PPE_END_DATE")));//计划完工日期
			}catch(Exception e){}
			
			object.getColMap().put("PPE_STATUS", "Y");
			//object.getColMap().put("PPE_PLATE", temp.get("PPE_PLATE"));//板别
			modelService.edit(object);
			//是否生成采购订单
			if(temp.get("modOrderFlag").equals("1")){
				modOrder(temp,cREATE_USER);
			}
		}
	}

	/**
	 * 更新对应的工单信息
	 * @param temp
	 */
	@SuppressWarnings("unchecked")
	private void modOrder(Map<String, String> temp,String cREATE_USER) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String PROJECT_ID=temp.get("PPE_RELATION")+"-"+temp.get("PPE_SOB");
		String PRODUCT_MATERIAL=temp.get("PPE_MODEL_CODE");
		Map<String,Object> COINFO= getItemInfo(PRODUCT_MATERIAL,temp.get("DATA_AUTH"));//物料信息
		TableDataMapExt object = new TableDataMapExt();
		object.setTableName("T_PM_PROJECT_BASE"); // 
		object.setSqlWhere(" AND PROJECT_ID='"+PROJECT_ID+"'");
		
		object.getColMap().put("PRODUCT_MATERIAL", PRODUCT_MATERIAL);
		object.getColMap().put("PRODUCT_NAME", COINFO.get("CI_ITEM_NAME").toString());
		if(StringUtils.isNotBlank(COINFO.get("CI_ITEM_SPEC"))){
			object.getColMap().put("PRODUCT_STANDARD", COINFO.get("CI_ITEM_SPEC").toString());
		}
		//object.getColMap().put("PRODUCT_STANDARD", COINFO.get("CI_ITEM_SPEC").toString());
		
		object.getColMap().put("PRODUCT_COUNT", temp.get("PPE_PLAN_QTY"));//计划数量
		try{
			object.getColMap().put("PROLEPSIS_START_DATE", formatter.parse(temp.get("PPE_START_DATE")));//计划开工日期
			object.getColMap().put("PROLEPSIS_END_DATE", formatter.parse(temp.get("PPE_END_DATE")));//计划完工日期
		}catch(Exception e){}
		object.getColMap().put("EDIT_TIME", new Date()); //更新时间
		object.getColMap().put("EDIT_USER", cREATE_USER); //更新人
		modelService.edit(object);
	}

	/**
	 * 根据关联关系、生产订单、账套获取条数
	 * 存在则允许修改，否则不让更新
	 * @param CUST_CODE
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> getERO_ORDERINFO(String PPE_RELATION,String PPE_PLAN_ORDER,String PPE_SOB,String PPE_PLATE){
		Map<String,Object> temp=null;
		String sql="select * from T_PM_PLAN_ERP where PPE_RELATION=? and PPE_PLAN_ORDER=? and PPE_SOB=? AND PPE_STATUS='Y' and PPE_PLATE=?";
		Object[] param=new Object[3];
		param[0]=PPE_RELATION;
		param[1]=PPE_PLAN_ORDER;
		param[2]=PPE_SOB;
		param[3]=PPE_PLATE;
		
		List<Map<String, Object>> list=modelService.listDataSql(sql,param);
		if(list!=null&&list.size()>0){
			temp=list.get(0);
		}
		return temp;
	}
	
	/**
	 * 根据生产订单，账套获取工单信息
	 * @param PROJECT_ID
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> getPM_PROJECT_BASEInfo(String PROJECT_ID){
		Map<String,Object> temp=null;
		String sql="select * from T_PM_PROJECT_BASE where PROJECT_ID=?";
		
		List<Map<String, Object>> list=modelService.listDataSql(sql,new Object[]{PROJECT_ID});
		if(list!=null&&list.size()>0){
			temp=list.get(0);
		}
		return temp;
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
	 * 根据板别判断填写的数据是否存在数据字典中
	 * 
	 * @param PPE_PLATE
	 * @return
	 */
	public static int getPPE_PLATECount(String PPE_PLATE){
		int result=0;
		String sql="SELECT * FROM sy_dict_val t WHERE t.dict_code='SMT_PLATE' AND CODE=? ";
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

}
