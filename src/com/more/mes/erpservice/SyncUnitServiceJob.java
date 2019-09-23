package com.more.mes.erpservice;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
 * 同步单位对照信息service接口（service）
 */
public class SyncUnitServiceJob extends InterfaceLog implements IhttpServiceJosn {
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
			jsonObject = JSONObject.fromObject(requestString);
		}catch(Exception e){
			RS=ErpServiceMethod.NG;
			MSG.append("请求报文JSON格式错误");
		}
		//String REQUEST_TIME=jsonObject.getString("REQUEST_TIME");
		//String USER_ID=jsonObject.getString("USER_ID");
		if(RS.equals(ErpServiceMethod.OK)){
			try{
				String REQUEST_DATA=jsonObject.getString("REQUEST_DATA");
				JSONObject jsonData = JSONObject.fromObject(REQUEST_DATA);
				JSONArray jsonArray = JSONArray.fromObject(jsonData.getString("DATAS"));
				int size = jsonArray.size();
				if(size==0){
					RS=ErpServiceMethod.NG;
		        	MSG.append("请求数据为空;");
				}else{
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
						String CU_UNIT_CODE=temp_json.getString("CU_UNIT_CODE");//单位编码
						String CU_UNIT_NAME=temp_json.getString("CU_UNIT_NAME");//单位名称
						
						if(StringUtils.isBlank(TYPE)){
							RS=ErpServiceMethod.NG;
				        	MSG.append("第"+(i+1)+"行请求代码为空;");
						}else if(TYPE.equals("1")||TYPE.equals("2")||TYPE.equals("3")){
							
						}else{
							RS=ErpServiceMethod.NG;
				        	MSG.append("第"+(i+1)+"行请求代码不对;");
				        	continue; //不继续验证
						}
						
						if(StringUtils.isBlank(CU_UNIT_CODE)){
							RS=ErpServiceMethod.NG;
				        	MSG.append("第"+(i+1)+"行单位编码为空;");
						}
						
						//删除时不验证单位名称
						if(!TYPE.equals("3")){
							if(StringUtils.isBlank(CU_UNIT_NAME)){
								RS=ErpServiceMethod.NG;
					        	MSG.append("第"+(i+1)+"行单位名称为空;");
							}
						}
						
						temp_data.put("TYPE", TYPE);
			        	temp_data.put("CU_UNIT_CODE", CU_UNIT_CODE);
			        	temp_data.put("CU_UNIT_NAME", CU_UNIT_NAME);
			        	if(TYPE.equals("1")){
			        		Map<String,Object> map_temp=getInfo(CU_UNIT_CODE);
			        		if(map_temp!=null&&map_temp.size()>0){
			        			//之前是不可用的更新为可用
			        			if(map_temp.get("IS_SELC").equals("0")){
			        				modDatas.add(temp_data);
			        			}else{
			        				RS=ErpServiceMethod.NG;
			    		        	MSG.append("第"+(i+1)+"行单位编码已存在;");
			        			}
			        		}else{
			        			addDatas.add(temp_data);
			        		}
			        		
			        	}else if(TYPE.equals("2")){
			        		Map<String,Object> map_temp=getInfo(CU_UNIT_CODE);
			        		if(map_temp!=null&&map_temp.size()>0){
			        			//之前是不可用的更新为可用
			        			modDatas.add(temp_data);
			        		}else{
			        			RS=ErpServiceMethod.NG;
					        	MSG.append("第"+(i+1)+"行单位编码不存在;");
			        		}
			        	}else{
			        		Map<String,Object> map_temp=getInfo(CU_UNIT_CODE);
			        		if(map_temp!=null&&map_temp.size()>0){
			        			//之前是不可用的更新为可用
			        			delDatas.add(temp_data);
			        		}else{
			        			RS=ErpServiceMethod.NG;
					        	MSG.append("第"+(i+1)+"行单位编码不存在;");
			        		}
			        	}
					}
					
					//验证通过，将相关数据保存
					if(RS.equals("OK")){
						MsHTranMan tran = BussService.getHbTran();
						try{
							AddData(addDatas,modelService);
							ModData(modDatas,modelService);
							DelData(delDatas,modelService);
							MSG.append("处理成功");
							tran.commit();
						}catch(Exception e){
							tran.rollback();
							ErpServiceMethod.writeLog("","同步单位对照接口处理错误："+e.getMessage());
							RS=ErpServiceMethod.NG;
							MSG.append("同步单位对照接口处理失败，具体请查看日志");
							e.printStackTrace();
							log.error(e);
						}
					}
				}
			}catch(Exception e){
				ErpServiceMethod.writeLog("","同步单位对照接口处理错误2："+e.getMessage());
				RS=ErpServiceMethod.NG;
				MSG.append("同步单位对照接口处理失败，具体请查看日志2");
				e.printStackTrace();
				log.error(e);
			}
		}
		
		jsonStr=ErpServiceMethod.getResult(RS, MSG.toString());
		String endTime=format.format(new java.util.Date());//接口请求结束时间
		map.put("json", jsonStr);
		
		//保存日志信息 
		ErpServiceMethod.AddIFLog(requestString, jsonStr, 2, "同步单位对照接口", RS, modelService);
		
		ErpServiceMethod.writeLog("",  beginTime+"同步单位对照接口请求信息:"+requestString);
		ErpServiceMethod.writeLog("", endTime+ "同步单位对照接口返回信息:"+jsonStr);
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
	public static void AddData( List<Map<String,String>> addDatas,ModelService modelService){
		if(addDatas!=null&&addDatas.size()>0){
			int size=addDatas.size();
			for(int i=0;i<size;i++){
				Map<String,String> temp=addDatas.get(i);
				
				TableDataMapExt object = new TableDataMapExt();
				object.setTableName("SY_DICT_VAL"); // 
				object.getColMap().put("DICT_VAL_ID", StringUtils.getUUID());
				object.getColMap().put("DICT_CODE", "CI_UNIT");
				object.getColMap().put("CODE", temp.get("CU_UNIT_CODE"));
				object.getColMap().put("VALUE", temp.get("CU_UNIT_NAME"));
				object.getColMap().put("DISP_INDX", "0");
				object.getColMap().put("IS_DISP", "1");
				object.getColMap().put("IS_SELC", "1");
				modelService.save(object);
			}
		}
	}
	
	/**
	 * 修改数据
	 * @param addDatas
	 */
	@SuppressWarnings("unchecked")
	public static void ModData( List<Map<String,String>> addDatas,ModelService modelService){
		if(addDatas!=null&&addDatas.size()>0){
			int size=addDatas.size();
			for(int i=0;i<size;i++){
				Map<String,String> temp=addDatas.get(i);
				
				TableDataMapExt object = new TableDataMapExt();
				object.setTableName("SY_DICT_VAL"); // 
				object.setSqlWhere(" AND DICT_CODE='CI_UNIT' AND CODE='"+temp.get("CU_UNIT_CODE")+"'");
				
				object.getColMap().put("VALUE", temp.get("CU_UNIT_NAME"));
				object.getColMap().put("DISP_INDX", "0");
				object.getColMap().put("IS_DISP", "1");
				object.getColMap().put("IS_SELC", "1");
				modelService.edit(object);
			}
		}
	}
	
	/**
	 * 删除数据
	 * @param addDatas
	 */
	@SuppressWarnings("unchecked")
	public static void DelData( List<Map<String,String>> addDatas,ModelService modelService){
		if(addDatas!=null&&addDatas.size()>0){
			int size=addDatas.size();
			for(int i=0;i<size;i++){
				Map<String,String> temp=addDatas.get(i);
				
				TableDataMapExt object = new TableDataMapExt();
				object.setTableName("SY_DICT_VAL"); // 
				object.setSqlWhere(" AND DICT_CODE='CI_UNIT' AND CODE='"+temp.get("CU_UNIT_CODE")+"'");
				//object.getColMap().put("DICT_VAL_ID", StringUtils.getUUID());
				
				//object.getColMap().put("VALUE", temp.get("CU_UNIT_NAME"));
				//object.getColMap().put("DISP_INDX", "0");
				//object.getColMap().put("IS_DISP", "1");
				object.getColMap().put("IS_SELC", "0");//更新为不可用
				modelService.edit(object);
			}
		}
	}
	
	/**
	 * 判断单位编码是否存在
	 * @param CU_UNIT_CODE
	 * @param CU_UNIT_NAME
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> getInfo(String CU_UNIT_CODE){
		Map<String,Object> map=new HashMap<String,Object>();
		String sql="SELECT * FROM SY_DICT_VAL WHERE DICT_CODE='CI_UNIT' and CODE=?  ";
		List<Map<String, Object>> list=modelService.listDataSql(sql,new Object[]{CU_UNIT_CODE});
		if(list!=null&&list.size()>0){
			map=list.get(0);
		}
		return map;
	}
	

}
