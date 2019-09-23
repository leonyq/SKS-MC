package com.more.mes.smt.wmsreceivemanager;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 生产退料管理 制令单号与料号判断
 * 
 * @author development
 */
public class AjaxGetDocMoNum implements FuncService
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
              " T_CO_ITEM ci ,T_PM_MO_BASE n"+
              " where b.ID = bd.CB_BOMID and ci.ci_item_code=bd.cbd_item_code " +
              " and n.PM_MODEL_CODE=b.cb_item_code "+
              " and  b.CB_DEFAULT = ? and n.PM_MO_NUMBER=? and bd.CBD_ITEM_CODE=? and b.data_auth=?";
    
    
    int count = modelService.countSql(sql, new Object[]{"Y",docNum,itemCode,auth});
    
    if (count==0)
    {
      sql="select t.* "+
          " from T_CO_ITEM_REPLACE t "+
          " left join t_co_item t2 "+
          " on t.cr_item_mian = t2.ci_item_code "+
          " left join t_co_item t3 "+
          " on t.cr_item_replace = t3.ci_item_code "+
          " where t.cr_item_mian in (select pd.PM_MODEL_CODE "+
          " from T_PM_MO_BASE pd   "+
          " where pd.PM_MO_NUMBER = ? )"+
          " and t.CR_ITEM_REPLACE=? and t.data_auth=?  ";
      
      count = modelService.countSql(sql, new Object[]{docNum,itemCode,auth});
      if (count!=0)
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
