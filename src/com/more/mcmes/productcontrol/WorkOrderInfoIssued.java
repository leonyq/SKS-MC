package com.more.mcmes.productcontrol;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 工单信息-下达
 */
public class WorkOrderInfoIssued implements FuncService
{
    private final Log log = LogFactory.getLog(this.getClass());

    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService)
    {
        Map dataMap = new HashMap();
        List numList = new ArrayList();
        String dataId=modelAction.getDataId();
        String sql="SELECT T.PROJECT_ID, T.PRODUCT_COUNT, FQC_COUNT,T.PRODUCT_LINE,SCRAPPED_QTY  FROM T_PM_PROJECT_BASE T where t.id = ? ";
        String sqlNum = "select count(1) as count from sy_dict_val where dict_code = ? ";//生产阶别数
        Map numMap = modelService.queryForMap(sqlNum,new String[]{"PROJECT_STEP"}); 
        int count =0;
        if(null!=numMap && numMap.size()>0) {
        	 count = Integer.parseInt(numMap.get("count").toString());
        }
        
        dataMap=modelService.queryForMap(sql, new Object[] { dataId });
        String p = null;
        String f = null;
        String s  = null;
        if(null!=dataMap && dataMap.size()>0) {
        	  p = String.valueOf(dataMap.get("PRODUCT_COUNT"));
        	  f = String.valueOf(dataMap.get("FQC_COUNT"));
        	  s= String.valueOf(dataMap.get("SCRAPPED_QTY"));
        }
       
        if("".equals(p) || "null".equals(p)){
        	p = "0";
        }
        
        if("".equals(f) || "null".equals(f)){
        	f = "0";
        }
       
        if("".equals(s) || "null".equals(s)){
        	s = "0";
        }
        int productCount = Integer.parseInt(p);//工单计划
        int fqcCount = Integer.parseInt(f);//工单投入
        int scrapped_qty = Integer.parseInt(s);//工单报废
        sql="select PM_MO_NUMBER,pm_project_id,PM_TARGET_QTY,PM_STATUS,PM_PRODUCT_STEP from t_pm_mo_base a where a.pm_project_id = ? ";
        List<Map> dataList = modelService.listDataSql(sql, new Object[] { dataMap.get("PROJECT_ID") });//工单下的制令单
        //BigDecimal bigDecimal=new BigDecimal("0");
        int[] result = new int[count];
        int[] total = new int[count];
        boolean[] flag=new boolean[count];//是否存在未关结 
        for(int i =0;i<count;i++){
    		flag[i]=true;
    		result [i] = 0;
    	}
        if(dataList != null || !dataList.isEmpty()){
        	 for(int i=0;i<dataList.size();i++){
                 Map temap = dataList.get(i);
                 String pmStatue=(String)temap.get("PM_STATUS");
                 int step = Integer.parseInt(temap.get("PM_PRODUCT_STEP").toString());//生产阶别
                 //BigDecimal targetNum=(BigDecimal)temap.get("PM_TARGET_QTY");//数量
                 int numQty = Integer.parseInt(temap.get("PM_TARGET_QTY").toString());                 
                 for(int j=1;j<count+1;j++){
                 	if(j==step){//找到对应阶别
                    result[j-1] = result[j-1] + numQty;
                     if("4".equals(pmStatue) || "5".equals(pmStatue)){
                     flag[j-1] = false;
                     }
                    }
                 } 
             }
        	 for(int i=0;i<dataList.size();i++){
        		 Map temap = dataList.get(i);
        		 String pmStatue=(String)temap.get("PM_STATUS");
        		 int step = Integer.parseInt(temap.get("PM_PRODUCT_STEP").toString());//生产阶别
        		 for(int j=1;j<count+1;j++){
        			 if(j==step){//找到对应阶别
                          if(!"4".equals(pmStatue) && !"5".equals(pmStatue)){
                          flag[j-1] = true;
                          }
                         }
        		 }
        	 }
        	 
        }
       
        
        //BigDecimal  productCount=(BigDecimal)dataMap.get("PRODUCT_COUNT");//工单计划

        //BigDecimal fqcCount=(BigDecimal)dataMap.get("FQC_COUNT");//工单投入
        
        //BigDecimal scrapped_qty=(BigDecimal)dataMap.get("SCRAPPED_QTY");//工单报废
        
        //if(productCount==null) productCount=new BigDecimal("0");     
        //if(fqcCount==null) fqcCount=new BigDecimal("0");
        //if(scrapped_qty==null) scrapped_qty=new BigDecimal("0");
        
       
            for(int j=0;j<count;j++){
            if(flag[j]==true){
            	total[j] = productCount-result[j]+scrapped_qty;
            }else{
            	total[j] = productCount - fqcCount + scrapped_qty;
            }           	
            	numList.add(total[j]);
            }       	
            dataMap.put("PM_TARGET_QTY_1",total);      
            //dataMap.put("PM_TARGET_QTY", productCount - fqcCount + scrapped_qty);

       
        String no="01";
        String subPm = "";
        int MaxCount = 0;
        int nowCount = 0;
        Map<String,String> mapPm =  new HashMap<String, String>();
        if(dataList!=null && !dataList.isEmpty()){
        	for(int i=0;i<dataList.size();i++){
        		mapPm = dataList.get(i);
        		subPm = mapPm.get("PM_MO_NUMBER").replace(mapPm.get("pm_project_id"), "").substring(4).replace("0", "");//取流水号
        		nowCount = Integer.parseInt(subPm);
        		if(nowCount>MaxCount){
        			MaxCount = nowCount;
        		}
        	}
        	no = "0"+(MaxCount+1);
        }  
        
//        if(dataList==null||dataList.size()>0){
//            int k=dataList.size()+1;
//            if(k<10) no="0"+k;
//        }
        dataMap.put("PM_MO_NUMBER", dataMap.get("PROJECT_ID")+"-01-"+no);
        String nowDate = DateUtil.formatDate(DateUtil.getCurDate(), DateUtil.yyyyMMddHHmmss);
        dataMap.put("nowDate", nowDate);
        dataMap.put("userId", CommMethod.getSessionUser().getId());
        CommMethod.mapToEscapeJs(dataMap);
        //CommMethod.listToEscapeJs(numList);//numList int类型 不需要验证
        modelAction.setDataMap(dataMap);
        modelAction.setDataList(numList);
        return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面
        //return modelAction.ActionForward("/buss/msbg/productControl/workOrderIssued.jsp");
    }
}