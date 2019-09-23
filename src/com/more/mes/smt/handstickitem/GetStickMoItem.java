package com.more.mes.smt.handstickitem;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 手贴作业---通过制令单获取物料信息
 * @author Administrator
 *
 */
public class GetStickMoItem implements FuncService{

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String mo_number = request.getParameter("mo_number");
	    String work_station = request.getParameter("work_station");
	    String modelCode="",projectID="",face="";
	    //获取制令单信息
	    String sql="SELECT PM_MO_NUMBER, \n"+
                   "    PM_PROJECT_ID, \n"+
                   "    PM_PRODUCT_STEP, \n"+
                   "    PM_AREA_SN, \n"+
                   "    PM_PROCESS_FACE, \n"+
                   "    PM_PCB_CODE, \n"+
                   "    PM_MODEL_CODE \n"+
                  "FROM T_PM_MO_BASE \n"+
                 "WHERE PM_MO_NUMBER = ? ";
        List<Map> moList = modelService.listDataSql(sql, new Object[] {mo_number});
        if(moList!=null&&moList.size()>0){
            modelCode=moList.get(0).get("PM_MODEL_CODE").toString(); 
            projectID=moList.get(0).get("PM_PROJECT_ID").toString();
            face=moList.get(0).get("PM_PROCESS_FACE").toString();
        }
        sql="SELECT CBD_ITEM_CODE, ? FACE, \n"+
                "       CBD_ITEM_NUM, \n"+
                "       CBD_POINT, \n"+
                "       'up_load/comm/' || CB_BOTTOM_ADDRESS || '/' || CB_BOTTOM_FILE_NAME GDO_BOTTOM, \n"+
                "       'up_load/comm/' || CB_TOP_ADDRESS || '/' || CB_TOP_FILE_NAME GDO_TOP, \n"+
                "       'up_load/comm/' || CB_DRAW_ADDRESS || '/' || CB_DRAW_FILE_NAME VB_AIS, \n"+
                "       replace(replace(D.CSI_ADDRESS || '/' || D.CSI_FILE_NAME,  '/appdata/mcweb1/webapps/N2/', ''),'D:\\mcweb1\\webapps\\N2\\up_load\\comm\\','up_load/comm/esop') ESOP_FILE \n"+
                "  FROM T_PM_PROJECT_BASE A \n"+
                "  LEFT JOIN T_CO_BOM B \n"+
                "    ON A.PRODUCT_MATERIAL = B.CB_ITEM_CODE \n"+
                "   AND A.PRODUCT_VER = B.CB_VER \n"+
                "   AND B.CB_STATUS = 'Y' \n"+
                "  LEFT JOIN T_CO_BOM_DETAIL C \n"+
                "    ON B.ID = C.CB_BOMID \n"+
                "   LEFT JOIN T_CO_ESOP_INFO D \n"+
                "    ON D.CSI_MODEL_CODE = A.PRODUCT_MATERIAL \n"+
                "   AND D.CSI_PROCESS_FACE = ? \n"+
                "   AND D.CSI_VALID_FLAG = 'Y' \n"+
                "   AND CSI_GROUP = (SELECT CA_GROUP FROM T_CO_AREA WHERE CA_ID = ?) \n"+
                " WHERE A.PROJECT_ID = ? \n"+
                "   AND C.CBD_ITEM_CODE IN \n"+
                "       (SELECT CBD_ITEM_CODE \n"+
                "          FROM T_PM_PROJECT_DETAIL \n"+
                "         WHERE PROJECT_ID = A.PROJECT_ID) \n"+
                "   AND C.CBD_ITEM_AREA = '手贴' \n";
                
            List<Map> itemList = modelService.listDataSql(sql, new Object[] {face,face,work_station,projectID});
            modelAction.setAjaxList(itemList);
		return BaseActionSupport.AJAX;
	}

}
