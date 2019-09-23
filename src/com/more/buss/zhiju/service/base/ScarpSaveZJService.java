package com.more.buss.zhiju.service.base;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 制具 报废-保存
 * @author development
 *
 */
public class ScarpSaveZJService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String scarpTime = DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd HH:mm:ss");
    String scarpId = request.getParameter("scarp_id");
    String cfsScarpType = request.getParameter("paraMap1@0#CFS_SCARP_TYPE");
    String cfsScarpReason = request.getParameter("paraMap1@0#CFS_SCARP_REASON");
    String ctfsTinSn = request.getParameter("paraMap1@0#CTFS_TIN_SN");
    String cfsItemCode = request.getParameter("paraMap1@0#CFS_ITEM_CODE");
    String cfsItemType = request.getParameter("cfs_item_type");

    TableDataMapExt fixScarpInfo = new TableDataMapExt();
    CommMethod.addSysDefCol(fixScarpInfo.getColMap(), modelAction.getUser());
    fixScarpInfo.setTableName("T_CO_FIX_SCARP_INFO");
    fixScarpInfo.getColMap().put("ID", scarpId);
    fixScarpInfo.getColMap().put("CFS_ITEM_CODE", cfsItemCode);
    fixScarpInfo.getColMap().put("CFS_ITEM_TYPE", cfsItemType);
    fixScarpInfo.getColMap().put("CFS_SCARP_MAN", CommMethod.getSessionUser().getName());
    fixScarpInfo.getColMap().put("CFS_SCARP_REASON", cfsScarpReason);
    fixScarpInfo.getColMap().put("CFS_SCARP_TIME",
      DateUtil.parseDate(scarpTime, "yyyy-MM-dd HH:mm:ss"));
    fixScarpInfo.getColMap().put("CFS_SCARP_TYPE", cfsScarpType);
    fixScarpInfo.getColMap().put("CTFS_TIN_SN", ctfsTinSn);
    String dataAuth = request.getParameter("_DATA_AUTH");
    if(dataAuth!=null){
      fixScarpInfo.put("DATA_AUTH", dataAuth);// 组织结构
    } 
    
    List<Object> sqlWList = new ArrayList<Object>();
    sqlWList.add(scarpId);
    TableDataMapExt fixTrue = new TableDataMapExt();// 更新制具信息表
    fixTrue.setTableName("T_CO_FIXTURE_INFO");
    Map<String, String> cfiMap = fixTrue.getColMap();
    fixTrue.setSqlWhere(" and ID=? ");
    fixTrue.setSqlWhereArgs(sqlWList);
    cfiMap.put("CFI_FIX_STATUS", "3");
    
     TableDataMapExt cfo = new TableDataMapExt();// 更新制具信息表
    CommMethod.addSysDefCol(cfo.getColMap(), modelAction.getUser());
    cfo.setTableName("T_CO_FIX_OPERATE_LOG");
    //cfo.getColMap().put("ID", scarpId);
    cfo.getColMap().put("CFO_ITEM_CODE", cfsItemCode);
    cfo.getColMap().put("CFO_ITEM_TYPE", cfsItemType);
    cfo.getColMap().put("CFO_OPEATOR", CommMethod.getSessionUser().getId());
    cfo.getColMap().put("CFO_ITEM_CURUSER",  CommMethod.getSessionUser().getLoginName());
    cfo.getColMap().put("CFO_OPERATE_TIME",
    DateUtil.parseDate(scarpTime, "yyyy-MM-dd HH:mm:ss"));
    cfo.getColMap().put("CFO_OPERATE_TYPE", "4");
    cfo.getColMap().put("CFO_FIX_SN", ctfsTinSn);
    cfo.getColMap().put("CFI_MEMO", cfsScarpReason);
    
    if(dataAuth!=null){
      fixScarpInfo.put("DATA_AUTH", dataAuth);// 组织结构
    } 

    try
    {
      modelService.save(cfo);  
      modelService.save(fixScarpInfo);
      modelService.edit(fixTrue);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("报废失败"), e);
    }
    String iframeId = modelAction.getRequest().getParameter("iframeId");
    String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("报废成功"), isCloseWin);
  }

}
