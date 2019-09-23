package com.more.mes.erpservice;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 金碟u8ERP
*同步物料分类信息接口
 */
public class SyncCoItemClassServiceJob extends InterfaceLog implements IhttpServiceJosn {
	private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
	
	@Override
	public String exeFunc(HttpCoreService service) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String beginTime=format.format(new java.util.Date());//接口请求开始时间
		//返回结果
		Map<String, Object> map = new HashMap<String, Object>();
		String jsonStr="";
		//获取请求数据
		String requestString = ErpServiceMethod.getRequestJson(service);
		//验证默认正确
		String RS=ErpServiceMethod.OK;
		StringBuffer MSG=new StringBuffer();
		JSONObject jsonObject = JSONObject.fromObject(requestString);
		try{
			//String REQUEST_TIME=jsonObject.getString("REQUEST_TIME");
			//String USER_ID=jsonObject.getString("USER_ID");
			String REQUEST_DATA=jsonObject.getString("REQUEST_DATA");
			JSONObject jsonData = JSONObject.fromObject(REQUEST_DATA);
			
			JSONArray jsonArray = JSONArray.fromObject(jsonData.getString("DATAS"));
			int size = jsonArray.size();

	        String DATA_AUTH=null;//获取组织机构
	        if(!jsonObject.containsKey("USER_ID")){
	        	RS=ErpServiceMethod.NG;
            	MSG.append("请求人为空;");
	        }
	        String CREATE_USER=jsonObject.getString("USER_ID");//创建人ID
			
	        CREATE_USER=ErpServiceMethod.getUserID(CREATE_USER).get("ID").toString();
			//添加数据的数组
			List<Map<String,String>> addDatas=new ArrayList<Map<String,String>>();
			
			//修改数据的数组
			List<Map<String,String>> modDatas=new ArrayList<Map<String,String>>();
			
			//删除数据的数组
			List<Map<String,String>> delDatas=new ArrayList<Map<String,String>>();
			
			for (int i = 0; i < size; i++){
				Map<String,String> temp_data=new HashMap<String,String>();
	            JSONObject temp_json = jsonArray.getJSONObject(i);
	            String TYPE=temp_json.getString("TYPE");
	            if(!temp_json.containsKey("CT_CODE")){
	            	RS=ErpServiceMethod.NG;
                	MSG.append("第"+(i+1)+"行没有分类编码字段;");
                	continue;
	            }
	            if(TYPE.equals("1")){
	            	//判断各个字段必填
	            	String CT_CODE=temp_json.getString("CT_CODE");//分类编码
	            	if(!temp_json.containsKey("CT_NAME")){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行没有分类名称字段;");
	                	continue;
	            	}
	            	String CT_NAME=temp_json.getString("CT_NAME");//分类名称
	            	if(!temp_json.containsKey("CT_GRADE")){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行没有编码级次字段;");
	                	continue;
	            	}
	            	String CT_GRADE=temp_json.getString("CT_GRADE");//编码级次
	            	
	            	String CT_GRADE_END=temp_json.getString("CT_GRADE_END");//是否末级
	            	if(!temp_json.containsKey("SOB")){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行没有账套字段;");
	                	continue;
	            	}
	                String SOB=temp_json.getString("SOB");//账套
	                
	            	if(StringUtils.isBlank(CT_CODE)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行分类编码为空;");
	                	continue;
	            	}else if(getCount(CT_CODE)!=0){ //验证分类编码不能存在
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行分类编码已存在;");
	                	continue;
	            	}
	            	
	            	if(StringUtils.isBlank(CT_NAME)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行分类名称为空;");
	                	continue;
	            	}
	            	
	            	if(StringUtils.isBlank(CT_GRADE)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行编码级次为空;");
	                	continue;
	            	}
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

	                     }
	            	}
	            	
	            	temp_data.put("CT_CODE", CT_CODE);
	            	temp_data.put("CT_NAME", CT_NAME);
	            	temp_data.put("CT_GRADE", CT_GRADE);
	            	temp_data.put("CT_GRADE_END", CT_GRADE_END);
	            	temp_data.put("DATA_AUTH", DATA_AUTH);
	            	addDatas.add(temp_data);
	            	
	            }else if(TYPE.equals("2")){
	            	//判断各个字段必填
	            	String CT_CODE=temp_json.getString("CT_CODE");//分类编码
	            	if(!temp_json.containsKey("CT_NAME")){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行没有分类名称字段;");
	                	continue;
	            	}
	            	String CT_NAME=temp_json.getString("CT_NAME");//分类名称
	            	if(!temp_json.containsKey("CT_GRADE")){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行没有编码级次字段;");
	                	continue;
	            	}
	            	String CT_GRADE=temp_json.getString("CT_GRADE");//编码级次
	            	
	            	String CT_GRADE_END=temp_json.getString("CT_GRADE_END");//是否末级
	            	if(!temp_json.containsKey("SOB")){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行没有账套字段;");
	                	continue;
	            	}
	                String SOB=temp_json.getString("SOB");//账套
	                
	            	if(StringUtils.isBlank(CT_CODE)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行分类编码为空;");
	                	continue;
	            	}else if(getCount(CT_CODE)==0){ //验证分类编码不能存在
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行分类编码不存在;");
	                	continue;
	            	}
	            	
	            	if(StringUtils.isBlank(CT_NAME)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行分类名称为空;");
	                	continue;
	            	}
	            	
	            	if(StringUtils.isBlank(CT_GRADE)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行编码级次为空;");
	                	continue;
	            	}
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

	                     }
	            	}
	            	
	            	temp_data.put("CT_CODE", CT_CODE);
	            	temp_data.put("CT_NAME", CT_NAME);
	            	temp_data.put("CT_GRADE", CT_GRADE);
	            	temp_data.put("CT_GRADE_END", CT_GRADE_END);
	            	temp_data.put("DATA_AUTH", DATA_AUTH);
	            	modDatas.add(temp_data);
	            	
	            }else if(TYPE.equals("3")){
	            	String CT_CODE=temp_json.getString("CT_CODE");//分类编码
	            	if(StringUtils.isBlank(CT_CODE)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行分类编码为空;");
	                	continue;
	            	}else if(getCount(CT_CODE)==0){ //验证分类编码不能存在
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行分类编码不存在;");
	                	continue;
	            	}else if(getCICount(CT_CODE)!=0){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行分类编码已经被引用，不能删除;");
	                	continue;
	            	}
	            	
	            	temp_data.put("CT_CODE", CT_CODE);
	            	delDatas.add(temp_data);
	            	
	            }else{
	            	RS=ErpServiceMethod.NG;
	            	MSG.append("第"+(i+1)+"请求代码不在处理范围内;");
	            	continue;
	            }
	        }
			
			//验证通过，将相关数据保存
			if(RS.equals("OK")){
				try{
					AddData(DATA_AUTH, CREATE_USER,addDatas,modelService);
					ModData(DATA_AUTH, CREATE_USER,modDatas,modelService);
					DelData(DATA_AUTH, CREATE_USER,delDatas,modelService);
					MSG.append("处理成功");
				}catch(Exception e){
					RS=ErpServiceMethod.NG;
					MSG.append("同步物料分类信息接口处理失败，具体请查看日志");
					e.printStackTrace();
					ErpServiceMethod.writeLog("","同步物料分类信息接口处理失败错误："+e.getMessage());
				}
			}
		}catch(Exception e){
			RS=ErpServiceMethod.NG;
			MSG.append("同步物料分类信息接口处理失败，具体请查看日志2");
			e.printStackTrace();
			ErpServiceMethod.writeLog("","同步物料分类信息接口处理失败错误2："+e.getMessage());
		}
		
		jsonStr=ErpServiceMethod.getResult(RS, MSG.toString());
		map.put("json", jsonStr);
		//保存日志信息 
      	ErpServiceMethod.AddIFLog(requestString, jsonStr, 9, "同步物料分类信息接口", RS, modelService);
      	
		String endTime=format.format(new java.util.Date());//接口请求结束时间
		
		ErpServiceMethod.writeLog("",  beginTime+"同步物料分类信息接口请求信息:"+requestString);
		ErpServiceMethod.writeLog("", endTime+ "同步物料分类信息接口返回信息:"+jsonStr);
		service.setResult(map);
		service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
		service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
		service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
		
		return null;
	}
	
	/**
	 * 添加数据
	 * @param addDatas
	 */
	@SuppressWarnings("unchecked")
	public static void AddData(String DATA_AUTH, String CREATE_USER, List<Map<String,String>> addDatas,ModelService modelService){
		if(addDatas!=null&&addDatas.size()>0){
			int size=addDatas.size();
			for(int i=0;i<size;i++){
				Map<String,String> temp=addDatas.get(i);
				
				TableDataMapExt object = new TableDataMapExt();
				object.setTableName("T_CO_ITEM_CLASS"); // 
				object.getColMap().put("ID", StringUtils.getUUID());
				object.getColMap().put("CIC_CLASS_CODE", temp.get("CT_CODE"));
				object.getColMap().put("CIC_CLASS_NAME", temp.get("CT_NAME"));
				object.getColMap().put("CIC_CLASS_GRADE", temp.get("CT_GRADE"));
				object.getColMap().put("CIC_CLASS_END", temp.get("CT_GRADE_END"));
				object.getColMap().put("CREATE_USER",  CREATE_USER);
				object.getColMap().put("CREATE_TIME", new Date());
				object.getColMap().put("DATA_AUTH",  DATA_AUTH);
				object.getColMap().put("DEPT_ID",  DATA_AUTH);
				modelService.save(object);
			}
		}
	}
	
	/**
	 * 修改数据
	 * @param addDatas
	 */
	@SuppressWarnings("unchecked")
	public static void ModData(String DATA_AUTH, String CREATE_USER, List<Map<String,String>> modDatas,ModelService modelService){
		if(modDatas!=null&&modDatas.size()>0){
			int size=modDatas.size();
			for(int i=0;i<size;i++){
				Map<String,String> temp=modDatas.get(i);
				
				TableDataMapExt object = new TableDataMapExt();
				object.setTableName("T_CO_ITEM_CLASS"); // 
				object.setSqlWhere(" and CIC_CLASS_CODE = '"+temp.get("CT_CODE")+"' ");
				object.getColMap().put("CIC_CLASS_NAME", temp.get("CT_NAME"));
				object.getColMap().put("CIC_CLASS_GRADE", temp.get("CT_GRADE"));
				object.getColMap().put("CIC_CLASS_END", temp.get("CT_GRADE_END"));
				
				modelService.edit(object);
			}
		}
	}
	
	/**
	 * 删除数据
	 * @param addDatas
	 */
	public static void DelData(String DATA_AUTH, String CREATE_USER, List<Map<String,String>> delDatas,ModelService modelService){
		if(delDatas!=null&&delDatas.size()>0){
			int size=delDatas.size();
			for(int i=0;i<size;i++){
				Map<String,String> temp=delDatas.get(i);
				TableDataMapExt object = new TableDataMapExt();
				object.setTableName("T_CO_ITEM_CLASS"); // 删除
				object.setSqlWhere(" and CIC_CLASS_CODE = '"+temp.get("CT_CODE")+"' ");
				modelService.del(object);
			}
		}
	}
	
	/**
	 * 根据客户编号获取条数
	 * @param CUST_CODE
	 * @return
	 */
	public static int getCount(String CUST_CODE){
		int result=0;
		String sql="";
		Object[] param=new Object[1];
	
		sql="select * from T_CO_ITEM_CLASS where CIC_CLASS_CODE=?";
		param[0]=CUST_CODE;
		
		result=CommMethod.getBaseService().countSql(sql, param);
		return result;
	}
	
	public static int getCICount(String CUST_CODE){
		int result=0;
		String sql="";
		Object[] param=new Object[2];
	
		sql="select * from T_CO_ITEM where CI_ITEM_TYPE=? or CI_ITEM_CLASS=? and CI_STATUS='Y'";
		param[0]=CUST_CODE;
		param[1]=CUST_CODE;
		
		result=CommMethod.getBaseService().countSql(sql, param);
		return result;
	}

}
