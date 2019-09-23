package com.more.mes.erpservice;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.LogFactory;
import org.apache.commons.logging.Log;

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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 金碟u8ERP
   同步用户信息接口(service)
 */
public class SyncUserServiceJob extends InterfaceLog implements IhttpServiceJosn {
	private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
	private final Log log = LogFactory.getLog(this.getClass());
	@Override
	public String exeFunc(HttpCoreService service) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String beginTime=format.format(new java.util.Date());//接口请求开始时间
		//返回结果
		Map<String, Object> map = new HashMap<String, Object>();
		String RS=ErpServiceMethod.OK;
		StringBuffer MSG=new StringBuffer();
		String jsonStr="";
		//获取请求数据
		String requestString=ErpServiceMethod.getRequestJson(service);
		JSONObject jsonObject = null;
		try{
			jsonObject=JSONObject.fromObject(requestString);
		}catch(Exception e){
			RS=ErpServiceMethod.NG;
			MSG.append("请求报文JSON格式错误");
		}
		//验证默认正确
		if(RS.equals(ErpServiceMethod.OK)){
			try{
				//String REQUEST_TIME=jsonObject.getString("REQUEST_TIME");
				//String USER_ID=jsonObject.getString("USER_ID");
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
		            	String LOGIN_NAME=temp_json.getString("LOGIN_NAME");//员工编号
		            	String NAME=temp_json.getString("NAME");//用户称
		            	String DEPT_ID=temp_json.getString("DEPT_ID");//部门编码
		            	String SOB=temp_json.getString("SOB");//账套
		            	boolean flag=true;
		            	String SOBS="";//实际的组织机构权限ID集合
		            	if(StringUtils.isBlank(LOGIN_NAME)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行员工编号为空;");
		                	continue;
		            	}
		            	Map<String,Object> temp_map =getInfo(LOGIN_NAME);
		            	if(temp_map!=null&&temp_map.containsKey("ID")){
		            		//不启用
		            		if(temp_map.get("ENABLE").equals("0")){
		            			flag=false;
		            		}else{
		            			RS=ErpServiceMethod.NG;
		                    	MSG.append("第"+(i+1)+"行员工编号已经存在;");
		                    	continue;
		            		}
		            	}
		            	
		            	if(StringUtils.isBlank(NAME)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行员工姓名为空;");
		                	continue;
		            	}
		            	
		            	if(StringUtils.isBlank(SOB)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行账套为空;");
		                	continue;
		            	}else{
		            		boolean ckflag=false;
		            		String[] arrSBO= SOB.split(",");
		            		for(int l=0;l<arrSBO.length;l++){
		            			Map<String,Object> map_temp=getDeptInfo(arrSBO[l]);
		            			if(map_temp==null){
		            				ckflag=true;
		            			}else{
		            				SOBS+=map_temp.get("ID").toString()+",";
		            			}
		            		}
		            		
		            		if(ckflag){
		            			RS=ErpServiceMethod.NG;
		                    	MSG.append("第"+(i+1)+"行账套不存在;");
		                    	continue;
		            		}
		            	}
		            	if(SOBS.length()>0){
		            		SOBS=SOBS.substring(0,SOBS.length()-1);
		            	}
		            	
		            	if(flag){
		            		temp_data.put("LOGIN_NAME", LOGIN_NAME);
		                	temp_data.put("NAME", NAME);
		                	temp_data.put("DEPT_ID", DEPT_ID);
		                	temp_data.put("SOBS", SOBS);
		                	addDatas.add(temp_data);
		            	}else{
		            		temp_data.put("LOGIN_NAME", LOGIN_NAME);
		                	temp_data.put("NAME", NAME);
		                	temp_data.put("DEPT_ID", DEPT_ID);
		                	temp_data.put("SOBS", SOBS);
		                	modDatas.add(temp_data);
		            	}
		            	
		            }else if(TYPE.equals("2")){
		            	//判断各个字段必填
		            	String LOGIN_NAME=temp_json.getString("LOGIN_NAME");//员工编号
		            	String NAME=temp_json.getString("NAME");//用户称
		            	String DEPT_ID=temp_json.getString("DEPT_ID");//部门编码
		            	String SOB=temp_json.getString("SOB");//账套
		            	String SOBS="";//实际的组织机构权限ID集合
		            	
		            	if(StringUtils.isBlank(LOGIN_NAME)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行员工编号为空;");
		                	continue;
		            	}
		            	
		            	Map<String,Object> temp_map =getInfo(LOGIN_NAME);
		            	if(temp_map==null){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行员工编号不存在;");
		                	continue;
		            	}
		            	
		            	if(StringUtils.isBlank(NAME)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行员工姓名为空;");
		                	continue;
		            	}
		            	
		            	if(StringUtils.isBlank(SOB)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行账套为空;");
		                	continue;
		            	}else{
		            		boolean ckflag=false;
		            		String[] arrSBO= SOB.split(",");
		            		for(int l=0;l<arrSBO.length;l++){
		            			Map<String,Object> map_temp=getDeptInfo(arrSBO[l]);
		            			if(map_temp==null){
		            				ckflag=true;
		            			}else{
		            				SOBS+=map_temp.get("ID").toString()+",";
		            			}
		            		}
		            		
		            		if(ckflag){
		            			RS=ErpServiceMethod.NG;
		                    	MSG.append("第"+(i+1)+"行账套不存在;");
		                    	continue;
		            		}
		            	}
		            	if(SOBS.length()>0){
		            		SOBS=SOBS.substring(0,SOBS.length()-1);
		            	}
		            	
		            	temp_data.put("LOGIN_NAME", LOGIN_NAME);
		            	temp_data.put("NAME", NAME);
		            	temp_data.put("DEPT_ID", DEPT_ID);
		            	temp_data.put("ID", temp_map.get("ID").toString());
		            	temp_data.put("SOBS", SOBS);
		            	modDatas.add(temp_data);
		            	
		            }else if(TYPE.equals("3")){
		            	//判断各个字段必填
		            	String LOGIN_NAME=temp_json.getString("LOGIN_NAME");//员工编号
		            	//String NAME=temp_json.getString("NAME");//用户称
		            	//String DEPT_ID=temp_json.getString("DEPT_ID");//部门编码
		            	//String SOB=temp_json.getString("SOB");//账套
		            	boolean flag=true;
		            	
		            	if(StringUtils.isBlank(LOGIN_NAME)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行员工编号为空;");
		                	continue;
		            	}
		            	
		            	Map<String,Object> temp_map =getInfo(LOGIN_NAME);
		            	if(temp_map==null){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行员工编号不存在;");
		                	continue;
		            	}else{
		            		if(temp_map.get("ENABLE").equals("0")){
		            			flag=false;
		            		}
		            	}
		            	
		            	if(flag){
		            		temp_data.put("LOGIN_NAME", LOGIN_NAME);
		                	delDatas.add(temp_data);
		            	}
		            	
		            }else{
		            	RS=ErpServiceMethod.NG;
		            	MSG.append("第"+(i+1)+"请求代码不在处理范围内;");
		            	continue;
		            }
		        }
				//验证通过，将相关数据保存
				if(RS.equals("OK")){
					MsHTranMan tran = BussService.getHbTran();
					try{
						AddData(DATA_AUTH, CREATE_USER,addDatas,modelService);
						ModData(DATA_AUTH, CREATE_USER,modDatas,modelService);
						DelData(DATA_AUTH, CREATE_USER,delDatas,modelService);
						MSG.append("处理成功");
						tran.commit();
					}catch(Exception e){
						tran.rollback();
						ErpServiceMethod.writeLog("","同步用户信息接口处理错误："+e.getMessage());
						RS=ErpServiceMethod.NG;
						MSG.append("同同步用户信息接口处理失败，具体请查看日志");
						e.printStackTrace();
					}
					
					jsonStr=ErpServiceMethod.getResult(RS,MSG.toString() );
				}else{
					//验证失败，返回失败原因
					jsonStr=ErpServiceMethod.getResult(RS, MSG.toString());
				}
			}catch(Exception e){
				ErpServiceMethod.writeLog("","同步用户信息接口处理错误2："+e.getMessage());
				RS=ErpServiceMethod.NG;
				MSG.append("同步用户信息接口处理失败，具体请查看日志2");
				e.printStackTrace();
			}
		}
		
		
		String endTime=format.format(new java.util.Date());//接口请求结束时间
		map.put("json", jsonStr);
		
		//保存日志信息 
		ErpServiceMethod.AddIFLog(requestString, jsonStr, 1, "同步用户信息接口", RS, modelService);
		
		ErpServiceMethod.writeLog("",  beginTime+"同步用户信息接口请求信息:"+requestString);
		ErpServiceMethod.writeLog("", endTime+ "同步用户信息接口返回信息:"+jsonStr);
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
				object.setTableName("SY_USER"); // 
				String ID=StringUtils.getUUID();
				object.getColMap().put("ID", ID);
				object.getColMap().put("LOGIN_NAME", temp.get("LOGIN_NAME"));
				object.getColMap().put("NAME", temp.get("NAME"));
				object.getColMap().put("PW", "c4ca423d90321ca0b923820dcc509a");//初始加密密码 1
				object.getColMap().put("ENABLE", "1");//启用
				object.getColMap().put("US_TIME_ZONE", "+8");
				
				AddAuth(ID, temp.get("SOBS"),modelService);
				modelService.save(object);
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	public static void AddAuth(String USER_ID,String SOBS,ModelService modelService){
		String[] arrSOB=SOBS.split(",");
		for(int i=0;i<arrSOB.length;i++){
			TableDataMapExt object = new TableDataMapExt();
			object.setTableName("SY_DATA_AUTH"); //
			String ID=StringUtils.getUUID();
			object.getColMap().put("ID", ID);
			object.getColMap().put("USER_ID", USER_ID);
			object.getColMap().put("DEPT_ID", arrSOB[i]);
			modelService.save(object);
		}
	}
	
	/**
	 * 删除用的权限
	 * @param USER_ID
	 * @param modelService
	 */
	public static void DelAuth(String USER_ID,ModelService modelService){
		TableDataMapExt object = new TableDataMapExt();
		object.setTableName("SY_DATA_AUTH"); 
		object.setSqlWhere(" and USER_ID = '"+USER_ID+"' ");
		modelService.del(object);
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
				object.setTableName("SY_USER"); // 插入中间表
				object.setSqlWhere(" and LOGIN_NAME = '"+temp.get("LOGIN_NAME")+"' ");
				object.getColMap().put("NAME", temp.get("NAME"));
				object.getColMap().put("ENABLE", "1");//启用
				DelAuth(temp.get("ID"), modelService);
				AddAuth(temp.get("ID"), temp.get("SOBS"),modelService);
				modelService.edit(object);
			}
		}
	}
	
	/**
	 * 删除数据
	 * @param addDatas
	 */
	@SuppressWarnings("unchecked")
	public static void DelData(String DATA_AUTH, String CREATE_USER, List<Map<String,String>> delDatas,ModelService modelService){
		if(delDatas!=null&&delDatas.size()>0){
			int size=delDatas.size();
			for(int i=0;i<size;i++){
				Map<String,String> temp=delDatas.get(i);
				TableDataMapExt object = new TableDataMapExt();
				object.setTableName("SY_USER"); // 插入中间表
				object.setSqlWhere(" and LOGIN_NAME = '"+temp.get("LOGIN_NAME")+"' ");
				object.getColMap().put("ENABLE", "0");//禁用
				modelService.edit(object);
			}
		}
	}
	
	/**
	 * 根据用户登录获取用户记录数
	 * @param CUST_CODE
	 * @return
	 */
	public static int getCount(String LOGIN_NAME){
		int result=0;
		String sql="";
		Object[] param=new Object[1];
	
		sql="select * from SY_USER where LOGIN_NAME=?  ";
		param[0]=LOGIN_NAME;
		
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
	public Map<String,Object> getInfo(String LOGIN_NAME){
		Map<String,Object> map=null;
		String sql="select * from SY_USER where LOGIN_NAME=?  ";
		List<Map<String, Object>> list=modelService.listDataSql(sql,new Object[]{LOGIN_NAME});
		if(list!=null&&list.size()>0){
			map=new HashMap<String,Object>();
			map=list.get(0);
		}
		return map;
	}
	
	/**
	 * 获取部门信息
	 * @param CU_UNIT_CODE
	 * @param CU_UNIT_NAME
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> getDeptInfo(String ERP_CODE){
		Map<String,Object> map=null;
		String sql="select * from SY_DEPT where ERP_CODE=? AND IS_AUTH='1' ";
		List<Map<String, Object>> list=modelService.listDataSql(sql,new Object[]{ERP_CODE});
		if(list!=null&&list.size()>0){
			map=new HashMap<String,Object>();
			map=list.get(0);
		}
		return map;
	}

}
