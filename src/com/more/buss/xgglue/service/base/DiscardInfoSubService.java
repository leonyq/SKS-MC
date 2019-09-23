package com.more.buss.xgglue.service.base;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
 * 保存
 * @author development
 *
 */
public class DiscardInfoSubService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {

    HttpServletRequest request = modelAction.getRequest();
    String tinId = request.getParameter("ctiId");
    String tinSn = request.getParameter("paraMapObj.CTS_TIN_SN");
    String itemCode = request.getParameter("item_code");
    String suppCode = request.getParameter("scardSuppCode");
    String scarpType = request.getParameter("paraMapObj.CTS_SCARP_TYPE");
    String scarpReason = request.getParameter("paraMapObj.CTS_SCARP_REASON");
    String curUser = request.getParameter("curUser");
    String scarpTime = DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd HH:mm:ss");
    // String scarpTime = request.getParameter("scarpTime");
    String assisType = request.getParameter("assisType");
    String ctiLot = request.getParameter("ctiLot");

    TableDataMapExt scardInfo = new TableDataMapExt();
    scardInfo.setTableName("T_CO_TIN_SCARP_INFO");// 获取报废表
    CommMethod.addSysDefCol(scardInfo.getColMap(), modelAction.getUser());
    scardInfo.getColMap().put("ID", tinId);
    scardInfo.getColMap().put("DATA_AUTH", CommMethod.getSessionUser().getDeptId());
    scardInfo.getColMap().put("CTS_TIN_SN", tinSn);
    scardInfo.getColMap().put("CTS_ITEM_CODE", itemCode);
    scardInfo.getColMap().put("CTS_SUPPLIER_CODE", suppCode);
    scardInfo.getColMap().put("CTS_SCARP_TYPE", scarpType);
    scardInfo.getColMap().put("CTS_SCARP_REASON", scarpReason);
    scardInfo.getColMap().put("CTS_SCARP_MAN", curUser);
    scardInfo.getColMap().put("CTS_SCARP_TIME",
      DateUtil.parseDate(scarpTime, "yyyy-MM-dd HH:mm:ss"));
    scardInfo.getColMap().put("CTS_ITEM_TYPE", assisType);
    scardInfo.getColMap().put("CTS_LOT", ctiLot);
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    if (dataAuth != null)
    {
      scardInfo.getColMap().put("DATA_AUTH", dataAuth);// 组织结构
    }

    modelService.save(scardInfo);// 将信息添加到报废表
    List<Object> sqlWList = new ArrayList<Object>();
    sqlWList.add(tinId);
    TableDataMapExt tinInfo = new TableDataMapExt();// 获取辅料表
    tinInfo.setTableName("T_CO_TIN_INFO");
    tinInfo.setSqlWhere(" and ID= ? ");
    tinInfo.setSqlWhereArgs(sqlWList);
    Map<String, String> calmap = tinInfo.getColMap();
    calmap.put("CTI_TIN_STATUS", "6");

    try
    {
      modelService.edit(tinInfo);// 更新辅料表
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("更新失败"), e);
    }
    TableDataMapExt operateLog = new TableDataMapExt();// 获取履历表
    try
    {
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	operateLog.setTableName("T_CO_TIN_OPERATE_LOG");
      CommMethod.addSysDefCol(operateLog.getColMap(), modelAction.getUser());
      operateLog.getColMap().put("CTO_TIN_SN", tinSn);
     // operateLog.getColMap().put("DATA_AUTH", CommMethod.getSessionUser().getDeptId());
      operateLog.getColMap().put("CTO_OPERATE_TYPE", "6");
      operateLog.getColMap().put("CTO_OPERATE_TIME", sdf.parse(sdf.format(new Date())));
      operateLog.getColMap().put("CTO_OPEATOR", CommMethod.getSessionUser().getId());
      operateLog.getColMap().put("CTO_TIN_CODEE", itemCode);
      operateLog.getColMap().put("CTO_ITEM_TYPE", assisType);
        modelService.save(operateLog);// 保存辅料履历表
    }
      catch (Exception e)
      {
        log.error(e);
        throw new BussException(modelAction.getText("增加失败"), e);
      }
    String iframeId = request.getParameter("iframeId");
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("报废成功"), "0");
    // return modelAction.commAjaxFunClassLoadParent(formId, iframeId, Constants.SUCCESS,
    // Constants.OPERATE_TYPE_ADD);
  }

}
