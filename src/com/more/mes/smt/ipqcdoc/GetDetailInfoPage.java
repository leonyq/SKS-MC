package com.more.mes.smt.ipqcdoc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * IPQC获取明细信息--IPQC单据信息分页
 * 
 * @author wzy
 */
public class GetDetailInfoPage implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    try
    {
      String qiditemCode = request.getParameter("qiditemCode");
      String qidItemName = request.getParameter("qidItemName");
      String qidItemType = request.getParameter("qidItemType");
      String dataAuth = request.getParameter("dataAuth");
      Map<String, Object> paraMap = new HashMap<String, Object>();
      String sqlString = "select t.*,a.VALUE from T_QM_IPQC_ITEM t "
                         + " left join sy_dict_val a on t.QII_ITEM_TYPE = a.CODE where 1=1 and t.data_auth = :DATA_AUTH";
      paraMap.put("DATA_AUTH", dataAuth);
      String sqlWhere = "";

      if (StringUtils.isNotBlank(qiditemCode))
      {
        sqlString += " and t.QII_ITEM_CODE like '%' || :QII_ITEM_CODE || '%'";
        paraMap.put("QII_ITEM_CODE", qiditemCode);
      }
      if (StringUtils.isNotBlank(qidItemName))
      {
        sqlString += " and t.QII_ITEM_NAME like '%' || :QII_ITEM_NAME || '%'";
        paraMap.put("QII_ITEM_NAME", qidItemName);
      }
      if (StringUtils.isNotBlank(qidItemType))
      {
        sqlString += " and t.QII_ITEM_TYPE = :QII_ITEM_TYPE ";
        paraMap.put("QII_ITEM_TYPE", qidItemType);
      }

      sqlString += " and t.QII_EFFECTIVE_FLAG='Y'";
      sqlString += " and a.DICT_CODE='CAUSE_TYPE'";

      List list = modelService.listSql(sqlString, modelAction.getPage(), paraMap, null, null);

      modelAction.setAjaxPage(modelAction.getPage());
      CommMethod.listToEscapeJs(list);
      modelAction.getAjaxPage().setDataList(list);
    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error(e);
      throw new BussException(e);
    }

    return BaseActionSupport.AJAX;
  }

}
