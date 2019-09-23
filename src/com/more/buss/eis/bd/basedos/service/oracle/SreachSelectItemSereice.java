package com.more.buss.eis.bd.basedos.service.oracle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 *   物料组--选择物料查询物料信息
 * @author fs
 *
 */
public class SreachSelectItemSereice implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    String sqlWhere = " where 1=1 ";
    HttpServletRequest request = modelAction.getRequest();
   String itemCode = modelAction.getParaMap().get("itemCode");
    String itemName = modelAction.getParaMap().get("itemName");
    String itemSpec = modelAction.getParaMap().get("itemSpec");
    String groupSn =request.getParameter("groups") ;
    String type =request.getParameter("type") ;
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    /*
    String itemCode = modelAction.getParaMap().get("itemCode");
    String itemName = modelAction.getParaMap().get("itemName");
    String itemSpec = modelAction.getParaMap().get("itemSpec");
    String groupSn = request.getParameter("groups");
    String type = request.getParameter("type");
    */
    String querySql = null;
    Map<String,Object> paraMap = new HashMap<String,Object>();
    if (type.equals("2"))
    {
      String sql = " select CIG_PROCESS_FACE from T_CO_ITEM_GROUP where cig_sn=? and data_auth=? ";

      List<Map> list = modelService.listDataSql(sql, new Object[] {groupSn,dataAuth});

      querySql = "select * from (SELECT rownum,t.ci_item_code,t.ci_item_name,t.ci_item_spec, a.supplier_name,"
                 + "t.ci_item_type from T_CO_ITEM t "
                 + " left join T_CO_SUPPLIER a "
                 + " on a.supplier_code = t.ci_supplier_code "
                 + " left join T_CO_ITEM_CONNECT B1 "
                 + "  on b1.CIC_ITEM_CODE = t.ci_item_code "
                 + " left join T_CO_ITEM_GROUP A1 "
                 + "  on A1.cig_sn = B1.cig_sn "
                 + " where 1 = 1"
                 + " and not exists (select t1.ci_item_code"
                 + " from T_CO_ITEM t1"
                 + " join T_CO_ITEM_CONNECT s1"
                 + " on s1.CIC_ITEM_CODE = t1.ci_item_code"
                 + " join T_CO_ITEM_GROUP w1 "
                 + " on w1.cig_sn = s1.cig_sn" + " where t1.ci_item_code = t.ci_item_code ";
      if(null!=list && list.size()>0) {
      if (StringUtils.isNotBlank(list.get(0).get("CIG_PROCESS_FACE")))
      {
        querySql += " AND w1.CIG_PROCESS_FACE=:CIG_PROCESS_FACE ";
        paraMap.put("CIG_PROCESS_FACE",  list.get(0).get("CIG_PROCESS_FACE"));
      }
      }
      querySql += " ) and t.data_auth= :dataAuth1)";
      paraMap.put("dataAuth1", dataAuth);
    }
    else if (type.equals("1"))
    {
      querySql = "select * from (SELECT rownum,t.ci_item_code,t.ci_item_name,t.ci_item_spec,a.supplier_name,t.ci_item_type "
                 + "from T_CO_ITEM t "
                 + "left join T_CO_SUPPLIER a on a.supplier_code = t.ci_supplier_code "
                 + "left join T_CO_ITEM_CONNECT B1 "
                 + " on b1.CIC_ITEM_CODE = t.ci_item_code "
                 + " left join T_CO_ITEM_GROUP A1 "
                 + " on A1.cig_sn = B1.cig_sn "
                 + "where 1 = 1 "
                 + "and not exists (select 1 "
                 + "from T_CO_ITEM t1 "
                 + "join T_CO_ITEM_CONNECT s1 "
                 + "on s1.CIC_ITEM_CODE = t1.ci_item_code "
                 + "join T_CO_ITEM_GROUP w1 "
                 + "on w1.cig_sn = s1.cig_sn "
                 + "where t1.id = t.id ) and t.data_auth= :dataAuth2 ) ";
    paraMap.put("dataAuth2", dataAuth);
        
    }
    
    if (StringUtils.isNotBlank(itemCode))
    {
        sqlWhere += "and CI_ITEM_CODE LIKE '%' || :itemCode || '%'";
     // sqlWhere += "and CI_ITEM_CODE LIKE '%" + itemCode + "%'";
        paraMap.put("itemCode", itemCode);
    }
    if (StringUtils.isNotBlank(itemName))
    {
        sqlWhere += "and CI_ITEM_NAME LIKE '%' || :itemName || '%'";
     // sqlWhere += "and CI_ITEM_NAME LIKE '%" + itemName + "%'";
        paraMap.put("itemName", itemName);
    }
    if (StringUtils.isNotBlank(itemSpec))
    {
        sqlWhere += "and CI_ITEM_SPEC LIKE '%' || :itemSpec || '%'";
     // sqlWhere += "and CI_ITEM_SPEC LIKE '%" + itemSpec + "%'";
        paraMap.put("itemSpec", itemSpec);
    }
    List itemList = modelService.listSql(querySql+sqlWhere, modelAction.getPage(), paraMap, null, null);
    modelAction.setAjaxPage(modelAction.getPage());
    modelAction.getAjaxPage().setDataList(itemList);
    return BaseActionSupport.AJAX;
  }

}
