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
 * 制令单 -chakan -获取料站
 * 
 * 
 */
public class OnLineGetMaterialDe implements FuncService {

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
    Map<String, String> map1=new HashMap<String, String>();
    if(StringUtils.isNotBlank(dataId)) {
   // System.out.println(dataId);
    String sqlString = "select DATA_AUTH,PM_AREA_SN,PM_PROCESS_FACE,PM_MODEL_CODE from t_pm_mo_base "
                    + "where ID = ?  ";
     map1 =modelService.queryForMap(sqlString, new Object[]{dataId});
     if(null!=map1 && map1.size()>0) {
    	 dataAuth=map1.get("DATA_AUTH");
     }
    }
    String Id=req.getParameter("pmId");
    String dev_id = req.getParameter("devid");
    String wkId = req.getParameter("wkid");
    String seqstr =  req.getParameter("seq");
    String track =  req.getParameter("track");
    
    String[] arrDevid = dev_id.split(";");
    String[] arrWkId = wkId.split(";");
    String[] arrSeq = seqstr.split(";");
    
    Map<Object,Object> seqNumber =new HashMap<Object,Object>();
    String dev_sn = null;
    String seq = "";
    int num = 0;
    String sql="select a.pm_model_code, a.PM_AREA_SN, "
      + "a.PM_PROCESS_FACE,a.PM_PRODUCT_STEP,a.PM_PROJECT_ID,A.PM_MO_NUMBER  "
      + "from t_pm_mo_base a where a.id = ? AND A.DATA_AUTH=? ";
    
        List list=modelService.listDataSql(sql,new Object[]{Id,dataAuth});
        if(list==null || list.isEmpty()){
          modelAction.setAjaxList(ajaxList);
          return BaseActionSupport.AJAX;
        }
        Map paramap=(Map)list.get(0);
        String pmModelCode=(String)paramap.get("PM_MODEL_CODE");//机种代码
        String pmAreaSn=req.getParameter("area");//线别
        String pmProcessFace=req.getParameter("face");//面别
        String pmMoNumber=(String)paramap.get("PM_MO_NUMBER");//制令单
        if(StringUtils.isNotBlank(dataId)) {
        pmModelCode=map1.get("PM_MODEL_CODE");
        pmAreaSn=map1.get("PM_AREA_SN");
        pmProcessFace=map1.get("PM_PROCESS_FACE");
        }
        
        String sql0="SELECT T.PMO_NUMBER\r\n" + 
          "FROM T_PM_MO_ONLINE T \r\n" + 
          "LEFT JOIN T_PM_MO_BASE A ON T.PMO_NUMBER=A.PM_MO_NUMBER\r\n" + 
          "WHERE A.ID=? ";

        List list0=modelService.listDataSql(sql0,new Object[]{Id});
        
        String sql1="";
        String sql2="";
        if(list0==null || list0.isEmpty()){
         sql1="select s.CM_SN,t.ID, t.CMD_DEVICE_TYPE, t.CMD_PROGRAM_NAME, t.CMD_DEVICE_SEQ, t.CMD_TABLE_NO, t.CMD_LOADPOINT, t.CMD_CHANEL_SN, t.CMD_ITEM_CODE,B.CI_ITEM_NAME,B.CI_ITEM_SPEC,T.CMD_TRY_FLAG,T.CMD_SHKIP_FLAG,CMD_POINT_NUM,CMD_POINT_LOCATION,T.CMD_BOM_FLAG " +
            "from T_co_material_detail t  "+
            "join t_co_material_table s   on s.CM_SN = t.cm_sn AND S.DATA_AUTH=T.DATA_AUTH " +
            "join t_co_material_line a  on a.cm_sn=s.cm_sn  AND A.DATA_AUTH=T.DATA_AUTH " +
            "join t_co_item b    on b.ci_item_code = t.CMD_ITEM_CODE AND B.DATA_AUTH=T.DATA_AUTH " +
            "where T.DATA_AUTH=? and s.cm_model_code = ? and a.cml_area_sn=? and  s.cm_process_face=? and t.CMD_DEVICE_SEQ = ?  and s.CM_STAUS='Y' and s.CM_TRACK=? "+
            " ";
            
         sql2 = "select s.CM_SN,t.ID, t.CMD_DEVICE_TYPE, t.CMD_PROGRAM_NAME, t.CMD_DEVICE_SEQ, t.CMD_TABLE_NO, t.CMD_LOADPOINT, t.CMD_CHANEL_SN, t.CMD_ITEM_CODE,B.CI_ITEM_NAME,B.CI_ITEM_SPEC,T.CMD_TRY_FLAG,T.CMD_SHKIP_FLAG,CMD_POINT_NUM,CMD_POINT_LOCATION,T.CMD_BOM_FLAG " +
            "from T_co_material_detail t  "+
            "join t_co_material_table s   on s.CM_SN = t.cm_sn AND S.DATA_AUTH=T.DATA_AUTH " +
            "join t_co_material_line a  on a.cm_sn=s.cm_sn  AND A.DATA_AUTH=T.DATA_AUTH " +
            "join t_co_item b    on b.ci_item_code = t.CMD_ITEM_CODE AND B.DATA_AUTH=T.DATA_AUTH" +
            " where T.DATA_AUTH=? and s.cm_model_code = ? and a.cml_area_sn=? and  s.cm_process_face=?  and s.CM_STAUS='Y'  "+
            "  ";
        
        }
        else
        {
             sql1="select T.CM_SN,t.ID , t.CMO_DEVICE_TYPE AS CMD_DEVICE_TYPE, t.CMO_PROGRAM_NAME AS CMD_PROGRAM_NAME,\r\n" + 
            "t.CMO_DEVICE_SEQ AS CMD_DEVICE_SEQ, t.CMO_TABLE_NO AS CMD_TABLE_NO,\r\n" + 
            "t.CMO_LOADPOINT AS CMD_LOADPOINT, t.CMO_CHANEL_SN AS CMD_CHANEL_SN, t.CMO_ITEM_CODE AS CMD_ITEM_CODE,\r\n" + 
            "B.CI_ITEM_NAME,B.CI_ITEM_SPEC,T.CMO_TRY_FLAG AS CMD_TRY_FLAG,T.CMO_SHKIP_FLAG AS CMD_SHKIP_FLAG,\r\n" + 
            "t.CMO_POINT_NUM AS CMD_POINT_NUM,t.CMO_POINT_LOCATION AS CMD_POINT_LOCATION,T.CMO_BOM_FLAG AS CMD_BOM_FLAG \r\n" + 
            "from T_CO_MATERIAL_ONLINE t   \r\n" + 
            "join t_co_item b  on b.ci_item_code = t.CMO_ITEM_CODE  AND B.DATA_AUTH=T.DATA_AUTH \r\n" + 
            "where T.DATA_AUTH=? AND T.CMO_MO_NUMBER = ? and T.CMO_AREA_SN=? and  T.CMO_PROCESS_FACE=? \r\n" + 
            " and T.CMO_TRACK=? ";
            
         sql2 = "select T.CM_SN,t.ID , t.CMO_DEVICE_TYPE AS CMD_DEVICE_TYPE, t.CMO_PROGRAM_NAME AS CMD_PROGRAM_NAME,\r\n" + 
          "t.CMO_DEVICE_SEQ AS CMD_DEVICE_SEQ, t.CMO_TABLE_NO AS CMD_TABLE_NO,\r\n" + 
          "t.CMO_LOADPOINT AS CMD_LOADPOINT, t.CMO_CHANEL_SN AS CMD_CHANEL_SN, t.CMO_ITEM_CODE AS CMD_ITEM_CODE,\r\n" + 
          "B.CI_ITEM_NAME,B.CI_ITEM_SPEC,T.CMO_TRY_FLAG AS CMD_TRY_FLAG,T.CMO_SHKIP_FLAG AS CMD_SHKIP_FLAG,\r\n" + 
          "t.CMO_POINT_NUM AS CMD_POINT_NUM,t.CMO_POINT_LOCATION AS CMD_POINT_LOCATION,T.CMO_BOM_FLAG AS CMD_BOM_FLAG \r\n" + 
          "from T_CO_MATERIAL_ONLINE t   \r\n" + 
          "join t_co_item b  on b.ci_item_code = t.CMO_ITEM_CODE AND B.DATA_AUTH=T.DATA_AUTH \r\n" + 
          "where T.DATA_AUTH=? AND T.CMO_MO_NUMBER = ? and T.CMO_AREA_SN=? and  T.CMO_PROCESS_FACE=? \r\n" + 
          "  ";
        }
        
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
       
       if(list0==null || list0.isEmpty()){
             if("".equals(dev_id)){
              if (StringUtils.isNotBlank(track))
              {
                    sql2+= " and s.CM_TRACK=?";
                dataList=modelService.listDataSql(sql2, new Object[] {dataAuth,pmModelCode,pmAreaSn,pmProcessFace,track});
              }else {
                dataList=modelService.listDataSql(sql2, new Object[] {dataAuth,pmModelCode,pmAreaSn,pmProcessFace});
              }
            	
            }else{
            	for(int i=0;i<arrSeq.length;i++){
            		String seqValue = (String)seqNumber.get(i);
            		List listArr=modelService.listDataSql(sql1, new Object[] {dataAuth,pmModelCode,pmAreaSn,pmProcessFace,arrSeq[i],track});	
            		dataList.addAll(listArr);
            	}
            	
            }
        }else
        {
           if("".equals(dev_id)){
              if (StringUtils.isNotBlank(track))
              {
                    sql2+= " and T.CMO_TRACK=?";
                dataList=modelService.listDataSql(sql2, new Object[] {dataAuth,pmMoNumber,pmAreaSn,pmProcessFace,track});
              }else {
                dataList=modelService.listDataSql(sql2, new Object[] {dataAuth,pmMoNumber,pmAreaSn,pmProcessFace});
              }
            	
            }else{
            	for(int i=0;i<arrSeq.length;i++){
            		List listArr=modelService.listDataSql(sql1, new Object[] {dataAuth,pmMoNumber,pmAreaSn,pmProcessFace,track});	
            		dataList.addAll(listArr);
            	}
            	
            }
        }
        
        
        if(dataList == null || dataList.isEmpty()){
          modelAction.setAjaxList(ajaxList);
          return BaseActionSupport.AJAX;
        }else{
          CommMethod.listToEscapeJs(dataList);
          modelAction.setAjaxList(dataList);
          return BaseActionSupport.AJAX;
        }
    
  }

}
