package com.more.mes.smt.autoupdate;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
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

public class EditAutoUpdate implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();

    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String userId=modelAction.getUser().getId();
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");

 
    String dataId = request.getParameter("dataId");
    
    //String sn = request.getParameter("paraMapObj.CAU_SN");
    //String name = request.getParameter("paraMapObj.CAU_NAME");
    String type = request.getParameter("paraMapObj.CAU_TYPE");
    String version = request.getParameter("paraMapObj.CAU_VERSION");
    String address = "up_load/comm/autoUpdate";
   
    String memo = request.getParameter("paraMapObj.CAU_MEMO"); 
    
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String date = format.format(DateUtil.getCurDate());//系统时间
    
    String sql1 = "SELECT T.CAU_SYS_NAME,T.CAU_FILE_NAME,T.CAU_TYPE FROM T_CO_AUTO_UPDATE T WHERE T.ID=? ";
    List<Map> list = modService.listDataSql(sql1,new Object[] {dataId});

    Map map = list.get(0);

    String  sysNameOld= (String)map.get("CAU_SYS_NAME");//获取今天数据库中的最大任务编号  
    String  fileNameOld= (String)map.get("CAU_FILE_NAME");
     type= (String)map.get("CAU_TYPE");
    try
    {
      

      String fileName = null;
      String sysName = null;    //文件原有名称
      String fileAddress = null;
      float fileSize = 0;
      FileInputStream fis = null;
      FileOutputStream fos = null;

      if (modelAction.getUpFile() != null)
      {
          
        sysName = modelAction.getUpFileFileName(); // 文件名称
        fileName = sysName.substring(sysName.lastIndexOf(".") + 1);
        fileName = StringUtils.getUUID() + "." + fileName; // 文件存放名称
        fileAddress = "autoUpdate"; // 文件存放路径
        String realPath = modelAction.getRequest().getSession().getServletContext().getRealPath(
          "up_load/comm/autoUpdate");
          
        fis = new FileInputStream(modelAction.getUpFile());
        fileSize = fis.available(); // 文件大小
        
        String sql0 = "SELECT T.CAU_SYS_NAME,T.CAU_FILE_NAME FROM T_CO_AUTO_UPDATE T WHERE  T.CAU_NAME=? AND T.CAU_TYPE=? AND T.ID<>? ";
        List<Map> list0 = modService.listDataSql(sql0,new Object[] {sysName,type,dataId});
        if (list0 != null && !list0.isEmpty())
        {
        return modelAction.alertParentInfo(modelAction.getText("该类型已存在同名程序文件"));
        }
        //if (sysName.equals(sysNameOld))
        //{
           String realPathOld = modelAction.getRequest().getSession().getServletContext().getRealPath(
          "up_load/comm/autoUpdate/" + fileNameOld);
           File fileOld=new File(realPathOld);
           if(fileOld.exists()&&fileOld.isFile())
           fileOld.delete();   
        //}
        // 上传文件到服务器
        File file = modelAction.getUpFile();
        File file1 = new File(realPath);
        if (!file1.exists() && !file1.isDirectory())
        { // 判断文件夹是否存在，不存在则创建
          file1.mkdir();
        }
        // 上传文件
        String realPath1 = modelAction.getRequest().getSession().getServletContext().getRealPath(
          "up_load/comm/autoUpdate/" + fileName);
        fos = new FileOutputStream(realPath1);
        BufferedInputStream bf = new BufferedInputStream(new FileInputStream(file));
        byte[] bt = new byte[1024];
        int n = bf.read(bt);
        while (n != -1)
        {
          fos.write(bt, 0, n);
          fos.flush();
          n = bf.read(bt);
        }
        fos.close();
        fis.close();
      }

      TableDataMapExt pro = new TableDataMapExt();
      pro.setTableName("T_CO_AUTO_UPDATE");
      CommMethod.editSysDefCol(pro.getColMap(), modelAction.getUser());
      pro.setSqlWhere("and id ='"+dataId+"' ");
      
      if (sysName != null)
      {
      pro.getColMap().put("CAU_SN", "");
      pro.getColMap().put("CAU_NAME", sysName);
      //pro.getColMap().put("CAU_TYPE", type);
      
      pro.getColMap().put("CAU_ADDRESS", address);
      pro.getColMap().put("CAU_SYS_NAME", sysName);
      pro.getColMap().put("CAU_FILE_NAME", fileName);
      pro.getColMap().put("CAU_UPLOAD_TIME", date);
      pro.getColMap().put("CAU_UPLOAD_USER", userId);
     
      }
      pro.getColMap().put("CAU_VERSION", version);
      pro.getColMap().put("CAU_MEMO", memo);
      modService.edit(pro);

    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }

    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
  }

}
