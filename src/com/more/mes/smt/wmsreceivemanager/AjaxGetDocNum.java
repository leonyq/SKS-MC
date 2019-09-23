package com.more.mes.smt.wmsreceivemanager;

import javax.servlet.http.HttpServletRequest;

import com.ibm.pkcs11.r;
import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
//import com.more.mes.smt.maintenance.oracle.ProductError2;

/**
 * @Title
 * @description 生产退料管理 工单号与物料料号判断
 * @ClassName AjaxGetDocNum
 * @author msad013
 * @version 1.0 developer 2018-06-14 created
 * @see AjaxGetDocNum
 * @since 2018-06-14
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class AjaxGetDocNum implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    
    String docNum = request.getParameter("docNum");
    String itemCode = request.getParameter("itemCodes");
    String auth = request.getSession().getAttribute("mcDataAuth").toString();
    String boonlean = "comps";
    
    String sql ="select bd.* from t_co_bom b, t_co_bom_detail bd," +
    		      " T_CO_ITEM ci ,T_PM_PROJECT_BASE n"+
              " where b.ID = bd.CB_BOMID and ci.ci_item_code=bd.cbd_item_code " +
              " and n.PRODUCT_MATERIAL=b.cb_item_code "+
              " and  b.CB_DEFAULT = ? and n.PROJECT_ID=? and bd.CBD_ITEM_CODE=? and b.data_auth=?";
    
    
    int count = modelService.countSql(sql, new Object[]{"Y",docNum,itemCode,auth});
    
    if (count<1)
    {
      sql="select t.* "+
          " from T_CO_ITEM_REPLACE t "+
          " left join t_co_item t2 "+
          " on t.cr_item_mian = t2.ci_item_code "+
          " left join t_co_item t3 "+
          " on t.cr_item_replace = t3.ci_item_code "+
          " where t.cr_item_mian in (select CBD_ITEM_CODE "+
          " from t_pm_project_detail pd "+ 
          " left join t_pm_project_base pb "+
          " on pb.PROJECT_ID = pd.PROJECT_ID "+
          " where pb.PROJECT_ID = ?) "+
          " and t.CR_ITEM_REPLACE=? and t.data_auth=? ";
      
      count = modelService.countSql(sql, new Object[]{docNum,itemCode,auth});
      if (count>=1)
      {
        modelAction.setAjaxString(boonlean);
      }else {
        boonlean = "noComps";
        modelAction.setAjaxString(boonlean);
      }
    }else {
      modelAction.setAjaxString(boonlean);
    }
    
    return BaseActionSupport.AJAX;
  }

}
