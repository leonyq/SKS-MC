package com.more.mes.smt.storeitemmanager;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import bsh.This;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import examples.newsgroups;

/**
 * @Description 物料管控信息修改
 * @ClassName EditDatile
 * @author WZY
 */
public class EditDatile implements FuncService
{

  private final Log log = LogFactory.getLog(This.class);

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    String fromId = request.getParameter("formId");
    if (fromId == null)
    {
      fromId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");

    try
    {
      String delId = request.getParameter("delIds");// 要删除的id号
      String[] ids = delId.split(",");

      if (delId!=null&&!delId.equals(""))
      {

        String exicSql = "delete from T_WMS_ITEM_CONTRAL where id=? and DATA_AUTH=?";
        for (int i = 0; i < ids.length; i++ )
        {
         // modelService.execSql(exicSql, new Object[] {ids[i]});
          modelService.execSql(exicSql, new Object[] {ids[i],dataAuth});
        }
      }
      String[] ciItemCode = request.getParameterValues("CI_ITEM_CODE");
      // String WIC_CTRL_EMP = request.getParameter("paraMap1@0#WIC_CTRL_EMP");
      String wicCtrlEmp = request.getParameter("WIC_CTRL_EMP");

      String[] itemsId = request.getParameterValues("itemId");// 要修改的id号，物料id

      TableDataMapExt tableDataMapExt = new TableDataMapExt();
      tableDataMapExt.setTableName("T_WMS_ITEM_CONTRAL");
      List list = new ArrayList();
      for (int i = 0; i < ciItemCode.length; i++ )
      {
        if (null!=itemsId && !itemsId[i].equals(""))
        {
          tableDataMapExt.setSqlWhere(" and id =?");
          list.clear();
          list.add(itemsId[i]);
          tableDataMapExt.setSqlWhereArgs(list);
          tableDataMapExt.getColMap().put("WIC_ITEM_CODE", ciItemCode[i]);
          tableDataMapExt.getColMap().put("WIC_CTRL_EMP", wicCtrlEmp);
          if (null != dataAuth)
          {
            tableDataMapExt.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.edit(tableDataMapExt);
        }
        else
        {
          //CommMethod.addSysDefCol(tableDataMapExt.getColMap(), modelAction.getUser());
          tableDataMapExt.getColMap().put("WIC_ITEM_CODE",ciItemCode[i]);
          tableDataMapExt.getColMap().put("WIC_CTRL_EMP", wicCtrlEmp);
          if (null != dataAuth)
          {
            tableDataMapExt.getColMap().put("DATA_AUTH", dataAuth);
          }
           tableDataMapExt.getColMap().put("ID", StringUtils.getUUID());
          modelService.save(tableDataMapExt);
        }

      }
    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
  }

}
