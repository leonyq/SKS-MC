package com.more.mcmes.moorder;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 制令单上线---多台设备转产
 * @author development
 *
 */
public class RapidOnLineDevices implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		try {
			HttpServletRequest request = modelAction.getRequest();
	    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		    String pdoDeviceSn = request.getParameter("pdoDeviceSn");
		    String pdoNumber = request.getParameter("pdoNumber");
		    String pdoProcessFace = request.getParameter("pdoProcessFace");
		    String pdoModelCode = request.getParameter("pdoModelCode");
		    String pdoAreaSn = request.getParameter("pdoAreaSn");
		    String pdoNumber_s = request.getParameter("pdoNumber_s"); //转产制令单
		    String pdoModelCode_s = request.getParameter("pdoModelCode_s");  //转产机种
		    String pdoProcessFace_s = request.getParameter("pdoProcessFace_s");  //转产面别
		    String flags = request.getParameter("flag");
		    List ajaxList = new ArrayList();
		    //拆分设备sn
		    log.info("+++++++++++++"+pdoDeviceSn);
		    
		    String[] deviceSns = {};
		    if (StringUtils.isNotBlank(pdoDeviceSn)) {
		    	deviceSns = pdoDeviceSn.split(",");
			}
		    String deviceSn = null;
		    String deviceSn2 = null;
		    Map<String,Object> paramMap = new HashMap<String, Object>();
            Object[] obj = new Object[deviceSns.length+9];
            obj[0] = pdoModelCode_s;log.info("l0:"+pdoModelCode_s);
            obj[1] = pdoAreaSn;log.info("l1:"+pdoAreaSn);
            obj[2] = dataAuth;log.info("l2:"+dataAuth);
		    for(int i=0;i<deviceSns.length;i++){
		    	obj[i+3] = deviceSns[i];log.info("l"+(i+3)+":"+deviceSns[i]);
		    	paramMap.put("A"+i,deviceSns[i]);
		    	if(i==0){
		    		deviceSn = ":A0";
		    		deviceSn2 = "?";
		    	}else{
		    		deviceSn = deviceSn + "," +  ":A" + i;
		    		deviceSn2 = deviceSn2 + "," + "?";
		    	}
		    }
		    obj[deviceSns.length+3] = pdoProcessFace_s;log.info("l"+(deviceSns.length+3)+":"+pdoProcessFace_s);
		    obj[deviceSns.length+4] = dataAuth;log.info("l"+(deviceSns.length+4)+":"+dataAuth);
        obj[deviceSns.length+5] = dataAuth;log.info("l"+(deviceSns.length+5)+":"+dataAuth);
        obj[deviceSns.length+6] = dataAuth;log.info("l"+(deviceSns.length+6)+":"+dataAuth);
        obj[deviceSns.length+7] = dataAuth;log.info("l"+(deviceSns.length+7)+":"+dataAuth);
        obj[deviceSns.length+8] = dataAuth;log.info("l"+(deviceSns.length+8)+":"+dataAuth);
		    paramMap.put("CMO_MO_NUMBER", pdoNumber);
		    paramMap.put("CMO_MODEL_CODE", pdoModelCode);
		    paramMap.put("CMO_PROCESS_FACE", pdoProcessFace);
		    paramMap.put("CMO_AREA_SN", pdoAreaSn);
		    paramMap.put("DATA_AUTH", dataAuth);
		    //加载当前制令单信息
		    String moSql = "SELECT DISTINCT T3.CI_ITEM_NAME,T3.CI_ITEM_SPEC,T.* FROM T_CO_MATERIAL_ONLINE T "
	                 + "LEFT JOIN T_CO_DEVICE T1 ON T1.CD_DEVICE_SN in ("+deviceSn+") "
	                 + "LEFT JOIN T_CO_AREA_DEVICE T2 ON T2.CAD_DEVICE_ID = T1.ID " +
	                 "JOIN T_CO_ITEM T3 ON T.CMO_ITEM_CODE = T3.CI_ITEM_CODE "
	                 +"WHERE T.CMO_MO_NUMBER = :CMO_MO_NUMBER AND T.CMO_MODEL_CODE= :CMO_MODEL_CODE "
	                 +"AND T.CMO_PROCESS_FACE= :CMO_PROCESS_FACE AND T.CMO_AREA_SN = :CMO_AREA_SN " 
	                 +"AND T.CMO_DEVICE_SEQ = T2.CAD_DEVICE_SEQUENCE " +
	                 "AND T.CMO_LOAD_FLAG = 'Y' AND T.CMO_SHKIP_FLAG = 'N'"
	                 + "AND T.DATA_AUTH=:DATA_AUTH AND T1.DATA_AUTH=:DATA_AUTH "
                   + "AND T2.DATA_AUTH=:DATA_AUTH AND T3.DATA_AUTH=:DATA_AUTH ";
		    List<Map> thisList = modelService.listSql(moSql, modelAction.getPage(), paramMap, null, null);
		    if (thisList == null || thisList.isEmpty())
		    {
		      modelAction.setAjaxString(modelAction.getText("未查询到当前制令单对应的在线物料信息"));
		    }else if(flags.equals("1")){
		    	modelAction.setAjaxPage(modelAction.getPage());
		    	CommMethod.listToEscapeJs(thisList);
		    	modelAction.getPage().setDataList(thisList);
		    }
		    if(flags.equals("0")){
		    	//查询转产制令单信息
			    String moSqls = "SELECT DISTINCT F.CI_ITEM_NAME,F.CI_ITEM_SPEC,C.* FROM T_CO_MATERIAL_TABLE A " +
			            "LEFT JOIN T_CO_MATERIAL_LINE B ON A.CM_SN = B.CM_SN " +
			            "LEFT JOIN T_CO_MATERIAL_DETAIL C ON A.CM_SN = C.CM_SN " +
			            "LEFT JOIN T_CO_AREA_DEVICE D ON C.CMD_DEVICE_SEQ = D.CAD_DEVICE_SEQUENCE " +
			            "LEFT JOIN T_CO_DEVICE E ON D.CAD_DEVICE_ID = E.ID " +
			            "LEFT JOIN T_CO_ITEM F ON C.CMD_ITEM_CODE = F.CI_ITEM_CODE  " +
			            "WHERE A.CM_MODEL_CODE = ? AND B.CML_AREA_SN = ? AND F.DATA_AUTH=?  " +
			            "AND E.CD_DEVICE_SN in("+deviceSn2+") AND A.CM_PROCESS_FACE = ? "+
			            "AND A.DATA_AUTH=? AND B.DATA_AUTH=? AND C.DATA_AUTH=? "+
                  "AND D.DATA_AUTH=? AND E.DATA_AUTH=?  ";
			    log.info("+++++++++++++"+moSqls);
			    List<Map> inList = modelService.listDataSql(moSqls, obj);
			    if (inList == null || inList.isEmpty())
			    {
			      modelAction.setAjaxString(modelAction.getText("未查询到转产制令单相关信息"));
			    }else{
			    	int thisLen = thisList.size();
			        int inLen = inList.size();
			        int yesCount = 0;
			        int flag = 0;
			        boolean replaceFlag = false;
			        for(int i=0;i<thisLen;i++){
			        	for(int j=0;j<inLen;j++){
			        		if(thisList.get(i).get("CMO_DEVICE_SEQ").equals(inList.get(j).get("CMD_DEVICE_SEQ"))
				        		&& thisList.get(i).get("CMO_TABLE_NO").equals(inList.get(j).get("CMD_TABLE_NO"))
				        		&& thisList.get(i).get("CMO_LOADPOINT").equals(inList.get(j).get("CMD_LOADPOINT"))
				        		&& thisList.get(i).get("CMO_CHANEL_SN").equals(inList.get(j).get("CMD_CHANEL_SN"))
				        		&& thisList.get(i).get("CMO_SHKIP_FLAG").equals(inList.get(j).get("CMD_SHKIP_FLAG"))){
			        			//如果物料相同则
			        			if(thisList.get(i).get("CMO_ITEM_CODE").equals(inList.get(j).get("CMD_ITEM_CODE"))){
			        				thisList.get(i).put("RESULT", 0);
			        				yesCount++ ;
			        			}else{
			        				//如果物料不相同则判断是不是替代料
			        				String sql = "SELECT T.* FROM T_CO_ITEM_REPLACE T WHERE T.CR_ITEM_MIAN = ? and T.CR_ITEM_REPLACE = ? AND T.DATA_AUTH=? ";
			        			    List<Map> list = modelService.listDataSql(sql, new Object[]{inList.get(j).get("CMD_ITEM_CODE"),thisList.get(i).get("CMO_ITEM_CODE"),dataAuth});
			        			    if(list!=null&&list.size()>0){ //是替代料
			        			    	thisList.get(i).put("RESULT", 0);
			        	                yesCount++ ;
			        	                replaceFlag = true;
			        			    }
			        			    if(!replaceFlag){
				        	            flag++ ;
				        	            replaceFlag = false;
			        	            }
			        			}
			        		}else{
			        			flag++ ;
			        		}
			        	}
			        	if (flag == inLen){
			        		thisList.get(i).put("RESULT", 1);
			            }
			        	flag = 0;
			        }
			        ajaxList.add(0, yesCount);
			        ajaxList.add(1, thisLen - yesCount);
			        //CommMethod.listToEscapeJs(ajaxList);
			        modelAction.setAjaxList(ajaxList);

			        modelAction.setAjaxPage(modelAction.getPage());
			        CommMethod.listToEscapeJs(thisList);
			        modelAction.getPage().setDataList(thisList);
			    }
		    }
		} catch (Exception e) {
			log.error(e);
		}
		return BaseActionSupport.AJAX;
	}

}
