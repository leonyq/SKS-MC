package com.more.mcmes.moorder;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.Smap;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;


/**
 * @Title 制令单上线，修改
 * @description 制令单上线，修改提交
 * @ClassName OnlineMoOrderInfoSave
 * @company morelean
 */
public class OnlineMoOrderInfoSave implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings({ "unchecked", "unused" })
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        // 获取数据
        HttpServletRequest request = modelAction.getRequest();
        String pmAutoFqc = request.getParameter("paraMapObj.PM_AUTO_FQC");
        String pmErrorScrap = request.getParameter("paraMapObj.PM_ERROR_SCRAP");
        String pmMoNumber = request.getParameter("paraMapObj.PM_MO_NUMBER");
        String pmProjectId = request.getParameter("paraMapObj.PM_PROJECT_ID");
        String pmModelCode = request.getParameter("paraMapObj.PM_MODEL_CODE");
        String pmAreaSn = request.getParameter("paraMapObj.PM_AREA_SN");
        String pmProcessFace = request.getParameter("paraMapObj.PM_PROCESS_FACE");
        String pmTargetQty = request.getParameter("paraMapObj.PM_TARGET_QTY");//计划数量
        String pmScheduleDate =request.getParameter("paraMapObj.PM_SCHEDULE_DATE");
        String pmDueDate =request.getParameter("paraMapObj.PM_DUE_DATE");
        String dataAuth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
        String pmStatus = "1";
		String formId = request.getParameter("formId");
    	if(StringUtils.isBlank(formId)){
      		formId = request.getParameter("formIds");
   		 }
    	String iframeId = request.getParameter("iframeId");
        if(pmScheduleDate!=null&&pmScheduleDate.compareTo(pmDueDate)>0){
            return modelAction.alertInfoAddPic(modelAction.getText("预计开工时间不能大于预计完工时间"),"1");
        }
        if("Y".equals(pmAutoFqc)){
            String fqcNum = request.getParameter("paraMapObj.PM_FQC_NUM");
            if(StringUtils.isBlank(fqcNum)||new BigDecimal(fqcNum).compareTo(new BigDecimal("0"))<=0){
                return modelAction.alertInfoAddPic(modelAction.getText("FQC自动送检，送检批量必须大于0"),"1");
            }
        }
        String dataId=modelAction.getDataId();
        String type=request.getParameter("type");
        String sql="SELECT T.PROJECT_ID, T.PRODUCT_COUNT, FQC_COUNT,T.PRODUCT_LINE,SCRAPPED_QTY  FROM T_PM_PROJECT_BASE T where t.PROJECT_ID = ? and t.data_auth=? ";
        Map dataMap=new HashMap();
        try
        {
            dataMap=modelService.queryForMap(sql, new Object[] { pmProjectId,dataAuth }); 
        }
        catch (Exception e)
        {
            return modelAction.alertInfoAddPic(modelAction.getText("未找到对应工单"),"1");
        }
        List<Map> dataList=new ArrayList<Map>();
        if("edit".equals(type)){
        	String pmSql="select ID,PM_STATUS from t_pm_mo_base a where a.PM_MO_NUMBER = ? and a.data_auth=? ";
        	List<Map> pmList = modelService.listDataSql(pmSql, new Object[]{pmMoNumber,dataAuth});
        	 Map pmMap = null ;
        	 if(null!=dataList && dataList.size()>0) {
        		  pmMap = pmList.get(0);
        		  pmStatus = (String)pmMap.get("PM_STATUS");
        	 }
        	
        	
        	
        }
//        if("online".equals(type)){//上线
//            sql="select 1 from t_pm_mo_base a where a.PM_AREA_SN = ? and PM_STATUS=2 ";
//            dataList = modelService.listDataSql(sql, new Object[] { PM_AREA_SN });
//            if(dataList!=null&&dataList.size()>0){
//                return modelAction.alertParentInfo(modelAction.getText("当前线别已存在上线制令单"));
//            }
//        }
//        
        
        sql="select ID,PM_TARGET_QTY,PM_STATUS from t_pm_mo_base a where a.pm_project_id = ? and a.PM_PROCESS_FACE = ? and a.data_auth=?  ";
        dataList = modelService.listDataSql(sql, new Object[] { pmProjectId,pmProcessFace,dataAuth });//工单对应的制令单
        BigDecimal bigDecimal=new BigDecimal("0");
        if(null!=dataList && dataList.size()>0) {
      
        for(int i=0;i<dataList.size();i++){
            Map temap = dataList.get(i);
            String id=(String)temap.get("ID");
            if(id.equals(dataId)) continue;
            BigDecimal targetNum=(BigDecimal)temap.get("PM_TARGET_QTY");
            bigDecimal=bigDecimal.add(targetNum);
        }
        }
        BigDecimal  productCount = null;
        BigDecimal fqcCount = null;
        BigDecimal scrappedQty = null;
        if(null!=dataMap && dataMap.size()>0) {
        	   productCount=(BigDecimal)dataMap.get("PRODUCT_COUNT");//工单计划
              fqcCount=(BigDecimal)dataMap.get("FQC_COUNT");//工单投入
              scrappedQty=(BigDecimal)dataMap.get("SCRAPPED_QTY");//工单报废
        }
       
        if(productCount==null) productCount=new BigDecimal("0");
        if(fqcCount==null) fqcCount=new BigDecimal("0");
        if(scrappedQty==null) scrappedQty=new BigDecimal("0");
      
        BigDecimal a =productCount.subtract(bigDecimal).add(scrappedQty);//最大计划量
        if(a.compareTo(new BigDecimal(pmTargetQty))<0){
            return modelAction.alertInfoAddPic((modelAction.getText("计划数量不能超过")+a),"1");
        }
        
//        if("online".equals(type)){
//            List<Smap<String, Object>> paramList=modelAction.getParamList();
//            //制令单料在线站表
//            if(paramList!=null){
//                for(int i=0;i<paramList.size();i++){
//                    Smap<String, Object> smap=paramList.get(i);
//                    TableDataMapExt detail = new TableDataMapExt();
//                    String  wtid = StringUtils.getUUID();
//                    detail.setTableName("T_CO_MATERIAL_ONLINE");
//                    CommMethod.addSysDefCol(smap, modelAction.getUser());
//                    Map colMap=detail.getColMap();
//                    colMap.putAll(smap);
//                    colMap.put("ID", wtid);
//                    colMap.put("CMO_MO_NUMBER", pmMoNumber);
//                    colMap.put("CMO_PROJECT_ID", pmProjectId);
//                    colMap.put("CMO_MODEL_CODE", PM_MODEL_CODE);
//                    colMap.put("CMO_AREA_SN", PM_AREA_SN);
//                    colMap.put("CMO_PROCESS_FACE", PM_PROCESS_FACE);
//                    colMap.put("CMO_LOAD_FLAG", "N");
//                    modelService.save(detail);
//                }            
//            }            
//            
//            //制令单上线日志
//            TableDataMapExt moOnline = new TableDataMapExt();
//            moOnline.setTableName("T_PM_MO_ONLINE");
//            Map colMap=moOnline.getColMap();
//            CommMethod.addSysDefCol(colMap, modelAction.getUser());
//            colMap.put("ID", StringUtils.getUUID());
//            colMap.put("PMO_NUMBER", pmMoNumber);
//            colMap.put("PMO_PROJECT_ID", pmProjectId);
//            colMap.put("PMO_TYPE", 1);//作业类型（1上线，2下线）
//            colMap.put("PMO_MODEL_CODE", PM_MODEL_CODE);
//            colMap.put("PMO_AREA_SN", PM_AREA_SN);
//            colMap.put("PMO_PROCESS_FACE", PM_PROCESS_FACE);
//            colMap.put("PMO_TIME", DateUtil.getCurDate());
//            colMap.put("PMO_EMP", CommMethod.getSessionUser().getId());
//            modelService.save(moOnline);
//        }    
                
        
        Smap smapTemp=modelAction.getParaMapObj();
        smapTemp.initParam();
        smapTemp.put("PM_STATUS", pmStatus);
        smapTemp.remove("tableName");
        smapTemp.remove("_FLAG");
        smapTemp.remove("PRODUCT_NAME");
        smapTemp.remove("PRODUCT_STANDARD");
        
        if(StringUtils.isBlank(pmAutoFqc)) pmAutoFqc="N";
        if(StringUtils.isBlank(pmErrorScrap)) pmErrorScrap="N";
        smapTemp.put("PM_AUTO_FQC", pmAutoFqc);
        smapTemp.put("PM_ERROR_SCRAP", pmErrorScrap);
        List<Object> sqlList = new ArrayList<Object>();
        sqlList.add(dataId);
        int cpntype = String.valueOf(smapTemp.get("PM_CONTROL_TYPE")).equals("")?null:Integer.valueOf(String.valueOf(smapTemp.get("PM_CONTROL_TYPE")));
        Date dueDate = smapTemp.get("PM_DUE_DATE").equals("")?null:DateUtil.parseDate(String.valueOf(smapTemp.get("PM_DUE_DATE")));
        Date issDate = smapTemp.get("PM_ISSUED_DATE").equals("")?null:DateUtil.parseDate(String.valueOf(smapTemp.get("PM_ISSUED_DATE")));
        int jigNum = String.valueOf(smapTemp.get("PM_JIGSAW_NUM")).equals("")?0:Integer.valueOf(String.valueOf(smapTemp.get("PM_JIGSAW_NUM")));
        int preMax = String.valueOf(smapTemp.get("PM_REPAIR_MAX")).equals("")?0:Integer.valueOf(String.valueOf(smapTemp.get("PM_REPAIR_MAX")));
        Date scDate = smapTemp.get("PM_SCHEDULE_DATE").equals("")?null:DateUtil.parseDate(String.valueOf(smapTemp.get("PM_SCHEDULE_DATE")));
        int tarqty = String.valueOf(smapTemp.get("PM_TARGET_QTY")).equals("")?0:Integer.valueOf(String.valueOf(smapTemp.get("PM_TARGET_QTY")));
        int unNum = String.valueOf(smapTemp.get("PM_UNIT_NUM")).equals("")?0:Integer.valueOf(String.valueOf(smapTemp.get("PM_UNIT_NUM")));
        TableDataMapExt moTable = new TableDataMapExt();
        moTable.setTableName("T_PM_MO_BASE");
        moTable.setSqlWhere(" and id=?");
        moTable.setSqlWhereArgs(sqlList);
        moTable.getColMap().put("PM_AREA_SN", smapTemp.get("PM_AREA_SN"));
        moTable.getColMap().put("PM_CONTROL_TYPE",cpntype);
        moTable.getColMap().put("PM_CUST_CODE", smapTemp.get("PM_CUST_CODE"));
        moTable.getColMap().put("PM_DUE_DATE",dueDate);
        moTable.getColMap().put("PM_END_GROUP", smapTemp.get("PM_END_GROUP"));
        moTable.getColMap().put("PM_ERROR_SCRAP", smapTemp.get("PM_ERROR_SCRAP"));
        moTable.getColMap().put("PM_ISSUED_DATE", issDate);
        moTable.getColMap().put("PM_JIGSAW_NUM",jigNum);
        moTable.getColMap().put("PM_MEMO", smapTemp.get("PM_MEMO"));
        moTable.getColMap().put("PM_MODEL_CODE", smapTemp.get("PM_MODEL_CODE"));
        moTable.getColMap().put("PM_MO_NUMBER", smapTemp.get("PM_MO_NUMBER"));//
        moTable.getColMap().put("PM_PCB_CODE", smapTemp.get("PM_PCB_CODE"));
        moTable.getColMap().put("PM_PROCESS_FACE", smapTemp.get("PM_PROCESS_FACE"));
        moTable.getColMap().put("PM_PRODUCT_STEP", smapTemp.get("PM_PRODUCT_STEP"));
        moTable.getColMap().put("PM_PROJECT_ID", smapTemp.get("PM_PROJECT_ID"));
        moTable.getColMap().put("PM_REPAIR_MAX",preMax);
        moTable.getColMap().put("PM_SCHEDULE_DATE", scDate);
        moTable.getColMap().put("PM_SN_RULE", smapTemp.get("PM_SN_RULE"));
        moTable.getColMap().put("PM_START_GROUP", smapTemp.get("PM_START_GROUP"));
        moTable.getColMap().put("PM_SUB_RULE", smapTemp.get("PM_SUB_RULE"));
        moTable.getColMap().put("PM_TARGET_QTY", tarqty);
        moTable.getColMap().put("PM_TECH_SN", smapTemp.get("PM_TECH_SN"));
        moTable.getColMap().put("PM_TRACK", smapTemp.get("PM_TRACK"));
        moTable.getColMap().put("PM_TRANSFER_RULE", smapTemp.get("PM_TRANSFER_RULE"));
        moTable.getColMap().put("PM_UNIT_NUM", unNum);
        //moTable.getColMap().put("PRODUCT_NAME", smapTemp.get("PRODUCT_NAME"));
        //moTable.getColMap().put("PRODUCT_STANDARD", smapTemp.get("PRODUCT_STANDARD"));
        modelService.edit(moTable);
      //  OperResult operResult=modelService.editComm(request, modelAction.getCurrUser(),smapTemp,
      //          modelAction);        
      //  if (operResult.isSuccess())
       // {
            if (StringUtils.isNotBlank(modelAction.getDefinedMsg())){
                return modelAction.reloadParent(modelAction.getDefinedMsg());
            }
            if("edit".equals(type)){
            	return modelAction.ajaxTablereloadParentFun(modelAction.getText("修改成功"),formId,iframeId); 
            }

            return modelAction.reloadParent(modelAction.getText("保存成功"));
      //  }
    //    else
    //    {
        //    return modelAction.alertParentInfo(operResult.getInfo());
       // }
    }

}
