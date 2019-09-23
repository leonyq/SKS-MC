package com.more.mes.smt.storeitemmanager;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * @Description 保存物料信息
 * @ClassName AddDatileSe
 * 
 */
public class AddDatileSe implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    // String dataAuth = request.getParameter("_DATA_AUTH");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute(
      "mcDataAuth"));
    String isclosewin = request.getParameter("isCloseWin");
    String formid = request.getParameter("formId");

    if (null == formid)
    {
      formid = request.getParameter("formIds");
    }

    String iframeId = request.getParameter("iframeId");

    try
    {
      String[] CI_ITEM_CODE = request.getParameterValues("CI_ITEM_CODE");

      String WIC_CTRL_EMP = CommMethod.escapeJs(request.getParameter("paraMap1@0#WIC_CTRL_EMP"));
      
      String sql2 = "SELECT LOGIN_NAME FROM SY_USER WHERE ID = ? AND DATA_AUTH=? ";
      Map dataMap2 = modelService.queryForMap(sql2, new Object[] {WIC_CTRL_EMP, dataAuth});
      WIC_CTRL_EMP = StringUtils.toString(dataMap2.get("LOGIN_NAME"));
      
      String sql="select t.id from T_WMS_ITEM_CONTRAL t where t.wic_ctrl_emp=? and t.data_auth=?";
      List tempList = modelService.listDataSql(sql, new Object[] {WIC_CTRL_EMP, dataAuth});
      if (!tempList.isEmpty() && tempList != null)
      {
        return modelAction.alertParentInfo(modelAction.getText("该库管员已存在管控物料,请更换"));
      }
      for (int i = 0; i < CI_ITEM_CODE.length; i++ )
      {
        for (int j = i + 1; j < CI_ITEM_CODE.length; j++ )
        {
          if (CI_ITEM_CODE[i].equals(CI_ITEM_CODE[j]))
          { // 如果物料料号相同则判断项次

            return modelAction.alertParentInfo(modelAction.getText("有相同物料料号"));

          }
        }
      }
      TableDataMapExt tExt = new TableDataMapExt();
      tExt.setTableName("T_WMS_ITEM_CONTRAL");
      for (int i = 0; i < CI_ITEM_CODE.length; i++ )
      {
        tExt.getColMap().clear();
        CommMethod.addSysDefCol(tExt.getColMap(), modelAction.getUser());
        tExt.getColMap().put("WIC_ITEM_CODE", CommMethod.escapeJs(CI_ITEM_CODE[i]));
        tExt.getColMap().put("WIC_CTRL_EMP", WIC_CTRL_EMP);
        if (dataAuth != null)
        {
          tExt.getColMap().put("DATA_AUTH", dataAuth);
        }
        // tExt.getColMap().put("ID", StringUtils.getUUID());
        modelService.save(tExt);
      }
    }
    catch (Exception e)
    {
      // TODO: handle exception

      throw new BussException(modelAction.getText("新增失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, "新增成功", isclosewin);
  }
}