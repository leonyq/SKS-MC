package com.more.mcmes.moorder;

import java.util.ArrayList;
import java.util.List;

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
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * 保存多台设备转产信息
 * @author development
 *
 */
public class SaveRapidDevicesInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String formId = req.getParameter("formId");
	   // String dataAuth = CommMethod.getSessionUser().getDeptId();
	    if(StringUtils.isBlank(formId)){
	        formId = req.getParameter("formIds");
	    }
	    String iframeId = req.getParameter("iframeId");
		try {
		      String pdoAreaSn = req.getParameter("PDO_AREA_SN");
		      String pdoDeviceSn = req.getParameter("PDO_DEVICE_SN");
		      String pdoProjectId = req.getParameter("PDO_PROJECT_ID");
		      String pdoDeviceSeq = req.getParameter("PDO_DEVICE_SEQ");
		      String pdoNumber = req.getParameter("PDO_NUMBER");
		      String pdoModelCode = req.getParameter("PDO_MODEL_CODE");
		      String pdoProcessFace = req.getParameter("PDO_PROCESS_FACE");
		      String pdoNumber_s = req.getParameter("PDO_NUMBER_S");
		      String pdoModelCode_s = req.getParameter("PDO_MODEL_CODE_S");
		      String track = req.getParameter("TRACK");
		      String pdoProcessFace_s = req.getParameter("PDO_PROCESS_FACE_S");
		      String userId = CommMethod.getSessionUser().getLoginName();
		      String[] deviceSns = {};
		      if (StringUtils.isNotBlank(pdoDeviceSn)) {
		    	  deviceSns = pdoDeviceSn.split(",");
		      }
		      String[] tracks = {};
		      if (StringUtils.isNotBlank(track)) {
		    	  tracks = track.split(",");
		      }
		      String[] devSeq = {};
		      if (StringUtils.isNotBlank(pdoDeviceSeq)) {
		    	  devSeq = pdoDeviceSeq.split(",");
		      }
		      if (StringUtils.isBlank(pdoDeviceSn)
		    		  ||StringUtils.isBlank(track)
		    		  ||StringUtils.isBlank(pdoDeviceSeq)) {
		    	  throw new BussException(modelAction.getText("参数为空"));
			}
		      for(int i=0;i<deviceSns.length;i++){
		    	  ProFuncDto pf = new ProFuncDto();
		          int[] inPlace = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11};
		          int[] outplace = {12};
		          List<Object> list = new ArrayList<Object>();
		          List<Object> outType = new ArrayList<Object>();
		          list.add(pdoAreaSn);
		          list.add(deviceSns[i]);
		          list.add(pdoNumber);
		          list.add(pdoModelCode);
		          list.add(pdoProcessFace);
		          list.add(pdoNumber_s);
		          list.add(pdoModelCode_s);
		          list.add(pdoProcessFace_s);
		          list.add(userId);
		          list.add(dataAuth);
		          list.add(tracks[i]);
		          outType.add("String");
		          pf.setClassName("P_SMT_ZC_SAVE_INFO");// 存储过程的名字
		          pf.setInPlace(inPlace);// 存储过程中in
		          pf.setOutPlace(outplace); // 存储过程中out
		          pf.setValArgs(list);// 存储过程中输入的参数
		          pf.setTotalLen(list.size() + outType.size());// 总个数
		          pf.setOutValType(outType);// 输出的参数
		          List<Object> relist = modelService.procComm(pf);
		          if(!relist.get(0).equals("OK")){
		        	  return modelAction.alertParentInfo((String)relist.get(0));
		          }
		      }
		      //保存转产记录日志
		      TableDataMapExt devlogTable = new TableDataMapExt();
			  devlogTable.setTableName("T_PM_DEVICE_ONLINE_L");
		      for(int i=0;i<deviceSns.length;i++){
			    	CommMethod.addSysDefCol(devlogTable.getColMap(), modelAction.getUser());
					devlogTable.getColMap().put("PDO_NUMBER", pdoNumber);
					devlogTable.getColMap().put("PDO_PROJECT_ID", pdoProjectId);
					devlogTable.getColMap().put("PDO_MODEL_CODE", pdoModelCode);
					devlogTable.getColMap().put("PDO_AREA_SN", pdoAreaSn);
					devlogTable.getColMap().put("PDO_PROCESS_FACE", pdoProcessFace);
					devlogTable.getColMap().put("PDO_TRACK", tracks[i]);
					devlogTable.getColMap().put("PDO_DEVICE_SN", deviceSns[i]);
					devlogTable.getColMap().put("PDO_DEVICE_SEQ", devSeq[i]);
					devlogTable.getColMap().put("PDO_TYPE", "3");
					devlogTable.getColMap().put("PDO_RAPID_NUMBER", pdoNumber_s);
					devlogTable.getColMap().put("PDO_TIME", DateUtil.getCurDate());// 作业时间
					devlogTable.getColMap().put("PDO_EMP", CommMethod.getSessionUser().getId());// 作业员
		      }
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("转产失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("转产成功"), "0");
	}

}
