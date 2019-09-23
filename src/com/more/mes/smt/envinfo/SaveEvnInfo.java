package com.more.mes.smt.envinfo;

import java.util.Date;

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
 * @Description 新增环境信息
 * @ClassName DelParameter
 * @author WZY
 */
public class SaveEvnInfo implements FuncService
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
      String type = request.getParameter("paraMap1@0#CEI_TYPE");

      String ceiRecordContent = request.getParameter("paraMap1@0#CEI_RECORD_CONTENT");

      String ceiAreaSn = request.getParameter("STORAGE_CODE");
      
    //  String caName = request.getParameter("STORAGE_NAME");

      String dataAuth = request.getParameter("_DATA_AUTH");// 组织机构

      String userId = modelAction.getUser().getLoginName();

      Date date = DateUtil.getCurDate();

      TableDataMapExt saveExt = new TableDataMapExt();

      saveExt.setTableName("T_CO_ENV_INFO");

      CommMethod.addSysDefCol(saveExt.getColMap(), modelAction.getUser());

      saveExt.getColMap().put("CEI_TYPE", type);

      saveExt.getColMap().put("CEI_RECORD_CONTENT", ceiRecordContent);

      saveExt.getColMap().put("CEI_AREA_SN", ceiAreaSn);
      
//  saveExt.getColMap().put("T2#CA_NAME", caName);

      saveExt.getColMap().put("CEI_RECORD_EMP", userId);

      saveExt.getColMap().put("CEI_RECORD_TIME", date);
      if (null != dataAuth)
      {
        saveExt.getColMap().put("DATA_AUTH", dataAuth);
      }

      // device.getColMap().put("ID", uuid);
      modelService.save(saveExt);
    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }

    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
  }

}
