package com.more.buss.device.service;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.method.Constants;
import java.io.File;

/**
 * 修改设备保存
 * @author Administrator
 *
 */
public class EditDeviceSaveService  implements FuncService {
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String formId = request.getParameter("formId");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        	if(StringUtils.isBlank(formId)){
          		formId = request.getParameter("formIds");
       		}
        	String iframeId = request.getParameter("iframeId"); 
		try {
			String deviceSn = request.getParameter("paraMapObj.CD_DEVICE_SN");
			String id = request.getParameter("dataId");
			String sql = "select t.cd_device_sn from T_CO_DEVICE t where t.cd_device_sn=? AND T.DATA_AUTH=? and t.id != ?";
			int count = modelService.countSql(sql, new Object[] { deviceSn,dataAuth,id });
			 	if (count != 0) {
			        return modelAction.alertParentInfo(modelAction.getText("设备SN已存在"));
			    }
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		    //获取设备基本信息
		    String deviceName = request.getParameter("paraMapObj.CD_DEVICE_NAME");
		    String deviceSpec = request.getParameter("paraMapObj.CD_DEVICE_SPEC");
		    String deviceType = request.getParameter("paraMapObj.CD_DEVICE_TYPE");
		    String deviceClass = request.getParameter("paraMapObj.CD_DEVICE_CLASS");
		    String validFlag = request.getParameter("paraMapObj.CD_VALID_FLAG");
		    String useDep = request.getParameter("paraMapObj.CD_USE_DEP");
		    String chargeMan = request.getParameter("paraMapObj.CD_CHARGE_MAN");
		    
		    String chargeManTwo = request.getParameter("paraMapObj.CD_CHARGE_MAN_TWO");
            String chargeManThree = request.getParameter("paraMapObj.CD_CHARGE_MAN_THREE");
		    
		    String deviceStatus = request.getParameter("paraMapObj.CD_STATUS");
		    Date prodectDate = sdf.parse(request.getParameter("paraMapObj.CD_PRODECT_DATE"));
		    Date buyDate = sdf.parse(request.getParameter("paraMapObj.CD_BUY_DATE"));
		    String supplierId = request.getParameter("paraMapObj.CD_SUPPLIER_ID");
		    String deviceMemo = request.getParameter("paraMapObj.CD_MEMO");
		     String deviceCycle = request.getParameter("paraMapObj.CD_CYCLE");
		    String deviceLocation = request.getParameter("paraMapObj.CD_LOCATION");// 设备位置
      String deviceFile = request.getParameter("paraMapObj.CD_FILES");//设备文件
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
          "up_load"+separator+"comm"+separator + picturePath);
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

      }		    if(validFlag==null||validFlag==""||validFlag.equals("")){
		    	validFlag="N";
		    }
		    List list = new ArrayList();
		    
		    //修改设备基本信息
		    TableDataMapExt device = new TableDataMapExt();
		    device.setTableName("T_CO_DEVICE");
		    device.setSqlWhere(" and ID=?");
		    list.add(id);
		    device.setSqlWhereArgs(list);
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
      device.getColMap().put("CD_FILES", deviceFile);
      if(deviceCycle!=null&&deviceCycle!="") {
    	  device.getColMap().put("CD_CYCLE", Integer.parseInt(deviceCycle));
      }else {
    	  device.getColMap().put("CD_CYCLE", 0);
      }
      
      if (pictureName != null)
      {
        device.getColMap().put("PICTURE_NAME", pictureName);
        device.getColMap().put("PICTURE_SIZE", pictureSize);
        device.getColMap().put("PICTURE_PATH", picturePath);
        device.getColMap().put("CD_PICTURE", b);
      }
		    modelService.edit(device);
		    
		    //获取料站信息条数
		    String trCount1 = request.getParameter("trCount");
		    int trCount;
		    TableDataMapExt cdl = new TableDataMapExt();
		    //如果信息条数不为空
		    if(!trCount1.equals("0")){
		    	//先删除相关记录
		    	cdl.setTableName("T_CO_DEVICE_LOADPOINT");
		    	cdl.setSqlWhere(" and cd_device_id=? AND DATA_AUTH=? ");
		    	list.clear();
		    	list.add(id);
		    	list.add(dataAuth);
		    	cdl.setSqlWhereArgs(list);
		    	modelService.del(cdl);
		    	trCount = Integer.parseInt(trCount1);
		    	//循环料站信息条数并插入数据库
			    TableDataMapExt loadPointTable = new TableDataMapExt();
			    String table = null;
			    String loadPoint = null;
			    String track = null;
			    String memo = null;
			    String loadPointId = null;
			    for(int i=1;i<=trCount;i++){
			    		table = request.getParameter("CDL_TABLE_"+i);
				    	loadPoint = request.getParameter("CDL_LOADPOINT_"+i);
				    	track = request.getParameter("CDL_TRACK_"+i);
				    	memo = request.getParameter("CDL_MEMO_"+i);
				    	loadPointId = StringUtils.getUUID();
				    	if(table!=null&&loadPoint!=null&&track!=null&&memo!=null){
					    	loadPointTable.setTableName("T_CO_DEVICE_LOADPOINT");
					    	CommMethod.addSysDefCol(loadPointTable.getColMap(), modelAction.getUser());
					    	loadPointTable.getColMap().put("ID", loadPointId);
					    	loadPointTable.getColMap().put("CD_DEVICE_ID", id);
					    	loadPointTable.getColMap().put("CD_DEVICE_SN", deviceSn);
					    	loadPointTable.getColMap().put("CDL_TABLE", table);
					    	loadPointTable.getColMap().put("CDL_LOADPOINT", loadPoint);
					    	loadPointTable.getColMap().put("CDL_TRACK", track);
					    	loadPointTable.getColMap().put("CDL_MEMO", memo);
					    	modelService.save(loadPointTable);
				    	}
			    }
		    }  
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"), e);
		}
		//return modelAction.reloadParent(modelAction.getText("修改成功"));
            //	return modelAction.commAjaxFunClassLoadParent(formId,iframeId,Constants.SUCCESS,Constants.OPERATE_TYPE_EDIT);
         return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");    	
	}

}
