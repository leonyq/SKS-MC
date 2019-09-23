package com.more.mes.smt.elecvechile;

import java.text.SimpleDateFormat;
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

/**
 * @Description 电子料站修改
 * @ClassName EditVechileInfo
 * @author WZY
 */
public class EditVechileInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");

    String wecSn = request.getParameter("WEC_SN");// 料车SN
    String id = request.getParameter("dataId");// id主键

    String sql = "select WEC_SN from T_WMS_ELEC_VECHILE where WEC_SN=? and id != ? and DATA_AUTH = ? ";

    int count = modService.countSql(sql, new Object[] {wecSn, id,dataAuth});

    if (count > 0)
    {
      return modelAction.alertParentInfo(modelAction.getText("此料站SN已存在"));//防止sn重复
    }
    try
    {
      SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 转格式
      String wecName = request.getParameter("paraMapObj.WEC_NAME");// 料车名称
      String wecShelfIp = request.getParameter("paraMapObj.WEC_SHELF_IP");// 服务IP
      String wecDate = request.getParameter("paraMapObj.WEC_DATE");// 时间
      String wecDept = request.getParameter("paraMapObj.WEC_DEPT");// 部门
      String wecEmp = request.getParameter("paraMapObj.WEC_EMP");// 责任人
      String wecMemo = request.getParameter("paraMapObj.WEC_MEMO");// 备注
      TableDataMapExt tExt = new TableDataMapExt();
      List list = new ArrayList();
      // 修改T_WMS_ELEC_VECHILE（仓库电子周转料车信息表）的信息
      tExt.setTableName("T_WMS_ELEC_VECHILE");
      CommMethod.editSysDefCol(tExt.getColMap(), modelAction.getUser());
      tExt.setSqlWhere(" and id = ?");
      list.add(id);
      tExt.setSqlWhereArgs(list);
      tExt.getColMap().put("WEC_SN", wecSn);
      tExt.getColMap().put("WEC_NAME", wecName);
      tExt.getColMap().put("WEC_SHELF_IP", wecShelfIp);
      if (StringUtils.isNotBlank(wecDate))
      {
        tExt.getColMap().put("WEC_DATE", sim.parse(wecDate));
      }
      

      tExt.getColMap().put("WEC_DEPT", wecDept);
      tExt.getColMap().put("WEC_EMP", wecEmp);
      tExt.getColMap().put("WEC_MEMO", wecMemo);
      if (null != dataAuth)
      {
        tExt.getColMap().put("DATA_AUTH", dataAuth);
      }

      modService.edit(tExt);

      // 删除该料站SN在T_WMS_ELEC_VECHILE_DETAIL （仓库电子周转料车货位信息表）的相关数据
      TableDataMapExt delc = new TableDataMapExt();
      delc.setTableName("T_WMS_ELEC_VECHILE_DETAIL");
      delc.setSqlWhere(" and WEC_SN = ? and DATA_AUTH = ? ");
      list.clear();
      list.add(wecSn);
      list.add(dataAuth);
      delc.setSqlWhereArgs(list);
      modService.del(delc);

      String storageSn[] = request.getParameterValues("STORAGE");
      String shelfSn[] = request.getParameterValues("SHELF");
      String itemSize[] = request.getParameterValues("ITEM");
      String memo[] = request.getParameterValues("tempMemo");
      String capacity[] = request.getParameterValues("WEC");
      String storage ;
      String shelf ;
      String size ;
      String wcMemo ;
      String capacitys;
      int memoLength = memo.length;
      for (int i = 0; i < memoLength; i++ )
      {
         storage = storageSn[i];
         shelf = shelfSn[i];
         size = itemSize[i];
         wcMemo = memo[i];
         capacitys=capacity[i];
        // 添加该料站SN在T_WMS_ELEC_VECHILE_DETAIL （仓库电子周转料车货位信息表）的相关数据
        TableDataMapExt editExt = new TableDataMapExt();

        editExt.setTableName("T_WMS_ELEC_VECHILE_DETAIL");
        CommMethod.addSysDefCol(editExt.getColMap(), modelAction.getUser());
        editExt.getColMap().put("WEC_SN", wecSn);
        editExt.getColMap().put("WEC_STORAGE_SN", storage);
        editExt.getColMap().put("WEC_SHELF_SN", shelf);
        editExt.getColMap().put("WEC_ITEM_SIZE", size);
        editExt.getColMap().put("WEC_CAPACITY", Integer.valueOf(capacitys));// 说明
        editExt.getColMap().put("WEC_MEMO", wcMemo);
        if (null != dataAuth)
        {
          editExt.getColMap().put("DATA_AUTH", dataAuth);
        }
        modService.save(editExt);

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
