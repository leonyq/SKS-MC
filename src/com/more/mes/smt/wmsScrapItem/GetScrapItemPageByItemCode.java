package com.more.mes.smt.wmsScrapItem;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 根据选择的入库单的物料料号获取入库详细信息 分页
 * 
 * @author development
 */
public class GetScrapItemPageByItemCode implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    String itemId = modelAction.getParaMap().get("itemId");// 报废单id
    String itemCode = modelAction.getParaMap().get("itemCode");// 物料料号
    String itemSN = modelAction.getParaMap().get("itemSN");// 物料SN
    String dataAuth = modelAction.getParaMap().get("dataAuth");// 组织机构
    String docNum = modelAction.getParaMap().get("docNum");// 报废单号
    String sql = "SELECT T.WSD_ITEM_SN   ITEM_SN, " + " T.WSD_ITEM_CODE ITEM_CODE, "
                 + " T2.CI_ITEM_NAME ITEM_NAME, " + " T2.CI_ITEM_SPEC ITEM_SPEC, "
                 + " T.WSD_SCARP_NUM ITEM_NUM " + " FROM T_WMS_SCARP_DETAIL T "
                 + " LEFT JOIN T_WMS_SCARP_DOC T1 " + " ON T.WSD_DOC_NUM = T1.WSD_DOC_NUM "
                 + " LEFT JOIN T_CO_ITEM T2 " + " ON T.WSD_ITEM_CODE = T2.CI_ITEM_CODE";
    String sqlWhere = "";
    if (StringUtils.isNotBlank(itemId))
    {
      sqlWhere += " AND T1.ID = '" + itemId + "'";
    }
    if (StringUtils.isNotBlank(itemCode))
    {
      sqlWhere += " AND T.WSD_ITEM_CODE = '" + itemCode + "'";
    }
    if (StringUtils.isNotBlank(dataAuth))
    {
      sqlWhere += " AND T.DATA_AUTH = '" + dataAuth + "'";
    }
    if (StringUtils.isNotBlank(docNum))
    {
      sqlWhere += " AND T.WSD_DOC_NUM like '%" + docNum + "%'";
    }
    if (StringUtils.isNotBlank(itemSN))
    {
      sqlWhere += " AND T.WSD_ITEM_SN = '" + itemSN + "'";
    }
    List poList = modelService.listSql(sql, modelAction.getPage(), sqlWhere, null, null, null);
    modelAction.setAjaxPage(modelAction.getPage());
    modelAction.getAjaxPage().setDataList(poList);
    return BaseActionSupport.AJAX;
  }

}
