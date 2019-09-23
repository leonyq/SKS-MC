package com.more.mes.smt.inspection.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 删除时段信息
 * @ClassName DelProTimeService
 * @author csj
 * @Company: morelean
 */
public class DelProTimeService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings({"rawtypes", "unchecked", "static-access"})
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();

    String ids = request.getParameter("ids");
    if (StringUtils.isEmpty(ids)) {
		return modelAction.alertInfo("ID为空");
	}
    String[] idStrs = ids.split(",");

    TableDataMapExt tdMap = new TableDataMapExt();
    tdMap.setTableName("T_QC_INSPECTION_TIME");
    tdMap.setSqlWhere("and ID=?");

    Map<String, String> resultMap = new HashMap<String, String>();

    if (idStrs != null && idStrs.length != 0)
    {
      for (int i = 0; i < idStrs.length; i++ )
      {
        ArrayList delList = new ArrayList();
        delList.add(idStrs[i]);
        tdMap.setSqlWhereArgs(delList);
        try
        {
          modelService.del(tdMap);
          resultMap.put("successMes", "success");
          modelAction.setAjaxMap(resultMap);
        }
        catch (Exception e)
        {
          log.error(e);
          throw new BussException(modelAction.getText("删除失败"), e);
        }
      }
    }
    return modelAction.AJAX;
  }

}
