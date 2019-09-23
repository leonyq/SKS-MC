package com.more.mes.smt.modelchecked;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 机种检测项目 查看视图前加载类
 * @author development
 *
 */
public class BeforeView implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataId = modelAction.getDataId();
    String modelCode = request.getParameter("modelCode");
    String sql2 = "";
    String dataAuth = request.getParameter("dataAuth");
    List<HashMap<String, Object>> dataList2 = new ArrayList<HashMap<String, Object>>();
    if (!"".equals(modelCode))
    {
      sql2 = "select t.*, t2.value as mType, t3.value as mStep, t4.value as mClass "
             + " from T_QM_MODEL_ITEM t " + " left join T_QM_MODEL_ITEM t1 "
             + " on t.qmi_model_code = t1.qmi_model_code "
             + " and t.qmi_item_genre=t1.qmi_item_genre " + " left join sy_dict_val t2 "
             + " on t2.dict_code = 'QTI_ITEM_TYPE' " + " and t2.code = t.QMI_ITEM_TYPE "
             + " left join sy_dict_val t3 " + " on t3.dict_code = 'QTI_TEST_STEP' "
             + " and t3.code = t.QMI_TEST_STEP " + " left join sy_dict_val t4 "
             + " on t4.dict_code = 'QTI_ITEM_CLASS' " + " and t4.code = t.QMI_ITEM_CLASS "
             + " where t1.id = ?  and t.data_auth=? and t1.data_auth=? ";
      dataList2 = modelService.listDataSql(sql2, new Object[] {dataId,dataAuth,dataAuth});
    }
    else
    {
      sql2 = "select t.*, t2.value as mType, t3.value as mStep, t4.value as mClass "
             + " from T_QM_MODEL_ITEM t " + " left join T_QM_MODEL_ITEM t1 "
             + " on t.qmi_item_genre=t1.qmi_item_genre " + " left join sy_dict_val t2 "
             + " on t2.dict_code = 'QTI_ITEM_TYPE' " + " and t2.code = t.QMI_ITEM_TYPE "
             + " left join sy_dict_val t3 " + " on t3.dict_code = 'QTI_TEST_STEP' "
             + " and t3.code = t.QMI_TEST_STEP " + " left join sy_dict_val t4 "
             + " on t4.dict_code = 'QTI_ITEM_CLASS' " + " and t4.code = t.QMI_ITEM_CLASS "
             + " where t1.id = ? " + " and (t1.qmi_model_code is null OR COALESCE(T1.qmi_model_code,'')='' )"
             + " and t.data_auth=? and t1.data_auth=? ";
      dataList2 = modelService.listDataSql(sql2, new Object[] {dataId,dataAuth,dataAuth});
    }
    CommMethod.listToEscapeJs(dataList2);
    modelAction.setDataList0(dataList2);
    return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面
  }

}
