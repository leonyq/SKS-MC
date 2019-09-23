package com.more.mes.smt.modelchecked;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 机种检测项目 检测项目弹窗
 * @author development
 *
 */
public class AddProjectItem implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest req = modelAction.getRequest();
    List<Object> param = new ArrayList<Object>();
    List ajaxList = new ArrayList<Object>();
    String type = req.getParameter("type");
    String itemgenre = req.getParameter("itemgenre");
    String testStep = req.getParameter("testStep");
    String checkType = req.getParameter("checkType");
    String searchType = req.getParameter("type");// 1 新增页面 ；2 修改页面
    String modelName = req.getParameter("mName");
    String modelCode = req.getParameter("mCode");
    String modelType = req.getParameter("mType");
    String dataAuth = req.getParameter("dataAuth");
    String paraModelCode = req.getParameter("paraModelCode");// 修改页面的机种
    if (!"showItemGenreInfo".equals(type))
    {
      String sql1 = "select t.*,t2.NAME as DEPT,t3.VALUE as STEP,t4.VALUE as itemType,t5.VALUE as itemClass from T_QM_TEST_ITEM t "
                    + "left join sy_dept t2 on t2.ID = t.DATA_AUTH "
                    + "left join sy_dict_val t3 on t3.CODE = t.QTI_TEST_STEP and t3.dict_code = 'QTI_TEST_STEP'"
                    + "left join sy_dict_val t4 on t4.CODE = t.QTI_ITEM_TYPE and t4.dict_code = 'QTI_ITEM_TYPE'"
                    + "left join sy_dict_val t5 on t5.CODE = t.QTI_ITEM_CLASS and t5.dict_code = 'QTI_ITEM_CLASS'";
      String sqlWhere = "";
      if (StringUtils.isNotBlank(checkType))
      {
        sqlWhere += " and  t.QTI_TEST_STEP=?";
        param.add(checkType);

      }
      if (StringUtils.isNotBlank(modelName))
      {
        sqlWhere += " and  t.QTI_ITEM_NAME=?";
        param.add(modelName);

      }
      if (StringUtils.isNotBlank(modelCode))
      {
        sqlWhere += " and t.QTI_ITEM_SN=?";

        param.add(modelCode);
      }
      if (StringUtils.isNotBlank(modelType))
      {
        sqlWhere += " and t.QTI_ITEM_TYPE=?";

        param.add(modelType);
      }
      if (StringUtils.isNotBlank(dataAuth) && !"undefined".equals(dataAuth))
      {
        sqlWhere += " and  t.DATA_AUTH=?";
        param.add(dataAuth);
      }
      if ("2".equals(searchType))
      {
        sqlWhere += " and not exists(select 1 from T_QM_MODEL_ITEM tt where tt.QMI_ITEM_SN = t.QTI_ITEM_SN and tt.QMI_MODEL_CODE = ? )";
        param.add(paraModelCode);
        ajaxList = modelService.listSql(sql1, modelAction.getPage(), sqlWhere, param,
          "ORDER BY QTI_ITEM_NAME ", null);
      }
      else if ("1".equals(searchType))
      {
        ajaxList = modelService.listSql(sql1, modelAction.getPage(), sqlWhere, param,
          "ORDER BY QTI_ITEM_NAME ", null);
      }
      modelAction.setAjaxPage(modelAction.getPage());
      CommMethod.listToEscapeJs(ajaxList);
      modelAction.getAjaxPage().setDataList(ajaxList);
    }
    else
    {
      String sql = "SELECT T.*, " + " T2.NAME  AS DEPT, " + " T3.VALUE AS STEP, "
                   + " T4.VALUE AS ITEMTYPE, " + " T5.VALUE AS ITEMCLASS, " + " A.ID QTI_ID "
                   + " FROM T_QM_MODEL_ITEM T " + " LEFT JOIN T_QM_TEST_ITEM A "
                   + " ON T.QMI_ITEM_SN = A.QTI_ITEM_SN " + " LEFT JOIN SY_DEPT T2 "
                   + " ON T2.ID = T.DATA_AUTH " + " LEFT JOIN SY_DICT_VAL T3 "
                   + " ON T3.CODE = T.QMI_TEST_STEP " + " AND T3.DICT_CODE = 'QTI_TEST_STEP' "
                   + " LEFT JOIN SY_DICT_VAL T4 " + " ON T4.CODE = T.QMI_ITEM_TYPE "
                   + " AND T4.DICT_CODE = 'QTI_ITEM_TYPE' " + " LEFT JOIN SY_DICT_VAL T5 "
                   + " ON T5.CODE = T.QMI_ITEM_CLASS " + " AND T5.DICT_CODE = 'QTI_ITEM_CLASS' "
                   + " WHERE T.QMI_ITEM_GENRE = ? " + " AND T.QMI_TEST_STEP = ? "
                   + " AND T.QMI_MODEL_CODE IS NULL  AND T.DATA_AUTH = ? AND A.DATA_AUTH=? ";
      List checkTypeList = modelService.listDataSql(sql, new Object[] {itemgenre, testStep,dataAuth,dataAuth});
      CommMethod.listToEscapeJs(checkTypeList);
      modelAction.setAjaxList(checkTypeList);
    }

    return BaseActionSupport.AJAX;
  }

}
