package com.more.buss.firstpiece.service;

import java.util.ArrayList;
import java.util.Date;

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
/**
 * 首件检测 审核保存
 * @author development
 *
 */
public class AddExamineResult implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
      String examineResult = request.getParameter("paraMapObj.CFI_EXAMINE_RESULT");
      String examineContent = request.getParameter("paraMapObj.CFI_EXAMINE_CONTENT");
      String examineFaiNum = request.getParameter("myFaiNum");
      int examineFaiNumber=0;
      if(!StringUtils.isBlank(examineFaiNum)){
        examineFaiNumber=Integer.parseInt(examineFaiNum);
      }
      Date nowDate = DateUtil.getCurDate();
      String id = request.getParameter("dataId");
      TableDataMapExt examine = new TableDataMapExt();
      ArrayList<Object> paraList = new ArrayList<Object>();
      examine.setTableName("T_CO_FAI_INFO");
      // examine.setSqlWhere(" and ID='" + id + "'");
      examine.setSqlWhere(" and ID= ? ");
      paraList.add(id);
      examine.setSqlWhereArgs(paraList);
      examine.getColMap().put("CFI_FAI_NUM", examineFaiNumber);
      examine.getColMap().put("CFI_EXAMINE_RESULT", examineResult);
      examine.getColMap().put("CFI_EXAMINE_CONTENT", examineContent);
      examine.getColMap().put("CFI_EXAMINE_EMP", CommMethod.getSessionUser().getId());
      examine.getColMap().put("CFI_EXAMINE_TIME", nowDate);
      if (dataAuth != null)
      {
         examine.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.edit(examine);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("审核失败"), e);
    }
    return modelAction.ajaxTablereloadParentFun(modelAction.getText("审核成功"), formId, iframeId);
  }

}
