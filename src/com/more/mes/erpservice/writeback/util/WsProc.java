package com.more.mes.erpservice.writeback.util;

import java.net.URL;
import java.util.ArrayList;

import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;

import net.sf.json.JSONObject;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
/**
 * 金碟u8ERP
 * @ClassName: UmadeProc <br/>
 * @Description:  (java调用webservice接口实现类). <br/>
 * @Reason:  (java调用webservice接口实现). <br/>
 * @date: 2018-11-14 上午10:14:53 <br/>
 * @author wxw
 * @version
 */
public class WsProc implements WsProcCall {
	private static final Log log = LogFactory.getLog(WsProc.class);
	/**
	 * procUrl:
	 */
	private String procUrl;
	/**
	 * procName:(调用的方法名称).
	 */
	private String procName;
	/**
	 * procParams:(方法的参数列表).
	 */
	private ArrayList<String> procParams;
	/**
	 * procValues:(方法的参数列表对应的值列表).
	 */
	private ArrayList<String> procValues;
	/**
	 * procResult:(接口返回结果String类型).
	 */
	private String procResult;
	/**
	 * procJsonResult:(接口返回结果json类型 ).
	 */
	private JSONObject procJsonResult;
	/**
	 * qName:(接口方法的命名空间，很重要！可以通过浏览器访问接口获取
	 */
	private String qName;

	public String getqName() {
		return qName;
	}

	public void setqName(String qName) {
		this.qName = qName;
	}

	public String getProcUrl() {
		return procUrl;
	}

	public void setProcUrl(String procUrl) {
		this.procUrl = procUrl;
	}

	public String getProcName() {
		return procName;
	}

	public void setProcName(String procName) {
		this.procName = procName;
	}

	public ArrayList<String> getProcParams() {
		return procParams;
	}

	public void setProcParams(ArrayList<String> procPrams) {
		this.procParams = procPrams;
	}

	public ArrayList<String> getProcValues() {
		return procValues;
	}

	public void setProcValues(ArrayList<String> procValues) {
		this.procValues = procValues;
	}

	public String getProcResult() {
		return procResult;
	}

	public void setProcResult(String procResult) {
		this.procResult = procResult;
	}

	public JSONObject getProcJsonResult() {
		return procJsonResult;
	}

	public void setProcJsonResult(JSONObject procJsonResult) {
		this.procJsonResult = procJsonResult;
	}

	/**
	 * @Title: UmadeProc
	 * @Description: (带接口url地址和命名空间参数的构造函数)
	 * @param:
	 * @throws: (异常抛出及条件)
	 */

	public WsProc(String procUrl,String qName) {
		super();
		this.procUrl = procUrl;
		this.qName   = qName;
		this.procParams = new ArrayList<String>();
		this.procValues = new ArrayList<String>();
		/*如果调用的接口有默认的参数或者认证的参数，可以在这里设置！！！ 
		this.procParams.add("default_param1");
		this.procParams.add("default_param2");
		this.procValues.add("admin");
		this.procValues.add("adminpwd");
		*/
	}

	/**
	 * @Description: (带接口url地址和命名空间、接口参数列表、接口参数列表对应的值列表的构造函数)
	 * @param: @param procName
	 * @param: @param procPrams
	 * @param: @param procValues
	 * @throws: (异常抛出及条件)
	 */

	public WsProc(String procUrl,String procName, ArrayList<String> procPrams,
			ArrayList<String> procValues) {
		super();
		this.procName = procName;
		this.procParams = procPrams;
		this.procValues = procValues;

		this.procUrl = procUrl;
		
		this.procParams = new ArrayList<String>();
		/*如果调用的接口有默认的参数或者认证的参数，可以在这里设置！！！ 
		this.procParams.add("default_param1");
		this.procParams.add("default_param2");
		this.procValues.add("admin");
		this.procValues.add("adminpwd");
		*/
	}

	/**
	 * @Description: (不带任何参数的构造函数)
	 * @param: @param procName
	 * @param: @param procPrams
	 * @param: @param procValues
	 * @param: @param qName
	 * @throws: (异常抛出及条件)
	 */

	public WsProc() {
		super();
	}

	/**
	 * <p>Title: CallMethod</p>
	 * <p>Description:(调用接口函数)
	 */
	public void CallMethod() {
		//  Auto-generated method stub
		//声明webservice
		Service service = new Service();
		//声明调用实体
		Call call = null;
		try {
			//创建调用
			call = (Call) service.createCall();
			//设置调用url
			call.setTargetEndpointAddress(new URL(this.getProcUrl()));
			//设置调用的方法名
			call.setOperationName(new QName(this.getqName(), this.getProcName()));
			//添加方法的参数列表
			for (String param : this.getProcParams()) {
				call.addParameter(new QName(this.getqName(), param),
						XMLType.SOAP_VECTOR, ParameterMode.IN);
			}
			//设置返回类型为string，如果不是string，可以设置为其他，具体见你的接口描述
			call.setReturnType(org.apache.axis.encoding.XMLType.XSD_STRING);
			//设置soapaction，这个在调用.net生成的webservice时需设置
			call.setUseSOAPAction(true);
			//设置soapaction的地址具体可使用浏览器访问接口，然后查看方法，然后看soap1.1中的SOAPACtion即可，soap1.2协议不用该方法
			call.setSOAPActionURI(this.getqName() + this.getProcName());
			//调用接口，这里将调用方法的参数值列表生成了string[]
			String result=(String) call.invoke((this.getProcValues()
					.toArray(new String[this.getProcValues().size()])));
			this.setProcResult(result);
			//System.out.println(this.getProcResult());
		} catch (Exception e) {
			log.error("U8ERP接口请求异常："+this.getProcUrl()+":"+e);
			e.printStackTrace();
		}
	}

	/**
	 * <p>Title: SetParams</p>
	 * <p>Description:(设置方法的参数列表和参数列表对应的值列表)
	 * @param params
	 * @param values
	 */
	public void SetParams(ArrayList<String> params, ArrayList<String> values) {
		//  Auto-generated method stub
		this.procParams = params;
		this.procValues = values;

	}

	/**
	 * <p>Title: AnalyzeJson</p>
	 * <p>Description:(解析结果为json数据对象)
	 */
	public void AnalyzeJson() {
		//  Auto-generated method stub
		if(this.getProcResult()==null || this.getProcResult().length()<1) {
			this.CallMethod();
		}
		//try {
			//BufferedReader bf = new BufferedReader(new InputStreamReader(this.getProcJsonResult().to,"UTF-8"));
		String res = this.getProcResult();
		JSONObject object=JSONObject.fromObject(res);
		this.setProcJsonResult(object);
	}

	/**
	 * <p>Title: AddParams</p>
	 * <p>Description:(如果接口方法有默认参数)
	 * @param params
	 * @param value
	 */
	public void AddParams(String params, String value) {
		//  Auto-generated method stub
		if(this.procParams == null) {
			this.procParams = new ArrayList<String>();
			/*this.procParams.add("default_param1");
			this.procParams.add("default_param2");*/
			this.procParams.add(params);
		} else {
			this.procParams.add(params);
		}
		
		if(this.procResult == null) {
			this.procValues = new ArrayList<String>();
		/*	this.procValues.add("admin");
			this.procValues.add("adminpwd");*/
			this.procValues.add(value);
		} else {
			this.procValues.add(value);
		}
	}
}

