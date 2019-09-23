package com.morelean.mcmes.workshop;
/**
 * 
 * 主页面树过滤查询
 * 工作中心显示页面
 */
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;



public class WorkShopListByCar implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		HttpSession session =request.getSession();
		session.setAttribute("idd", 22);
		String id=request.getParameter("id");
		if("".equals(id) || id==null){
			id = "22";
		}
		String findTypeSql = "select CA_TYPE from T_CO_AREA where CA_ID = ?";
		List<Map> typeList = modelService.listDataSql(findTypeSql, new Object[]{id});
		Map typeMap = typeList.get(0);
		String type = (String)typeMap.get("CA_TYPE");
		String areaSql1 = null;
		String areaSql2 = null;
		String childType = null;
		String childCaId = null;
	    Map map1 = new HashMap(); 
	    Map<String,String> listMap = new HashMap<String, String>();
	    List<Map>  pnameList = new ArrayList<Map>();
	    List<Map>  dataList = new ArrayList<Map>();
	    List<Map>  pdataList = new ArrayList<Map>();
	    String parentId = "";
	    map1.put("id",id);
		if("0".equals(type)){//点击的类型为车间
		String sqlFindArea = "select CA_ID,CA_TYPE from T_CO_AREA t where CA_PARENTAREAID = ? ";
		List<Map> childList = modelService.listDataSql(sqlFindArea, new Object[]{id});
		Map<Object,Object> childMap = new HashMap<Object, Object>();
		 for(int i=0;i<childList.size();i++){
			 childMap =  childList.get(i);
			 childType = (String)childMap.get("CA_TYPE");
			 if("1".equals(childType) || "0".equals(childType)){
				 childCaId =  (String)childMap.get("CA_ID");
					areaSql1 ="select t3.GROUP_NAME,t2.JOB_NAME,t.*,t4.ca_name as pname from T_CO_AREA t " +
							"left join SY_JOB t2 on t2.ID = t.CA_EMP_ROLE " +
							"left join t_co_group t3 on t3.GROUP_CODE = t.CA_GROUP " +
							"left join t_co_area t4 on t4.ca_id = t.CA_PARENTAREAID " +
							"where t.CA_PARENTAREAID = ? and t.ca_type = ?";
					pdataList = modelService.listDataSql(areaSql1, new Object[]{childCaId,"2"});
					dataList.addAll(pdataList);
			 }else if("2".equals(childType)){
				 childCaId =  (String)childMap.get("CA_ID");
					areaSql1 ="select t3.GROUP_NAME,t2.JOB_NAME,t.*,t4.ca_name as pname from T_CO_AREA t " +
							"left join SY_JOB t2 on t2.ID = t.CA_EMP_ROLE " +
							"left join t_co_group t3 on t3.GROUP_CODE = t.CA_GROUP " +
							"left join t_co_area t4 on t4.ca_id = t.CA_PARENTAREAID " +
							"where t.CA_ID = ?";
					pdataList = modelService.listDataSql(areaSql1, new Object[]{childCaId});
					dataList.addAll(pdataList);				 
			 }
			 
		 }
			
		}else if("1".equals(type)){//点击类型为线别
			areaSql2 ="select t3.GROUP_NAME,t2.JOB_NAME,t.*,t4.ca_name as pname from T_CO_AREA t " +
					"left join SY_JOB t2 on t2.ID = t.CA_EMP_ROLE " +
					"left join t_co_group t3 on t3.GROUP_CODE = t.CA_GROUP " +
					"left join t_co_area t4 on t4.ca_id = t.CA_PARENTAREAID " +
					"where t.CA_PARENTAREAID ='"+id+"' and t.ca_type = '2'";
			dataList= modelService.listSql(areaSql2, modelAction.getPage(), null, "ORDER BY t.CA_NAME ", null);
		}
		
		//(select t1.CA_NAME from T_CO_AREA t1 where t1.id = ? )
	   
	    modelAction.setDataList(dataList);

	    if(dataList!=null && !dataList.isEmpty()){
	    	parentId = id.trim();
	    	
	    }
	    String sqlPname = "select t.CA_NAME from T_CO_AREA t where t.CA_ID = '"+parentId+"'";
	    //String sqlWorkShop = "select * from T_CO_AREA t where t.CA_PARENTAREAID ='"+id+"' and t.ca_type = '2'";
	    //List pageList = modelService.listSql(sqlWorkShop, modelAction.getPage(), null, "ORDER BY t.CA_NAME ", null);
    	//List<Map>  pnameList= modelService.listDataSql(sqlPname,new Object[] {parentId});
    	pnameList= modelService.listSql(sqlPname, modelAction.getPage(), null, "ORDER BY t.CA_NAME ", null);
    	if(pnameList!=null && !pnameList.isEmpty()){
    		listMap = pnameList.get(0);
        	String parantName = listMap.get("CA_NAME");
    		map1.put("parantname", parantName);//父类区域名称	
	    }
    	
    	
	    request.setAttribute("iframeid", request.getParameter("iframeid"));
	   // modelAction.setDataList(pageList);
	    modelAction.setDataMap(map1);
	    return modelAction.ActionForwardExeid(modelAction.getExeid());
		
	}



}
