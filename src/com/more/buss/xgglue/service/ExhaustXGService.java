/*
 * @File ExhaustXGService.java
 * @Package com.more.buss.xgglue.service
 * @Copyinght Copyright (c) 2019
 * @Company morelean
 * @author csj
 * @date 2019-3-26 下午2:05:55
 * @version V1.0
 */

package com.more.buss.xgglue.service;

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
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class ExhaustXGService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String infoId = modelAction.getDataId();
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    try
    {
      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

      List list = new ArrayList();
      String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
      String memo = request.getParameter("paraMapObj_CTI_MEMO");
      TableDataMapExt map = new TableDataMapExt();
      CommMethod.editSysDefCol(map.getColMap(), modelAction.getUser());
      map.setTableName("T_CO_TIN_INFO");
      map.setSqlWhere("and ID=?");
      list.add(infoId);
      map.setSqlWhereArgs(list);

      map.getColMap().put("CTI_MEMO", memo);
      map.getColMap().put("CTI_TIN_STATUS", "10");
      map.getColMap().put("DATA_AUTH", dataAuth);
      modelService.edit(map);

      String sql = "select t.* from T_CO_TIN_INFO t where t.ID=?";// 查看报废表中是否存在这条数据
      List<Map<String, String>> list2 = modelService.listDataSql(sql, new Object[] {infoId});
      TableDataMapExt map2 = new TableDataMapExt();
      CommMethod.addSysDefCol(map2.getColMap(), modelAction.getUser());
      map2.setTableName("T_CO_TIN_OPERATE_LOG");
      map2.getColMap().put("CTO_TIN_SN", list2.get(0).get("CTI_TIN_SN"));
      map2.getColMap().put("CTO_OPERATE_TYPE", "10");
      map2.getColMap().put("CTO_OPERATE_TIME", sdf1.parse(sdf1.format(new Date())));
      map2.getColMap().put("CTO_OPEATOR", CommMethod.getSessionUser().getId());
      map2.getColMap().put("CTO_TIN_CODEE", list2.get(0).get("CTI_ITEM_CODE"));
      map2.getColMap().put("CTO_ITEM_TYPE", list2.get(0).get("CTI_ITEM_TYPE"));
      map2.getColMap().put("DATA_AUTH", dataAuth);
      modelService.save(map2);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("耗尽失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("耗尽成功"), "0");
  }
}
