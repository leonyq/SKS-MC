package com.more.mes.smt.ipqcdoc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * IPQC获取明细信息--IPQC单据信息
 * 
 * @author wzy
 */
public class GetDetailInfo implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("dataAuth");
    Map<String, Object> paraMap = new HashMap<String, Object>();
    String sqlWhere = "";  
    String sql = "select t.*,a.VALUE from T_QM_IPQC_ITEM t "
                         + " left join sy_dict_val a on t.QII_ITEM_TYPE = a.CODE where 1=1 ";

    if (StringUtils.isNotBlank(dataAuth))
    {
      sql += " and t.data_auth = :DATA_AUTH ";
        paraMap.put("DATA_AUTH", dataAuth);
    }
    sql += " and t.QII_EFFECTIVE_FLAG='Y'";

    sql += " and a.DICT_CODE='CAUSE_TYPE'";

    List list = modelService.listSql(sql, modelAction.getPage(), paraMap,  null, null);

    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listToEscapeJs(list);
    modelAction.getAjaxPage().setDataList(list);

    return BaseActionSupport.AJAX;
  }

}
