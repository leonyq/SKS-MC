package com.more.mes.smt.updateLog;

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
 * @Title <新增更新日志>
 * @Description <新增更新日志>
 * @ClassName AddUpdateLog
 * @auther wzy
 * @version 1.0 deverloper 2018-05-08 created
 * @see AddUpdateLog
 * @since 2018-05-08 
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class AddUpdateLog implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());
  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    
    String name = request.getParameter("paraMap1@0#CUL_NAME");
    String type = request.getParameter("paraMap1@0#CUL_MODEL");
    String culContent = request.getParameter("paraMap1@0#CUL_CONTENT"); 
    String CUL_RANK = request.getParameter("paraMap1@0#CUL_RANK");
    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
    String date = format.format(DateUtil.getCurDate());//系统时间
    String sql1 = "select max(CUL_SN) CUL_SN from T_CO_UPDATE_LOG where CUL_SN like '%' || ? || '%' and DATA_AUTH = ? ";
    List<Map> list = modService.listDataSql(sql1,new Object[] {date,dataAuth});

    Map map = list.get(0);

    String taskNumber = (String)map.get("CUL_SN");//获取今天数据库中的最大任务编号    

    String task = date;
   
    String number = null;//存入数据库的任务编号
    try {
    if (StringUtils.isBlank(taskNumber))//判断是否存在今天的任务编号
    {

      number = task + "-001";
    }
    else 
    {
      String newString = taskNumber.substring(9, taskNumber.length());//截取字符串的流水

      String newStrings = taskNumber.substring(0, taskNumber.length() - 4);//截取字符串的时间

      int num = Integer.parseInt(newString) + 1;
      if (num < 10)//判断a是几位数，流水保证为3位数
      {
        number = newStrings + "-00" + num;
      }
      else if (num < 100)
      {
        number = newStrings + "-0" + num;
      }
      else if (num < 1000)
      {
        number = newStrings + num;
      }
    }
    
      String fileName = null;
      String realName = null;    //文件原有名称
      String fileAddress = null;
      float fileSize = 0;
      FileInputStream fis = null;
      FileOutputStream fos = null;
      if (modelAction.getUpFile() != null){
        realName = modelAction.getUpFileFileName(); // 文件名称
        fileName = realName.substring(realName.lastIndexOf(".") + 1);
        fileName = StringUtils.getUUID() + "." + fileName;  //文件存放名称
        fileAddress = "updateLog";   //文件存放路径
        String realPath = modelAction.getRequest().getSession().getServletContext().getRealPath(
            "up_load/comm/updateLog");
        fis = new FileInputStream(modelAction.getUpFile());
        fileSize = fis.available(); // 文件大小
        //上传文件到服务器
        File file = modelAction.getUpFile();
        File file1 = new File(realPath);
        if(!file1.exists() && !file1.isDirectory()){   //判断文件夹是否存在，不存在则创建
          file1.mkdir();
        }
        //上传文件
        String realPath1 = modelAction.getRequest().getSession().getServletContext().getRealPath(
            "up_load/comm/updateLog/" + fileName);
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
      pro.setTableName("T_CO_UPDATE_LOG");
      CommMethod.addSysDefCol(pro.getColMap(), modelAction.getUser());
      pro.getColMap().put("CUL_SN", number);
      pro.getColMap().put("CUL_NAME", name);
      pro.getColMap().put("CUL_MODEL", type);
      pro.getColMap().put("CUL_CONTENT", culContent);
      pro.getColMap().put("CUL_RANK", CUL_RANK);
      if(realName != null){
        pro.getColMap().put("CUL_FILE", realName);
        pro.getColMap().put("CUL_FILE_NAME", fileName);
        pro.getColMap().put("CUL_FILE_SIZE", fileSize);
        pro.getColMap().put("CUL_FILE_LOAD", fileAddress);
        }
      modService.save(pro);
      
    } catch (Exception e) {
      log.error(e);
        throw new BussException(modelAction.getText("新增失败"), e);
    }
    
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
  }

}
