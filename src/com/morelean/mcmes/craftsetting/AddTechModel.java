package com.morelean.mcmes.craftsetting;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 新增工艺信息
 * @author Administrator
 *
 */
public class AddTechModel implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());
  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modService)
  {
    // TODO Auto-generated method stub
    
    HttpServletRequest request = modelAction.getRequest();
    //String dataAuth = request.getParameter("_DATA_AUTH");
   
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    //String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    String isclosewin = request.getParameter("isCloseWin");
    String formid = request.getParameter("formId");
    if (null == formid)
    {
      formid = request.getParameter("formIds");
    }

    String iframeId = request.getParameter("iframeId");
     //String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    
    
    String ctId = request.getParameter("paraMap1@0#CT_ID");
    String ctName = request.getParameter("paraMap1@0#CT_NAME");
    String ctProductStep = request.getParameter("paraMap1@0#CT_PRODUCT_STEP");
    String ctProcessFace = request.getParameter("paraMap1@0#CT_PROCESS_FACE");
    String ctRouteCode = request.getParameter("paraMap1@0#CT_ROUTE_CODE");
    String ctPreposeTech = request.getParameter("paraMap1@0#CT_PREPOSE_TECH");
    String ctStationQty = request.getParameter("paraMap1@0#CT_STATION_QTY");
    String ctDefaultFlag = request.getParameter("paraMap1@0#CT_DEFAULT_FLAG");
    String ctValidFlag = request.getParameter("paraMap1@0#CT_VALID_FLAG");
    String ctMemo = request.getParameter("paraMap1@0#CT_MEMO");
    String createTime = request.getParameter("paraMap1@0#CREATE_TIME");
    
    
    try
    {
        
      String sql="select * from T_CO_TECHNICS where CT_ID=? and DATA_AUTH=?  ";
      
      int count = modService.countSql(sql, new Object[]{ctId,dataAuth});
      
      if (count>0)
      {
        return modelAction.alertParentInfo(modelAction.getText("工艺代码已存在"));
      }
      
      String[] code = request.getParameterValues("CI_ITEM_CODE");
      if (StringUtils.isBlank(ctDefaultFlag))
      {
        ctDefaultFlag="N";
      }else {
        ctDefaultFlag="Y";
      }
      if (StringUtils.isBlank(ctValidFlag))
      {
        ctValidFlag="N";
      }else {
        ctValidFlag="Y";
      }
      
      
      if (ctDefaultFlag.equals("Y"))
      {
        sql="select * from T_CO_TECHNICS where CT_PRODUCT_STEP=? and CT_PROCESS_FACE=?  and CT_DEFAULT_FLAG=? and DATA_AUTH=? ";
        
        count = modService.countSql(sql, new Object[]{ctProductStep,ctProcessFace,"Y",dataAuth});
        
      }
      if (count>0)
      {
        return modelAction.alertParentInfo(modelAction.getText("默认标志已存在"));
      } 
      
      TableDataMapExt tExt = new TableDataMapExt();
      tExt.setTableName("T_CO_TECHNICS");
      CommMethod.addSysDefCol(tExt.getColMap(), modelAction.getUser());
      tExt.getColMap().put("CT_ID", ctId);
      tExt.getColMap().put("CT_NAME", ctName);
      tExt.getColMap().put("CT_PRODUCT_STEP", ctProductStep);
      tExt.getColMap().put("CT_PROCESS_FACE", ctProcessFace);
      tExt.getColMap().put("CT_ROUTE_CODE", ctRouteCode);
      tExt.getColMap().put("CT_PREPOSE_TECH", ctPreposeTech);
      tExt.getColMap().put("CREATE_TIME", sdf.parse(sdf.format(new Date())));
      if (StringUtils.isNotBlank(ctStationQty))
      {
        tExt.getColMap().put("CT_STATION_QTY", Integer.parseInt(ctStationQty));
      }
      
      tExt.getColMap().put("CT_DEFAULT_FLAG", ctDefaultFlag);
      tExt.getColMap().put("CT_VALID_FLAG", ctValidFlag);
      tExt.getColMap().put("CT_MEMO", ctMemo);
      if(dataAuth!=null){
        tExt.getColMap().put("DATA_AUTH", dataAuth);
        }
      modService.save(tExt);
      
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
        modService.save(receive1);
        
      }
      
      
    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error("新增失败", e);
      
      throw new BussException(modelAction.getText("新增失败"), e);
    }
    
    
    
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isclosewin);
  }

}
