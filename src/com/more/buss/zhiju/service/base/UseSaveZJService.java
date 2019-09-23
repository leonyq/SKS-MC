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
 * 制具-领用
 * @author development
 *
 */
public class UseSaveZJService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String nowDate = DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd HH:mm:ss");
    String cfoFixId = request.getParameter("_cfi_id");
    String cfoFixSn = request.getParameter("paraMap1@0#CFO_FIX_SN");
    String cfoItemCode = request.getParameter("paraMap1@0#CFO_ITEM_CODE");
    String cfoOpeator = request.getParameter("paraMap1@0#CFO_OPEATOR");
    String cfiMemo = request.getParameter("paraMap1@0#CFI_MEMO");    String _ass_type = request.getParameter("_ass_type");
    String item_curuser = request.getParameter("paraMap1@0#CFO_ITEM_CURUSER");
    String loginName=request.getParameter("loginName");
    TableDataMapExt cfo = new TableDataMapExt();
    CommMethod.addSysDefCol(cfo.getColMap(), modelAction.getUser());
    cfo.setTableName("T_CO_FIX_OPERATE_LOG");
    
    //cfo.getColMap().put("ID", cfoFixId);
    cfo.getColMap().put("CFO_FIX_SN", cfoFixSn);
    cfo.getColMap().put("CFO_ITEM_CODE", cfoItemCode);
    cfo.getColMap().put("CFO_FIX_SN", cfoFixSn);
    cfo.getColMap().put("CFO_ITEM_TYPE", _ass_type);
    cfo.getColMap().put("CFO_OPEATOR", cfoOpeator);
    cfo.getColMap().put("CFO_OPERATE_TIME", DateUtil.parseDate(nowDate, "yyyy-MM-dd HH:mm:ss"));
    cfo.getColMap().put("CFI_MEMO", cfiMemo);
    cfo.getColMap().put("CFO_OPERATE_TYPE", "1");
    cfo.getColMap().put("CFO_ITEM_CURUSER", loginName);
    //String dataAuth = request.getParameter("_DATA_AUTH");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    if(dataAuth!=null){
      cfo.put("DATA_AUTH", dataAuth);// 组织结构
    } 
    
    List<Object> sqlWList = new ArrayList<Object>();
    sqlWList.add(cfoFixId);
    TableDataMapExt fixTrue = new TableDataMapExt();// 更新制具信息表
    fixTrue.setTableName("T_CO_FIXTURE_INFO");
    Map<String, String> cfiMap = fixTrue.getColMap();
    fixTrue.setSqlWhere(" and ID=? ");
    fixTrue.setSqlWhereArgs(sqlWList);
    cfiMap.put("CFI_FIX_STATUS", "1");

    try
    {
      modelService.save(cfo);
      modelService.edit(fixTrue);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("领用失败"), e);
    }
    String iframeId = modelAction.getRequest().getParameter("iframeId");
    String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("领用成功"), isCloseWin);
  }

}
