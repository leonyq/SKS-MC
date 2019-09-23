package com.more.mcmes.moorder;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

import edu.emory.mathcs.backport.java.util.Arrays;

/**
 * 制令单上线页面-----下线功能
 * @author Administrator
 *
 */
public class DownLineDevice implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		
		HttpServletRequest req = modelAction.getRequest();
        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String id = req.getParameter("dataId");//取ID
		String modelCode = req.getParameter("modelCode");//机种
		Map resultMap = new HashMap<>();
		if (modelCode==null) {
			resultMap.put("code","error");
			resultMap.put("msg", modelAction.getText("机种为空"));
			modelAction.setAjaxMap(resultMap);
			return BaseActionSupport.AJAX;
		}
		String[] modelCodes = modelCode.split(",");
		String areaSn = req.getParameter("areaSn");//线别
		if (areaSn==null) {
			resultMap.put("code","error");
			resultMap.put("msg", modelAction.getText("线别为空"));
			modelAction.setAjaxMap(resultMap);
			return BaseActionSupport.AJAX;
		}
		String[]  areaSns = areaSn.split(",");
		String proFace = req.getParameter("proFace");//加工面
		if (proFace==null) {
			resultMap.put("code","error");
			resultMap.put("msg", modelAction.getText("加工面为空"));
			modelAction.setAjaxMap(resultMap);
			return BaseActionSupport.AJAX;
		}
		String[] proFaces = proFace.split(",");
		String devSeq = req.getParameter("devSeq");//设备序号
		if (devSeq==null) {
			resultMap.put("code","error");
			resultMap.put("msg", modelAction.getText("设备序号为空"));
			modelAction.setAjaxMap(resultMap);
			return BaseActionSupport.AJAX;
		}
		String[] devSeqs = devSeq.split(",");
		String devSn = req.getParameter("dev_sn");//设备sn
		if (devSn==null) {
			resultMap.put("code","error");
			resultMap.put("msg", modelAction.getText("设备sn为空"));
			modelAction.setAjaxMap(resultMap);
			return BaseActionSupport.AJAX;
		}
		String[] devSns = devSn.split(",");
		String pmCode = req.getParameter("pmCode");//制令单号
		if (pmCode==null) {
			resultMap.put("code","error");
			resultMap.put("msg", modelAction.getText("制令单号为空"));
			modelAction.setAjaxMap(resultMap);
			return BaseActionSupport.AJAX;
		}
		String[] pmCodes = pmCode.split(",");
		String track = req.getParameter("track");//轨道
		if (track==null) {
			resultMap.put("code","error");
			resultMap.put("msg", modelAction.getText("轨道为空"));
			modelAction.setAjaxMap(resultMap);
			return BaseActionSupport.AJAX;
		}
		String[] tracks = track.split(",");
		String projectId = req.getParameter("projectId");//工单
		if (projectId==null) {
			resultMap.put("code","error");
			resultMap.put("msg", modelAction.getText("工单为空"));
			modelAction.setAjaxMap(resultMap);
			return BaseActionSupport.AJAX;
		}
		String[] projectIds = projectId.split(",");		
		String cmdLoadpoint = "";//料站sn
		String paraTable = "";//tablesn
		String cmdItem = "";//物料sn
		String userId = CommMethod.getSessionUser().getLoginName();//员工号
		int size = areaSns.length;
		ProFuncDto pf = null;
		int[] inArray1 = null;
		int[] outArray = null;
		List<Object> dataList = null;
		List<Object> typeList = null;
		List<Object> outList = null;
//		if(1!=2){
//			throw new BussException("stop");
//		}
//		String sql2="select t.CMD_LOADPOINT,t.CMD_TABLE_NO,t.CMD_ITEM_CODE from " +
//        		"T_co_material_detail t  join t_co_material_table s   on s.CM_SN = t.cm_sn " +
//        		"join t_co_material_line a  on a.cm_sn=s.cm_sn  " +
//        		"join t_co_item b    on b.ci_item_code = s.cm_model_code " +
//        		"where s.cm_model_code = ? and a.cml_area_sn=? and  s.cm_process_face=? and t.CMD_DEVICE_SEQ = ?";
		
	
//		List<Map> paraList = modelService.listDataSql(sql2, new Object[]{modelCode,areaSn,proFace,devSeq});
//		if(paraList!=null && !paraList.isEmpty()){
//			Map<String,String> paraMap = paraList.get(0);
//			cmdLoadpoint = paraMap.get("CMD_LOADPOINT");
//			paraTable = paraMap.get("CMD_TABLE_NO");
//			cmdItem = paraMap.get("CMD_ITEM_CODE");
//		}
/*
		String stateChangeSql = "update T_PM_MO_BASE set PM_STATUS=? where PM_MO_NUMBER=?";
        String downLineState = "3";//下线状态为3
        //设置对应制令单状态为下线
        for (int i = 0; i < pmCodes.length; i++) {
            try{
                modelService.execSql(stateChangeSql, new Object[]{downLineState,pmCodes[i]});
            }catch(Exception e) {
               throw new BussException(modelAction.getText("更改状态失败")); 
            } 
        }
  */      
		
		for(int i = 0;i<size;i++){
			pf = new ProFuncDto();
			pf.setClassName("P_SMT_XL_SAVE_INFO"); //调用下料存储进行制令单下线
			inArray1 =new int[]{1,2,3,4,5,6,7,8,9,10,11,12};
			pf.setInPlace(inArray1);
			outArray =new int[]{13,14};
			pf.setOutPlace(outArray);
			dataList = new ArrayList<Object>();
	    	typeList = new ArrayList<Object>();
	    	dataList.add(dataAuth);
	    	dataList.add("4");//机台
	    	dataList.add(areaSns[i]);//线别sn
	    	dataList.add(cmdLoadpoint);//料站sn
	    	dataList.add(cmdItem);//物料sn
	    	dataList.add(modelCodes[i]);//物料料号
	    	dataList.add(pmCodes[i]);//制令单号
	    	dataList.add(proFaces[i]);//加工面
	    	dataList.add(devSeqs[i]);//设备序号
	    	dataList.add(devSns[i]);//tablesn
	    	dataList.add(userId);//员工号
	    	dataList.add(tracks[i]);//轨道
	    	typeList.add("String");
	    	typeList.add("String");	
	    	pf.setValArgs(dataList);
	    	pf.setTotalLen(14);
	    	pf.setOutValType(typeList);
	    	try {
	    	outList = modelService.procComm(pf);
			} catch (Exception e) {
				resultMap.put("code","error");
				resultMap.put("msg", modelAction.getText("存储过程出错"));
				modelAction.setAjaxMap(resultMap);
				return BaseActionSupport.AJAX;
				//throw new BussException(modelAction.getText("存储过程出错"),e);
			}
	    	if(!outList.get(1).equals("OK")){
	    		resultMap.put("code","error");
				resultMap.put("msg", modelAction.getText("下线失败"));
				modelAction.setAjaxMap(resultMap);
				return BaseActionSupport.AJAX;
	    	}
	    	
		}
		//保存下线记录日志
		/*TableDataMapExt devlogTable = new TableDataMapExt();
		devlogTable.setTableName("T_PM_DEVICE_ONLINE_L");
		for(int i=0;i<size;i++){
			CommMethod.addSysDefCol(devlogTable.getColMap(), modelAction.getUser());
			devlogTable.getColMap().put("PDO_NUMBER", pmCodes[i]);
			devlogTable.getColMap().put("PDO_PROJECT_ID", projectIds[i]);
			devlogTable.getColMap().put("PDO_MODEL_CODE", modelCodes[i]);
			devlogTable.getColMap().put("PDO_AREA_SN", areaSns[i]);
			devlogTable.getColMap().put("PDO_PROCESS_FACE", proFaces[i]);
			devlogTable.getColMap().put("PDO_TRACK", tracks[i]);
			devlogTable.getColMap().put("PDO_DEVICE_SN", devSns[i]);
			devlogTable.getColMap().put("PDO_DEVICE_SEQ", devSeqs[i]);
			devlogTable.getColMap().put("PDO_TYPE", "2");
			devlogTable.getColMap().put("PDO_TIME", DateUtil.getCurDate());// 作业时间
			devlogTable.getColMap().put("PDO_EMP", CommMethod.getSessionUser().getId());// 作业员
			try {
				modelService.save(devlogTable);
			} catch (Exception e) {
				throw new BussException(modelAction.getText("下线失败"));
			}
		}*/		
		for(int i=0;i<size;i++){
			//新增员工下岗记录日志  查询当前线别所有上线的员工
			String userSql = "SELECT t.user_id FROM T_USER_STATION_ON_OFF t " +
					"WHERE t.ca_area_sn = ? AND t.on_off_type = '1' AND T.DATA_AUTH=? ";
			List<Map> uList = modelService.listDataSql(userSql, new Object[] {areaSns[i],dataAuth});
			if(uList!=null&&uList.size()>0){
				int num = uList.size();
				TableDataMapExt uTable = new TableDataMapExt();
				uTable.setTableName("T_USER_STATION_ON_OFF_LOG");
				for(int j=0;j<num;j++){
					uTable.getColMap().clear();
					CommMethod.addSysDefCol(uTable.getColMap(),modelAction.getUser());
					uTable.getColMap().put("USER_ID", uList.get(j).get("USER_ID"));
					uTable.getColMap().put("ON_OFF_TYPE", "2");
					uTable.getColMap().put("CA_AREA_SN", areaSns[i]);
					uTable.getColMap().put("MO_NUMBER", pmCodes[i]);
					uTable.getColMap().put("OP_TIME", DateUtil.getCurDate());
					modelService.save(uTable);
				}
			}
		}
		resultMap.put("code", "success");
		modelAction.setAjaxMap(resultMap);
		return BaseActionSupport.AJAX;
	}

}
