package com.more.mes.smt.devicedataconfig;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 查看初始化数据
 * 
 * @author cb
 */
public class ViewGetInitInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
	SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    HttpServletRequest request = modelAction.getRequest();
    String infoId = request.getParameter("infoId");// ID
    Map<Object, Object> map = new HashMap<Object, Object>();

    String sql = "SELECT t.create_time,t.cds_device_type,t.cds_device_sn,t.cds_area_sn,t.cds_area_name,t.create_user,t.cds_data " +
        "FROM T_CO_DEVICE_SETING t " +
    		"WHERE t.ID=?";
    List<Map> wmsList1 = modelService.listDataSql(sql, new Object[]{infoId});
    if(wmsList1!=null&&!wmsList1.isEmpty()) {
	    String userId =(String) wmsList1.get(0).get("CREATE_USER");
	    String codeId =(String) wmsList1.get(0).get("CDS_DEVICE_TYPE");
	    
	    String sql1 = "SELECT t.name FROM sy_user t WHERE t.id=?";
	    List<Map> wmsList2 = modelService.listDataSql(sql1, new Object[]{userId});
	    
	    if(codeId!=null && !codeId.equals("")){
	    String sql2 = "SELECT t.value FROM sy_dict_val t WHERE t.code=?";
	    List<Map> wmsList3 = modelService.listDataSql(sql2, new Object[]{codeId});
	    map.put("VALUE", wmsList3.get(0).get("VALUE"));
	    }
	    
	    map.put("NAME", wmsList2.get(0).get("NAME"));
	    map.put("CDS_DATA", wmsList1.get(0).get("CDS_DATA"));
	    map.put("CDS_DEVICE_SN", wmsList1.get(0).get("CDS_DEVICE_SN"));
	    map.put("CDS_AREA_SN", wmsList1.get(0).get("CDS_AREA_SN"));
	    map.put("CDS_AREA_NAME", wmsList1.get(0).get("CDS_AREA_NAME"));
	    map.put("CREATE_TIME", sd.format(wmsList1.get(0).get("CREATE_TIME")));
    }
    modelAction.setAjaxMap(map);
    return BaseActionSupport.AJAX;
  }
}
