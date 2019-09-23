package com.more.mes.smt.inspection.service.oracle;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 巡检报警解除
 * @ClassName RelieveInfoService
 * @author csj
 * @Company: morelean
 */
public class RelieveInfoService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("_DATA_AUTH");
    TableDataMapExt tdMap = new TableDataMapExt();
    tdMap.setTableName("T_QC_WARNING_LOG");
    tdMap.setSqlWhere("and ID=? ");
    String infoId = modelAction.getDataId();
    ArrayList list = new ArrayList();
    list.add(infoId);
    tdMap.setSqlWhereArgs(list);

    Map<String, Object> reMap = RelieveInfoService.getParameters(modelAction);
    Map<String, Object> map = tdMap.getColMap();
    String closer = (String)reMap.get("QWL_CLOSER");
    Date closeTime = DateUtil.parseDate((String)reMap.get("QWL_CLOSE_TIME"), "yyyy-MM-dd hh:mm:ss");
    String reason = (String)reMap.get("QWL_REASON");
    String solution = (String)reMap.get("QWL_SOLUTION");
    String remark = (String)reMap.get("QWL_REMARK");
    String status = (String)reMap.get("QWL_STATUS");

    map.put("QWL_CLOSER", closer);
    map.put("QWL_CLOSE_TIME", closeTime);
    map.put("QWL_REASON", reason);
    map.put("QWL_SOLUTION", solution);
    map.put("QWL_REMARK", remark);
    map.put("QWL_STATUS", status);
    if (dataAuth != null)
    {
       map.put("DATA_AUTH", dataAuth);
    }
    try
    {
      modelService.edit(tdMap);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("保存失败"), e);
    }
    TableDataMapExt delMap = new TableDataMapExt();
    delMap.setTableName("T_CO_DEVICE_SINGEL");
    delMap.setSqlWhere("and CDS_ID=?");
    ArrayList delList = new ArrayList();
    delList.add(infoId);
    delMap.setSqlWhereArgs(delList);
    try
    {
      modelService.del(delMap);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("删除失败"), e);
    }
    // 保存并关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");

    return modelAction.commAjaxFunClassLoadParent(formId, iframeId, Constants.SUCCESS,
      Constants.OPERATE_TYPE_EDIT);
  }

  public static Map<String, Object> getParameters(ModelAction modelAction)
  {
    Map<String, Object> reMap = new HashMap<String, Object>();

    HttpServletRequest requert = modelAction.getRequest();
    String closer = requert.getParameter("paraMapObj.QWL_CLOSER");
    String closeTime = requert.getParameter("paraMapObj.QWL_CLOSE_TIME");
    String reason = requert.getParameter("paraMapObj.QWL_REASON");
    String solution = requert.getParameter("paraMapObj.QWL_SOLUTION");
    String remark = requert.getParameter("paraMapObj.QWL_REMARK");

    reMap.put("QWL_CLOSER", closer);
    reMap.put("QWL_CLOSE_TIME", closeTime);
    reMap.put("QWL_REASON", reason);
    reMap.put("QWL_SOLUTION", solution);
    reMap.put("QWL_REMARK", remark);
    reMap.put("QWL_STATUS", "Y");

    return reMap;
  }

}
