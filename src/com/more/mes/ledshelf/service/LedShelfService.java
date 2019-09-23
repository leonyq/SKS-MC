package com.more.mes.ledshelf.service;

import com.more.led.executor.*;

public class LedShelfService {

	public Boolean aa(String cmd)
	{
       com.more.led.executor.Shelfexecutor aaa=new com.more.led.executor.Shelfexecutor();
       Boolean isTrue=aaa.Execute(cmd);
       return isTrue;
 	}
}