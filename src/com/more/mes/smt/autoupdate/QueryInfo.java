package com.more.mes.smt.autoupdate;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import java.io.File;
/**
 * 
 * @Title <新增程序发布>
 * @Description <新增程序发布>
 * @ClassName AddUpdateLog
 * @auther lyq
 * @version 1.0 deverloper 2018-02-15 created
 * @see AddAutoUpdate
 * @since 2019-02-15 
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class QueryInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());
  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String userId=modelAction.getUser().getId();
    Map<String,String> map = new HashMap<String, String>();
    String name = request.getParameter("name"); 
    String type=request.getParameter("type"); 
    String sql = "SELECT T.ID,T.CAU_NAME,T.CAU_TYPE,T.CAU_VERSION,\r\n" + 
          "T.CAU_SYS_NAME,T.CAU_FILE_NAME,T.CAU_MEMO,\r\n" + 
          "T.CAU_UPLOAD_TIME,T.CAU_UPLOAD_USER,A.NAME AS UPLOAD_USER \r\n" + 
          "FROM T_CO_AUTO_UPDATE T  "+
          "LEFT JOIN SY_USER A ON T.CAU_UPLOAD_USER=A.ID "+
          "WHERE 1=1 ";
    String sqlWhere = "  ";
   
    if (StringUtils.isNotBlank(name))
    {
      sqlWhere += " and t.CAU_NAME like '%'||:name||'%'";
      map.put("name", name);
    }
    
    if (StringUtils.isNotBlank(type))
    {
      sqlWhere += " and t.CAU_TYPE like '%'||:type||'%'";
      map.put("type", type);
    }

   List poList = modService.listSql(sql+sqlWhere, modelAction.getPage(), map, null, null);

        
    modelAction.setAjaxPage(modelAction.getPage());
    modelAction.getAjaxPage().setDataList(poList);
    return BaseActionSupport.AJAX;
  }

}
