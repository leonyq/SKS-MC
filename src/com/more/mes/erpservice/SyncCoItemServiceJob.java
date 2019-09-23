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
*同步物料信息接口
 */
public class SyncCoItemServiceJob extends InterfaceLog implements IhttpServiceJosn {
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
			jsonObject = JSONObject.fromObject(requestString);
		}catch(Exception e){
			RS=ErpServiceMethod.NG;
			MSG.append("请求报文JSON格式错误");
		}
		if(RS.equals(ErpServiceMethod.OK)){
			try{
				String REQUEST_DATA=jsonObject.getString("REQUEST_DATA");
				JSONObject jsonData =JSONObject.fromObject(REQUEST_DATA);
				JSONArray jsonArray = JSONArray.fromObject(jsonData.getString("DATAS"));
				int size = jsonArray.size();
		       
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
		            String SOB=null;
		            String DATA_AUTH=null;//获取组织机构
		            if(!temp_json.containsKey("TYPE")){
		            	RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行没有请求类型字段;");
	                	continue;
		            }
		            String TYPE=temp_json.getString("TYPE");
		            if(!temp_json.containsKey("CI_ITEM_CODE")){
		            	RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行没有物料编码字段;");
	                	continue;
		            }
		            
		            if(!temp_json.containsKey("SOB")){
		            	RS=ErpServiceMethod.NG;
	                	MSG.append("第"+(i+1)+"行没有账套字段;");
	                	continue;
		            }
		            
		            if(TYPE.equals("1")){
		            	SOB=temp_json.getString("SOB");
		            	boolean ckedit=false; //标记是添加还是修改
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
		            	String CI_ITEM_CODE=temp_json.getString("CI_ITEM_CODE");//分类编码
		            	if(StringUtils.isBlank(CI_ITEM_CODE)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行物料编码为空;");
		                	continue;
		            	}else if(getCount(CI_ITEM_CODE,DATA_AUTH)!=0){ //验证分类编码不能存在
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行物料编码已存在;");
		                	
		                	continue;
		            	}else {
		            		Map<String,Object> temp= this.getCOInfo(CI_ITEM_CODE, DATA_AUTH);
		            		if(temp!=null&&StringUtils.isNotBlank(temp.get("ID").toString())){
		            			ckedit=true;
		            		}
		            	}
		            	
		            	if(!temp_json.containsKey("CI_ITEM_NAME")){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行没有物料名称字段;");
		                	continue;
		            	}
		            	String CI_ITEM_NAME=temp_json.getString("CI_ITEM_NAME");//物料名称
		            	if(StringUtils.isBlank(CI_ITEM_NAME)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行物料名称为空;");
		                	continue;
		            	}
		            	
		            	if(!temp_json.containsKey("CI_ITEM_SPEC")){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行没有物料规格字段;");
		                	continue;
		            	}
		            	String CI_ITEM_SPEC=temp_json.getString("CI_ITEM_SPEC");//物料规格
		            	if(StringUtils.isBlank(CI_ITEM_SPEC)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行物料规格为空;");
		                	continue;
		            	}
		            	
		            	String CI_ITEM_TYPE=temp_json.getString("CI_ITEM_TYPE");//物料类型
		            	if(!StringUtils.isBlank(CI_ITEM_TYPE)){//如果物料类型存在，则判断类型存在类型表中
//		            		if(getCI_CLASSCount(CI_ITEM_TYPE, DATA_AUTH)==0){
//		            			RS=ErpServiceMethod.NG;
//			                	MSG.append("第"+(i+1)+"行物料类型在类型表中不存在;");
//			                	continue;
//		            		}
		            	}
		            	CI_ITEM_TYPE="1";//写死默认为原材料
		            	
		            	String CI_ITEM_CLASS=temp_json.getString("CI_ITEM_CLASS");//物料分类
		            	if(!StringUtils.isBlank(CI_ITEM_CLASS)){//如果物料类型存在，则判断类型存在类型表中
//		            		if(getCI_CLASSCount(CI_ITEM_CLASS, DATA_AUTH)==0){
//		            			RS=ErpServiceMethod.NG;
//			                	MSG.append("第"+(i+1)+"行物料分类在类型表中不存在;");
//			                	continue;
//		            		}
		            	}
		            	String STRCI_MIN_PACK=temp_json.getString("CI_MIN_PACK");//最小包装量
		            	if(!StringUtils.isBlank(STRCI_MIN_PACK)){
		            		try{
		            			int CI_MIN_PACK=Integer.parseInt(STRCI_MIN_PACK);
		            		}catch(Exception e){
		            			RS=ErpServiceMethod.NG;
			                	MSG.append("第"+(i+1)+"行最小包装量必须为数字;");
			                	continue;
		            		}
		            	}
		            	
		            	String CI_UNIT=temp_json.getString("CI_UNIT"); 
		            	String CI_STOCK_CYCLE=temp_json.getString("CI_STOCK_CYCLE"); //保质期(天)
		            	if(!StringUtils.isBlank(CI_STOCK_CYCLE)){
		            		try{
		            			int NUM_CI_STOCK_CYCLE=Integer.parseInt(CI_STOCK_CYCLE);
		            		}catch(Exception e){
		            			RS=ErpServiceMethod.NG;
			                	MSG.append("第"+(i+1)+"行保质期(天)必须为数字;");
			                	continue;
		            		}
		            	}
		            	String CI_CYCLE_REMIND=temp_json.getString("CI_CYCLE_REMIND");//保持期预警天数(天)
		            	if(!StringUtils.isBlank(CI_STOCK_CYCLE)){
		            		try{
		            			int NUM_CI_CYCLE_REMIND=Integer.parseInt(CI_CYCLE_REMIND);
		            		}catch(Exception e){
		            			RS=ErpServiceMethod.NG;
			                	MSG.append("第"+(i+1)+"行保持期预警天数(天)必须为数字;");
			                	continue;
		            		}
		            	}
		            	String CI_RECHECK_DAYS=temp_json.getString("CI_RECHECK_DAYS");//检验周期
		            	if(!StringUtils.isBlank(CI_STOCK_CYCLE)){
		            		try{
		            			int NUM_CI_CYCLE_REMIND=Integer.parseInt(CI_CYCLE_REMIND);
		            		}catch(Exception e){
		            			RS=ErpServiceMethod.NG;
			                	MSG.append("第"+(i+1)+"行检验周期必须为数字;");
			                	continue;
		            		}
		            	}
		            	
		            	
		            	temp_data.put("CI_ITEM_CODE", CI_ITEM_CODE);//物料编码
		            	temp_data.put("CI_ITEM_NAME", CI_ITEM_NAME);//物料名称
		            	temp_data.put("CI_ITEM_SPEC", CI_ITEM_SPEC);//物料规格
		            	temp_data.put("CI_ITEM_TYPE", CI_ITEM_TYPE);//物料类型
		            	temp_data.put("CI_ITEM_CLASS", CI_ITEM_CLASS);//物料分类
		            	temp_data.put("CI_MIN_PACK", STRCI_MIN_PACK);//最小包装量
		            	temp_data.put("CI_UNIT", CI_UNIT);//单位
		            	temp_data.put("CI_STOCK_CYCLE", CI_STOCK_CYCLE);//保质期(天)
		            	temp_data.put("CI_CYCLE_REMIND", CI_CYCLE_REMIND);//保持期预警天数(天)
		            	temp_data.put("CI_RECHECK_DAYS", CI_RECHECK_DAYS);//检验周期
		            	temp_data.put("DATA_AUTH", DATA_AUTH);//组织机构
		            	if(ckedit){
		            		modDatas.add(temp_data);
		            	}else{
		            		addDatas.add(temp_data);
		            	}
		            	
		            	
		            }else if(TYPE.equals("2")){
		            	//判断各个字段必填
		            	SOB=temp_json.getString("SOB");
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
		            	String CI_ITEM_CODE=temp_json.getString("CI_ITEM_CODE");//分类编码
		            	if(StringUtils.isBlank(CI_ITEM_CODE)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行物料编码为空;");
		                	continue;
		            	}else if(getCount(CI_ITEM_CODE,DATA_AUTH)==0){ //验证分类编码不能存在
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行该账套("+SOB+")下物料编码不存在;");
		                	continue;
		            	}
		            	
		            	if(!temp_json.containsKey("CI_ITEM_NAME")){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行没有物料名称字段;");
		                	continue;
		            	}
		            	String CI_ITEM_NAME=temp_json.getString("CI_ITEM_NAME");//物料名称
		            	if(StringUtils.isBlank(CI_ITEM_NAME)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行物料名称为空;");
		                	continue;
		            	}
		            	
		            	if(!temp_json.containsKey("CI_ITEM_SPEC")){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行没有物料规格字段;");
		                	continue;
		            	}
		            	String CI_ITEM_SPEC=temp_json.getString("CI_ITEM_SPEC");//物料规格
		            	if(StringUtils.isBlank(CI_ITEM_SPEC)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行物料规格为空;");
		                	continue;
		            	}
		            	
		            	String CI_ITEM_TYPE=temp_json.getString("CI_ITEM_TYPE");//物料类型
		            	if(!StringUtils.isBlank(CI_ITEM_TYPE)){//如果物料类型存在，则判断类型存在类型表中
//		            		if(getCI_CLASSCount(CI_ITEM_TYPE, DATA_AUTH)==0){
//		            			RS=ErpServiceMethod.NG;
//			                	MSG.append("第"+(i+1)+"行物料类型在类型表中不存在;");
//			                	continue;
//		            		}
		            	}
		            	CI_ITEM_TYPE="1";
		            	
		            	String CI_ITEM_CLASS=temp_json.getString("CI_ITEM_CLASS");//物料分类
		            	if(!StringUtils.isBlank(CI_ITEM_CLASS)){//如果物料类型存在，则判断类型存在类型表中
//		            		if(getCI_CLASSCount(CI_ITEM_CLASS, DATA_AUTH)==0){
//		            			RS=ErpServiceMethod.NG;
//			                	MSG.append("第"+(i+1)+"行物料分类在类型表中不存在;");
//			                	continue;
//		            		}
		            	}
		            	String STRCI_MIN_PACK=temp_json.getString("CI_MIN_PACK");//最小包装量
		            	if(!StringUtils.isBlank(STRCI_MIN_PACK)){
		            		try{
		            			int CI_MIN_PACK=Integer.parseInt(STRCI_MIN_PACK);
		            		}catch(Exception e){
		            			RS=ErpServiceMethod.NG;
			                	MSG.append("第"+(i+1)+"行最小包装量必须为数字;");
			                	continue;
		            		}
		            	}
		            	
		            	String CI_UNIT=temp_json.getString("CI_UNIT"); 
		            	String CI_STOCK_CYCLE=temp_json.getString("CI_STOCK_CYCLE"); //保质期(天)
		            	if(!StringUtils.isBlank(CI_STOCK_CYCLE)){
		            		try{
		            			int NUM_CI_STOCK_CYCLE=Integer.parseInt(CI_STOCK_CYCLE);
		            		}catch(Exception e){
		            			RS=ErpServiceMethod.NG;
			                	MSG.append("第"+(i+1)+"行保质期(天)必须为数字;");
			                	continue;
		            		}
		            	}
		            	String CI_CYCLE_REMIND=temp_json.getString("CI_CYCLE_REMIND");//保持期预警天数(天)
		            	if(!StringUtils.isBlank(CI_STOCK_CYCLE)){
		            		try{
		            			int NUM_CI_CYCLE_REMIND=Integer.parseInt(CI_CYCLE_REMIND);
		            		}catch(Exception e){
		            			RS=ErpServiceMethod.NG;
			                	MSG.append("第"+(i+1)+"行保持期预警天数(天)必须为数字;");
			                	continue;
		            		}
		            	}
		            	String CI_RECHECK_DAYS=temp_json.getString("CI_RECHECK_DAYS");//检验周期
		            	if(!StringUtils.isBlank(CI_STOCK_CYCLE)){
		            		try{
		            			int NUM_CI_CYCLE_REMIND=Integer.parseInt(CI_CYCLE_REMIND);
		            		}catch(Exception e){
		            			RS=ErpServiceMethod.NG;
			                	MSG.append("第"+(i+1)+"行检验周期必须为数字;");
			                	continue;
		            		}
		            	}
		            	
		            	temp_data.put("CI_ITEM_CODE", CI_ITEM_CODE);//物料编码
		            	temp_data.put("CI_ITEM_NAME", CI_ITEM_NAME);//物料名称
		            	temp_data.put("CI_ITEM_SPEC", CI_ITEM_SPEC);//物料规格
		            	temp_data.put("CI_ITEM_TYPE", CI_ITEM_TYPE);//物料类型
		            	temp_data.put("CI_ITEM_CLASS", CI_ITEM_CLASS);//物料分类
		            	temp_data.put("CI_MIN_PACK", STRCI_MIN_PACK);//最小包装量
		            	temp_data.put("CI_UNIT", CI_UNIT);//单位
		            	temp_data.put("CI_STOCK_CYCLE", CI_STOCK_CYCLE);//保质期(天)
		            	temp_data.put("CI_CYCLE_REMIND", CI_CYCLE_REMIND);//保持期预警天数(天)
		            	temp_data.put("CI_RECHECK_DAYS", CI_RECHECK_DAYS);//检验周期
		            	temp_data.put("DATA_AUTH", DATA_AUTH);//组织机构
		            	modDatas.add(temp_data);
		            	
		            }else if(TYPE.equals("3")){
		            	//判断各个字段必填
		            	SOB=temp_json.getString("SOB");
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
		            	String CI_ITEM_CODE=temp_json.getString("CI_ITEM_CODE");//分类编码
		            	if(StringUtils.isBlank(CI_ITEM_CODE)){
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行物料编码为空;");
		                	continue;
		            	}else if(getCount(CI_ITEM_CODE,DATA_AUTH)==0){ //验证分类编码不能存在
		            		RS=ErpServiceMethod.NG;
		                	MSG.append("第"+(i+1)+"行该账套("+SOB+")下物料编码不存在;");
		                	continue;
		            	}
		            	
		            	temp_data.put("CI_ITEM_CODE", CI_ITEM_CODE);
		            	temp_data.put("DATA_AUTH", DATA_AUTH);//组织机构
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
						AddData(CREATE_USER,addDatas,modelService);
						ModData( CREATE_USER,modDatas,modelService);
						DelData( CREATE_USER,delDatas,modelService);
						MSG.append("处理成功");
						tran.commit();
					}catch(Exception e){
						tran.rollback();
						RS=ErpServiceMethod.NG;
						MSG.append("同步物料信息接口处理失败，具体请查看日志");
						e.printStackTrace();
						ErpServiceMethod.writeLog("","同步物料信息接口处理失败错误："+e.getMessage());
					}
				}
			}catch(Exception e){
				RS=ErpServiceMethod.NG;
				MSG.append("同步物料信息接口处理失败，具体请查看日志2");
				e.printStackTrace();
				ErpServiceMethod.writeLog("","同步物料信息接口处理失败错误2："+e.getMessage());
			}
		}
		
		
		jsonStr=ErpServiceMethod.getResult(RS, MSG.toString());
		map.put("json", jsonStr);
		//保存日志信息 
      	ErpServiceMethod.AddIFLog(requestString, jsonStr, 8, "同步物料信息接口", RS, modelService);
      	
		String endTime=format.format(new java.util.Date());//接口请求结束时间
		
		ErpServiceMethod.writeLog("",  beginTime+"同步物料信息接口请求信息:"+requestString);
		ErpServiceMethod.writeLog("", endTime+ "同步物料信息接口返回信息:"+jsonStr);
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
	public static void AddData(String CREATE_USER, List<Map<String,String>> addDatas,ModelService modelService){
		if(addDatas!=null&&addDatas.size()>0){
			int size=addDatas.size();
			for(int i=0;i<size;i++){
				Map<String,String> temp=addDatas.get(i);
				
				TableDataMapExt object = new TableDataMapExt();
				object.setTableName("T_CO_ITEM"); // 
				object.getColMap().put("ID", StringUtils.getUUID());
				object.getColMap().put("CI_ITEM_CODE", temp.get("CI_ITEM_CODE"));
				object.getColMap().put("CI_ITEM_NAME", temp.get("CI_ITEM_NAME"));
				object.getColMap().put("CI_ITEM_SPEC", temp.get("CI_ITEM_SPEC"));
				object.getColMap().put("CI_ITEM_TYPE", temp.get("CI_ITEM_TYPE"));
				object.getColMap().put("CREATE_USER",  CREATE_USER);
				object.getColMap().put("CREATE_TIME", new Date());
				object.getColMap().put("DATA_AUTH",  temp.get("DATA_AUTH"));
				object.getColMap().put("DEPT_ID",  temp.get("DATA_AUTH"));
				//object.getColMap().put("CI_ITEM_CLASS",  temp.get("CI_ITEM_CLASS"));
				
				object.getColMap().put("CI_MIN_PACK",  temp.get("CI_MIN_PACK"));
				object.getColMap().put("CI_UNIT",  temp.get("CI_UNIT"));
				object.getColMap().put("CI_STOCK_CYCLE",  temp.get("CI_STOCK_CYCLE"));
				object.getColMap().put("CI_CYCLE_REMIND",  temp.get("CI_CYCLE_REMIND"));
				object.getColMap().put("CI_RECHECK_DAYS",  temp.get("CI_RECHECK_DAYS"));
				
				modelService.save(object);
			}
		}
	}
	
	/**
	 * 修改数据
	 * @param addDatas
	 */
	@SuppressWarnings("unchecked")
	public static void ModData( String CREATE_USER, List<Map<String,String>> modDatas,ModelService modelService){
		if(modDatas!=null&&modDatas.size()>0){
			int size=modDatas.size();
			for(int i=0;i<size;i++){
				Map<String,String> temp=modDatas.get(i);
				
				TableDataMapExt object = new TableDataMapExt();
				object.setTableName("T_CO_ITEM"); // 
				object.setSqlWhere(" and CI_ITEM_CODE = '"+temp.get("CI_ITEM_CODE")+"' AND DATA_AUTH='"+temp.get("DATA_AUTH")+"'");
				
				object.getColMap().put("CI_ITEM_NAME", temp.get("CI_ITEM_NAME"));
				object.getColMap().put("CI_ITEM_SPEC", temp.get("CI_ITEM_SPEC"));
				object.getColMap().put("CI_ITEM_TYPE", temp.get("CI_ITEM_TYPE"));
				object.getColMap().put("CREATE_USER",  CREATE_USER);
				object.getColMap().put("CREATE_TIME", new Date());
				object.getColMap().put("DEPT_ID",  temp.get("DATA_AUTH"));
				//object.getColMap().put("CI_ITEM_CLASS",  temp.get("CI_ITEM_CLASS"));
				
				object.getColMap().put("CI_MIN_PACK",  temp.get("CI_MIN_PACK"));
				object.getColMap().put("CI_UNIT",  temp.get("CI_UNIT"));
				object.getColMap().put("CI_STOCK_CYCLE",  temp.get("CI_STOCK_CYCLE"));
				object.getColMap().put("CI_CYCLE_REMIND",  temp.get("CI_CYCLE_REMIND"));
				object.getColMap().put("CI_RECHECK_DAYS",  temp.get("CI_RECHECK_DAYS"));
				object.getColMap().put("CI_STATUS",  "Y");
				
				modelService.edit(object);
			}
		}
	}
	
	/**
	 * 删除数据
	 * @param addDatas
	 */
	public static void DelData( String CREATE_USER, List<Map<String,String>> delDatas,ModelService modelService){
		if(delDatas!=null&&delDatas.size()>0){
			int size=delDatas.size();
			for(int i=0;i<size;i++){
				Map<String,String> temp=delDatas.get(i);
				TableDataMapExt object = new TableDataMapExt();
				object.setTableName("T_CO_ITEM"); // 删除
				object.setSqlWhere(" and CI_ITEM_CODE = '"+temp.get("CI_ITEM_CODE")+"' AND DATA_AUTH='"+temp.get("DATA_AUTH")+"'");
				object.getColMap().put("CI_STATUS",  "N");
				modelService.edit(object);
			}
		}
	}
	
	/**
	 * 根据物料料号，组织机构获取条数
	 * @param CUST_CODE
	 * @return
	 */
	public static int getCount(String CI_ITEM_CODE,String DATA_AUTH){
		int result=0;
		String sql="";
		Object[] param=new Object[2];
	
		sql="select * from T_CO_ITEM where CI_ITEM_CODE=? and DATA_AUTH=? AND CI_STATUS='Y'";
		param[0]=CI_ITEM_CODE;
		param[1]=DATA_AUTH;
		
		result=CommMethod.getBaseService().countSql(sql, param);
		return result;
	}
	
	/**
	 * 根据客户编号获取条数
	 * @param CUST_CODE
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> getCOInfo(String CI_ITEM_CODE,String DATA_AUTH){
		Map<String,Object> map=null;
		String sql="select * from T_CO_ITEM where CI_ITEM_CODE=? and DATA_AUTH=?";
		List<Map<String, Object>> list=modelService.listDataSql(sql,new Object[]{CI_ITEM_CODE,DATA_AUTH});
		if(list!=null&&list.size()>0){
			map=list.get(0);
		}
		return map;
	}
	
	/**
	 * 根据 物料类型/物料分类 、组织机构获取 条数
	 * @param CIC_CLASS_CODE
	 * @param DATA_AUTH
	 * @return
	 */
	public static int getCI_CLASSCount(String CIC_CLASS_CODE,String DATA_AUTH){
		int result=0;
		String sql="";
		Object[] param=new Object[2];
	
		sql="select * from T_CO_ITEM_CLASS where CIC_CLASS_CODE=? AND DATA_AUTH=? ";
		param[0]=CIC_CLASS_CODE;
		param[1]=DATA_AUTH;
		
		result=CommMethod.getBaseService().countSql(sql, param);
		return result;
	}

}
