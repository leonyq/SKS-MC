package com.more.mes.smt.handitem;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 *  
 * @author development
 *
 */
public class GetMoItemInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    String mo_number = request.getParameter("mo_number");
	    String work_station = request.getParameter("work_station");
	    String step = request.getParameter("step");
	    String modelCode="",projectID="",face="";
	    
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
        List<Map> itemList = null;
        //工段为手工补焊 则显示所有的物料
        if(step.equals("5")){
        	sql="SELECT CBD_ITEM_CODE,AA.CI_ITEM_SPEC,AA.CI_MATERIAL_FLAG, ? FACE, \n"+
                    "       CBD_ITEM_NUM, \n"+
                    "       CBD_POINT, \n"+
                    "       CBD_POINT CBD_POINT_OLD, \n"+
                    "       'up_load/comm/' || CB_BOTTOM_ADDRESS || '/' || CB_BOTTOM_FILE_NAME GDO_BOTTOM, \n"+
                    "       'up_load/comm/' || CB_TOP_ADDRESS || '/' || CB_TOP_FILE_NAME GDO_TOP, \n"+
                    "       'up_load/comm/' || CB_DRAW_ADDRESS || '/' || CB_DRAW_FILE_NAME VB_AIS, \n"+
                    "       'up_load/comm/' || D.CSI_ADDRESS || '/' || D.CSI_FILE_NAME ESOP_FILE, \n"+
                    "        B.ID BOM_ID, " +
                    " (select count(WHL_ITEM_CODE) from T_WIP_HAND_ITEM_LOG t where t.WHL_MO_NUMBER=? and t.WHL_ITEM_CODE=CBD_ITEM_CODE) ISSAVE "+
                    "  FROM T_PM_PROJECT_BASE A \n"+
                    "  LEFT JOIN T_CO_BOM B \n"+
                    "    ON A.PRODUCT_MATERIAL = B.CB_ITEM_CODE \n"+
                    "   AND A.PRODUCT_VER = B.CB_VER \n"+
                    "   AND B.CB_STATUS = 'Y' \n"+
                    "  LEFT JOIN T_CO_BOM_DETAIL C \n"+
                    "    ON B.ID = C.CB_BOMID \n"+
                    "  LEFT JOIN T_CO_ITEM AA \n"+
                    "    ON AA.CI_ITEM_CODE = C.CBD_ITEM_CODE \n"+
                    "   LEFT JOIN T_CO_ESOP_INFO D \n"+
                    "    ON D.CSI_MODEL_CODE = A.PRODUCT_MATERIAL \n"+
                    "   AND D.CSI_PROCESS_FACE = ? \n"+
                    "   AND D.CSI_VALID_FLAG = 'Y' \n"+
                    "   AND CSI_GROUP = (SELECT CA_GROUP FROM T_CO_AREA WHERE CA_ID = ?) \n"+
                    " WHERE A.PROJECT_ID = ? \n"+
                    " and C.CBD_ITEM_AREA <> '自制件' "
                    /*"   AND C.CBD_ITEM_CODE IN \n"+
                    "       (SELECT CBD_ITEM_CODE \n"+
                    "          FROM T_PM_PROJECT_DETAIL \n"+
                    "         WHERE PROJECT_ID = A.PROJECT_ID) \n"+
                    "   AND C.CBD_ITEM_AREA IN ( \n" +
                    "SELECT CGA_ITEM_AREA\n" +
                    "  FROM T_CO_GROUP_ITEM_AREA\n" + 
                    " WHERE CGA_GROUP_CODE = (SELECT CA_GROUP FROM T_CO_AREA WHERE CA_ID = ?)) "*/;
        	itemList = modelService.listDataSql(sql, new Object[] {face,mo_number,face,work_station,projectID});
        }else{
        	sql="SELECT CBD_ITEM_CODE,AA.CI_ITEM_SPEC,AA.CI_MATERIAL_FLAG, ? FACE, \n"+
                    "       CBD_ITEM_NUM, \n"+
                    "       CBD_POINT, \n"+
                    "       CBD_POINT CBD_POINT_OLD, \n"+
                    "       'up_load/comm/' || CB_BOTTOM_ADDRESS || '/' || CB_BOTTOM_FILE_NAME GDO_BOTTOM, \n"+
                    "       'up_load/comm/' || CB_TOP_ADDRESS || '/' || CB_TOP_FILE_NAME GDO_TOP, \n"+
                    "       'up_load/comm/' || CB_DRAW_ADDRESS || '/' || CB_DRAW_FILE_NAME VB_AIS, \n"+
                    "       'up_load/comm/' || D.CSI_ADDRESS || '/' || D.CSI_FILE_NAME ESOP_FILE, \n"+
                    "        B.ID BOM_ID"+
                    " (select count(WHL_ITEM_CODE) from T_WIP_HAND_ITEM_LOG t where t.WHL_MO_NUMBER=? and t.WHL_ITEM_CODE=CBD_ITEM_CODE) ISSAVE "+
                    "  FROM T_PM_PROJECT_BASE A \n"+
                    "  LEFT JOIN T_CO_BOM B \n"+
                    "    ON A.PRODUCT_MATERIAL = B.CB_ITEM_CODE \n"+
                    "   AND A.PRODUCT_VER = B.CB_VER \n"+
                    "   AND B.CB_STATUS = 'Y' \n"+
                    "  LEFT JOIN T_CO_BOM_DETAIL C \n"+
                    "    ON B.ID = C.CB_BOMID \n"+
                    "  LEFT JOIN T_CO_ITEM AA \n"+
                    "    ON AA.CI_ITEM_CODE = C.CBD_ITEM_CODE \n"+
                    "   LEFT JOIN T_CO_ESOP_INFO D \n"+
                    "    ON D.CSI_MODEL_CODE = A.PRODUCT_MATERIAL \n"+
                    "   AND D.CSI_PROCESS_FACE = ? \n"+
                    "   AND D.CSI_VALID_FLAG = 'Y' \n"+
                    "   AND CSI_GROUP = (SELECT CA_GROUP FROM T_CO_AREA WHERE CA_ID = ?) \n"+
                    " WHERE A.PROJECT_ID = ? \n"+
                    /*"   AND C.CBD_ITEM_CODE IN \n"+
                    "       (SELECT CBD_ITEM_CODE \n"+
                    "          FROM T_PM_PROJECT_DETAIL \n"+
                    "         WHERE PROJECT_ID = A.PROJECT_ID) \n"+*/
                    "   AND C.CBD_ITEM_AREA IN ( \n" +
                    "SELECT CGA_ITEM_AREA\n" +
                    "  FROM T_CO_GROUP_ITEM_AREA\n" + 
                    " WHERE CGA_GROUP_CODE = (SELECT CA_GROUP FROM T_CO_AREA WHERE CA_ID = ?)) ";
        	itemList = modelService.listDataSql(sql, new Object[] {face,mo_number,face,work_station,projectID,work_station});
        }
            
        if(itemList!=null&&itemList.size()>0){
           sql="SELECT " + 
                "\n" +
                "TCC_BOM_ID bom_id,\n" + 
                "TCC_POINT code,\n" + 
                "TCC_PACK pack,\n" + 
                "TCC_ROTATION rotation,\n" + 
                "TCC_XAXIS x,\n" + 
                "TCC_YAXIS y,\n" + 
                "TCC_FACE face FROM T_XA_COORDINATE_CONTENT WHERE TCC_BOM_ID=?";

           List<Map> mItemList= modelService.listDataSql(sql,new Object[]{/*"d5787c7c72444b978582b0efef3c79d3"*/itemList.get(0).get("bom_id")});
           Map<String, Object> map = new HashMap();
		   map.put("coor_content",mItemList);
		   modelAction.setAjaxMap(map);
        }
        modelAction.setAjaxList(itemList);
	    return BaseActionSupport.AJAX;
	}

}
