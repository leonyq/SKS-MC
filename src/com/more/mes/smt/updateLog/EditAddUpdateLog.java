package com.more.mes.smt.updateLog;

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

public class EditAddUpdateLog implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();

    String dataAuth = request.getParameter("_DATA_AUTH");
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");

    String name = request.getParameter("paraMapObj.CUL_NAME");
    String type = request.getParameter("paraMapObj.CUL_MODEL");
    String culContent = request.getParameter("paraMapObj.CUL_CONTENT");
    String CUL_RANK = request.getParameter("paraMapObj.CUL_RANK");
    String dataId = request.getParameter("dataId");
    try
    {
      

      String fileName = null;
      String realName = null; // 文件原有名称
      String fileAddress = null;
      float fileSize = 0;
      FileInputStream fis = null;
      FileOutputStream fos = null;

      if (modelAction.getUpFile() != null)
      {
        realName = modelAction.getUpFileFileName(); // 文件名称
        fileName = realName.substring(realName.lastIndexOf(".") + 1);
        fileName = StringUtils.getUUID() + "." + fileName; // 文件存放名称
        fileAddress = "updateLog"; // 文件存放路径
        String realPath = modelAction.getRequest().getSession().getServletContext().getRealPath(
          "up_load/comm/updateLog");
        fis = new FileInputStream(modelAction.getUpFile());
        fileSize = fis.available(); // 文件大小
        // 上传文件到服务器
        File file = modelAction.getUpFile();
        File file1 = new File(realPath);
        if (!file1.exists() && !file1.isDirectory())
        { // 判断文件夹是否存在，不存在则创建
          file1.mkdir();
        }
        // 上传文件
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
      CommMethod.editSysDefCol(pro.getColMap(), modelAction.getUser());
      pro.setSqlWhere("and id ='"+dataId+"' ");
      pro.getColMap().put("CUL_NAME", name);
      pro.getColMap().put("CUL_MODEL", type);
      pro.getColMap().put("CUL_CONTENT", culContent);
        pro.getColMap().put("CUL_RANK", CUL_RANK);
      if (dataAuth != null)
      {
        pro.getColMap().put("DATA_AUTH", dataAuth);
      }
      if (realName != null)
      {
        pro.getColMap().put("CUL_FILE", realName);
        pro.getColMap().put("CUL_FILE_NAME", fileName);
        pro.getColMap().put("CUL_FILE_SIZE", fileSize);
        pro.getColMap().put("CUL_FILE_LOAD", fileAddress);
      }
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
