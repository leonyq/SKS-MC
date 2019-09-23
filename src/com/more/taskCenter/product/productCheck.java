package com.more.taskCenter.product;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

public class productCheck implements ValidateFuncService {

    private final Log log = LogFactory.getLog(this.getClass());

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
    public OperResult valJavaFun(String formId, Map paraMap,
             ModelService modelService,ModelAction modelAction,Object... objs) {
        String proName =(String)paraMap.get("PROJECT_NAME");
        String dataid = modelAction.getDataId();
           
        String sql = "select * from T_PM_PROJECT where PROJECT_NAME=?";
        List subList = modelService.listDataSql(sql, new Object[] { proName });
        if (subList!=null&&subList.size() > 0) {
            if(!StringUtils.isEmpty(dataid)&&subList.size()==1){
               String id1=(String) ((Map)subList.get(0)).get("ID");
               if(!dataid.equals(id1)){
                   return new OperResult(false, "项目名称："+proName+"，已存在！");
               }
            }
            else{
                return new OperResult(false, "项目名称："+proName+"，已存在！");
            }
        } 
       return new OperResult(true);
    }     
}

