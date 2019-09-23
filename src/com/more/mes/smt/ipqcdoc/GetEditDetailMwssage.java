package com.more.mes.smt.ipqcdoc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * IPQC获取明细信息--IPQC单据信息修改获取相应信息
 * 
 * @author wzy
 */
public class GetEditDetailMwssage implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();

    String id = request.getParameter("id");
    String type = request.getParameter("type");
    String dataAuth = "";
    if ("detail".equals(type))
    {
      dataAuth = request.getParameter("dataAuth");
    }
    else
    {
        dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    }

    String sql = "select t.*,c.VALUE,b.id as itemId from T_QM_IPQC_DETAIL t "
                 + " left join T_QM_IPQC_DOC a on  a.QID_DOC_NUM=t.QID_DOC_NUM"
                 + " left join sy_dict_val c on t.QID_ITEM_TYPE = c.CODE"
                 + " left join T_QM_IPQC_ITEM b on b.QII_ITEM_CODE=t.QID_ITEM_CODE"
                 + " where a.id=? and c.DICT_CODE=? and t.data_auth=? and a.data_auth=?"
                 + " and b.data_auth=? ";

    List list = modelService.listDataSql(sql, new Object[] {id, "CAUSE_TYPE", dataAuth, dataAuth,
      dataAuth});
    CommMethod.listToEscapeJs(list);
    modelAction.setAjaxList(list);

    return BaseActionSupport.AJAX;
  }

}
