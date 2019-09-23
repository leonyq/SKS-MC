
package com.more.mes.smt.autoupdate;

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


public class GetUpdateInfo 
{
    private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

  private final Log log = LogFactory.getLog(this.getClass());
 
  public List getUpdateFile(String Type)
  {
    String sql = "SELECT T.CAU_SYS_NAME,T.CAU_VERSION,T.CAU_ADDRESS,T.CAU_FILE_NAME  FROM T_CO_AUTO_UPDATE T WHERE T.CAU_TYPE=? ";
    // List itemList = modelService.listDataSql(sql);
    List itemList = modelService.listDataSql(sql, new Object[] {Type});
    return itemList;
  }
}