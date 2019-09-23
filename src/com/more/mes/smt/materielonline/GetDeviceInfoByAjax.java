package com.more.mes.smt.materielonline;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 根据线别信息得到相对应的设备相关的信息
 * @author development
 *
 */
public class GetDeviceInfoByAjax implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("static-access")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	  String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String type = request.getParameter("type");  //类型
		if(type.equals("deviceSeq")){
			CommMethod.listMapToEscapeJs(getDeviceSeq(modelAction,modelService));
			modelAction.setAjaxList(getDeviceSeq(modelAction,modelService));
		}
		if(type.equals("deviceTable")){
			CommMethod.listMapToEscapeJs(getDeviceTable(modelAction,modelService));
			modelAction.setAjaxList(getDeviceTable(modelAction,modelService));
		}
		if(type.equals("LoadPoint")){
			CommMethod.listMapToEscapeJs(getDeviceLoadPoint(modelAction,modelService));
			modelAction.setAjaxList(getDeviceLoadPoint(modelAction,modelService));
		}
		return modelAction.AJAX;
	}
	
	//根据线别信息得到相对应的设备序号
	public List getDeviceSeq(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String areaId = request.getParameter("areaId");  //线别
		String sql = "SELECT DISTINCT T.CAD_DEVICE_SEQUENCE " +
                             "FROM T_CO_AREA_DEVICE T "+
                             "LEFT JOIN T_CO_AREA A ON T.CA_ID = A.CA_ID "+
                             "WHERE A.CA_PARENTAREAID = ? AND T.DATA_AUTH=? AND A.DATA_AUTH=? "+
                             "ORDER BY T.CAD_DEVICE_SEQUENCE";
		
		List sList = modelService.listDataSql(sql, new Object[] { areaId,dataAuth,dataAuth});
		
		//modelAction.setAjaxList(sList);
		return sList;
	}
	//根据线别信息得到相对应的设备Table
	public List getDeviceTable(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String table = request.getParameter("table");  //Table
		String areaId = request.getParameter("areaId");  //线别
		String sql = "SELECT Distinct b.cdl_table FROM t_co_device_loadpoint b WHERE b.cd_device_sn IN( "+
					 "SELECT Distinct a.cd_device_sn FROM t_co_device a WHERE a.id IN( "+
					 "SELECT Distinct t.cad_device_id FROM t_co_area_device t " +
					 "LEFT JOIN T_CO_AREA A ON T.CA_ID = A.CA_ID "+
					 "WHERE t.cad_device_sequence = ? and A.CA_PARENTAREAID = ? "+
					 ") "+
					 ") AND B.DATA_AUTH=? "
					 + " order by b.cdl_table" ;
		
		List sList = modelService.listDataSql(sql, new Object[] { table,areaId,dataAuth });
		
		return sList;
	}
	//根据线别信息得到相对应的料站
	public List getDeviceLoadPoint(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	   String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String loadPoint = request.getParameter("loadPoint");  //料站
		String table = request.getParameter("table");  //Table
		String areaId = request.getParameter("areaId");  //线别
		String sql = "SELECT Distinct b.cdl_loadpoint FROM t_co_device_loadpoint b WHERE b.cd_device_sn IN( "+
					 "SELECT Distinct a.cd_device_sn FROM t_co_device a WHERE a.id IN( "+
					 "SELECT Distinct t.cad_device_id FROM t_co_area_device t " +
					 "LEFT JOIN T_CO_AREA A ON T.CA_ID = A.CA_ID "+
					 "WHERE t.cad_device_sequence = ? and A.CA_PARENTAREAID = ? "+
					 ") "+
					 ") AND B.CDL_TABLE = ? "
					 + " AND B.DATA_AUTH=? order by b.cdl_loadpoint " ;
		
		List sList = modelService.listDataSql(sql, new Object[] { table,areaId,loadPoint,dataAuth });
		
		return sList;
	}
	
	
}
