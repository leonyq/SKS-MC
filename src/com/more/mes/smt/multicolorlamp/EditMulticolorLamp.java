package com.more.mes.smt.multicolorlamp;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ArrayList;

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
 * @Title 多色灯修改类
 * @Description 多色灯修改类
 * @ClassName EditMulticolorLamp
 * @author lyq
 * @version 1.0 developer 2019-01-02 created
 * @see EditMulticolorLamp
 * @since 2019-01-02
 * @Copyright: Copyright (c) 2019
 * @Company: morelean
 */
public class EditMulticolorLamp implements FuncService
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
    String dataId = modelAction.getDataId();
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      String colorSn = request.getParameter("paraMapObj.WML_COLOR_SN");
      String color = request.getParameter("paraMapObj.WML_COLOR");
      String disableFlag = request.getParameter("paraMapObj.WML_DISABLE_FLAG");
      String memo = request.getParameter("paraMapObj.WML_MEMO");
      
      if (disableFlag == null || disableFlag == "" || disableFlag.equals(""))
      {
        disableFlag = "N";
      }

      String sql = "SELECT T.ID FROM T_WMS_MULTI_LIGHT T WHERE T.WML_STATUS='1' AND T.ID=?";
      List<String> list = modelService.listDataSql(sql, new Object[] {dataId});
      if (list != null && !list.isEmpty())
      {
        return modelAction.alertParentInfo(modelAction.getText("该颜色灯使用中"));
      }
 
      // 修改数据
      ArrayList<Object> paraList = new ArrayList<Object>();
      TableDataMapExt cscMap = new TableDataMapExt();
      cscMap.setTableName("T_WMS_MULTI_LIGHT");
      cscMap.setSqlWhere(" and ID = ? ");
      paraList.add(dataId);
      cscMap.setSqlWhereArgs(paraList);
      CommMethod.editSysDefCol(cscMap.getColMap(), modelAction.getUser());
      cscMap.getColMap().put("WML_COLOR", color);
      cscMap.getColMap().put("WML_DISABLE_FLAG", disableFlag);
      cscMap.getColMap().put("WML_MEMO", memo);
 
      if (dataAuth != null)
      {
        cscMap.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.edit(cscMap);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
  }

}
