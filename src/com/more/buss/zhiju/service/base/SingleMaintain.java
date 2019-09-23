package com.more.buss.zhiju.service.base;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import bsh.This;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 制具保养 单个保存
 * @author development
 *
 */
public class SingleMaintain implements FuncService
{
  
  private final Log log = LogFactory.getLog(This.class);
  
  @SuppressWarnings({"unused", "unchecked"})
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    
    String isCloseWin = request.getParameter("isCloseWin");
    
    String cfmFixSn = request.getParameter("cfmFixSn");
    
    String cfmItemCode = request.getParameter("paraMap1@0#CFM_ITEM_CODE");
    
    String cfmItemName = request.getParameter("paraMap1@0#CFM_ITEM_NAME");
    
    String cfmAssistanttoolSpec = request.getParameter("paraMap1@0#CFM_ASSISTANTTOOLSPEC");
    
    String cfmType = request.getParameter("paraMap1@0#CFM_TYPE");
    
    String cfmEcCode = request.getParameter("paraMap1@0#CFM_EC_CODE");
    
   // String cfmDesc = request.getParameter("paraMap1@0#CFM_DESC");
    
    String cfmMtMan = request.getParameter("paraMap1@0#CFM_MT_MAN");
    
    String cfmAudit = request.getParameter("paraMap1@0#CFM_AUDIT");
    
    String cfmReporter = request.getParameter("paraMap1@0#CFM_REPORTER");
    
    String cfmLeftTop = request.getParameter("paraMap1@0#CFM_LEFT_TOP");
    
    String cfmRightTop = request.getParameter("paraMap1@0#CFM_RIGHT_TOP");
    
    String cfmLeftLower = request.getParameter("paraMap1@0#CFM_LEFT_LOWER");
    
    String cfmRightLower = request.getParameter("paraMap1@0#CFM_RIGHT_LOWER");
    
    String cfmMiddle = request.getParameter("paraMap1@0#CFM_MIDDLE");
    
    int RightTop = Integer.valueOf(cfmRightTop).intValue();
    int LeftTop = Integer.valueOf(cfmLeftTop).intValue();
    int Middle = Integer.valueOf(cfmMiddle).intValue();
    int LeftLower = Integer.valueOf(cfmLeftLower).intValue();
    int RightLower = Integer.valueOf(cfmRightLower).intValue();
    int[] a =new int[]{RightTop,LeftLower,RightLower,LeftTop,Middle};
    Arrays.sort(a);
    int strainDis =a[4]-a[0];
    String cfiStrainDis = strainDis+"";//张力差异
  
    
   String cfmTinckness = request.getParameter("paraMap1@0#CFM_TINCKNESS");
    
    if (cfmTinckness=="")
    {
      cfmTinckness="0";
    }
    
    String cfmFlatness = request.getParameter("paraMap1@0#CFM_FLATNESS");
    
    if (cfmFlatness=="")
    {
      cfmFlatness="0";
    }
    
    String cfmDefectRemark = request.getParameter("paraMap1@0#CFM_DEFECT_REMARK");
    
    String type = request.getParameter("_cfi_item_type");
    
    String dataAuth = request.getParameter("_DATA_AUTH");
    
    TableDataMapExt fixMain = new TableDataMapExt();
    fixMain.setTableName("T_CO_FIX_MAINTENANCE");// 制具保养维护信息表

    String nowDate = DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd HH:mm:ss");
    
    fixMain.getColMap().put("CFM_FIX_SN", cfmFixSn);
    fixMain.getColMap().put("CFM_ITEM_CODE", cfmItemCode);
    fixMain.getColMap().put("CFM_ITEM_NAME", cfmItemName);
    fixMain.getColMap().put("CFM_ASSISTANTTOOLSPEC", cfmAssistanttoolSpec);
    fixMain.getColMap().put("CFM_TYPE", cfmType);
    fixMain.getColMap().put("CFM_EC_CODE", cfmEcCode);
    fixMain.getColMap().put("CFM_MT_MAN", cfmMtMan);
    fixMain.getColMap().put("CFM_AUDIT", cfmAudit);
    fixMain.getColMap().put("CFM_REPORTER", cfmReporter);
    fixMain.getColMap().put("CFM_LEFT_TOP", LeftTop);
    fixMain.getColMap().put("CFM_LEFT_LOWER", LeftLower);
    fixMain.getColMap().put("CFM_RIGHT_LOWER", RightLower);
    fixMain.getColMap().put("CFM_RIGHT_TOP", RightTop);
    fixMain.getColMap().put("CFM_MIDDLE", Middle);
    fixMain.getColMap().put("CFM_STRAIN_DIS", strainDis);
    fixMain.getColMap().put("CFM_TINCKNESS", Double.valueOf(cfmTinckness));
    fixMain.getColMap().put("CFM_FLATNESS", Double.valueOf(cfmFlatness));
    fixMain.getColMap().put("CFM_DEFECT_REMARK", cfmDefectRemark);
    fixMain.getColMap().put("CFM_ITEM_TYPE", type);
    fixMain.getColMap().put("CFM_MT_TIME", DateUtil.parseDate(nowDate, "yyyy-MM-dd HH:mm:ss"));
    fixMain.getColMap().put("ID", StringUtils.getUUID());
    if (dataAuth != null)
    {
      fixMain.getColMap().put("DATA_AUTH", dataAuth);
    }
    List<Object> sqlWhList = new ArrayList<Object>();
    sqlWhList.add(cfmFixSn);
    TableDataMapExt fixInfo = new TableDataMapExt();
    fixInfo.setTableName("T_CO_FIXTURE_INFO");// 制具信息表
    fixInfo.setSqlWhere(" and CFI_FIX_SN= ?");
    fixInfo.setSqlWhereArgs(sqlWhList);
    fixInfo.getColMap().put("CFI_NOW_USAGE", 0);
    fixInfo.getColMap().put("CFI_MT_DATE", DateUtil.parseDate(nowDate, "yyyy-MM-dd HH:mm:ss"));
    fixInfo.getColMap().put("CFI_LEFT_TOP", LeftTop);
    fixInfo.getColMap().put("CFI_LEFT_LOWER", LeftLower);
    fixInfo.getColMap().put("CFI_RIGHT_LOWER", RightLower);
    fixInfo.getColMap().put("CFI_RIGHT_TOP", RightTop);
    fixInfo.getColMap().put("CFI_MIDDLE", Middle);
    fixInfo.getColMap().put("CFI_STRAIN_DIS", strainDis);
    fixInfo.getColMap().put("CFI_TINCKNESS", Double.valueOf(cfmTinckness));
    fixInfo.getColMap().put("CFI_FLATNESS", Double.valueOf(cfmFlatness));
    
    try
    {
      modelService.save(fixMain);
      modelService.edit(fixInfo);
    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error(e);
      throw new BussException(modelAction.getText("保养维修失败"), e);
      
    }
    

    String iframeId = request.getParameter("iframeId");
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), isCloseWin);
  }

}
