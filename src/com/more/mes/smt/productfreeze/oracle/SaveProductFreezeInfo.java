package com.more.mes.smt.productfreeze.oracle;

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
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 产品冻结信息-产品冻结保存
 * 
 * @author development
 */
public class SaveProductFreezeInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("_DATA_AUTH");
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String wtSns = request.getParameter("wtSns");// 产品sn
      String wfiErrorDoc = request.getParameter("paraMap1@0#WFI_ERROR_DOC");// 异常单号
      String checkLot = request.getParameter("checkLot");// 检验批
      String[] strArray=new String[]{};
      if(wtSns!=null&&!wtSns.equals("")){
          strArray = wtSns.split(",");
      }
      String wtSn = null;
      List<Map> trackingList = null;
      String wfiAreaSn = null;// 线别
      String wfiMoNumber = null;// 制令单
      String wfiModelCode = null;// 机种
      String wfiProcessFace = null;// 生产面别（0：单面，1正面，2反面，3阴阳面）
      int wfiNum = 0;// 数量
      String wfiLot = null;// 生产批号
      String wfiCustCode = null;// 客户代码
      String wfiErrorFlag = null;// 冻结前产品状态(0正常、1不良、2维修、3报废、4冻结)
      String sql = "select * from T_WIP_TRACKING where wt_sn=? and data_auth=?";
      TableDataMapExt tracking = new TableDataMapExt();
      tracking.setTableName("T_WIP_FREEZE_INFO"); // 产品冻结信息表

      TableDataMapExt tracking1 = new TableDataMapExt();
      tracking1.setTableName("T_WIP_TRACKING"); // 产品在制信息表

      for (int i = 0; i < strArray.length; i++ )
      {
        wtSn = strArray[i];
        trackingList = modelService.listDataSql(sql, new Object[] {wtSn, dataAuth});
        wfiAreaSn = (String)trackingList.get(0).get("WT_AREA_SN");
        wfiMoNumber = (String)trackingList.get(0).get("WT_MO_NUMBER");
        wfiModelCode = (String)trackingList.get(0).get("WT_MODEL_CODE");
        wfiProcessFace = (String)trackingList.get(0).get("WT_PROCESS_FACE");
        wfiNum = Integer.parseInt(trackingList.get(0).get("WT_NUM").toString());
        wfiLot = (String)trackingList.get(0).get("WT_LOT");
        wfiCustCode = (String)trackingList.get(0).get("WT_CUST_CODE");
        wfiErrorFlag = (String)trackingList.get(0).get("WT_ERROR_FLAG");

        CommMethod.addSysDefCol(tracking.getColMap(), modelAction.getUser());
        tracking.getColMap().put("ID", StringUtils.getUUID());
        tracking.getColMap().put("WFI_SN", wtSn);
        tracking.getColMap().put("WFI_AREA_SN", wfiAreaSn);
        tracking.getColMap().put("WFI_MO_NUMBER", wfiMoNumber);
        tracking.getColMap().put("WFI_MODEL_CODE", wfiModelCode);
        tracking.getColMap().put("WFI_PROCESS_FACE", wfiProcessFace);
        tracking.getColMap().put("WFI_NUM", wfiNum);
        tracking.getColMap().put("WFI_LOT", wfiLot);
        tracking.getColMap().put("WFI_CUST_CODE", wfiCustCode);
        tracking.getColMap().put("WFI_ERROR_FLAG", wfiErrorFlag);
        tracking.getColMap().put("WFI_ERROR_DOC", wfiErrorDoc);
        tracking.getColMap().put("WFI_INSPECT_SN", checkLot);
        tracking.getColMap().put("WFI_FREEZE_FLAG", "Y");
        tracking.getColMap().put("WFI_FREEZE_EMP", CommMethod.getSessionUser().getId());
        tracking.getColMap().put("WFI_FREEZE_TIME", sdf1.parse(sdf1.format(new Date())));
        if (dataAuth != null)
        {
          tracking.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.save(tracking);

        // 修改T_WIP_TRACKING表WT_ERROR_FLAG字段值为4，冻结状态
        ArrayList<Object> paraList = new ArrayList<Object>();
        CommMethod.editSysDefCol(tracking1.getColMap(), modelAction.getUser());
        tracking1.setSqlWhere(" and WT_SN= ? and data_auth= ?");
        //tracking1.setSqlWhere("  ");
        // tracking1.setSqlWhere(" and WT_SN='" + wtSn + "'");
        paraList.add(wtSn);
        paraList.add(dataAuth);
        tracking1.setSqlWhereArgs(paraList);
        tracking1.getColMap().put("WT_ERROR_FLAG", "4");
        modelService.edit(tracking1);
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("保存失败")+StringUtils.toString(e), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), "0");
  }

}
