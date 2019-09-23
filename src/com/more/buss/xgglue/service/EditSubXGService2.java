package com.more.buss.xgglue.service;

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
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 辅料信息 修改保存
 * @author development
 *
 */
public class EditSubXGService2 implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {

    HttpServletRequest request = modelAction.getRequest();
    List<Object> sqlList = new ArrayList<Object>();
    TableDataMapExt td = new TableDataMapExt();
    String infoId = modelAction.getDataId();
    String ctInstockDoc = request.getParameter("paraMapObj.CTI_INSTOCK_DOC");// 入库单号
    String ctiWeight = request.getParameter("paraMapObj.CTI_WEIGHT");// 重量
    String storageCode = request.getParameter("STORAGE_CODE");// 库位
    String ctiProductDate = modelAction.getRequest().getParameter("paraMapObj.CTI_PRODUCT_DATE");// 生产日期
    String ctiQulityDate = modelAction.getRequest().getParameter("paraMapObj.CTI_QULITY_DATE");// 保质期
    String ctiReflowTime = modelAction.getRequest().getParameter("paraMapObj.CTI_REFLOW_TIME");// 过炉时间
    String ctiThawingCycle = modelAction.getRequest().getParameter("paraMapObj.CTI_THAWING_CYCLE");// 回温时间
    String ctiQulityDateOpen = modelAction.getRequest().getParameter("paraMapObj.CTI_QULITY_DATE_OPEN");// 开罐保质期
    String ctiThawingTimeMax = modelAction.getRequest().getParameter("paraMapObj.CTI_THAWING_TIME_MAX");// 回温次数上限
    String ctiMixTime = modelAction.getRequest().getParameter("paraMapObj.CTI_MIX_TIME");// 搅拌时间
    String ctiThawingDecay = modelAction.getRequest().getParameter("paraMapObj.CTI_THAWING_DECAY");// 回温衰减
    String ctiThawingMaxCycle = modelAction.getRequest().getParameter("paraMapObj.CTI_THAWING_MAX_CYCLE");// 回温上限时间
    String ctiMixMaxTime = modelAction.getRequest().getParameter("paraMapObj.CTI_MIX_MAX_TIME");// 搅拌上限时间
    
    // 状态
    // String ctiTinStatus=request.getParameter("CTI_TIN_STATUS");
    // 标志
    String ctiRohsFlag = request.getParameter("paraMapObj.CTI_ROHS_FLAG");

    String ctiMemo = request.getParameter("paraMapObj.CTI_MEMO");// 备注
    @SuppressWarnings("unchecked")
    Map<String, Object> calMap = td.getColMap();

    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    calMap.put("DATA_AUTH", dataAuth);// 组织结构
    td.setTableName("T_CO_TIN_INFO");
    sqlList.add(infoId);
    td.setSqlWhere(" and ID=? ");
    td.setSqlWhereArgs(sqlList);
    calMap.put("CTI_INSTOCK_DOC", ctInstockDoc);
    calMap.put("CTI_PRODUCT_DATE", DateUtil.parseDate(ctiProductDate));
    calMap.put("CTI_STOCK_SN", storageCode);
    calMap.put("CTI_QULITY_DATE",ctiQulityDate.equals("")?null:Double.valueOf(ctiQulityDate));
    calMap.put("CTI_REFLOW_TIME", ctiReflowTime.equals("")?null:Double.valueOf(ctiReflowTime));
    calMap.put("CTI_THAWING_CYCLE", ctiThawingCycle.equals("")?null:Double.valueOf(ctiThawingCycle));
    calMap.put("CTI_QULITY_DATE_OPEN", ctiQulityDateOpen.equals("")?null:Double.valueOf(ctiQulityDateOpen));
    calMap.put("CTI_THAWING_TIME_MAX", ctiThawingTimeMax);
    calMap.put("CTI_MIX_TIME", ctiMixTime.equals("")?null:Double.valueOf(ctiMixTime));
    calMap.put("CTI_THAWING_DECAY", ctiThawingDecay.equals("")?null:Double.valueOf(ctiThawingDecay));
    calMap.put("CTI_THAWING_MAX_CYCLE", ctiThawingMaxCycle.equals("")?null:Double.valueOf(ctiThawingMaxCycle));
    calMap.put("CTI_MIX_MAX_TIME", ctiMixMaxTime.equals("")?null:Double.valueOf(ctiMixMaxTime));
    calMap.put("CTI_WEIGHT", Double.valueOf(ctiWeight));
    if (ctiMemo.equals(""))
    {
      calMap.put("CTI_MEMO", "");
    }
    else
    {
      calMap.put("CTI_MEMO", ctiMemo);
    }

    if (!"Y".equals(ctiRohsFlag))
    {
      calMap.put("CTI_ROHS_FLAG", "N");
    }
    else
    {
      calMap.put("CTI_ROHS_FLAG", ctiRohsFlag);
    }
    try
    {
      modelService.edit(td);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }

    String iframeId = request.getParameter("iframeId");
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");

    // return modelAction.reloadParent(modelAction.getText("修改成功"));
  }

}
