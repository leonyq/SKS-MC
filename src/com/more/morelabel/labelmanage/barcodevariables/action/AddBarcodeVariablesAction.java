package com.more.morelabel.labelmanage.barcodevariables.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import net.sf.json.JSONArray;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.morelabel.labelmanage.barcodevariables.service.BarcodeVariablesDataService;

/**
 * @Title 标签变量及变量值的保存类
 * @Description 标签变量及变量值的保存类
 * @ClassName AddBarcodeVariablesAction
 * @author csh
 * @version 1.0 developer 2017-11-3 created
 * @see AddBarcodeVariablesAction
 * @since 2017-11-3
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class AddBarcodeVariablesAction implements FuncService
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
    String falg = hsr.getParameter("FALG");
    String type = hsr.getParameter("TYPE");
    String name = hsr.getParameter("NAME");
    String figureStr = hsr.getParameter("DISPLAY_VAL_FIGURE");
    String radixStr = hsr.getParameter("DECIMAL_DIGITS");
    String dataId = hsr.getParameter("dataId");
    String newJSON = hsr.getParameter("newJSON");
    String dataAuth =  CommMethodMc.getDataAuthBySession(hsr);
    int figure = 0;
    int radix = 0;
    if (StringUtils.isNotBlank(figureStr))
    {
      figure = StringUtils.toInteger(figureStr);
    }
    if (StringUtils.isNotBlank(radixStr))
    {
      radix = StringUtils.toInteger(radixStr);
    }
    if (StringUtils.isNotBlank(type) && type.equals("radix"))
    {
      type = "1";
    }
    else if (StringUtils.isNotBlank(type) && type.equals("year"))
    {
      type = "2";
    }
    else if (StringUtils.isNotBlank(type) && type.equals("month"))
    {
      type = "3";
    }
    else if (StringUtils.isNotBlank(type) && type.equals("day"))
    {
      type = "4";
    }

    BarcodeVariablesDataService bvDataService = new BarcodeVariablesDataService();
    int count = bvDataService.chackUpId(dataAuth);
    String sign = "N";
    if (count > 0)
    {
      sign = "Y";
    }

    try
    {
      JSONArray newArray = JSONArray.fromObject(newJSON);
      int newSize = newArray.size();
      Map newMap = null;
      Map newValMap = null;
      Map infoValTdMap = null;
      String newValId = null;
      String originalValue = null;
      String displayVal = null;
      int seq = 0;
      TableDataMapExt newTd = null;
      TableDataMapExt newValTd = null;
      TableDataMapExt delInfoValTd = null;

      if (falg.equals("SYS"))
      {
        List bvls = bvDataService.getSysBVListInId(dataId);
        Map bvMap = (Map)bvls.get(0);
        String bvName = StringUtils.toString(bvMap.get("VARIABLE_NAME"));
        int bvRadix = StringUtils.toInteger(bvMap.get("DECIMAL_DIGITS"));
        String bvType = StringUtils.toString(bvMap.get("BARCODE_TYPE"));
        int bvFigure = StringUtils.toInteger(bvMap.get("DISPLAY_VAL_FIGURE"));
        String bvId = StringUtils.getUUID();
        newTd = new TableDataMapExt();
        newMap = newTd.getColMap();
        newTd.setTableName("ML_BARCODE_VARIABLES");
        newMap.put("ID", bvId);
        newMap.put("DEPT_ID", dataAuth);
        newMap.put("DATA_AUTH", dataAuth);
        newMap.put("VARIABLE_NAME", bvName);
        newMap.put("DECIMAL_DIGITS", bvRadix);
        newMap.put("BARCODE_TYPE", Integer.parseInt(bvType));
        newMap.put("DISPLAY_VAL_FIGURE", bvFigure);
        newMap.put("SHARE_SIGN", sign);
        modelService.save(newTd);
        List bvValls = bvDataService.getSysBVValListInId(dataId);
        int len = bvValls.size();
        Map bvValMap = null;
        String bvValId = null;
        String oVal = null;
        String dVal = null;
        int seq_s = 0;
        for (int i = 0; i < len; i++ )
        {
          bvValId = StringUtils.getUUID();
          bvValMap = (Map)bvValls.get(i);
          oVal = StringUtils.toString(bvValMap.get("ORIGINAL_VALUE"));
          dVal = StringUtils.toString(bvValMap.get("DISPLAY_VAL"));
          seq_s = StringUtils.toInteger(bvValMap.get("SEQ"));
          newValTd = new TableDataMapExt();
          infoValTdMap = newValTd.getColMap();
          newValTd.setTableName("ML_BARCODE_VAL");
          infoValTdMap.put("ID", bvValId);
          infoValTdMap.put("DEPT_ID", dataAuth);
          infoValTdMap.put("DATA_AUTH", dataAuth);
          infoValTdMap.put("BV_ID", bvId);
          infoValTdMap.put("ORIGINAL_VALUE", oVal);
          infoValTdMap.put("DISPLAY_VAL", dVal);
          infoValTdMap.put("SEQ", seq_s);
          modelService.save(newValTd);
        }
        String bvIdStr = CommMethod.escapeJs(bvId);
        modelAction.setAjaxString(bvIdStr);
        return BaseActionSupport.AJAX;
      }
      else
      {
        newTd = new TableDataMapExt();
        newMap = newTd.getColMap();
        newTd.setTableName("ML_BARCODE_VARIABLES");
        newMap.put("VARIABLE_NAME", name);
        newMap.put("DEPT_ID", dataAuth);
        newMap.put("DATA_AUTH", dataAuth);
        newMap.put("VARIABLE_NAME", name);
        newMap.put("DECIMAL_DIGITS", radix);
        newMap.put("BARCODE_TYPE", Integer.parseInt(type));
        newMap.put("DISPLAY_VAL_FIGURE", figure);
        if (StringUtils.isBlank(dataId))
        {
          int countName = bvDataService.chackEditBVName(dataAuth, name);
          if (countName > 0)
          {
          	CommMethod.escapeJs(name);
            modelAction.setAjaxString(name);
            return BaseActionSupport.AJAX;
          }
          dataId = StringUtils.getUUID();
          newMap.put("ID", dataId);
          newMap.put("SHARE_SIGN", sign);
          modelService.save(newTd);
        }
        else
        {
          int countName = bvDataService.chackBVName(dataAuth, name, dataId);
          if (countName > 0)
          {
          	CommMethod.escapeJs(name);
            modelAction.setAjaxString(name);
            return BaseActionSupport.AJAX;
          }

          newTd.setSqlWhere(" AND ID ='" + dataId + "' ");
          modelService.edit(newTd);
        }

        // 删除标签下所有变量值
        delInfoValTd = new TableDataMapExt();
        delInfoValTd.setTableName("ML_BARCODE_VAL");
        delInfoValTd.setSqlWhere(" AND BV_ID ='" + dataId + "' ");
        modelService.del(delInfoValTd);

        // 重新插入标签下所有变量值
        for (int x = 0; x < newSize; x++ )
        {
          newValId = StringUtils.getUUID();
          newValMap = (Map)newArray.get(x);
          originalValue = StringUtils.toString(newValMap.get("ORIGINAL_VALUE"));
          displayVal = StringUtils.toString(newValMap.get("DISPLAY_VAL"));
          seq = StringUtils.toInteger(newValMap.get("SEQ"));
          newValTd = new TableDataMapExt();
          infoValTdMap = newValTd.getColMap();
          newValTd.setTableName("ML_BARCODE_VAL");
          infoValTdMap.put("ID", newValId);
          infoValTdMap.put("DEPT_ID", dataAuth);
          infoValTdMap.put("DATA_AUTH", dataAuth);
          infoValTdMap.put("BV_ID", dataId);
          infoValTdMap.put("ORIGINAL_VALUE", originalValue);
          infoValTdMap.put("DISPLAY_VAL", displayVal);
          infoValTdMap.put("SEQ", seq);
          modelService.save(newValTd);
        }
      }
    }
    catch (Exception e)
    {
      throw new BussException(modelAction.getText("保存失败"), e);
    }

    return BaseActionSupport.AJAX;
  }

}
