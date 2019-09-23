
package com.more.http;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;


public class GetPdaInfo 
{
    private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

  private final Log log = LogFactory.getLog(this.getClass());
 
  public List getPdaInfo()
  {
    String sql = "\r\n" + 
	    "SELECT A.ID AS id,A.NAME AS name,A.url,A.UP_ID as upId,NVL(A.IMG,'') as img,\r\n" + 
	    "A.TYPE as type,A.IS_AUTH,A.IS_SHOW,A.ORDER_BY ,A.CLASS_NAME,A.CLIENT_TYPE,A.FUNC_CODE as funcCode,\r\n" + 
	    "A.OPEN_TYPE as openType, A.PATH \r\n" + 
	    "\r\n" + 
	    "FROM(\r\n" + 
	    "SELECT IA.*\r\n" + 
	    "FROM SY_FUNC IA \r\n" + 
	    "WHERE IA.ID IN (SELECT B.FUNC_ID FROM SY_ROLE_FUNC B,SY_USER_ROLE C,SY_USER D\r\n" + 
	    "             WHERE B.ROLE_ID=C.ROLE_ID \r\n" + 
	    "             AND C.USER_ID=D.ID \r\n" + 
	    "             /*AND D.ID=?*/ )\r\n" + 
	    "AND IA.TYPE IN('0','1') AND IA.IS_FRONT='1' AND (IA.IS_SHOW IS NULL OR IA.IS_SHOW='1'))A\r\n" + 
	    "ORDER BY A.ORDER_BY\r\n" + 
	    "";
    // List itemList = modelService.listDataSql(sql);
    List itemList = modelService.listDataSql(sql);
    return itemList;
  }
}