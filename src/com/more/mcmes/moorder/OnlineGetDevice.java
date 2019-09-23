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
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import examples.newsgroups;

/**
 * 下拉线别添加设备
 * @author Administrator
 *
 */
public class OnlineGetDevice implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
	   String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	   String dataAuthId = modelAction.getRequest().getParameter("dataAuthId");
	   Map resultMap = new HashMap<>();
	  if (dataAuthId != null && !dataAuthId.equals("") && !dataAuthId.equals("undefined"))
      {
        dataAuth=dataAuthId;
      }
		List ajaxList = new ArrayList();
		String area = req.getParameter("areaval");
		String track = req.getParameter("track");
		String type = req.getParameter("type");
		if(area == null || "".equals(area)){
			modelAction.setAjaxList(ajaxList);
		}else{
			//获取线别对应的生产阶别
			String sql1 = "SELECT t.CA_TRACK_FLAG,t.ca_project_step FROM T_CO_AREA T WHERE T.CA_ID=? AND T.DATA_AUTH=? ";
			List<Map> list1 = modelService.listDataSql(sql1, new Object[] {area,dataAuth});
			if (list1!=null&&list1.size()>0) {
				Map<String, Object> map1 = new HashMap<String, Object>();
				map1.put("CA_PROJECT_STEP", list1.get(0).get("CA_PROJECT_STEP"));
				map1.put("CA_TRACK_FLAG", list1.get(0).get("CA_TRACK_FLAG"));
				CommMethod.mapToEscapeJs(map1);
				modelAction.setAjaxMap(map1);
				//if(list1.get(0).get("CA_TRACK_FLAG").equals("N")){ //不是双轨
					String sql = "select t1.CAD_DEVICE_SEQUENCE,t1.ID,t2.ID DEVID,t2.CD_DEVICE_SN,t2.CD_DEVICE_NAME,t4.value, "+
					   "t3.PDO_TYPE,t1.CA_ID,t3.PDO_NUMBER,t3.PDO_MODEL_CODE, "+
					   "t3.PDO_PROCESS_FACE,T.CA_TRACK "+
					    "from T_CO_DEVICE t2  " +
							"left join T_CO_AREA_DEVICE t1 on t1.CAD_DEVICE_ID = t2.ID AND T1.DATA_AUTH=? " +
							"left join T_CO_AREA t on t.CA_ID = t1.CA_ID AND T.DATA_AUTH=?  " +
							"LEFT JOIN SY_DICT_VAL t4 ON t4.DICT_CODE='DEVICE_CLASS' AND t4.CODE=t2.CD_DEVICE_CLASS " +
							"left join T_PM_DEVICE_ONLINE t3 on t3.PDO_DEVICE_SN = t2.CD_DEVICE_SN AND T.CA_TRACK = T3.PDO_TRACK AND T3.DATA_AUTH=? "+
							"  left join T_CO_GROUP t5 on t5.GROUP_CODE=t.CA_GROUP AND T5.DATA_AUTH=? "+
							" where t.CA_PARENTAREAID = ? and t.CA_TYPE = ? and t5.GROUP_TYPE=? "+
						  "  AND T2.DATA_AUTH=?   "+ 
						  " ORDER BY t1.CAD_DEVICE_SEQUENCE ";
					List<Map> dataList = modelService.listDataSql(sql, new Object[]{dataAuth,dataAuth,dataAuth,dataAuth,area,"2","6",dataAuth});
					Map<Object,Object> paraMap = new HashMap<Object,Object>();
					for(int i=0;i<dataList.size();i++){
						paraMap = dataList.get(i);
						String status = (String)paraMap.get("PDO_TYPE");
						String face = (String)paraMap.get("PDO_PROCESS_FACE");
						String devType = (String)paraMap.get("CD_DEVICE_CLASS");
						if("1".equals(status)){
							status = "上线";
						}else if("2".equals(status)){
							status = "转产";
						}else if("3".equals(status)){
							status = "就绪";
						}else{
							status = "空闲";
						}
                        if("0".equals(face)){
							face = "单面";
						}else if("1".equals(face)){
							face = "正面";
						}else if("2".equals(face)){
							face = "反面";
						}else if("3".equals(face)){
							face = "阴阳面";
						}else{
							face = "空";
						}
                        dataList.get(i).put("STATUS", status);
						dataList.get(i).put("FACE", face);
					}	
					CommMethod.listToEscapeJs(dataList);
					modelAction.setAjaxList(dataList);
				//}
			}
		}
		
		return BaseActionSupport.AJAX;
	}
}
