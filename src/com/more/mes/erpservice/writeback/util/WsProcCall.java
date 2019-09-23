package com.more.mes.erpservice.writeback.util;
import java.util.ArrayList;
/**
 * 金碟u8ERP
 * @ClassName: UmadeProcCall <br/>
 * @Description: (webservice调用接口封装). <br/>
 * @date: 2018-11-14 上午11:02:37 <br/>
 * @author wxw
 * @version 
 */
public interface WsProcCall {
	/**
	 * @Title: CallMethod
	 * @Description: (调用接口方法). <br/>
	 * @param: 
	 * @author wxw
	 * @return:void
	 * @throws
	 */
    void CallMethod();
	/**
	 * @Title: SetParams
	 * @Description: (设置接口参数列表和参数值列表). <br/>
	 * @param: @param params
	 * @param: @param values
	 * @author wxw
	 * @return:void
	 * @throws
	 */
    void SetParams(ArrayList<String> params, ArrayList<String> values);
	/**
	 * @Title: AnalyzeJson
	 * @Description: (如果webservice调用的结果是json，则可实现该接口). <br/>
	 * @param: 
	 * @author wxw
	 * @return:void
	 * @throws
	 */
    void AnalyzeJson();
	/**
	 * @Title: AddParams
	 * @Description: (如果接口有默认参数或者认证参数可在构造函数子里面设置，然后实现这个函数添加新的参数和参数值对). <br/>
	 * @param: @param params
	 * @param: @param value
	 * @author wxw
	 * @return:void
	 * @throws
	 */
    void AddParams(String params, String value);
}
