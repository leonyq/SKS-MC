package com.more.mes.smt.invalidproducttime;

import java.text.DateFormat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
 * 
 * 无效生产时间--审核保存
 *
 */
public class AuditingProductTime implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());
  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    //String dataAuth = request.getParameter("_DATA_AUTH");
    String dataAuth = String.valueOf(request.getSession().getAttribute("mcDataAuth"));
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    
    
    try
    {
      String id = request.getParameter("id");
      String csiExamineResult = request.getParameter("paraMapObj.CSI_EXAMINE_RESULT");// 结果
      String csiExamineReason = request.getParameter("paraMapObj.CSI_EXAMINE_REASON");// 意见
      
      DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      List<Object> sqlList = new ArrayList<Object>();
      sqlList.add(id);       
      TableDataMapExt editExt = new TableDataMapExt();
      editExt.setTableName("T_CO_STOPLINE_INFO");
      CommMethod.editSysDefCol(editExt.getColMap(), modelAction.getUser());
      //维护时间
      String nowDate = DateUtil.formatDate(DateUtil.getCurDate(), DateUtil.yyyyMMddHHmmss);
      // 维护人
      String emp = CommMethod.getSessionUser().getId();
      editExt.getColMap().put("CSI_EXAMINE_TIME", df.parse(nowDate));
      editExt.getColMap().put("CSI_EXAMINE_EMP", emp);
      if (StringUtils.isNotBlank(csiExamineResult))
      {
        editExt.getColMap().put("CSI_EXAMINE_RESULT", csiExamineResult);
      }
      
      editExt.getColMap().put("CSI_EXAMINE_REASON", csiExamineReason);
      editExt.getColMap().put("CSI_STATUS", "4");
      if (dataAuth != null)
      {
        editExt.getColMap().put("DATA_AUTH", dataAuth);// 组织结构
      }
      editExt.setSqlWhere(" and id = ? ");
      editExt.setSqlWhereArgs(sqlList);
      modelService.edit(editExt);
    }
    catch (Exception e)
    {
      // TODO Auto-generated catch block
      log.error(e);
      throw new BussException(modelAction.getText("审核失败"), e);
    }
    
    
    
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("审核成功"), "0");
  }

}
