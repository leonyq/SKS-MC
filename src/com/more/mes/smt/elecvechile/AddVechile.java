package com.more.mes.smt.elecvechile;

import java.text.SimpleDateFormat;


import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 电子料站新增
 * @ClassName AddVechile
 * @author WZY
 */
public class AddVechile implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("_DATA_AUTH");
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");

    try
    {
      String wecSn = request.getParameter("paraMap1@0#WEC_SN");// 料车SN

      String sql = "select t.WEC_SN from T_WMS_ELEC_VECHILE t where t.WEC_SN=? AND T.DATA_AUTH = ? ";
      int count = modelService.countSql(sql, new Object[] {wecSn,dataAuth});
      if (count != 0)
      {
        return modelAction.alertParentInfo(modelAction.getText("料车SN已存在"));
      }

      String wecName = request.getParameter("paraMap1@0#WEC_NAME");// 料车名称
      String wecShelfIp =request.getParameter("paraMap1@0#WEC_SHELF_IP");// 服务IP
      String wecDate =request.getParameter("paraMap1@0#WEC_DATE");// 购买日期
      String wecDept = request.getParameter("paraMap1@0#WEC_DEPT");// 使用部门
      String wecEmp = request.getParameter("paraMap1@0#WEC_EMP");// 责任人
      String wecMemo = request.getParameter("paraMap1@0#WEC_MEMO");// 备注

      SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

      // 保存到T_WMS_ELEC_VECHILE（仓库电子周转料车信息表）
      TableDataMapExt addExt = new TableDataMapExt();
      addExt.setTableName("T_WMS_ELEC_VECHILE");
      CommMethod.addSysDefCol(addExt.getColMap(), modelAction.getUser());
      addExt.getColMap().put("WEC_SN", wecSn);
      addExt.getColMap().put("WEC_NAME", wecName);
      addExt.getColMap().put("WEC_SHELF_IP", wecShelfIp);
      if (StringUtils.isNotBlank(wecDate))
      {
        addExt.getColMap().put("WEC_DATE", sim.parse(wecDate));
      }
      addExt.getColMap().put("WEC_DEPT", wecDept);
      addExt.getColMap().put("WEC_EMP", wecEmp);
      addExt.getColMap().put("WEC_MEMO", wecMemo);
      addExt.getColMap().put("WEC_STATUS", "1");
      if (dataAuth != null)
      {
        addExt.getColMap().put("DATA_AUTH", dataAuth);// 组织结构
      }
      modelService.save(addExt);

      // 将信息保存至 T_WMS_ELEC_VECHILE_DETAIL （仓库电子周转料车货位信息表）
      /*
      String count1 = request.getParameter("trCount");

      int trCount = 0;
      if (!count1.equals("0"))
      {
        trCount = Integer.parseInt(count1);
      }
      */
      String storageSn[] = request.getParameterValues("STORAGE");

      String shelfSn[] = request.getParameterValues("SHELF");
      String itemSize[] = request.getParameterValues("ITEM");
      String memo[] = request.getParameterValues("tempMemo");
      String CAPACITY[] = request.getParameterValues("WEC");
      int storageSnlength=storageSn.length;
      String storageSns;
      String shelfSns;
      String itemSizes;
      String memos;
      String CAPACITYS;
      for (int i = 0; i < storageSnlength; i++ )
      {
        storageSns = storageSn[i];
        shelfSns = shelfSn[i];
        itemSizes =itemSize[i];
        memos = memo[i];
        CAPACITYS=CAPACITY[i];
        TableDataMapExt dExt = new TableDataMapExt();
        dExt.setTableName("T_WMS_ELEC_VECHILE_DETAIL");
        CommMethod.addSysDefCol(dExt.getColMap(), modelAction.getUser());
        dExt.getColMap().put("WEC_SN", wecSn);// 料车SN
        dExt.getColMap().put("WEC_STORAGE_SN", storageSns);// 货位编码
        dExt.getColMap().put("WEC_SHELF_SN", shelfSns);// 硬体编码
        dExt.getColMap().put("WEC_ITEM_SIZE", itemSizes);// 料盘尺寸
        dExt.getColMap().put("WEC_MEMO", memos);// 说明
        dExt.getColMap().put("WEC_CAPACITY", Integer.valueOf(CAPACITYS));// 说明
        if (dataAuth != null)
        {
          dExt.getColMap().put("DATA_AUTH", dataAuth);// 组织结构
        }
        modelService.save(dExt);
      }

      /*
       * for (int i = 1; i <= trCount; i++ ) { storageSn = request.getParameter("STORAGE_SN_" + i);
       * shelfSn = request.getParameter("SHELF_SN_" + i); itemSize =
       * request.getParameter("ITEM_SIZE_" + i); memo = request.getParameter("WEC_MEMO_" + i);
       * TableDataMapExt dExt = new TableDataMapExt();
       * dExt.setTableName("T_WMS_ELEC_VECHILE_DETAIL"); CommMethod.addSysDefCol(dExt.getColMap(),
       * modelAction.getUser()); dExt.getColMap().put("WEC_SN", wecSn);// 料车SN
       * dExt.getColMap().put("WEC_STORAGE_SN", storageSn);// 货位编码
       * dExt.getColMap().put("WEC_SHELF_SN", shelfSn);// 硬体编码
       * dExt.getColMap().put("WEC_ITEM_SIZE", itemSize);// 料盘尺寸 dExt.getColMap().put("WEC_MEMO",
       * memo);// 说明 if (dataAuth != null) { dExt.getColMap().put("DATA_AUTH", dataAuth);// 组织结构 }
       * modelService.save(dExt); }
       */

    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }

    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
  }

}
