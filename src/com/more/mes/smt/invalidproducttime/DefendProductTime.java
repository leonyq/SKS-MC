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
 * 维护保存无效生产时间。
 *
 */
public class DefendProductTime implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());
  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(request.getSession().getAttribute("mcDataAuth"));
    //String dataAuth = request.getParameter("_DATA_AUTH");
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
      String csiStopType = request.getParameter("paraMapObj.CSI_STOP_TYPE");// 类型
      String csiMaintenance = request.getParameter("paraMapObj.CSI_MAINTENANCE");// 原因
      
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
      editExt.getColMap().put("CSI_MAINTENANCE_TIME", df.parse(nowDate));
      editExt.getColMap().put("CSI_MAINTENANCE_EMP", emp);
      editExt.getColMap().put("CSI_STOP_TYPE", csiStopType);
      editExt.getColMap().put("CSI_MAINTENANCE", csiMaintenance);
      editExt.getColMap().put("CSI_STATUS", "3");
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
      throw new BussException(modelAction.getText("维护失败"), e);
    }
    
    
    
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("维护成功"), "0");
  }

}
