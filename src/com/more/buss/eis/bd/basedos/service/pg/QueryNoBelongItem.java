package com.more.buss.eis.bd.basedos.service.pg;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
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
    String dataAuth = request.getParameter("dataAuth");//组织机构
    String querySql = null;
    PaginationImpl page = modelAction.getPage();

    String sql = " select CIG_PROCESS_FACE from T_CO_ITEM_GROUP where cig_sn=?";

    List<Map> list = modelService.listDataSql(sql, new Object[] {groupSn});
    List<Object> sqlwList = new ArrayList<>();
    List itemList = new ArrayList<>();
    if (type.equals("2"))
    {
      // 取出未归属物料组的物料
      querySql = "SELECT ROW_NUMBER () OVER (),t.ci_item_code,t.ci_item_name,t.ci_item_spec, a.supplier_name,"
                 + "t.ci_item_type from T_CO_ITEM t " + " left join T_CO_SUPPLIER a "
                 + " on a.supplier_code = t.ci_supplier_code "
                 + " left join T_CO_ITEM_CONNECT B1 " + "  on b1.CIC_ITEM_CODE = t.ci_item_code "
                 + " left join T_CO_ITEM_GROUP A1 " + "  on A1.cig_sn = B1.cig_sn "
                 + " where 1 = 1" + " and not exists (select t1.ci_item_code"
                 + " from T_CO_ITEM t1" + " join T_CO_ITEM_CONNECT s1"
                 + " on s1.CIC_ITEM_CODE = t1.ci_item_code" + " join T_CO_ITEM_GROUP w1 "
                 + " on w1.cig_sn = s1.cig_sn" + " where t1.ci_item_code = t.ci_item_code AND t.data_auth = ? ";
      sqlwList.add(dataAuth);
      if(null!=list && list.size()>0) {
      if (StringUtils.isNotBlank(list.get(0).get("CIG_PROCESS_FACE")))
      {
        querySql += " AND w1.CIG_PROCESS_FACE=? ";
        sqlwList.add(list.get(0).get("CIG_PROCESS_FACE"));  
      }
      }
      querySql += " )";
      itemList = modelService.listSql(querySql, page, null, null, null, null);
    }
    else if (type.equals("1"))
    {
      querySql = "select * from (SELECT ROW_NUMBER () OVER (),t.ci_item_code,t.ci_item_name,t.ci_item_spec,a.supplier_name,t.ci_item_type "
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
                 + "where t1.id = t.id ) and t.data_auth = ? ) as sss  ";
      sqlwList.add(dataAuth);
      itemList = modelService.listSql(querySql, page, null, sqlwList, null, null);      
    }

     
    Map<String, Object> map = new HashMap<String, Object>();
    modelAction.setAjaxPage(modelAction.getPage());
    modelAction.getAjaxPage().setDataList(itemList);
    return BaseActionSupport.AJAX;

  }

}