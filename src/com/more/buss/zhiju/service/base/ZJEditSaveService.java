package com.more.buss.zhiju.service.base;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 制具-编辑保存
 * @author development
 *
 */
public class ZJEditSaveService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    TableDataMapExt td = new TableDataMapExt();
    String cfiId = modelAction.getDataId();
    String rohs = "";
    List<Object> sqlWList =  new ArrayList<Object>();
    sqlWList.add(cfiId);
    
    // 获取前端的值;
    if (request.getParameter("paraMapObj.CFI_ROHS_FLAG") == null)
    {
      rohs = "N";
    }
    else
    {
      rohs = request.getParameter("paraMapObj.CFI_ROHS_FLAG");
    }
    String cfiAddWay = request.getParameter("paraMapObj.CFI_ADDWAY");
    String cfiInstockDoc = request.getParameter("paraMapObj.CFI_INSTOCK_DOC");
    String cfiSupplierCode = request.getParameter("paraMapObj.CFI_SUPPLIER_CODE");
    String cfiRohsFlag = rohs;
    String cfiTotalUsage = request.getParameter("paraMapObj.CFI_TOTAL_USAGE").equals("")?"0":request.getParameter("paraMapObj.CFI_TOTAL_USAGE");
    String cfiLeftTop = request.getParameter("paraMapObj.CFI_LEFT_TOP");
    String cfiRightTop = request.getParameter("paraMapObj.CFI_RIGHT_TOP");
    String cfiMiddle = request.getParameter("paraMapObj.CFI_MIDDLE");
    String cfiLeftLower = request.getParameter("paraMapObj.CFI_LEFT_LOWER");
    String cfiRightLower = request.getParameter("paraMapObj.CFI_RIGHT_LOWER");
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    //String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
    
    
    
    String cfiMemo = request.getParameter("paraMapObj.CFI_MEMO");
    System.out.println(cfiMemo);
    td.setTableName("T_CO_FIXTURE_INFO");
    sqlWList.add(dataAuth);
    td.setSqlWhere(" and ID=? and data_auth=?");
    td.setSqlWhereArgs(sqlWList);
    Map<String, Object> cfiMap = td.getColMap();
    cfiMap.put("CFI_ADDWAY", cfiAddWay);
    cfiMap.put("CFI_INSTOCK_DOC", cfiInstockDoc);
    cfiMap.put("CFI_SUPPLIER_CODE", cfiSupplierCode);
    cfiMap.put("CFI_ROHS_FLAG", cfiRohsFlag);
    cfiMap.put("CFI_TOTAL_USAGE", Integer.valueOf(cfiTotalUsage));
    cfiMap.put("CFI_LEFT_TOP", Integer.valueOf(cfiLeftTop));
    cfiMap.put("CFI_RIGHT_TOP", Integer.valueOf(cfiRightTop));
    cfiMap.put("CFI_MIDDLE", Integer.valueOf(cfiMiddle));
    cfiMap.put("CFI_LEFT_LOWER", Integer.valueOf(cfiLeftLower));
    cfiMap.put("CFI_RIGHT_LOWER", Integer.valueOf(cfiRightLower));
    cfiMap.put("CFI_MEMO", cfiMemo);
    int rightTop = Integer.valueOf(cfiRightTop).intValue();
    int leftTop = Integer.valueOf(cfiLeftTop).intValue();
    int middle = Integer.valueOf(cfiMiddle).intValue();
    int leftLower = Integer.valueOf(cfiLeftLower).intValue();
    int rightLower = Integer.valueOf(cfiRightLower).intValue();
    int[] a =new int[]{rightTop,leftLower,rightLower,leftTop,middle};
    Arrays.sort(a);
    int STRAIN_DIS =a[4]-a[0];
    String CFI_STRAIN_DIS = STRAIN_DIS+"";//张力差异
    cfiMap.put("CFI_STRAIN_DIS", Integer.valueOf(CFI_STRAIN_DIS));
    
    String cfiCycleRemind= request.getParameter("paraMapObj.CFI_CYCLE_REMIND");//保养次数
    cfiMap.put("CFI_CYCLE_REMIND", Integer.valueOf(cfiCycleRemind));
    String cfiRemindCycle= request.getParameter("paraMapObj.CFI_REMIND_CYCLE");//保养提醒次数
    cfiMap.put("CFI_REMIND_CYCLE", Integer.valueOf(cfiRemindCycle));
    String cfiPeriodLimit= request.getParameter("paraMapObj.CFI_PERIOD_LIMIT");//周期上限
    cfiMap.put("CFI_PERIOD_LIMIT", Integer.valueOf(cfiPeriodLimit));
    String cfiUpkeepReriod= request.getParameter("paraMapObj.CFI_UPKEEP_PERIOD");//保养周期
    cfiMap.put("CFI_UPKEEP_PERIOD", Integer.valueOf(cfiUpkeepReriod));
    String cfiRemindDay= request.getParameter("paraMapObj.CFI_REMIND_DAY");//保养提醒天数
    cfiMap.put("CFI_REMIND_DAY", Integer.valueOf(cfiRemindDay));
    String cfiTinckness= request.getParameter("paraMapObj.CFI_TINCKNESS").equals("")?"0":request.getParameter("paraMapObj.CFI_TINCKNESS");//厚度
    cfiMap.put("CFI_TINCKNESS", Double.parseDouble(cfiTinckness));
    String cfiFlaness= request.getParameter("paraMapObj.CFI_FLATNESS").equals("")?"0":request.getParameter("paraMapObj.CFI_FLATNESS");//整齐度
    cfiMap.put("CFI_FLATNESS", Double.parseDouble(cfiFlaness));
    String stockCode= request.getParameter("STORAGE_CODES");//库位SN

    String whCode= request.getParameter("WH_CODES");//仓库
    if (StringUtils.isNotBlank(whCode)) {
        cfiMap.put("CFI_STOCK_SN", stockCode);
        cfiMap.put("CFI_WH_CODE", whCode);
    }
    //String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    if(dataAuth!=null){
      cfiMap.put("DATA_AUTH", dataAuth);// 组织结构
    }
    

    try
    {
     int res = modelService.edit(td);
     System.out.println(res);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }
    String iframeId = request.getParameter("iframeId");
    String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), isCloseWin);
  }

}
