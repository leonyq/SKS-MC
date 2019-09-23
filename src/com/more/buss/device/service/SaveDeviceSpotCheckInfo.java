package com.more.buss.device.service;

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
 * 设备点检保存
 * @author development
 *
 */
public class SaveDeviceSpotCheckInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());
  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String formId = request.getParameter("formId");
        if(StringUtils.isBlank(formId)){
            formId = request.getParameter("formIds");
        }
        String iframeId = request.getParameter("iframeId");
        try
        {
          
          
          
          
          String deviceSn = request.getParameter("paraMapObj.CD_DEVICE_SN"); //设备sn
          String deviceType = request.getParameter("CD_DEVICE_TYPE"); //设备类型
          String deviceClass = request.getParameter("CD_DEVICE_CLASS");//设备型号
          String cdsTaskTime = request.getParameter("paraMapObj.CDS_TASK_TIME"); //工时
          String cdsCheckTime = request.getParameter("paraMapObj.CDS_CHECK_TIME");//点检时间
          String cdsRepairEmp = request.getParameter("paraMapObj.CDS_REPAIR_EMP"); //点检人员
          String cdsMemo = request.getParameter("paraMapObj.CDS_MEMO");//备注
          String dataAuth =request.getParameter("paraMapObj._DATA_AUTH");//组织机构
          String checkId = StringUtils.getUUID();//设备点检信息id
          String cdsCycle = request.getParameter("paraMapObj.CDS_CYCLE"); //点检周期（天/次）
          

          
          TableDataMapExt deviceMtInfo = new TableDataMapExt(); //设备点检信息表
          deviceMtInfo.setTableName("T_CO_DEVICE_SPOT_CHECK");
          CommMethod.addSysDefCol(deviceMtInfo.getColMap(), modelAction.getUser());
          deviceMtInfo.getColMap().put("ID", checkId);
          deviceMtInfo.getColMap().put("CDS_DEVICE_CLASS", deviceClass);
          deviceMtInfo.getColMap().put("CDS_DEVICE_SN", deviceSn);
          deviceMtInfo.getColMap().put("CDS_DEVICE_TYPE", deviceType);
          deviceMtInfo.getColMap().put("CDS_MEMO", cdsMemo);
          deviceMtInfo.getColMap().put("CDS_REPAIR_EMP", cdsRepairEmp);
          if (StringUtils.isNotBlank(cdsTaskTime))
          {
            deviceMtInfo.getColMap().put("CDS_TASK_TIME", Double.valueOf(cdsTaskTime));
          }
          if (StringUtils.isNotBlank(cdsCycle))
          {
            deviceMtInfo.getColMap().put("CDS_CYCLE", Double.valueOf(cdsCycle));
          }
          deviceMtInfo.getColMap().put("CDS_CHECK_TIME", DateUtil.parseDate(cdsCheckTime,"yyyy-MM-dd HH:mm:ss"));
         
          if(dataAuth!=null){
            deviceMtInfo.getColMap().put("DATA_AUTH", dataAuth);
          }
          
          modelService.save(deviceMtInfo);
          
          
          //获取项目类别
          String deviceItemType1 = request.getParameter("type1");  //点检项目
          String[] deviceItemCode = request.getParameterValues("deviceItemCodes");
          String[] deviceItemName = request.getParameterValues("deviceItemNames");
          String[] deviceItemClass = request.getParameterValues("deviceItemClasss");
          String[] deviceItemMaxValue = request.getParameterValues("deviceitemMaxvalues");
          String[] deviceItemMinValue = request.getParameterValues("deviceitemMinvalues");
          String[] deviceItemReal= request.getParameterValues("deviceItemReal");
          String[] deviceItemContent = request.getParameterValues("deviceItemContent");
          
          TableDataMapExt deviceMaintenance = new TableDataMapExt(); //设备保养明细表
          deviceMaintenance.setTableName("T_CO_DEVICE_MT_DETAIL"); //设备保养明细表
          
          
         
          if (null!=deviceItemCode )
          {
            int num1 = deviceItemCode.length;
            if (num1>0 )
            {
            for (int i = 0; i < num1; i++ )
            {
              deviceMaintenance.getColMap().clear();
              CommMethod.addSysDefCol(deviceMaintenance.getColMap(), modelAction.getUser());
              deviceMaintenance.getColMap().put("ID", StringUtils.getUUID());
              deviceMaintenance.getColMap().put("CDMI_ID", checkId);
              deviceMaintenance.getColMap().put("CDMI_ITEM_TYPE", deviceItemType1);
              deviceMaintenance.getColMap().put("CDMI_ITEM_CODE", deviceItemCode[i]);
              deviceMaintenance.getColMap().put("CDMI_ITEM_NAME", deviceItemName[i]);
              deviceMaintenance.getColMap().put("CDMI_ITEM_CLASS", deviceItemClass[i]);
              if (StringUtils.isNotBlank(deviceItemMaxValue[i]))
              {
                deviceMaintenance.getColMap().put("CDMI_ITEM_MAXVALUE", Double.valueOf(deviceItemMaxValue[i]));
              }
              if (StringUtils.isNotBlank(deviceItemMinValue[i]))
              {
                deviceMaintenance.getColMap().put("CDMI_ITEM_MINVALUE", Double.valueOf(deviceItemMinValue[i]));
              }
              if (StringUtils.isNotBlank(deviceItemReal[i]))
              {
                deviceMaintenance.getColMap().put("CDMI_ITEM_REAL", Double.valueOf(deviceItemReal[i]));
              }
              
             
              
              deviceMaintenance.getColMap().put("CDMI_MT_CONTENT", deviceItemContent[i]);
              if(dataAuth!=null){
                deviceMaintenance.getColMap().put("DATA_AUTH", dataAuth);
               }
         
              modelService.save(deviceMaintenance);
              
            }
          }
          }
          
          
        }
        catch (NumberFormatException e) {
			// TODO: handle exception
        	log.error(e);
            throw new BussException(modelAction.getText("格式转换错误"), e);
		}
        catch (Exception e)
        {
          // TODO: handle exception
          log.error(e);
          throw new BussException(modelAction.getText("保存失败"), e);
        }
        return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), "0");
  }

}
