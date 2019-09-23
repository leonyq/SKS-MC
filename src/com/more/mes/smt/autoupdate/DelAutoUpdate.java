package com.more.mes.smt.autoupdate;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
public class DelAutoUpdate implements FuncService
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
   
    try {
      String delId = request.getParameter("delId");// 需要删除的id
      String[] strArray = delId.split(",");

      String sql = "DELETE FROM T_CO_AUTO_UPDATE WHERE ID=? ";
      for (int i = 0; i < strArray.length; i++ )
      {
         
          
        String sql1 = "SELECT T.CAU_SYS_NAME,T.CAU_FILE_NAME FROM T_CO_AUTO_UPDATE T WHERE T.ID=? ";
       List<Map> list = modService.listDataSql(sql1,new Object[] {strArray[i]});
       Map map = list.get(0);
       String  sysNameOld= (String)map.get("CAU_SYS_NAME");
       String  fileNameOld= (String)map.get("CAU_FILE_NAME");
       String realPathOld = modelAction.getRequest().getSession().getServletContext().getRealPath(
       "up_load/comm/autoUpdate/" + fileNameOld);
       File fileOld=new File(realPathOld);
       if(fileOld.exists()&&fileOld.isFile()){
           fileOld.delete();  
       }
       modService.execSql(sql,new Object[]{strArray[i]});
       
     }
    } catch (Exception e) {
      log.error(e);
        throw new BussException(modelAction.getText("删除失败"), e);
    }
    
     return modelAction.reloadParent(modelAction.getText("删除成功"));
  }

}
