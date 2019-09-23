package com.more.mes.smt.envinfo;

import java.util.Date;
import java.util.ArrayList;

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
 * @Description 修改环境信息
 * @ClassName EditEvnInfo
 * @author WZY
 */
public class EditEvnInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    
    HttpServletRequest request = modelAction.getRequest();
    
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    
    
    try
    {
      String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");// 组织机构
      
      String dataId =  request.getParameter("id");
      
      String  type = request.getParameter("paraMapObj.CEI_TYPE");
      
      String ceiAreaSn = request.getParameter("paraMapObj.CEI_AREA_SN");
      
      //String areaName = request.getParameter("AREA_NAME");
      
      String ceiRecordContent = request.getParameter("paraMapObj.CEI_RECORD_CONTENT");
      
      String userId = modelAction.getUser().getLoginName();
      
      Date date = DateUtil.getCurDate();
      
      
      TableDataMapExt saveExt = new TableDataMapExt();

      saveExt.setTableName("T_CO_ENV_INFO");

      CommMethod.editSysDefCol(saveExt.getColMap(), modelAction.getUser());

      saveExt.getColMap().put("CEI_TYPE", type);

      saveExt.getColMap().put("CEI_RECORD_CONTENT", ceiRecordContent);

      saveExt.getColMap().put("CEI_AREA_SN", ceiAreaSn);

      //saveExt.getColMap().put("CA_NAME", areaName);
      
      saveExt.getColMap().put("CEI_RECORD_EMP", userId);
      
      saveExt.getColMap().put("CEI_RECORD_TIME", date);

       
      if (null != dataAuth)
      {
        saveExt.getColMap().put("DATA_AUTH", dataAuth);
      }
      

       ArrayList<Object> paraList=new ArrayList<Object>();
       saveExt.setSqlWhere(" and id= ? ");
       paraList.add(dataId);
       saveExt.setSqlWhereArgs(paraList);
      
       modelService.edit(saveExt);
      
    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }

    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
  
  }

}
