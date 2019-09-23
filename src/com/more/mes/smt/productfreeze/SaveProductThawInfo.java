package com.more.mes.smt.productfreeze;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 产品解冻
 * 
 * @author development
 */
public class SaveProductThawInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings({"unchecked", "unused"})
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = CommMethodMc.getDataAuthBySession(request);//String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth")); 
    //CommMethodMc.getDataAuthBySession(request);
    try
    {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String delId = CommMethod.escapeJs(request.getParameter("delId"));// 需要解冻的id
      String[] strArray=new String[]{};
      if(delId!=null&&!delId.equals("")){
          strArray = delId.split(",");
      }
      List<Map> productList = null;
      String wfiSn = null;// 产品SN
      String wfiAreaSn = null;// 线别
      String wfiMoNumber = null;// 制令单
      String wfiModelCode = null;// 机种
      String wfiProcessFace = null;// 生产面别（0：单面，1正面，2反面，3阴阳面）
      int wfiNum = 0;// 数量
      String wfiLot = null;// 生产批号
      String wfiCustCode = null;// 客户代码
      String wfiErrorDoc = null;// 异常单号
      String wfiErrorFlag = null;// 冻结前产品状态(0正常、1不良、2维修、3报废、4冻结)
      String sql = "select * from T_WIP_FREEZE_INFO where id=?";

      TableDataMapExt freeze1 = new TableDataMapExt();
      freeze1.setTableName("T_WIP_FREEZE_INFO"); // 产品冻结信息表

      TableDataMapExt freeze = new TableDataMapExt();
      freeze.setTableName("T_WIP_FREEZE_INFO_LOG"); // 产品冻结信息日志表
      CommMethod.addSysDefCol(freeze.getColMap(), modelAction.getUser());

      TableDataMapExt tracking = new TableDataMapExt();
      tracking.setTableName("T_WIP_TRACKING"); // 产品在制信息表

      for (int i = 0; i < strArray.length; i++ )
      {
        productList = modelService.listDataSql(sql, new Object[] {strArray[i]});
        wfiSn = (String)productList.get(0).get("WFI_SN");
        wfiAreaSn = (String)productList.get(0).get("WFI_AREA_SN");
        wfiMoNumber = (String)productList.get(0).get("WFI_MO_NUMBER");
        wfiModelCode = (String)productList.get(0).get("WFI_MODEL_CODE");
        wfiProcessFace = (String)productList.get(0).get("WFI_PROCESS_FACE");
        wfiNum = Integer.parseInt(productList.get(0).get("WFI_NUM").toString());
        wfiLot = (String)productList.get(0).get("WFI_LOT");
        wfiCustCode = (String)productList.get(0).get("WFI_CUST_CODE");
        wfiErrorFlag = (String)productList.get(0).get("WFI_ERROR_FLAG");
        wfiErrorDoc = (String)productList.get(0).get("WFI_ERROR_DOC");

        // 修改T_WIP_TRACKING表WT_ERROR_FLAG字段值为原先状态
        ArrayList<Object> paraList = new ArrayList<Object>();
        CommMethod.editSysDefCol(tracking.getColMap(), modelAction.getUser());
        tracking.setSqlWhere(" and WT_SN = ? and DATA_AUTH=?");
        paraList.add(wfiSn);
        paraList.add(dataAuth);
        tracking.setSqlWhereArgs(paraList);
        tracking.getColMap().put("WT_ERROR_FLAG", wfiErrorFlag);
        if (dataAuth != null)
        {
          tracking.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.edit(tracking);

        // 将信息移至冻结信息表 T_WIP_FREEZE_INFO_LOG产品冻结信息日志表
        /*
         * freeze.getColMap().put("ID", StringUtils.getUUID()); freeze.getColMap().put("WFI_SN",
         * WFI_SN); freeze.getColMap().put("WFI_AREA_SN", WFI_AREA_SN);
         * freeze.getColMap().put("WFI_MO_NUMBER", WFI_MO_NUMBER);
         * freeze.getColMap().put("WFI_MODEL_CODE", WFI_MODEL_CODE);
         * freeze.getColMap().put("WFI_PROCESS_FACE", WFI_PROCESS_FACE);
         * freeze.getColMap().put("WFI_NUM", WFI_NUM); freeze.getColMap().put("WFI_LOT", WFI_LOT);
         * freeze.getColMap().put("WFI_CUST_CODE", WFI_CUST_CODE);
         * freeze.getColMap().put("WFI_ERROR_FLAG", WFI_ERROR_FLAG);
         * freeze.getColMap().put("WFI_ERROR_DOC", WFI_ERROR_DOC); modelService.save(freeze);
         */

        // 解冻后改变产品冻结信息表信息
        ArrayList<Object> paraList2 = new ArrayList<Object>();
        CommMethod.editSysDefCol(freeze1.getColMap(), modelAction.getUser());
        // freeze1.setSqlWhere(" and id='" + strArray[i] + "'");
        freeze1.setSqlWhere(" and id=? ");
        paraList2.add(strArray[i]);
        freeze1.setSqlWhereArgs(paraList2);
        freeze1.getColMap().put("WFI_FREEZE_FLAG", "N");
        freeze1.getColMap().put("WFI_THAW_EMP", CommMethod.getSessionUser().getId());
        freeze1.getColMap().put("WFI_THAW_TIME", sdf.parse(sdf.format(new Date())));
        if (dataAuth != null)
        {
          freeze1.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.edit(freeze1);
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("解冻失败"), e);//
    }
    return modelAction.reloadParent(modelAction.getText("解冻成功"));
  }

}
