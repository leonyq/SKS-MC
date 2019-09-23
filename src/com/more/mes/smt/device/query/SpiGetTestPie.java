package com.more.mes.smt.device.query;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 查询饼图
 * @author development
 *
 */
public class SpiGetTestPie implements FuncService{

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
	    
		HttpServletRequest request = modelAction.getRequest();
		String moNumber=request.getParameter("mo_number");
		String areaName=request.getParameter("area_name");
		String programName=request.getParameter("programname");
		String resultinFileName=request.getParameter("resultinfilename");
        String sql=" SELECT * FROM V_DEVICE_SPI_RESULT_PIE WHERE 1=1 ";
        String where="";
        Map<String, Object> paraMap = new HashMap<String, Object>();
        if(!"".equals(moNumber)){
            where+=" AND MO_NUMBER LIKE '%' || :MO_NUMBER || '%' ";
            paraMap.put("MO_NUMBER", moNumber);
        }
        if(!"".equals(areaName)){
            where+=" AND AREA_NAME LIKE '%' || :AREA_NAME || '%' ";
            paraMap.put("AREA_NAME", areaName);
        }
        if(!"".equals(programName)){
            where+=" AND PROGRAMNAME LIKE '%' || :PROGRAMNAME || '%' ";
            paraMap.put("PROGRAMNAME", programName);
        }
        if(!"".equals(resultinFileName)){
            where+=" AND RESULTINFILENAME LIKE '%' || :RESULTINFILENAME || '%' ";
            paraMap.put("RESULTINFILENAME", resultinFileName);
        }
        List<Map> mList = modelService.listSql(sql+where, modelAction.getPage(), paraMap,
        	      "", null);
        //List<Map<String, Object>> mList = modelService.listDataSql(sql+where);
		modelAction.setAjaxList(mList);
	    return BaseActionSupport.AJAX;
	}

}
