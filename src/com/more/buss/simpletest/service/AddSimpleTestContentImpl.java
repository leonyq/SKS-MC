package com.more.buss.simpletest.service;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;

/**
 * 简单质检新增
 * @author:phantomsaber
 * @version:2019/7/5 17:37
 * @email:phantomsaber@foxmail.com
 **/
public class AddSimpleTestContentImpl implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    // 是否关闭窗口
    String isCloseWin = request.getParameter("isCloseWin");
    String formId = request.getParameter("formId");
    if (!CommMethod.isRepeatSubmit(request) || !"0".equals(isCloseWin))
    {
      CommMethod.rmSessionMap(modelAction.getSession(), "formToken");
      if (StringUtils.isBlank(formId))
      {
        formId = request.getParameter("formIds");
      }
      String iframeId = request.getParameter("iframeId");
      try
      {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String projectId = request.getParameter("paraMap1@0#CFI_PROJECT_ID");
        String modelCode = request.getParameter("paraMap1@0#CFI_MODEL_CODE");
        String projectStep = request.getParameter("paraMap1@0#CFI_PRODUCT_STEP");
        String faiNum = request.getParameter("paraMap1@0#CFI_FAI_NUM");
        int faiNumber = 0;
        if (!StringUtils.isBlank(faiNum))
        {
          faiNumber = Integer.parseInt(faiNum);
        }
        String checkResult = request.getParameter("paraMap1@0#CFI_CHECK_RESULT");
        String checkNum = request.getParameter("paraMap1@0#CFI_CHECK_NUM");
        int checkNumber = 0;
        if (!StringUtils.isBlank(checkNum))
        {
          checkNumber = Integer.parseInt(checkNum);
        }
        String checkSn = request.getParameter("cfiCheckSn");
        String checkContent = request.getParameter("paraMap1@0#CFI_CHECK_CONTENT");
        String checkEmp = request.getParameter("paraMap1@0#CFI_CHECK_EMP");
        String checkTime = request.getParameter("paraMap1@0#CFI_CHECK_TIME");
        String dataAuth = request.getParameter("_DATA_AUTH");

        TableDataMapExt examine = new TableDataMapExt();
        examine.setTableName("T_CO_FAI_INFO");
        examine.getColMap().put("ID", StringUtils.getUUID());
        examine.getColMap().put("CFI_PROJECT_ID", projectId);
        examine.getColMap().put("CFI_MODEL_CODE", modelCode);
        examine.getColMap().put("CFI_PRODUCT_STEP", projectStep);
        examine.getColMap().put("CFI_FAI_NUM", faiNum);
        examine.getColMap().put("CFI_CHECK_RESULT", checkResult);
        examine.getColMap().put("CFI_CHECK_NUM", checkNum);
        examine.getColMap().put("CFI_CHECK_SN", checkSn);
        examine.getColMap().put("CFI_CHECK_CONTENT", checkContent);
        examine.getColMap().put("CFI_CHECK_EMP", checkEmp);
        examine.getColMap().put("CFI_CHECK_TIME", sdf.parse(checkTime));
        if (dataAuth != null && !"".equals(dataAuth))
        {
          examine.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.save(examine);

      }
      catch (Exception e)
      {
        log.error(e);
        throw new BussException(modelAction.getText("新增失败"), e);
      }
      // return modelAction.ajaxTablereloadParentFun(modelAction.getText("新增成功"),formId,iframeId);
      return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
    }
    else
    {
      return modelAction.ajaxTableAlertInfoClear("请不要重复提交表单", "2");
    }
  }
}
