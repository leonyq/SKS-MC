package com.more.mes.smt.multicolorlamp;

import java.text.SimpleDateFormat;
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
 * @Title 多色灯新增类
 * @Description 多色灯新增类
 * @ClassName SaveMulticolorLamp
 * @author lyq
 * @version 1.0 developer 2019-01-02 created
 * @see SaveMulticolorLamp
 * @since 2019-01-02
 * @Copyright: Copyright (c) 2019
 * @Company: morelean
 */
public class AddMulticolorLamp implements FuncService
{
  /**
   * @param modelAction
   *          modelAction
   * @param modelService
   *          modelService
   * @return String
   * @see com.more.fw.core.dbo.model.service.impl.base.FuncService#exeFunc(com.more.fw.core.base.core.action.ModelAction,
   *      com.more.fw.core.dbo.model.service.ModelService)
   */
  
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("_DATA_AUTH");
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      String infoId = StringUtils.getUUID();
      String colorSn = request.getParameter("paraMap1@0#WML_COLOR_SN");
      String color = request.getParameter("paraMap1@0#WML_COLOR");
      String disableFlag = request.getParameter("paraMap1@0#WML_DISABLE_FLAG");
      String memo = request.getParameter("paraMap1@0#WML_MEMO");
      
      if (disableFlag == null || disableFlag == "" || disableFlag.equals(""))
      {
        disableFlag = "N";
      }

      String sql = "SELECT T.ID FROM T_WMS_MULTI_LIGHT T WHERE T.WML_COLOR_SN=?";
      List<String> list = modelService.listDataSql(sql, new Object[] {colorSn});
      if (list != null && !list.isEmpty())
      {
        return modelAction.alertParentInfo(modelAction.getText("颜色编码已存在，请更换"));
      }
 
      // 增加数据
      TableDataMapExt cscMap = new TableDataMapExt();
      cscMap.setTableName("T_WMS_MULTI_LIGHT");
      CommMethod.addSysDefCol(cscMap.getColMap(), modelAction.getUser());
      cscMap.getColMap().put("ID", infoId);
      cscMap.getColMap().put("WML_COLOR_SN", colorSn);
      cscMap.getColMap().put("WML_COLOR", color);
      cscMap.getColMap().put("WML_STATUS", "0");
      cscMap.getColMap().put("WML_DISABLE_FLAG", disableFlag);
      cscMap.getColMap().put("WML_MEMO", memo);
 
      if (dataAuth != null)
      {
        cscMap.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.save(cscMap);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
  }

}
