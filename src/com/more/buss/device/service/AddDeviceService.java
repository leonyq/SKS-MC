package com.more.buss.device.service;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.FileCopyUtils;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 增加设备的基本信息以及料站信息
 * @ClassName AddDeviceService
 * @author development
 * @Company: morelean
 */
public class AddDeviceService implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    // OperResult operResult=null;
    try
    {
      String deviceSn = request.getParameter("paraMap0@0#CD_DEVICE_SN");

      String sql = "select t.cd_device_sn from T_CO_DEVICE t where t.cd_device_sn=? and t.data_auth=? ";
      int count = modelService.countSql(sql, new Object[] {deviceSn,dataAuth});
      if (count != 0)
      {
        return modelAction.alertParentInfo(modelAction.getText("设备SN已存在"));
      }

      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      // 获取设备基本信息
      String deviceName = request.getParameter("paraMap0@0#CD_DEVICE_NAME");
      String deviceSpec = request.getParameter("paraMap0@0#CD_DEVICE_SPEC");
      String deviceType = request.getParameter("paraMap0@0#CD_DEVICE_TYPE");
      String deviceClass = request.getParameter("paraMap0@0#CD_DEVICE_CLASS");
      String validFlag = request.getParameter("paraMap0@0#CD_VALID_FLAG");
      String useDep = request.getParameter("paraMap0@0#CD_USE_DEP");
      String chargeMan = request.getParameter("paraMap0@0#CD_CHARGE_MAN");
      
      String chargeManTwo = request.getParameter("paraMap0@0#CD_CHARGE_MAN_TWO");
      String chargeManThree = request.getParameter("paraMap0@0#CD_CHARGE_MAN_THREE");
      
      
      String deviceStatus = request.getParameter("paraMap0@0#CD_STATUS");
      Date prodectDate = sdf.parse(request.getParameter("paraMap0@0#CD_PRODECT_DATE"));
      Date buyDate = sdf.parse(request.getParameter("paraMap0@0#CD_BUY_DATE"));
      String supplierId = request.getParameter("paraMap0@0#CD_SUPPLIER_ID");
      String deviceMemo = request.getParameter("paraMap0@0#CD_MEMO");
      String deviceLocation = request.getParameter("paraMap0@0#CD_LOCATION");// 设备位置
      String deviceCycle = request.getParameter("paraMap0@0#CD_CYCLE");//点检周期
      String deviceFile = request.getParameter("paraMap0@0#CD_FILES");//设备文件
      //String dataAuth =request.getParameter("_DATA_AUTH");//组织机构
      // String devicePicture = request.getParameter("paraMap1@0#CD_PICTURE");//设备图片
      String pictureName = null;
      String picturePath = null;
      int pictureSize = 0;
      FileInputStream fis = null;
      FileOutputStream fos = null;
      // InputStream is = null;
      byte[] b = null;
      // 设备图片
      String separator = Constants.SEPARATOR;
      if (modelAction.getUpFile() != null)
      {
        pictureName = modelAction.getUpFileFileName(); // 图片名称
        picturePath = pictureName.substring(pictureName.lastIndexOf(".") + 1);
        picturePath = StringUtils.getUUID() + "." + picturePath;
        String realPath = modelAction.getRequest().getSession().getServletContext().getRealPath(
          "up_load"+separator+"comm" +separator+ picturePath);
        fis = new FileInputStream(modelAction.getUpFile());
        // is = new modelAction.getUpFile()
        pictureSize = fis.available(); // 图片大小
        b = FileCopyUtils.copyToByteArray(fis);
        File file = modelAction.getUpFile();
        fos = new FileOutputStream(realPath);
        BufferedInputStream bf = new BufferedInputStream(new FileInputStream(file));
        byte[] bt = new byte[1024];
        int n = bf.read(bt);
        while (n != -1)
        {
          fos.write(bt, 0, n);
          fos.flush();
          n = bf.read(bt);
        }

      }

      String id = StringUtils.getUUID();
      if (validFlag == null || validFlag == "" || validFlag.equals(""))
      {
        validFlag = "N";
      }

      // 插入设备基本信息
      TableDataMapExt device = new TableDataMapExt();
      device.setTableName("T_CO_DEVICE");
      CommMethod.addSysDefCol(device.getColMap(), modelAction.getUser());
      device.getColMap().put("ID", id);
      device.getColMap().put("CD_DEVICE_SN", deviceSn);
      device.getColMap().put("CD_DEVICE_NAME", deviceName);
      device.getColMap().put("CD_DEVICE_SPEC", deviceSpec);
      device.getColMap().put("CD_DEVICE_TYPE", deviceType);
      device.getColMap().put("CD_DEVICE_CLASS", deviceClass);
      device.getColMap().put("CD_VALID_FLAG", validFlag);
      device.getColMap().put("CD_USE_DEP", useDep);
      device.getColMap().put("CD_CHARGE_MAN", chargeMan);
      
      device.getColMap().put("CD_CHARGE_MAN_TWO", chargeManTwo);
      device.getColMap().put("CD_CHARGE_MAN_THREE", chargeManThree);
      
      device.getColMap().put("CD_STATUS", deviceStatus);
      device.getColMap().put("CD_PRODECT_DATE", prodectDate);
      device.getColMap().put("CD_BUY_DATE", buyDate);
      device.getColMap().put("CD_SUPPLIER_ID", supplierId);
      device.getColMap().put("CD_MEMO", deviceMemo);
      device.getColMap().put("CD_LOCATION", deviceLocation);
      if(deviceCycle!=null&&deviceCycle!="") {
    	  device.getColMap().put("CD_CYCLE", Integer.parseInt(deviceCycle));
      }else {
    	  device.getColMap().put("CD_CYCLE", 0);
      }
      device.getColMap().put("CD_FILES", deviceFile);
      device.getColMap().put("CD_MT_DATE", sdf1.parse(sdf1.format(new Date())));
      if (pictureName != null)
      {
        device.getColMap().put("PICTURE_NAME", pictureName);
        device.getColMap().put("PICTURE_SIZE", pictureSize);
        device.getColMap().put("PICTURE_PATH", picturePath);
        device.getColMap().put("CD_PICTURE", b);
      
      }
      //if(dataAuth!=null){
     // 		device.getColMap().put("DATA_AUTH", dataAuth);// 组织结构
      //  }
        
      modelService.save(device);

      //根据设备类型获取对应的项目信息写入设备关联项目信息表 T_CO_DEVICE_ITEM_INFO
      String querySql = "SELECT * FROM T_CO_DEVICE_ITEM t WHERE t.cdi_device_type=? and t.data_auth=? ";
      List<Map> sList = modelService.listDataSql(querySql, new Object[] { deviceType,dataAuth });
      if(sList!=null && sList.size()>0){
    	  String itemType = null;
    	  String itemCode = null;
    	  String itemName = null;
    	  String itemClass = null;
    	  String itemMaxValue = null;
    	  String itemMinValue = null;
    	  String itemUnit = null;
    	  String cycle = null;
    	  
    	  TableDataMapExt deviceItemInfo = new TableDataMapExt();
          deviceItemInfo.setTableName("T_CO_DEVICE_ITEM_INFO");
    	  for(int i=0;i<sList.size();i++){
    		  itemType = (String) sList.get(i).get("CDI_ITEM_TYPE"); //项目类型
    		  itemCode = (String) sList.get(i).get("CDI_ITEM_CODE"); //项目代码
    		  itemName = (String) sList.get(i).get("CDI_ITEM_NAME"); //项目名称
    		  itemClass = (String) sList.get(i).get("CDI_ITEM_CLASS"); //值域（0范围值，1固定值，2状态值）
    		  if(sList.get(i).get("CDI_ITEM_MAXVALUE")!=null){
    			  itemMaxValue = sList.get(i).get("CDI_ITEM_MAXVALUE").toString(); //上限值
    		  }else
    			  itemMaxValue = "";
    		  if(sList.get(i).get("CDI_ITEM_MINVALUE")!=null){
    			  itemMinValue = sList.get(i).get("CDI_ITEM_MINVALUE").toString(); //下限值
    		  }else
    			  itemMinValue = "";
    		  if(sList.get(i).get("CDI_ITEM_UNIT")!=null){
    			  itemUnit = sList.get(i).get("CDI_ITEM_UNIT").toString(); //单位
    		  }else
    			  itemUnit = "";
    		  if(sList.get(i).get("CDI_CYCLE")!=null){
    			  cycle = sList.get(i).get("CDI_CYCLE").toString(); //周期（天）
    		  }else
    			  cycle = "";
    		  
    		  CommMethod.addSysDefCol(deviceItemInfo.getColMap(), modelAction.getUser());
    		  deviceItemInfo.getColMap().put("ID", StringUtils.getUUID());
    		  deviceItemInfo.getColMap().put("CDII_DEVICE_SN", deviceSn);
    		  deviceItemInfo.getColMap().put("CDII_ITEM_TYPE", itemType);
    		  deviceItemInfo.getColMap().put("CDII_ITEM_CODE", itemCode);
    		  deviceItemInfo.getColMap().put("CDII_ITEM_NAME", itemName);
    		  deviceItemInfo.getColMap().put("CDII_ITEM_CLASS", itemClass);
    		  if (StringUtils.isNotBlank(itemMaxValue))
          {
    		    deviceItemInfo.getColMap().put("CDII_ITEM_MAXVALUE", Double.valueOf(itemMaxValue));
          }
    		  if (StringUtils.isNotBlank(itemMinValue))
          {
    		    deviceItemInfo.getColMap().put("CDII_ITEM_MINVALUE", Double.valueOf(itemMinValue));
          }
    		  
    		  deviceItemInfo.getColMap().put("CDII_ITEM_UNIT", itemUnit);
    		  if (StringUtils.isNotBlank(cycle))
          {
    		    deviceItemInfo.getColMap().put("CDII_CYCLE", Double.valueOf(cycle));
          }
    		 
    		//  if(dataAuth!=null){
    		//	  deviceItemInfo.getColMap().put("DATA_AUTH", dataAuth);// 组织结构
    	    //  }
    		  modelService.save(deviceItemInfo);
    	  }
      }
      // 获取料站信息条数
      String trCount1 = request.getParameter("trCount");
      int trCount;
      // 如果信息条数不为空
      if (!trCount1.equals("0"))
      {
        trCount = Integer.parseInt(trCount1);
        // 循环料站信息条数并插入数据库
        TableDataMapExt loadPointTable = new TableDataMapExt();
        String table = null;
        String loadPoint = null;
        String track = null;
        String memo = null;
        String loadPointId = null;
        for (int i = 1; i <= trCount; i++ )
        {
          table = request.getParameter("CDL_TABLE_" + i);
          loadPoint = request.getParameter("CDL_LOADPOINT_" + i);
          track = request.getParameter("CDL_TRACK_" + i);
          memo = request.getParameter("CDL_MEMO_" + i);
          loadPointId = StringUtils.getUUID();
          if (table != null && loadPoint != null && track != null)
          {
            loadPointTable.setTableName("T_CO_DEVICE_LOADPOINT");
            CommMethod.addSysDefCol(loadPointTable.getColMap(), modelAction.getUser());
            loadPointTable.getColMap().put("ID", loadPointId);
            loadPointTable.getColMap().put("CD_DEVICE_ID", id);
            loadPointTable.getColMap().put("CD_DEVICE_SN", deviceSn);
            loadPointTable.getColMap().put("CDL_TABLE", table);
            loadPointTable.getColMap().put("CDL_LOADPOINT", loadPoint);
            loadPointTable.getColMap().put("CDL_TRACK", track);
            loadPointTable.getColMap().put("CDL_MEMO", memo);
           // if(dataAuth!=null){
      	//	loadPointTable.getColMap().put("DATA_AUTH", dataAuth);// 组织结构
          //  }
            
            modelService.save(loadPointTable);
          }
        }
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }/*
      * finally { try { if (null != fos) fos.close(); if (null != bf) bf.close(); } catch
      * (Exception e2) { e2.printStackTrace(); } }
      */
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);

  }

}
