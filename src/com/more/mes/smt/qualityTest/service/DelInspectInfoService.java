package com.more.mes.smt.qualityTest.service;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取物料/产品信息
 * 
 * @author development
 */
public class DelInspectInfoService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = CommMethodMc.getDataAuthBySession(request);
    String dataId = request.getParameter("dataId");
    String[] dataIds = dataId.split(",", -1);
    String inspectSn = request.getParameter("inspectSn");
    String[] inspectSns = inspectSn.split(",", -1);

    int inspectSnLength = inspectSns.length - 1;
    try
    {
      for (int i = 0; i < inspectSnLength; i++ )
      {
        // 删除品质检验表数据 T_QM_INSPECT_INFO
        String delInspectSql = "delete from T_QM_INSPECT_INFO t where t.qii_inspect_sn=? and t.data_auth=? ";
        modelService.execSql(delInspectSql, new Object[] {inspectSns[i],dataAuth});

        // 删除检验方案检验信息表数据 T_QM_INSPECT_SCHEME_INFO
        String delInspectSchemeSql = "delete from T_QM_INSPECT_SCHEME_INFO t where t.qis_inspect_sn=? and t.data_auth=? ";
        modelService.execSql(delInspectSchemeSql, new Object[] {inspectSns[i],dataAuth});

        // 删除检验单母本信息表数据 T_QM_INSEPCT_PARENT_INFO
        String delInspectParentSql = "delete from T_QM_INSEPCT_PARENT_INFO t where t.qip_inspect_sn=? and t.data_auth=? ";
        modelService.execSql(delInspectParentSql, new Object[] {inspectSns[i],dataAuth});

        // 删除样本检测项目信息表数据 T_QM_INSPECT_ITEM_INFO
        String delInspectItemSql = "delete from T_QM_INSPECT_ITEM_INFO t where t.qii_inspect_sn=? and t.data_auth=? ";
        modelService.execSql(delInspectItemSql, new Object[] {inspectSns[i],dataAuth});

        // 删除样本检测类型中间表数据 T_QM_INSPECT_MID_INFO
        String delMidSql = "delete from T_QM_INSPECT_MID_INFO t where t.qim_inspect_sn=? and t.data_auth=? ";
        modelService.execSql(delMidSql, new Object[] {inspectSns[i],dataAuth});
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("删除失败"), e);
    }

    return BaseActionSupport.AJAX;
  }

}
