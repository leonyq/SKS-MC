package com.more.buss.eis.bd.basedos.service.oracle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 *   物料组-- ajax加载物料信息
 * @author fs
 *
 */
public class QueryNoBelongItem implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String groupSn = request.getParameter("groups");
    String type = request.getParameter("type");
    //String dataAuth = request.getParameter("dataAuth");//组织机构
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String querySql = null;
    PaginationImpl page = modelAction.getPage();

    String sql = " select CIG_PROCESS_FACE from T_CO_ITEM_GROUP where cig_sn=? and data_auth=? ";

    List<Map> list = modelService.listDataSql(sql, new Object[] {groupSn,dataAuth});
    List<Object> sqlwList = new ArrayList<>();
    List itemList = new ArrayList<>();
    if (type.equals("2"))
    {
      // 取出未归属物料组的物料
      querySql = "SELECT rownum,t.ci_item_code,t.ci_item_name,t.ci_item_spec, a.supplier_name,"
                 + "t.ci_item_type from T_CO_ITEM t " + " left join T_CO_SUPPLIER a "
                 + " on a.supplier_code = t.ci_supplier_code "
                 + " left join T_CO_ITEM_CONNECT B1 " + "  on b1.CIC_ITEM_CODE = t.ci_item_code  AND b1.data_auth = ? "
                 + " left join T_CO_ITEM_GROUP A1 " + "  on A1.cig_sn = B1.cig_sn  AND a1.data_auth = ? "
                 + " where 1 = 1  and t.data_auth = ?" + " and not exists (select t1.ci_item_code"
                 + " from T_CO_ITEM t1" + " join T_CO_ITEM_CONNECT s1"
                 + " on s1.CIC_ITEM_CODE = t1.ci_item_code  AND s1.data_auth = ? " + " join T_CO_ITEM_GROUP w1 "
                 + " on w1.cig_sn = s1.cig_sn AND w1.data_auth = ? " + " where t1.ci_item_code = t.ci_item_code ";
      sqlwList.add(dataAuth);
      sqlwList.add(dataAuth);
      sqlwList.add(dataAuth);
      sqlwList.add(dataAuth);
      sqlwList.add(dataAuth);
      if(null!=list && list.size()>0) {
      if (StringUtils.isNotBlank(list.get(0).get("CIG_PROCESS_FACE")))
      {
        querySql += " AND w1.CIG_PROCESS_FACE= ? ";
        sqlwList.add(list.get(0).get("CIG_PROCESS_FACE"));  
      }
    }
      querySql += " )";
       itemList = modelService.listSql(querySql, page, null, sqlwList, null, null);
    }
    else if (type.equals("1"))
    {
      querySql = "select * from (SELECT rownum,t.ci_item_code,t.ci_item_name,t.ci_item_spec,a.supplier_name,t.ci_item_type "
                 + "from T_CO_ITEM t "
                 + "left join T_CO_SUPPLIER a on a.supplier_code = t.ci_supplier_code "
                 + "left join T_CO_ITEM_CONNECT B1 "
                 + " on b1.CIC_ITEM_CODE = t.ci_item_code   AND b1.data_auth = ?  "
                 + " left join T_CO_ITEM_GROUP A1 "
                 + " on A1.cig_sn = B1.cig_sn   AND a1.data_auth = ?  "
                 + "where 1 = 1  "
                 + "and not exists (select 1 "
                 + "from T_CO_ITEM t1 "
                 + "join T_CO_ITEM_CONNECT s1 "
                 + "on s1.CIC_ITEM_CODE = t1.ci_item_code   AND s1.data_auth = ?  "
                 + "join T_CO_ITEM_GROUP w1 "
                 + "on w1.cig_sn = s1.cig_sn   AND w1.data_auth = ?  "
                 + "where t1.id = t.id ) and t.data_auth = ? ) ";
      sqlwList.add(dataAuth);
      sqlwList.add(dataAuth);
      sqlwList.add(dataAuth);
      sqlwList.add(dataAuth);
      sqlwList.add(dataAuth);
       itemList = modelService.listSql(querySql, page, null, sqlwList, null, null);
    }

   
    Map<String, Object> map = new HashMap<String, Object>();
    modelAction.setAjaxPage(modelAction.getPage());
    modelAction.getAjaxPage().setDataList(itemList);
    return BaseActionSupport.AJAX;

  }

}