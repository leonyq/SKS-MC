package com.more.morelabel.ruler.rulerInterface;

public class RulerResult
{
	private String errorMessage;
	
	private String code;
	
	public RulerResult(String code,String errorMessage)
	{
		this.setErrorMessage(errorMessage);
		this.setCode(code);
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
