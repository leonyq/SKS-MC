package com.more.morelabel.labelmanage.barcodevariables.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.CommMethodMc;

/**
 * @Title 删除标签变量
 * @Description 删除标签变量
 * @ClassName DelBarcodeVariablesAction
 * @author csh
 * @version 1.0 developer 2017-11-3 created
 * @see DelBarcodeVariablesAction
 * @since 2017-11-3
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class DelBarcodeVariablesAction implements FuncService
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

  @SuppressWarnings("unchecked")
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest hsr = modelAction.getRequest();
    String delId =  hsr.getParameter("delId");//CommMethodMc.getDataAuthBySession(hsr);
    try
    {
      //String sql = "select 1 from Ml_Barcode_Data_Items t where t.item_type in (3,4) and t.item_value = ?";
      //List subList = modelService.listDataSql(sql, new Object[] {delId});

      //if (subList != null && !subList.isEmpty())
      //{
      //  modelAction.setAjaxString("NG");
      //  return modelAction.AJAX;

      //}
      
      // 如果某个条码配置已引用 则无法删除 先注释
      String sql = "SELECT T.ID FROM T_CO_SN_CONFIGURE_DETAIL T WHERE T.CCD_ITEM_VALUE=?";
      List subList = modelService.listDataSql(sql, new Object[] {delId});

      if (subList != null && !subList.isEmpty())
      {
        modelAction.setAjaxString("NG");
        return BaseActionSupport.AJAX;

      }
      List whereLs = new ArrayList<String>();
      whereLs.add(delId);
      TableDataMapExt barcodeTd = new TableDataMapExt();
      barcodeTd.setTableName("ML_BARCODE_VARIABLES");
      barcodeTd.setSqlWhere(" AND ID = ? ");
      barcodeTd.setSqlWhereArgs(whereLs);
      modelService.del(barcodeTd);
      TableDataMapExt valTd = new TableDataMapExt();
      valTd.setTableName("ML_BARCODE_VAL");
      valTd.setSqlWhere(" AND BV_ID = ? ");
      valTd.setSqlWhereArgs(whereLs);
      modelService.del(valTd);

    }
    catch (Exception e)
    {
      throw new BussException(modelAction.getText("删除失败"), e);
    }

    return BaseActionSupport.AJAX;
  }
}
