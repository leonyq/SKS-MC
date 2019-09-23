package com.more.mcmes.moorder;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * tab获取料站
 * @author Administrator
 *
 */
public class OnLineGetMaterial implements FuncService {

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    HttpServletRequest req = modelAction.getRequest();
    List ajaxList = new ArrayList();
    List dataList = new ArrayList();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    /*
     String dataAuthId = modelAction.getRequest().getParameter("dataAuthId");
      if (dataAuthId != null && !dataAuthId.equals("") && !dataAuthId.equals("undefined"))
      {
        dataAuth=dataAuthId;
      }
      */
      
    String dataId = modelAction.getRequest().getParameter("dataId");
    if(StringUtils.isNotBlank(dataId)) {
    System.out.println(dataId);
  String sqlString = "select DATA_AUTH from t_pm_mo_base "
                    + "where ID = ?  ";
    Map<String, String> map1 =modelService.queryForMap(sqlString, new Object[]{dataId});
    dataAuth=map1.get("DATA_AUTH");
    }
    String id=req.getParameter("pmId");
    String devId = req.getParameter("devid");
    String wkId = req.getParameter("wkid");
    String seqstr =  req.getParameter("seq");
    String track =  req.getParameter("track");
    if (devId==null) {
		modelAction.setAjaxString(modelAction.getText("设备SN为空"));
		return BaseActionSupport.AJAX;
	}
    if (wkId==null) {
		modelAction.setAjaxString(modelAction.getText("工作中心为空"));
		return BaseActionSupport.AJAX;
	}
    if (seqstr==null) {
		modelAction.setAjaxString(modelAction.getText("设备序号为空"));
		return BaseActionSupport.AJAX;
	}
    String[] arrDevid = devId.split(";");
    String[] arrWkId = wkId.split(";");
    String[] arrSeq = seqstr.split(";");
    
    Map<Object,Object> seqNumber =new HashMap<Object,Object>();
    String dev_sn = null;
    String seq = "";
    int num = 0;
    String sql="select a.pm_model_code, a.PM_AREA_SN, "
      + "a.PM_PROCESS_FACE,a.PM_PRODUCT_STEP,a.PM_PROJECT_ID  "
      + "from t_pm_mo_base a where a.id = ? AND A.DATA_AUTH=? ";
    
        List list=modelService.listDataSql(sql,new Object[]{id,dataAuth});
        if(list==null || list.isEmpty()){
        	CommMethod.listToEscapeJs(ajaxList);
          modelAction.setAjaxList(ajaxList);
          return BaseActionSupport.AJAX;
        }
        Map paramap=(Map)list.get(0);
        String pmModelCode=(String)paramap.get("PM_MODEL_CODE");//机种代码
        String pmAreaSn=req.getParameter("area");//线别
        String pmProcessFace=req.getParameter("face");//面别
        String sql1="select s.CM_SN,t.ID, t.CMD_DEVICE_TYPE, t.CMD_PROGRAM_NAME, t.CMD_DEVICE_SEQ, t.CMD_TABLE_NO, t.CMD_LOADPOINT, t.CMD_CHANEL_SN, t.CMD_ITEM_CODE,B.CI_ITEM_NAME,B.CI_ITEM_SPEC,T.CMD_TRY_FLAG,T.CMD_SHKIP_FLAG,CMD_POINT_NUM,CMD_POINT_LOCATION,T.CMD_BOM_FLAG " +
            "from T_co_material_detail t  "+
            "join t_co_material_table s   on s.CM_SN = t.cm_sn AND S.DATA_AUTH=? " +
            "join t_co_material_line a  o	n a.cm_sn=s.cm_sn  AND A.DATA_AUTH=? " +
            "join t_co_item b    on b.ci_item_code = t.CMD_ITEM_CODE AND B.DATA_AUTH=? " +
            "where s.cm_model_code = ? and a.cml_area_sn=? and  s.cm_process_face=? and t.CMD_DEVICE_SEQ = ?  and s.CM_STAUS='Y' and s.CM_TRACK=? "+
            "AND T.DATA_AUTH=?  ";
            
        String sql2 = "select s.CM_SN,t.ID, t.CMD_DEVICE_TYPE, t.CMD_PROGRAM_NAME, t.CMD_DEVICE_SEQ, t.CMD_TABLE_NO, t.CMD_LOADPOINT, t.CMD_CHANEL_SN, t.CMD_ITEM_CODE,B.CI_ITEM_NAME,B.CI_ITEM_SPEC,T.CMD_TRY_FLAG,T.CMD_SHKIP_FLAG,CMD_POINT_NUM,CMD_POINT_LOCATION,T.CMD_BOM_FLAG " +
            "from T_co_material_detail t  "+
            "join t_co_material_table s   on s.CM_SN = t.cm_sn AND S.DATA_AUTH=? " +
            "join t_co_material_line a  on a.cm_sn=s.cm_sn  AND A.DATA_AUTH=? " +
            "join t_co_item b    on b.ci_item_code = t.CMD_ITEM_CODE AND B.DATA_AUTH=?" +
            " where s.cm_model_code = ? and a.cml_area_sn=? and  s.cm_process_face=?  and s.CM_STAUS='Y'  "+
            " AND T.DATA_AUTH=? ";
        
        
        
//        String sql3 = "select CAD_DEVICE_SEQUENCE from t_co_area_device where ca_id = ? and cad_device_id = ?";
//       for(int i=0;i<arrDevid.length;i++){
//         List<Map>  listSeq=modelService.listDataSql(sql3, new Object[] {arrWkId[i],arrDevid[i]}); 
//         if(listSeq !=null && !listSeq.isEmpty()){
//        
//            Map seqMap = listSeq.get(0);
//            seq = (String)seqMap.get("CAD_DEVICE_SEQUENCE");
//            seqNumber.put(num, seq);
//            num++;
//           }
//       }
       
        if("".equals(devId)){
          if (StringUtils.isNotBlank(track))
          {
            sql2+= " and s.CM_TRACK=?";
            dataList=modelService.listDataSql(sql2, new Object[] {dataAuth,dataAuth,dataAuth,pmModelCode,pmAreaSn,pmProcessFace,track,dataAuth});
          }else {
            dataList=modelService.listDataSql(sql2, new Object[] {dataAuth,dataAuth,dataAuth,pmModelCode,pmAreaSn,pmProcessFace,dataAuth});
          }
          
        }else{
          for(int i=0;i<arrSeq.length;i++){
            String seqValue = (String)seqNumber.get(i);
            List listArr=modelService.listDataSql(sql1, new Object[] {dataAuth,dataAuth,dataAuth,pmModelCode,pmAreaSn,pmProcessFace,arrSeq[i],track,dataAuth}); 
            dataList.addAll(listArr);
          }
          
        }
        
        
        if(dataList == null || dataList.isEmpty()){
        	CommMethod.listToEscapeJs(ajaxList);
          modelAction.setAjaxList(ajaxList);
          return BaseActionSupport.AJAX;
        }else{
          CommMethod.listToEscapeJs(dataList);
          modelAction.setAjaxList(dataList);
          return BaseActionSupport.AJAX;
        }
    
  }

}
