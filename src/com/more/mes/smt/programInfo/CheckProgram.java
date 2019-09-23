package com.more.mes.smt.programInfo;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

public class CheckProgram implements ValidateFuncService{

	/**
     * @param formId
     *            表单ID
     * @param paraMap
     *            数据对象
     * @param modelService
     *            modelService
     * @return
     */
	@Override
	public OperResult valJavaFun(String formId, Map paraMap, ModelService modelService,
			ModelAction modelAction, Object... objs) {
		String CPI_SN = (String)paraMap.get("CPI_SN");
		String CPI_MODEL_CODE = (String) paraMap.get("CPI_MODEL_CODE");
		String CPI_PRODUCT_STEP = (String) paraMap.get("CPI_PRODUCT_STEP");
		String CPI_PROCESS_FACE = (String) paraMap.get("CPI_PROCESS_FACE");
		String CPI_GROUP = (String) paraMap.get("CPI_GROUP");
		String CPI_DEFAULT_FLAG = (String) paraMap.get("CPI_DEFAULT_FLAG");
		String CPI_VERSION = (String) paraMap.get("CPI_VERSION");
		String dataAuth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		String dataid = modelAction.getDataId();
		//校验软体编号
		String sql = "select * from T_CO_PROGRAM_INFO where CPI_SN=? AND DATA_AUTH=? ";
        List subList = modelService.listDataSql(sql, new Object[] {CPI_SN,dataAuth});
        if (subList!=null&&subList.size() > 0) {
            if(subList.size()==1){
               String id1=(String) ((Map)subList.get(0)).get("ID");
               if(!dataid.equals(id1)){
                   return new OperResult(false, "软体编号已存在");
               }
            }
            else{
                return new OperResult(false, "软体编号已存在");
            }
        }
        //同个机种、生成阶别、面别、工序只允许存在一条默认标志为Y的数据
        sql = "select * from T_CO_PROGRAM_INFO where CPI_MODEL_CODE=? and CPI_PRODUCT_STEP=?  " +
        		"and CPI_PROCESS_FACE=? and CPI_GROUP=? and CPI_DEFAULT_FLAG=? and DATA_AUTH=? ";
        subList = modelService.listDataSql(sql, new Object[] { CPI_MODEL_CODE,CPI_PRODUCT_STEP,CPI_PROCESS_FACE,CPI_GROUP,CPI_DEFAULT_FLAG,dataAuth});
        if (subList!=null&&subList.size()>0) {
        	if(!StringUtils.isEmpty(dataid)&&subList.size()==1){
                String id1=(String) ((Map)subList.get(0)).get("ID");
	        	if(!dataid.equals(id1)&&CPI_DEFAULT_FLAG.equals("Y")){
	        		return new OperResult(false, "同个机种、生成阶别、面别、工序只允许存在一条默认标志为Y的数据");
	        	}
        	}
        	else{
        		if(CPI_DEFAULT_FLAG.equals("Y")){
	        		return new OperResult(false, "同个机种、生成阶别、面别、工序只允许存在一条默认标志为Y的数据");
	        	}
            }
        }
        //同个机种、生成阶别、面别、工序、版本只允许存在一条数据
        sql = "select * from T_CO_PROGRAM_INFO where CPI_MODEL_CODE=? and CPI_PRODUCT_STEP=? " +
        		"and CPI_PROCESS_FACE=? and CPI_GROUP=? and CPI_VERSION=?";
        subList = modelService.listDataSql(sql, new Object[] { CPI_MODEL_CODE,CPI_PRODUCT_STEP,CPI_PROCESS_FACE,CPI_GROUP,CPI_VERSION });
        if (subList!=null&&subList.size() > 0) {
        	if(!StringUtils.isEmpty(dataid)&&subList.size()>0){
                String id1= (String) ((Map)subList.get(0)).get("ID");
                String CPI_MODEL_CODE1 = (String) ((Map)subList.get(0)).get("CPI_MODEL_CODE");
                String CPI_PRODUCT_STEP1 = (String) ((Map)subList.get(0)).get("CPI_PRODUCT_STEP");
                String CPI_PROCESS_FACE1 = (String) ((Map)subList.get(0)).get("CPI_PROCESS_FACE");
                String CPI_GROUP1 = (String) ((Map)subList.get(0)).get("CPI_GROUP");
                String CPI_VERSION1 = (String) ((Map)subList.get(0)).get("CPI_VERSION");
	        	if(!dataid.equals(id1)&&CPI_MODEL_CODE1.equals(CPI_MODEL_CODE)&&CPI_PRODUCT_STEP1.equals(CPI_PRODUCT_STEP)
	        			&&CPI_PROCESS_FACE1.equals("CPI_PROCESS_FACE")&&CPI_GROUP1.equals("CPI_GROUP")&&CPI_VERSION1.equals("CPI_VERSION")){
	        		return new OperResult(false, "同个机种、生成阶别、面别、工序、版本只允许存在一条数据");
	        	}
        	}
        	else{
        		if(subList.size()>0){
        			String CPI_MODEL_CODE1 = (String) ((Map)subList.get(0)).get("CPI_MODEL_CODE");
                    String CPI_PRODUCT_STEP1 = (String) ((Map)subList.get(0)).get("CPI_PRODUCT_STEP");
                    String CPI_PROCESS_FACE1 = (String) ((Map)subList.get(0)).get("CPI_PROCESS_FACE");
                    String CPI_GROUP1 = (String) ((Map)subList.get(0)).get("CPI_GROUP");
                    String CPI_VERSION1 = (String) ((Map)subList.get(0)).get("CPI_VERSION");
    	        	if(CPI_MODEL_CODE1.equals(CPI_MODEL_CODE)&&CPI_PRODUCT_STEP1.equals(CPI_PRODUCT_STEP)
    	        			&&CPI_PROCESS_FACE1.equals(CPI_PROCESS_FACE)&&CPI_GROUP1.equals(CPI_GROUP)&&CPI_VERSION1.equals(CPI_VERSION)){
    	        		return new OperResult(false, "同个机种、生成阶别、面别、工序、版本只允许存在一条数据");
    	        	}
	        	}
            }
        }
        return new OperResult(true);
	}

}
