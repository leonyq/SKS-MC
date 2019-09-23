package com.more.mes.smt.parameter;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.ibm.pkcs11.l;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * @Description 参数配置-参数设置-修改
 * @ClassName AddFuncInfo
 * @author WZY
 */
public class EditConfiguration implements FuncService
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
   // String iframeId = request.getParameter("iframeId");
    String iframeIds = request.getParameter("iframeIds");
    
    try
    {
      String[] vrClass = request.getParameterValues("VR_CLASS");
      String[] vrItem = request.getParameterValues("VR_ITEM");
      String[] vrDesc = request.getParameterValues("VR_DESC");
      String[] vrValue = request.getParameterValues("VR_VALUE");
      
      TableDataMapExt editExt  = new TableDataMapExt();
      editExt.setTableName("T_SYS_PARAMETER_INI");
      
      if (vrClass.length>0)
      {
        int leng = vrClass.length;
        
        for (int i = 0; i < leng; i++ )
        {
           editExt.getColMap().clear();
           editExt.getColMap().put("VR_ITEM", vrItem[i]);
           editExt.getColMap().put("VR_DESC", vrDesc[i]);
           editExt.getColMap().put("VR_VALUE", vrValue[i]);
           
           editExt.setSqlWhere(" and VR_CLASS =:VR_CLASS");
           
           
           List list = new ArrayList();
           list.clear();
           list.add(vrClass[i]);
           editExt.setSqlWhereArgs(list);
           modelService.edit(editExt);
        }
        
      }
    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error("参数设置", e);
     // throw new BussException(modelAction.getText("修改失败"), e);
        throw new BussException(modelAction.getText("修改失败"),e);
    }

    return modelAction.reloadIframeByIds(iframeIds, modelAction.getText("修改成功"), "0");
  }

}
