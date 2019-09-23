package com.more.mes.smt.snconfigure;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 编码生成配置---获取所需的下拉框
 * 
 * @author development
 */
public class AjaxGetNeedSel implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    List<Object> param = new ArrayList<Object>();
    String dataAuth =  request.getParameter("dataAuth");//String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String codeSegentSql = "SELECT T.CODE,T.VALUE VAL FROM SY_DICT_VAL T WHERE T.DICT_CODE='CCD_CODE_SEGMENT' ORDER BY T.CODE";
    List codeSegentList = modelService.listSql(codeSegentSql, null, null, null, null, null);

    String itemValSql1 = "SELECT T.ID AS CODE,T.VARIABLE_NAME VAL FROM ML_BARCODE_VARIABLES T WHERE T.BARCODE_TYPE = '1' ";
    //List itemValList1 = modelService.listDataSql(itemValSql1,new Object[] {dataAuth});
    List itemValList1 = modelService.listDataSql(itemValSql1);

    String itemValSql2 = "SELECT T.ID AS CODE,T.VARIABLE_NAME VAL FROM ML_BARCODE_VARIABLES T WHERE T.BARCODE_TYPE != '1' ";
    List itemValList2 = modelService.listDataSql(itemValSql2);

    String fillTypeSql = "SELECT T.CODE,T.VALUE VAL FROM SY_DICT_VAL T WHERE T.DICT_CODE='CCD_FILL_TYPE' ORDER BY T.CODE";
    List fillTypeList = modelService.listSql(fillTypeSql, null, null, null, null, null);

    Map<Object, Object> map = new HashMap<Object, Object>();
    map.put("codeSegentList", codeSegentList);
    map.put("itemValList1", itemValList1);
    map.put("itemValList2", itemValList2);
    map.put("fillTypeList", fillTypeList);
    modelAction.setAjaxMap(map);
    return BaseActionSupport.AJAX;
  }

}
