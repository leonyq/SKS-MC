package com.more.mes.smt.quailtyerror.oracle;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 品质异常单 修改保存
 * @author development
 *
 */
public class EditSaveQualityErrorInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      String id = request.getParameter("dataId");
      String moNumber = request.getParameter("paraMapObj.CQI_MO_NUMBER");// 制令单
      String modelCode = request.getParameter("modelCode");// 机种
      String custCode = request.getParameter("paraMapObj.CQI_CUST_CODE");// 客户
      String inspectSn = request.getParameter("paraMapObj.CQI_INSPECT_SN");// 检验批号
      String submitNum = request.getParameter("CQI_SUBMIT_NUM");// 送检数量
      String inspectNum = request.getParameter("CQI_INSPECT_NUM");// 检验数量
      String errorNum = request.getParameter("CQI_ERROR_NUM");// 不良数量
      String areaSn = request.getParameter("areaSn");// 生产区域
      String errorType = request.getParameter("paraMapObj.CQI_ERROR_TYPE");// 异常类型
      String errorDesc = request.getParameter("paraMapObj.CQI_ERROR_DESC");// 异常描述

      String qualitySql = "select CQI_FILE_REAL_NAME from T_CO_QE_INFO where id = ?";
      List<Map> qualityList = modelService.listDataSql(qualitySql, new Object[] {id});
      String myFileName = (String)qualityList.get(0).get("CQI_FILE_REAL_NAME");

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
        fileAddress = "qualityError"; // 文件存放路径
        String realPath = modelAction.getRequest().getSession().getServletContext().getRealPath(
          "up_load"+Constants.SEPARATOR+"comm"+Constants.SEPARATOR+"qualityError"+Constants.SEPARATOR+"");
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
          "up_load"+Constants.SEPARATOR+"comm"+Constants.SEPARATOR+"qualityError"+Constants.SEPARATOR+"" + fileName);
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
      
      int submitNumber = 0;
      int inspectNumber = 0;
      int errorNumber = 0;
      if (!StringUtils.isBlank(submitNum))
      {
        submitNumber = Integer.parseInt(submitNum);
      }
      if (!StringUtils.isBlank(inspectNum))
      {
        inspectNumber = Integer.parseInt(inspectNum);
      }
      if (!StringUtils.isBlank(errorNum))
      {
        errorNumber = Integer.parseInt(errorNum);
      }
      // 插入品质异常单基本信息
      TableDataMapExt qualityError = new TableDataMapExt();
      qualityError.setTableName("T_CO_QE_INFO");
      CommMethod.editSysDefCol(qualityError.getColMap(), modelAction.getUser());
      ArrayList paramList = new ArrayList();
      qualityError.setSqlWhere("and ID = ? ");
      paramList.add(id);
      qualityError.setSqlWhereArgs(paramList);

      // qualityError.setSqlWhere(" and ID='" + id + "'");
      qualityError.getColMap().put("CQI_MO_NUMBER", moNumber);
      qualityError.getColMap().put("CQI_MODEL_CODE", modelCode);
      qualityError.getColMap().put("CQI_CUST_CODE", custCode);
      qualityError.getColMap().put("CQI_INSPECT_SN", inspectSn);
      qualityError.getColMap().put("CQI_SUBMIT_NUM", submitNumber);
      qualityError.getColMap().put("CQI_INSPECT_NUM", inspectNumber);
      qualityError.getColMap().put("CQI_ERROR_NUM", errorNumber);
      qualityError.getColMap().put("CQI_AREA_SN", areaSn);
      qualityError.getColMap().put("CQI_ERROR_TYPE", errorType);
      qualityError.getColMap().put("CQI_ERROR_DESC", errorDesc);
      if (dataAuth != null)
      {
        qualityError.getColMap().put("DATA_AUTH", dataAuth);
      }
      if (realName != null)
      {
        qualityError.getColMap().put("CQI_FILE_NAME", realName);
        qualityError.getColMap().put("CQI_FILE_REAL_NAME", fileName);
        qualityError.getColMap().put("CQI_FILE_PATH", fileAddress);
        qualityError.getColMap().put("CQI_FILE_SIZE", fileSize);
      }
      modelService.edit(qualityError);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
  }

}
