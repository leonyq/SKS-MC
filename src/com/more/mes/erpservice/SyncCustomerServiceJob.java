package com.more.mes.erpservice;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;
/**
 * 金碟u8ERP
 * 客户信息service接口同步（service）
 */
public class SyncCustomerServiceJob extends InterfaceLog implements IhttpServiceJosn {

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
		if(RS.equals(ErpServiceMethod.OK)){
			try{
				//String REQUEST_TIME=jsonObject.getString("REQUEST_TIME");
				String REQUEST_DATA=jsonObject.getString("REQUEST_DATA");
				JSONObject jsonData =JSONObject.fromObject(REQUEST_DATA);
				
				String USER_ID=jsonObject.getString("USER_ID");
				Map<String ,Object> US=ErpServiceMethod.getUserID(USER_ID);
		        String CREATE_USER=US.get("ID").toString();//创建人ID
				
				JSONArray jsonArray = JSONArray.fromObject(jsonData.getString("DATAS"));
				int size = jsonArray.size();

		        String DATA_AUTH=null;//获取组织机构
				
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
		            String SOB=temp_json.getString("SOB");//账套
		            if(TYPE.equals("1")){
		            	//判断各个字段必填
		            	String CUST_CODE=temp_json.getString("CUST_CODE");//客户编号
		            	String CUSTOMER=temp_json.getString("CUSTOMER");//客户名称
		            	String CUST_ABBREVIATION=temp_json.getString("CUST_ABBREVIATION");//客户简称
		            	String MEMO=temp_json.getString("MEMO");//备注
		                
		                
		                if(StringUtils.isBlank(SOB)){
			                RS=ErpServiceMethod.NG;
			                MSG.append("第"+(i+1)+"账套为空;");
			            }else{
			                Map<String, Object> map_SOB= ErpServiceMethod.getDeptID(SOB);    //this.getDept(WPI_SOB);
			                if(map_SOB!=null&&map_SOB.size()>0){
			                    DATA_AUTH=map_SOB.get("ID").toString();
			                }else{
			                    RS=ErpServiceMethod.NG;
			                    MSG.append("第"+(i+1)+"账套信息不存在，请维护对应的组织机构;");
			                }
			            }
		                
		            	if(StringUtils.isBlank(CUST_CODE)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行客户编号为空;");
		                	continue;
		            	}else if(getCount(CUST_CODE,SOB)!=0){ //验证客户编号不能存在
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行客户编号已存在;");
		                	continue;
		            	}
		            	
		            	if(StringUtils.isBlank(CUSTOMER)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行客户名称为空;");
		                	continue;
		            	}
		            	
		            	temp_data.put("CUST_CODE", CUST_CODE);
		            	temp_data.put("CUSTOMER", CUSTOMER);
		            	temp_data.put("CUST_ABBREVIATION", CUST_ABBREVIATION);
		            	temp_data.put("MEMO", MEMO);
		            	temp_data.put("STATUS", "Y");
		            	temp_data.put("SOB", SOB);
		            	addDatas.add(temp_data);
		            	
		            }else if(TYPE.equals("2")){
		            	String CUST_CODE=temp_json.getString("CUST_CODE");//客户编号
		            	String CUSTOMER=temp_json.getString("CUSTOMER");//客户名称
		            	String CUST_ABBREVIATION=temp_json.getString("CUST_ABBREVIATION");//客户简称
		            	String MEMO=temp_json.getString("MEMO");//备注
		            	
		            	if(StringUtils.isBlank(SOB)){
			                RS=ErpServiceMethod.NG;
			                MSG.append("第"+(i+1)+"账套为空;");
			            }else{
			                Map<String, Object> map_SOB= ErpServiceMethod.getDeptID(SOB);    //this.getDept(WPI_SOB);
			                if(map_SOB!=null&&map_SOB.size()>0){
			                    DATA_AUTH=map_SOB.get("ID").toString();
			                }else{
			                    RS=ErpServiceMethod.NG;
			                    MSG.append("第"+(i+1)+"账套信息不存在，请维护对应的组织机构;");
			                }
			            }
		            	
		            	if(StringUtils.isBlank(CUST_CODE)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行客户编号为空;");
		                	continue;
		            	}else if(getCount(CUST_CODE,SOB)==0){ //验证客户编号能存在
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行客户编号不存在;");
		                	continue;
		            	}
		            	if(StringUtils.isBlank(CUSTOMER)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行客户名称为空;");
		                	continue;
		            	}
		            	
		            	temp_data.put("CUST_CODE", CUST_CODE);
		            	temp_data.put("CUSTOMER", CUSTOMER);
		            	temp_data.put("CUST_ABBREVIATION", CUST_ABBREVIATION);
		            	temp_data.put("MEMO", MEMO);
		            	temp_data.put("SOB", SOB);
		            	temp_data.put("STATUS", "Y");
		            	modDatas.add(temp_data);
		            	
		            }else if(TYPE.equals("3")){
		            	String CUST_CODE=temp_json.getString("CUST_CODE");//客户编号
		            	if(StringUtils.isBlank(SOB)){
			                RS=ErpServiceMethod.NG;
			                MSG.append("第"+(i+1)+"账套为空;");
			            }else{
			                Map<String, Object> map_SOB= ErpServiceMethod.getDeptID(SOB);    //this.getDept(WPI_SOB);
			                if(map_SOB!=null&&map_SOB.size()>0){
			                    DATA_AUTH=map_SOB.get("ID").toString();
			                }else{
			                    RS=ErpServiceMethod.NG;
			                    MSG.append("第"+(i+1)+"账套信息不存在，请维护对应的组织机构;");
			                }
			            }
		            	
		            	if(StringUtils.isBlank(CUST_CODE)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行客户编号为空;");
		                	continue;
		            	}else if(getCount(CUST_CODE,SOB)==0){//验证客户编号能存在
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行客户编号不存在;");
		                	continue;
		            	}
		            	temp_data.put("CUST_CODE", CUST_CODE);
		            	temp_data.put("SOB", SOB);
		            	temp_data.put("STATUS", "N");
		            	delDatas.add(temp_data);
		            	
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
						RS=ErpServiceMethod.NG;
						MSG.append("同步客户接口处理失败，具体请查看日志");
						e.printStackTrace();
						ErpServiceMethod.writeLog("","同步客户接口处理失败错误："+e.getMessage());
					}
				}
			}catch(Exception e){
				RS=ErpServiceMethod.NG;
				MSG.append("同步客户接口处理失败，具体请查看日志2");
				e.printStackTrace();
				ErpServiceMethod.writeLog("","同步客户接口处理失败错误2："+e.getMessage());
			}
		}
		
		jsonStr=ErpServiceMethod.getResult(RS, MSG.toString());
		map.put("json", jsonStr);
		//保存日志信息 
      	ErpServiceMethod.AddIFLog(requestString, jsonStr, 7, "同步客户信息接口", RS, modelService);
      	
		String endTime=format.format(new java.util.Date());//接口请求结束时间
		
		ErpServiceMethod.writeLog("",  beginTime+"同步客户信息接口请求信息:"+requestString);
		ErpServiceMethod.writeLog("", endTime+ "同步客户信息接口返回信息:"+jsonStr);
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
				object.setTableName("T_CO_CUSTOMER"); // 
				//object.setSqlWhere(" and CUST_CODE = '"+temp.get("CUST_CODE")+"' ");
				object.getColMap().put("ID", StringUtils.getUUID());
				object.getColMap().put("CUST_CODE", temp.get("CUST_CODE"));
				object.getColMap().put("CUSTOMER", temp.get("CUSTOMER"));
				object.getColMap().put("CUST_ABBREVIATION", temp.get("CUST_ABBREVIATION"));
				object.getColMap().put("MEMO", temp.get("MEMO"));
				object.getColMap().put("STATUS", temp.get("STATUS"));
				object.getColMap().put("CREATE_USER",  CREATE_USER);
				object.getColMap().put("CREATE_TIME", new Date());
				object.getColMap().put("DATA_AUTH",  DATA_AUTH);
				object.getColMap().put("DEPT_ID",  DATA_AUTH);
				object.getColMap().put("SOB",  temp.get("SOB"));
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
				object.setTableName("T_CO_CUSTOMER"); // 插入中间表
				object.setSqlWhere(" AND CUST_CODE = '"+temp.get("CUST_CODE")+"' AND SOB='"+temp.get("SOB")+"'");
				object.getColMap().put("CUSTOMER", temp.get("CUSTOMER"));
				object.getColMap().put("CUST_ABBREVIATION", temp.get("CUST_ABBREVIATION"));
				object.getColMap().put("MEMO", temp.get("MEMO"));
				object.getColMap().put("STATUS", temp.get("STATUS"));
				object.getColMap().put("EDIT_USER",  CREATE_USER);
				object.getColMap().put("EDIT_TIME", new Date());
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
				object.setTableName("T_CO_CUSTOMER"); // 插入中间表
				object.setSqlWhere(" and CUST_CODE = '"+temp.get("CUST_CODE")+"' AND SOB='"+temp.get("SOB")+"'");
				object.getColMap().put("STATUS", temp.get("STATUS"));
				object.getColMap().put("EDIT_USER",  CREATE_USER);
				object.getColMap().put("EDIT_TIME", new Date());
				modelService.edit(object);
			}
		}
	}
	
	/**
	 * 根据客户编号获取条数
	 * @param CUST_CODE
	 * @return
	 */
	public static int getCount(String CUST_CODE,String SOB){
		int result=0;
		String sql="";
		Object[] param=new Object[2];
	
		sql="select * from T_CO_CUSTOMER where CUST_CODE=? and SOB=?";
		param[0]=CUST_CODE;
		param[1]=SOB;
		result=CommMethod.getBaseService().countSql(sql, param);
		return result;
	}

}
