package com.more.buss.device.service;

import java.text.SimpleDateFormat;
import java.util.Date;

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
 * 设备维修保存
 * 
 * @author development
 */
public class SaveDeviceRepairInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    try
    {
      // 设备维修信息字段
      String deviceSn = request.getParameter("paraMapObj.CD_DEVICE_SN"); // 设备sn
      String deviceType = request.getParameter("CD_DEVICE_TYPE"); // 设备类型
      String deviceClass = request.getParameter("CD_DEVICE_CLASS");// 设备型号
      String repairReason = request.getParameter("paraMapObj.CDE_REPAIR_REASON");// 故障原因
      String repairLong = request.getParameter("paraMapObj.CDE_REPAIR_LONG");// 维修工时
      String repairMethod = request.getParameter("paraMapObj.CDE_REPAIR_METHOD");// 维修方法
      String reportEmp = request.getParameter("paraMapObj.CDE_REPORT_EMP");// 报修人
      String auditEmp = request.getParameter("paraMapObj.CDE_AUDIT_EMP");// 确认人
      String reportDesc = request.getParameter("paraMapObj.CDE_REPAIR_DESC");// 故障描述
      String reportMemo = request.getParameter("paraMapObj.CDE_REPAIR_MEMO");// 维修内容
      String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");// 组织机构
      String selCount = request.getParameter("selCount");//
      Integer flag = Integer.parseInt(request.getParameter("flag"));
      String reportId = StringUtils.getUUID();// 设备维修信息id
      TableDataMapExt deviceRepairInfo = new TableDataMapExt(); // 设备维修信息表
      deviceRepairInfo.setTableName("T_CO_DEVICE_REPAIR_INFO");
      CommMethod.addSysDefCol(deviceRepairInfo.getColMap(), modelAction.getUser());
      deviceRepairInfo.getColMap().put("ID", reportId);
      deviceRepairInfo.getColMap().put("CDE_DEVICE_SN", deviceSn);
      deviceRepairInfo.getColMap().put("CDE_DEVICE_TYPE", deviceType);
      deviceRepairInfo.getColMap().put("CDE_DEVICE_CLASS", deviceClass);
      deviceRepairInfo.getColMap().put("CDE_REPAIR_REASON", repairReason);
      deviceRepairInfo.getColMap().put("CDE_REPAIR_LONG", Double.valueOf(repairLong));
      deviceRepairInfo.getColMap().put("CDE_REPAIR_METHOD", repairMethod);
      deviceRepairInfo.getColMap().put("CDE_REPORT_EMP", reportEmp);
      deviceRepairInfo.getColMap().put("CDE_AUDIT_EMP", auditEmp);
      deviceRepairInfo.getColMap().put("CDE_REPAIR_DESC", reportDesc);
      deviceRepairInfo.getColMap().put("CDE_REPAIR_MEMO", reportMemo);
      deviceRepairInfo.getColMap().put("CDE_REPAIR_EMP", CommMethod.getSessionUser().getId());
      deviceRepairInfo.getColMap().put("CDE_REPAIR_TIME", sdf.parse(sdf.format(new Date())));
      if (dataAuth != null)
      {
        deviceRepairInfo.getColMap().put("DATA_AUTH", dataAuth);
      }

      modelService.save(deviceRepairInfo);
      
      if(flag==1){
                // 更换配件保存
      String[] docNums = request.getParameterValues("DOC_NUM");// 领料单号
      String[] itemSns = request.getParameterValues("ITEM_SN");// 备件SN
      String[] itemCodes = request.getParameterValues("ITEM_CODE");// 配料料号
      String[] itemNums = request.getParameterValues("ITEM_NUM");// 配件数量
      String[] changeReasons = request.getParameterValues("CHANGE_REASON");// 更换原因
      String[] memos = request.getParameterValues("MEMO");// 备注
      if(null!=docNums ){
      TableDataMapExt deviceFitting = new TableDataMapExt(); // 设备备件更换信息表
      deviceFitting.setTableName("T_CO_DEVICE_FITTING"); // 设备备件更换信息表
      for (int i = 0; i < docNums.length; i++ )
      {
        CommMethod.addSysDefCol(deviceFitting.getColMap(), modelAction.getUser());
        if (dataAuth != null)
        {
          deviceFitting.getColMap().put("DATA_AUTH", dataAuth);
        }
        deviceFitting.getColMap().put("ID", StringUtils.getUUID());
        deviceFitting.getColMap().put("CDF_ID", reportId);// 保养/维修记录ID
        deviceFitting.getColMap().put("CDF_TYPE", "2");// 操作类型
        deviceFitting.getColMap().put("CDF_ITEM_LIST", docNums[i]);
        deviceFitting.getColMap().put("CDF_ITEM_SN", itemSns[i]);
        deviceFitting.getColMap().put("CDF_ITEM_CODE", itemCodes[i]);
        if (StringUtils.isNotBlank(itemNums[i]))
        {
          deviceFitting.getColMap().put("CDF_ITEM_NUM", Integer.parseInt(itemNums[i]));
        }
        
        deviceFitting.getColMap().put("CDF_CHANGE_REASON", changeReasons[i]);
        deviceFitting.getColMap().put("CDF_MEMO", memos[i]);

        modelService.save(deviceFitting);
      }
    }
      }

      /*
       * if (Integer.parseInt(selCount) != 0) { Map map = modelService.getAddComm(request,
       * modelAction.getCurrUser(), modelAction); for (Object key : map.keySet()) { String tempCode
       * = null; String tempCode1 = null; String itemList = null; String itemNum = null; String
       * changeReason = null; String memo = null; TableDataMapExt deviceFitting = new
       * TableDataMapExt(); // 设备备件更换信息表 deviceFitting.setTableName("T_CO_DEVICE_FITTING"); //
       * 设备备件更换信息表 if (key.toString().equals("37706529238246b884d06623606e4320")) { JSONArray array
       * = JSONArray.fromObject(map.get(key)); for (int i = 0; i < array.size(); i++ ) { tempCode =
       * array.getJSONObject(i).get("CDF_ITEM_CODE").toString();// 配件料号 for (int j = i + 1; j <
       * array.size(); j++ ) { tempCode1 = array.getJSONObject(j).get("CDF_ITEM_CODE").toString();
       * if (tempCode1.equals(tempCode)) { return
       * modelAction.alertParentInfo((modelAction.getText("配件料号不能相同"))); } } itemList =
       * array.getJSONObject(i).get("CDF_ITEM_LIST").toString();// 领料单号 itemNum =
       * array.getJSONObject(i).get("CDF_ITEM_NUM").toString();// 配件数量 changeReason =
       * array.getJSONObject(i).get("CDF_CHANGE_REASON").toString();// 更换原因 memo =
       * array.getJSONObject(i).get("CDF_MEMO").toString();// 备注
       * CommMethod.addSysDefCol(deviceFitting.getColMap(), modelAction.getUser());
       * deviceFitting.getColMap().put("ID", StringUtils.getUUID());
       * deviceFitting.getColMap().put("CDF_ID", reportId);// 保养/维修记录ID
       * deviceFitting.getColMap().put("CDF_TYPE", "2");// 操作类型
       * deviceFitting.getColMap().put("CDF_ITEM_LIST", itemList);
       * deviceFitting.getColMap().put("CDF_ITEM_CODE", tempCode);
       * deviceFitting.getColMap().put("CDF_ITEM_NUM", itemNum);
       * deviceFitting.getColMap().put("CDF_CHANGE_REASON", changeReason);
       * deviceFitting.getColMap().put("CDF_MEMO", memo); if (dataAuth != null) {
       * deviceFitting.getColMap().put("DATA_AUTH", dataAuth); } if (tempCode == "" && itemList ==
       * "" && itemNum == "" && changeReason == "" && memo == "") { } else { if (itemNum != "") {
       * if (tempCode != "") { modelService.save(deviceFitting); } } else {
       * modelService.save(deviceFitting); } } } } } }
       */

    }
    catch (NumberFormatException e) {
		// TODO: handle exception
    	log.error(e);
        throw new BussException(modelAction.getText("格式转换错误"), e);
	}
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("保存失败"), e);
    }
    // return
     //modelAction.commAjaxFunClassLoadParent(formId,iframeId,Constants.SUCCESS,Constants.OPERATE_TYPE_ADD);
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), "0");
  }

}
