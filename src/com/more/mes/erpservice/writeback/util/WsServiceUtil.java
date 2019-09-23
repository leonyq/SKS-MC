package com.more.mes.erpservice.writeback.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;

/**
 * 金碟u8ERP
 * 封装的接口测试
 * @author Administrator
 *
 */
public class WsServiceUtil {
	private static final Log log = LogFactory.getLog(WsServiceUtil.class);
	//U8ERP接口地址 测试地址 http://192.168.8.178:8090/WebService1.asmx
	//测试地址 http://192.168.10.20:8090/WebService1.asmx
	//正式地址 http://192.168.8.33:8090/WebService1.asmx
	private static final String URL="http://192.168.8.33:8090/WebService1.asmx";
	//U8ERP接口方法命名空间
	private static final String METHODNAME="http://www.guangbukeji.com/";
	//接口请求结果代码 默认0位成功
	public static final String RESULTCODE="1";
	public static final String RESULTCODE_SUCCESS="0";

	public static void main(String[] args) {
		try {
			// 声明一个接口调用对象
			WsProc wp = new WsProc();
			// 设置接口调用对象的url，命名空间，和方法名
			wp.setProcUrl(URL); // 接口url，填你调用接口的url哦
			wp.setqName(METHODNAME); // 命名空间 填你调用的接口的命名空间哦
			wp.setProcName("CeShi"); // 接口方法 填你调用接口中描述的方法命名哦

			// 设置方法的参数列表和参数值列表
			ArrayList<String> params = new ArrayList<String>();
			params.add("U8Type"); // 方法参数，填你调用接口的方法的参数哦
			// params.add("default_param1"); //方法参数，填你调用接口的方法的参数哦
			// params.add("default_param2"); //方法参数，填你调用接口的方法的参数哦
			ArrayList<String> values = new ArrayList<String>();
			// 方法参数值，填你调用接口的方法的参数对应的值哦
			values.add("{\"cAcc\":\"580\",\"bredvouch\":\"0\",\"cVenCode\":\"1001\",\"dDate\":\"2018-11-13\",\"cWhcode\":\"402\",\"cRdCode\":\"101\",\"list\":[{\"cInvCode\":\"11186318\",\"iQuantity\":\"888\",\"cBatch\":\"212\"}]}"); 
//			Map<String, Object> map=new HashMap<String,Object>();
//			map.put("cInvCode", "11186432");
//			String json=JSON.toJSONString(map);
//			System.out.println(json);
//			values.add(json);
			// values.add("admin"); //方法参数值，填你调用接口的方法的参数对应的值哦
			// values.add("admin_pwd"); //方法参数值，填你调用接口的方法的参数对应的值哦

			// 设置方法的参数和值
			wp.SetParams(params, values);

			// 调用接口
			wp.CallMethod();
			// 查看结果
			System.out.println(wp.getProcResult());
			// 分析结果
			wp.AnalyzeJson();
			JSONObject jsonObject = wp.getProcJsonResult();
			System.out.println(jsonObject.get("errcode")); 
			System.out.println(jsonObject.get("errmsg"));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * U8ERP请求接口
	 * @param postUrl U8ERP接口地址
	 * @param methodName U8ERP接口方法命名空间
	 * @param ProcName 请求方法名
	 * @param params 参数名数组
	 * @param values 参数值数组
	 * @return 返回请求结果  resultcode为0表示成功 其他表示失败
	 */
	public static String postService(String postUrl,String methodName,String ProcName,ArrayList<String> params, ArrayList<String> values){
		String result=null;
		try {
			// 声明一个接口调用对象
			WsProc wp = new WsProc();
			// 设置接口调用对象的url，命名空间，和方法名
			wp.setProcUrl(postUrl); // 接口url，填你调用接口的url哦
			wp.setqName(methodName); // 命名空间 填你调用的接口的命名空间哦
			wp.setProcName(ProcName); // 接口方法 填你调用接口中描述的方法命名哦
			// 设置方法的参数和值
			wp.SetParams(params, values);
			// 调用接口
			wp.CallMethod();
			//返回请求结果
			result=wp.getProcResult();
		} catch (Exception e) {
			e.printStackTrace();
			log.error("U8ERP接口请求异常："+e);
		}
		return result;
	}
	
	
	/**
	 * erp接口请求
	 * @param ProcName 请求方法名
	 * @param json 请求的报文
	 * @param OBJECTNAME 对象名
	 * @param OBJECTTYPE 请求类型
	 * @param DOCNUM 对应操作的单据号
	 * @return
	 */
	public static Map<String,String> postService(String MethodName,String json,String OBJECTNAME,int OBJECTTYPE,String DOCNUM){
		return postService(MethodName,json,OBJECTNAME,OBJECTTYPE,DOCNUM,null,null);
	}
	/**
	 * erp接口请求
	 * @param ProcName 请求方法名
	 * @param json 请求的报文
	 * @param OBJECTNAME 对象名
	 * @param OBJECTTYPE 请求类型
	 * @param DOCNUM 对应操作的单据号
	 * @return
	 */
	public static Map<String,String> postService(String MethodName,String json,String OBJECTNAME,int OBJECTTYPE,String DOCNUM,String ITEM_ID){
		return postService(MethodName,json,OBJECTNAME,OBJECTTYPE,DOCNUM,ITEM_ID,null);
	}
	
	/**
	 * erp接口请求
	 * @param ProcName 请求方法名
	 * @param json 请求的报文
	 * @param OBJECTNAME 对象名
	 * @param OBJECTTYPE 请求类型
	 * @param DOCNUM 对应操作的单据号
	 * @param DETAIL_ID 详细ID
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String,String> postServicelOGIN_NAME(String MethodName,String json,String OBJECTNAME,int OBJECTTYPE,String DOCNUM,String LOGIN_NAME){
		Map<String,String> map=new HashMap<String,String>();
		String resultcode=RESULTCODE;
		
		ArrayList<String> params=new ArrayList<String>();
		params.add("U8Type");//请求参数名
		
		ArrayList<String> values = new ArrayList<String>();
		values.add(json);//请求参数值
		
		String res=postService(URL,METHODNAME,MethodName,params,values);
		JSONObject jsonObject=JSONObject.fromObject(res);
		//返回回写的结果编码
		if(jsonObject.containsKey("errcode")){
			resultcode=jsonObject.getString("errcode");
		}else{
			resultcode="-1000";
		}
		String errmsg="";
		if(jsonObject.containsKey("errmsg")){
			errmsg="ERP提示："+jsonObject.getString("errmsg");
		}else{
			errmsg="ERP提示：ERP没有返回信息";
		}
		map.put("errcode", resultcode);
		map.put("errmsg", errmsg);
		//记录回写日志
		MsHTranMan tran=  BussService.getHbTran();
		try{
			TableDataMapExt object = new TableDataMapExt();
			object.setTableName("T_CO_IFLOG");
			object.getColMap().put("DOCNUM", DOCNUM);//单据号
			object.getColMap().put("OPERATEDATE", new Date());//请求时间
			object.getColMap().put("OBJECTNAME", OBJECTNAME);//对象名
			object.getColMap().put("OBJECTTYPE", OBJECTTYPE);//请求类型
			object.getColMap().put("REQUESTURL", URL+"?op="+MethodName);//请求URL
			object.getColMap().put("REQUESTDATA", json);//请求数据
			object.getColMap().put("RESPONSEDATA", res);//回复数据
			object.getColMap().put("RESULT", resultcode);//返回结果码
			object.getColMap().put("OPERAUSER",LOGIN_NAME);
			
			CommMethod.getBaseService().save(object);//保存日志
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
		}
		
		return map;
	}
	
	/**
	 * erp接口请求
	 * @param ProcName 请求方法名
	 * @param json 请求的报文
	 * @param OBJECTNAME 对象名
	 * @param OBJECTTYPE 请求类型
	 * @param DOCNUM 对应操作的单据号
	 * @param DETAIL_ID 详细ID
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String,String> postService(String MethodName,String json,String OBJECTNAME,int OBJECTTYPE,String DOCNUM,String ITEM_ID,String DETAIL_ID){
		Map<String,String> map=new HashMap<String,String>();
		String resultcode=RESULTCODE;
		
		ArrayList<String> params=new ArrayList<String>();
		params.add("U8Type");//请求参数名
		
		ArrayList<String> values = new ArrayList<String>();
		values.add(json);//请求参数值
		
		String res=postService(URL,METHODNAME,MethodName,params,values);
		JSONObject jsonObject=JSONObject.fromObject(res);
		
		//返回回写的结果编码
		if(jsonObject.containsKey("errcode")){
			resultcode=jsonObject.getString("errcode");
		}else{
			resultcode="-1000";
		}
		String errmsg="";
		if(jsonObject.containsKey("errmsg")){
			errmsg=jsonObject.getString("errmsg");
		}
		map.put("errcode", resultcode);
		map.put("errmsg", errmsg);
		//记录回写日志
		MsHTranMan tran=  BussService.getHbTran();
		try{
			TableDataMapExt object = new TableDataMapExt();
			object.setTableName("T_CO_IFLOG");
			object.getColMap().put("DOCNUM", DOCNUM);//单据号
			object.getColMap().put("OPERATEDATE", new Date());//请求时间
			object.getColMap().put("OBJECTNAME", OBJECTNAME);//对象名
			object.getColMap().put("OBJECTTYPE", OBJECTTYPE);//请求类型
			object.getColMap().put("REQUESTURL", URL+"?op="+MethodName);//请求URL
			object.getColMap().put("REQUESTDATA", json);//请求数据
			object.getColMap().put("RESPONSEDATA", res);//回复数据
			object.getColMap().put("RESULT", resultcode);//返回结果码
			object.getColMap().put("ITEM_ID", ITEM_ID);
			object.getColMap().put("DETAIL_ID", DETAIL_ID);
			
			CommMethod.getBaseService().save(object);//保存日志
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
		}
		
		return map;
	}

}
