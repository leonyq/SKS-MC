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
 * 同步供应商信息service接口（service）
 */
public class SyncSupplierServiceJob extends InterfaceLog implements IhttpServiceJosn {
	private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
	private final Log log = LogFactory.getLog(this.getClass());
	
	@Override
	public String exeFunc(HttpCoreService service) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String beginTime=format.format(new java.util.Date());//接口请求开始时间
		//返回结果
		Map<String, Object> map = new HashMap<String, Object>();
		//验证默认正确
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
		if(RS.equals(ErpServiceMethod.OK)){
			//String REQUEST_TIME=jsonObject.getString("REQUEST_TIME");
			String USER_ID=jsonObject.getString("USER_ID");
			String REQUEST_DATA=jsonObject.getString("REQUEST_DATA");
			
	        String DATA_AUTH=null;//获取组织机构
	        Map<String ,Object> US=ErpServiceMethod.getUserID(USER_ID);
	        String CREATE_USER=US.get("ID").toString();

			
			try{
				JSONObject jsonData =JSONObject.fromObject(REQUEST_DATA);
				JSONArray jsonArray = JSONArray.fromObject(jsonData.getString("DATAS"));
				int size = jsonArray.size();
				if(size==0){
					RS=ErpServiceMethod.NG;
		        	MSG.append("请求数据为空;");
				}
				
				//添加数据的数组
				List<Map<String,String>> addDatas=new ArrayList<Map<String,String>>();
				
				//修改数据的数组
				List<Map<String,String>> modDatas=new ArrayList<Map<String,String>>();
				
				//删除数据的数组
				List<Map<String,String>> delDatas=new ArrayList<Map<String,String>>();
						
				for(int i=0;i<size;i++){
					Map<String,String> temp_data=new HashMap<String,String>();
					
					JSONObject temp_json = jsonArray.getJSONObject(i);
					String TYPE=temp_json.getString("TYPE");//请求代码
					String SUPPLIER_CODE=temp_json.getString("SUPPLIER_CODE");//供应商编号
					String SUPPLIER_NAME=temp_json.getString("SUPPLIER_NAME");//供应商名称
					String SUPPLIER_SHORTNAME=temp_json.getString("SUPPLIER_SHORTNAME");//供应商简称
					
		            String SOB=temp_json.getString("SOB");//账套
		        
					if(StringUtils.isBlank(TYPE)){
						RS=ErpServiceMethod.NG;
			        	MSG.append("第"+(i+1)+"行请求代码为空;");
					}else if(TYPE.equals("1")||TYPE.equals("2")||TYPE.equals("3")){
						
					}else{
						RS=ErpServiceMethod.NG;
			        	MSG.append("第"+(i+1)+"行请求代码不对;");
			        	continue; //不继续验证
					}
					
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
					
					if(StringUtils.isBlank(SUPPLIER_CODE)){
						RS=ErpServiceMethod.NG;
			        	MSG.append("第"+(i+1)+"行供应商编号为空;");
					}
					
					//删除时不验证单位名称
					if(!TYPE.equals("3")){
						if(StringUtils.isBlank(SUPPLIER_NAME)){
							RS=ErpServiceMethod.NG;
				        	MSG.append("第"+(i+1)+"行供应商名称为空;");
						}
					}
					
					temp_data.put("TYPE", TYPE);
					temp_data.put("SOB", SOB);
		        	temp_data.put("SUPPLIER_CODE", SUPPLIER_CODE);
		        	temp_data.put("SUPPLIER_NAME", SUPPLIER_NAME);
		        	temp_data.put("SUPPLIER_SHORTNAME", SUPPLIER_SHORTNAME);
		        	if(TYPE.equals("1")){
		        		Map<String,Object> map_temp=getInfo(SUPPLIER_CODE,DATA_AUTH);
		        		if(map_temp!=null&&map_temp.size()>0){
		        			//之前是不可用的更新为可用
		        			if(map_temp.get("STATUS").equals("N")){
		        				modDatas.add(temp_data);
		        			}else{
		        				RS=ErpServiceMethod.NG;
		    		        	MSG.append("第"+(i+1)+"行对应账套的供应商编号已存在;");
		        			}
		        		}else{
		        			addDatas.add(temp_data);
		        		}
		        		
		        	}else if(TYPE.equals("2")){
		        		Map<String,Object> map_temp=getInfo(SUPPLIER_CODE,DATA_AUTH);
		        		if(map_temp!=null&&map_temp.size()>0){
		        			//之前是不可用的更新为可用
		        			modDatas.add(temp_data);
		        		}else{
		        			RS=ErpServiceMethod.NG;
				        	MSG.append("第"+(i+1)+"行对应账套的供应商编号不存在;");
		        		}
		        	}else{
		        		Map<String,Object> map_temp=getInfo(SUPPLIER_CODE,DATA_AUTH);
		        		if(map_temp!=null&&map_temp.size()>0){
		        			//之前是可用的更新为不可用
		        			delDatas.add(temp_data);
		        		}else{
		        			RS=ErpServiceMethod.NG;
				        	MSG.append("第"+(i+1)+"行对应账套的供应商编号不存在;");
		        		}
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
						ErpServiceMethod.writeLog("","同步供应商信息接口处理失败："+e.getMessage());
						RS=ErpServiceMethod.NG;
						MSG.append("同步供应商信息接口处理失败："+e.getMessage());
						e.printStackTrace();
						log.error(e);
					}
				}
			}catch(Exception e){
				ErpServiceMethod.writeLog("","同步供应商信息接口处理失败2："+e.getMessage());
				RS=ErpServiceMethod.NG;
				MSG.append("同步供应商信息接口处理失败2："+e.getMessage());
				e.printStackTrace();
				log.error(e);
			}
		}
		
		jsonStr=ErpServiceMethod.getResult(RS, MSG.toString());
		String endTime=format.format(new java.util.Date());//接口请求结束时间
		map.put("json", jsonStr);
		//保存日志信息 
		ErpServiceMethod.AddIFLog(requestString, jsonStr, 4, "同步供应商信息接口", RS, modelService);
		
		ErpServiceMethod.writeLog("",  beginTime+"同步供应商信息接口请求信息:"+requestString);
		ErpServiceMethod.writeLog("", endTime+ "同步供应商信息接口返回信息:"+jsonStr);
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
	public static void AddData( String DATA_AUTH, String CREATE_USER,List<Map<String,String>> addDatas,ModelService modelService){
		if(addDatas!=null&&addDatas.size()>0){
			int size=addDatas.size();
			for(int i=0;i<size;i++){
				Map<String,String> temp=addDatas.get(i);
				
				TableDataMapExt object = new TableDataMapExt();
				object.setTableName("T_CO_SUPPLIER"); // 
				object.getColMap().put("ID", StringUtils.getUUID());
				object.getColMap().put("CREATE_USER",CREATE_USER);
				object.getColMap().put("CREATE_TIME", new Date());
				object.getColMap().put("DATA_AUTH", DATA_AUTH);
				
				object.getColMap().put("SUPPLIER_NAME", temp.get("SUPPLIER_NAME"));
				object.getColMap().put("SUPPLIER_CODE", temp.get("SUPPLIER_CODE"));
				object.getColMap().put("SUPPLIER_SHORTNAME", temp.get("SUPPLIER_SHORTNAME"));
				object.getColMap().put("STATUS", "Y");
				object.getColMap().put("SOB", temp.get("SOB"));
				
				modelService.save(object);
			}
		}
	}
	
	/**
	 * 修改数据
	 * @param addDatas
	 */
	@SuppressWarnings("unchecked")
	public static void ModData( String DATA_AUTH, String CREATE_USER,List<Map<String,String>> addDatas,ModelService modelService){
		if(addDatas!=null&&addDatas.size()>0){
			int size=addDatas.size();
			for(int i=0;i<size;i++){
				Map<String,String> temp=addDatas.get(i);
				
				TableDataMapExt object = new TableDataMapExt();
				object.setTableName("T_CO_SUPPLIER"); // 
				object.setSqlWhere(" AND SUPPLIER_CODE='"+temp.get("SUPPLIER_CODE")+"' AND SOB='"+temp.get("SOB")+"'");
				
				object.getColMap().put("EDIT_USER", CREATE_USER);
				object.getColMap().put("EDIT_TIME", new Date());
				
				object.getColMap().put("SUPPLIER_NAME", temp.get("SUPPLIER_NAME"));
				object.getColMap().put("SUPPLIER_SHORTNAME", temp.get("SUPPLIER_SHORTNAME"));
				object.getColMap().put("STATUS", "Y");
				object.getColMap().put("SYNC_FLAG", "N");//同步标志改为未同步
				modelService.edit(object);
			}
		}
	}
	
	/**
	 * 删除数据
	 * @param addDatas
	 */
	@SuppressWarnings("unchecked")
	public static void DelData(String DATA_AUTH, String CREATE_USER, List<Map<String,String>> addDatas,ModelService modelService){
		if(addDatas!=null&&addDatas.size()>0){
			int size=addDatas.size();
			for(int i=0;i<size;i++){
				Map<String,String> temp=addDatas.get(i);
				
				TableDataMapExt object = new TableDataMapExt();
				object.setTableName("T_CO_SUPPLIER"); // 
				object.setSqlWhere(" AND SUPPLIER_CODE='"+temp.get("SUPPLIER_CODE")+"' AND SOB='"+temp.get("SOB")+"'");
				object.getColMap().put("STATUS", "N");//更新为不可用
				modelService.edit(object);
			}
		}
	}
	
	/**
	 * 判断供应商编码是否存在
	 * @param CU_UNIT_CODE
	 * @param CU_UNIT_NAME
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> getInfo(String SUPPLIER_CODE,String DATA_AUTH){
		Map<String,Object> map=new HashMap<String,Object>();
		String sql="SELECT * FROM T_CO_SUPPLIER WHERE SUPPLIER_CODE=? AND DATA_AUTH=? ";
		List<Map<String, Object>> list=modelService.listDataSql(sql,new Object[]{SUPPLIER_CODE,DATA_AUTH});
		if(list!=null&&list.size()>0){
			map=list.get(0);
		}
		return map;
	}

}
