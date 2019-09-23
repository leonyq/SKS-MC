package com.more.mes.erpservice;

import java.util.Map;

public class JSONBean {
	private Map<String,Object> commonParam;
	private Map<String,Object> body;

	/**
	 * @param args
	 */
	public static void main(String[] args) {

	}

	public Map<String, Object> getCommonParam() {
		return commonParam;
	}

	public void setCommonParam(Map<String, Object> commonParam) {
		this.commonParam = commonParam;
	}

	public Map<String, Object> getBody() {
		return body;
	}

	public void setBody(Map<String, Object> body) {
		this.body = body;
	}

}
