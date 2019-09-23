package com.more.mes.erpservice;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 金碟u8ERP
  同步部门信息接口(service)
 */
public class SyncDeptServiceJob extends InterfaceLog implements IhttpServiceJosn {
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
		JSONObject jsonObject = JSONObject.fromObject(requestString);
		//String REQUEST_TIME=jsonObject.getString("REQUEST_TIME");
		//String USER_ID=jsonObject.getString("USER_ID");
		//验证默认正确
		String RS=ErpServiceMethod.OK;
		StringBuffer MSG=new StringBuffer();
		try{
			String REQUEST_DATA=jsonObject.getString("REQUEST_DATA");
			JSONObject jsonData = JSONObject.fromObject(REQUEST_DATA);
			
			JSONArray jsonArray = JSONArray.fromObject(jsonData.getString("DATAS"));
			int size = jsonArray.size();

	        String DATA_AUTH=null;//获取组织机构
	        String CREATE_USER=null;//创建人ID
			
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
	            
	            
	            if(TYPE.equals("1")){
	            	//判断各个字段必填
	            	String ERP_CODE=temp_json.getString("ID");//部门编号
	            	String NAME=temp_json.getString("NAME");//部门名称
	            	String UP_ID=temp_json.getString("UP_ID");//上级部门编号
	            	if(StringUtils.isBlank(ERP_CODE)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行部门编号为空;");
	                	continue;
	            	}else if(getCount(ERP_CODE)!=0){ //验证部门编号不能存在
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行部门编号已存在;");
	                	continue;
	            	}
	            	
	            	if(StringUtils.isBlank(NAME)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行部门名称为空;");
	                	continue;
	            	}
	            	
	            	if(StringUtils.isBlank(UP_ID)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行上级部门编号为空;");
	                	continue;
	            	}else if(getCount(UP_ID)==0){ //验证部门编号不能存在
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行上级部门编号不存在;");
	                	continue;
	            	}else{
	            		Map<String ,Object > temp=this.getInfo(UP_ID);
	            		UP_ID=temp.get("ID").toString();
	            	}
	            	
	            	temp_data.put("ERP_CODE", ERP_CODE);
	            	temp_data.put("NAME", NAME);
	            	temp_data.put("UP_ID", UP_ID);
	            	addDatas.add(temp_data);
	            	
	            }else if(TYPE.equals("2")){
	            	//判断各个字段必填
	            	String ERP_CODE=temp_json.getString("ID");//部门编号
	            	String NAME=temp_json.getString("NAME");//部门名称
	            	String UP_ID=temp_json.getString("UP_ID");//上级部门编号
	            	String ID="";
	            	
	            	if(StringUtils.isBlank(ERP_CODE)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行部门编号为空;"); 
	                	continue;
	            	}else if(getCount(ERP_CODE)==0){ //验证部门编号能存在
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行部门编号不存在;");
	                	continue;
	            	}else{
	            		Map<String ,Object > temp=this.getInfo(ERP_CODE);
	            		ID=temp.get("ID").toString();
	            	}
	            	
	            	if(StringUtils.isBlank(NAME)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行部门名称为空;");
	                	continue;
	            	}
	            	
	            	if(StringUtils.isBlank(UP_ID)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行上级部门编号为空;");
	                	continue;
	            	}else if(getCount(UP_ID,ID)==0){ //验证部门编号不能存在
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行上级部门编号不存在;");
	                	continue;
	            	}else{
	            		Map<String ,Object > temp=this.getInfo(UP_ID);
	            		UP_ID=temp.get("ID").toString();
	            	}
	            	
	            	temp_data.put("ERP_CODE", ERP_CODE);
	            	temp_data.put("NAME", NAME);
	            	temp_data.put("UP_ID", UP_ID);
	            	temp_data.put("ID", ID);
	            	modDatas.add(temp_data);
	            	
	            }else if(TYPE.equals("3")){
	            	String ERP_CODE=temp_json.getString("ID");//部门编号
	            	String ID="";
	            	if(StringUtils.isBlank(ERP_CODE)){
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行部门编号为空;");
	                	continue;
	            	}else if(getCount(ERP_CODE)==0){ //验证部门编号能存在
	            		RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行部门编号不存在;");
	                	continue;
	            	}else {
	            		Map<String ,Object > temp=this.getInfo(ERP_CODE);
	            		String DEPT_ID=temp.get("ID").toString();
	            		String IS_AUTH=temp.get("IS_AUTH").toString();
	            		if(IS_AUTH.equals("1")){
	            			RS=ErpServiceMethod.NG;
	                    	MSG.append("第"+(i+1)+"行部门信息是组织机构，不能被删除;");
	                    	continue;
	            		}
	            		if(getUserCount(DEPT_ID)>0||getUserAuthCount(DEPT_ID)>0){
	            			RS=ErpServiceMethod.NG;
	                    	MSG.append("第"+(i+1)+"行部门信息已经被引用;");
	                    	continue;
	            		}
	            		ID=temp.get("ID").toString();
	            	}
	            	temp_data.put("ID", ID);
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
					MSG.append("同步部门接口处理失败，具体请查看日志");
					e.printStackTrace();
					ErpServiceMethod.writeLog("","同步部门接口处理失败错误："+e.getMessage());
				}
			}
		}catch(Exception e){
			RS=ErpServiceMethod.NG;
			MSG.append("同步部门接口处理失败，具体请查看日志2");
			e.printStackTrace();
			ErpServiceMethod.writeLog("","同步部门接口处理失败错误2："+e.getMessage());
		}
		jsonStr=ErpServiceMethod.getResult(RS, MSG.toString());
		//保存日志信息 
      	ErpServiceMethod.AddIFLog(requestString, jsonStr, 6, "同步部门信息接口接口", RS, modelService);
      	
		String endTime=format.format(new java.util.Date());//接口请求结束时间
		map.put("json", jsonStr);
		
		ErpServiceMethod.writeLog("",  beginTime+"同步部门信息接口请求信息:"+requestString);
		ErpServiceMethod.writeLog("", endTime+ "同步部门信息接口返回信息:"+jsonStr);
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
				Random random = new Random();
				int number =random.nextInt(99);
				String PARTITION_CODE=String.format("%02d",number);
				
				TableDataMapExt object = new TableDataMapExt();
				object.setTableName("SY_DEPT"); // 
				String ID=StringUtils.getUUID();
				object.getColMap().put("ID", ID);
				object.getColMap().put("NAME", temp.get("NAME"));
				object.getColMap().put("UP_ID", temp.get("UP_ID"));
				object.getColMap().put("ERP_CODE", temp.get("ERP_CODE"));
				object.getColMap().put("IS_AUTH", "2");//默认组织机构
				object.getColMap().put("PARTITION_CODE", PARTITION_CODE);//默认两位随机码
				object.getColMap().put("DEP_SN",  temp.get("ERP_CODE"));
				object.getColMap().put("PATH", temp.get("UP_ID")+"-"+ID);
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
				object.setTableName("SY_DEPT"); // 插入中间表
				object.setSqlWhere(" and ID = '"+temp.get("ID")+"' ");
				object.getColMap().put("NAME", temp.get("NAME"));
				object.getColMap().put("UP_ID", temp.get("UP_ID"));
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
				object.setTableName("SY_DEPT"); // 插入中间表
				object.setSqlWhere(" and ID = '"+temp.get("ID")+"' ");
				
				modelService.del(object);
			}
		}
	}
	
	/**
	 * 根据部门编号获取条数
	 * @param CUST_CODE
	 * @return
	 */
	public static int getCount(String ERP_CODE){
		return getCount(ERP_CODE,"");
	}
	
	/**
	 * 根据部门编号获取条数
	 * @param CUST_CODE
	 * @return
	 */
	public static int getCount(String ERP_CODE,String ID){
		int result=0;
		String sql="";
		Object[] param=null;
	
		sql="select * from SY_DEPT where ERP_CODE=?";
		
		if(StringUtils.isNotBlank(ID)){
			param=new Object[2];
			sql+=" AND ID<>? ";
			param[1]=ID;
		}else{
			param=new Object[1];
		}
		
		param[0]=ERP_CODE;
		
		result=CommMethod.getBaseService().countSql(sql, param);
		return result;
	}
	
	/**
	 * 获取部门信息
	 * @param CU_UNIT_CODE
	 * @param CU_UNIT_NAME
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> getInfo(String ERP_CODE){
		Map<String,Object> map=null;
		String sql="select * from SY_DEPT where ERP_CODE=?  ";
		List<Map<String, Object>> list=modelService.listDataSql(sql,new Object[]{ERP_CODE});
		if(list!=null&&list.size()>0){
			map=new HashMap<String,Object>();
			map=list.get(0);
		}
		return map;
	}
	
	/**
	 * 根据部门ID获取用户记录数
	 * @param CUST_CODE
	 * @return
	 */
	public static int getUserCount(String DEPT_ID){
		int result=0;
		String sql="";
		Object[] param=new Object[1];
	
		sql="select * from SY_USER where DEPT_ID=?  ";
		param[0]=DEPT_ID;
		
		result=CommMethod.getBaseService().countSql(sql, param);
		return result;
	}
	
	/**
	 * 根据部门id 获取用户部门权限 记录数
	 * @param CUST_CODE
	 * @return
	 */
	public static int getUserAuthCount(String DEPT_ID){
		int result=0;
		String sql="";
		Object[] param=new Object[1];
	
		sql="select * from SY_DATA_AUTH where DEPT_ID=?  ";
		param[0]=DEPT_ID;
		
		result=CommMethod.getBaseService().countSql(sql, param);
		return result;
	}

}
