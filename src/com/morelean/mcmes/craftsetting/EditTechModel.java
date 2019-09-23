package com.morelean.mcmes.craftsetting;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 工艺信息修改
 * @author Administrator
 *
 */
public class EditTechModel implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());
  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
   //String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    
    String ctId = request.getParameter("ctId");
    String ctName = request.getParameter("paraMapObj.CT_NAME");
    String ctProductStep = request.getParameter("paraMapObj.CT_PRODUCT_STEP");
    String ctProcessFace = request.getParameter("paraMapObj.CT_PROCESS_FACE");
    String ctRouteCode = request.getParameter("paraMapObj.CT_ROUTE_CODE");
    String ctPreposeTech = request.getParameter("paraMapObj.CT_PREPOSE_TECH");
    String ctStationQty = request.getParameter("paraMapObj.CT_STATION_QTY");
    String ctDefaultFlag = request.getParameter("paraMapObj.CT_DEFAULT_FLAG");
    String ctValidFlag = request.getParameter("paraMapObj.CT_VALID_FLAG");
    String ctMemo = request.getParameter("paraMapObj.CT_MEMO"); 
    List<Object> lists = new  ArrayList<Object>();
    String[] code = request.getParameterValues("CI_ITEM_CODE");
    int  count = 0;
      if (StringUtils.isBlank(ctDefaultFlag))
      {
        ctDefaultFlag="N";
      }
      if (StringUtils.isBlank(ctValidFlag))
      {
        ctValidFlag="N";
      }
      if (ctDefaultFlag.equals("Y"))
      {
       String sql="select * from T_CO_TECHNICS where  DATA_AUTH=? and CT_PRODUCT_STEP=? and CT_PROCESS_FACE=?  and CT_DEFAULT_FLAG=? and CT_ID not in(?)  and DATA_AUTH=?  ";
        
       count= modelService.countSql(sql, new Object[]{dataAuth,ctProductStep,ctProcessFace,"Y",ctId,dataAuth});
       
      }
      if (count>0)
      {
        return modelAction.alertParentInfo(modelAction.getText("默认标志已存在"));
      } 
    try
    {
      
      TableDataMapExt tExt = new TableDataMapExt();
      tExt.setTableName("T_CO_TECHNICS");
      CommMethod.editSysDefCol(tExt.getColMap(), modelAction.getUser());
      tExt.getColMap().put("CT_NAME", ctName);
      tExt.getColMap().put("CT_PRODUCT_STEP", ctProductStep);
      tExt.getColMap().put("CT_PROCESS_FACE", ctProcessFace);
      tExt.getColMap().put("CT_ROUTE_CODE", ctRouteCode);
      tExt.getColMap().put("CT_PREPOSE_TECH", ctPreposeTech);
      if (StringUtils.isNotBlank(ctStationQty))
      {
        tExt.getColMap().put("CT_STATION_QTY", Integer.parseInt(ctStationQty));
      }
     
      tExt.getColMap().put("CT_DEFAULT_FLAG", ctDefaultFlag);
      tExt.getColMap().put("CT_VALID_FLAG", ctValidFlag);
      tExt.getColMap().put("CT_MEMO", ctMemo);
      tExt.setSqlWhere(" and CT_ID=? and DATA_AUTH=? ");   
      lists.add(ctId);
      lists.add(dataAuth);
     // lists.add(dataAuth);
      tExt.setSqlWhereArgs(lists);
      if(dataAuth!=null){
        tExt.getColMap().put("DATA_AUTH", dataAuth);
        }
      modelService.edit(tExt);
      
    //先删除对应关联信息
      
        String delSql = "delete from T_CO_TECH_MODEL where CTM_ID=? and DATA_AUTH=? ";      
        modelService.execSql(delSql,new Object[] {ctId,dataAuth});
      
      
      
      TableDataMapExt receive1 = new TableDataMapExt();
      receive1.setTableName("T_CO_TECH_MODEL");
      for (int i = 0; i < code.length; i++ )
      {
        receive1.getColMap().clear();
        CommMethod.addSysDefCol(receive1.getColMap(), modelAction.getUser());
        receive1.getColMap().put("CTM_ID", ctId);
        receive1.getColMap().put("CTM_PROCESS_FACE", ctProcessFace);
        receive1.getColMap().put("CTM_PRODUCT_STEP", ctProductStep);
        receive1.getColMap().put("CTM_MODEL_CODE", code[i]);
        if(dataAuth!=null){
          receive1.getColMap().put("DATA_AUTH", dataAuth);
          }
        modelService.save(receive1);
        
      }
      
      
    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error("修改失败", e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
  }

}
